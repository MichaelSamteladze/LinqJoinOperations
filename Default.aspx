<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LinqJoinOperations.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="bootstrap.min.css" />
    <link rel="stylesheet" href="domarrow.css">
    <script src="domarrow.js"></script>
    <style>
        .numberCircle {
            border-radius: 50%;
            padding: 4px 10px 4px 10px;
            border: 2px solid red;
        }

            .numberCircle.blue {
                border: 2px solid blue;
            }

            .numberCircle.green {
                border: 2px solid green;
            }

            .numberCircle.green {
                border: 2px solid purple;
            }

        connection .line {
            z-index: 999;
        }
    </style>
</head>
<body>
<form id="form1" runat="server">

<div class="row mb-5 mt-5"></div>
<connection from="#sample-1-iphone13-category5" to="#sample-1-category-5" color="red" fromX="1" toX="-0.05" head tail></connection>
<connection from="#sample-1-galaxys21-category5" to="#sample-1-category-5" color="red" fromX="1" toX="-0.05" head tail></connection>
<connection from="#sample-1-lenovo-ioga-category7" to="#sample-1-category-7" color="blue" fromX="1" toX="-0.05" head tail></connection>
<div class="container">
    <h3 class="text-center">INNER JOIN By CategoryID</h3>
    <br />
    <div class="row">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="m-0 p-0">Products</h4>
                </div>
                <div class="card-body m-0 p-0">
                    <table class="table text-center table-sm">
                        <thead>
                            <tr>
                                <th scope="col">ProductID</th>
                                <th scope="col">ProductName</th>
                                <th scope="col">CategoryID</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>iPhone 13</td>
                                <td><span id="sample-1-iphone13-category5" class="numberCircle">5</span></td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Galaxy S21</td>
                                <td><span id="sample-1-galaxys21-category5" class="numberCircle">5</span></td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Lenovo Ioga</td>
                                <td><span id="sample-1-lenovo-ioga-category7" class="numberCircle blue">7</span></td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>GeForce GTX 1650</td>
                                <td>9</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="m-0 p-0">Categories</h4>
                </div>
                <div class="card-body m-0 p-0">
                    <table class="table text-center table-sm">
                        <thead>
                            <tr>
                                <th scope="col">CategoryID</th>
                                <th scope="col">CategoryName</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <span id="sample-1-category-5" class="numberCircle">5</span>
                                </td>
                                <td>Smartphones</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>Tablets</td>
                            </tr>
                            <tr>
                                <td>
                                    <span id="sample-1-category-7" class="numberCircle blue">7</span>
                                </td>
                                <td>Laptops</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>Monitors</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <br /><br />
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <h4 class="m-0 p-0">Result</h4>
                </div>
                <div class="card-body m-0 p-0">
                    <table class="table text-center table-sm">
                        <thead>
                            <tr>
                                <th scope="col">Products.ProductID</th>
                                <th scope="col">Products.ProductName</th>
                                <th scope="col">Products.CategoryID</th>
                                <th scope="col">Categories.CategoryID</th>
                                <th scope="col">Categories.CategoryName</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="InnerJoinResultRepeater" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("Product_ProductID") %></td>
                                        <td><%#Eval("Product_ProductName") %></td>
                                        <td><%#Eval("Product_CategoryID") %></td>
                                        <td><%#Eval("Category_CategoryID") %></td>
                                        <td><%#Eval("Category_CategoryName") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>                                                        
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="row mb-5 mt-5"></div>
<connection from="#sample-3-iphone13-category5" to="#sample-3-category-5" color="red" fromX="1" toX="-0.05" head tail></connection>
<connection from="#sample-3-galaxys21-category5" to="#sample-3-category-5" color="red" fromX="1" toX="-0.05" head tail></connection>
<connection from="#sample-3-lenovo-ioga-category7" to="#sample-3-category-7" color="blue" fromX="1" toX="-0.05" head tail></connection>
<div class="container">
    <h3 class="text-center">LEFT JOIN By CategoryID</h3>
    <br />

    <div class="row">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="m-0 p-0">Products</h4>
                </div>
                <div class="card-body m-0 p-0">
                    <table class="table text-center table-sm">
                        <thead>
                            <tr>
                                <th scope="col">ProductID</th>
                                <th scope="col">ProductName</th>
                                <th scope="col">CategoryID</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>iPhone 13</td>
                                <td><span id="sample-3-iphone13-category5" class="numberCircle">5</span></td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Galaxy S21</td>
                                <td><span id="sample-3-galaxys21-category5" class="numberCircle">5</span></td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Lenovo Ioga</td>
                                <td><span id="sample-3-lenovo-ioga-category7" class="numberCircle blue">7</span></td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>GeForce GTX 1650</td>
                                <td>9</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="m-0 p-0">Categories</h4>
                </div>
                <div class="card-body m-0 p-0">
                    <table class="table text-center table-sm">
                        <thead>
                            <tr>
                                <th scope="col">CategoryID</th>
                                <th scope="col">CategoryName</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <span id="sample-3-category-5" class="numberCircle">5</span>
                                </td>
                                <td>Smartphones</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>Tablets</td>
                            </tr>
                            <tr>
                                <td>
                                    <span id="sample-3-category-7" class="numberCircle blue">7</span>
                                </td>
                                <td>Laptops</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>Monitors</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <br /><br />
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <h4 class="m-0 p-0">Result</h4>
                </div>
                <div class="card-body m-0 p-0">
                    <table class="table text-center table-sm">
                        <thead>
                            <tr>
                                <th scope="col">Products.ProductID</th>
                                <th scope="col">Products.ProductName</th>
                                <th scope="col">Products.CategoryID</th>
                                <th scope="col">Categories.CategoryID</th>
                                <th scope="col">Categories.CategoryName</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="LeftJoinResultRepeater" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("Product_ProductID") %></td>
                                        <td><%#Eval("Product_ProductName") %></td>
                                        <td><%#Eval("Product_CategoryID") %></td>
                                        <td><%#Eval("Category_CategoryID") ?? "<span class=\"badge badge-danger\">NULL</span>" %></td>
                                        <td><%#Eval("Category_CategoryName") ?? "<span class=\"badge badge-danger\">NULL</span>" %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="row mb-5 mt-5"></div>
<connection from="#sample-4-iphone13-category5" to="#sample-4-category-5" color="red" fromX="1" toX="-0.05" head tail></connection>
<connection from="#sample-4-galaxys21-category5" to="#sample-4-category-5" color="red" fromX="1" toX="-0.05" head tail></connection>
<connection from="#sample-4-lenovo-ioga-category7" to="#sample-4-category-7" color="blue" fromX="1" toX="-0.05" head tail></connection>
<div class="container">
    <h3 class="text-center">RIGHT JOIN By CategoryID</h3>
    <br />

    <div class="row">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="m-0 p-0">Products</h4>
                </div>
                <div class="card-body m-0 p-0">
                    <table class="table text-center table-sm">
                        <thead>
                            <tr>
                                <th scope="col">ProductID</th>
                                <th scope="col">ProductName</th>
                                <th scope="col">CategoryID</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>iPhone 13</td>
                                <td><span id="sample-4-iphone13-category5" class="numberCircle">5</span></td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Galaxy S21</td>
                                <td><span id="sample-4-galaxys21-category5" class="numberCircle">5</span></td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Lenovo Ioga</td>
                                <td><span id="sample-4-lenovo-ioga-category7" class="numberCircle blue">7</span></td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>GeForce GTX 1650</td>
                                <td>9</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="m-0 p-0">Categories</h4>
                </div>
                <div class="card-body m-0 p-0">
                    <table class="table text-center table-sm">
                        <thead>
                            <tr>
                                <th scope="col">CategoryID</th>
                                <th scope="col">CategoryName</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <span id="sample-4-category-5" class="numberCircle">5</span>
                                </td>
                                <td>Smartphones</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>Tablets</td>
                            </tr>
                            <tr>
                                <td>
                                    <span id="sample-4-category-7" class="numberCircle blue">7</span>
                                </td>
                                <td>Laptops</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>Monitors</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <br /><br />
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <h4 class="m-0 p-0">Result</h4>
                </div>
                <div class="card-body m-0 p-0">
                    <table class="table text-center table-sm">
                        <thead>
                            <tr>
                                <th scope="col">Products.ProductID</th>
                                <th scope="col">Products.ProductName</th>
                                <th scope="col">Products.CategoryID</th>
                                <th scope="col">Categories.CategoryID</th>
                                <th scope="col">Categories.CategoryName</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="RightJoinResultRepeater" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("Product_ProductID") ?? "<span class=\"badge badge-danger\">NULL</span>" %></td>
                                        <td><%#Eval("Product_ProductName") ?? "<span class=\"badge badge-danger\">NULL</span>" %></td>
                                        <td><%#Eval("Product_CategoryID") ?? "<span class=\"badge badge-danger\">NULL</span>" %></td>
                                        <td><%#Eval("Category_CategoryID")%></td>
                                        <td><%#Eval("Category_CategoryName")%></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="row mb-5 mt-5"></div>
<connection from="#sample-5-iphone13-category5" to="#sample-5-category-5" color="red" fromX="1" toX="-0.05" head tail></connection>
<connection from="#sample-5-galaxys21-category5" to="#sample-5-category-5" color="red" fromX="1" toX="-0.05" head tail></connection>
<connection from="#sample-5-lenovo-ioga-category7" to="#sample-5-category-7" color="blue" fromX="1" toX="-0.05" head tail></connection>
<div class="container">
    <h3 class="text-center">FULL JOIN By CategoryID</h3>
    <br />

    <div class="row">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="m-0 p-0">Products</h4>
                </div>
                <div class="card-body m-0 p-0">
                    <table class="table text-center table-sm">
                        <thead>
                            <tr>
                                <th scope="col">ProductID</th>
                                <th scope="col">ProductName</th>
                                <th scope="col">CategoryID</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>iPhone 13</td>
                                <td><span id="sample-5-iphone13-category5" class="numberCircle">5</span></td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Galaxy S21</td>
                                <td><span id="sample-5-galaxys21-category5" class="numberCircle">5</span></td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Lenovo Ioga</td>
                                <td><span id="sample-5-lenovo-ioga-category7" class="numberCircle blue">7</span></td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>GeForce GTX 1650</td>
                                <td>9</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="m-0 p-0">Categories</h4>
                </div>
                <div class="card-body m-0 p-0">
                    <table class="table text-center table-sm">
                        <thead>
                            <tr>
                                <th scope="col">CategoryID</th>
                                <th scope="col">CategoryName</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <span id="sample-5-category-5" class="numberCircle">5</span>
                                </td>
                                <td>Smartphones</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>Tablets</td>
                            </tr>
                            <tr>
                                <td>
                                    <span id="sample-5-category-7" class="numberCircle blue">7</span>
                                </td>
                                <td>Laptops</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>Monitors</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <br /><br />
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <h4 class="m-0 p-0">Result</h4>
                </div>
                <div class="card-body m-0 p-0">
                    <table class="table text-center table-sm">
                        <thead>
                            <tr>
                                <th scope="col">Products.ProductID</th>
                                <th scope="col">Products.ProductName</th>
                                <th scope="col">Products.CategoryID</th>
                                <th scope="col">Categories.CategoryID</th>
                                <th scope="col">Categories.CategoryName</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="FullJoinResultRepeater" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("Product_ProductID") ?? "<span class=\"badge badge-danger\">NULL</span>" %></td>
                                        <td><%#Eval("Product_ProductName") ?? "<span class=\"badge badge-danger\">NULL</span>" %></td>
                                        <td><%#Eval("Product_CategoryID") ?? "<span class=\"badge badge-danger\">NULL</span>" %></td>
                                        <td><%#Eval("Category_CategoryID") ?? "<span class=\"badge badge-danger\">NULL</span>" %></td>
                                        <td><%#Eval("Category_CategoryName") ?? "<span class=\"badge badge-danger\">NULL</span>" %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>




<div class="row mb-5 mt-5"></div>    
<div class="container">
    <h3 class="text-center">CROSS JOIN</h3>
    <br />

    <div class="row">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="m-0 p-0">Collection1</h4>
                </div>
                <div class="card-body m-0 p-0">
                    <table class="table text-center table-sm">
                        <thead>
                            <tr>
                                <th scope="col">Number</th>                                    
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>2</td>
                            </tr>
                            <tr>
                                <td>3</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="m-0 p-0">Collection 2</h4>
                </div>
                <div class="card-body m-0 p-0">
                    <table class="table text-center table-sm">
                        <thead>
                            <tr>
                                <th scope="col">Number</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>4</td>
                            </tr>
                            <tr>
                                <td>5</td>
                            </tr>
                            <tr>
                                <td>6</td>
                            </tr>                                
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <br /><br />
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <h4 class="m-0 p-0">Result</h4>
                </div>
                <div class="card-body m-0 p-0">
                    <table class="table text-center table-sm">
                        <thead>
                            <tr>
                                <th scope="col">Collection1.Number</th>
                                <th scope="col">Collection2.Number</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="CrossJoinRepeater" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("N1") %></td>
                                        <td><%#Eval("N2") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>                        
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


        
</form>
</body>
</html>
