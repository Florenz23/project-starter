-- LlamaVocs Dummy Data Script
-- Run this in Supabase SQL Editor to populate your Card table with sample vocabulary

-- Enable the pgcrypto extension for generating random IDs
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Insert Spanish vocabulary cards
INSERT INTO "Card" (id, front, back, language, difficulty) VALUES
  (gen_random_uuid()::text, 'Hello', 'Hola', 'es', 1),
  (gen_random_uuid()::text, 'Goodbye', 'Adiós', 'es', 1),
  (gen_random_uuid()::text, 'Please', 'Por favor', 'es', 1),
  (gen_random_uuid()::text, 'Thank you', 'Gracias', 'es', 1),
  (gen_random_uuid()::text, 'Yes', 'Sí', 'es', 1),
  (gen_random_uuid()::text, 'No', 'No', 'es', 1),
  (gen_random_uuid()::text, 'Good morning', 'Buenos días', 'es', 2),
  (gen_random_uuid()::text, 'Good night', 'Buenas noches', 'es', 2),
  (gen_random_uuid()::text, 'How are you?', '¿Cómo estás?', 'es', 2),
  (gen_random_uuid()::text, 'My name is...', 'Me llamo...', 'es', 2),
  (gen_random_uuid()::text, 'I don''t understand', 'No entiendo', 'es', 3),
  (gen_random_uuid()::text, 'Where is the bathroom?', '¿Dónde está el baño?', 'es', 3),
  (gen_random_uuid()::text, 'I would like to order', 'Me gustaría pedir', 'es', 3),
  (gen_random_uuid()::text, 'Can you help me?', '¿Puedes ayudarme?', 'es', 3);

-- Insert French vocabulary cards
INSERT INTO "Card" (id, front, back, language, difficulty) VALUES
  (gen_random_uuid()::text, 'Hello', 'Bonjour', 'fr', 1),
  (gen_random_uuid()::text, 'Goodbye', 'Au revoir', 'fr', 1),
  (gen_random_uuid()::text, 'Please', 'S''il vous plaît', 'fr', 1),
  (gen_random_uuid()::text, 'Thank you', 'Merci', 'fr', 1),
  (gen_random_uuid()::text, 'Yes', 'Oui', 'fr', 1),
  (gen_random_uuid()::text, 'No', 'Non', 'fr', 1),
  (gen_random_uuid()::text, 'Good evening', 'Bonsoir', 'fr', 2),
  (gen_random_uuid()::text, 'Excuse me', 'Excusez-moi', 'fr', 2),
  (gen_random_uuid()::text, 'I am sorry', 'Je suis désolé(e)', 'fr', 2),
  (gen_random_uuid()::text, 'How much does it cost?', 'Combien ça coûte?', 'fr', 3),
  (gen_random_uuid()::text, 'I don''t speak French', 'Je ne parle pas français', 'fr', 3),
  (gen_random_uuid()::text, 'Where is the train station?', 'Où est la gare?', 'fr', 3);

-- Insert German vocabulary cards
INSERT INTO "Card" (id, front, back, language, difficulty) VALUES
  (gen_random_uuid()::text, 'Hello', 'Hallo', 'de', 1),
  (gen_random_uuid()::text, 'Goodbye', 'Auf Wiedersehen', 'de', 1),
  (gen_random_uuid()::text, 'Please', 'Bitte', 'de', 1),
  (gen_random_uuid()::text, 'Thank you', 'Danke', 'de', 1),
  (gen_random_uuid()::text, 'Yes', 'Ja', 'de', 1),
  (gen_random_uuid()::text, 'No', 'Nein', 'de', 1),
  (gen_random_uuid()::text, 'Good morning', 'Guten Morgen', 'de', 2),
  (gen_random_uuid()::text, 'Good evening', 'Guten Abend', 'de', 2),
  (gen_random_uuid()::text, 'How are you?', 'Wie geht es Ihnen?', 'de', 2),
  (gen_random_uuid()::text, 'I don''t understand', 'Ich verstehe nicht', 'de', 3),
  (gen_random_uuid()::text, 'Can you speak slower?', 'Können Sie langsamer sprechen?', 'de', 4),
  (gen_random_uuid()::text, 'I would like to make a reservation', 'Ich möchte eine Reservierung machen', 'de', 4);

-- Insert Italian vocabulary cards
INSERT INTO "Card" (id, front, back, language, difficulty) VALUES
  (gen_random_uuid()::text, 'Hello', 'Ciao', 'it', 1),
  (gen_random_uuid()::text, 'Goodbye', 'Arrivederci', 'it', 1),
  (gen_random_uuid()::text, 'Please', 'Per favore', 'it', 1),
  (gen_random_uuid()::text, 'Thank you', 'Grazie', 'it', 1),
  (gen_random_uuid()::text, 'Yes', 'Sì', 'it', 1),
  (gen_random_uuid()::text, 'No', 'No', 'it', 1),
  (gen_random_uuid()::text, 'Good morning', 'Buongiorno', 'it', 2),
  (gen_random_uuid()::text, 'Good evening', 'Buonasera', 'it', 2),
  (gen_random_uuid()::text, 'Where is...?', 'Dove si trova...?', 'it', 2),
  (gen_random_uuid()::text, 'I would like...', 'Vorrei...', 'it', 2),
  (gen_random_uuid()::text, 'The bill, please', 'Il conto, per favore', 'it', 3),
  (gen_random_uuid()::text, 'I don''t speak Italian well', 'Non parlo bene italiano', 'it', 3);

-- Insert Japanese vocabulary cards (Hiragana/Basic)
INSERT INTO "Card" (id, front, back, language, difficulty) VALUES
  (gen_random_uuid()::text, 'Hello', 'こんにちは (Konnichiwa)', 'ja', 1),
  (gen_random_uuid()::text, 'Thank you', 'ありがとう (Arigatou)', 'ja', 1),
  (gen_random_uuid()::text, 'Excuse me', 'すみません (Sumimasen)', 'ja', 1),
  (gen_random_uuid()::text, 'Yes', 'はい (Hai)', 'ja', 1),
  (gen_random_uuid()::text, 'No', 'いいえ (Iie)', 'ja', 1),
  (gen_random_uuid()::text, 'Good morning', 'おはよう (Ohayou)', 'ja', 2),
  (gen_random_uuid()::text, 'Good evening', 'こんばんは (Konbanwa)', 'ja', 2),
  (gen_random_uuid()::text, 'I don''t understand', 'わかりません (Wakarimasen)', 'ja', 3),
  (gen_random_uuid()::text, 'Please speak slowly', 'ゆっくり話してください (Yukkuri hanashite kudasai)', 'ja', 4),
  (gen_random_uuid()::text, 'Where is the toilet?', 'トイレはどこですか？ (Toire wa doko desu ka?)', 'ja', 4);

-- Insert some programming terms (English to definitions)
INSERT INTO "Card" (id, front, back, language, difficulty) VALUES
  (gen_random_uuid()::text, 'API', 'Application Programming Interface - A set of protocols and tools for building software applications', 'en', 3),
  (gen_random_uuid()::text, 'Recursion', 'A programming technique where a function calls itself to solve a problem', 'en', 4),
  (gen_random_uuid()::text, 'Algorithm', 'A step-by-step procedure for solving a problem or completing a task', 'en', 3),
  (gen_random_uuid()::text, 'Database', 'An organized collection of structured information or data stored electronically', 'en', 2),
  (gen_random_uuid()::text, 'Framework', 'A platform for developing software applications that provides a foundation of pre-written code', 'en', 3),
  (gen_random_uuid()::text, 'Variable', 'A storage location with an associated name that contains data', 'en', 2),
  (gen_random_uuid()::text, 'Function', 'A reusable block of code that performs a specific task', 'en', 2),
  (gen_random_uuid()::text, 'Array', 'A data structure that stores multiple values in a single variable', 'en', 2);

-- Display summary of inserted data
SELECT 
  language,
  COUNT(*) as card_count,
  MIN(difficulty) as min_difficulty,
  MAX(difficulty) as max_difficulty
FROM "Card" 
GROUP BY language
ORDER BY language;