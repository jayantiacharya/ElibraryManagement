using System;
using System.Collections.Generic;
using System.Configuration;

using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElibManagement
{
    public partial class adminauthormanagement : System.Web.UI.Page
    {
        String strcon = System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
        //add author button
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                Response.Write("<script>alert('Author with this ID already exists.');</script>");
            }
            else
            {
                addNewAuthor();
            }
        }

        //update author button
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                updateAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author does not exist.');</script>");
            }
        }

        //delete author button
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                deleteAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author does not exist.');</script>");
            }


        }
        //go button
        protected void Button5_Click(object sender, EventArgs e)
        {

            getAuthorByID();


        }


        //user defined function
        void getAuthorByID()
        {
            try {
                SqlConnection con = new SqlConnection(strcon);
                if(con.State== ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand( "SELECT * FROM author_master_tbl WHERE author_id ='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0][1].ToString();
                }

                else
                {
                    Response.Write("<script>alert('Invalid ID')</script>");
                }
            }
            catch(Exception ex)
            {
                                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        void clearform() {
            TextBox1.Text = "";
            TextBox2.Text = "";
        }

        void deleteAuthor()
        {

            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand(
                        "DELETE FROM  author_master_tbl WHERE author_id='"+TextBox1.Text.Trim()+ "'", con);
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Author deleted successfully.');</script>");
                        clearform();
                        GridView1.DataBind();
                    }
                    else
                    {
                        Response.Write("<script>alert('No author found to delete.');</script>");
                    }
               
               }
               
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
        void updateAuthor()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand(
                        "UPDATE author_master_tbl SET author_name=@author_name WHERE author_id=@author_id", con);

                    cmd.Parameters.AddWithValue("@author_id", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@author_name", TextBox2.Text.Trim());

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Author updated successfully.');</script>");
                        clearform();
                        GridView1.DataBind();
                    }
                    else
                    {
                        Response.Write("<script>alert('No author found to update.');</script>");
                    }
                }
               
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }



        void addNewAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO author_master_tbl(author_id,author_name) values(@author_id,@author_name)", con);
                cmd.Parameters.AddWithValue("@author_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name", TextBox2.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author added successfully.');</script>");
                GridView1.DataBind();
                clearform();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        Boolean checkIfAuthorExists()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand(
                        "SELECT 1 FROM author_master_tbl WHERE author_id = @author_id", con);

                    cmd.Parameters.AddWithValue("@author_id", TextBox1.Text.Trim());

                    SqlDataReader dr = cmd.ExecuteReader();
                    return dr.HasRows;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}