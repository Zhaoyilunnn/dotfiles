---
name: architecture-analysis
description: Use this skill whenever the user asks to analyze, review, diagnose, or improve software architecture. Trigger for requests about service boundaries, system design trade-offs, reliability, scalability, security posture, data flow, migration plans, technical due diligence, architecture refactoring direction, or collecting CPU/GPU/DSA capability data (compute, bandwidth, capacity, interconnect) for architecture decisions, even if the user does not explicitly say "architecture analysis."
---

# Architecture Analysis

## Purpose
This skill produces a structured architecture assessment that converts system context into prioritized findings, concrete risks, and actionable recommendations.

## Skill modules
This skill is modular. Run only the parts requested by the user.

- Part 1: Hardware capability data collection (CPU, GPU, DSA)
- Part 1B: Public model-run usage and performance dataset collection
- Part 2+: Reserved for future extensions

## Use this skill when
- reviewing a system design, platform architecture, or subsystem boundaries
- diagnosing architecture-driven incidents, bottlenecks, or reliability issues
- planning migration paths such as monolith to modular monolith or microservices
- comparing options like sync vs async integration, event-driven vs request-response, or SQL vs NoSQL choices
- preparing technical recommendations, architecture decision support, or due diligence notes

## Do not use this skill when
- the task is a narrow code-style review of one file
- the task is single-kernel performance modeling that needs roofline formulas
- there is no system context and the user only wants generic architecture theory

## Part 1: Hardware capability data collection
Use this module when the user needs hardware baseline data before architecture recommendations.

### Goal
Create a cited, normalized comparison dataset for mainstream CPU, GPU, and DSA products that can support capacity planning, technology selection, and architecture trade-off analysis.

### Scope and vendor coverage
Unless the user narrows scope, cover mainstream options across:
- CPU: Intel, AMD, ARM ecosystem (for example AWS Graviton or Ampere)
- GPU: NVIDIA, AMD, Intel
- DSA: cloud and vendor accelerators relevant to the use case (for example TPU, Trainium, Inferentia, Gaudi, FPGA/DPU families)

### Source policy
Prefer primary sources in this order:
1. Official vendor product pages
2. Official architecture whitepapers
3. Official datasheets and specification sheets
4. Official cloud instance documentation for cloud-exposed SKUs

If primary data is unavailable, use high-quality secondary sources only as fallback and mark those rows with lower confidence.

### Reference-first baseline rule (mandatory)
When either condition is true:
- the user names specific hardware (for example H100, H200, MI300X, TPU, Trainium, Gaudi)
- the user asks for baseline comparison or hardware trade-off

You MUST do this first:
1. Resolve candidate URLs from `references/vendor-source-registry.md`.
2. If run-performance evidence is relevant, also resolve URLs from `references/model-run-source-registry.md`.
3. Extract available metrics from registry URLs before any broader web search.
4. Only search beyond registries for missing fields, then append newly validated URLs back into the registry.

### Required structured fields
Collect and normalize the following fields when available:
- vendor
- product family and SKU
- launch generation or release window
- workload focus (general compute, training, inference, networking, storage offload)
- peak compute by precision: FP64, FP32, TF32, FP16, BF16, INT8, INT4 (only the applicable subset)
- memory type (DDR/HBM/GDDR/SRAM/on-chip)
- memory capacity
- memory bandwidth
- interconnect and host I/O (for example PCIe generation and lanes, NVLink, CXL, UPI, Infinity Fabric)
- scale-out networking notes (for example InfiniBand or Ethernet capability if relevant)
- power envelope (TDP/TBP) if available
- source URL
- source publish date and accessed date
- confidence (`High`, `Medium`, `Low`)
- compute hierarchy fields: L1/L2 block names and counts, matrix/vector/scalar execution-unit counts
- memory hierarchy fields: structure count, channel count, rank/bank depth (when published), per-structure and aggregated capacity/bandwidth
- precision-specific quote-ready compute metrics in one unified data table: matrix/vector/scalar/special throughput
- memory-level quote-ready metrics in one unified data table: L1/L2/L3/DRAM-HBM capacity and bandwidth
- interconnect quote-ready metrics in one unified data table: on-package/off-package/host/scale-out bandwidth

### Normalization rules
- Use `TFLOPS` or `TOPS` with explicit precision labels.
- Mark whether values are dense or sparse when the source distinguishes them.
- Use `GB` for capacity and `GB/s` for bandwidth.
- Keep compute, bandwidth, and interconnect numbers from the same SKU variant.
- Do not mix peak theoretical values with measured benchmark values in one column.
- Keep missing values as `N/A` instead of guessing.
- Keep hierarchy and summary fields in the same unified data table using explicit columns.
- Ensure each unified data row includes source mapping via `Primary Source ID` and optional secondary source IDs.
- For memory summaries, always include `L1`, `L2`, and `DRAM/HBM`; use `N/A` when unavailable.
- Final Part 1 output format must contain exactly two sections: architecture hierarchy introduction and one unified data table.
- Data table headers must contain units for all numeric columns.
- Data table cells must contain data only; do not place narrative explanations in cells.

### Part 1 workflow
Follow this sequence:

1. Confirm data-collection scope
   - Clarify workload type, deployment model (on-prem or cloud), and target time horizon.
   - Confirm whether to include only currently purchasable products or also announced products.

2. Build candidate list
   - Start from `references/vendor-source-registry.md` when available.
   - If the request includes specific hardware names or baseline comparison, this registry-first lookup is mandatory.
   - For benchmark or utilization context, use `references/model-run-source-registry.md` before external search.
   - Add or update registry entries when new reliable sources are identified.
   - Start from mainstream vendors in each category.
   - Keep the list concise and representative unless the user requests exhaustive coverage.

3. Collect data with citations
   - Gather each metric from primary sources first.
   - Record URL, publish date (if available), and accessed date for each row.

4. Normalize and sanity-check
   - Convert units to a common schema.
   - Check internal consistency (for example capacity and bandwidth not coming from different SKUs).
   - Check hierarchy consistency (for example total unit counts match per-level multiplication).
   - Mark assumptions and uncertain fields.

5. Produce outputs
   - Fill `templates/hardware-baseline-template.md`.
   - Keep output as exactly one architecture hierarchy introduction plus one unified data table.
   - Fill the unified table with source-linked numeric rows and required hierarchy/summary fields.
   - If benchmark or utilization data exists, append normalized rows to `datasets/public-model-run-benchmark-source.csv`.

### Part 1 output contract
When the request is only for hardware data collection, output:
- exactly one `Architecture Hierarchy Introduction` section
- exactly one unified data table

Strict constraints:
- Do not output any extra section beyond the two sections above.
- Data table must contain at least:
  - precision-specific matrix/vector/scalar/special compute throughput
  - L1/L2/L3/DRAM-HBM capacity and bandwidth
  - memory stack/channel/rank/bank fields when available
  - on-package/off-package/host/scale-out interconnect bandwidth
  - component power and total power
- Headers must include units for numeric fields.
- Cells must be data-only (no prose explanations).
- Use `N/A` for missing fields.

Use `templates/hardware-baseline-template.md` as default.

## Part 1B: Public model-run benchmark dataset source
Use this module when the user asks for public evidence about hardware usage, model performance, latency, throughput, utilization, or cost.

### Dataset file
- `datasets/public-model-run-benchmark-source.csv`

### Source registry file
- `references/model-run-source-registry.md`

### Minimum row quality
Each row should include, when available:
- source attribution (`source_url`, `source_type`, publish/accessed date, confidence)
- hardware context (vendor, SKU, instance/server, accelerator count, interconnect)
- model context (model name/size, task, precision, quantization)
- load shape (`batch_size`, `input_tokens`, `output_tokens`, `context_length`)
- performance (`throughput_*`, `latency_*`)
- usage and efficiency (`accelerator_utilization_pct`, `memory_utilization_pct`, `power_w`, `energy_j_per_token`)
- economics (`cost_usd_per_hour`, `cost_usd_per_million_tokens`)

### Normalization rules for Part 1B
- Keep one row per unique `(hardware_sku, model_name, precision, batch_size, context_length, source_url)` observation.
- Never overwrite existing rows; add a new row when source data changes.
- Keep raw source metric units and map into normalized columns.
- Leave unavailable fields empty instead of inferring values.
- Mark `confidence` as `Low` when values come from non-primary sources.

### Workflow for Part 1B
1. Start source discovery from `references/model-run-source-registry.md`.
2. Prioritize `A` sources for row extraction, then use `B` as supporting context.
3. Add new URLs to the registry before writing new dataset rows.
4. Append normalized rows to `datasets/public-model-run-benchmark-source.csv`.
5. Keep claim-vs-measured distinctions explicit in `notes`.

## Minimum input checklist
Gather what is available:
- business objective and constraints (latency, budget, compliance, team size, delivery speed)
- current topology (components/services, data stores, queues, external dependencies)
- critical flows (write path, read path, async processing, integration boundaries)
- non-functional requirements (availability targets, SLO/SLA, RTO/RPO, security requirements)
- known pain points (incidents, slowdowns, ownership gaps, brittle integrations)

If key inputs are missing, continue with explicit assumptions and lower confidence.

## Analysis dimensions
Evaluate each dimension as `Strong`, `Adequate`, or `At Risk`, with evidence:
- boundaries and coupling
- data ownership and consistency model
- scalability and performance posture
- reliability and fault isolation
- security and compliance posture
- observability and operability
- changeability and team cognitive load
- cost efficiency

## Workflow
Follow this sequence:

1. Frame the objective
   - Restate the decision to be made and the business outcome.
   - Define analysis scope: whole system, subsystem, or migration slice.

2. Build the architecture snapshot
   - Map context, major components, data stores, and integration points.
   - Mark critical paths and failure domains.

3. Evaluate quality attributes
   - Assess each analysis dimension against stated constraints.
   - Tie conclusions to evidence, not preference.

4. Identify risks and likely root causes
   - List high-impact risks, bottlenecks, and design debt.
   - Explain trigger conditions and blast radius.

5. Generate options and trade-offs
   - Propose 2-3 realistic options when possible.
   - For each option, state benefits, costs, migration complexity, and key risks.
   - Include "do nothing" consequences as baseline.

6. Recommend a phased plan
   - Select a preferred direction with rationale.
   - Define immediate (0-30 days), near-term (1-3 months), and medium-term (3-12 months) actions.
   - Add checkpoints and metrics to validate progress.

7. Validate before finishing
   - Separate observed facts from assumptions.
   - Confirm recommendations fit current team and constraints.
   - Call out open questions that block high-confidence decisions.

## Output
Use `templates/output-template.md` as the default structure.

Output must include:
- executive summary
- architecture snapshot
- prioritized findings
- option comparison with trade-offs
- recommended roadmap
- risk register
- assumptions, confidence level, and open questions

If the user asks only for Part 1 data collection, prefer `templates/hardware-baseline-template.md` instead.
If the user asks for public run-performance evidence, also update `datasets/public-model-run-benchmark-source.csv`.

## Quality bar
Before finishing, verify:
- findings are prioritized by impact and backed by evidence
- recommendations align with constraints and delivery reality
- trade-offs are explicit
- roadmap has concrete actions and measurable outcomes
- unknowns are clearly separated from known facts

## References
Supporting assets:
- `templates/output-template.md`
- `templates/hardware-baseline-template.md`
- `references/vendor-source-registry.md`
- `references/model-run-source-registry.md`
- `datasets/public-model-run-benchmark-source.csv`
