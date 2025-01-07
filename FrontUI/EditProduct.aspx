<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="FrontUI.EditProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Edit - Products</title>
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <link rel="stylesheet" href="Content/css/font-awesome.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="card p-3">
                            <h3>Edit Product</h3>
                             <asp:Label ID="lblMessage" runat="server" ForeColor="Green" Visible="false"></asp:Label>
                            <div class="mb-3">
                                <asp:TextBox ID="TextBoxName" runat="server" CssClass="form-control" Placeholder="Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvProductName" runat="server" ControlToValidate="TextBoxName" ErrorMessage="Product Name is required." ForeColor="Red" />
                            </div>
                            <div class="mb-3">
                                <asp:TextBox ID="TextBoxPrice" runat="server" CssClass="form-control" Placeholder="Price"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="TextBoxPrice"
                                    ErrorMessage="Price is required." ForeColor="Red" />
                                <asp:RangeValidator ID="rvPrice" runat="server" ControlToValidate="TextBoxPrice" MinimumValue="0.01" MaximumValue="9999.99"
                                    ErrorMessage="Price must be between 0.01 and 9999.99." ForeColor="Red" />
                            </div>
                            <div class="mb-3">
                                <asp:TextBox ID="TextBoxCategory" runat="server" CssClass="form-control" Placeholder="Category"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ControlToValidate="TextBoxCategory"
                                    InitialValue="" ErrorMessage="Please select a category." ForeColor="Red" />
                            </div>
                            <div class="row justify-content-center">
                                <div class="col-3">
                                    <asp:Button ID="BackBtn" runat="server" CssClass="btn btn-secondary" Text="Back" OnClick="BackBtn_Click" />
                                </div>
                                <div class="col-3">
                                    <asp:Button ID="UpdateBtn" runat="server" CssClass="btn btn-warning" Text="Update Product" OnClick="UpdateBtn_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="Scripts/jquery-3.7.1.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
