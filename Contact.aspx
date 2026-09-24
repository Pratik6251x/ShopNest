<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="ShopNest.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Page Header -->
    <div class="text-center mb-5">
        <span class="badge bg-primary-subtle text-primary px-3 py-2 rounded-pill fw-bold mb-2">
            <i class="bi bi-chat-dots me-1"></i> Get in Touch
        </span>
        <h2 class="fw-bold">Contact ShopNest Support</h2>
        <p class="text-muted">Have a question or feedback? We would love to hear from you!</p>
    </div>

    <!-- Success Message Panel -->
    <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="alert alert-success alert-dismissible fade show shadow-sm mb-4" role="alert">
        <div class="d-flex align-items-center">
            <i class="bi bi-check-circle-fill fs-4 me-3 text-success"></i>
            <div>
                <h5 class="alert-heading mb-1 fw-bold">Message Sent Successfully!</h5>
                <p class="mb-0 small">
                    <asp:Label ID="lblSuccessMessage" runat="server"></asp:Label>
                </p>
            </div>
        </div>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </asp:Panel>

    <div class="row g-5">
        <!-- Contact Form Column -->
        <div class="col-lg-7">
            <div class="contact-card">
                <h4 class="fw-bold mb-3 text-dark">Send Us a Message</h4>
                <p class="text-muted small mb-4">Please fill in the form below and our team will get back to you shortly.</p>

                <!-- Name Field -->
                <div class="mb-3">
                    <label class="form-label fw-semibold small text-secondary">Your Full Name <span class="text-danger">*</span></label>
                    <div class="input-group">
                        <span class="input-group-text bg-light"><i class="bi bi-person"></i></span>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="e.g. John Doe"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                        ControlToValidate="txtName" 
                        ErrorMessage="Full Name is required." 
                        CssClass="text-danger small mt-1 d-block" 
                        Display="Dynamic" 
                        ValidationGroup="ContactGroup">
                    </asp:RequiredFieldValidator>
                </div>

                <!-- Email Field -->
                <div class="mb-3">
                    <label class="form-label fw-semibold small text-secondary">Email Address <span class="text-danger">*</span></label>
                    <div class="input-group">
                        <span class="input-group-text bg-light"><i class="bi bi-envelope"></i></span>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="e.g. john@example.com" TextMode="Email"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                        ControlToValidate="txtEmail" 
                        ErrorMessage="Email address is required." 
                        CssClass="text-danger small mt-1 d-block" 
                        Display="Dynamic" 
                        ValidationGroup="ContactGroup">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                        ControlToValidate="txtEmail" 
                        ErrorMessage="Please enter a valid email address." 
                        ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" 
                        CssClass="text-danger small mt-1 d-block" 
                        Display="Dynamic" 
                        ValidationGroup="ContactGroup">
                    </asp:RegularExpressionValidator>
                </div>

                <!-- Subject Field -->
                <div class="mb-3">
                    <label class="form-label fw-semibold small text-secondary">Subject <span class="text-danger">*</span></label>
                    <div class="input-group">
                        <span class="input-group-text bg-light"><i class="bi bi-tag"></i></span>
                        <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="e.g. Order Inquiry / Product Question"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvSubject" runat="server" 
                        ControlToValidate="txtSubject" 
                        ErrorMessage="Subject is required." 
                        CssClass="text-danger small mt-1 d-block" 
                        Display="Dynamic" 
                        ValidationGroup="ContactGroup">
                    </asp:RequiredFieldValidator>
                </div>

                <!-- Message Field -->
                <div class="mb-4">
                    <label class="form-label fw-semibold small text-secondary">Your Message <span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" placeholder="Write your message or inquiry here..."></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvMessage" runat="server" 
                        ControlToValidate="txtMessage" 
                        ErrorMessage="Message cannot be blank." 
                        CssClass="text-danger small mt-1 d-block" 
                        Display="Dynamic" 
                        ValidationGroup="ContactGroup">
                    </asp:RequiredFieldValidator>
                </div>

                <!-- Submit Button -->
                <div>
                    <asp:Button ID="btnSubmit" runat="server" Text="Send Message" OnClick="btnSubmit_Click" 
                        ValidationGroup="ContactGroup" CssClass="btn btn-primary-custom px-4 py-2" />
                </div>
            </div>
        </div>

        <!-- Store Information Column -->
        <div class="col-lg-5">
            <div class="contact-card h-100">
                <h4 class="fw-bold mb-3 text-dark">Contact Information</h4>
                <p class="text-muted small mb-4">Reach out to our customer support team directly using the details below:</p>

                <!-- Address -->
                <div class="contact-info-pill">
                    <div class="contact-info-icon">
                        <i class="bi bi-geo-alt"></i>
                    </div>
                    <div>
                        <h6 class="fw-bold mb-0 text-dark">Office Headquarters</h6>
                        <span class="text-muted small">ShopNest Online</span>
                    </div>
                </div>

                <!-- Phone -->
                <div class="contact-info-pill">
                    <div class="contact-info-icon" style="background-color: #f0fdf4; color: #16a34a;">
                        <i class="bi bi-telephone"></i>
                    </div>
                    <div>
                        <h6 class="fw-bold mb-0 text-dark">Customer Helpline</h6>
                        <span class="text-muted small">+91 1234567890</span>
                    </div>
                </div>

                <!-- Email -->
                <div class="contact-info-pill">
                    <div class="contact-info-icon" style="background-color: #fef3c7; color: #d97706;">
                        <i class="bi bi-envelope-at"></i>
                    </div>
                    <div>
                        <h6 class="fw-bold mb-0 text-dark">Official Support Email</h6>
                        <span class="text-muted small">support@shopnest.example.com</span>
                    </div>
                </div>

                <!-- Hours -->
                <div class="contact-info-pill">
                    <div class="contact-info-icon" style="background-color: #f3e8ff; color: #9333ea;">
                        <i class="bi bi-clock-history"></i>
                    </div>
                    <div>
                        <h6 class="fw-bold mb-0 text-dark">Business Hours</h6>
                        <span class="text-muted small">Monday – Saturday: 9:00 AM – 8:00 PM EST</span>
                    </div>
                </div>

                <!-- Project Notice Card -->
                <div class="p-3 bg-light rounded-3 border mt-4">
                    <h6 class="fw-bold text-dark mb-1">
                        <i class="bi bi-info-circle text-primary me-1"></i> Viva / Demo Note
                    </h6>
                    <p class="small text-muted mb-0">
                        This contact form demonstrates client-side and server-side ASP.NET validation controls (<code>RequiredFieldValidator</code> and <code>RegularExpressionValidator</code>) with postback state management.
                    </p>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
