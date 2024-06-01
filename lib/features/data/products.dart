import 'models/product.dart';


List<Product> products = [
   Product(
    id: 1,
    name: "Tractor",
    description:
        "Exence the power of modern farming with our robust tractor. Whether you're tending to vast fields or small plots, this versatile machine ensures efficiency and precision. Its ergonomic design and advanced features make it a must-have for any farmer.",
    image: 'assets/tractor.jpg',
    price: 40.00,
    unit: 'day(s)',
    rating: 4.35, count: 1,
  ),
   Product(
    id: 2,
     count: 1,
    name: "Plough Equipment",
    description:
        "Helps to control weeds, manage crop residues, and improve water infiltration. Over time, various types of ploughs have been developed, including traditional moldboard ploughs and modern, more specialized designs",
    image: 'assets/fruit.jpg',
    price: 500,
    unit: 'hr',
    rating: 3.86,
  ),
   Product(
    id: 3,
    count: 1,
    name: "Gardener's Rake",
    description:
        "Maintain a pristine garden with our high-quality gardener's rake. Its sturdy build and well-designed tines make it easy to gather leaves, debris, and soil efficiently. Whether you're a seasoned gardener or just starting out, this tool is a reliable companion.",
    image: 'assets/rake.jpg',
    price: 8.44,
    unit: 'piece',
    rating: 4.18,
  ),
   Product(
    id:4,
     count: 1,
    name: "Premium Seeds",
    description:
        "Embark on a journey of cultivation with our premium seeds collection. From vibrant flowers to nutritious vegetables, these carefully selected seeds promise a bountiful and thriving garden. Nurture your green thumb with the best nature has to offer.",
    image: 'assets/seeds.jpg',
    price: 114.52,
    unit: 'kg',
    rating: 5.0,
  ),
   Product(
    id: 5,
     count: 1,
    name: "Sturdy Shovel",
    description:
        "Conquer your landscaping and gardening tasks with our durable and versatile shovel. Built to withstand demanding work, its ergonomic handle and robust blade make digging, lifting, and moving materials a breeze. Elevate your outdoor projects with this essential tool.",
    image: 'assets/shovel.jpg',
    price: 11,
    unit: 'piece',
    rating: 5.0,
  ),
   Product(
    id: 6,
     count: 1,
    name: "Harvester",
    description:
        "specialized for different crops like wheat, corn, or rice, contributing to increased productivity, reduced labor, and overall farm efficiency",
    image: 'assets/tomato.jpg',
    price: 1000,
    unit: 'hr',
    rating: 3.22,
  ),
];
