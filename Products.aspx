<%@ Page Title="All Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="ShopNest.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Success Alert Notification -->
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

    <!-- Page Header & Filter Bar -->
    <div class="row align-items-center mb-4 g-3">
        <div class="col-md-5">
            <h2 class="fw-bold mb-1">
                <i class="bi bi-bag-fill text-primary me-2"></i> Product Catalog
            </h2>
            <p class="text-muted small mb-0">Browse through our complete collection of products</p>
        </div>

        <div class="col-md-7">
            <div class="d-flex flex-wrap gap-2 justify-content-md-end align-items-center">
                <!-- Category Filter Buttons -->
                <div class="btn-group" role="group" aria-label="Category Filters">
                    <asp:LinkButton ID="btnFilterAll" runat="server" OnClick="FilterCategory_Click" CommandArgument="All" CssClass="btn btn-outline-primary btn-sm px-3">All</asp:LinkButton>
                    <asp:LinkButton ID="btnFilterElectronics" runat="server" OnClick="FilterCategory_Click" CommandArgument="Electronics" CssClass="btn btn-outline-primary btn-sm px-3">Electronics</asp:LinkButton>
                    <asp:LinkButton ID="btnFilterClothing" runat="server" OnClick="FilterCategory_Click" CommandArgument="Clothing" CssClass="btn btn-outline-primary btn-sm px-3">Clothing</asp:LinkButton>
                    <asp:LinkButton ID="btnFilterBooks" runat="server" OnClick="FilterCategory_Click" CommandArgument="Books" CssClass="btn btn-outline-primary btn-sm px-3">Books</asp:LinkButton>
                    <asp:LinkButton ID="btnFilterAccessories" runat="server" OnClick="FilterCategory_Click" CommandArgument="Accessories" CssClass="btn btn-outline-primary btn-sm px-3">Accessories</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>

    <!-- Active Filter Indicator & Count -->
    <div class="d-flex justify-content-between align-items-center mb-4 pb-2 border-bottom">
        <div>
            <span class="text-muted small">Showing: </span>
            <asp:Label ID="lblCurrentFilter" runat="server" CssClass="fw-bold text-dark small" Text="All Categories"></asp:Label>
        </div>
        <div>
            <asp:Label ID="lblProductCount" runat="server" CssClass="badge bg-light text-dark border small" Text="0 Products"></asp:Label>
        </div>
    </div>

    <!-- Empty State if no products match -->
    <asp:Panel ID="pnlNoProducts" runat="server" Visible="false" CssClass="text-center py-5">
        <i class="bi bi-inbox fs-1 text-muted"></i>
        <h4 class="mt-3 text-muted">No products found</h4>
        <p class="text-secondary small">Please select a different category to view available products.</p>
        <a href="Products.aspx" class="btn btn-primary btn-sm mt-2">View All Products</a>
    </asp:Panel>

    <!-- Product Grid via Repeater -->
    <div class="row g-4">
        <asp:Repeater ID="rptProducts" runat="server" OnItemCommand="rptProducts_ItemCommand">
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

</asp:Content>
