<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master"
    AutoEventWireup="true" CodeBehind="viewbooks.aspx.cs"
    Inherits="ElibManagement.viewbook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    $(document).ready(function () {
        $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
    });

    </script> 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-10 col-lg-9">

                <div class="card shadow-sm">
                    <div class="card-body">

                        <h4 class="text-center">Book Inventory List</h4>
                        <hr />

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:elibrarydbConnectionString %>"
                            SelectCommand="SELECT * FROM book_master_tbl">
                        </asp:SqlDataSource>

                        <asp:GridView ID="GridView1" runat="server"
                            CssClass="table table-striped table-bordered"
                            AutoGenerateColumns="False"
                            DataKeyNames="book_id"
                            DataSourceID="SqlDataSource1">

                            <Columns>

                                <asp:BoundField DataField="book_id"
                                    HeaderText="ID"
                                    ReadOnly="True" />

                                <asp:TemplateField>
                                    <ItemTemplate>

                                        <div class="container-fluid">
                                            <div class="row">

                                                <div class="col-lg-10">

                                                    <h5 class="fw-bold mb-2">
                                                        <%# Eval("book_name") %>
                                                    </h5>

                                                    <p class="mb-1">
                                                        Author :
                                                        <strong><em><%# Eval("author_name") %></em></strong>
                                                        | Genre :
                                                        <strong><%# Eval("genre") %></strong>
                                                        | Language :
                                                        <strong><%# Eval("language") %></strong>
                                                    </p>

                                                    <p class="mb-1">
                                                        Publisher :
                                                        <strong><em><%# Eval("publisher_name") %></em></strong>
                                                        | Publish Date :
                                                        <strong><%# Eval("publish_date", "{0:yyyy-MM-dd}") %></strong>
                                                        | Pages :
                                                        <strong><%# Eval("no_of_pages") %></strong>
                                                        | Edition :
                                                        <strong><%# Eval("edition") %></strong>
                                                    </p>

                                                    <p class="mb-1">
                                                        Cost :
                                                        <strong><%# Eval("book_cost") %></strong>
                                                        | Actual Stock :
                                                        <strong><%# Eval("actual_stock") %></strong>
                                                        | Available :
                                                        <strong><%# Eval("current_stock") %></strong>
                                                    </p>

                                                    <p>
                                                        Description :
                                                        <em><strong><%# Eval("book_description") %></strong></em>
                                                    </p>

                                                </div>

                                                <div class="col-lg-2 text-center">
                                                    <asp:Image ID="Image1" runat="server"
                                                        ImageUrl='<%# Eval("book_img_link") %>'
                                                        CssClass="img-fluid"
                                                        Style="max-height:150px; object-fit:contain;" />
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
