using System;
using System.Web.UI;

namespace ShopNest
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlSuccess.Visible = false;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string name = txtName.Text.Trim();
                string email = txtEmail.Text.Trim();
                string subject = txtSubject.Text.Trim();

                lblSuccessMessage.Text = "Thank you, <strong>" + Server.HtmlEncode(name) + "</strong>! Your message regarding '<em>" + 
                                         Server.HtmlEncode(subject) + "</em>' has been received. A representative will contact you at <strong>" + 
                                         Server.HtmlEncode(email) + "</strong> shortly.";
                pnlSuccess.Visible = true;

                // Clear input fields
                txtName.Text = string.Empty;
                txtEmail.Text = string.Empty;
                txtSubject.Text = string.Empty;
                txtMessage.Text = string.Empty;
            }
        }
    }
}
