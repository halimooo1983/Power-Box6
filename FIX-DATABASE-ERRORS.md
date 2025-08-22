# 🚨 Fix Database Errors (2 minutes)

## Problem

Your website shows these errors because database tables don't exist:

- Error loading reviews data: [object Object]
- Error loading footer data: [object Object]
- Error loading offer pricing data: [object Object]
- Error for table [table_name]: [object Object]

## ✅ Solution

### Step 1: Copy the SQL Script

Copy the entire contents of `COMPLETE-FIX.sql` (in your project root)

### Step 2: Open Supabase Dashboard

1. Go to https://supabase.com/dashboard
2. Click on your project: `mylaafierzsaabrmhcml`
3. Click **"SQL Editor"** in the left sidebar
4. Click **"New Query"**

### Step 3: Run the Script

1. Paste the SQL script you copied
2. Click **"RUN"** button
3. You should see: `"SUCCESS: All 5 tables created with default data!"`

### Step 4: Refresh Your Website

Refresh your website - all errors will be gone!

## What This Fixes

- ✅ Creates 5 missing database tables
- ✅ Adds default content for each section
- ✅ Sets up proper permissions
- ✅ Enables real-time updates

## Expected Result

- ❌ No more "[object Object]" errors
- ✅ Website loads properly with content
- ✅ You can edit content in Supabase and see it update live
- ✅ The red error panel disappears

## If You Still See Errors

1. Make sure you ran the script in the correct Supabase project
2. Check the browser console for new error details
3. The error messages should now show actual details instead of "[object Object]"

## Need Help?

The website has a red panel in the top-right that provides:

- Copy SQL Script button
- Direct link to Supabase Dashboard
- Step-by-step instructions

**This is a one-time setup - once done, everything works perfectly!** 🎉
