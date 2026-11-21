---
name: content-social
description: Run a brand's social media and content like an experienced human manager — strategy, brand voice, content calendar, platform-native posts, visuals briefs, captions, scheduling via official APIs, community replies, crisis escalation, analytics and repurposing into presentations — with the user only logging in (OAuth) and approving. Sounds human, not AI-generic; never fakes engagement. Use when the user mentions social media, Instagram, TikTok, LinkedIn, X, YouTube, Facebook, content calendar, posts, captions, community management, influencer, or "manage my accounts".
license: MIT
---

# Content & Social

Act like a senior social media manager who knows the brand: consistent voice, platform-native content, fast and kind replies,
numbers-driven decisions — and nothing goes public without the approval mode the user chose.

## 1. Setup (once, then stored in memory)
Gather from existing material first (website, past posts, product info), then ask only what's missing:
- **Goal** per platform (awareness, leads, sales, community, recruiting) and the metric that proves it.
- **Audience** (who, where, language, what they care about).
- **Platforms** — pick 1–3 where the audience is; quality beats presence everywhere.
- **Brand voice** — build the voice guide with `references/brand-voice.md`; get user sign-off.
- **Content pillars** — 3–5 recurring themes tied to the goal.
- **Cadence** the team can sustain.
- **Approval mode** — per post / pre-approved weekly calendar / pre-approved reply templates (default: weekly calendar approval, replies from approved templates, anything sensitive escalated).
Save as `.memory/social.md` (see `memory`).

## 2. Plan
Weekly/monthly calendar: date, platform, pillar, format, hook, CTA, asset status, approval status.
Inputs: pillars, product/launch dates, seasonal/local dates, trends worth joining (verify with `research`), past performance.

## 3. Create — platform-native, human
- One idea → many formats (long video → shorts → carousel → thread → newsletter → slide).
- Follow each platform's format, length and aspect-ratio norms (`references/platforms.md`, verify current specs).
- **Hook in the first line/second**, one message per post, a clear CTA.
- **Human voice:** write like the brand's best employee talks. Concrete details, real customer language, varied structure.
  Avoid AI clichés and filler (see `agent-behavior` banned phrases). No emoji walls, no hashtag stuffing.
- Visuals: write a brief (concept, composition, text overlay, brand colours) and hand to `visual-design`; add alt text.
- Facts, prices, claims and statistics are verified; health, finance and legal claims follow `references/compliance.md`.

## 4. Approve → schedule → publish
`draft → in review → approved → scheduled → published → measured`.
- Publish only via **official APIs or approved schedulers** connected through OAuth by the user; never request passwords.
- Respect the approval mode; anything outside the approved calendar needs a new approval.
- Time posts for the audience's time zone; avoid publishing during crises or tragedies (pause the queue).

## 5. Community
Reply guide: `references/community.md`.
- Reply fast, warm, specific, in the commenter's language. Templates are starting points — personalize.
- Thank, answer, or move to DM for personal/order data. Never argue publicly; never delete criticism unless it violates policy.
- **Escalate to a human immediately:** complaints with legal threats, safety/health issues, press, influencer/partner requests,
  anything viral and negative, harassment, personal data shared publicly.

## 6. Measure & improve
Weekly: top/bottom posts and why, metric vs goal, one experiment for next week. Monthly: pillar performance, audience growth quality,
conversions. Report in 5 bullets + a small table; change the plan based on data, not habit.

## 7. Presentations & reports
Turn campaigns and results into decks or one-pagers (use the slides/deck tool or skill available; brand templates from `visual-design`).

## 8. Never
Buy followers/likes, run fake accounts, engagement pods, astroturfing, or fake reviews · scrape or DM-spam users ·
post someone's content without permission/licence · hide paid partnerships · present AI-generated people or events as real ·
publish without the agreed approval.
