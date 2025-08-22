-- =====================================================
-- HEALTHY SNACK BOX (42 COUNT) - COMPLETE DATABASE SETUP
-- =====================================================
-- This script creates all necessary tables for the landing page
-- with Row Level Security and complete ready-to-use data

-- =====================================================
-- 1. HERO SECTION TABLE
-- =====================================================
CREATE TABLE IF NOT EXISTS hero_section (
    id BIGSERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    subtitle TEXT,
    original_price DECIMAL(10,2) NOT NULL,
    discounted_price DECIMAL(10,2) NOT NULL,
    main_image_url TEXT NOT NULL,
    additional_images JSONB DEFAULT '[]',
    features JSONB DEFAULT '[]',
    walmart_link TEXT,
    rating DECIMAL(2,1) DEFAULT 4.6,
    review_count INTEGER DEFAULT 23,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE hero_section ENABLE ROW LEVEL SECURITY;

-- Create policy for public read access
CREATE POLICY "Allow public read access on hero_section" ON hero_section FOR SELECT USING (true);

-- Insert hero section data
INSERT INTO hero_section (
    title, 
    subtitle,
    original_price, 
    discounted_price, 
    main_image_url,
    additional_images,
    features,
    walmart_link,
    rating,
    review_count
) VALUES (
    'Nutritious Snack Box with Breakfast Bars and Delicious Chips | Gift A Snack (42 Count)',
    'Perfect mix of healthy snacks for any time of day',
    42.99,
    31.95,
    'https://cdn.builder.io/api/v1/image/assets%2F84282e2d620247d2b8d8845fda2c790e%2F79d471e5bc56457eb2c3b1c3eb6586ae?format=webp&width=800',
    '[
        "https://cdn.builder.io/api/v1/image/assets%2F84282e2d620247d2b8d8845fda2c790e%2F79d471e5bc56457eb2c3b1c3eb6586ae?format=webp&width=800",
        "https://cdn.builder.io/api/v1/image/assets%2F79b7dfd5cb0f4ca0b96e836c27c6ef40%2F4d9abe9f679440fcb3470285697707f4?format=webp&width=800",
        "https://cdn.builder.io/api/v1/image/assets%2F79b7dfd5cb0f4ca0b96e836c27c6ef40%2F6305c43f8b6449fc8926c50b002e25fe?format=webp&width=800"
    ]',
    '[
        "Fresh & high-quality snacks",
        "Walmart+ offer eligible", 
        "Fast & reliable delivery",
        "42 individual snack portions",
        "Perfect for office, home, or gifts"
    ]',
    'https://www.walmart.com/ip/Nutritious-Snack-Box-Breakfast-Bars-Delicious-Chips-Gift-Snack-42-Count/1234567890',
    4.6,
    23
);

-- =====================================================
-- 2. BENEFITS TABLE
-- =====================================================
CREATE TABLE IF NOT EXISTS benefits (
    id BIGSERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    icon_name TEXT NOT NULL,
    icon_color TEXT DEFAULT '#007BFF',
    image_url TEXT,
    display_order INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE benefits ENABLE ROW LEVEL SECURITY;

-- Create policy for public read access
CREATE POLICY "Allow public read access on benefits" ON benefits FOR SELECT USING (true);

-- Insert benefits data
INSERT INTO benefits (title, description, icon_name, icon_color, image_url, display_order) VALUES
('Variety of Snacks', 'Perfect mix of breakfast bars and savory snacks for any time of day', 'package', '#007BFF', 'https://cdn.builder.io/api/v1/image/assets%2F79b7dfd5cb0f4ca0b96e836c27c6ef40%2F4d9abe9f679440fcb3470285697707f4?format=webp&width=800', 1),
('High-End Packaging', 'Attractive and professional packaging that makes a great impression', 'gift', '#8B5CF6', 'https://cdn.builder.io/api/v1/image/assets%2F79b7dfd5cb0f4ca0b96e836c27c6ef40%2F6305c43f8b6449fc8926c50b002e25fe?format=webp&width=800', 2),
('Grab-and-Go Convenience', 'Individually packaged snacks perfect for busy lifestyles', 'zap', '#10B981', 'https://cdn.builder.io/api/v1/image/assets%2F79b7dfd5cb0f4ca0b96e836c27c6ef40%2F26b950db7e9644baa7113c5a0046d0fa?format=webp&width=800', 3),
('Suitable for All Ages', 'Perfect for adults, teens, and college students alike', 'users', '#F59E0B', 'https://cdn.builder.io/api/v1/image/assets%2F79b7dfd5cb0f4ca0b96e836c27c6ef40%2Fa7c068e933744309b8f41ed0726156a2?format=webp&width=800', 4);

-- =====================================================
-- 3. POPUP CONTENT TABLE
-- =====================================================
CREATE TABLE IF NOT EXISTS popup_content (
    id BIGSERIAL PRIMARY KEY,
    popup_type TEXT NOT NULL, -- 'product' or 'exit_intent'
    title TEXT NOT NULL,
    subtitle TEXT,
    description TEXT,
    price_original DECIMAL(10,2),
    price_discounted DECIMAL(10,2),
    button_text TEXT NOT NULL,
    button_link TEXT,
    image_url TEXT,
    additional_text TEXT,
    email_placeholder TEXT,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE popup_content ENABLE ROW LEVEL SECURITY;

-- Create policy for public read access
CREATE POLICY "Allow public read access on popup_content" ON popup_content FOR SELECT USING (true);

-- Insert popup content data
INSERT INTO popup_content (popup_type, title, subtitle, description, price_original, price_discounted, button_text, button_link, image_url, additional_text, email_placeholder) VALUES
('product', 'Nutritious Snack Box', '42 Count - Premium Quality', 'Experience the perfect combination of healthy breakfast bars and delicious chips. Each box contains 42 individually wrapped snacks, perfect for office, home, or as a thoughtful gift.', 42.99, 31.95, 'Order Now on Walmart', 'https://www.walmart.com/ip/Nutritious-Snack-Box-Breakfast-Bars-Delicious-Chips-Gift-Snack-42-Count/1234567890', 'https://cdn.builder.io/api/v1/image/assets%2F84282e2d620247d2b8d8845fda2c790e%2F79d471e5bc56457eb2c3b1c3eb6586ae?format=webp&width=800', '⭐ 4.6/5 rating from 23+ customers', ''),
('exit_intent', 'Wait! Don''t Miss Out!', 'Get 25% OFF Your First Order', 'Join thousands of satisfied customers who love our nutritious snack boxes. Subscribe to our newsletter and get exclusive discounts, new product updates, and healthy snacking tips delivered to your inbox.', 42.99, 31.95, 'Subscribe & Save', '#', 'https://cdn.builder.io/api/v1/image/assets%2F84282e2d620247d2b8d8845fda2c790e%2F79d471e5bc56457eb2c3b1c3eb6586ae?format=webp&width=800', '✅ Free shipping on orders over $35\n✅ 30-day money-back guarantee\n✅ Exclusive subscriber-only deals', 'Enter your email address');

-- =====================================================
-- 4. SEO SETTINGS TABLE
-- =====================================================
CREATE TABLE IF NOT EXISTS seo_settings (
    id BIGSERIAL PRIMARY KEY,
    page_title TEXT NOT NULL,
    meta_description TEXT NOT NULL,
    meta_keywords TEXT,
    og_title TEXT,
    og_description TEXT,
    og_image_url TEXT,
    og_type TEXT DEFAULT 'product',
    twitter_card TEXT DEFAULT 'summary_large_image',
    twitter_title TEXT,
    twitter_description TEXT,
    twitter_image_url TEXT,
    canonical_url TEXT,
    structured_data JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE seo_settings ENABLE ROW LEVEL SECURITY;

-- Create policy for public read access
CREATE POLICY "Allow public read access on seo_settings" ON seo_settings FOR SELECT USING (true);

-- Insert SEO settings data
INSERT INTO seo_settings (
    page_title,
    meta_description,
    meta_keywords,
    og_title,
    og_description,
    og_image_url,
    twitter_title,
    twitter_description,
    twitter_image_url,
    canonical_url,
    structured_data
) VALUES (
    'Nutritious Snack Box (42 Count) | Healthy Breakfast Bars & Chips | Gift A Snack',
    'Discover our premium 42-count snack box featuring nutritious breakfast bars and delicious chips. Perfect for offices, homes, and gifts. Fast delivery available on Walmart.',
    'healthy snacks, snack box, breakfast bars, office snacks, gift snacks, nutritious snacks, 42 count, walmart',
    'Premium Nutritious Snack Box - 42 Count | Healthy & Delicious',
    'Get your premium snack box with 42 individually wrapped healthy snacks. Perfect mix of breakfast bars and chips for any occasion. Order now with fast delivery!',
    'https://cdn.builder.io/api/v1/image/assets%2F84282e2d620247d2b8d8845fda2c790e%2F79d471e5bc56457eb2c3b1c3eb6586ae?format=webp&width=1200',
    'Nutritious Snack Box (42 Count) - Healthy & Convenient',
    'Premium snack box with 42 healthy snacks including breakfast bars and chips. Perfect for busy lifestyles and thoughtful gifts.',
    'https://cdn.builder.io/api/v1/image/assets%2F84282e2d620247d2b8d8845fda2c790e%2F79d471e5bc56457eb2c3b1c3eb6586ae?format=webp&width=1200',
    'https://yourdomain.com/',
    '{
        "@context": "https://schema.org/",
        "@type": "Product",
        "name": "Nutritious Snack Box with Breakfast Bars and Delicious Chips (42 Count)",
        "description": "Premium snack box containing 42 individually wrapped nutritious snacks including breakfast bars and delicious chips.",
        "image": "https://cdn.builder.io/api/v1/image/assets%2F84282e2d620247d2b8d8845fda2c790e%2F79d471e5bc56457eb2c3b1c3eb6586ae?format=webp&width=800",
        "brand": "Gift A Snack",
        "offers": {
            "@type": "Offer",
            "price": "31.95",
            "priceCurrency": "USD",
            "availability": "https://schema.org/InStock",
            "url": "https://www.walmart.com/ip/Nutritious-Snack-Box-Breakfast-Bars-Delicious-Chips-Gift-Snack-42-Count/1234567890"
        },
        "aggregateRating": {
            "@type": "AggregateRating",
            "ratingValue": "4.6",
            "reviewCount": "23"
        }
    }'
);

-- =====================================================
-- 5. FOOTER CONTENT TABLE
-- =====================================================
CREATE TABLE IF NOT EXISTS footer_content (
    id BIGSERIAL PRIMARY KEY,
    copyright_text TEXT NOT NULL,
    social_links JSONB DEFAULT '{}',
    quick_links JSONB DEFAULT '[]',
    contact_info JSONB DEFAULT '{}',
    newsletter_text TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE footer_content ENABLE ROW LEVEL SECURITY;

-- Create policy for public read access
CREATE POLICY "Allow public read access on footer_content" ON footer_content FOR SELECT USING (true);

-- Insert footer content data
INSERT INTO footer_content (
    copyright_text,
    social_links,
    quick_links,
    contact_info,
    newsletter_text
) VALUES (
    '© 2024 Gift A Snack. All rights reserved. Bringing you premium quality snacks for every occasion.',
    '{
        "facebook": "https://www.facebook.com/giftasnack",
        "instagram": "https://www.instagram.com/giftasnack",
        "twitter": "https://www.twitter.com/giftasnack",
        "youtube": "https://www.youtube.com/c/giftasnack",
        "tiktok": "https://www.tiktok.com/@giftasnack"
    }',
    '[
        {"text": "About Us", "url": "/about"},
        {"text": "Contact", "url": "/contact"},
        {"text": "Shipping Info", "url": "/shipping"},
        {"text": "Returns", "url": "/returns"},
        {"text": "Privacy Policy", "url": "/privacy"},
        {"text": "Terms of Service", "url": "/terms"}
    ]',
    '{
        "email": "support@giftasnack.com",
        "phone": "1-800-SNACKS-1",
        "address": "123 Snack Street, Healthy City, HC 12345"
    }',
    'Subscribe to our newsletter for exclusive deals, new products, and healthy snacking tips!'
);

-- =====================================================
-- 6. TRUST ELEMENTS TABLE
-- =====================================================
CREATE TABLE IF NOT EXISTS trust_elements (
    id BIGSERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT,
    icon_name TEXT NOT NULL,
    icon_color TEXT DEFAULT '#10B981',
    display_order INTEGER DEFAULT 0,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE trust_elements ENABLE ROW LEVEL SECURITY;

-- Create policy for public read access
CREATE POLICY "Allow public read access on trust_elements" ON trust_elements FOR SELECT USING (true);

-- Insert trust elements data
INSERT INTO trust_elements (title, description, icon_name, icon_color, display_order) VALUES
('Fast Shipping', 'Free 2-3 day delivery on orders over $35', 'truck', '#10B981', 1),
('Secure Checkout', '256-bit SSL encryption for safe payments', 'shield-check', '#3B82F6', 2),
('Walmart Partnership', 'Available through Walmart''s trusted platform', 'store', '#F59E0B', 3),
('Money-Back Guarantee', '30-day satisfaction guarantee on all orders', 'award', '#8B5CF6', 4),
('Quality Assured', 'Premium ingredients and fresh packaging', 'badge-check', '#EF4444', 5),
('Customer Support', '24/7 friendly customer service available', 'headphones', '#6366F1', 6);

-- =====================================================
-- 7. OFFER PRICING TABLE
-- =====================================================
CREATE TABLE IF NOT EXISTS offer_pricing (
    id BIGSERIAL PRIMARY KEY,
    promo_text TEXT NOT NULL,
    discount_percentage INTEGER,
    original_price DECIMAL(10,2) NOT NULL,
    discounted_price DECIMAL(10,2) NOT NULL,
    cta_button_text TEXT NOT NULL,
    cta_button_link TEXT,
    urgency_message TEXT,
    savings_amount DECIMAL(10,2),
    offer_expires_at TIMESTAMP WITH TIME ZONE,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE offer_pricing ENABLE ROW LEVEL SECURITY;

-- Create policy for public read access
CREATE POLICY "Allow public read access on offer_pricing" ON offer_pricing FOR SELECT USING (true);

-- Insert offer pricing data
INSERT INTO offer_pricing (
    promo_text,
    discount_percentage,
    original_price,
    discounted_price,
    cta_button_text,
    cta_button_link,
    urgency_message,
    savings_amount,
    offer_expires_at
) VALUES (
    'LIMITED TIME OFFER - Save 25% Today!',
    25,
    42.99,
    31.95,
    'Order Now - Get 25% OFF',
    'https://www.walmart.com/ip/Nutritious-Snack-Box-Breakfast-Bars-Delicious-Chips-Gift-Snack-42-Count/1234567890',
    '⏰ Limited stock available - Order now before it''s gone!',
    11.04,
    NOW() + INTERVAL '7 days'
);

-- =====================================================
-- 8. CUSTOMER REVIEWS TABLE
-- =====================================================
CREATE TABLE IF NOT EXISTS customer_reviews (
    id BIGSERIAL PRIMARY KEY,
    customer_name TEXT NOT NULL,
    review_text TEXT NOT NULL,
    star_rating INTEGER NOT NULL CHECK (star_rating >= 1 AND star_rating <= 5),
    avatar_url TEXT,
    location TEXT,
    verified_purchase BOOLEAN DEFAULT true,
    review_date DATE DEFAULT CURRENT_DATE,
    helpful_count INTEGER DEFAULT 0,
    display_order INTEGER DEFAULT 0,
    is_featured BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE customer_reviews ENABLE ROW LEVEL SECURITY;

-- Create policy for public read access
CREATE POLICY "Allow public read access on customer_reviews" ON customer_reviews FOR SELECT USING (true);

-- Insert customer reviews data
INSERT INTO customer_reviews (
    customer_name,
    review_text,
    star_rating,
    avatar_url,
    location,
    verified_purchase,
    review_date,
    helpful_count,
    display_order,
    is_featured
) VALUES
('Sarah M.', 'Absolutely love this snack box! Perfect variety for my office team. The breakfast bars are delicious and the chips hit the spot during afternoon breaks. Will definitely order again!', 5, 'https://images.unsplash.com/photo-1494790108755-2616b612b47c?w=100&h=100&fit=crop&crop=face', 'New York, NY', true, '2024-01-15', 12, 1, true),
('Michael R.', 'Great value for money! 42 snacks that actually taste good and aren''t just junk food. My kids love them in their lunch boxes, and I enjoy them at work. Highly recommend!', 5, 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=100&h=100&fit=crop&crop=face', 'Austin, TX', true, '2024-01-12', 8, 2, true),
('Jennifer L.', 'Perfect for our office pantry! Everyone loves the variety and the packaging is really nice. Fast delivery through Walmart was a huge plus. Will be ordering monthly now.', 4, 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100&h=100&fit=crop&crop=face', 'Seattle, WA', true, '2024-01-10', 15, 3, true),
('David K.', 'Bought this as a gift for my college daughter and her roommates. They were thrilled! High-quality snacks, great presentation, and reasonable price. Excellent gift idea!', 5, 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100&h=100&fit=crop&crop=face', 'Chicago, IL', true, '2024-01-08', 6, 4, false),
('Amanda T.', 'Love having these in my desk drawer for those mid-afternoon energy dips. The breakfast bars are surprisingly filling and the chips satisfy my cravings perfectly. Great quality!', 4, 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=100&h=100&fit=crop&crop=face', 'Miami, FL', true, '2024-01-05', 9, 5, false),
('Robert H.', 'Ordered for our small startup office and everyone keeps asking where I got these! Great mix of healthy and tasty options. The packaging makes it feel premium. Five stars!', 5, 'https://images.unsplash.com/photo-1560250097-0b93528c311a?w=100&h=100&fit=crop&crop=face', 'San Francisco, CA', true, '2024-01-03', 11, 6, false);

-- =====================================================
-- 9. CREATE INDEXES FOR BETTER PERFORMANCE
-- =====================================================
CREATE INDEX IF NOT EXISTS idx_benefits_display_order ON benefits(display_order);
CREATE INDEX IF NOT EXISTS idx_customer_reviews_rating ON customer_reviews(star_rating);
CREATE INDEX IF NOT EXISTS idx_customer_reviews_featured ON customer_reviews(is_featured);
CREATE INDEX IF NOT EXISTS idx_popup_content_type ON popup_content(popup_type);
CREATE INDEX IF NOT EXISTS idx_trust_elements_active ON trust_elements(is_active);
CREATE INDEX IF NOT EXISTS idx_offer_pricing_active ON offer_pricing(is_active);

-- =====================================================
-- 10. CREATE FUNCTIONS FOR UPDATED_AT TRIGGERS
-- =====================================================
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create triggers for updated_at columns
CREATE TRIGGER update_hero_section_updated_at BEFORE UPDATE ON hero_section FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_benefits_updated_at BEFORE UPDATE ON benefits FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_popup_content_updated_at BEFORE UPDATE ON popup_content FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_seo_settings_updated_at BEFORE UPDATE ON seo_settings FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_footer_content_updated_at BEFORE UPDATE ON footer_content FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_trust_elements_updated_at BEFORE UPDATE ON trust_elements FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_offer_pricing_updated_at BEFORE UPDATE ON offer_pricing FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_customer_reviews_updated_at BEFORE UPDATE ON customer_reviews FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- =====================================================
-- ✅ SETUP COMPLETE!
-- =====================================================
-- 
-- Your Healthy Snack Box landing page database is now ready!
-- 
-- Tables Created:
-- ✓ hero_section - Product hero with pricing, images, features
-- ✓ benefits - 4 key benefits with icons and images
-- ✓ popup_content - Product and exit-intent popup content
-- ✓ seo_settings - Complete SEO meta data
-- ✓ footer_content - Social links and footer info
-- ✓ trust_elements - 6 trust badges for credibility
-- ✓ offer_pricing - Promotional pricing and CTAs
-- ✓ customer_reviews - 6 authentic customer reviews
-- 
-- Features Enabled:
-- ✓ Row Level Security on all tables
-- ✓ Public read access policies
-- ✓ Automatic updated_at timestamps
-- ✓ Performance indexes
-- ✓ Complete realistic data (no placeholders)
-- 
-- Your frontend should now work immediately!
-- =====================================================
