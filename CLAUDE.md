# LamaVocs - Vocabulary Learning Application

## Tech Stack

### Core Framework
- **Next.js 14.2+** - React framework with App Router
- **React 18.3+** - UI library
- **TypeScript 5.3+** - Type safety

### Database & ORM
- **Supabase** - PostgreSQL database hosting & authentication
- **Prisma 5.7+** - Type-safe ORM
  - PostgreSQL adapter
  - Prisma Client for database queries
  - Prisma Studio for database management

### API Layer
- **tRPC v10** - End-to-end typesafe APIs
  - @trpc/server - Server-side implementation
  - @trpc/client - Client-side implementation
  - @trpc/react-query - React Query integration
  - @trpc/next - Next.js adapter
- **Zod 3.22+** - Schema validation
- **SuperJSON** - Transparent serialization

### Styling
- **Tailwind CSS 3.4+** - Utility-first CSS framework
  - JIT compilation
  - Dark mode support
  - Custom color palette
- **PostCSS 8.4+** - CSS processing
- **Autoprefixer 10.4+** - Vendor prefixing

### State Management & Data Fetching
- **TanStack Query v5** - Server state management
- **React Hook Form** - Form management (optional)

### Development Tools
- **ESLint** - Code linting
- **Prettier** - Code formatting
- **TypeScript** - Type checking

## Project Structure

```
lama-vocs/
├── src/
│   ├── app/                 # Next.js app directory
│   │   ├── api/
│   │   │   └── trpc/
│   │   │       └── [trpc]/
│   │   │           └── route.ts
│   │   ├── layout.tsx
│   │   └── page.tsx
│   ├── server/               # Backend code
│   │   ├── api/
│   │   │   ├── routers/
│   │   │   │   └── card.ts
│   │   │   ├── root.ts
│   │   │   └── trpc.ts
│   │   └── db.ts            # Prisma client instance
│   ├── utils/               # Shared utilities
│   │   └── api.ts          # tRPC client setup
│   └── types/              # TypeScript types
├── prisma/
│   └── schema.prisma       # Database schema
├── public/                 # Static assets
├── .env.local             # Environment variables
├── next.config.js         # Next.js configuration
├── tailwind.config.ts     # Tailwind configuration
├── tsconfig.json          # TypeScript configuration
└── package.json           # Dependencies
```

## Database Schema

### Card Model
```prisma
model Card {
  id          String   @id @default(cuid())
  front       String   // Front of the card (word/phrase)
  back        String   // Back of the card (translation/definition)
  language    String   // Language code (e.g., "en", "es")
  difficulty  Int      @default(1) // 1-5 difficulty scale
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
  
  @@index([language])
  @@index([createdAt])
}
```

## Key Features

### Type Safety
- End-to-end type safety from database to frontend
- Prisma generates types from schema
- tRPC infers types across API boundary
- Zod validates runtime data

### Performance
- Server Components for initial page load
- React Query for caching and optimistic updates
- Incremental Static Regeneration (ISR)
- Edge runtime support

### Developer Experience
- Hot Module Replacement (HMR)
- Type checking in development
- Auto-completion in IDE
- Clear error messages

## Environment Variables

### Database URLs Format (IMPORTANT)
Use the standard Supabase format, NOT the pooled connection format:

```env
# Database (.env file for Prisma CLI)
DATABASE_URL="postgresql://postgres:[PASSWORD]@db.[PROJECT_REF].supabase.co:6543/postgres"
DIRECT_URL="postgresql://postgres:[PASSWORD]@db.[PROJECT_REF].supabase.co:5432/postgres"

# Supabase API (.env.local for Next.js runtime)
NEXT_PUBLIC_SUPABASE_URL="https://[PROJECT_REF].supabase.co"
NEXT_PUBLIC_SUPABASE_ANON_KEY="eyJ..."
SUPABASE_SERVICE_ROLE_KEY="eyJ..."

# Environment
NODE_ENV="development"
```

### URL Encoding for Special Characters
If your password contains special characters, they MUST be URL encoded:
- `#` becomes `%23`
- `*` becomes `%2A`
- `+` becomes `%2B`
- `/` becomes `%2F`
- `@` becomes `%40`

Example:
```env
# Password: MyPass#123
DATABASE_URL="postgresql://postgres:MyPass%23123@db.abc123.supabase.co:6543/postgres"
```

## Development Commands

```bash
# Install dependencies
pnpm install

# Run development server
pnpm dev

# Build for production
pnpm build

# Start production server
pnpm start

# Type checking
pnpm typecheck          # Run TypeScript type checking

# Database commands
pnpm prisma generate    # Generate Prisma client
pnpm prisma db push     # Push schema to database
pnpm prisma studio      # Open Prisma Studio
pnpm prisma migrate dev # Create migration

# Linting and formatting
pnpm lint
pnpm format
```

## Setup Instructions

1. Clone repository
2. Install dependencies: `pnpm install`
3. Install Prisma build scripts: `pnpm approve-builds` (if prompted)
4. **Environment Setup:**
   - Copy `.env.example` to `.env.local` (for Next.js runtime)
   - Create `.env` file (for Prisma CLI) with DATABASE_URL and DIRECT_URL
   - Add Supabase credentials to both files
   - **IMPORTANT:** URL-encode any special characters in passwords
5. Generate Prisma client: `pnpm prisma generate`
6. Push schema to database: `pnpm prisma db push`
7. Run development server: `pnpm dev`

### Quick Start Commands
```bash
# Install dependencies
pnpm install

# Setup environment (create these files manually)
cp .env.example .env.local
touch .env

# Configure Prisma
pnpm prisma generate
pnpm prisma db push

# Start development
pnpm dev
```

## Supabase Setup

### Creating a Supabase Project
1. Go to [supabase.com](https://supabase.com)
2. Create new project
3. Choose region closest to your users
4. Set a strong database password
5. Wait for project to initialize

### Getting Connection Strings
1. Navigate to Settings → Database
2. Copy "Connection string" → DATABASE_URL
3. Copy "Connection pooling" → DIRECT_URL
4. Navigate to Settings → API
5. Copy "Project URL" → NEXT_PUBLIC_SUPABASE_URL
6. Copy "anon public" key → NEXT_PUBLIC_SUPABASE_ANON_KEY
7. Copy "service_role" key → SUPABASE_SERVICE_ROLE_KEY

### Database Configuration
- Enable Row Level Security (RLS) for production
- Configure connection pooling for serverless
- Set up database backups

## API Routes

### tRPC Endpoints
- `card.getOne` - Fetch single vocabulary card
- `card.getAll` - Fetch all cards with pagination
- `card.create` - Create new card
- `card.update` - Update existing card
- `card.delete` - Delete card

## Troubleshooting

### Common Issues

**Prisma Connection Errors:**
- Ensure special characters in passwords are URL-encoded
- Use the correct database URL format: `postgresql://postgres:password@db.project.supabase.co:6543/postgres`
- Check that `.env` file contains DATABASE_URL (not just .env.local)

**tRPC Type Errors:**
- Run `pnpm prisma generate` after schema changes
- Restart TypeScript server in your IDE
- Ensure all tRPC routers are properly exported

**Build Errors:**
- Install Prisma build scripts: `pnpm approve-builds`
- Clear Next.js cache: `rm -rf .next`
- Reinstall dependencies: `rm -rf node_modules && pnpm install`

**Environment Variables:**
- `.env` for Prisma CLI (DATABASE_URL, DIRECT_URL)
- `.env.local` for Next.js runtime (SUPABASE_URL, API_KEYS)
- Don't commit `.env` or `.env.local` to version control

## Best Practices

### Code Organization
- Keep components small and focused
- Use Server Components by default
- Client Components only when needed
- Colocate related files

### Performance
- Implement pagination for lists
- Use React Query for caching
- Optimize images with next/image
- Minimize client-side JavaScript

### Security
- Never expose service keys to client
- Use environment variables
- Implement RLS policies
- Validate all inputs with Zod

### Testing
- Unit tests for utilities
- Integration tests for API routes
- E2E tests for critical paths