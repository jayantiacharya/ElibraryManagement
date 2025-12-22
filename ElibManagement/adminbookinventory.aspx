<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="adminbookinventory.aspx.cs"
    Inherits="ElibManagement.adminbookinventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         });

     </script> 
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    // Update the server-side image preview
                    document.getElementById('<%= img.ClientID %>').src = e.target.result;
                    document.getElementById('<%= img.ClientID %>').width = 200;
                    document.getElementById('<%= img.ClientID %>').height = 200;
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">

            <!-- LEFT SIDE -->
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col text-center">
                                <h4>Book Details</h4>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col text-center">
                                <asp:Image ID="img" runat="server" 
                                           CssClass="img-fluid" 
                                           ImageUrl="imgs/booksearch.jpg" 
                                           Width="200px" Height="200px" />
                            </div>
                        </div>

                        <hr />

                        <!-- File Upload -->
                        <div class="row">
                            <div class="col">
                                <asp:FileUpload onchange="readURL(this);" class="form-control" ID="fileupload1" runat="server" />
                            </div>
                        </div>

                        <!-- Book ID + Book Name -->
                        <div class="row">
                            <div class="col-md-4">
                                <label>Book ID</label>
                                <div class="input-group">
                                    <asp:TextBox ID="txtBookID" CssClass="form-control" runat="server" placeholder="Book ID"></asp:TextBox>
                                    <asp:LinkButton ID="LinkButton4" runat="server" CssClass="input-group-text bg-primary text-white"
                                        OnClick="LinkButton4_Click" Style="cursor:pointer;">
                                        <i class="fas fa-check-circle"></i>
                                    </asp:LinkButton>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label>Book Name</label>
                                <asp:TextBox CssClass="form-control" ID="textbox2" runat="server" placeholder="Book Name"></asp:TextBox>
                            </div>
                        </div>

                        <!-- Language + Author + Genre -->
                        <div class="row">
                            <div class="col-md-4">
                                <label>Language</label>
                                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="English" Value="English" />
                                    <asp:ListItem Text="Nepali" Value="Nepali" />
                                    <asp:ListItem Text="Hindi" Value="Hindi" />
                                    <asp:ListItem Text="French" Value="French" />
                                    <asp:ListItem Text="German" Value="German" />
                                </asp:DropDownList>

                                <label class="mt-2">Publisher Name</label>
                                <asp:DropDownList ID="DropDownList4" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="Publisher 1" Value="Publisher1" />
                                    <asp:ListItem Text="Publisher 2" Value="Publisher2" />
                                </asp:DropDownList>
                            </div>

                            <div class="col-md-4">
                                <label>Author</label>
                                <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="A1" Value="A1" />
                                    <asp:ListItem Text="A2" Value="A2" />
                                </asp:DropDownList>

                                <label class="mt-2">Publish Date</label>
                                <asp:TextBox ID="txtPublishDate" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                            </div>

                            <div class="col-md-4">
                                <label>Genre</label>
                                <asp:ListBox ID="ListBox3" CssClass="form-control" SelectionMode="Multiple" Rows="4" runat="server">
                                    <asp:ListItem Text="Self Help" Value="Self Help" />
                                    <asp:ListItem Text="Motivation" Value="Motivation" />
                                    <asp:ListItem Text="Healthy Living" Value="Healthy Living" />
                                    <asp:ListItem Text="Wellness" Value="Wellness" />
                                    <asp:ListItem Text="Drama" Value="Drama" />
                                    <asp:ListItem Text="Romance" Value="Romance" />
                                    <asp:ListItem Text="Horror" Value="Horror" />
                                    <asp:ListItem Text="Action" Value="Action" />
                                </asp:ListBox>
                            </div>
                        </div>

                        <!-- ROW 1 -->
                        <div class="row mt-3">
                            <div class="col-md-4">
                                <label>Edition</label>
                                <asp:TextBox CssClass="form-control" runat="server" placeholder="1st" ID="edition"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <label>Book cost(per unit)</label>
                                <asp:TextBox CssClass="form-control" runat="server" placeholder="100" ID="bookcost"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <label>Pages</label>
                                <asp:TextBox CssClass="form-control" runat="server" placeholder="312" ID="pages"></asp:TextBox>
                            </div>
                        </div>

                        <!-- ROW 2 -->
                        <div class="row mt-3">
                            <div class="col-md-4">
                                <label>Actual Stock</label>
                                <asp:TextBox CssClass="form-control" runat="server" placeholder="13" ID="actual"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <label>Current Stock</label>
                                <asp:TextBox CssClass="form-control" runat="server" ReadOnly="true" placeholder="12" ID="current"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <label>Issued Books</label>
                                <asp:TextBox CssClass="form-control" runat="server" ReadOnly="true" placeholder="1" ID="issued"></asp:TextBox>
                            </div>
                        </div>

                        <!-- DESCRIPTION -->
                        <div class="row mt-3">
                            <div class="col-md-12">
                                <label>Book Description</label>
                                <asp:TextBox ID="txtBookDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                            </div>
                        </div>

                        <!-- ACTION BUTTONS -->
                        <div class="row mt-3">
                            <div class="col-md-4">
                                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-success w-100 btn-lg" Text="Add" OnClick="btnAdd_Click" />
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary w-100 btn-lg d-block" Style="height:48px;" OnClick="btnUpdate_Click" />
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger w-100 btn-lg" Text="Delete" OnClick="btnDelete_Click" />
                            </div>
                        </div>

                    </div>
                </div>

                <a href="Home.aspx">>> Back to Home</a>
            </div>

            <!-- RIGHT SIDE -->
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center">Book Inventory List</h4>
                        <hr />

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibrarydbConnectionString %>" SelectCommand="SELECT * FROM [book_master_tbl]">
                        </asp:SqlDataSource>

                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" />

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <!-- Text Info: 10 columns -->
                                                <div class="col-lg-10">
                                                    <div class="row mb-2">
                                                        <div class="col-12">
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col-12">
                                                            Author - <asp:Label ID="Label2" runat="server" Text='<%# Eval("author_name") %>' Font-Italic="True" Font-Bold="True" Font-Size="Medium"></asp:Label>
                                                            &nbsp;| Genre - <asp:Label ID="Label6" runat="server" Text='<%# Eval("genre") %>' Font-Bold="True"></asp:Label>
                                                            &nbsp;| Language - <asp:Label ID="Label7" runat="server" Text='<%# Eval("language") %>' Font-Bold="True"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col-12">
                                                            Publisher - <asp:Label ID="Label3" runat="server" Text='<%# Eval("publisher_name") %>' Font-Italic="True" Font-Bold="True" Font-Size="Medium"></asp:Label>
                                                            | Publish Date: <asp:Label ID="Label8" runat="server" Text='<%# Eval("publish_date") %>' Font-Bold="True"></asp:Label>
                                                            | Pages - <asp:Label ID="Label9" runat="server" Text='<%# Eval("no_of_pages") %>' Font-Bold="True"></asp:Label>
                                                            | Edition - <asp:Label ID="Label10" runat="server" Text='<%# Eval("edition") %>' Font-Bold="True"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col-12">
                                                            Cost - <asp:Label ID="Label11" runat="server" Text='<%# Eval("book_cost") %>' Font-Bold="True"></asp:Label>
                                                            | Actual Stock - <asp:Label ID="Label12" runat="server" Text='<%# Eval("actual_stock") %>' Font-Bold="True"></asp:Label>
                                                            | Available Stock - <asp:Label ID="Label13" runat="server" Text='<%# Eval("current_stock") %>' Font-Bold="True"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            Description - <asp:Label ID="Label14" runat="server" Text='<%# Eval("book_description") %>' Font-Bold="True" Font-Italic="True"></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Image: 2 columns -->
                                                <div class="col-lg-2 d-flex align-items-start justify-content-center">
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("book_img_link") %>' CssClass="w-100 h-100" Style="object-fit: contain;" />
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
