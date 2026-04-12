---
name: paper-reading-four-questions
description: "Use when the user asks to read a paper, produce a paper note, summarize one paper at a time, or compare papers under four fixed questions: what problem it solves, why the problem matters, how it solves it, and why it is better than prior work. Especially useful for systems, architecture, accelerator, memory, chip, and LLM inference papers when the output should be concise, structured, and readable in Chinese."
---

# Paper Reading Four Questions

## Overview

This skill turns paper reading into a fixed, repeatable workflow. It is designed for cases where the user wants paper notes with stable structure across many papers so the notes remain easy to compare and retrieve later.

## Workflow

### 1. Acquire the paper source

Read the paper from the best available primary source first:
- Official PDF
- DOI page that links to the PDF
- Conference page with abstract and metadata
- User-provided note or bibliography document

If both a survey note and the original paper are available, use the survey note only for navigation and use the paper itself for technical claims.

### 2. Extract the core claim before writing

Identify these items first:
- Target scenario: cloud, edge, mobile, training, inference, low-batch, long-context, MoE, etc.
- Main bottleneck: bandwidth, capacity, compute utilization, scheduling, mapping, communication, KV cache, energy, thermal, cost
- Main method type: architecture, dataflow, scheduling, memory management, packaging, device/circuit, co-design
- Evaluation basis: baseline category, workloads, key reported gains

Do not start writing before the problem setting and claimed advantage are clear.

### 3. Write the note with four fixed questions

Always use these four section headers exactly unless the user asks to rename them:
- `What problem this paper is trying to solve?`
- `Why this is a problem?`
- `How they solve it?`
- `Why they are better than other state-of-the-art approaches?`

Default output language is Chinese when the surrounding conversation is Chinese.

For each section:
- Focus on mechanism, constraints, and comparisons
- Prefer short paragraphs or flat bullets
- Keep terms consistent after first definition
- Do not pad with generic background the target reader already knows

### 4. Keep the explanation paper-specific

Anchor the note in the paper’s actual novelty:
- What exact limitation of prior work is named
- What design variables the paper exposes
- What part is architecture versus runtime/dataflow
- What comparison the evaluation really supports

Avoid generic praise such as “more efficient” without saying what changed and relative to which baseline.

### 5. Add a structural clarification section only when needed

If the user asks a concrete topology or packaging question, append a short section such as `结构判断` or `封装判断`.

Use it to clarify points like:
- Whether the design is 2.5D, 3D, monolithic 3D, or die-to-die stacked
- Whether logic die and memory die are vertically bonded
- Whether channels are stacked vertically or arranged side by side
- Whether the work is a system architecture paper or a concrete device instance

Separate what the paper states directly from what is an inference from the figures or terminology.

### 6. Naming convention for notes

When creating persistent notes, use explicit and sortable names:
- Prefer `NN PaperName：paper-specific topic`
- Example: `01 H2-LLM：面向低 batch LLM 推理的 hybrid bonding 近存架构`

The title should make the paper identifiable even when viewed out of context in a long folder list.

## Output Standard

The note should satisfy all of the following:
- Written in Chinese unless the user asks otherwise
- Keeps the four English question headers unchanged
- Uses objective engineering language rather than promotional wording
- Distinguishes problem, motivation, method, and advantage
- States uncertainty when a claim is inferred rather than explicit
- Preserves key numbers only when they materially support comparison

## Anti-Patterns

Do not do the following:
- Do not turn the note into a broad survey of the field unless asked
- Do not restate the abstract with superficial paraphrasing
- Do not mix “why it matters” and “how it works” into one section
- Do not claim superiority beyond the paper’s actual baselines
- Do not infer packaging topology from the title alone when the paper text or figure says otherwise

## Quick Template

Use this minimal template when drafting:

```markdown
# NN PaperName：topic

## What problem this paper is trying to solve?

## Why this is a problem?

## How they solve it?

## Why they are better than other state-of-the-art approaches?
```
