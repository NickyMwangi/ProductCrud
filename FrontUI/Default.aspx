<%@ Page Title="List Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FrontUI.Default" %>

<asp:Content ID="ProductsList" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div class="row justify-content-center">
            <div class="col-md-8">
                <h2 class="text-center">Products List</h2>
                 <asp:Label ID="tableMessage" runat="server" ForeColor="Green" Visible="false"></asp:Label>
                <hr />
                <asp:GridView ID="products" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" OnRowEditing="InitiateEdit"
                    OnRowDeleting="DeleteProduct" OnRowCancelingEdit="CancelEdit"
                    OnRowUpdating="UpdatedProduct" DataKeyNames="Id">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Product ID" ReadOnly="True" />
                        <asp:BoundField DataField="Name" HeaderText="Product Name" />
                        <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                        <asp:BoundField DataField="Category" HeaderText="Category" />
                        <%--<asp:CommandField ShowEditButton="True" />--%>
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <!-- Edit Button using key defined above -->
                                <a href='EditProduct.aspx?Id=<%# Eval("Id") %>' class="btn btn-sm btn-warning me-2">
                                    <i class="fa fa-pencil-square"></i>
                                </a>
                                <!-- Delete Button -->
                                <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn btn-sm btn-danger"
                                    OnClientClick="return confirm('Are you sure you want to delete this product?');">
                                    <i class="fa fa-trash"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card p-3">
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Green" Visible="false"></asp:Label>
                    <h3>Add Product</h3>
                    <div>
                        <asp:ValidationSummary ID="vsSummary" runat="server" ShowSummary="true" ForeColor="Red" />
                    </div>
                    <div class="mb-2">
                        <asp:TextBox ID="TextBoxName" runat="server" CssClass="form-control" Placeholder="Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvProductName" runat="server" ControlToValidate="TextBoxName" ErrorMessage="Product Name is required." ForeColor="Red" />
                    </div>
                    <div class="mb-2">
                        <asp:TextBox ID="TextBoxPrice" runat="server" CssClass="form-control" Placeholder="Price"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="TextBoxPrice"
                            ErrorMessage="Price is required." ForeColor="Red" />
                        <asp:RangeValidator ID="rvPrice" runat="server" ControlToValidate="TextBoxPrice" MinimumValue="0.01" MaximumValue="9999.99"
                            ErrorMessage="Price must be between 0.01 and 9999.99." ForeColor="Red" />
                    </div>
                    <div class="mb-2">
                        <asp:TextBox ID="TextBoxCategory" runat="server" CssClass="form-control" Placeholder="Category"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ControlToValidate="TextBoxCategory"
                            InitialValue="" ErrorMessage="Please select a category." ForeColor="Red" />
                    </div>
                    <asp:Button ID="AddProduct" runat="server" CssClass="btn btn-primary" Text="Add Product" OnClick="AddProduct_Click" />
                </div>
            </div>
        </div>
    </main>
</asp:Content>
