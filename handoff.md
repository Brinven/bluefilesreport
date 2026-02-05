# Blue Files Report Website - Handoff Document

## Project Overview

Website for **Blue Files Report** by Chris Bounds — a 490-page book documenting 22 years of research into convergent UFO power and propulsion systems. The site provides both a downloadable PDF and an online chapter-by-chapter reading experience.

**Live Site:** https://bluefilesreport.com
**Repository:** https://github.com/Brinven/bluefilesreport
**Hosting:** Cloudflare Pages (auto-deploys from main branch)

---

## Current State

### What's Working
- Landing page (`index.html`) — declassified dossier aesthetic
- Chapter reader (`read.html`) — sidebar navigation, loads chapter HTML via JS fetch
- About page (`about.html`) — research methodology, patent mention
- Contact page (`contact.html`) — placeholder
- Chapter content in `chapters/` folder:
  - `introduction.html` — fully formatted
  - `file-01.html` — Blue File One (Vimanas) fully formatted
  - `file-02.html` through `file-24.html` and `conclusion.html` — placeholder text pointing to PDF

### What's Missing
- **Images** — extracted from PDF but not placed in chapters (221 images, 90MB from first 150 pages)
- **PDF viewer** — users currently must download PDF to see images/full formatting
- **Remaining PDF content** — only first 150 pages were processed; full book is 490 pages

---

## Immediate Task: Add PDF.js Viewer

Create an embedded PDF viewer page so users can read the full document with images inline, without downloading.

### Requirements
1. Create `view-pdf.html` with PDF.js embedded viewer
2. Host PDF.js from CDN (https://cdnjs.cloudflare.com/ajax/libs/pdf.js/)
3. The PDF file will be `Blue_Files_Report.pdf` in root (user will upload separately, ~50MB)
4. Add navigation option on landing page: "Read Online (Text)" vs "Read Online (PDF with Images)"
5. Mobile responsive

### PDF.js CDN Links
```
https://cdnjs.cloudflare.com/ajax/libs/pdf.js/4.0.379/pdf.min.mjs
https://cdnjs.cloudflare.com/ajax/libs/pdf.js/4.0.379/pdf.worker.min.mjs
```

---

## Site Structure

```
bluefilesreport/
├── index.html              # Landing page
├── read.html               # Chapter-based text reader
├── view-pdf.html           # [TO CREATE] PDF.js embedded viewer
├── about.html              # About the research
├── contact.html            # Contact placeholder
├── Blue_Files_Report.pdf   # [USER UPLOADS] Full 490-page PDF (~50MB)
├── chapters/
│   ├── introduction.html
│   ├── file-01.html        # Vimanas (complete)
│   ├── file-02.html        # Placeholder
│   ├── ...
│   ├── file-24.html        # Placeholder
│   └── conclusion.html     # Placeholder
└── images/                 # [FUTURE] Extracted images for chapters
```

---

## Design System

### CSS Variables (used across all pages)
```css
:root {
  --paper: #eef2f7;
  --ink: #1f2a44;
  --muted: #6e7d99;
  --stamp: #c23b2a;
  --accent: #2b6cb0;
  --grid: rgba(20,60,120,.06);
}
```

### Aesthetic
- "Declassified dossier" theme
- Blue-gray color scheme
- Folder with binder clip, 3-hole punch margin
- Typewriter font for labels (`Courier New`)
- Serif font for body text (`Georgia`)

---

## Background Context

### The Research
Chris Bounds spent 22 years investigating UFO technical data from various sources. His key methodology: **literal interpretation** — reading technical descriptions exactly as written rather than mapping to existing physics frameworks.

### The Patent Connection
Bounds has filed a provisional patent for a **Large-Format Polycrystalline Silicon Carbide Gammavoltaic Transistor with Heavy-Metal Lattice Doping** — translating fragmented UFO technical descriptions (particularly from the 1980s "UFO Contact from Reticulum" books) into modern materials science specifications.

### Key Concept: Convergence
The book demonstrates how independent sources, separated by decades and geography, describe nearly identical propulsion/power systems using different terminology. When read literally and assembled, they form coherent technical specifications.

---

## Technical Notes

### Cloudflare Pages Deployment
- Auto-deploys on push to `main` branch
- No build step required (static HTML)
- Custom domain configured: bluefilesreport.com

### Large PDF Hosting
The full PDF is ~50MB. Options:
1. Include in repo if under Cloudflare's 25MB file limit (may need compression)
2. Host on Cloudflare R2 and link to it
3. Split into smaller section PDFs

### Chapter Content Loading
`read.html` uses JavaScript `fetch()` to load chapter HTML files dynamically. The sidebar navigation updates URL hash for bookmarkability.

---

## Owner Information

- **Author:** Chris Bounds (Houston, TX)
- **Site Developer:** Michael (Anotos) — friend since 7th grade, class of 1986
- **Domain:** bluefilesreport.com (registered via GoDaddy, DNS on Cloudflare)

---

## Next Steps After PDF Viewer

1. Upload full PDF to repo (or R2 if too large)
2. Optionally convert remaining chapters (files 2-24, conclusion) to HTML from PDF text
3. Optionally place extracted images in chapter HTML files
4. Update contact page with Chris's preferred contact method
5. Add analytics tracking if desired (Cloudflare has built-in)

---

## Commands Reference

```bash
# Clone the repo
git clone https://github.com/Brinven/bluefilesreport.git
cd bluefilesreport

# After making changes
git add .
git commit -m "Description of changes"
git push origin main
# Cloudflare auto-deploys within ~1 minute
```
