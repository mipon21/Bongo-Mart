import 'package:bongo_mart/features/shop/models/banner_model.dart';
import 'package:bongo_mart/features/shop/models/brand_model.dart';
import 'package:bongo_mart/features/shop/models/category_model.dart';
import 'package:bongo_mart/features/shop/models/product_attribute_model.dart';
import 'package:bongo_mart/features/shop/models/product_model.dart';
import 'package:bongo_mart/features/shop/models/product_variation_model.dart';
import 'package:bongo_mart/routes/routes.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';

class MyDummyData {
  //Banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: TImages.banner1,
        name: 'Banner 1',
        targetScreen: TRoutes.order,
        active: false),
    BannerModel(
        imageUrl: TImages.banner2,
        name: 'Banner 2',
        targetScreen: TRoutes.cart,
        active: true),
    BannerModel(
        imageUrl: TImages.banner3,
        name: 'Banner 3',
        targetScreen: TRoutes.favourites,
        active: true),
    BannerModel(
        imageUrl: TImages.banner4,
        name: 'Banner 4',
        targetScreen: TRoutes.search,
        active: true),
    BannerModel(
        imageUrl: TImages.banner5,
        name: 'Banner 5',
        targetScreen: TRoutes.settings,
        active: true),
    BannerModel(
        imageUrl: TImages.banner6,
        name: 'Banner 6',
        targetScreen: TRoutes.userAddress,
        active: true),
    BannerModel(
        imageUrl: TImages.banner7,
        name: 'Banner 7',
        targetScreen: TRoutes.userAddress,
        active: true),
    BannerModel(
        imageUrl: TImages.banner8,
        name: 'Banner 8',
        targetScreen: TRoutes.checkout,
        active: false),
  ];

  // List of oll Categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', image: TImages.sportIcon, name: 'Sports', isFeatured: true),
    CategoryModel(
        id: '5',
        image: TImages.furnitureIcon,
        name: 'Furniture',
        isFeatured: true),
    CategoryModel(
        id: '2',
        image: TImages.electronicsIcon,
        name: 'Electronics',
        isFeatured: true),
    CategoryModel(
        id: '3', image: TImages.clothIcon, name: 'Clothes', isFeatured: true),
    CategoryModel(
        id: '14', image: TImages.animalIcon, name: 'Animals', isFeatured: true),
    CategoryModel(
        id: '6', image: TImages.shoeIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(
        id: '7',
        image: TImages.cosmeticsIcon,
        name: 'Cosmetics',
        isFeatured: true),
    CategoryModel(
        id: '14',
        image: TImages.jeweleryIcon,
        name: 'Jewelery',
        isFeatured: true),

    ///subcategories
    CategoryModel(
        id: '8',
        image: TImages.sportIcon,
        name: 'Sport Shoes',
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '9',
        image: TImages.sportIcon,
        name: 'Track suits',
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '10',
        image: TImages.sportIcon,
        name: 'Sports Equipments',
        parentId: '1',
        isFeatured: false),
    //furniture
    CategoryModel(
        id: '11',
        image: TImages.furnitureIcon,
        name: 'Bedroom furniture',
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '12',
        image: TImages.furnitureIcon,
        name: 'Kitchen furniture',
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '13',
        image: TImages.furnitureIcon,
        name: 'Office furniture',
        parentId: '5',
        isFeatured: false),
    //electronics
    CategoryModel(
        id: '14',
        image: TImages.electronicsIcon,
        name: 'Laptop',
        parentId: '2',
        isFeatured: false),
  ];

  static final List<ProductModel> products = [
    // Product 1 - Variable Product
    ProductModel(
      id: '001',
      title: 'Green Nike Sports Shoe',
      stock: 150,
      price: 2000,
      isFeatured: true,
      thumbnail: TImages.productImage1,
      description:
          "Stand out with the Nike Sports Shoe in vibrant green, designed for both style and performance. Featuring a lightweight, breathable upper and superior cushioning for all-day comfort.",
      brand: BrandModel(
        id: '1',
        name: 'Nike',
        image: TImages.nikeLogo,
        isFeatured: true,
        productsCount: 150,
      ),
      images: [
        TImages.productImage1,
        TImages.productImage22,
        TImages.productImage23,
        TImages.productImage21
      ],
      salePrice: 1500,
      sku: "ARBx450",
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Red', 'Blue', 'Green']),
        ProductAttributeModel(
            name: 'Size', values: ['EU 34', 'EU 36', 'EU 38']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 40,
          price: 2000,
          salePrice: 1500,
          image: TImages.productImage1,
          attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 40,
          price: 2100,
          salePrice: 1550,
          image: TImages.productImage22,
          attributeValues: {'Color': 'Red', 'Size': 'EU 36'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 40,
          price: 2200,
          salePrice: 1600,
          image: TImages.productImage1,
          attributeValues: {'Color': 'Red', 'Size': 'EU 38'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 40,
          price: 2300,
          salePrice: 1650,
          image: TImages.productImage1,
          attributeValues: {'Color': 'Blue', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 40,
          price: 2400,
          salePrice: 1700,
          image: TImages.productImage1,
          attributeValues: {'Color': 'Blue', 'Size': 'EU 36'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 40,
          price: 2500,
          salePrice: 1750,
          image: TImages.productImage1,
          attributeValues: {'Color': 'Blue', 'Size': 'EU 38'},
        ),
        ProductVariationModel(
          id: '7',
          stock: 40,
          price: 2600,
          salePrice: 1800,
          image: TImages.productImage1,
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '8',
          stock: 40,
          price: 2700,
          salePrice: 1850,
          image: TImages.productImage1,
          attributeValues: {'Color': 'Green', 'Size': 'EU 36'},
        ),
        ProductVariationModel(
          id: '9',
          stock: 40,
          price: 2800,
          salePrice: 1900,
          image: TImages.productImage1,
          attributeValues: {'Color': 'Green', 'Size': 'EU 38'},
        ),
      ],
      productType: 'ProductType.variable',
    ),

    // Product 2 - Single Product
    ProductModel(
      id: '002',
      title: 'Blue T-shirt for all ages',
      stock: 15,
      price: 3250,
      isFeatured: true,
      thumbnail: TImages.productImage60,
      description:
          "This is a product description for the Blue Nike Sleeve Less vest.",
      brand: BrandModel(id: '6', name: "ZARA", image: TImages.zaraLogo),
      images: [
        TImages.productImage60,
        TImages.productImage61,
        TImages.productImage62
      ],
      salePrice: 2570,
      sku: "ABR4568",
      categoryId: '4',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),

    // Product 3 - Variable Product
    ProductModel(
      id: '003',
      title: 'Adidas Running Shoe',
      stock: 200,
      price: 2500,
      isFeatured: false,
      thumbnail: TImages.productImage1,
      description:
          "High-performance running shoe designed by Adidas for ultimate comfort and support.",
      brand: BrandModel(id: '2', name: 'Adidas', image: TImages.adidasLogo),
      images: [
        TImages.productImage1,
        TImages.productImage22,
        TImages.productImage23,
        TImages.productImage21
      ],
      salePrice: 2200,
      sku: "ADID450",
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['White', 'Black', 'Gray']),
        ProductAttributeModel(
            name: 'Size', values: ['EU 40', 'EU 42', 'EU 44']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 50,
          price: 2500,
          salePrice: 2200,
          image: TImages.productImage1,
          attributeValues: {'Color': 'White', 'Size': 'EU 40'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 20,
          price: 2500,
          salePrice: 2200,
          image: TImages.productImage22,
          attributeValues: {'Color': 'Gray', 'Size': 'EU 42'},
        ),
      ],
      productType: 'ProductType.variable',
    ),

    // Product 4 - Single Product
    ProductModel(
      id: '004',
      title: 'Casual Black T-Shirt',
      stock: 100,
      price: 1500,
      isFeatured: false,
      thumbnail: TImages.productImage63,
      description:
          "Casual black T-shirt suitable for everyday wear, made with high-quality cotton.",
      brand: BrandModel(id: '7', name: "H&M", image: TImages.zaraLogo),
      images: [
        TImages.productImage63,
        TImages.productImage64,
        TImages.productImage65
      ],
      salePrice: 1200,
      sku: "HMTS456",
      categoryId: '3',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['S', 'M', 'L']),
        ProductAttributeModel(name: 'Color', values: ['Black']),
      ],
      productType: 'ProductType.single',
    ),

    // Product 5 - Variable Product
    ProductModel(
      id: '005',
      title: 'Reebok Running Sneakers',
      stock: 250,
      price: 3200,
      isFeatured: true,
      thumbnail: TImages.productImage1,
      description:
          "Experience superior performance with Reebok’s top-of-the-line running sneakers.",
      brand: BrandModel(id: '3', name: 'Reebok', image: TImages.nikeLogo),
      images: [
        TImages.productImage1,
        TImages.productImage22,
        TImages.productImage23
      ],
      salePrice: 2900,
      sku: "RBK789",
      categoryId: '5',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Blue', 'Gray']),
        ProductAttributeModel(name: 'Size', values: ['EU 39', 'EU 41']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 70,
          price: 3200,
          salePrice: 2900,
          image: TImages.productImage1,
          attributeValues: {'Color': 'Blue', 'Size': 'EU 39'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 70,
          price: 3200,
          salePrice: 2900,
          image: TImages.productImage22,
          attributeValues: {'Color': 'Gray', 'Size': 'EU 41'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
  ];
}
