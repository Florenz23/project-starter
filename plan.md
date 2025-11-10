# LlamaVocs Implementation Plan

## Project Goal
Create a demo vocabulary application that fetches a single vocabulary card from a Supabase database and displays it using Next.js, Prisma, Tailwind CSS, and tRPC.

## Implementation Steps

### 1. Project Initialization
- [x] Create CLAUDE.md with tech stack documentation
- [ ] Initialize Next.js project with TypeScript
  ```bash
  npx create-next-app@latest . --typescript --tailwind --eslint --app --src-dir --import-alias "@/*"
  ```
- [ ] Clean up default Next.js files
- [ ] Set up project directory structure

### 2. Dependency Installation
Install core packages:
```bash
# Database & ORM
npm install prisma @prisma/client @supabase/supabase-js

# tRPC packages
npm install @trpc/server @trpc/client @trpc/react-query @trpc/next

# Utilities
npm install @tanstack/react-query superjson zod

# Development dependencies
npm install -D prisma
```

### 3. Database Setup
- [ ] Create Prisma schema with Card model
- [ ] Configure PostgreSQL connection for Supabase
- [ ] Set up environment variables template
- [ ] Initialize Prisma client

### 4. tRPC Backend Configuration
- [ ] Create tRPC context with Prisma client
- [ ] Set up tRPC router structure
- [ ] Create card router with `getOne` procedure
- [ ] Configure API route handler for tRPC

### 5. Frontend Setup
- [ ] Configure tRPC provider with React Query
- [ ] Create app layout with providers
- [ ] Build vocabulary display page
- [ ] Style with Tailwind CSS

### 6. Environment & Configuration
- [ ] Create environment variables template
- [ ] Configure TypeScript settings
- [ ] Set up Tailwind configuration
- [ ] Create Next.js configuration

### 7. Testing & Verification
- [ ] Test database connection
- [ ] Verify tRPC endpoint works
- [ ] Test frontend data fetching
- [ ] Ensure styling is correct

## File Structure Plan

```
lama-vocs/
├── src/
│   ├── app/
│   │   ├── api/trpc/[trpc]/route.ts    # tRPC API handler
│   │   ├── layout.tsx                   # Root layout with providers
│   │   ├── page.tsx                     # Main page showing vocabulary
│   │   └── globals.css                  # Tailwind imports
│   ├── server/
│   │   ├── api/
│   │   │   ├── routers/
│   │   │   │   └── card.ts             # Card router with getOne
│   │   │   ├── root.ts                 # Root tRPC router
│   │   │   └── trpc.ts                 # tRPC setup & context
│   │   └── db.ts                       # Prisma client instance
│   ├── utils/
│   │   └── api.ts                      # tRPC client setup
│   └── types/
│       └── index.ts                    # Shared TypeScript types
├── prisma/
│   └── schema.prisma                   # Database schema
├── .env.local                          # Environment variables
├── .env.example                        # Environment template
├── next.config.js                      # Next.js config
├── tailwind.config.ts                  # Tailwind config
├── tsconfig.json                       # TypeScript config
├── package.json                        # Dependencies
├── CLAUDE.md                           # Tech stack docs
└── plan.md                             # This file
```

## Database Schema Design

```prisma
model Card {
  id          String   @id @default(cuid())
  front       String   // Word/phrase to learn
  back        String   // Translation/definition
  language    String   // Language code (e.g., "en", "es")
  difficulty  Int      @default(1) // 1-5 scale
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
  
  @@index([language])
  @@index([createdAt])
}
```

## tRPC API Design

```typescript
// Card router with single endpoint for demo
export const cardRouter = router({
  getOne: publicProcedure
    .input(z.object({
      id: z.string().optional(),
    }))
    .query(async ({ ctx, input }) => {
      // Fetch single card, random if no ID provided
      return await ctx.db.card.findFirst({
        where: input.id ? { id: input.id } : {},
        orderBy: input.id ? undefined : { createdAt: 'desc' },
      });
    }),
});
```

## Frontend Component Plan

```typescript
// Main page component
export default function HomePage() {
  const { data: card, isLoading, error } = api.card.getOne.useQuery({});
  
  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100">
      <div className="container mx-auto px-4 py-8">
        <h1 className="text-3xl font-bold text-center mb-8">
          LlamaVocs - Vocabulary Learning
        </h1>
        
        {isLoading && <CardSkeleton />}
        {error && <ErrorMessage error={error} />}
        {card && <VocabularyCard card={card} />}
      </div>
    </div>
  );
}
```

## Environment Variables Needed

```env
# Supabase Database
DATABASE_URL="postgresql://[user]:[password]@[host]:5432/[database]?pgbouncer=true"
DIRECT_URL="postgresql://[user]:[password]@[host]:5432/[database]"

# Supabase API
NEXT_PUBLIC_SUPABASE_URL="https://[project-id].supabase.co"
NEXT_PUBLIC_SUPABASE_ANON_KEY="eyJ..."

# Optional
NODE_ENV="development"
```

## Supabase Connection Instructions

### 1. Create Supabase Project
1. Go to [supabase.com](https://supabase.com) and sign up/in
2. Click "New Project"
3. Choose organization and set project name
4. Generate a strong password
5. Select region closest to you
6. Wait for project initialization (2-3 minutes)

### 2. Get Database Connection Strings
1. Navigate to **Settings** → **Database**
2. Scroll down to "Connection string"
3. Copy the URI format: `postgresql://postgres:[YOUR-PASSWORD]@[HOST]:5432/postgres`
4. Replace `[YOUR-PASSWORD]` with your actual password
5. For pooled connection (recommended), use the "Connection pooling" string

### 3. Get API Keys
1. Navigate to **Settings** → **API**
2. Copy "Project URL" for `NEXT_PUBLIC_SUPABASE_URL`
3. Copy "anon public" key for `NEXT_PUBLIC_SUPABASE_ANON_KEY`

### 4. Set Up Database Schema
Once environment variables are set:
```bash
npx prisma generate
npx prisma db push
```

### 5. Seed Database (Optional)
Create a few sample cards for testing:
```sql
INSERT INTO "Card" (id, front, back, language, difficulty) VALUES
  ('card1', 'Hello', 'Hola', 'es', 1),
  ('card2', 'Goodbye', 'Adiós', 'es', 1),
  ('card3', 'Thank you', 'Gracias', 'es', 1);
```

## Success Criteria
- ✅ Project initializes without errors
- ✅ Database connection works
- ✅ Can fetch vocabulary card via tRPC
- ✅ Frontend displays card data
- ✅ Styling looks clean with Tailwind
- ✅ TypeScript compilation passes
- ✅ All environment variables documented

## Next Steps After Demo
- Add more CRUD operations
- Implement card flipping animation
- Add multiple languages support
- Create user authentication
- Build spaced repetition algorithm
- Add progress tracking