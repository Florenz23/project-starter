# Supabase Setup Guide for LlamaVocs

## Step 1: Create Supabase Project

1. **Go to [supabase.com](https://supabase.com)**
2. **Sign up/Sign in** to your account
3. **Click "New Project"**
4. **Choose your organization** (create one if needed)
5. **Fill in project details:**
   - Name: `llamavocs` (or any name you prefer)
   - Database Password: Generate a strong password (save this!)
   - Region: Choose closest to your location
   - Pricing Plan: Free tier is sufficient for demo
6. **Click "Create New Project"**
7. **Wait 2-3 minutes** for project initialization

## Step 2: Get Database Connection Strings

1. **Navigate to Settings → Database** in your Supabase dashboard
2. **Scroll down to "Connection string"** section
3. **Copy the URI format:**
   ```
   postgresql://postgres:[YOUR-PASSWORD]@[HOST]:5432/postgres
   ```
4. **Replace `[YOUR-PASSWORD]`** with your actual database password
5. **For DATABASE_URL:** Add `?pgbouncer=true&connection_limit=1` at the end
6. **For DIRECT_URL:** Use the string as-is without extra parameters

Example:
```env
DATABASE_URL="postgresql://postgres:mypassword@db.abc123xyz.supabase.co:5432/postgres?pgbouncer=true&connection_limit=1"
DIRECT_URL="postgresql://postgres:mypassword@db.abc123xyz.supabase.co:5432/postgres"
```

## Step 3: Get API Keys

1. **Navigate to Settings → API** in your Supabase dashboard
2. **Copy the following values:**
   - **Project URL** → use for `NEXT_PUBLIC_SUPABASE_URL`
   - **anon public** key → use for `NEXT_PUBLIC_SUPABASE_ANON_KEY`
   - **service_role** key → use for `SUPABASE_SERVICE_ROLE_KEY` (keep this secret!)

Example:
```env
NEXT_PUBLIC_SUPABASE_URL="https://abc123xyz.supabase.co"
NEXT_PUBLIC_SUPABASE_ANON_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
SUPABASE_SERVICE_ROLE_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
```

## Step 4: Update Environment Variables

1. **Open `.env.local`** in your project root
2. **Copy values from `.env.example`**
3. **Replace placeholder values** with your actual Supabase credentials
4. **Save the file**

Your `.env.local` should look like:
```env
DATABASE_URL="postgresql://postgres:yourpassword@db.yourproject.supabase.co:5432/postgres?pgbouncer=true&connection_limit=1"
DIRECT_URL="postgresql://postgres:yourpassword@db.yourproject.supabase.co:5432/postgres"
NEXT_PUBLIC_SUPABASE_URL="https://yourproject.supabase.co"
NEXT_PUBLIC_SUPABASE_ANON_KEY="your_anon_key_here"
SUPABASE_SERVICE_ROLE_KEY="your_service_role_key_here"
NODE_ENV="development"
```

## Step 5: Initialize Database Schema

1. **Generate Prisma client:**
   ```bash
   pnpm prisma generate
   ```

2. **Push schema to Supabase:**
   ```bash
   pnpm prisma db push
   ```

3. **Verify in Supabase dashboard:**
   - Go to Database → Tables
   - You should see a `Card` table

## Step 6: Add Sample Data (Optional)

You can add sample vocabulary cards through the Supabase dashboard:

1. **Go to Database → Table Editor**
2. **Select the `Card` table**
3. **Click "Insert" → "Insert row"**
4. **Add sample data:**
   ```
   front: "Hello"
   back: "Hola"  
   language: "es"
   difficulty: 1
   ```

Or use SQL Editor:
```sql
INSERT INTO "Card" (front, back, language, difficulty) VALUES
  ('Hello', 'Hola', 'es', 1),
  ('Goodbye', 'Adiós', 'es', 1),
  ('Thank you', 'Gracias', 'es', 1),
  ('Please', 'Por favor', 'es', 1),
  ('Yes', 'Sí', 'es', 1);
```

## Step 7: Run the Application

1. **Start the development server:**
   ```bash
   pnpm dev
   ```

2. **Open [http://localhost:3000](http://localhost:3000)**

3. **You should see:**
   - Loading skeleton initially
   - Then a vocabulary card (if you added sample data)
   - Or "No vocabulary cards found" message

## Troubleshooting

### Connection Issues
- **Double-check your password** in the connection strings
- **Ensure your IP is allowed** (Supabase allows all IPs by default)
- **Check for typos** in environment variable names

### No Cards Showing
- **Add sample data** as shown in Step 6
- **Check database connection** with `pnpm prisma studio`
- **Verify environment variables** are correctly set

### Build Errors
- **Run `pnpm install`** to ensure all dependencies are installed
- **Clear Next.js cache:** `rm -rf .next`
- **Regenerate Prisma client:** `pnpm prisma generate`

## Next Steps

Once everything is working:

1. **Explore the tRPC API** at `/api/trpc`
2. **Add more vocabulary cards** through the UI or database
3. **Customize the styling** in `src/app/page.tsx`
4. **Add more features** like card flipping, multiple languages, etc.

## Security Notes

- **Never commit `.env.local`** to version control
- **Keep your service_role key secret** - don't expose it client-side
- **Use Row Level Security (RLS)** for production applications
- **Enable database backups** in Supabase for important data