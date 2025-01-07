using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FrontUI
{
    public partial class Default : Page
    {
        private ProdDbContext db = new ProdDbContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                IndexView();
            }
        }

        // load all the products
        private void IndexView()
        {
            try
            {
                products.DataSource = db.Products.ToList();
                products.DataBind();
                tableMessage.Text = "Product loaded successfully!";
                tableMessage.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception exp)
            {
                _ = exp.Message;
                tableMessage.Text = "An error occurred while processing the request";
                tableMessage.ForeColor = System.Drawing.Color.Red;
            }
            tableMessage.Visible = true;
        }

        //Add product to the DB
        protected void AddProduct_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                var product = new Product
                {
                    Name = TextBoxName.Text,
                    Price = decimal.Parse(TextBoxPrice.Text),
                    Category = TextBoxCategory.Text
                };

                db.Products.Add(product);
                db.SaveChanges();
                // Show success message
                lblMessage.Text = "Product added successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;

            }
            else
            {
                lblMessage.Text = "An error occurred while processing the request!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            IndexView();
            lblMessage.Visible = true;
            TextBoxName.Text = TextBoxPrice.Text = TextBoxCategory.Text = string.Empty;
        }

        //start edit process
        protected void InitiateEdit(object sender, GridViewEditEventArgs e)
        {
            products.EditIndex = e.NewEditIndex;
            IndexView();
        }

        //User cancels edit
        protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
        {
            products.EditIndex = -1;
            IndexView();
        }

        //update product
        protected void UpdatedProduct(object sender, GridViewUpdateEventArgs e)
        {
            int productId = (int)e.Keys["Id"];
            var product = db.Products.Find(productId);

            product.Name = (string)e.NewValues["Name"];
            product.Price = decimal.Parse(e.NewValues["Price"].ToString());
            product.Category = (string)e.NewValues["Category"];

            db.SaveChanges();
            products.EditIndex = -1;
            IndexView();
        }

        //Delete product
        protected void DeleteProduct(object sender, GridViewDeleteEventArgs e)
        {
            int productId = (int)e.Keys["Id"];
            var product = db.Products.Find(productId);
            if (product != null)
            {
                db.Products.Remove(product);
                db.SaveChanges();
            }
            IndexView();
        }

    }
}