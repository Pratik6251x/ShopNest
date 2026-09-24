using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopNest
{
    public partial class Categories : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string catParam = Request.QueryString["cat"];
                if (!string.IsNullOrEmpty(catParam))
                {
                    LoadCategoryProducts(catParam);
                }
                else
                {
                    // Default to Electronics if no category specified
                    LoadCategoryProducts("Electronics");
                }
            }
        }

        private void LoadCategoryProducts(string category)
        {
            List<Product> products = ProductRepository.GetProductsByCategory(category);

            rptCategoryProducts.DataSource = products;
            rptCategoryProducts.DataBind();

            lblSelectedCategoryTitle.Text = category + " (" + (products != null ? products.Count : 0) + " items)";
            Title = category + " - ShopNest Categories";
        }

        protected void SelectCategory_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            if (btn != null)
            {
                string selectedCategory = btn.CommandArgument;
                LoadCategoryProducts(selectedCategory);
            }
        }

        protected void rptCategoryProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                Product product = ProductRepository.GetProductById(productId);

                if (product != null)
                {
                    ShoppingCart cart = ShoppingCart.GetCart(Context);
                    cart.AddItem(product, 1);

                    // Show success message
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
