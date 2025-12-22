using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElibManagement
{
    public partial class adminpublishermanagement : System.Web.UI.Page
    {
        String strcon = System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Add button
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkIfPublisherExists())
            {
                Response.Write("<script>alert('Publisher with this ID already exists.');</script>");
            }
            else
            {
                addNewPublisher();
            }

        }
        //update button
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkIfPublisherExists())
            {
                updatePublisher();
            }
            else
            {
                Response.Write("<script>alert('Publisher does not exist.');</script>");
            }

        }

        //delete button
        protected void Button4_Click(object sender, EventArgs e)
        {

            if (checkIfPublisherExists())
            {
                deletePublisher();
            }
            else
            {
                Response.Write("<script>alert('Publisher does not exist.');</script>");
            }

        }

        //go button
        protected void Button5_Click(object sender, EventArgs e)
        {
            getPublisherByID();

        }

        //user defined functions
        void addNewPublisher()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(
                        "INSERT INTO publisher_master_tbl(publisher_id, publisher_name) " +
                        "VALUES(@publisher_id, @publisher_name)", con);
                    cmd.Parameters.AddWithValue("@publisher_id", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@publisher_name", TextBox2.Text.Trim());
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Publisher added successfully.');</script>");
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        void updatePublisher()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(
                        "UPDATE publisher_master_tbl SET publisher_name = @publisher_name " +
                        "WHERE publisher_id = @publisher_id", con);
                    cmd.Parameters.AddWithValue("@publisher_name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@publisher_id", TextBox1.Text.Trim());
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Publisher updated successfully.');</script>");
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        void deletePublisher()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(
                        "DELETE FROM publisher_master_tbl WHERE publisher_id = @publisher_id", con);
                    cmd.Parameters.AddWithValue("@publisher_id", TextBox1.Text.Trim());
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Publisher deleted successfully.');</script>");
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void getPublisherByID()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(
                        "SELECT * FROM publisher_master_tbl WHERE publisher_id = @publisher_id", con);
                    cmd.Parameters.AddWithValue("@publisher_id", TextBox1.Text.Trim());
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            TextBox2.Text = dr.GetString(1);
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid Publisher ID');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void clearform()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
        }




        Boolean checkIfPublisherExists()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand(
                        "SELECT 1 FROM publisher_master_tbl WHERE publisher_id = @publisher_id", con);

                    cmd.Parameters.AddWithValue("@publisher_id", TextBox1.Text.Trim());

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

    }
}