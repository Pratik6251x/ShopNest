<%@ Page Title="Product Categories" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="ShopNest.Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Success Alert Notification -->
    <asp:Panel ID="pnlAlert" runat="server" Visible="false" CssClass="alert alert-success alert-dismissible fade show shadow-sm mb-4" role="alert">
        <div class="d-flex align-items-center">
            <i class="bi bi-check-circle-fill fs-4 me-2 text-success"></i>
            <div>
                <asp:Label ID="lblAlertMsg" runat="server" Text=""></asp:Label>
                <a href="Cart.aspx" class="alert-link ms-2 text-decoration-underline">Go to Shopping Cart &rarr;</a>
            </div>
        </div>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </asp:Panel>

    <!-- Page Title -->
    <div class="text-center mb-5">
        <span class="badge bg-primary-subtle text-primary px-3 py-2 rounded-pill fw-bold mb-2">
            <i class="bi bi-folder2-open me-1"></i> Department Browse
        </span>
        <h2 class="fw-bold">Browse by Category</h2>
        <p class="text-muted">Select a department below to explore available items</p>
    </div>

    <!-- Category Selection Cards -->
    <div class="row g-4 mb-5">
        <!-- Electronics -->
        <div class="col-lg-3 col-sm-6">
            <asp:LinkButton ID="btnCatElectronics" runat="server" OnClick="SelectCategory_Click" CommandArgument="Electronics" CssClass="category-card h-100">
                <div class="category-icon" style="background-color: #eef2ff; color: #4f46e5;">
                    <i class="bi bi-laptop"></i>
                </div>
                <h5 class="fw-bold mb-1">Electronics</h5>
                <p class="text-muted small mb-2">Headphones, smartwatches, speakers & mouse</p>
                <span class="badge bg-primary-subtle text-primary">4 Items</span>
            </asp:LinkButton>
        </div>

        <!-- Clothing -->
        <div class="col-lg-3 col-sm-6">
            <asp:LinkButton ID="btnCatClothing" runat="server" OnClick="SelectCategory_Click" CommandArgument="Clothing" CssClass="category-card h-100">
                <div class="category-icon" style="background-color: #fee2e2; color: #dc2626;">
                    <i class="bi bi-bag"></i>
                </div>
                <h5 class="fw-bold mb-1">Clothing</h5>
                <p class="text-muted small mb-2">T-shirts, hoodies, denim jeans & jackets</p>
                <span class="badge bg-danger-subtle text-danger">4 Items</span>
            </asp:LinkButton>
        </div>

        <!-- Books -->
        <div class="col-lg-3 col-sm-6">
            <asp:LinkButton ID="btnCatBooks" runat="server" OnClick="SelectCategory_Click" CommandArgument="Books" CssClass="category-card h-100">
                <div class="category-icon" style="background-color: #fef3c7; color: #d97706;">
                    <i class="bi bi-book"></i>
                </div>
                <h5 class="fw-bold mb-1">Books</h5>
                <p class="text-muted small mb-2">Python, Web Dev, DBMS & Networking textbooks</p>
                <span class="badge bg-warning-subtle text-warning">4 Items</span>
            </asp:LinkButton>
        </div>

        <!-- Accessories -->
        <div class="col-lg-3 col-sm-6">
            <asp:LinkButton ID="btnCatAccessories" runat="server" OnClick="SelectCategory_Click" CommandArgument="Accessories" CssClass="category-card h-100">
                <div class="category-icon" style="background-color: #f3e8ff; color: #9333ea;">
                    <i class="bi bi-sunglasses"></i>
                </div>
                <h5 class="fw-bold mb-1">Accessories</h5>
                <p class="text-muted small mb-2">Backpacks, sunglasses, wallets & bottles</p>
                <span class="badge bg-purple-subtle text-purple" style="background-color: #f3e8ff; color: #7e22ce;">4 Items</span>
            </asp:LinkButton>
        </div>
    </div>

    <!-- Category Products Display Section -->
    <div class="card p-4 shadow-sm border-0 rounded-4">
        <div class="d-flex flex-wrap justify-content-between align-items-center mb-4 pb-3 border-bottom">
            <div>
                <h4 class="fw-bold mb-1">
                    <i class="bi bi-collection-fill text-primary me-2"></i>
                    <asp:Label ID="lblSelectedCategoryTitle" runat="server" Text="All Categories"></asp:Label>
                </h4>
                <p class="text-muted small mb-0">Showing products in the selected category</p>
            </div>
            <div class="mt-2 mt-sm-0">
                <a href="Products.aspx" class="btn btn-outline-primary btn-sm rounded-pill px-3">
                    <i class="bi bi-grid-3x3-gap me-1"></i> View Full Catalog
                </a>
            </div>
        </div>

        <!-- Products Grid in Repeater -->
        <div class="row g-4">
            <asp:Repeater ID="rptCategoryProducts" runat="server" OnItemCommand="rptCategoryProducts_ItemCommand">
                <ItemTemplate>
                    <div class="col-xl-3 col-lg-4 col-md-6">
                        <div class="product-card">
                            <div class="product-image-wrapper">
                                <%# Convert.ToBoolean(Eval("IsFeatured")) ? "<span class='badge-featured'><i class='bi bi-star-fill me-1'></i> Featured</span>" : "" %>
                                <a href='<%# "ProductDetails.aspx?id=" + Eval("Id") %>'>
                                    <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>' class="img-fluid" />
                                </a>
                            </div>

                            <div class="product-body">
                                <div class="mb-2">
                                    <span class="badge-category"><%# Eval("Category") %></span>
                                </div>

                                <h5 class="product-title">
                                    <a href='<%# "ProductDetails.aspx?id=" + Eval("Id") %>'><%# Eval("Name") %></a>
                                </h5>

                                <p class="product-desc"><%# Eval("Description") %></p>

                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <div class="product-price">$<%# Eval("Price", "{0:F2}") %></div>
                                    <span class="badge bg-success-subtle text-success border border-success-subtle px-2 py-1 small">
                                        <%# Eval("StockStatus") %>
                                    </span>
                                </div>

                                <div class="row g-2">
                                    <div class="col-6">
                                        <a href='<%# "ProductDetails.aspx?id=" + Eval("Id") %>' class="btn btn-view-details w-100 text-center">
                                            <i class="bi bi-eye me-1"></i> Details
                                        </a>
                                    </div>
                                    <div class="col-6">
                                        <asp:LinkButton ID="btnAddToCart" runat="server" 
                                            CommandName="AddToCart" 
                                            CommandArgument='<%# Eval("Id") %>' 
                                            CssClass="btn btn-add-cart w-100 text-center">
                                            <i class="bi bi-cart-plus me-1"></i> Add
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

</asp:Content>
