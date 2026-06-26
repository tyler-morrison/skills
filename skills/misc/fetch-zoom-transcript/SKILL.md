---
name: fetch-zoom-transcript
description: Fetch the AI-generated transcript for a Zoom meeting or doc. Use when the user shares a Zoom link (zoom.us/doc/…, zoom.us/j/…) or meeting number and asks for the transcript, recording notes, or meeting content.
arguments: [url]
argument-hint: Zoom doc or meeting URL (e.g. https://docs.zoom.us/doc/RjSr4tfISy2H4AtxKu01ig)
---

# Fetch Zoom Transcript

The transcript never lives where the URL points or where the flags say it does. There is one real door — `get_meeting_assets` → `my_notes.transcript`. Everything else is a **decoy**: the doc body comes back blank, and `has_transcript` reads `false` on meetings that have a full transcript. Route every fetch through the one door and trust nothing else.

## Process

### 1. Identify what the URL points at

Analyze the `$url` provided — or the Zoom URL already in the conversation — and classify the link:

- **Doc URL** (`zoom.us/doc/{id}`, host `docs.` or `hub.`): the segment after `/doc/` is the doc ID. Drop the query string (`?from=…&skipCheck=…`). → continue to step 2.
- **Meeting URL** (`zoom.us/j/{number}`, `/launch/edl?muid=…`) or a bare meeting number / UUID: you already hold a meeting handle. → skip to step 4.

Completion: you hold either a doc ID or a meeting handle (number or UUID).

### 2. Turn the doc ID into a searchable timestamp

Call `get_file_content(fileId=<docID>)`.

`file_content` will be blank — this is the decoy. The field you need is `file_name`, which encodes the meeting's local date, time, and UTC offset, e.g. `Zoom Meeting 2026-06-22 16:20(GMT-4:00)`.

Completion: you have a date, local time, and offset parsed from `file_name`.

### 3. Resolve the meeting

Convert the title's local time to UTC using its stated offset (16:20 at GMT-4 → 20:20 UTC), then `search_meetings` over a tight window around it (±2h absorbs skew between the doc title and the real start). Match the meeting whose `meeting_start_time` sits closest to the title time.

**Ignore `has_transcript` and `has_transcript_permission` entirely** — both are decoys. The assets call is the only authority.

Completion: you hold a `meeting_uuid` and participant list from the matched meeting's attendee metadata.

### 4. Open the one real door

Call `get_meeting_assets(meetingId=<uuid-or-number>)`. The transcript lives at:

```
my_notes.transcript.transcript_items[]   // each item: { text, start, end }
```

If you arrived from a doc URL, confirm `my_notes.file_id` equals the doc ID from step 1. A mismatch means step 3 locked onto the wrong meeting — widen the window, re-match, and do **not** return that transcript.

Completion: `transcript_items` is non-empty **and** (for doc URLs) `my_notes.file_id` matches the doc ID.

### 5. Fallback — only if the door was empty

If `my_notes.transcript` is absent or empty *and* `recording_files` is non-empty in the assets response, call `get_recording_resource(meetingId=…, types="transcript")` and read `transcripts[].timeline[]`. If there is no recording either, report that no transcript exists for this meeting — do not infer or reconstruct one.

Completion: you hold transcript data from `timeline[]`, or have confirmed no transcript exists.

### 6. Confirm

The transcript is in context from step 4 or 5. Confirm to the user with a single sentence — do not echo or summarize content:

- **Doc URL path** (steps 2–3 completed): "I have the full transcript from your [DATE] meeting with [PARTICIPANTS]. How should we proceed?"
- **Meeting URL path** (jumped to step 4): "I have the full transcript from your [DATE] meeting. How should we proceed?"

Where **DATE** is a readable date (e.g. "June 22") from `file_name` (step 2) or `meeting_start_time` (step 3), and **PARTICIPANTS** are the attendee names from the matched meeting's metadata (step 3).

Completion: confirmation has been stated.
