using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopNest
{
    public partial class Home : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFeaturedProducts();
            }
        }

        private void LoadFeaturedProducts()
        {
            List<Product> featured = ProductRepository.GetFeaturedProducts();
            rptFeaturedProducts.DataSource = featured;
            rptFeaturedProducts.DataBind();
        }

        protected void rptFeaturedProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                Product product = ProductRepository.GetProductById(productId);

                if (product != null)
                {
                    ShoppingCart cart = ShoppingCart.GetCart(Context);
                    cart.AddItem(product, 1);

                    // Show success alert
                    pnlAlert.Visible = true;
                    lblAlertMsg.Text = "<strong>" + Server.HtmlEncode(product.Name) + "</strong> has been added to your shopping cart!";

                    // Update navigation cart badge immediately
                    SiteMaster master = Master as SiteMaster;
                    if (master != null)
                    {
                        master.UpdateCartBadge();
                    }
                }
            }
        }
    }
}
