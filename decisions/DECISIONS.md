# DECISIONS

> Record significant architecture and technical decisions.

## Template

```markdown
## YYYY-MM-DD: [Decision Title]

### Status
Accepted | Proposed | Deprecated | Superseded by [link]

### Context
Why was this decision needed?

### Options
- Option A: pros / cons
- Option B: pros / cons

### Decision
Chose Option X because ...

### Consequences
Positive:
- ...

Negative / Caveats:
- ...
```

---

<!-- Actual records below -->

## 2026-07-06: CLAUDE.md repo restructuring

### Status
Accepted

### Context
The repo originally had Chinese-first content with personal branding. Switched to English-first with Chinese as a language toggle (`zh/` directory) and removed personal names from content.

### Options
- A: Keep Chinese-first, English as toggle
- B: English-first, Chinese in `zh/` directory
- C: Monolingual English only

### Decision
Chose Option B because the user wants to share this publicly with a broader audience, while retaining Chinese for personal use and Taiwanese developer community.

### Consequences
Positive:
- Accessible to international users
- Clean separation of languages
- Setup script supports `--lang zh` flag

Negative:
- Two copies to maintain when updating content
