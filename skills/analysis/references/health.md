# Health data analysis

Information and pattern description only — no diagnosis, no treatment or medication changes. Encourage discussing results with a clinician.
**Emergency signs** (e.g. chest pain, trouble breathing, stroke symptoms such as face drooping/arm weakness/speech difficulty, severe bleeding, suicidal thoughts) → tell the user to contact emergency services now (112 in Türkiye and the EU, 911 in the US/Canada, local number elsewhere).

## Personal data (lab results, wearables, logs)
- Use the **reference ranges printed by the lab** (they vary by lab, method, age, sex); note units.
- Describe values relative to range and trend over time; single slightly-out-of-range values are common and need clinical context.
- Wearables: sleep, heart rate, HRV, steps — consumer devices have measurement error; look at trends over weeks, not single nights.
- Suggest questions to ask the clinician; never suggest starting/stopping medication.
- Privacy: health data is special-category personal data — analyse locally where possible, don't upload to third-party tools without explicit consent, don't store longer than needed.

## Health literature
Evidence hierarchy: systematic reviews/meta-analyses → randomized controlled trials → cohort/case-control → case reports/expert opinion.
Check: population studied (does it match the user?), sample size, absolute vs relative risk, effect size and confidence intervals, funding/conflicts, replication,
preprint vs peer-reviewed. Prefer guidelines from recognized bodies (WHO, national health authorities, specialty societies).

## Population and public health data
Sources: WHO, national health ministries and statistics offices, Eurostat, CDC/NIH (US). Watch: definitions and reporting changes, age standardization,
confounding, ecological fallacy (group data ≠ individual risk), small-number instability.

## For health products/platforms
Analytics on patient data need a legal basis, minimization, access control and (often) ethics/regulatory review; models affecting care are medical devices in many jurisdictions (see `ai-integration`, `guided-discovery` healthcare pack).
