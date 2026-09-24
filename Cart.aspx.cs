using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopNest
{
    public partial class Cart : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCart();
            }
        }

        private void BindCart()
        {
            ShoppingCart cart = ShoppingCart.GetCart(Context);

            if (cart == null || cart.Items.Count == 0)
            {
                pnlCartContent.Visible = false;
                pnlEmptyCart.Visible = true;
            }
            else
            {
                pnlCartContent.Visible = true;
                pnlEmptyCart.Visible = false;

                rptCartItems.DataSource = cart.Items;
                rptCartItems.DataBind();

                lblSummaryItemCount.Text = cart.GetTotalCount().ToString();
                decimal total = cart.GetGrandTotal();
                lblSummarySubtotal.Text = "$" + total.ToString("F2");
                lblSummaryGrandTotal.Text = "$" + total.ToString("F2");
            }

            // Keep navigation badge in sync
            SiteMaster master = Master as SiteMaster;
            if (master != null)
            {
                master.UpdateCartBadge();
            }
        }

        protected void rptCartItems_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int productId = Convert.ToInt32(e.CommandArgument);
            ShoppingCart cart = ShoppingCart.GetCart(Context);

            if (e.CommandName == "Increase")
            {
                cart.IncreaseQuantity(productId);
            }
            else if (e.CommandName == "Decrease")
            {
                cart.DecreaseQuantity(productId);
            }
            else if (e.CommandName == "Remove")
            {
                cart.RemoveItem(productId);
                pnlAlert.Visible = true;
                lblAlertMsg.Text = "Item has been removed from your cart.";
            }

            BindCart();
        }

        protected void btnClearCart_Click(object sender, EventArgs e)
        {
            ShoppingCart cart = ShoppingCart.GetCart(Context);
            cart.Clear();
            pnlAlert.Visible = true;
            lblAlertMsg.Text = "Your shopping cart has been cleared.";
            BindCart();
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            ShoppingCart cart = ShoppingCart.GetCart(Context);

            if (cart != null && cart.Items.Count > 0)
            {
                decimal total = cart.GetGrandTotal();
                int orderNumber = new Random().Next(10000, 99999);

                lblSuccessOrderId.Text = "SN-" + orderNumber;
                lblSuccessDate.Text = DateTime.Now.ToString("dd MMM yyyy, hh:mm tt");
                lblSuccessTotal.Text = "$" + total.ToString("F2");

                // Empty the cart upon successful order
                cart.Clear();

                pnlCartContent.Visible = false;
                pnlEmptyCart.Visible = false;
                pnlOrderSuccess.Visible = true;
                pnlAlert.Visible = false;

                // Refresh badge count
                SiteMaster master = Master as SiteMaster;
                if (master != null)
                {
                    master.UpdateCartBadge();
                }
            }
        }
    }
}
