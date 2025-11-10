"use client";

import { api } from "~/utils/api";

function VocabularyCard({ card }: { card: any }) {
  return (
    <div className="bg-white rounded-lg shadow-lg p-8 max-w-md mx-auto">
      <div className="text-center">
        <div className="mb-6">
          <span className="text-sm font-medium text-gray-500 uppercase tracking-wide">
            {card.language} • Difficulty {card.difficulty}/5
          </span>
        </div>
        
        <div className="mb-8">
          <h2 className="text-3xl font-bold text-gray-900 mb-4">
            {card.front}
          </h2>
          <div className="border-t pt-4">
            <p className="text-xl text-gray-600">
              {card.back}
            </p>
          </div>
        </div>
        
        <div className="text-xs text-gray-400">
          Created: {new Date(card.createdAt).toLocaleDateString()}
        </div>
      </div>
    </div>
  );
}

function LoadingSkeleton() {
  return (
    <div className="bg-white rounded-lg shadow-lg p-8 max-w-md mx-auto animate-pulse">
      <div className="text-center">
        <div className="mb-6">
          <div className="h-4 bg-gray-200 rounded w-24 mx-auto"></div>
        </div>
        
        <div className="mb-8">
          <div className="h-8 bg-gray-200 rounded w-32 mx-auto mb-4"></div>
          <div className="border-t pt-4">
            <div className="h-6 bg-gray-200 rounded w-40 mx-auto"></div>
          </div>
        </div>
        
        <div className="h-3 bg-gray-200 rounded w-20 mx-auto"></div>
      </div>
    </div>
  );
}

function ErrorMessage({ error }: { error: any }) {
  return (
    <div className="bg-red-50 border border-red-200 rounded-lg p-6 max-w-md mx-auto">
      <div className="text-center">
        <h3 className="text-lg font-medium text-red-800 mb-2">
          Oops! Something went wrong
        </h3>
        <p className="text-red-600">
          {error.message || "Unable to load vocabulary card"}
        </p>
        <p className="text-sm text-red-500 mt-2">
          Make sure your database is connected and contains some vocabulary cards.
        </p>
      </div>
    </div>
  );
}

export default function Home() {
  const { data: card, isLoading, error } = api.card.getOne.useQuery({});

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100">
      <div className="container mx-auto px-4 py-8">
        <div className="text-center mb-12">
          <h1 className="text-4xl font-bold text-gray-900 mb-4">
            🦙 LlamaVocs
          </h1>
          <p className="text-xl text-gray-600 max-w-2xl mx-auto">
            Learn vocabulary with spaced repetition and interactive flashcards
          </p>
        </div>

        <div className="flex justify-center">
          {isLoading && <LoadingSkeleton />}
          
          {error && <ErrorMessage error={error} />}
          
          {card ? (
            <VocabularyCard card={card} />
          ) : (
            !isLoading && !error && (
              <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-6 max-w-md mx-auto">
                <div className="text-center">
                  <h3 className="text-lg font-medium text-yellow-800 mb-2">
                    No vocabulary cards found
                  </h3>
                  <p className="text-yellow-600">
                    Add some vocabulary cards to your database to get started!
                  </p>
                </div>
              </div>
            )
          )}
        </div>

        <div className="mt-12 text-center">
          <p className="text-sm text-gray-500">
            Tech Stack: Next.js 14 • TypeScript • tRPC • Prisma • Tailwind CSS • Supabase
          </p>
        </div>
      </div>
    </div>
  );
}
