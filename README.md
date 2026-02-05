# Blue Files Report Website

Website for the Blue Files Report by Chris Bounds.

## Quick Start - Cloudflare Pages Deployment

### 1. Create a GitHub Repository

1. Go to https://github.com/new
2. Name it `bluefiles-site` (or similar)
3. Keep it public or private (your choice)
4. Upload all files from this folder

### 2. Connect to Cloudflare Pages

1. Go to https://dash.cloudflare.com/
2. Click "Workers & Pages" in the sidebar
3. Click "Create application" → "Pages" → "Connect to Git"
4. Authorize GitHub access and select your repository
5. Configure build settings:
   - **Project name:** `bluefilesreport`
   - **Production branch:** `main`
   - **Build command:** (leave empty)
   - **Build output directory:** `/` (root)
6. Click "Save and Deploy"

### 3. Connect Your Domain

1. After deployment, go to your project's "Custom domains" tab
2. Click "Set up a custom domain"
3. Enter `bluefilesreport.com`
4. Follow the DNS instructions (add CNAME record)
5. Cloudflare will automatically provision SSL

### 4. Upload the PDF

For the 50MB PDF, use Cloudflare R2 (free tier):

1. In Cloudflare dashboard, go to "R2"
2. Create a bucket called `bluefiles-assets`
3. Upload `Blue_Files_Report.pdf`
4. Set the file to public
5. Update the download link in `index.html` with the R2 URL

Alternative: If the PDF is under 25MB, you can include it directly in the repository.

## File Structure

```
bluefiles-site/
├── index.html          # Landing page
├── read.html           # Chapter reader
├── about.html          # About the research
├── contact.html        # Contact page (placeholder)
├── chapters/           # Individual chapter content
│   ├── introduction.html
│   ├── file-01.html    # Blue File One (Vimanas)
│   ├── file-02.html    # Blue File Two (placeholder)
│   └── ...
├── css/                # (reserved for future styles)
├── js/                 # (reserved for future scripts)
└── images/             # (reserved for images)
```

## Adding Chapter Content

To convert more chapters from the PDF:

1. Extract the text content for each Blue File
2. Format as HTML using the pattern in `file-01.html`
3. Save to `chapters/file-XX.html`

The reader page (`read.html`) will automatically load the chapter content.

## Analytics

Cloudflare Pages includes free Web Analytics:

1. Go to your project in Cloudflare dashboard
2. Click "Analytics" tab
3. View visitors, page views, countries, referrers

For more detailed tracking, add a script like Plausible or Umami.

## Updating the Site

1. Make changes to files locally
2. Commit and push to GitHub
3. Cloudflare automatically rebuilds and deploys

## Domain: bluefilesreport.com

Make sure DNS is configured:
- CNAME record pointing to `bluefilesreport.pages.dev`
- Or use Cloudflare's nameservers for full integration

## Support

For questions about the website structure, contact the developer.
For questions about the research content, see the Contact page.
