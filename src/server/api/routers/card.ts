import { z } from "zod";
import { createTRPCRouter, publicProcedure } from "~/server/api/trpc";

export const cardRouter = createTRPCRouter({
  getOne: publicProcedure
    .input(
      z.object({
        id: z.string().optional(),
      })
    )
    .query(async ({ ctx, input }) => {
      if (input.id) {
        // Get specific card by ID
        return await ctx.db.card.findUnique({
          where: { id: input.id },
        });
      }

      // Get a random card (or first one for demo)
      return await ctx.db.card.findFirst({
        orderBy: { createdAt: "desc" },
      });
    }),

  getAll: publicProcedure
    .input(
      z.object({
        language: z.string().optional(),
        limit: z.number().min(1).max(100).default(10),
      })
    )
    .query(async ({ ctx, input }) => {
      return await ctx.db.card.findMany({
        where: input.language ? { language: input.language } : {},
        orderBy: { createdAt: "desc" },
        take: input.limit,
      });
    }),

  create: publicProcedure
    .input(
      z.object({
        front: z.string().min(1),
        back: z.string().min(1),
        language: z.string().min(1),
        difficulty: z.number().min(1).max(5).default(1),
      })
    )
    .mutation(async ({ ctx, input }) => {
      return await ctx.db.card.create({
        data: {
          front: input.front,
          back: input.back,
          language: input.language,
          difficulty: input.difficulty,
        },
      });
    }),
});