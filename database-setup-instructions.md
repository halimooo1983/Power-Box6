# Database Setup Instructions

## Current Issue

The frontend is experiencing database loading errors because the Supabase tables haven't been created yet. The errors you're seeing:

- `Error loading offer pricing data: [object Object]`
- `Error loading footer data: [object Object]`
- `Error loading reviews data: [object Object]`
- `Error loading product gallery data: [object Object]`
- `Error loading trust data: [object Object]`

These are happening because the application is trying to fetch data from database tables that don't exist yet.

## Solution Steps

### 1. Run the Database Setup Script

1. Open your **Supabase Dashboard**
2. Go to the **SQL Editor**
3. Copy and paste the contents of `create-supabase-tables.sql` (in your project root)
4. Click **RUN** to execute the script

### 2. Verify Tables Were Created

After running the SQL script, check that these tables exist:

- `hero_section`
- `customer_reviews`
- `footer`
- `offer_pricing`
- `product_gallery`
- `trust_section`
- `why_choose_section`
- `product_popup`
- `exit_intent_popup`
- `seo_settings`

### 3. Check the Frontend

Once the tables are created:

1. The errors should disappear
2. The website should load with default content
3. You can now edit content directly in Supabase and see it update in real-time

## Quick SQL Script (Essential Tables Only)

If you want to create just the essential tables to fix the current errors:

```sql
-- Essential tables to fix current errors
CREATE TABLE IF NOT EXISTS hero_section (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    content JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS customer_reviews (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    content JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS footer (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    content JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS offer_pricing (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    content JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS product_gallery (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    content JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS trust_section (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    content JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable public read access
ALTER TABLE hero_section ENABLE ROW LEVEL SECURITY;
ALTER TABLE customer_reviews ENABLE ROW LEVEL SECURITY;
ALTER TABLE footer ENABLE ROW LEVEL SECURITY;
ALTER TABLE offer_pricing ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_gallery ENABLE ROW LEVEL SECURITY;
ALTER TABLE trust_section ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public read" ON hero_section FOR SELECT USING (true);
CREATE POLICY "Allow public read" ON customer_reviews FOR SELECT USING (true);
CREATE POLICY "Allow public read" ON footer FOR SELECT USING (true);
CREATE POLICY "Allow public read" ON offer_pricing FOR SELECT USING (true);
CREATE POLICY "Allow public read" ON product_gallery FOR SELECT USING (true);
CREATE POLICY "Allow public read" ON trust_section FOR SELECT USING (true);
```

## Debugging Components Added

I've added two debugging components to help you:

1. **DatabaseSetupChecker** - Shows which tables exist and their status
2. **SupabaseConnectionTest** - Tests the basic Supabase connection

These will appear on your website and help you understand what's missing.

## Expected Result

After setting up the database:

- ✅ All error messages will disappear
- ✅ Website loads with default content
- ✅ Real-time updates work when you edit content in Supabase
- ✅ No more "[object Object]" errors

The frontend is already fully configured for dynamic content - it just needs the database tables to exist!
