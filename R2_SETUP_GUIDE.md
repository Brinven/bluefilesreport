# Cloudflare R2 Setup Guide for Blue Files Report PDF

## Step 1: Access Cloudflare R2

1. Log in to your Cloudflare Dashboard: <https://dash.cloudflare.com/>
2. In the left sidebar, click **R2 Object Storage**
3. If this is your first time, you may need to enable R2 (it's free for the first 10GB storage)

---

## Step 2: Create a Bucket

1. Click the **Create bucket** button
2. Enter bucket name: `bluefiles-assets`
3. Leave location as **Automatic** (recommended)
4. Click **Create bucket**

---

## Step 3: Upload Your PDF

1. Click on the `bluefiles-assets` bucket to open it
2. Click the **Upload** button
3. Select your `Blue_Files_Report.pdf` file (~50MB)
4. Wait for the upload to complete (may take a minute or two)
5. You should see the file listed in your bucket

---

## Step 4: Make the PDF Publicly Accessible

You have two options for public access:

### Option A: R2.dev Domain (Easiest - Recommended)

1. In your bucket, click the **Settings** tab
2. Scroll down to **Public access**
3. Under **R2.dev subdomain**, click **Allow Access**
4. Copy the URL that appears - it will look like:

   ```
   https://pub-xxxxxxxxxxxxx.r2.dev
   ```

5. Your PDF URL will be:

   ```
   https://pub-xxxxxxxxxxxxx.r2.dev/Blue_Files_Report.pdf
   ```

### Option B: Custom Domain (Advanced)

1. In bucket **Settings** → **Public access**
2. Click **Connect domain**
3. Enter a subdomain like: `files.bluefilesreport.com`
4. Follow the DNS setup instructions
5. Your PDF URL will be:

   ```
   https://files.bluefilesreport.com/Blue_Files_Report.pdf
   ```

---

## Step 5: Test the URL

1. Copy your PDF URL from Step 4
2. Paste it in a new browser tab
3. The PDF should download or display
4. **Share this URL with me** so I can update the site

---

## Step 6: Update the Website (I'll do this)

Once you provide the R2 URL, I will:

1. Update `view-pdf.html` with your PDF URL
2. Commit and push the changes to GitHub
3. Cloudflare Pages will auto-deploy within ~1 minute

---

## Troubleshooting

**PDF won't load?**

- Make sure public access is enabled (Step 4)
- Check the URL is correct (should end with `/Blue_Files_Report.pdf`)
- Try accessing the URL directly in a browser

**Upload failed?**

- Check your internet connection
- Try uploading again
- File size limit for R2 is 5GB, so 50MB should be fine

---

## Cost

Cloudflare R2 Free Tier includes:

- 10 GB storage per month (your PDF is 0.05 GB)
- 1 million Class A operations per month
- 10 million Class B operations per month

**Your usage will be well within the free tier.**
