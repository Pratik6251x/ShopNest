<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ShopNest.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Page Header -->
    <div class="mb-4">
        <h2 class="fw-bold mb-1">
            <i class="bi bi-cart3 text-primary me-2"></i> Your Shopping Cart
        </h2>
        <p class="text-muted small">Review your selected items, adjust quantities, and place your order</p>
    </div>

    <!-- Alert / Status Notification -->
    <asp:Panel ID="pnlAlert" runat="server" Visible="false" CssClass="alert alert-info alert-dismissible fade show shadow-sm mb-4" role="alert">
        <div class="d-flex align-items-center">
            <i class="bi bi-info-circle-fill fs-5 me-2"></i>
            <div>
                <asp:Label ID="lblAlertMsg" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </asp:Panel>

    <!-- ================= ORDER SUCCESS PANEL ================= -->
    <asp:Panel ID="pnlOrderSuccess" runat="server" Visible="false">
        <div class="order-success-card shadow-sm mx-auto my-4" style="max-width: 650px;">
            <div class="mb-3 text-success">
                <i class="bi bi-check-circle-fill" style="font-size: 4rem;"></i>
            </div>
            <h2 class="fw-bold text-success mb-2">Order Placed Successfully!</h2>
            <p class="text-muted mb-4">
                Thank you for shopping with <strong>ShopNest</strong>. Your mock order has been recorded.
            </p>

            <div class="bg-white p-4 rounded-3 border text-start mb-4">
                <div class="row g-3">
                    <div class="col-6">
                        <span class="text-muted small d-block">Order Reference:</span>
                        <strong class="text-dark"><asp:Label ID="lblSuccessOrderId" runat="server"></asp:Label></strong>
                    </div>
                    <div class="col-6 text-end">
                        <span class="text-muted small d-block">Order Date:</span>
                        <strong class="text-dark"><asp:Label ID="lblSuccessDate" runat="server"></asp:Label></strong>
                    </div>
                    <div class="col-6">
                        <span class="text-muted small d-block">Payment Method:</span>
                        <strong class="text-dark">Cash on Delivery / Mock Pay</strong>
                    </div>
                    <div class="col-6 text-end">
                        <span class="text-muted small d-block">Total Amount:</span>
                        <strong class="text-primary fs-5"><asp:Label ID="lblSuccessTotal" runat="server"></asp:Label></strong>
                    </div>
                </div>
            </div>

            <div class="d-flex justify-content-center gap-3">
                <a href="Products.aspx" class="btn btn-primary-custom px-4">
                    <i class="bi bi-bag-plus me-1"></i> Continue Shopping
                </a>
                <a href="Home.aspx" class="btn btn-outline-secondary px-4 rounded-pill">
                    <i class="bi bi-house me-1"></i> Back to Home
                </a>
            </div>
        </div>
    </asp:Panel>

    <!-- ================= EMPTY CART PANEL ================= -->
    <asp:Panel ID="pnlEmptyCart" runat="server" Visible="false" CssClass="text-center py-5">
        <div class="card p-5 mx-auto border-0 shadow-sm rounded-4" style="max-width: 500px;">
            <div class="mb-3 text-muted">
                <i class="bi bi-cart-x" style="font-size: 4.5rem; color: #cbd5e1;"></i>
            </div>
            <h4 class="fw-bold text-dark mb-2">Your Shopping Cart is Empty</h4>
            <p class="text-muted mb-4">Looks like you haven't added any products yet. Discover our latest items and great deals!</p>
            <div>
                <a href="Products.aspx" class="btn btn-primary-custom px-4">
                    <i class="bi bi-bag-check me-2"></i> Start Shopping
                </a>
            </div>
        </div>
    </asp:Panel>

    <!-- ================= ACTIVE CART CONTENT PANEL ================= -->
    <asp:Panel ID="pnlCartContent" runat="server">
        <div class="row g-4">
            <!-- Cart Items List (Left Column) -->
            <div class="col-lg-8">
                <div class="cart-card">
                    <div class="table-responsive">
                        <table class="table cart-table align-middle mb-0">
                            <thead>
                                <tr>
                                    <th scope="col" style="min-width: 250px;">Product</th>
                                    <th scope="col">Price</th>
                                    <th scope="col" style="min-width: 140px;">Quantity</th>
                                    <th scope="col">Subtotal</th>
                                    <th scope="col" class="text-end">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptCartItems" runat="server" OnItemCommand="rptCartItems_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <!-- Product Details -->
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>' class="cart-item-img me-3" />
                                                    <div>
                                                        <h6 class="mb-0 fw-bold">
                                                            <a href='<%# "ProductDetails.aspx?id=" + Eval("ProductId") %>' class="text-decoration-none text-dark">
                                                                <%# Eval("Name") %>
                                                            </a>
                                                        </h6>
                                                        <span class="badge bg-light text-muted border small mt-1"><%# Eval("Category") %></span>
                                                    </div>
                                                </div>
                                            </td>

                                            <!-- Price -->
                                            <td class="fw-semibold text-secondary">
                                                $<%# Eval("Price", "{0:F2}") %>
                                            </td>

                                            <!-- Quantity Controls -->
                                            <td>
                                                <div class="d-inline-flex align-items-center border rounded-pill bg-light p-1">
                                                    <asp:LinkButton ID="btnDecrease" runat="server" 
                                                        CommandName="Decrease" 
                                                        CommandArgument='<%# Eval("ProductId") %>' 
                                                        CssClass="btn btn-sm btn-link text-dark p-0 px-2 text-decoration-none fw-bold">
                                                        <i class="bi bi-dash"></i>
                                                    </asp:LinkButton>

                                                    <span class="px-2 fw-bold text-dark"><%# Eval("Quantity") %></span>

                                                    <asp:LinkButton ID="btnIncrease" runat="server" 
                                                        CommandName="Increase" 
                                                        CommandArgument='<%# Eval("ProductId") %>' 
                                                        CssClass="btn btn-sm btn-link text-dark p-0 px-2 text-decoration-none fw-bold">
                                                        <i class="bi bi-plus"></i>
                                                    </asp:LinkButton>
                                                </div>
                                            </td>

                                            <!-- Subtotal -->
                                            <td class="fw-bold text-dark">
                                                $<%# Eval("TotalPrice", "{0:F2}") %>
                                            </td>

                                            <!-- Remove Action -->
                                            <td class="text-end">
                                                <asp:LinkButton ID="btnRemove" runat="server" 
                                                    CommandName="Remove" 
                                                    CommandArgument='<%# Eval("ProductId") %>' 
                                                    CssClass="btn btn-outline-danger btn-sm rounded-circle"
                                                    ToolTip="Remove from cart">
                                                    <i class="bi bi-trash3"></i>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>

                    <!-- Cart Actions Bar -->
                    <div class="p-3 bg-light border-top d-flex flex-wrap justify-content-between align-items-center gap-2">
                        <a href="Products.aspx" class="btn btn-outline-secondary btn-sm rounded-pill px-3">
                            <i class="bi bi-arrow-left me-1"></i> Continue Shopping
                        </a>

                        <asp:LinkButton ID="btnClearCart" runat="server" OnClick="btnClearCart_Click" 
                            CssClass="btn btn-outline-danger btn-sm rounded-pill px-3"
                            OnClientClick="return confirm('Are you sure you want to empty your shopping cart?');">
                            <i class="bi bi-trash me-1"></i> Clear Cart
                        </asp:LinkButton>
                    </div>
                </div>
            </div>

            <!-- Order Summary Card (Right Column) -->
            <div class="col-lg-4">
                <div class="cart-summary-box">
                    <h5 class="fw-bold mb-3 pb-2 border-bottom">Order Summary</h5>

                    <div class="d-flex justify-content-between mb-2">
                        <span class="text-muted">Total Items:</span>
                        <strong class="text-dark"><asp:Label ID="lblSummaryItemCount" runat="server" Text="0"></asp:Label></strong>
                    </div>

                    <div class="d-flex justify-content-between mb-2">
                        <span class="text-muted">Subtotal:</span>
                        <strong class="text-dark"><asp:Label ID="lblSummarySubtotal" runat="server" Text="$0.00"></asp:Label></strong>
                    </div>

                    <div class="d-flex justify-content-between mb-3">
                        <span class="text-muted">Shipping Fee:</span>
                        <strong class="text-success">FREE</strong>
                    </div>

                    <hr />

                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <span class="fs-5 fw-bold text-dark">Grand Total:</span>
                        <span class="fs-4 fw-bold text-primary"><asp:Label ID="lblSummaryGrandTotal" runat="server" Text="$0.00"></asp:Label></span>
                    </div>

                    <!-- Place Order Button -->
                    <asp:LinkButton ID="btnPlaceOrder" runat="server" OnClick="btnPlaceOrder_Click" CssClass="btn btn-primary-custom w-100 py-3 text-center">
                        <i class="bi bi-check2-circle fs-5 me-2"></i> Place Order
                    </asp:LinkButton>

                    <div class="text-center mt-3">
                        <p class="small text-muted mb-0">
                            <i class="bi bi-shield-check text-success me-1"></i> 100% Risk-Free Mock Order
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>

</asp:Content>
