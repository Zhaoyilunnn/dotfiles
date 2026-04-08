# Architecture Analysis Report

## Executive Summary
- System or scope: <system/subsystem name>
- Primary objective: <what decision this analysis supports>
- Overall assessment: <Strong | Adequate | At Risk>
- Key recommendation: <1-2 sentence recommendation>

## Context And Constraints
| Item | Detail |
|---|---|
| Business goals | <growth, reliability, speed, cost, etc.> |
| Traffic and scale | <QPS, data volume, peak profile> |
| Availability targets | <SLO/SLA, RTO/RPO> |
| Compliance and security constraints | <PII, audit, regulatory constraints> |
| Budget constraints | <cost limits or optimization target> |
| Team constraints | <team size, ownership, delivery bandwidth> |

## Architecture Snapshot
- Components and services: <major modules and boundaries>
- Data stores and ownership: <primary stores and data responsibility>
- External dependencies: <third-party systems, upstream/downstream>
- Critical synchronous path: <main request path>
- Critical asynchronous path: <event/queue/batch flow>
- Main failure domains: <where failures can propagate>

## Findings (Prioritized)
| Priority | Dimension | Finding | Evidence | Impact |
|---|---|---|---|---|
| P0/P1/P2 | <coupling, reliability, scalability, etc.> | <what is wrong or fragile> | <facts/signals> | <business or technical impact> |

## Risk Register
| Risk | Trigger | Likelihood | Severity | Mitigation |
|---|---|---|---|---|
| <risk description> | <what causes it> | <Low/Medium/High> | <Low/Medium/High> | <specific mitigation> |

## Option Comparison
### Option A: <name>
- Summary: <what changes>
- Benefits: <top benefits>
- Costs and complexity: <engineering effort, migration needs>
- Risks: <main downsides>

### Option B: <name>
- Summary: <what changes>
- Benefits: <top benefits>
- Costs and complexity: <engineering effort, migration needs>
- Risks: <main downsides>

## Recommended Roadmap
1. Immediate (0-30 days): <stabilization and high-risk reductions>
2. Near-term (1-3 months): <structural improvements>
3. Medium-term (3-12 months): <strategic architecture changes>

## Validation Metrics
- Reliability: <incident rate, MTTR, SLO attainment>
- Performance: <latency, throughput, saturation profile>
- Delivery velocity: <lead time, change failure rate>
- Cost efficiency: <unit economics, infra spend trend>
- Security posture: <vulnerability and compliance indicators>

## Assumptions, Confidence, Open Questions
- Assumptions: <explicit assumptions used in analysis>
- Confidence: <High | Medium | Low>
- Open questions: <unknowns blocking stronger recommendation>
