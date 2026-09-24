<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ShopNest.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- Success Alert Notification on Cart Add -->
    <asp:Panel ID="pnlAlert" runat="server" Visible="false" CssClass="alert alert-success alert-dismissible fade show shadow-sm mb-4" role="alert">
        <div class="d-flex align-items-center">
            <i class="bi bi-check-circle-fill fs-4 me-2 text-success"></i>
            <div>
                <asp:Label ID="lblAlertMsg" runat="server" Text=""></asp:Label>
                <a href="Cart.aspx" class="alert-link ms-2 text-decoration-underline">View Cart & Checkout &rarr;</a>
            </div>
        </div>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </asp:Panel>

    <!-- ================= HERO SECTION ================= -->
    <section class="hero-section">
        <div class="row align-items-center">
            <div class="col-lg-6 mb-4 mb-lg-0">
                <span class="badge bg-primary-subtle text-primary px-3 py-2 rounded-pill fw-bold mb-3">
                    <i class="bi bi-stars me-1"></i> Best Quality, Best Prices
                </span>
                <h1 class="hero-title">
                    Discover Everyday <br />
                    Essentials at <span class="hero-highlight">ShopNest</span>
                </h1>
                <p class="hero-subtitle">
                    Explore our hand-picked collection of premium electronics, comfortable fashion, programming textbooks, and modern daily accessories.
                </p>
                <div class="d-flex flex-wrap gap-3">
                    <a href="Products.aspx" class="btn btn-primary-custom">
                        <i class="bi bi-bag-check me-2"></i> Shop Now
                    </a>
                    <a href="Categories.aspx" class="btn btn-outline-custom">
                        <i class="bi bi-grid-fill me-2"></i> Browse Categories
                    </a>
                </div>
            </div>
            <div class="col-lg-6 text-center">
                <img src="Images/hero-banner.svg" alt="ShopNest Shopping Banner" class="img-fluid" style="max-height: 380px;" />
            </div>
        </div>
    </section>

    <!-- ================= VALUE PROPOSITIONS ================= -->
    <section class="mb-5">
        <div class="row g-4 text-center">
            <div class="col-md-3 col-6">
                <div class="p-3 bg-white rounded-4 border shadow-sm h-100">
                    <div class="text-primary fs-2 mb-2"><i class="bi bi-truck"></i></div>
                    <h6 class="fw-bold mb-1">Fast Delivery</h6>
                    <p class="small text-muted mb-0">Free shipping on all orders over $50</p>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="p-3 bg-white rounded-4 border shadow-sm h-100">
                    <div class="text-primary fs-2 mb-2"><i class="bi bi-shield-check"></i></div>
                    <h6 class="fw-bold mb-1">Secure Shopping</h6>
                    <p class="small text-muted mb-0">Reliable session-based cart system</p>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="p-3 bg-white rounded-4 border shadow-sm h-100">
                    <div class="text-primary fs-2 mb-2"><i class="bi bi-arrow-repeat"></i></div>
                    <h6 class="fw-bold mb-1">Easy Returns</h6>
                    <p class="small text-muted mb-0">Hassle-free 30-day return policy</p>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="p-3 bg-white rounded-4 border shadow-sm h-100">
                    <div class="text-primary fs-2 mb-2"><i class="bi bi-headset"></i></div>
                    <h6 class="fw-bold mb-1">24/7 Support</h6>
                    <p class="small text-muted mb-0">Dedicated support via contact page</p>
                </div>
            </div>
        </div>
    </section>

    <!-- ================= SHOP BY CATEGORY ================= -->
    <section class="mb-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h3 class="fw-bold mb-1">Explore Categories</h3>
                <p class="text-muted small mb-0">Browse through our popular department categories</p>
            </div>
            <a href="Categories.aspx" class="text-primary fw-semibold text-decoration-none">
                All Categories &rarr;
            </a>
        </div>

        <div class="row g-4">
            <!-- Electronics -->
            <div class="col-lg-3 col-sm-6">
                <a href="Categories.aspx?cat=Electronics" class="category-card">
                    <div class="category-icon">
                        <i class="bi bi-laptop"></i>
                    </div>
                    <h5 class="fw-bold mb-1">Electronics</h5>
                    <p class="text-muted small mb-0">Headphones, smartwatches, speakers & more</p>
                </a>
            </div>

            <!-- Clothing -->
            <div class="col-lg-3 col-sm-6">
                <a href="Categories.aspx?cat=Clothing" class="category-card">
                    <div class="category-icon" style="background-color: #fee2e2; color: #dc2626;">
                        <i class="bi bi-bag"></i>
                    </div>
                    <h5 class="fw-bold mb-1">Clothing</h5>
                    <p class="text-muted small mb-0">T-shirts, hoodies, jackets & denim jeans</p>
                </a>
            </div>

            <!-- Books -->
            <div class="col-lg-3 col-sm-6">
                <a href="Categories.aspx?cat=Books" class="category-card">
                    <div class="category-icon" style="background-color: #fef3c7; color: #d97706;">
                        <i class="bi bi-book"></i>
                    </div>
                    <h5 class="fw-bold mb-1">Books</h5>
                    <p class="text-muted small mb-0">Programming, web dev, DBMS & networks</p>
                </a>
            </div>

            <!-- Accessories -->
            <div class="col-lg-3 col-sm-6">
                <a href="Categories.aspx?cat=Accessories" class="category-card">
                    <div class="category-icon" style="background-color: #f3e8ff; color: #9333ea;">
                        <i class="bi bi-sunglasses"></i>
                    </div>
                    <h5 class="fw-bold mb-1">Accessories</h5>
                    <p class="text-muted small mb-0">Backpacks, sunglasses, wallets & bottles</p>
                </a>
            </div>
        </div>
    </section>

    <!-- ================= FEATURED PRODUCTS ================= -->
    <section class="mb-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h3 class="fw-bold mb-1">Featured Products</h3>
                <p class="text-muted small mb-0">Top-rated items hand-picked by our editors</p>
            </div>
            <a href="Products.aspx" class="text-primary fw-semibold text-decoration-none">
                View All Products &rarr;
            </a>
        </div>

        <div class="row g-4">
            <asp:Repeater ID="rptFeaturedProducts" runat="server" OnItemCommand="rptFeaturedProducts_ItemCommand">
                <ItemTemplate>
                    <div class="col-xl-4 col-md-6">
                        <div class="product-card">
                            <div class="product-image-wrapper">
                                <span class="badge-featured"><i class="bi bi-star-fill me-1"></i> Featured</span>
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
    </section>

</asp:Content>
