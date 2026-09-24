using System;
using System.IO;
using System.Web.UI;

namespace ShopNest
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateCartBadge();
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            // Always refresh badge count during PreRender so postback additions show immediately
            UpdateCartBadge();
        }

        /// <summary>
        /// Updates the cart badge count displayed in the navigation bar.
        /// </summary>
        public void UpdateCartBadge()
        {
            try
            {
                ShoppingCart cart = ShoppingCart.GetCart(Context);
                int count = cart != null ? cart.GetTotalCount() : 0;
                lblCartCount.Text = count.ToString();
            }
            catch
            {
                lblCartCount.Text = "0";
            }
        }

        /// <summary>
        /// Returns "active" CSS class if current URL matches pageName.
        /// </summary>
        public string GetActiveClass(string pageName)
        {
            string currentPage = Path.GetFileName(Request.Url.AbsolutePath);
            if (string.Equals(currentPage, pageName, StringComparison.OrdinalIgnoreCase))
            {
                return "active";
            }
            return string.Empty;
        }
    }
}
