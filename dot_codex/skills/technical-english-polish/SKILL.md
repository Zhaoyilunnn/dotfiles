---
name: technical-english-polish
description: Polish English software documentation for clear, natural, precise prose after its content and structure are established. Use for README files, guides, architecture explanations, and API reference introductions while preserving technical contracts and runnable examples.
---

# Technical English Polish

Edit for a reader who knows the field but has not read the source code or the
conversation that produced the document. Keep the document's purpose, technical
meaning, and intended audience. Work within the requested scope and existing
authorization; do not introduce an outline approval step for an authorized edit.

## Sentence and paragraph style

- Put the object and its action early: "The timer checks the queue on each rising
  edge." Prefer a concrete verb to "performs queue-head eligibility evaluation."
- Introduce a feature by what it does. Follow with the information needed to use
  or understand it. Save internal class and member names for the implementation
  discussion unless the page is already an API reference.
- Connect sentences in causal or operational order. State the condition, what
  changes, and the result. Avoid lists of related nouns that leave readers to
  infer the relationship.
- Give each paragraph one job. Split a paragraph that alternates between usage,
  implementation, limitations, and testing. Do not fragment every sentence into
  its own paragraph or bullet.
- Use ordinary, professional English. Remove slogans, praise, rhetorical
  questions, repeated assurances, and commentary about writing the document.
  Avoid "simply", "obviously", and "just" when they conceal a prerequisite.
- Prefer exact names over invented shorthand. Explain an unfamiliar term at its
  first relevant use, then use it consistently. Use a glossary for lookup rather
  than making the reader leave a paragraph to understand it.
- Use "you" for a user action and name the component for system behavior. Use
  present tense for current behavior. Reserve "must" for requirements, "may" for
  permission, and "can" for capability; preserve the intended strength of a rule.

## Match the page to its purpose

- **Tutorial:** Carry one example through to an observable result. Explain code
  beside the step that needs it. Avoid detours through every available option.
- **How-to:** State prerequisites, show the ordered steps, and identify success.
  Keep alternatives near the step where the reader must choose one.
- **Reference:** Use stable subject names and predictable sections. Make
  parameters, units, defaults, ownership, errors, and boundary behavior easy to
  find. Do not force a tutorial or a question-shaped title onto every API page.
- **Explanation:** Build from a concrete situation to the general rule. Explain
  why the mechanism is needed, how it works, and its consequences. Include a
  short timeline or example when it resolves an abstraction.

Use tables for comparisons and lookup, numbered lists for ordered actions, and
connected prose for reasoning. Headings should name the subject or task. Keep
diagrams and their captions specific to the relationship being explained.

## Preserve meaning

Before polishing, identify invariants: signatures, units, default values, timing
inequalities, sampling rules, ordering, failure behavior, and supported scope.
Never replace "strictly after" with "at", "accepted" with "completed", or
"last recorded value" with "current state" for smoother prose. Keep optional
behavior conditional and unsupported features explicit where they affect use.

Leave generated declarations, source-excerpt markers, code, command syntax, and
machine-consumed identifiers intact unless the task includes changing them.
Check headings and links when moving or renaming sections. An executable example
needs its inputs and prerequisites; a partial snippet should be identified as
such. Do not invent output to complete a narrative.

## Editing examples

Dense: "Immutable timing-profile ownership resides at platform setup."

Clear: "Platform setup creates the timing profile before simulation starts.
The profile fixes the clock periods and communication delays for the run."

Dense: "Old-state capacity governs admission eligibility."

Clear: "The TCU checks available space before removing any entries that fire on
this edge. Space freed on this edge becomes available on the next TCU edge."

Vague: "The module provides deterministic lifecycle handling."

Clear: "Reset clears pending requests. A reply from an earlier run is discarded."

Overstated: "The player shows the queue state."

Precise: "The player shows the occupancy recorded at the last admission event,
along with that event's timestamp."

## Review the result

Read the revised text continuously, not just as a diff. A reader should be able
to identify what the component does, follow the example, and locate the exact
rule without reconstructing missing steps. Compare the final text against the
original invariants and the available code or tests. Run the relevant document
checks; passing those checks does not establish readability or semantic fidelity.

These examples illustrate the register to aim for; adapt their sentence length
and level of detail to the document. Do not repeat stock openings across pages.
