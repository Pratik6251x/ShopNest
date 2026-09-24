using System;
using System.Web.UI;

namespace ShopNest
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}
