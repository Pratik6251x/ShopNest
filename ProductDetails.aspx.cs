using System;
using System.Web.UI;

namespace ShopNest
{
    public partial class ProductDetails : Page
    {
        private int _productId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.TryParse(Request.QueryString["id"], out _productId))
            {
                if (!IsPostBack)
                {
                    LoadProductDetails(_productId);
                }
            }
            else
            {
                ShowNotFound();
            }
        }

        private void LoadProductDetails(int id)
        {
            Product product = ProductRepository.GetProductById(id);
            if (product != null)
            {
                pnlNotFound.Visible = false;
                pnlDetails.Visible = true;

                lblBreadcrumbName.Text = product.Name;
                lblProductName.Text = product.Name;
                lblCategory.Text = product.Category;
                lblProductPrice.Text = "$" + product.Price.ToString("F2");
                lblDescription.Text = product.Description;
                imgProduct.ImageUrl = product.ImageUrl;
                imgProduct.AlternateText = product.Name;
                Title = product.Name + " - Details";
            }
            else
            {
                ShowNotFound();
            }
        }

        private void ShowNotFound()
        {
            pnlNotFound.Visible = true;
            pnlDetails.Visible = false;
            lblBreadcrumbName.Text = "Not Found";
        }

        protected void btnIncreaseQty_Click(object sender, EventArgs e)
        {
            int currentQty = 1;
            int.TryParse(txtQuantity.Text, out currentQty);
            if (currentQty < 20)
            {
                currentQty++;
                txtQuantity.Text = currentQty.ToString();
            }
        }

        protected void btnDecreaseQty_Click(object sender, EventArgs e)
        {
            int currentQty = 1;
            int.TryParse(txtQuantity.Text, out currentQty);
            if (currentQty > 1)
            {
                currentQty--;
                txtQuantity.Text = currentQty.ToString();
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            int id = 0;
            if (int.TryParse(Request.QueryString["id"], out id))
            {
                Product product = ProductRepository.GetProductById(id);
                if (product != null)
                {
                    int qty = 1;
                    int.TryParse(txtQuantity.Text, out qty);
                    if (qty <= 0) qty = 1;

                    ShoppingCart cart = ShoppingCart.GetCart(Context);
                    cart.AddItem(product, qty);

                    pnlAlert.Visible = true;
                    lblAlertMsg.Text = "<strong>" + Server.HtmlEncode(product.Name) + "</strong> (Qty: " + qty + ") added to your shopping cart!";

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
