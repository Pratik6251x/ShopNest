using System;
using System.Web;

namespace ShopNest
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
        }

        void Session_Start(object sender, EventArgs e)
        {
            // Initialize an empty shopping cart for the new session
            Session["Cart"] = new ShoppingCart();
        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends
        }

        void Application_End(object sender, EventArgs e)
        {
            // Code that runs on application shutdown
        }
    }
}
