using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FrontUI
{
    public partial class EditProduct : Page
    {
        private ProdDbContext db = new ProdDbContext();
        private int ProductID => int.Parse(Request.QueryString["Id"]);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetProductDetails();
            }
        }

        private void GetProductDetails()
        {
            var product = db.Products.Find(ProductID);
            if (product == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                TextBoxName.Text = product.Name;
                TextBoxPrice.Text = product.Price.ToString("F2");
                TextBoxCategory.Text = product.Category;
            }
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            var product = db.Products.Find(ProductID);
            if (product != null)
            {
                product.Name = TextBoxName.Text;
                product.Price = decimal.Parse(TextBoxPrice.Text);
                product.Category = TextBoxCategory.Text;

                db.SaveChanges();
                lblMessage.Text = "Product updated successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblMessage.Text = "An error occurred while processing the request!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            lblMessage.Visible = true;


            Response.Redirect("Default.aspx");
        }

        protected void BackBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}