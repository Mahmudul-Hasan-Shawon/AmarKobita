-- Content-only seed: authors + writings (from local poetry.db)

INSERT INTO authors (id, name, slug, short_bio, full_bio, portrait, birth_date, death_date, country, primary_language, other_languages, tags, created_at, updated_at, user_id) VALUES (1, 'Rumi', 'rumi', 'Persian poet, jurist, Islamic scholar, theologian, and Sufi mystic.', NULL, NULL, '1207', '1273', 'Persia (modern-day Afghanistan/Turkey)', 'Persian', NULL, NULL, '2026-09-16 09:58:35', '2026-09-16 09:58:35', NULL);
INSERT INTO authors (id, name, slug, short_bio, full_bio, portrait, birth_date, death_date, country, primary_language, other_languages, tags, created_at, updated_at, user_id) VALUES (2, 'Mirza Ghalib', 'mirza-ghalib', 'The last great poet of the Mughal era, renowned for his Urdu and Persian poetry.', NULL, NULL, '1797', '1869', 'India', 'Urdu', NULL, NULL, '2026-09-16 09:58:35', '2026-09-16 09:58:35', NULL);
INSERT INTO authors (id, name, slug, short_bio, full_bio, portrait, birth_date, death_date, country, primary_language, other_languages, tags, created_at, updated_at, user_id) VALUES (3, 'Rabindranath Tagore', 'rabindranath-tagore', 'Bengali polymath who reshaped Bengali literature and music.', NULL, NULL, '1861', '1941', 'India', 'Bengali', NULL, NULL, '2026-09-16 09:58:35', '2026-09-16 09:58:35', NULL);
INSERT INTO authors (id, name, slug, short_bio, full_bio, portrait, birth_date, death_date, country, primary_language, other_languages, tags, created_at, updated_at, user_id) VALUES (4, 'Kazi Nazrul Islam', 'kazi-nazrul-islam', 'The rebel poet of Bengal, known for his activism and literary works.', NULL, NULL, '1899', '1976', 'Bangladesh', 'Bengali', NULL, NULL, '2026-09-16 09:58:35', '2026-09-16 09:58:35', NULL);
INSERT INTO authors (id, name, slug, short_bio, full_bio, portrait, birth_date, death_date, country, primary_language, other_languages, tags, created_at, updated_at, user_id) VALUES (5, 'Hafiz', 'hafiz', 'Persian poet whose collected works are regarded as a pinnacle of Persian literature.', NULL, NULL, '1315', '1390', 'Persia (modern-day Iran)', 'Persian', NULL, NULL, '2026-09-16 09:58:35', '2026-09-16 09:58:35', NULL);
INSERT INTO authors (id, name, slug, short_bio, full_bio, portrait, birth_date, death_date, country, primary_language, other_languages, tags, created_at, updated_at, user_id) VALUES (6, 'Saadi', 'saadi', 'Persian poet known for his moral wit and depth of human understanding.', NULL, NULL, '1210', '1291', 'Persia (modern-day Iran)', 'Persian', NULL, NULL, '2026-09-16 09:58:35', '2026-09-16 09:58:35', NULL);
INSERT INTO authors (id, name, slug, short_bio, full_bio, portrait, birth_date, death_date, country, primary_language, other_languages, tags, created_at, updated_at, user_id) VALUES (7, 'Omar Khayyam', 'omar-khayyam', 'Persian mathematician, astronomer, and poet.', NULL, NULL, '1048', '1131', 'Persia (modern-day Iran)', 'Persian', NULL, NULL, '2026-09-16 09:58:35', '2026-09-16 09:58:35', NULL);
INSERT INTO authors (id, name, slug, short_bio, full_bio, portrait, birth_date, death_date, country, primary_language, other_languages, tags, created_at, updated_at, user_id) VALUES (8, 'William Shakespeare', 'william-shakespeare', 'English playwright and poet, widely regarded as the greatest writer in the English language.', NULL, NULL, '1564', '1616', 'England', 'English', NULL, NULL, '2026-09-16 09:58:35', '2026-09-16 09:58:35', NULL);
INSERT INTO authors (id, name, slug, short_bio, full_bio, portrait, birth_date, death_date, country, primary_language, other_languages, tags, created_at, updated_at, user_id) VALUES (9, 'Pablo Neruda', 'pablo-neruda', 'Chilean poet-diplomat and politician who won the Nobel Prize in Literature.', NULL, NULL, '1904', '1973', 'Chile', 'Spanish', NULL, NULL, '2026-09-16 09:58:35', '2026-09-16 09:58:35', NULL);
INSERT INTO authors (id, name, slug, short_bio, full_bio, portrait, birth_date, death_date, country, primary_language, other_languages, tags, created_at, updated_at, user_id) VALUES (10, 'Khalil Gibran', 'khalil-gibran', 'Lebanese-American writer, poet, and visual artist.', NULL, NULL, '1883', '1931', 'Lebanon', 'Arabic', NULL, NULL, '2026-09-16 09:58:35', '2026-09-16 09:58:35', NULL);

INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (1, 1, NULL, 'the-wound-is-the-place-where-the-light-enters-you', 'The wound is the place
where the Light enters you.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 1, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (2, 1, NULL, 'out-beyond-ideas-of-wrongdoing-and-rightdoing-there-is-a-field-ill-meet-you-th', 'Out beyond ideas of wrongdoing
and rightdoing
there is a field.
I''ll meet you there.', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 1, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (3, 1, NULL, 'what-you-seek-is-seeking-you', 'What you seek is seeking you.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 1, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (4, 1, NULL, 'dont-grieve-anything-you-lose-comes-round-in-another-form', 'Don''t grieve. Anything you lose comes round in another form.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (5, 1, NULL, 'let-yourself-be-silently-drawn-by-the-stronger-pull-of-what-you-really-love-it', 'Let yourself be silently drawn
by the stronger pull
of what you really love.
It will not lead you astray.', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (6, 2, NULL, 'dil-e-ndn-tujhe-hu-ky-hai-hir-is-dard-k-daw-ky-hai', 'Dil-e-nādān tujhe huā kyā hai,
Āḳhir is dard kī dawā kyā hai.', NULL, 'O innocent heart, what has happened to you?
After all, what is the cure for this pain?', NULL, NULL, 'ghazal', 'urdu', 'ltr', 'Diwan-e-Ghalib', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 1, 0, 'verified', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (7, 2, NULL, 'ishq-par-zor-nahn-hai-ye-woh-tamish-glib-ki-lage-na-lage-aur-bujhe-na-bane', 'Ishq par zor nahīn hai ye woh ātamish Gālib,
ki lagāe na lage aur bujhāe na bane.', NULL, 'Love cannot be forced, this is a fire, Ghalib,
that cannot be kindled or extinguished at will.', NULL, NULL, 'ghazal', 'urdu', 'ltr', 'Diwan-e-Ghalib', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'verified', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (8, 2, NULL, 'hazaaron-khwhishein-aisi-ke-har-khwhish-pe-dam-nikle-bahut-nikle-mere-armn-l', 'Hazaaron khwāhishein aisi ke har khwāhish pe dam nikle,
bahut nikle mere armān lekin phir bhī kam nikle.', NULL, 'A thousand desires, each worth dying for,
many of my wishes were fulfilled, yet still they seem few.', NULL, NULL, 'ghazal', 'urdu', 'ltr', 'Diwan-e-Ghalib', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 1, 0, 'verified', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (9, 3, NULL, 'where-the-mind-is-without-fear-and-the-head-is-held-high-where-knowledge-is-fre', 'Where the mind is without fear
and the head is held high;
Where knowledge is free;
Where the world has not been broken up
into fragments by narrow domestic walls.', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'Gitanjali', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 1, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (10, 3, NULL, 'i-slept-and-dreamt-that-life-was-joy-i-awoke-and-saw-that-life-was-service-i-a', 'I slept and dreamt that life was joy.
I awoke and saw that life was service.
I acted and behold, service was joy.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (11, 4, NULL, '', 'বল বীর—
বল উন্নত মম শির!
শির নেহারি আমারি, নতশির ওই শিখর হিমাদ্রির!

বল বীর —
বল মহাবিশ্বের মহাকাশ ফাড়ি''
চন্দ্র সূর্য গ্রহ তারা ছাড়ি''
ভূলোক দ্যুলোক গোলক ভেদিয়া,
খোদার আসন ''আরশ'' ছেদিয়া
উঠিয়াছি চির-বিস্ময় আমি বিশ্ব-বিধাত্রীর!
মম ললাটে রুদ্র-ভগবান জ্বলে রাজ-রাজটীকা দীপ্ত জয়শ্রীর!
বল বীর —
আমি চির-উন্নত শির!

আমি চিরদুর্দম, দুর্বিনীত, নৃশংস,
মহা-প্রলয়ের আমি নটরাজ, আমি সাইক্লোন, আমি ধ্বংস,
আমি মহাভয়, আমি অভিশাপ পৃথ্বীর!
আমি দুর্বার,
আমি ভেঙে করি সব চুরমার!
আমি অনিয়ম উচ্ছৃঙ্খল,
আমি দলে যাই যত বন্ধন, যত নিয়ম কানুন শৃংখল!
আমি মানি নাকো কোনো আইন,
আমি ভরা-তরী করি ভরা-ডুবি, আমি টর্পেডো, আমি ভীম, ভাসমান মাইন!
আমি ধূর্জটি, আমি এলোকেশে ঝড় অকাল-বৈশাখীর!
আমি বিদ্রোহী আমি বিদ্রোহী-সূত বিশ্ব-বিধাত্রীর!
বল বীর —
চির উন্নত মম শির!

আমি ঝঞ্ঝা, আমি ঘূর্ণী,
আমি পথ-সম্মুখে যাহা পাই যাই চূর্ণী!
আমি নৃত্য-পাগল ছন্দ,
আমি আপনার তালে নেচে যাই, আমি মুক্ত জীবনানন্দ।
আমি হাম্বীর, আমি ছায়ানট, আমি হিন্দোল,
আমি চল-চঞ্চল, ঠমকি'' ছমকি''
পথে যেতে যেতে চকিতে চমকি''
ফিং দিয়া দিই তিন দোল্!
আমি চপলা-চপল হিন্দোল!

আমি তাই করি ভাই যখন চাহে এ মন যা'',
করি শত্রুর সাথে গলাগলি, ধরি মৃত্যুর সাথে পাঞ্জা,
আমি উন্মাদ, আমি ঝঞ্ঝা!
আমি মহামারী, আমি ভীতি এ ধরিত্রীর।
আমি শাসন-ত্রাসন, সংহার আমি উষ্ণ চির-অধীর।
বল বীর —
আমি চির-উন্নত শির!

আমি চির-দুরন্ত-দুর্মদ,
আমি দুর্দম, মম প্রাণের পেয়ালা হর্দম্ হ্যায়্ হর্দম্ ভরপুর মদ।
আমি হোম-শিখা, আমি সাগ্নিক, জমদগ্নি,
আমি যজ্ঞ, আমি পুরোহিত, আমি অগ্নি!
আমি সৃষ্টি, আমি ধ্বংস, আমি লোকালয়, আমি শ্মশান,
আমি অবসান, নিশাবসান।
আমি ইন্দ্রাণি-সুত হাতে-চাঁদ ভালে সূর্য,
মম এক হাতে-বাঁকা বাঁশের বাঁশরি, আর হাতে রণ-তূর্য।
আমি কৃষ্ণ-কন্ঠ, মন্থন-বিষ পিয়া ব্যথা বারিধির।
আমি ব্যোমকেশ, ধরি বন্ধন-হারা ধারা গঙ্গোত্রীর।
বল বীর —
চির উন্নত মম শির।

আমি সন্ন্যাসী, সুর-সৈনিক
আমি যুবরাজ, মম রাজবেশ ম্লান গৈরিক!
আমি বেদুঈন, আমি চেঙ্গিস,
আমি আপনা ছাড়া করি না কাহারে কুর্নিশ!
আমি বজ্র, আমি ঈশান-বিষাণে ওঙ্কার,
আমি ইস্রাফিলের শিঙ্গার মহা-হুঙ্কার,
আমি পিনাক-পাণির ডমরু-ত্রিশূল, ধর্মরাজের দণ্ড,
আমি চক্র ও মহাশঙ্খ, আমি প্রণব-নাদ-প্রচণ্ড!
আমি খ্যাপা দুর্বাসা-বিশ্বামিত্র-শিষ্য,
আমি দাবানল-দাহ, দাহন করিব বিশ্ব!
আমি প্রাণ-খোলা-হাসি উল্লাস, —আমি সৃষ্টি-বৈরী মহাত্রাস,
আমি মহা-প্রলয়ের দ্বাদশ রবির রাহু-গ্রাস!
আমি কভু প্রশান্ত, — কভু অশান্ত দারুণ স্বেচ্ছাচারী,
আমি অরুণ খুনের তরুণ, আমি বিধির দর্প-হারী!
আমি প্রভঞ্জনের উচ্ছ্বাস, আমি বারিধির মহাকল্লোল,
আমি উজ্জ্বল আমি প্রোজ্জ্বল,
আমি উচ্ছল জল-ছল-ছল, চল-ঊর্মির হিন্দোল্ দোল্!

আমি বন্ধন-হারা কুমারীর বেণী, তন্বী-নয়নে বহ্নি,
আমি ষোড়শীর হৃদি-সরসিজ প্রেম-উদ্দাম, আমি ধন্যি।
আমি উন্মন মন উদাসীর,
আমি বিধবার বুকে ক্রন্দন-শ্বাস, হা-হুতাশ আমি হুতাশির!
আমি বঞ্চিত ব্যথা পথবাসী চির-গৃহহারা যত পথিকের,
আমি অবমানিতের মরম-বেদনা, বিষ-জ্বালা, প্রিয়-লাঞ্ছিত বুকে গতি ফের!
আমি অভিমানী চির-ক্ষুব্ধ হিয়ার কাতরতা, ব্যথা সুনিবিড়,
চিত- চুম্বন-চোর-কম্পন আমি থর-থর-থর প্রথম পরশ কুমারীর!

আমি গোপন প্রিয়ার চকিত চাহনি, ছল করে দেখা অনুখন,
আমি চপল মেয়ের ভালোবাসা, তা''র কাঁকন-চুড়ির কন্-কন্।
আমি চির-শিশু, চির-কিশোর,
আমি যৌবন-ভীতু পল্লীবালার আঁচর কাঁচলি নিচোর!
আমি উত্তর-বায়ু, মলয়-অনিল, উদাসী পূরবী হাওয়া,
আমি পথিক-কবির গভীর রাগিণী, বেণু-বীণে গান গাওয়া!
আমি আকুল নিদাঘ-তিয়াসা, আমি রৌদ্র- রুদ্র রবি,
আমি মরু-নির্ঝর ঝর-ঝর, আমি শ্যামলিমা ছায়া-ছবি! -
আমি তুরীয়ানন্দে ছুটে চলি এ কি উন্মাদ, আমি উন্মাদ!
আমি সহসা আমারে চিনেছি, আমার খুলিয়া গিয়াছে সব বাঁধ!

আমি উত্থান, আমি পতন, আমি অচেতন-চিতে চেতন,
আমি বিশ্ব-তোরণে বৈজয়ন্তী, মানব-বিজয়-কেতন!
ছুটি ঝড়ের মতন করতালি দিয়া
স্বর্গ-মর্ত-করতলে,
তাজি বোরবাক্ আর উচ্চৈঃশ্রবা বাহন আমার
হিম্মৎ-হ্রেষা হেঁকে চলে!

আমি বসুধা-বক্ষে আগ্নেয়াদ্রি, বাড়ব-বহ্নি, কালানল,
আমি পাতালে মাতাল অগ্নি-পাথর-কলরোল-কল-কোলাহল!
আমি তড়িতে চড়িয়া উড়ে চলি জোর তুড়ি দিয়া, দিয়া লম্ফ,
আমি ত্রাস সঞ্চারি ভুবনে সহসা সঞ্চরি ভূমি-কম্প!
ধরি বাসুকির ফনা জাপটি,
ধরি স্বর্গীয় দূত জিব্রাইলের আগুনের পাখা সাপটি!
আমি দেব-শিশু, আমি চঞ্চল,
আমি ধৃষ্ট, আমি দাঁত দিয়া ছিঁড়ি বিশ্ব-মায়ের অঞ্চল!

আমি অর্ফিয়াসের বাঁশরি,
মহা-সিন্ধু উতলা ঘুম্-ঘুম্
ঘুম্ চুমু দিয়ে করে নিখিল বিশ্বে নিঝ্ঝুম্
মম বাঁশরির তানে পাশরি''
আমি শ্যামের হাতের বাঁশরি।
আমি রুষে উঠে'' যবে ছুটি মহাকাশ ছাপিয়া,
ভয়ে সপ্ত নরক হারিয়া দোজখ নিভে নিভে যায় কাঁপিয়া!
আমি বিদ্রোহ-বাহী নিখিল অখিল ব্যাপিয়া!

আমি শ্রাবণ-প্লাবন- বন্যা,
কভু ধরণীরে করি বরণিয়া, কভু বিপুল ধ্বংস-ধন্যা -
আমি ছিনিয়া আনিব বিষ্ণু-বক্ষ হইতে যুগল কন্যা!
আমি অন্যায়, আমি উল্কা, আমি শনি,
আমি ধূমকেতু-জ্বালা, বিষধর কাল-ফণি!
আমি ছিন্নমস্তা চণ্ডি, আমি রণদা সর্বনাশী,
আমি জাহান্নামের আগুনে বসিয়া হাসি পুষ্পের হাসি!

আমি মৃণ্ময়, আমি চিন্ময়,
আমি অজর অমর অক্ষয়, আমি অব্যয়!
আমি মানব দানব দেবতার ভয়,
বিশ্বের আমি চির দুর্জয়,
জগদীশ্বর-ঈশ্বর আমি পুরুষোত্তম সত্য,
আমি তাথিয়া তাথিয়া মথিয়া ফিরি এ স্বর্গ-পাতাল-মর্ত!
আমি উন্মাদ, আমি উন্মাদ!!
আমি চিনেছি আমারে, আজিকে আমার খুলিয়া গিয়াছে সব বাঁধ!!

আমি পরশুরামের কঠোর কুঠার,
নিঃক্ষত্রিয় করিব বিশ্ব, আনিব শান্তি শান্ত উদার!
আমি হল বলরাম-স্কন্ধে,
আমি উপাড়ি'' ফেলিব অধীন বিশ্ব অবহেলে নব-সৃষ্টির মহানন্দে।

মহা-বিদ্রোহী রণ-ক্লান্ত
আমি সেই দিন হব শান্ত,
যবে উৎপীড়িতের ক্রন্দন-রোল, আকাশে বাতাসে ধ্বনিবে না,
অত্যাচারীর খড়গ কৃপাণ ভীম রণ-ভূমে রণিবে না-বিদ্রোহী রণ-ক্লান্ত
আমি সেই দিন হব শান্ত!
আমি বিদ্রোহী ভৃগু, ভগবান বুকে এঁকে দিই পদ-চিহ্ন,
আমি স্রষ্টা-সূদন, শোক-তাপ-হানা খেয়ালি বিধির বক্ষ করিব-ভিন্ন!
আমি বিদ্রোহী ভৃগু, ভগবান বুকে এঁকে দেবো পদ-চিহ্ন!
আমি খেয়ালী বিধির বক্ষ করিব ভিন্ন!
আমি চির-বিদ্রোহী বীর -
আমি বিশ্ব ছাড়ায়ে উঠিয়াছি একা চির-উন্নত শির!', NULL, 'Proclaim, brave one—
proclaim my head held high!
Seeing my head, that Himalayan summit bows low.', NULL, NULL, 'poetry', 'bangla', 'ltr', 'বিদ্রোহী (The Rebel)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'verified', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (12, 4, NULL, '-1', 'মূর্খরা সব শোনো, মানুষ এনেছে গ্রন্থ'';
গ্রন্থ'' আনেনি মানুষ কোনো।
আদম দাউদ ঈসা মুসা ইব্রাহিম মোহাম্মাদ কৃষ্ণ বুদ্ধ নানক কবীর,—
বিশ্বের সম্পদ, আমাদেরি এঁরা পিতা-পিতামহ,
এই আমাদের মাঝে তাঁদেরি রক্ত কম-বেশী ক''রে প্রতি ধমনীতে রাজে!
আমরা তাঁদেরি সন্তান, জ্ঞাতি, তাঁদেরি মতন দেহ,
কে জানে কখন মোরাও অমনি হয়ে যেতে পারি কেহ।
হেসো না বন্ধু! আমার আমি সে কত অতল অসীম,
আমিই কি জানি—কে জানে কে আছে আমাতে মহামহিম।
হয়ত আমাতে আসিছে কল্কি, তোমাতে মেহেদী ঈসা,
কে জানে কাহার অন্-ও আদি, কে পায় কাহার দিশা?
কাহারে করিছ ঘৃণা তুমি ভাই, কাহারে মারিছ লাথি?
হয়ত উহারই বুকে ভগবান জাগিছেন দিবা-রাতি!
অথবা হয়ত কিছুই নহে সে, মহান্ উঁচু নহে,
আছে ক্লেদাক্ত ক্ষত-বিক্ষত পড়িয়া দুঃখ-দহে,
তবু জগতের যত পবিত্র গ্রন্থ ভজনালয়
ঐ একখানি ক্ষুদ্র দেহের সম পবিত্র নয়।
হয়ত ইহারি ঔরসে ভাই, ইহারই কুটীর-বাসে
জন্মিছে কেহ—জোড়া নাই যার জগতের ইতিহাসে!
যে বাণী আজিও শোনেনি জগৎ, যে মহাশক্তি-
ধরে আজিও বিশ্ব দেখনি,—হয়ত আসিছে সে এরই ঘরে!
ও কে? চণ্ডাল? চমকাও কেন? নহে ও ঘৃণ্য জীব!
ওই হ''তে পারে হরিশচন্দ্র, ওই শ্মশানের শিব।
আজ চণ্ডাল, কাল হ''তে পারে মহাযোগী-সম্রাট,
তুমি কাল তারে অর্ঘ্য দানিবে, করিবে নান্দী-পাঠ।
রাখাল বলিয়া কারে করো হেলা, ও-হেলা কাহারে বাজে!
হয়ত গোপনে ব্রজের গোপাল এসেছে রাখাল সাজে!
চাষা ব''লে কর ঘৃণা! দে''খো চাষা-রূপে লুকায়ে
জনক-বলরাম এলো কি না!
যত নবী ছিল মেষের রাখাল, তারাও ধরিল হাল,
তারাই আনিল অমর বাণী—যা আছে র''বে চিরকাল।
দ্বারে গালি খেয়ে ফিরে যায় নিতি ভিখারী ও ভিখারিনী,
তারি মাঝে কবে এলো ভোলা-নাথ-গিরিজায়া, তা কি চিনি!
তোমার ভোগের হ্রাস হয় পাছে ভিক্ষা-মুষ্টি দিলে,
দ্বারী দিয়ে তাই মার দিয়ে তুমি দেবতারে খেদাইলে।
সে মার রহিল জমা—কে জানে তোমায় লাঞ্ছিতা দেবী করিয়াছে কিনা ক্ষমা!
বন্ধু, তোমার বুক-ভরা লোভ, দু''চোখে স্বার্থ-ঠুলি,
নতুবা দেখিতে, তোমারে সেবিতে দেবতা হ''য়েছে কুলি।
মানুষের বুকে যেটুকু দেবতা, বেদনা-মথিত সুধা,
তাই লুটে তুমি খাবে পশু? তুমি তা দিয়ে মিটাবে ক্ষুধা?
তোমার ক্ষুধার আহার তোমার মন্দোদরীই জানে,
তোমার মৃত্যু-বাণ আছে তব প্রাসাদের কোন্''খানে!
তোমারি কামনা-রাণী যুগে যুগে পশু,
ফেলেছে তোমায় মৃত্যু-বিবরে টানি''।

গাহি সাম্যের গান—
যেখানে আসিয়া এক হয়ে গেছে সব বাধা-ব্যবধান,
যেখানে মিশেছে হিন্দু-বৌদ্ধ-মুসলিম-খ্রীষ্টান।
গাহি সাম্যের গান!

কে তুমি?—পার্সী? জৈন? ইহুদী? সাঁওতাল, ভীল, গারো?
কনফুসিয়াস? চার্বাক-চেলা? ব''লে যাও, বলো আরো!
বন্ধু, যা-খুশি হও,
পেটে পিঠে কাঁধে মগজে যা-খুশি পুঁথি ও কেতাব বও,
কোরান-পুরাণ-বেদ-বেদান্ত-বাইবেল-ত্রিপিটক-
জেন্দাবেস্তা-গ্রন্থসাহেব প''ড়ে যাও যত সখ,—
কিন্তু, কেন এ পণ্ডশ্রম, মগজে হানিছ শূল?
দোকানে কেন এ দর-কষাকষি?—পথে ফুটে তাজা ফুল!
তোমাতে রয়েছে সকল কেতাব, সকল কালের জ্ঞান,
সকল শাস্ত্র খুঁজে পাবে সখা, খুলে'' দেখ নিজ প্রাণ!
তোমাতে রয়েছে সকল ধর্ম, সকল যুগাবতার,
তোমার হৃদয় বিশ্ব-দেউল, সকল দেবতার।
কেন খুঁজে ফের দেবতা-ঠাকুর মৃত পুঁথি-কঙ্কালে?
হাসিছেন তিনি অমৃত-হিয়ার নিভৃত অন্তরালে!

বন্ধু, বলিনি ঝুট,
এইখানে এসে লুটাইয়া পড়ে সকল রাজমুকুট!
এই হৃদয়ই সে নীলাচল, কাশী, মথুরা, বৃন্দাবন,
বুদ্ধ-গয়া এ, জেরুজালেম এ, মদিনা, কাবা-ভবন,
মসজিদ এই, মন্দির এই, গির্জা এই হৃদয়,
এইখানে ব''সে ঈসা-মুসা পেল সত্যের পরিচয়।
এই রণ-ভূমে বাঁশীর কিশোর গাহিলেন মহা-গীতা,
এই মাঠে হ''ল মেষের রাখাল নবীরা খোদার মিতা।
এই হৃদয়ের ধ্যান-গুহা-মাঝে বসিয়া শাক্যমুনি
ত্যজিল রাজ্য, মানবের মহা-বেদনার ডাক শুনি''।
এই কন্দরে আরব-দুলাল শুনিতেন আহ্বান,
এইখানে বসি'' গাহিলেন তিনি কোরানের সাম-গান!
মিথ্যা শুনিনি ভাই,
এই হৃদয়ের চেয়ে বড় কোনো মন্দির-কাবা নাই।', NULL, 'I sing the song of equality—
Where all barriers have melted into one,
Where Hindu, Buddhist, Muslim, and Christian are united.', NULL, NULL, 'poetry', 'bangla', 'ltr', 'সাম্যবাদী (The Equalizer)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'verified', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (13, 4, NULL, '-2', 'চল্ চল্ চল্
ঊর্ধ্ব গগনে বাজে মাদল,
নিম্নে উতলা ধরণী-তল,
অরুণ প্রাতের তরুণ দল
চল্ রে চল্ রে চল্।
চল্ চল্ চল্।।

ঊষার দুয়ারে হানি'' আঘাত
আমরা আনিব রাঙা প্রভাত,
আমরা টুটাব তিমির রাত,
বাধার বিন্ধ্যাচল।

নব নবীনের গাহিয়া গান
সজীব করিব মহাশ্মশান,
আমরা দানিব নূতন প্রাণ,
বাহুতে নবীন বল।

চল্ রে নও-জোয়ান,
শোন্ রে পাতিয়া কান—
মৃত্যু-তোরণ-দুয়ারে-দুয়ারে
জীবনের আহ্বান।

ভাঙ্ রে ভাঙ্ আগল,
চল্ রে চল্ রে চল্।
চল্ চল্ চল্।।

ঊর্ধ্বে আদেশ হানিছে বাজ,
শহীদী-ঈদের সেনারা সাজ,
দিকে দিকে চলে কুচ-কাওয়াজ—
খোল্ রে নিদ-মহল!

কবে সে খেয়ালি বাদশাহী,
সেই সে অতীতে আজো চাহি''
যাস্ মুসাফির গান গাহি''
ফেলিস অশ্রুজল।

যাক্ রে তখত-তাউস,
জাগ রে জাগ বেহুঁশ!
ডুবিল রে দেখ কত পারস্য,
কত রোম, গ্রীক্, রুশ!

জাগিল তা''রা সকল,
জেগে ওঠ্ হীনবল!
আমরা গড়িব নূতন করিয়া
ধূলায় তাজমহল!
চল্ চল্ চল্।।', NULL, 'March on, march on, march on!
The drums resound in the heavens above,
Below, the restless earth—
the youthful band of the crimson dawn,
march on, march on, march on!', NULL, NULL, 'poetry', 'bangla', 'ltr', 'চল্ চল্ চল্ (March On)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'verified', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (14, 5, NULL, 'stay-close-to-anything-that-makes-you-glad-you-are-alive', 'Stay close to anything
that makes you glad
you are alive.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Gift', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (15, 5, NULL, 'the-small-man-builds-cages-for-everyone-he-knows-while-the-sage-who-has-to-duc', 'The small man builds cages
for everyone he knows,
while the sage, who has to duck his head
when the moon is low,
keeps dropping keys all night long
for the beautiful rowdy prisoners.', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'The Gift', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 1, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (16, 6, NULL, 'human-beings-are-members-of-a-whole-in-creation-of-one-essence-and-soul-if-one', 'Human beings are members of a whole,
in creation of one essence and soul.
If one member is afflicted with pain,
other members uneasy will remain.
If you have no sympathy for human pain,
the name of human you cannot retain.', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'Gulistan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 1, 0, 'verified', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (17, 7, NULL, 'a-book-of-verses-underneath-the-bough-a-jug-of-wine-a-loaf-of-breadand-thou-b', 'A book of verses underneath the bough,
a jug of wine, a loaf of bread—and thou
beside me singing in the wilderness—
oh, wilderness were paradise enow!', NULL, NULL, NULL, NULL, 'verse', 'english', 'ltr', 'Rubáiyát of Omar Khayyám', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'verified', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (18, 7, NULL, 'the-moving-finger-writes-and-having-writ-moves-on-nor-all-thy-piety-nor-wit', 'The moving finger writes; and, having writ,
moves on: nor all thy piety nor wit
shall lure it back to cancel half a line,
nor all thy tears wash out a word of it.', NULL, NULL, NULL, NULL, 'verse', 'english', 'ltr', 'Rubáiyát of Omar Khayyám', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 1, 0, 'verified', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (19, 8, NULL, 'all-the-worlds-a-stage-and-all-the-men-and-women-merely-players-they-have-the', 'All the world''s a stage,
and all the men and women merely players;
they have their exits and their entrances,
and one man in his time plays many parts.', NULL, NULL, NULL, NULL, 'verse', 'english', 'ltr', 'As You Like It', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'verified', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (20, 8, NULL, 'to-be-or-not-to-be-that-is-the-question-whether-tis-nobler-in-the-mind-to-su', 'To be, or not to be, that is the question:
Whether ''tis nobler in the mind to suffer
the slings and arrows of outrageous fortune,
or to take arms against a sea of troubles,
and by opposing end them.', NULL, NULL, NULL, NULL, 'verse', 'english', 'ltr', 'Hamlet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'verified', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (21, 9, NULL, 'i-want-to-do-with-you-what-spring-does-with-the-cherry-trees', 'I want to do with you what spring does
with the cherry trees.', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'Every Day You Play', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 1, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (22, 9, NULL, 'love-is-so-short-forgetting-is-so-long', 'Love is so short, forgetting is so long.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Poetry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 1, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (23, 10, NULL, 'your-children-are-not-your-children-they-are-the-sons-and-daughters-of-lifes-l', 'Your children are not your children.
They are the sons and daughters
of Life''s longing for itself.
They come through you but not from you,
and though they are with you yet they belong not to you.', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'The Prophet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 1, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (24, 10, NULL, 'the-tenderness-of-sorrow-is-not-heavier-than-the-joy-of-letting-go', 'The tenderness of sorrow
is not heavier
than the joy of letting go.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Sand and Foam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (25, 10, NULL, 'love-knows-not-its-own-depth-until-the-hour-of-separation', 'Love knows not its own depth
until the hour of separation.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Sand and Foam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (26, 1, NULL, 'silence-is-the-language-of-god-all-else-is-poor-translation', 'Silence is the language of God,
all else is poor translation.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (27, 1, NULL, 'you-are-not-a-drop-in-the-ocean-you-are-the-entire-ocean-in-a-drop', 'You are not a drop in the ocean.
You are the entire ocean in a drop.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 1, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (28, 1, NULL, 'yesterday-i-was-clever-so-i-wanted-to-change-the-world-today-i-am-wise-so-i-a', 'Yesterday I was clever,
so I wanted to change the world.
Today I am wise,
so I am changing myself.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (29, 3, NULL, 'if-you-cry-because-the-sun-has-gone-out-of-your-life-your-tears-will-prevent-yo', 'If you cry because the sun has gone out of your life,
your tears will prevent you from seeing the stars.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (30, 5, NULL, 'even-after-all-this-time-the-sun-never-says-to-the-earth-you-owe-me-look-wh', 'Even after all this time,
the Sun never says to the Earth,
"You owe me."
Look what happens
with a love like that.
It lights
the whole sky.', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'The Sun Never Says', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 1, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (31, 6, NULL, 'whatever-makes-an-impression-on-the-heart-and-lovely-is-suitable-for-a-person-b', 'Whatever makes an impression on the heart
and lovely is suitable for a person.
Beauty is a gift of God.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Gulistan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (32, 10, NULL, 'work-is-love-made-visible-and-if-you-cannot-work-with-love-but-only-with-distas', 'Work is love made visible.
And if you cannot work with love but only with distaste,
it is better that you should leave your work
and sit at the gate of the temple
and take alms of those who work with joy.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Prophet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (33, 2, NULL, 'koi-ummeed-bar-nahn-t-koi-srat-nazar-nahn-t', 'Koi ummeed bar nahīn ātī,
koi sūrat nazar nahīn ātī.', NULL, 'No hope seems to be fulfilled,
no solution seems to be in sight.', NULL, NULL, 'ghazal', 'urdu', 'ltr', 'Diwan-e-Ghalib', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'verified', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (34, 9, NULL, 'i-can-write-the-saddest-lines-tonight-write-for-example-the-night-is-starry', 'I can write the saddest lines tonight.
Write, for example, "The night is starry
and the stars are blue and shiver in the distance."
The night wind revolves in the sky and sings.', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'Twenty Love Poems and a Song of Despair', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (35, 7, NULL, 'myself-when-young-did-eagerly-frequent-doctor-and-saint-and-heard-great-argumen', 'Myself when young did eagerly frequent
doctor and saint, and heard great argument
about it and about: but evermore
came out by the same door as in I went.', NULL, NULL, NULL, NULL, 'verse', 'english', 'ltr', 'Rubáiyát of Omar Khayyám', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'verified', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (36, NULL, NULL, 'this-being-human-is-a-guest-house-every-morning-a-new-arrival-a-joy-a-depress', 'This being human is a guest house.
Every morning a new arrival.
A joy, a depression, a meanness,
some momentary awareness comes
as an unexpected visitor.

Welcome and entertain them all!
Even if they''re a crowd of sorrows,
who violently sweep your house
empty of its furniture,
still, treat each guest honorably.
They may be clearing you out
for some new delight.

The dark thought, the shame, the malice,
meet them at the door laughing,
and invite them in.

Be grateful for whoever comes,
because each has been sent
as a guide from beyond.', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (37, NULL, NULL, 'your-task-is-not-to-seek-for-love-but-merely-to-seek-and-find-all-the-barriers', 'Your task is not to seek for love, but merely to seek and find all the barriers within yourself that you have built against it.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (38, NULL, NULL, 'stop-acting-so-small-you-are-the-universe-in-ecstatic-motion', 'Stop acting so small. You are the universe in ecstatic motion.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (39, NULL, NULL, 'raise-your-words-not-voice-it-is-rain-that-grows-flowers-not-thunder', 'Raise your words, not voice. It is rain that grows flowers, not thunder.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (40, NULL, NULL, 'dont-be-satisfied-with-stories-how-things-have-gone-with-others-unfold-your-o', 'Don''t be satisfied with stories, how things have gone with others. Unfold your own myth.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (41, NULL, NULL, 'if-you-are-irritated-by-every-rub-how-will-your-mirror-be-polished', 'If you are irritated by every rub, how will your mirror be polished?', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (42, NULL, NULL, 'when-you-do-things-from-your-soul-you-feel-a-river-moving-in-you-a-joy', 'When you do things from your soul, you feel a river moving in you, a joy.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (43, NULL, NULL, 'you-were-born-with-wings-why-prefer-to-crawl-through-life', 'You were born with wings, why prefer to crawl through life?', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (44, NULL, NULL, 'the-minute-i-heard-my-first-love-story-i-started-looking-for-you-not-knowing-h', 'The minute I heard my first love story,
I started looking for you,
not knowing how blind that was.

Lovers don''t finally meet somewhere.
They''re in each other all along.', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'The Illuminated Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (45, NULL, NULL, 'dance-when-youre-broken-open-dance-if-youve-torn-the-bandage-off-dance-in', 'Dance, when you''re broken open. Dance, if you''ve torn the bandage off. Dance in the middle of the fighting. Dance in your blood. Dance when you''re perfectly free.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (46, NULL, NULL, 'forget-safety-live-where-you-fear-to-live-destroy-your-reputation-be-notoriou', 'Forget safety. Live where you fear to live. Destroy your reputation. Be notorious.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (47, NULL, NULL, 'my-soul-is-from-elsewhere-im-sure-of-that-and-i-intend-to-end-up-there', 'My soul is from elsewhere, I''m sure of that, and I intend to end up there.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (48, NULL, NULL, 'sell-your-cleverness-and-buy-bewilderment', 'Sell your cleverness and buy bewilderment.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (49, NULL, NULL, 'in-your-light-i-learn-how-to-love-in-your-beauty-how-to-make-poems-you-dance', 'In your light I learn how to love. In your beauty, how to make poems. You dance inside my chest where no-one sees you, but sometimes I do, and that sight becomes this art.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (50, NULL, NULL, 'goodbyes-are-only-for-those-who-love-with-their-eyes-because-for-those-who-love', 'Goodbyes are only for those who love with their eyes. Because for those who love with heart and soul there is no such thing as separation.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (51, NULL, NULL, 'everything-in-the-universe-is-within-you-ask-all-from-yourself', 'Everything in the universe is within you. Ask all from yourself.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (52, NULL, NULL, 'where-there-is-ruin-there-is-hope-for-a-treasure', 'Where there is ruin, there is hope for a treasure.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (53, NULL, NULL, 'i-want-to-sing-like-the-birds-sing-not-worrying-about-who-hears-or-what-they-th', 'I want to sing like the birds sing, not worrying about who hears or what they think.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (54, NULL, NULL, 'knock-and-hell-open-the-door-vanish-and-hell-make-you-shine-like-the-sun-f', 'Knock, and He''ll open the door.
Vanish, and He''ll make you shine like the sun.
Fall, and He''ll raise you to the heavens.
Become nothing, and He''ll turn you into everything.', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (55, NULL, NULL, 'love-is-the-bridge-between-you-and-everything', 'Love is the bridge between you and everything.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (56, NULL, NULL, 'close-your-eyes-fall-in-love-stay-there', 'Close your eyes, fall in love, stay there.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (57, NULL, NULL, 'set-your-life-on-fire-seek-those-who-fan-your-flames', 'Set your life on fire. Seek those who fan your flames.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (58, NULL, NULL, 'lovely-days-dont-come-to-you-you-should-walk-to-them', 'Lovely days don''t come to you. You should walk to them.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (59, NULL, NULL, 'be-like-a-tree-and-let-the-dead-leaves-drop', 'Be like a tree and let the dead leaves drop.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (60, NULL, NULL, 'as-you-start-to-walk-on-the-way-the-way-appears', 'As you start to walk on the way, the way appears.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (61, NULL, NULL, 'life-is-a-balance-of-holding-on-and-letting-go', 'Life is a balance of holding on and letting go.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (62, NULL, NULL, 'oh-soul-you-worry-too-much-you-have-seen-your-own-strength-you-have-seen-your', 'Oh soul, you worry too much. You have seen your own strength. You have seen your own beauty. You have seen your golden wings. Why do you worry?', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (63, NULL, NULL, 'one-of-the-marvels-of-the-world-is-the-sight-of-a-soul-sitting-in-a-prison-with', 'One of the marvels of the world is the sight of a soul sitting in a prison with the key in its hand.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (64, NULL, NULL, 'sit-be-still-and-listen', 'Sit, be still, and listen.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (65, NULL, NULL, 'dance-until-you-shatter-yourself', 'Dance until you shatter yourself.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (66, NULL, NULL, 'respond-to-every-call-that-excites-your-spirit', 'Respond to every call that excites your spirit.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (67, NULL, NULL, 'let-yourself-become-living-poetry', 'Let yourself become living poetry.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (68, NULL, NULL, 'patience-is-the-key-to-joy', 'Patience is the key to joy.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (69, NULL, NULL, 'conventional-opinion-is-the-ruin-of-our-souls', 'Conventional opinion is the ruin of our souls.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (70, NULL, NULL, 'whatever-purifies-you-is-the-right-path', 'Whatever purifies you is the right path.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (71, NULL, NULL, 'the-world-is-a-mountain-in-which-your-words-are-echoed-back-to-you', 'The world is a mountain, in which your words are echoed back to you.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (72, NULL, NULL, 'seek-the-wisdom-that-will-untie-your-knot-seek-the-path-that-demands-your-whole', 'Seek the wisdom that will untie your knot. Seek the path that demands your whole being.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 1, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (73, NULL, NULL, 'grief-can-be-the-garden-of-compassion-if-you-keep-your-heart-open-through-every', 'Grief can be the garden of compassion. If you keep your heart open through everything, your pain can become your greatest ally in your life''s search for love and wisdom.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (74, NULL, NULL, 'your-depression-is-connected-to-your-insolence-and-refusal-to-praise', 'Your depression is connected to your insolence and refusal to praise.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (75, NULL, NULL, 'through-love-all-that-is-bitter-will-be-sweet-through-love-all-that-is-copper-w', 'Through Love all that is bitter will be sweet,
Through Love all that is copper will be gold,
Through Love all dregs will become wine,
Through Love all pain will turn to medicine.', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (76, NULL, NULL, 'this-is-love-to-fly-toward-a-secret-sky-to-cause-a-hundred-veils-to-fall-each', 'This is love: to fly toward a secret sky, to cause a hundred veils to fall each moment. First to let go of life. Finally, to take a step without feet.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (77, NULL, NULL, 'we-are-born-of-love-love-is-our-mother', 'We are born of love; Love is our mother.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (78, NULL, NULL, 'however-much-i-might-try-to-expound-or-explain-love-when-i-come-to-love-itself', 'However much I might try to expound or explain Love, when I come to Love itself, I am ashamed of my explanations. Love alone can explain the mysteries of love and lovers.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (79, NULL, NULL, 'everyone-has-been-made-for-some-particular-work-and-the-desire-for-that-work-ha', 'Everyone has been made for some particular work, and the desire for that work has been put in every heart.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (80, NULL, NULL, 'why-should-i-be-unhappy-every-parcel-of-my-being-is-in-full-bloom', 'Why should I be unhappy? Every parcel of my being is in full bloom.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (81, NULL, NULL, 'that-which-is-false-troubles-the-heart-but-truth-brings-joyous-tranquillity', 'That which is false troubles the heart, but truth brings joyous tranquillity.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (82, NULL, NULL, 'if-you-find-the-mirror-of-the-heart-dull-the-rust-has-not-been-cleared-from-its', 'If you find the mirror of the heart dull, the rust has not been cleared from its face.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (83, NULL, NULL, 'sunlight-fell-upon-the-wall-the-wall-received-a-borrowed-splendor-why-set-your', 'Sunlight fell upon the wall;
the wall received a borrowed splendor.
Why set your heart on a piece of earth, O simple one?
Seek out the source which shines forever.', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (84, NULL, NULL, 'i-am-neither-of-the-east-nor-of-the-west-no-boundaries-exist-within-my-breast', 'I am neither of the East nor of the West, no boundaries exist within my breast.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (85, NULL, NULL, 'let-the-beauty-of-what-you-love-be-what-you-do', 'Let the beauty of what you love be what you do.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (86, NULL, NULL, 'woman-is-a-ray-of-god-she-is-not-that-earthly-beloved-she-is-creative-not-cre', 'Woman is a ray of God. She is not that earthly beloved: she is creative, not created.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (87, NULL, NULL, 'there-are-a-thousand-ways-to-kneel-and-kiss-the-ground-there-are-a-thousand-way', 'There are a thousand ways to kneel and kiss the ground; there are a thousand ways to go home again.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (88, NULL, NULL, 'the-garden-of-love-is-green-without-limit-and-yields-many-fruits-other-than-sorr', 'The garden of love is green without limit and yields many fruits other than sorrow or joy. Love is beyond either condition: without spring, without autumn, it is always fresh.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (89, NULL, NULL, 'love-will-find-its-way-through-all-languages-on-its-own', 'Love will find its way through all languages on its own.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (90, NULL, NULL, 'you-know-the-value-of-every-article-of-merchandise-but-if-you-dont-know-the-va', 'You know the value of every article of merchandise, but if you don''t know the value of your own soul, it''s all foolishness.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (91, NULL, NULL, 'something-opens-our-wings-something-makes-boredom-and-hurt-disappear-someone-f', 'Something opens our wings. Something makes boredom and hurt disappear. Someone fills the cup in front of us: We taste only sacredness.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (92, NULL, NULL, 'there-is-an-invisible-strength-within-us-when-it-recognizes-two-opposing-object', 'There is an invisible strength within us; when it recognizes two opposing objects of desire, it grows stronger.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (93, NULL, NULL, 'i-have-no-companion-but-love-no-beginning-no-end-no-dawn-the-soul-calls-from', 'I have no companion but Love, no beginning, no end, no dawn. The Soul calls from within me: ''You, ignorant of the way of Love, set Me free.''', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (94, NULL, NULL, 'be-full-of-sorrow-that-you-may-become-a-hill-of-joy-weep-so-that-you-may-brea', 'Be full of sorrow, that you may become a hill of joy; weep, so that you may break into laughter.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (95, NULL, NULL, 'you-have-to-keep-breaking-your-heart-until-it-opens', 'You have to keep breaking your heart until it opens.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (96, NULL, NULL, 'let-the-lover-be-disgraceful-crazy-absentminded-someone-sober-will-worry-abou', 'Let the lover be disgraceful, crazy, absentminded. Someone sober will worry about things going badly. Let the lover be.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (97, NULL, NULL, 'your-heart-is-the-size-of-an-ocean-go-find-yourself-in-its-hidden-depths', 'Your heart is the size of an ocean. Go find yourself in its hidden depths.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (98, NULL, NULL, 'live-life-as-if-everything-is-rigged-in-your-favor', 'Live life as if everything is rigged in your favor.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (99, NULL, NULL, 'the-only-lasting-beauty-is-the-beauty-of-the-heart', 'The only lasting beauty is the beauty of the heart.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (100, NULL, NULL, 'this-is-a-subtle-truth-whatever-you-love-you-are', 'This is a subtle truth. Whatever you love you are.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (101, NULL, NULL, 'in-each-moment-the-fire-rages-it-will-burn-away-a-hundred-veils-and-carry-you', 'In each moment the fire rages, it will burn away a hundred veils. And carry you a thousand steps toward your goal.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (102, NULL, NULL, 'anyone-who-genuinely-and-consistently-with-both-hands-looks-for-something-w', 'Anyone who genuinely and consistently — with both hands — looks for something, will find it.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (103, NULL, NULL, 'you-have-escaped-the-cage-your-wings-are-stretched-out-now-fly', 'You have escaped the cage. Your wings are stretched out. Now fly!', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (104, NULL, NULL, 'know-then-that-the-body-is-merely-a-garment-go-seek-the-wearer-not-the-cloak', 'Know then that the body is merely a garment. Go seek the wearer, not the cloak.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (105, NULL, NULL, 'all-doubt-despair-and-fear-become-insignificant-when-the-intention-of-life-beco', 'All doubt, despair and fear become insignificant when the intention of life becomes love.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (106, NULL, NULL, 'wherever-you-stand-be-the-soul-of-that-place-and-recognize-the-souls-around-you', 'Wherever you stand be the soul of that place, and recognize the souls around you.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (107, NULL, NULL, 'there-is-a-candle-in-your-heart-ready-to-be-kindled-there-is-a-void-in-your-so', 'There is a candle in your heart, ready to be kindled. There is a void in your soul, ready to be filled. You feel it, don''t you.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (108, NULL, NULL, 'you-were-born-with-potential-you-were-born-with-goodness-and-trust-you-were-bo', 'You were born with potential. You were born with goodness and trust. You were born with ideals and dreams. You were born with greatness. You were born with wings!', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (109, NULL, NULL, 'before-you-speak-let-your-words-pass-through-three-gates-at-the-first-gate-ask', 'Before you speak, let your words pass through three gates. At the first gate ask yourself: "Is it true?" At the second gate ask: "Is it necessary?" At the third gate ask: "Is it kind?"', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (110, NULL, NULL, 'words-are-a-pretext-it-is-the-inner-bond-that-draws-one-person-to-another-not', 'Words are a pretext. It is the inner bond that draws one person to another, not words.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (111, NULL, NULL, 'as-you-live-deeper-in-the-heart-the-mirror-gets-clearer-and-clearer', 'As you live deeper in the heart, the mirror gets clearer and clearer.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (112, NULL, NULL, 'only-from-the-heart-can-you-touch-the-sky', 'Only from the heart can you touch the sky.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (113, NULL, NULL, 'your-heart-and-my-heart-are-very-very-old-friends', 'Your heart and my heart are very, very old friends.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (114, NULL, NULL, 'these-pains-you-feel-are-messengers-listen-to-them', 'These pains you feel are messengers. Listen to them.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (115, NULL, NULL, 'let-silence-take-you-to-the-core-of-life', 'Let silence take you to the core of life.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (116, NULL, NULL, 'the-quieter-you-become-the-more-you-are-able-to-hear', 'The quieter you become the more you are able to hear.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (117, NULL, NULL, 'to-love-is-human-to-feel-pain-is-human-yet-to-still-love-despite-the-pain-tha', 'To love is human. To feel pain is human. Yet to still love despite the pain, that is pure angel.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (118, NULL, NULL, 'the-cure-for-the-pain-is-in-the-pain-good-and-bad-are-mixed-if-you-dont-mix-t', 'The cure for the pain is in the pain. Good and bad are mixed. If you don''t mix them, you get neither.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (119, NULL, NULL, 'sorrow-prepares-you-for-joy-it-violently-sweeps-everything-out-of-your-house-s', 'Sorrow prepares you for joy. It violently sweeps everything out of your house, so that new joy can find space to enter.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (120, NULL, NULL, 'we-carry-inside-us-the-wonders-we-seek-outside-us', 'We carry inside us the wonders we seek outside us.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (121, NULL, NULL, 'when-i-die-when-my-coffin-is-being-taken-out-you-must-never-think-i-am-missing', 'When I die,
when my coffin is being taken out,
you must never think I am missing this world.
Don''t shed any tears.
Don''t lament or feel sorry.
I am not falling into a monster''s abyss.
Forever, forever, I shall remain in love.', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 1, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (122, NULL, NULL, 'at-the-end-of-my-life-with-just-one-breath-left-if-you-come-i-will-sit-up-and', 'At the end of my life, with just one breath left, if you come, I will sit up and sing.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (123, NULL, NULL, 'i-am-not-this-hair-i-am-not-this-skin-i-am-the-soul-that-lives-within', 'I am not this hair, I am not this skin, I am the soul that lives within.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (124, NULL, NULL, 'be-a-lamp-or-a-lifeboat-or-a-ladder-help-someones-soul-heal-walk-out-of-you', 'Be a lamp, or a lifeboat, or a ladder.
Help someone''s soul heal.
Walk out of your house like a shepherd.', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (125, NULL, NULL, 'come-come-whoever-you-are-wanderer-worshiper-lover-of-leaving-it-doesnt-m', 'Come, come, whoever you are.
Wanderer, worshiper, lover of leaving.
It doesn''t matter.
Ours is not a caravan of despair.
Come, even if you have broken your vows a thousand times.
Come, yet again, come, come.', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (126, NULL, NULL, 'what-hurts-you-blesses-you-darkness-is-your-candle', 'What hurts you, blesses you. Darkness is your candle.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (127, NULL, NULL, 'the-soul-is-here-for-its-own-joy', 'The soul is here for its own joy.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (128, NULL, NULL, 'the-art-of-knowing-is-knowing-what-to-ignore', 'The art of knowing is knowing what to ignore.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (129, NULL, NULL, 'a-lifetime-without-love-is-of-no-account-love-is-the-water-of-life', 'A lifetime without Love is of no account. Love is the Water of Life.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (130, NULL, NULL, 'i-have-lived-on-the-lip-of-insanity-wanting-to-know-reasons-knocking-on-a-door', 'I have lived on the lip of insanity,
wanting to know reasons,
knocking on a door.
It opens.
"I''ve been knocking from within!"', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (131, NULL, NULL, 'what-was-said-to-the-rose-that-made-it-open-was-said-to-me-here-in-my-chest', 'What was said to the rose that made it open
was said to me here in my chest.', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (132, NULL, NULL, 'if-light-is-in-your-heart-you-will-always-be-led-toward-the-path-of-return', 'If light is in your heart, you will always be led toward the path of return.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (133, NULL, NULL, 'be-with-those-who-help-your-being', 'Be with those who help your being.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (134, NULL, NULL, 'the-grounds-generosity-takes-in-our-compost-and-grows-beauty-try-to-be-more-li', 'The ground''s generosity takes in our compost and grows beauty! Try to be more like the ground.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 1, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (135, NULL, NULL, 'let-the-waters-settle-and-you-will-see-the-moon-and-the-stars-mirrored-in-your-o', 'Let the waters settle and you will see the moon and the stars mirrored in your own being.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (136, NULL, NULL, 'a-thousand-half-loves-must-be-forsaken-to-take-one-whole-heart-home', 'A thousand half-loves must be forsaken to take one whole heart home.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (137, NULL, NULL, 'love-is-the-whole-thing-we-are-only-pieces', 'Love is the whole thing. We are only pieces.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (138, NULL, NULL, 'your-grief-for-what-youve-lost-holds-a-mirror-up-to-where-youre-bravely-workin', 'Your grief for what you''ve lost holds a mirror up to where you''re bravely working.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (139, NULL, NULL, 'i-didnt-come-here-of-my-own-accord-and-i-cant-leave-that-way', 'I didn''t come here of my own accord, and I can''t leave that way.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (140, NULL, NULL, 'we-are-as-the-flute-and-the-music-in-us-is-from-thee-we-are-as-the-mountain-a', 'We are as the flute, and the music in us is from thee;
we are as the mountain, and the echo in us is from thee.', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 1, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (141, NULL, NULL, 'soul-receives-from-soul-that-knowledge-therefore-not-by-book-nor-from-tongue', 'Soul receives from soul that knowledge, therefore not by book nor from tongue.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Fihi Ma Fihi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (142, NULL, NULL, 'if-thou-wilt-be-observant-and-vigilant-thou-wilt-see-at-every-moment-the-respon', 'If thou wilt be observant and vigilant, thou wilt see at every moment the response to thy action. Be observant if thou wouldst have a pure heart, for something is born to thee in consequence of every action.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (143, NULL, NULL, 'our-death-is-our-wedding-with-eternity', 'Our death is our wedding with eternity.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (144, NULL, NULL, 'why-when-gods-world-is-so-big-did-you-fall-asleep-in-a-prison-of-all-places', 'Why, when God''s world is so big,
did you fall asleep in a prison of all places?', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (145, NULL, NULL, 'your-heart-knows-the-way-run-in-that-direction', 'Your heart knows the way. Run in that direction.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (146, NULL, NULL, 'wherever-you-are-and-whatever-you-do-be-in-love', 'Wherever you are, and whatever you do, be in love.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (147, NULL, NULL, 'in-silence-there-is-eloquence-stop-weaving-and-see-how-the-pattern-improves', 'In Silence there is eloquence.
Stop weaving and see how the pattern improves.', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (148, NULL, NULL, 'you-are-the-soul-of-the-soul-of-the-universe-and-your-name-is-love', 'You are the soul of the soul of the universe, and your name is Love.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (149, NULL, NULL, 'i-died-from-minerality-and-became-vegetable-and-from-vegetativeness-i-died-and', 'I died from minerality and became vegetable;
and from vegetativeness I died and became animal.
I died from animality and became man.
Then why fear disappearance through death?
Next time I shall die
bringing forth wings and feathers like angels:
after that, soaring higher than angels —
what you cannot imagine,
I shall be that.', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (150, NULL, NULL, 'why-do-you-stay-in-prison-when-the-door-is-so-wide-open', 'Why do you stay in prison
when the door is so wide open?', NULL, NULL, NULL, NULL, 'poetry', 'english', 'ltr', 'Masnavi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (151, NULL, NULL, 'try-not-to-resist-the-changes-that-come-your-way-instead-let-life-live-through', 'Try not to resist the changes that come your way. Instead let life live through you.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'The Essential Rumi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (152, NULL, NULL, 'ignoring-your-own-heart-is-the-most-dangerous-and-painful-thing', 'Ignoring your own heart is the most dangerous and painful thing.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');
INSERT INTO writings (id, author_id, title, slug, text, original_text, english_translation, bangla_translation, urdu_translation, type, language, direction, source, source_url, translator, source_book, source_chapter, source_page, source_notes, date, status, featured, editors_pick, verification_status, views, saves, created_at, updated_at) VALUES (153, NULL, NULL, 'look-inside-yourself-everything-that-you-want-you-already-are', 'Look inside yourself; everything that you want, you already are.', NULL, NULL, NULL, NULL, 'quote', 'english', 'ltr', 'Diwan-e-Shams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'published', 0, 0, 'attributed', 0, 0, '2026-09-16 09:58:35', '2026-09-16 09:58:35');

INSERT INTO writing_categories (writing_id, category_id) VALUES (1, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (1, 4);
INSERT INTO writing_categories (writing_id, category_id) VALUES (2, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (2, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (3, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (3, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (4, 4);
INSERT INTO writing_categories (writing_id, category_id) VALUES (4, 18);
INSERT INTO writing_categories (writing_id, category_id) VALUES (5, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (5, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (6, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (6, 3);
INSERT INTO writing_categories (writing_id, category_id) VALUES (7, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (7, 13);
INSERT INTO writing_categories (writing_id, category_id) VALUES (8, 13);
INSERT INTO writing_categories (writing_id, category_id) VALUES (8, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (9, 11);
INSERT INTO writing_categories (writing_id, category_id) VALUES (9, 4);
INSERT INTO writing_categories (writing_id, category_id) VALUES (10, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (10, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (11, 17);
INSERT INTO writing_categories (writing_id, category_id) VALUES (11, 11);
INSERT INTO writing_categories (writing_id, category_id) VALUES (12, 11);
INSERT INTO writing_categories (writing_id, category_id) VALUES (12, 16);
INSERT INTO writing_categories (writing_id, category_id) VALUES (12, 12);
INSERT INTO writing_categories (writing_id, category_id) VALUES (13, 17);
INSERT INTO writing_categories (writing_id, category_id) VALUES (13, 4);
INSERT INTO writing_categories (writing_id, category_id) VALUES (14, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (14, 4);
INSERT INTO writing_categories (writing_id, category_id) VALUES (14, 15);
INSERT INTO writing_categories (writing_id, category_id) VALUES (15, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (16, 11);
INSERT INTO writing_categories (writing_id, category_id) VALUES (16, 8);
INSERT INTO writing_categories (writing_id, category_id) VALUES (17, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (17, 7);
INSERT INTO writing_categories (writing_id, category_id) VALUES (17, 16);
INSERT INTO writing_categories (writing_id, category_id) VALUES (18, 14);
INSERT INTO writing_categories (writing_id, category_id) VALUES (18, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (18, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (19, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (19, 14);
INSERT INTO writing_categories (writing_id, category_id) VALUES (19, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (20, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (20, 17);
INSERT INTO writing_categories (writing_id, category_id) VALUES (20, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (21, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (21, 13);
INSERT INTO writing_categories (writing_id, category_id) VALUES (21, 7);
INSERT INTO writing_categories (writing_id, category_id) VALUES (22, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (22, 3);
INSERT INTO writing_categories (writing_id, category_id) VALUES (22, 18);
INSERT INTO writing_categories (writing_id, category_id) VALUES (23, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (23, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (23, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (24, 3);
INSERT INTO writing_categories (writing_id, category_id) VALUES (24, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (24, 18);
INSERT INTO writing_categories (writing_id, category_id) VALUES (25, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (25, 3);
INSERT INTO writing_categories (writing_id, category_id) VALUES (26, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (26, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (27, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (27, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (28, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (28, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (29, 4);
INSERT INTO writing_categories (writing_id, category_id) VALUES (29, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (30, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (30, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (30, 7);
INSERT INTO writing_categories (writing_id, category_id) VALUES (31, 15);
INSERT INTO writing_categories (writing_id, category_id) VALUES (31, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (32, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (32, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (33, 3);
INSERT INTO writing_categories (writing_id, category_id) VALUES (33, 10);
INSERT INTO writing_categories (writing_id, category_id) VALUES (34, 3);
INSERT INTO writing_categories (writing_id, category_id) VALUES (34, 7);
INSERT INTO writing_categories (writing_id, category_id) VALUES (34, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (35, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (35, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (36, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (36, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (36, 4);
INSERT INTO writing_categories (writing_id, category_id) VALUES (36, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (37, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (37, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (38, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (38, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (39, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (39, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (40, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (40, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (40, 17);
INSERT INTO writing_categories (writing_id, category_id) VALUES (41, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (41, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (42, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (42, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (43, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (43, 17);
INSERT INTO writing_categories (writing_id, category_id) VALUES (44, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (45, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (45, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (46, 17);
INSERT INTO writing_categories (writing_id, category_id) VALUES (46, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (47, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (47, 9);
INSERT INTO writing_categories (writing_id, category_id) VALUES (48, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (48, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (49, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (49, 15);
INSERT INTO writing_categories (writing_id, category_id) VALUES (50, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (50, 18);
INSERT INTO writing_categories (writing_id, category_id) VALUES (51, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (51, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (52, 4);
INSERT INTO writing_categories (writing_id, category_id) VALUES (52, 3);
INSERT INTO writing_categories (writing_id, category_id) VALUES (53, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (53, 15);
INSERT INTO writing_categories (writing_id, category_id) VALUES (53, 7);
INSERT INTO writing_categories (writing_id, category_id) VALUES (54, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (54, 12);
INSERT INTO writing_categories (writing_id, category_id) VALUES (55, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (55, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (56, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (57, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (57, 17);
INSERT INTO writing_categories (writing_id, category_id) VALUES (58, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (58, 4);
INSERT INTO writing_categories (writing_id, category_id) VALUES (59, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (59, 18);
INSERT INTO writing_categories (writing_id, category_id) VALUES (59, 7);
INSERT INTO writing_categories (writing_id, category_id) VALUES (60, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (60, 12);
INSERT INTO writing_categories (writing_id, category_id) VALUES (61, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (61, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (62, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (62, 4);
INSERT INTO writing_categories (writing_id, category_id) VALUES (63, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (63, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (64, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (64, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (65, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (65, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (66, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (66, 17);
INSERT INTO writing_categories (writing_id, category_id) VALUES (67, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (67, 15);
INSERT INTO writing_categories (writing_id, category_id) VALUES (68, 4);
INSERT INTO writing_categories (writing_id, category_id) VALUES (68, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (69, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (70, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (70, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (71, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (71, 11);
INSERT INTO writing_categories (writing_id, category_id) VALUES (72, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (72, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (73, 3);
INSERT INTO writing_categories (writing_id, category_id) VALUES (73, 4);
INSERT INTO writing_categories (writing_id, category_id) VALUES (74, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (74, 3);
INSERT INTO writing_categories (writing_id, category_id) VALUES (75, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (75, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (76, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (77, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (77, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (78, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (78, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (79, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (79, 11);
INSERT INTO writing_categories (writing_id, category_id) VALUES (80, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (80, 4);
INSERT INTO writing_categories (writing_id, category_id) VALUES (81, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (81, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (82, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (82, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (83, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (83, 12);
INSERT INTO writing_categories (writing_id, category_id) VALUES (84, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (84, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (85, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (85, 15);
INSERT INTO writing_categories (writing_id, category_id) VALUES (86, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (86, 11);
INSERT INTO writing_categories (writing_id, category_id) VALUES (87, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (87, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (88, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (88, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (89, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (89, 11);
INSERT INTO writing_categories (writing_id, category_id) VALUES (90, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (90, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (91, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (91, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (92, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (92, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (93, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (93, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (94, 3);
INSERT INTO writing_categories (writing_id, category_id) VALUES (94, 4);
INSERT INTO writing_categories (writing_id, category_id) VALUES (95, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (95, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (96, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (97, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (97, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (98, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (98, 4);
INSERT INTO writing_categories (writing_id, category_id) VALUES (99, 15);
INSERT INTO writing_categories (writing_id, category_id) VALUES (99, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (100, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (100, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (101, 17);
INSERT INTO writing_categories (writing_id, category_id) VALUES (101, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (102, 4);
INSERT INTO writing_categories (writing_id, category_id) VALUES (102, 12);
INSERT INTO writing_categories (writing_id, category_id) VALUES (103, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (103, 17);
INSERT INTO writing_categories (writing_id, category_id) VALUES (104, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (104, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (105, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (105, 4);
INSERT INTO writing_categories (writing_id, category_id) VALUES (106, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (106, 11);
INSERT INTO writing_categories (writing_id, category_id) VALUES (107, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (107, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (108, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (108, 4);
INSERT INTO writing_categories (writing_id, category_id) VALUES (109, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (109, 11);
INSERT INTO writing_categories (writing_id, category_id) VALUES (110, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (110, 11);
INSERT INTO writing_categories (writing_id, category_id) VALUES (111, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (112, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (112, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (113, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (113, 8);
INSERT INTO writing_categories (writing_id, category_id) VALUES (114, 3);
INSERT INTO writing_categories (writing_id, category_id) VALUES (114, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (114, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (115, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (115, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (116, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (116, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (117, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (117, 11);
INSERT INTO writing_categories (writing_id, category_id) VALUES (118, 3);
INSERT INTO writing_categories (writing_id, category_id) VALUES (118, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (119, 3);
INSERT INTO writing_categories (writing_id, category_id) VALUES (119, 4);
INSERT INTO writing_categories (writing_id, category_id) VALUES (120, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (120, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (121, 9);
INSERT INTO writing_categories (writing_id, category_id) VALUES (121, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (121, 12);
INSERT INTO writing_categories (writing_id, category_id) VALUES (122, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (122, 9);
INSERT INTO writing_categories (writing_id, category_id) VALUES (123, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (124, 11);
INSERT INTO writing_categories (writing_id, category_id) VALUES (124, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (125, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (125, 12);
INSERT INTO writing_categories (writing_id, category_id) VALUES (126, 3);
INSERT INTO writing_categories (writing_id, category_id) VALUES (126, 4);
INSERT INTO writing_categories (writing_id, category_id) VALUES (127, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (127, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (128, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (129, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (130, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (130, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (131, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (131, 15);
INSERT INTO writing_categories (writing_id, category_id) VALUES (132, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (132, 4);
INSERT INTO writing_categories (writing_id, category_id) VALUES (133, 8);
INSERT INTO writing_categories (writing_id, category_id) VALUES (133, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (134, 7);
INSERT INTO writing_categories (writing_id, category_id) VALUES (134, 11);
INSERT INTO writing_categories (writing_id, category_id) VALUES (135, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (135, 7);
INSERT INTO writing_categories (writing_id, category_id) VALUES (136, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (137, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (138, 3);
INSERT INTO writing_categories (writing_id, category_id) VALUES (138, 4);
INSERT INTO writing_categories (writing_id, category_id) VALUES (139, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (139, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (140, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (141, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (141, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (142, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (142, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (143, 9);
INSERT INTO writing_categories (writing_id, category_id) VALUES (143, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (144, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (144, 12);
INSERT INTO writing_categories (writing_id, category_id) VALUES (145, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (145, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (146, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (146, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (147, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (147, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (148, 1);
INSERT INTO writing_categories (writing_id, category_id) VALUES (148, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (149, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (149, 9);
INSERT INTO writing_categories (writing_id, category_id) VALUES (149, 12);
INSERT INTO writing_categories (writing_id, category_id) VALUES (150, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (150, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (151, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (151, 5);
INSERT INTO writing_categories (writing_id, category_id) VALUES (152, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (152, 2);
INSERT INTO writing_categories (writing_id, category_id) VALUES (153, 6);
INSERT INTO writing_categories (writing_id, category_id) VALUES (153, 2);

INSERT INTO daily_words (id, writing_id, date, created_at) VALUES (1, 143, '2026-09-16', '2026-09-16 09:58:35');

