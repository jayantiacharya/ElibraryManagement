using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElibManagement
{
    public partial class userprofile : System.Web.UI.Page
    {
        string strcon = System.Configuration.ConfigurationManager
                            .ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                // Check session
                var username = Session["username"] as string;
                if (string.IsNullOrWhiteSpace(username))
                {
                    Response.Write("<script>alert('Session Expired. Log in again');</script>");
                    Response.Redirect("userlogin.aspx");
                    return;
                }

                // Load user data only once
                if (!IsPostBack)
                {
                    LoadUserProfile();
                    LoadUserIssuedBooks();
                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Session Expired. Log in again');</script>");
                Response.Redirect("userlogin.aspx");
            }
        }

        // Update button click
        protected void Button2_Click(object sender, EventArgs e)
        {
            UpdateUserProfile();
        }

        // Load user profile
        private void LoadUserProfile()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(
                        "SELECT * FROM member_master_tbl WHERE member_id=@id", con);
                    cmd.Parameters.AddWithValue("@id", Session["username"].ToString().Trim());

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        txtFullName.Text = dt.Rows[0]["full_name"].ToString();
                        txtDOB.Text = dt.Rows[0]["dob"].ToString();
                        txtContact.Text = dt.Rows[0]["contact_no"].ToString();
                        txtEmail.Text = dt.Rows[0]["email"].ToString();
                        DropDownList1.SelectedValue = dt.Rows[0]["state"].ToString().Trim();
                        txtCity.Text = dt.Rows[0]["city"].ToString();
                        txtZip.Text = dt.Rows[0]["zipcode"].ToString();
                        txtFulladdress.Text = dt.Rows[0]["full_address"].ToString();
                        txtMemberid.Text = dt.Rows[0]["member_id"].ToString();
                        txtPassword.Text = dt.Rows[0]["password"].ToString(); // old password
                        hfOldPassword.Value = txtPassword.Text; // store in hidden field

                        Label1.Text = dt.Rows[0]["account_status"].ToString().Trim();
                        switch (Label1.Text)
                        {
                            case "active":
                                Label1.Attributes.Add("class", "badge badge-pill badge-success");
                                break;
                            case "pending":
                                Label1.Attributes.Add("class", "badge badge-pill badge-warning");
                                break;
                            case "deactive":
                                Label1.Attributes.Add("class", "badge badge-pill badge-danger");
                                break;
                            default:
                                Label1.Attributes.Add("class", "badge badge-pill badge-info");
                                break;
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('User data not found');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        // Load user issued books into GridView
        private void LoadUserIssuedBooks()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(
                        "SELECT * FROM book_issue_tbl WHERE member_id=@id", con);
                    cmd.Parameters.AddWithValue("@id", Session["username"].ToString().Trim());

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        // Update user profile
        private void UpdateUserProfile()
        {
            try
            {
                string newPassword = txtNewPassword.Text.Trim();
                string passwordToUpdate = string.IsNullOrEmpty(newPassword) ? hfOldPassword.Value : newPassword;

                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(
                        "UPDATE member_master_tbl SET full_name=@name, dob=@dob, contact_no=@contact, " +
                        "email=@mail, state=@state, city=@city, zipcode=@zip, full_address=@address, password=@pwd " +
                        "WHERE member_id=@id", con);

                    cmd.Parameters.AddWithValue("@name", txtFullName.Text.Trim());
                    cmd.Parameters.AddWithValue("@dob", txtDOB.Text.Trim());
                    cmd.Parameters.AddWithValue("@contact", txtContact.Text.Trim());
                    cmd.Parameters.AddWithValue("@mail", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@state", DropDownList1.SelectedValue.Trim());
                    cmd.Parameters.AddWithValue("@city", txtCity.Text.Trim());
                    cmd.Parameters.AddWithValue("@zip", txtZip.Text.Trim());
                    cmd.Parameters.AddWithValue("@address", txtFulladdress.Text.Trim());
                    cmd.Parameters.AddWithValue("@pwd", passwordToUpdate);
                    cmd.Parameters.AddWithValue("@id", txtMemberid.Text.Trim());

                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Profile updated successfully');</script>");

                    // reload profile
                    LoadUserProfile();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        // Highlight overdue books in GridView
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DateTime dueDate;
                    if (DateTime.TryParse(e.Row.Cells[5].Text, out dueDate))
                    {
                        if (DateTime.Today > dueDate)
                        {
                            e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
