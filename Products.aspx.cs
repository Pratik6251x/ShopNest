using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopNest
{
    public partial class Products : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if category was passed via QueryString (e.g. Products.aspx?cat=Electronics)
                string catParam = Request.QueryString["cat"];
                if (!string.IsNullOrEmpty(catParam))
                {
                    LoadProducts(catParam);
                }
                else
                {
                    LoadProducts("All");
                }
            }
        }

        private void LoadProducts(string category)
        {
            List<Product> list = ProductRepository.GetProductsByCategory(category);

            rptProducts.DataSource = list;
            rptProducts.DataBind();

            pnlNoProducts.Visible = (list == null || list.Count == 0);
            lblProductCount.Text = (list != null ? list.Count : 0) + " Products Available";
            lblCurrentFilter.Text = string.IsNullOrEmpty(category) || category.Equals("All", StringComparison.OrdinalIgnoreCase) 
                ? "All Categories" 
                : category;

            // Highlight the active category filter button
            HighlightFilterButton(category);
        }

        private void HighlightFilterButton(string category)
        {
            string cat = string.IsNullOrEmpty(category) ? "All" : category;

            btnFilterAll.CssClass = "btn btn-sm px-3 " + (cat.Equals("All", StringComparison.OrdinalIgnoreCase) ? "btn-primary" : "btn-outline-primary");
            btnFilterElectronics.CssClass = "btn btn-sm px-3 " + (cat.Equals("Electronics", StringComparison.OrdinalIgnoreCase) ? "btn-primary" : "btn-outline-primary");
            btnFilterClothing.CssClass = "btn btn-sm px-3 " + (cat.Equals("Clothing", StringComparison.OrdinalIgnoreCase) ? "btn-primary" : "btn-outline-primary");
            btnFilterBooks.CssClass = "btn btn-sm px-3 " + (cat.Equals("Books", StringComparison.OrdinalIgnoreCase) ? "btn-primary" : "btn-outline-primary");
            btnFilterAccessories.CssClass = "btn btn-sm px-3 " + (cat.Equals("Accessories", StringComparison.OrdinalIgnoreCase) ? "btn-primary" : "btn-outline-primary");
        }

        protected void FilterCategory_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            if (btn != null)
            {
                string category = btn.CommandArgument;
                LoadProducts(category);
            }
        }

        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                Product product = ProductRepository.GetProductById(productId);

                if (product != null)
                {
                    ShoppingCart cart = ShoppingCart.GetCart(Context);
                    cart.AddItem(product, 1);

                    // Show success banner
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
