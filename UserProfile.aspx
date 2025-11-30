<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="WebApplication1.UserProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">

                <div class="card">
                    <div class="card-body">

                        <!-- Logo -->
                        <div class="row">
                            <div class="col text-center">
                                <img width="100px" src="imgs/login.png" />
                            </div>
                        </div>

                        <!-- Title -->
                        <div class="row">
                            <div class="col text-center">
                                <h4>Your Profile</h4>
                                <span>Account Status</span>
                                <asp:Label class="badge badge-pill badge-info" ID="Label1" runat="server" Text="Your Status"></asp:Label>
                            </div>
                        </div>




                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <!-- Full Name + Date of Birth Side by Side -->
                        <div class="row">
                            <div class="col-md-6">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Date of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" runat="server" TextMode="Date" placeholder="Date of Birth"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <!-- Contact Number + Email -->
                        <div class="row">
                            <div class="col-md-6">
                                <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" runat="server" placeholder="Contact Number" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" runat="server" TextMode="Email" placeholder="Email ID"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <!-- State, City, Zip -->
                        <div class="row">
                            <div class="col-md-4">
                                <label>State</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem>Select State</asp:ListItem>
<asp:ListItem>Alabama</asp:ListItem>
<asp:ListItem>Alaska</asp:ListItem>
<asp:ListItem>Arizona</asp:ListItem>
<asp:ListItem>Arkansas</asp:ListItem>
<asp:ListItem>California</asp:ListItem>
<asp:ListItem>Colorado</asp:ListItem>
<asp:ListItem>Connecticut</asp:ListItem>
<asp:ListItem>Delaware</asp:ListItem>
<asp:ListItem>Florida</asp:ListItem>
<asp:ListItem>Georgia</asp:ListItem>
<asp:ListItem>Hawaii</asp:ListItem>
<asp:ListItem>Idaho</asp:ListItem>
<asp:ListItem>Illinois</asp:ListItem>
<asp:ListItem>Indiana</asp:ListItem>
<asp:ListItem>Iowa</asp:ListItem>
<asp:ListItem>Kansas</asp:ListItem>
<asp:ListItem>Kentucky</asp:ListItem>
<asp:ListItem>Louisiana</asp:ListItem>
<asp:ListItem>Maine</asp:ListItem>
<asp:ListItem>Maryland</asp:ListItem>
<asp:ListItem>Massachusetts</asp:ListItem>
<asp:ListItem>Michigan</asp:ListItem>
<asp:ListItem>Minnesota</asp:ListItem>
<asp:ListItem>Mississippi</asp:ListItem>
<asp:ListItem>Missouri</asp:ListItem>
<asp:ListItem>Montana</asp:ListItem>
<asp:ListItem>Nebraska</asp:ListItem>
<asp:ListItem>Nevada</asp:ListItem>
<asp:ListItem>New Hampshire</asp:ListItem>
<asp:ListItem>New Jersey</asp:ListItem>
<asp:ListItem>New Mexico</asp:ListItem>
<asp:ListItem>New York</asp:ListItem>
<asp:ListItem>North Carolina</asp:ListItem>
<asp:ListItem>North Dakota</asp:ListItem>
<asp:ListItem>Ohio</asp:ListItem>
<asp:ListItem>Oklahoma</asp:ListItem>
<asp:ListItem>Oregon</asp:ListItem>
<asp:ListItem>Pennsylvania</asp:ListItem>
<asp:ListItem>Rhode Island</asp:ListItem>
<asp:ListItem>South Carolina</asp:ListItem>
<asp:ListItem>South Dakota</asp:ListItem>
<asp:ListItem>Tennessee</asp:ListItem>
<asp:ListItem>Texas</asp:ListItem>
<asp:ListItem>Utah</asp:ListItem>
<asp:ListItem>Vermont</asp:ListItem>
<asp:ListItem>Virginia</asp:ListItem>
<asp:ListItem>Washington</asp:ListItem>
<asp:ListItem>West Virginia</asp:ListItem>
<asp:ListItem>Wisconsin</asp:ListItem>
<asp:ListItem>Wyoming</asp:ListItem>



                                            
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" runat="server" placeholder="City"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Zip Code</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" runat="server" placeholder="Zip Code" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>



                        <div class="row">
                             <div class="col">
                             <label>Full Address</label>
                             <div class="form-group">
                                  <asp:TextBox CssClass="form-control" runat="server" placeholder="Full Address" TextMode="Multiline"></asp:TextBox>
                             </div>
                             </div>
                            </div>

    
                                        <div class="row">
    <div class="col-md-4">
        <label>UserID</label>
        <div class="form-group">
            <asp:TextBox CssClass="form-control" runat="server" placeholder="User ID" ReadOnly="true"></asp:TextBox>
        </div>
    </div>

    <div class="col-md-4">
        <label>Old Password</label>
        <div class="form-group">
            <asp:TextBox CssClass="form-control" runat="server" TextMode="Password" placeholder="Password" ReadOnly="true"></asp:TextBox>
        </div>
    </div>


                                             <div class="col-md-4">
     <label>New Password</label>
     <div class="form-group">
         <asp:TextBox CssClass="form-control" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
     </div>
 </div>


</div>




                        <!-- Buttons -->
            
                        <div class="row">
                            <div class="col-8 mx-auto">
                                <center>
                        <div class="form-group">
                            <a href="UserSignup.aspx">
                                <input class="btn btn-primary btn-block btn-lg" id="Button2" type="button" value="Update" />
                            </a>
                        </div>
                                    </center>

                    </div>

                </div>
                </div>
                </div>
                 



                <a href="Home.aspx"> >> Back to Home </a>
                <br /><br />

            </div>


            <div class="col-md-7">
                           

                <div class="card">
                    <div class="card-body">

                        <!-- Logo -->
                        <div class="row">
                            <div class="col text-center">
                                <img width="100px" src="imgs/booksearch.jpg" />
                            </div>
                        </div>

                        <!-- Title -->
                        <div class="row">
                            <div class="col text-center">
                                <h4>Your Issued Books</h4>
                              
                                <asp:Label class="badge badge-pill badge-info" ID="Label2" runat="server" Text="Your Books Info"></asp:Label>
                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered"  ID="GridView1" runat="server"></asp:GridView>

                            </div>

                        </div>




             
                      
       
            </div>

            </div>
            </div>
            </div>


        </div>


</asp:Content>
