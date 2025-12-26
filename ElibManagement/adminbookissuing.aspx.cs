using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElibManagement
{
    public partial class adminbookissuing : System.Web.UI.Page
    {
        string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
     

        }
        //go button
        protected void Button5_Click(object sender, EventArgs e)
        {
            getNames();

        }
        //issue book button
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckifMemberExists() && CheckifBookExists())
            {
                if (CheckifIssueEntryExists())
                {
                    Response.Write("<script>alert('This member has already issued this book');</script>");
                    return;
                }
                else
                {
                    issuebook();
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID or Book ID');</script>");
            }
        }


        //return book button
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (CheckifMemberExists() && CheckifBookExists())
            {
                if (CheckifIssueEntryExists())
                {
                    returnBook();
                }
                else
                {
                    Response.Write("<script>alert('This entry does not exists.;</script>");
                
                   
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID or Book ID');</script>");
            }


        }

        //user defined functions
        void getNames()
        {
            try {
                SqlConnection con =new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                // Using parameters to fix quotes & prevent SQL injection
                SqlCommand cmd = new SqlCommand(
                    "SELECT book_name FROM book_master_tbl WHERE book_id = @book_id", con);
                cmd.Parameters.AddWithValue("@book_id", textbox2.Text.Trim());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    textbox4.Text = dt.Rows[0]["book_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Book ID');</script>");
                }


                cmd = new SqlCommand(
       "SELECT full_name FROM member_master_tbl WHERE member_id = @member_id", con);
                cmd.Parameters.AddWithValue("@member_id", textbox1.Text.Trim());

                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    textbox3.Text = dt.Rows[0]["full_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Member ID');</script>");
                }   



            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        //check if book and member exists
        bool CheckifBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tbl WHERE book_id='" + textbox2.Text.Trim() + "' AND current_stock > 0", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        bool CheckifMemberExists()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(
                        "SELECT full_name FROM member_master_tbl WHERE member_id = @member_id", con);
                    cmd.Parameters.AddWithValue("@member_id", textbox1.Text.Trim());

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    return dt.Rows.Count >= 1;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        bool CheckifIssueEntryExists()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(
                        "SELECT * FROM book_issue_tbl WHERE member_id = @member_id AND book_id =@book_id" , con);
                    cmd.Parameters.AddWithValue("@member_id", textbox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_id", textbox2.Text.Trim());

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    return dt.Rows.Count >= 1;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
         void issuebook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO book_issue_tbl(member_id, member_name, book_id, book_name, issue_date, due_date) values(@member_id, @member_name, @book_id, @book_name, @issue_date, @due_date)", con);
                cmd.Parameters.AddWithValue("@member_id", textbox1.Text.Trim());
                cmd.Parameters.AddWithValue("@member_name", textbox3.Text.Trim());
                cmd.Parameters.AddWithValue("@book_id", textbox2.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", textbox4.Text.Trim());
                cmd.Parameters.AddWithValue("@issue_date", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@due_date", TextBox6.Text.Trim());
                cmd.ExecuteNonQuery();
                cmd = new SqlCommand("UPDATE book_master_tbl SET current_stock = current_stock - 1 WHERE book_id = @book_id", con);
                cmd.Parameters.AddWithValue("@book_id", textbox2.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book Issued Successfully');</script>");

                clearform();
                GridView1.DataBind();
               
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void clearform()
        {
            textbox1.Text = "";
            textbox2.Text = "";
            textbox3.Text = "";
            textbox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
        }
        void returnBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM book_issue_tbl WHERE member_id = @member_id AND book_id = @book_id", con);
                cmd.Parameters.AddWithValue("@member_id", textbox1.Text.Trim());
                cmd.Parameters.AddWithValue("@book_id", textbox2.Text.Trim());
                cmd.ExecuteNonQuery();
                cmd = new SqlCommand("UPDATE book_master_tbl SET current_stock = current_stock + 1 WHERE book_id = @book_id", con);
                cmd.Parameters.AddWithValue("@book_id", textbox2.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book Returned Successfully');</script>");
                clearform();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DateTime dueDate;

                    // Safely parse the date
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

        protected void Unnamed1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}