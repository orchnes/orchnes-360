# Data pipelines & ML

## Layers (pipeline style)
| Layer | Contents |
|---|---|
| Ingestion | connectors, raw landing zone (immutable) |
| Validation | schema and quality checks at every boundary |
| Transformation | cleaning, joins, feature engineering — pure, deterministic functions |
| Storage | warehouse/lake tables, feature store, model registry |
| Training / Modeling | experiments, training jobs, evaluation |
| Serving | batch scoring or online inference API |
| Monitoring | data drift, model performance, pipeline SLAs |

Rules: raw data is never mutated; transformations are idempotent and re-runnable for a date/partition;
notebooks are for exploration — production logic lives in versioned modules;
version data, code, config and models together (reproducibility); same feature code for training and serving (avoid skew);
fixed random seeds and recorded environments; evaluate on a held-out set that never leaks into training.
Watch: data leakage, silent schema changes upstream, PII handling and retention, class imbalance,
cost of reprocessing, late-arriving data, timezone bugs.

## Typical tests
Unit tests for transforms with small fixtures; data contract/quality tests in the pipeline;
model evaluation gates (metric thresholds) before promotion; shadow/canary deployment for models.
