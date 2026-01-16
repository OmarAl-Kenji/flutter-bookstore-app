class Book {
  final String title;
  final String author;
  final String imagePath;
  final String category;
  final double price;
  final String description;
  final int id;

  Book({
    required this.title,
    required this.author,
    required this.imagePath,
    required this.category,
    required this.price,
    required this.description,
    required this.id,
  });
}

final List<Book> books = [
  Book(
    title: 'Harry Potter and the Sorcerer\'s Stone',
    author: 'J.K. Rowling',
    imagePath: 'images/Harry_Potter_1_fantasy_J.K._Rowling.jpg',
    category: 'Fantasy',
    price: 14.99,
    description:
        'A young wizard begins his magical journey at Hogwarts School. Facing dark forces, he discovers his destiny.',
    id:1,
  ),
  Book(
    title: 'The Hobbit',
    author: 'J.R.R. Tolkien',
    imagePath: 'images/The_Hobbit_fantasy_J.R.R._Tolkien.jpg',
    category: 'Fantasy',
    price: 13.49,
    description:
        'Bilbo Baggins joins a quest to reclaim a lost kingdom. Along the way, he finds courage and a mysterious ring.',
    id:2,
  ),
  Book(
    title: 'The Name of the Wind',
    author: 'Patrick Rothfuss',
    imagePath: 'images/The_Name_of_the_Wind_fantasy_Patrick_Rothfuss.jpg',
    category: 'Fantasy',
    price: 15.25,
    description:
        'Kvothe recounts his life as a gifted student and fugitive. A lyrical tale of magic, loss, and survival.',
    id:3,
  ),
  Book(
    title: 'A Game of Thrones',
    author: 'George R.R. Martin',
    imagePath: 'images/Game_of_Thrones_fantasy_George_R.R._Martin.jpg',
    category: 'Fantasy',
    price: 16.99,
    description:
        'Noble families vie for power in a realm where winter is coming. Betrayal and war shape the fate of kingdoms.',
    id:4,
  ),
  Book(
    title: 'Eragon',
    author: 'Christopher Paolini',
    imagePath: 'images/Eragon_fantasy_Christopher_Paolini.jpg',
    category: 'Fantasy',
    price: 12.75,
    description:
        'A farm boy discovers a dragon egg and is thrust into a fight against a tyrant. A journey of magic and rebellion.',
    id:5,
  ),

  Book(
    title: '1984',
    author: 'George Orwell',
    imagePath: 'images/1984_George_Orwell_Literary.jpg',
    category: 'Literary',
    price: 11.99,
    description:
        'In a totalitarian future, one man dares to think freely. A chilling vision of surveillance and control.',
    id:6,
  ),
  Book(
    title: 'Pride and Prejudice',
    author: 'Jane Austen',
    imagePath: 'images/Pride_and_Prejudice_Jane_Austen_Literary.jpg',
    category: 'Literary',
    price: 10.50,
    description:
        'Elizabeth Bennet navigates love and class in 19th-century England. A witty romance filled with social insight.',
    id:7,
  ),
  Book(
    title: 'The Road',
    author: 'Cormac McCarthy',
    imagePath: 'images/The_Road_-_Cormac_McCarthy_Literary.jpg',
    category: 'Literary',
    price: 13.20,
    description:
        'A father and son journey through a post-apocalyptic wasteland. A bleak yet powerful story of love and survival.',
    id:8,
  ),
  Book(
    title: 'To Kill a Mockingbird',
    author: 'Harper Lee',
    imagePath: 'images/To_Kill_a_Mockingbird_Harper_Lee_Literary.jpg',
    category: 'Literary',
    price: 12.99,
    description:
        'In a racially divided town, a young girl learns about justice and prejudice through her father’s eyes.',
    id:9,
  ),
  Book(
    title: 'Gone Girl',
    author: 'Gillian Flynn',
    imagePath: 'images/Gone_Girl_-_Gillian_Flynn_Mystery.jpg',
    category: 'Mystery',
    price: 14.30,
    description:
        'A woman disappears, leaving behind secrets and lies. A twisted psychological thriller with shocking turns.',
    id:10,
  ),
  Book(
    title: 'The Da Vinci Code',
    author: 'Dan Brown',
    imagePath: 'images/The_Da_Vinci_Code_-_Dan_Brown_Mystery.jpg',
    category: 'Mystery',
    price: 13.99,
    description:
        'A symbologist uncovers a secret hidden in art and history. A fast-paced quest through Europe and religion.',
    id:11,
  ),
  Book(
    title: 'The Girl with the Dragon Tattoo',
    author: 'Stieg Larsson',
    imagePath:
        'images/The_Girl_with_the_Dragon_Tattoo_-_Stieg_Larsson_Mystery.jpg',
    category: 'Mystery',
    price: 15.40,
    description:
        'A journalist and hacker uncover dark family secrets. A gripping mystery packed with suspense and intrigue.',
    id:12,
  ),
  Book(
    title: 'The Silent Patient',
    author: 'Alex Michaelides',
    imagePath: 'images/The_Silent_Patient_-_Alex_Michaelides_Mystery.jpg',
    category: 'Mystery',
    price: 14.75,
    description:
        'A woman stops speaking after a shocking crime. A psychotherapist is determined to uncover her truth.',
    id:13,
  ),
  Book(
    title: 'The Kite Runner',
    author: 'Khaled Hosseini',
    imagePath: 'images/The_Kite_Runner_-_Khaled_Hosseini_Drama.jpg',
    category: 'Drama',
    price: 12.90,
    description:
        'A tale of friendship and betrayal in Afghanistan. One man seeks redemption for a childhood mistake.',
    id:14,
  ),
  Book(
    title: 'The Fault in Our Stars',
    author: 'John Green',
    imagePath: 'images/The_Fault_in_Our_Stars_-_John_Green_Drama.jpg',
    category: 'Drama',
    price: 11.80,
    description:
        'Two teens with cancer fall in love. A bittersweet story about life, love, and the meaning of forever.',
    id:15,
  ),
  Book(
    title: 'A Thousand Splendid Suns',
    author: 'Khaled Hosseini',
    imagePath: 'images/A_Thousand_Splendid_Suns_-_Khaled_Hosseini_Drama.jpg',
    category: 'Drama',
    price: 13.50,
    description:
        'Two women endure hardship in war-torn Afghanistan. A moving story of sacrifice, resilience, and hope.',
    id:16,
  ),
  Book(
    title: 'Memoirs of a Geisha',
    author: 'Arthur Golden',
    imagePath: 'images/Memoirs_of_a_Geisha_-_Arthur_Golden_Drama.jpg',
    category: 'Drama',
    price: 14.00,
    description:
        'A young girl becomes a legendary geisha. A beautifully written tale of beauty, art, and endurance.',
    id:17,
  ),
  Book(
    title: 'The Alchemist',
    author: 'Paulo Coelho',
    imagePath: 'images/The_Alchemist_-_Paulo_Coelho_Drama.jpg',
    category: 'Drama',
    price: 12.60,
    description:
        'A shepherd follows his dream of treasure across the desert. A spiritual journey about destiny and purpose.',
    id:18,
  ),
  Book(
    title: 'Sapiens: A Brief History of Humankind',
    author: 'Yuval Noah Harari',
    imagePath: 'images/Sapiens_-_Yuval_Noah_Harari_History.jpg',
    category: 'History',
    price: 17.99,
    description:
        'An exploration of human history from the Stone Age to today. How we shaped the world and ourselves.',
    id:19,
  ),
  Book(
    title: 'Guns, Germs, and Steel',
    author: 'Jared Diamond',
    imagePath: 'images/Guns_Germs_and_Steel_-_Jared_Diamond_History.jpg',
    category: 'History',
    price: 16.50,
    description:
        'Why some societies advanced and others didn’t. A sweeping look at geography, biology, and technology.',
    id:20,
  ),
  Book(
    title: 'The Silk Roads',
    author: 'Peter Frankopan',
    imagePath: 'images/The_Silk_Roads_-_Peter_Frankopan_History.jpg',
    category: 'History',
    price: 15.80,
    description:
        'A new perspective on global history centered around Asia. Trade, culture, and power converge across centuries.',
    id:21,
  ),
  Book(
    title: 'The Wright Brothers',
    author: 'David McCullough',
    imagePath: 'images/The_Wright_Brothers_-_David_McCullough_History.jpg',
    category: 'History',
    price: 14.60,
    description:
        'The story of the pioneers of flight. A rich biography of innovation, persistence, and family support.',
    id:22,
  ),
  Book(
    title: 'The Diary of a Young Girl',
    author: 'Anne Frank',
    imagePath: 'images/The_Diary_of_a_Young_Girl_-_Anne_Frank_History.jpg',
    category: 'History',
    price: 11.30,
    description:
        'The true diary of a Jewish girl in hiding during WWII. A voice of hope and humanity in dark times.',
    id:23,
  ),
  Book(
    title: 'When Breath Becomes Air',
    author: 'Paul Kalanithi',
    imagePath: 'images/When_Breath_Becomes_Air_-_Paul_Kalanithi_Medical.jpg',
    category: 'Medical',
    price: 13.40,
    description:
        'A neurosurgeon faces terminal illness. A touching reflection on life, death, and the human spirit.',
    id:24,
  ),
  Book(
    title: 'The Man Who Mistook His Wife for a Hat',
    author: 'Oliver Sacks',
    imagePath:
        'images/The_Man_Who_Mistook_His_Wife_for_a_Hat_-_Oliver_Sacks_Medical.jpg',
    category: 'Medical',
    price: 12.75,
    description:
        'A collection of real neurological case studies. Insightful, strange, and deeply human.',
    id:25,
  ),
  Book(
    title: 'Being Mortal',
    author: 'Atul Gawande',
    imagePath: 'images/Being_Mortal_-_Atul_Gawande_Medical.jpg',
    category: 'Medical',
    price: 14.20,
    description:
        'How medicine can improve life—and death. A compassionate look at aging, care, and dignity.',
    id:26,
  ),
  Book(
    title: 'The Emperor of All Maladies',
    author: 'Siddhartha Mukherjee',
    imagePath:
        'images/The_Emperor_of_All_Maladies_-_Siddhartha_Mukherjee_Medical.jpg',
    category: 'Medical',
    price: 16.00,
    description:
        'A biography of cancer from ancient times to today. Blending science, history, and personal stories.',
    id:27,
  ),
  Book(
    title: 'Brain on Fire',
    author: 'Susannah Cahalan',
    imagePath: 'images/Brain_on_Fire_-_Susannah_Cahalan_Medical.jpg',
    category: 'Medical',
    price: 13.85,
    description:
        'A journalist\’s battle with a rare brain illness. A gripping medical mystery and path to recovery.',
    id:28,
  ),
    Book(
    title: "Life of Pi",
    author: "Yann Martel",
    imagePath: "images/Life_of_Pi_-_Yann_Martel_Fantasy.jpg",
    category: "Fantasy",
    price: 14.99,
    description:"After a shipwreck, a young boy named Pi is stranded on a lifeboat with a Bengal tiger. Together, they embark on a surreal journey of survival and faith across the Pacific Ocean.",
    id:100,
  )
];
