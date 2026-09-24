<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="ShopNest.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Home.aspx" class="text-decoration-none">Home</a></li>
            <li class="breadcrumb-item"><a href="Products.aspx" class="text-decoration-none">Products</a></li>
            <li class="breadcrumb-item active" aria-current="page">
                <asp:Label ID="lblBreadcrumbName" runat="server" Text="Product Details"></asp:Label>
            </li>
        </ol>
    </nav>

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

    <!-- Product Not Found Panel -->
    <asp:Panel ID="pnlNotFound" runat="server" Visible="false" CssClass="text-center py-5">
        <div class="card p-5 mx-auto" style="max-width: 500px;">
            <i class="bi bi-exclamation-triangle text-warning fs-1 mb-3"></i>
            <h4>Product Not Found</h4>
            <p class="text-muted">The product you are looking for does not exist or may have been removed.</p>
            <div>
                <a href="Products.aspx" class="btn btn-primary px-4 rounded-pill">Back to Catalog</a>
            </div>
        </div>
    </asp:Panel>

    <!-- Main Product Details Container -->
    <asp:Panel ID="pnlDetails" runat="server">
        <div class="product-details-container">
            <div class="row g-5 align-items-center">
                <!-- Large Image Column -->
                <div class="col-lg-6">
                    <div class="product-detail-img-box">
                        <asp:Image ID="imgProduct" runat="server" CssClass="img-fluid" AlternateText="Product Image" />
                    </div>
                </div>

                <!-- Product Info & Actions Column -->
                <div class="col-lg-6">
                    <div class="mb-3">
                        <asp:Label ID="lblCategory" runat="server" CssClass="badge-category"></asp:Label>
                        <span class="badge bg-success-subtle text-success border border-success-subtle ms-2">
                            <i class="bi bi-check-circle me-1"></i> In Stock
                        </span>
                    </div>

                    <h1 class="fw-bold mb-3 text-dark">
                        <asp:Label ID="lblProductName" runat="server"></asp:Label>
                    </h1>

                    <div class="d-flex align-items-center mb-4">
                        <div class="detail-price me-3">
                            <asp:Label ID="lblProductPrice" runat="server"></asp:Label>
                        </div>
                        <div class="text-warning small">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-half"></i>
                            <span class="text-muted ms-1">(4.8 / 5 Rating)</span>
                        </div>
                    </div>

                    <hr class="text-muted opacity-25" />

                    <div class="mb-4">
                        <h6 class="fw-bold text-uppercase text-secondary small">Description</h6>
                        <p class="text-muted lead fs-6">
                            <asp:Label ID="lblDescription" runat="server"></asp:Label>
                        </p>
                    </div>

                    <!-- Highlights & Specs -->
                    <div class="bg-light p-3 rounded-3 mb-4">
                        <div class="row g-2 small">
                            <div class="col-6">
                                <i class="bi bi-box-seam text-primary me-2"></i> Free Express Shipping
                            </div>
                            <div class="col-6">
                                <i class="bi bi-shield-check text-primary me-2"></i> 100% Genuine Guaranteed
                            </div>
                            <div class="col-6">
                                <i class="bi bi-arrow-counterclockwise text-primary me-2"></i> 30-Day Return Window
                            </div>
                            <div class="col-6">
                                <i class="bi bi-credit-card text-primary me-2"></i> Secure Checkout
                            </div>
                        </div>
                    </div>

                    <!-- Quantity Selector & Add to Cart -->
                    <div class="d-flex flex-wrap align-items-center gap-3 mb-4">
                        <div>
                            <label class="form-label small fw-bold text-secondary mb-1">Quantity</label>
                            <div class="quantity-control d-flex">
                                <asp:Button ID="btnDecreaseQty" runat="server" Text="-" OnClick="btnDecreaseQty_Click" CssClass="quantity-btn" />
                                <asp:TextBox ID="txtQuantity" runat="server" Text="1" CssClass="quantity-input" ReadOnly="true"></asp:TextBox>
                                <asp:Button ID="btnIncreaseQty" runat="server" Text="+" OnClick="btnIncreaseQty_Click" CssClass="quantity-btn" />
                            </div>
                        </div>

                        <div class="pt-4 flex-grow-1">
                            <asp:LinkButton ID="btnAddToCart" runat="server" OnClick="btnAddToCart_Click" CssClass="btn btn-primary-custom w-100 py-2">
                                <i class="bi bi-cart-plus-fill me-2 fs-5"></i> Add to Cart
                            </asp:LinkButton>
                        </div>
                    </div>

                    <!-- Back Button -->
                    <div>
                        <a href="Products.aspx" class="btn btn-outline-secondary btn-sm px-3 rounded-pill">
                            <i class="bi bi-arrow-left me-1"></i> Back to Products
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>

</asp:Content>
