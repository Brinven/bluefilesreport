# Force PDF Download - R2 Configuration Guide

The JavaScript approach doesn't work due to browser CORS restrictions. The best solution is to configure R2 to send a `Content-Disposition: attachment` header for downloads.

## Option 1: R2 Custom Metadata (Recommended - Easiest)

Unfortunately, R2 doesn't support setting `Content-Disposition` headers directly on files through the dashboard. We need to use a Cloudflare Worker.

## Option 2: Cloudflare Worker (Best Solution)

Create a simple Worker that adds the download header:

### Step 1: Create a Worker

1. Go to Cloudflare Dashboard → **Workers & Pages**
2. Click **Create application** → **Create Worker**
3. Name it: `pdf-download`
4. Click **Deploy**

### Step 2: Edit Worker Code

1. Click **Edit code**
2. Replace all code with:

```javascript
export default {
  async fetch(request, env) {
    const url = new URL(request.url);
    
    // Proxy to R2
    const r2Url = 'https://files.bluefilesreport.com/Blue_Files_Report.pdf';
    const response = await fetch(r2Url);
    
    // Clone response and add download header
    const newResponse = new Response(response.body, response);
    newResponse.headers.set('Content-Disposition', 'attachment; filename="Blue_Files_Report.pdf"');
    
    return newResponse;
  }
};
```

3. Click **Save and Deploy**

### Step 3: Add Custom Domain (Optional)

1. Go to **Settings** → **Triggers** → **Custom Domains**
2. Add: `download.bluefilesreport.com`
3. Or use the workers.dev URL: `pdf-download.YOUR_SUBDOMAIN.workers.dev`

### Step 4: Update Website

Update the download button in `index.html` to use the Worker URL instead of the direct R2 URL.

---

## Option 3: Simple Workaround (Quick Fix)

Since the current setup is causing confusion, we can:

1. **Remove the "Download PDF" button entirely** - users can download from the PDF viewer
2. **Change button text** to clarify behavior: "Open PDF in Browser" instead of "Download PDF"
3. **Add instructions** near the button explaining how to download

Which option would you prefer? I can implement Option 3 right now as a quick fix, or help you set up the Worker (Option 2) for a proper solution.
