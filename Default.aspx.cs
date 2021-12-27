using System;
using System.Collections.Generic;
using System.Linq;

namespace LinqJoinOperations
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Data Initialization
            var Categories = new List<Category>
            {
                new Category{ CategoryID = 5, CategoryName = "Smartphones" },
                new Category{ CategoryID = 6, CategoryName = "Tablets" },
                new Category{ CategoryID = 7, CategoryName = "Laptops" },
                new Category{ CategoryID = 8, CategoryName = "Monitors" }
            };
            var Products = new List<Product>
            {
                new Product{ ProductID = 1, ProductName = "iPhone 13", CategoryID = 5 },
                new Product{ ProductID = 2, ProductName = "Galaxy S21", CategoryID = 5 },
                new Product{ ProductID = 3, ProductName = "Lenovo Ioga", CategoryID = 7 },
                new Product{ ProductID = 4, ProductName = "GeForce GTX 1650", CategoryID = 9 }
            };
            #endregion

            var InnerJoinResult = InnerJoinSample(Categories, Products);
            var LeftJoinResult = LeftJoinSample(Categories, Products);
            var RightJoinResult = RightJoinSample(Categories, Products);
            var FullJoinResult = FullJoinSample(Categories, Products);
            var CrossJoinResult = CrossJoinSample();

            #region Repeater Databindings
            InnerJoinResultRepeater.DataSource = InnerJoinResult;
            InnerJoinResultRepeater.DataBind();

            LeftJoinResultRepeater.DataSource = LeftJoinResult;
            LeftJoinResultRepeater.DataBind();

            RightJoinResultRepeater.DataSource = RightJoinResult;
            RightJoinResultRepeater.DataBind();

            FullJoinResultRepeater.DataSource = FullJoinResult;
            FullJoinResultRepeater.DataBind();

            CrossJoinRepeater.DataSource = CrossJoinResult;
            CrossJoinRepeater.DataBind();
            #endregion
        }

        public List<ResultItem> InnerJoinSample(List<Category> Categories, List<Product> Products)
        {
            var Query =
                from P in Products
                join C in Categories
                on P.CategoryID equals C.CategoryID
                select new ResultItem
                {
                    Product_ProductID = P.ProductID,
                    Product_ProductName = P.ProductName,
                    Product_CategoryID = P.CategoryID,
                    Category_CategoryID = C.CategoryID,
                    Category_CategoryName = C.CategoryName
                };

            var Lambda = Products.Join(Categories, P => P.CategoryID, C => C.CategoryID, (P, C) => new ResultItem
            {
                Product_ProductID = P.ProductID,
                Product_ProductName = P.ProductName,
                Product_CategoryID = P.CategoryID,
                Category_CategoryID = C.CategoryID,
                Category_CategoryName = C.CategoryName
            });

            return Lambda.ToList();
        }

        public List<ResultItem> LeftJoinSample(List<Category> Categories, List<Product> Products)
        {
            var Query = 
                from P in Products
                join C in Categories on P.CategoryID equals C.CategoryID
                into ProductsCategories
                from C in ProductsCategories.DefaultIfEmpty()
                select new ResultItem
                {
                    Product_ProductID = P.ProductID,
                    Product_ProductName = P.ProductName,
                    Product_CategoryID = P.CategoryID,
                    Category_CategoryID = C?.CategoryID,
                    Category_CategoryName = C?.CategoryName                    
                };

            var Lambda = Products.GroupJoin(Categories, P => P.CategoryID, C => C.CategoryID, (P, C) => new
            {
                Product = P,
                Category = C
            })
            .SelectMany(Item => Item.Category.DefaultIfEmpty(), (PC, C) => new ResultItem
            {
                Product_ProductID = PC.Product.ProductID,
                Product_ProductName = PC.Product.ProductName,
                Product_CategoryID = PC.Product.CategoryID,
                Category_CategoryID = C?.CategoryID,
                Category_CategoryName = C?.CategoryName
            });
                        
            return Lambda.ToList();
        }

        public List<ResultItem> RightJoinSample(List<Category> Categories, List<Product> Products)
        {
            var Query =
                from C in Categories
                join P in Products on C.CategoryID equals P.CategoryID
                into CategoriesProducts
                from P in CategoriesProducts.DefaultIfEmpty()
                select new ResultItem
                {
                    Product_ProductID = P?.ProductID,
                    Product_ProductName = P?.ProductName,
                    Product_CategoryID = P?.CategoryID,
                    Category_CategoryID = C.CategoryID,
                    Category_CategoryName = C.CategoryName
                };

            var Lambda = Categories.GroupJoin(Products, C => C.CategoryID, P => P.CategoryID, (C, P) => new
            {
                Category = C,
                Product = P                
            })
            .SelectMany(Item => Item.Product.DefaultIfEmpty(), (PC, P) => new ResultItem
            {
                Product_ProductID = P?.ProductID,
                Product_ProductName = P?.ProductName,
                Product_CategoryID = P?.CategoryID,
                Category_CategoryID = PC.Category.CategoryID,
                Category_CategoryName = PC.Category.CategoryName
            });
            
            return Lambda.ToList();
        }

        public List<ResultItem> FullJoinSample(List<Category> Categories, List<Product> Products)
        {
            var Left = LeftJoinSample(Categories, Products);
            var Right = RightJoinSample(Categories, Products);
            var Full = Left.Union(Right, new ResultItemComparer());
            return Full.ToList();            
        }

        public List<CrossJoinResultItem> CrossJoinSample()
        {
            var Collection1 = new List<int> { 1, 2, 3 };
            var Collection2 = new List<int> { 4, 5, 6 };

            var Query =
                from C1 in Collection1
                from C2 in Collection2
                select new CrossJoinResultItem
                {
                    N1 = C1,
                    N2 = C2
                };

            var Lambda = Collection1.SelectMany(Item => Collection2, (C1, C2) => new CrossJoinResultItem
            {
                N1 = C1,
                N2 = C2
            });

            return Lambda.ToList();                        
        }

        #region Sub Classes
        public class Category
        {
            public int CategoryID { get; set; }
            public string CategoryName { get; set; }
        }

        public class Product
        {
            public int ProductID { get; set; }
            public string ProductName { get; set; }
            public int CategoryID { get; set; }
        }        

        public class ResultItem
        {
            public int? Product_ProductID { get; set; }
            public string Product_ProductName { get; set; }
            public int? Product_CategoryID { get; set; }
            public int? Category_CategoryID { get; set; }
            public string Category_CategoryName { get; set; }
        }

        public class ResultItemComparer : IEqualityComparer<ResultItem>
        {
            public bool Equals(ResultItem Item1, ResultItem Item2)
            {
                return Item1.Product_ProductID !=null && Item2.Product_ProductID !=null && Item1.Product_ProductID == Item2.Product_ProductID;
            }

            public int GetHashCode(ResultItem obj)
            {
                return new { obj.Product_ProductID }.GetHashCode();
            }
        }

        public class CrossJoinResultItem
        {
            public int N1 { get; set; }
            public int N2 { get; set; }
        }
        #endregion
    }
}