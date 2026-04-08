# Vendor Source Registry (CPU/GPU/DSA)

Last reviewed: 2026-03-11  
Review basis: user-provided URL sets (NVIDIA/AMD/Intel-related + cloud accelerator pages + emerging DSA vendors)

## Acceptance criteria
- `A`: Official source, directly usable as primary data source for structured hardware fields.
- `B`: Official source but partial/gated/portal-style; usable as supporting source and should be paired with an `A` source.
- `C`: Not accepted as primary source (secondary media, non-specific domain, broken/incomplete input).

## Accepted Sources (`A` or `B`)
| Grade | Vendor | URL | Source Type | Coverage | Notes |
|---|---|---|---|---|---|
| A | NVIDIA | https://images.nvidia.com/aem-dam/en-zz/Solutions/data-center/nvidia-ampere-architecture-whitepaper.pdf | whitepaper | compute, memory, interconnect, architecture | Strong primary source for Ampere/GA100 era baseline. |
| B | NVIDIA | https://resources.nvidia.com/en-us-tensor-core/nvidia-tensor-core-gpu-architecture | architecture resource portal | architecture overview | Official, but resource site may be dynamic/gated; pair with product pages or PDFs. |
| A | NVIDIA | https://www.nvidia.com/en-us/data-center/h200/ | product page | compute, memory capacity/bandwidth, platform info | Good for SKU-level baseline and generation refresh. |
| B | NVIDIA | https://resources.nvidia.com/en-us-blackwell-architecture | architecture resource portal | architecture overview | Official, but may require JS/form flow; pair with direct datasheet/product pages. |
| A | AMD | https://www.amd.com/en/products/accelerators/instinct/mi300/mi300x.html | product page | compute, memory, bandwidth, platform positioning | Good primary source for MI300X baseline fields. |
| B | Google Cloud | https://cloud.google.com/tpu/docs | docs portal | TPU family docs/navigation | Official and stable, but portal-level; pull row values from linked SKU-specific pages. |
| A | AWS | https://aws.amazon.com/ec2/instance-types/trn2/ | cloud instance spec page | accelerator, memory/networking context, instance-level limits | Primary source for cloud-exposed Trainium generation capabilities. |
| A | Azure | https://learn.microsoft.com/en-us/azure/virtual-machines/sizes/gpu-accelerated/ndh100v5-series | cloud VM size spec page | GPU instance profile, memory/networking/limits | Canonicalized from user text entry for ND-H100-v5 series. |
| A | AWS | https://aws.amazon.com/ec2/instance-types/p5/ | cloud instance spec page | H100-based instance profile, memory/networking/limits | Primary source for AWS P5 instance-level characteristics. |
| B | NVIDIA | https://www.nvidia.com/en-us/data-center/hgx/ | platform page | platform-level interconnect/topology context | Useful for HGX platform context; verify exact SKU values via datasheet. |
| A | NVIDIA Networking | https://www.nvidia.com/en-us/networking/products/infiniband/quantum-x800/ | networking product page | fabric bandwidth/interconnect | Primary source for scale-out interconnect context. |
| B | Cerebras | https://www.cerebras.ai/whitepapers | whitepaper portal | architecture and system design context | Official and useful for architecture context; pair with SKU-level product/spec pages for structured fields. |
| A | Cerebras | https://www.cerebras.ai/system | product page | compute, memory, bandwidth, system I/O, form factor | Canonical CS-3 product page and entry point to official datasheet. |
| A | Cerebras | https://cdn.sanity.io/files/e4qjo92p/production/bb7d54ea017ccd98ca27c8375483204caf68890f.pdf | datasheet (PDF) | processor/system/rack specs | Includes CS-3 power, dimensions, I/O bandwidth; check sparse-vs-dense FLOPS footnote before normalization. |
| B | Groq | https://groq.com/papers | paper portal | architecture and performance methodology context | Official and useful for methodology context; pair with product/spec pages for SKU-level compute/bandwidth/capacity tables. |
| A | Groq | https://groq.com/groqcard-accelerator/ | product brief / spec page | card-level compute, memory bandwidth, interconnect, power | Contains structured GroqCard specifications and downloadable product brief. |
| A | Groq | https://groq.com/groqnode-server/ | product brief / spec page | node-level compute, memory, host/networking, power | Contains structured GroqNode specifications and downloadable product brief. |
| A | Groq | https://www.groq.com/wp-content/uploads/2024/01/GroqCard%E2%84%A2-Accelerator-Product-Brief-v1.6.pdf | datasheet (PDF) | card-level structured spec table | Direct product spec sheet; good for machine-readable extraction. |
| A | Groq | https://www.groq.com/wp-content/uploads/2022/10/GroqNode%E2%84%A2-Server-GN1-B8C-Product-Brief-v1.5.pdf | datasheet (PDF) | node-level structured spec table | Direct product spec sheet; includes compute, memory, networking, and power fields. |

## Not Accepted / Needs Fix (`C`)
| Input | Decision | Reason | Replacement or Action |
|---|---|---|---|
| https://www.servethehome.com/nvidia-hgx-h100-8-gpu-board-at-computex-2022/ | C | Secondary media article, not official primary source. | Keep only as background context; do not use as row-level source. |
| https://www.servethehome.com/nvidia-hgx-h100-8-gpu-board-at-computex-2022/ (duplicate) | C | Same as above and duplicate entry. | Deduplicate. |
| www.nextplatform.com / https://www.nextplatform.com/2023/11/13/coreweave-builds-a-16000-gpu-supercomputer-in-a-flash/ | C | Secondary industry press; useful for market context, not for canonical hardware specs. | Use vendor/cloud official pages for spec fields. |
| learn.microsoft.com | C | Domain-only input is too broad for extraction. | Use canonical page URL for target series. |
| ND-H100-v5 size series - Azure Virtual Machines | C | Title only, not a URL. | Replaced with canonical Azure docs URL above. |
| Information on and specifications of the ND-H100-v5-series sizes | C | Description only, not a URL. | Replaced with canonical Azure docs URL above. |
| aws.amazon.com | C | Domain-only input is too broad for extraction. | Use exact instance page URL (`p5`, `trn2`, etc.). |
| Amazon EC2 P5 实例 | C | Title only, not a URL. | Replaced with `https://aws.amazon.com/ec2/instance-types/p5/`. |

## Deduplication notes
- `https://www.amd.com/en/products/accelerators/instinct/mi300/mi300x.html` was submitted twice; keep one canonical record.
- `https://www.servethehome.com/nvidia-hgx-h100-8-gpu-board-at-computex-2022/` was submitted twice; both marked `C`.
