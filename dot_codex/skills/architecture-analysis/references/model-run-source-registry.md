# Model Run Source Registry (Public Usage/Performance)

Last reviewed: 2026-03-11  
Purpose: maintain a query-friendly URL library for public model-run usage and performance evidence.

## Acceptance criteria
- `A`: directly usable for row-level extraction into `datasets/public-model-run-benchmark-source.csv`.
- `B`: useful portal or architecture context, but requires drilling down to SKU/task-specific pages before extraction.
- `C`: not suitable as a canonical source for row-level data.

## Query tags
Use tags to accelerate filtering:
- `throughput`
- `latency`
- `utilization`
- `power`
- `cost`
- `instance_spec`
- `model_specific`
- `training`
- `inference`

## Accepted sources (`A` or `B`)
| Grade | Org/Vendor | URL | Source Type | Typical Metrics | Query Tags | Notes |
|---|---|---|---|---|---|---|
| A | AWS | https://aws.amazon.com/ec2/instance-types/p5/ | cloud instance spec page | instance profile, GPU count, memory/networking, pricing context | instance_spec, inference, training, cost | Primary source for AWS H100-based deployment baselines. |
| A | AWS | https://aws.amazon.com/ec2/instance-types/trn2/ | cloud instance spec page | instance profile, accelerator topology, memory/networking, pricing context | instance_spec, training, cost | Primary source for Trainium generation cloud baselines. |
| A | Azure | https://learn.microsoft.com/en-us/azure/virtual-machines/sizes/gpu-accelerated/ndh100v5-series | cloud VM size spec page | instance profile, GPU memory, networking and limits | instance_spec, inference, training | Canonical page for ND H100 v5 series. |
| B | Google Cloud | https://cloud.google.com/tpu/docs | docs portal | TPU family navigation, model/runtime guidance | instance_spec, training, inference | Portal-level source; extract from linked SKU/task pages. |
| B | Artificial Analysis | https://artificialanalysis.ai/leaderboards/providers | third-party benchmark leaderboard | provider/model latency-throughput-cost comparisons | throughput, latency, cost, model_specific, inference | Useful comparative benchmark context, but not a primary vendor spec source; cross-validate key rows with official or first-party benchmark disclosures. |
| B | MLCommons | https://mlcommons.org/benchmarks/inference-datacenter/ | benchmark portal | audited benchmark suites, rules, and submission navigation | throughput, latency, model_specific, inference | Strong benchmark authority, but this URL is a portal page; extract row-level metrics from linked versioned result pages and submission entries. |
| A | NVIDIA | https://www.nvidia.com/en-us/data-center/h200/ | product page | architecture-level performance claims, memory and bandwidth | throughput, instance_spec, training, inference | Useful for vendor-side baseline claims; keep claim-vs-measurement distinction. |
| A | Cerebras | https://www.cerebras.ai/system | product page | system-level throughput and utilization claims, I/O context | throughput, utilization, training, inference | Pair with datasheet/PDF for stable numeric fields. |
| A | Cerebras | https://cdn.sanity.io/files/e4qjo92p/production/bb7d54ea017ccd98ca27c8375483204caf68890f.pdf | datasheet (PDF) | structured system specs and operational envelope | throughput, power, instance_spec | Prefer this for stable row-level extraction. |
| A | Groq | https://groq.com/groqcard-accelerator/ | product brief/spec page | card-level performance and power claims | throughput, latency, power, inference | Pair with product brief PDF for stable fields. |
| A | Groq | https://groq.com/groqnode-server/ | product brief/spec page | node-level performance, networking, power | throughput, latency, power, inference | Useful for node/server baseline rows. |
| A | Groq | https://www.groq.com/wp-content/uploads/2024/01/GroqCard%E2%84%A2-Accelerator-Product-Brief-v1.6.pdf | datasheet (PDF) | structured card-level specs | throughput, latency, power, instance_spec | Good for machine-readable extraction. |
| A | Groq | https://www.groq.com/wp-content/uploads/2022/10/GroqNode%E2%84%A2-Server-GN1-B8C-Product-Brief-v1.5.pdf | datasheet (PDF) | structured node-level specs | throughput, latency, power, instance_spec | Good for machine-readable extraction. |
| B | NVIDIA | https://resources.nvidia.com/en-us-tensor-core/nvidia-tensor-core-gpu-architecture | architecture resource portal | architectural context and claims | throughput, training, inference | May require dynamic navigation or forms; not always row-ready. |
| B | NVIDIA | https://resources.nvidia.com/en-us-blackwell-architecture | architecture resource portal | architecture and claim context | throughput, training, inference | Use as supporting context, pair with SKU-specific product pages. |
| B | Cerebras | https://www.cerebras.ai/whitepapers | whitepaper portal | methodology and system context | model_specific, training, inference | Supporting context; not always row-ready. |
| B | Groq | https://groq.com/papers | paper portal | methodology and benchmark setup context | model_specific, inference | Supporting context; extract numeric rows from product briefs when possible. |

## Not accepted / needs fix (`C`)
| Input | Decision | Reason | Replacement or Action |
|---|---|---|---|
| https://www.servethehome.com/nvidia-hgx-h100-8-gpu-board-at-computex-2022/ | C | Third-party media; not canonical for row-level metrics. | Keep as background only. |
| https://www.nextplatform.com/2023/11/13/coreweave-builds-a-16000-gpu-supercomputer-in-a-flash/ | C | Third-party media; not canonical for row-level metrics. | Use official vendor/cloud sources. |
| learn.microsoft.com (domain only) | C | Too broad; no extractable target page. | Use exact page URL for the target instance series. |
| aws.amazon.com (domain only) | C | Too broad; no extractable target page. | Use exact page URL for the target instance type. |

## Maintenance notes
- Prefer adding SKU-specific URLs over portal homepages.
- Keep both `publish_date` and `accessed_date` in extracted dataset rows.
- For claim-heavy pages, keep confidence at `Medium` unless cross-validated by a second `A` source.
