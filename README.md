# Next.js + TypeScript + tRPC + Prisma + Supabase Template

A modern, production-ready starter template for full-stack TypeScript applications.

## 🚀 Tech Stack

- **Framework**: Next.js 14+ with App Router
- **Language**: TypeScript
- **Database**: Supabase (PostgreSQL)
- **ORM**: Prisma
- **API**: tRPC with React Query
- **Styling**: Tailwind CSS
- **Validation**: Zod

## ✨ Features

- 🔒 **Type Safety** - End-to-end type safety from database to frontend
- ⚡ **Performance** - Server Components, React Query caching, and optimizations
- 🛠️ **Developer Experience** - Hot reload, TypeScript, auto-completion
- 🗄️ **Database** - Supabase with Prisma ORM
- 🎨 **Styling** - Tailwind CSS with JIT compilation
- 📱 **Responsive** - Mobile-first design approach

## 🏁 Quick Start

### Prerequisites

- Node.js 18+ 
- pnpm (recommended) or npm/yarn
- Supabase account

### Installation

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd project-starter
   ```

2. **Install dependencies**
   ```bash
   pnpm install
   ```

3. **Environment Setup**
   ```bash
   # Copy example environment file
   cp .env.example .env.local
   
   # Create Prisma environment file
   touch .env
   ```

4. **Configure environment variables**
   
   Add to `.env.local` (Next.js runtime):
   ```env
   NEXT_PUBLIC_SUPABASE_URL="https://your-project.supabase.co"
   NEXT_PUBLIC_SUPABASE_ANON_KEY="your-anon-key"
   SUPABASE_SERVICE_ROLE_KEY="your-service-role-key"
   ```
   
   Add to `.env` (Prisma CLI):
   ```env
   DATABASE_URL="postgresql://postgres:password@db.project.supabase.co:6543/postgres"
   DIRECT_URL="postgresql://postgres:password@db.project.supabase.co:5432/postgres"
   ```

5. **Setup database**
   ```bash
   # Generate Prisma client
   pnpm prisma generate
   
   # Push schema to database
   pnpm prisma db push
   ```

6. **Start development server**
   ```bash
   pnpm dev
   ```

Open [http://localhost:3000](http://localhost:3000) to see your application.

## 📝 Available Scripts

```bash
# Development
pnpm dev              # Start development server
pnpm build            # Build for production
pnpm start            # Start production server
pnpm typecheck        # Run TypeScript type checking

# Database
pnpm prisma generate  # Generate Prisma client
pnpm prisma db push   # Push schema to database
pnpm prisma studio    # Open Prisma Studio
pnpm prisma migrate dev # Create migration
```

## 🗂️ Project Structure

```
project-starter/
├── src/
│   ├── app/                 # Next.js app directory
│   │   ├── api/trpc/        # tRPC API routes
│   │   ├── layout.tsx       # Root layout
│   │   └── page.tsx         # Home page
│   ├── server/              # Backend code
│   │   ├── api/             # tRPC routers and procedures
│   │   └── db.ts            # Prisma client
│   ├── utils/               # Shared utilities
│   │   └── api.ts           # tRPC client setup
│   └── types/               # TypeScript types
├── prisma/
│   └── schema.prisma        # Database schema
├── public/                  # Static assets
├── .env.example             # Environment template
├── CLAUDE.md               # AI assistant instructions
└── README.md               # This file
```

## 🔧 Configuration

### Supabase Setup

1. Create a new project at [supabase.com](https://supabase.com)
2. Get your connection strings from Settings → Database
3. Get your API keys from Settings → API
4. Update your environment variables

### Database Schema

Modify `prisma/schema.prisma` to define your data models:

```prisma
model Post {
  id        String   @id @default(cuid())
  title     String
  content   String?
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
}
```

After schema changes, run:
```bash
pnpm prisma generate
pnpm prisma db push
```

### API Routes

Add new tRPC procedures in `src/server/api/routers/`:

```typescript
import { z } from "zod";
import { createTRPCRouter, publicProcedure } from "../trpc";

export const postRouter = createTRPCRouter({
  create: publicProcedure
    .input(z.object({ title: z.string() }))
    .mutation(async ({ ctx, input }) => {
      return ctx.db.post.create({
        data: { title: input.title },
      });
    }),
});
```

## 🚀 Deployment

### Vercel (Recommended)

1. Push your code to GitHub
2. Connect your repository to Vercel
3. Add environment variables in Vercel dashboard
4. Deploy automatically on push

### Other Platforms

This template works with any platform that supports Node.js:
- Railway
- Render
- Fly.io
- AWS/GCP/Azure

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

## 🆘 Support

- Check [CLAUDE.md](./CLAUDE.md) for detailed technical documentation
- Review [troubleshooting section](./CLAUDE.md#troubleshooting) for common issues
- Open an issue for bugs or feature requests

---

Built with ❤️ using modern web technologies.