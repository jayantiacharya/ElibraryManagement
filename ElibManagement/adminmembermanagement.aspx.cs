using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElibManagement
{
    public partial class adminmembermanagement : System.Web.UI.Page
    {
        String strcon = System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();

        }
        //go button
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            getMemberByID();

        }
        //deactive
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            UpdateMemberStatusByID("deactive");
        }
        //pending
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            UpdateMemberStatusByID("pending");
        }   
        //active
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            UpdateMemberStatusByID("active");
        }
        //delete user permanently
        protected void Button5_Click(object sender, EventArgs e)
        {
            deleteMemberByID();
        }


        //user defined function 
        void getMemberByID() {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id ='" + TextBox1.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox2.Text = dr.GetValue(0).ToString();
                        TextBox7.Text = dr.GetValue(10).ToString();
                        TextBox3.Text = dr.GetValue(1).ToString();//dob
                        TextBox4.Text = dr.GetValue(2).ToString();//contact
                        TextBox5.Text = dr.GetValue(3).ToString();//email
                        TextBox6.Text = dr.GetValue(7).ToString();//full address
                        TextBox8.Text = dr.GetValue(4).ToString(); //state
                        TextBox9.Text = dr.GetValue(5).ToString(); //city 
                        TextBox10.Text = dr.GetValue(6).ToString(); //zip
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid username or password');</script>");

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }

        }

        void UpdateMemberStatusByID(string status)
        {
            if (string.IsNullOrWhiteSpace(TextBox1.Text))
            {
                Response.Write("<script>alert('Please enter Member ID first');</script>");
                return;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand(
                        "UPDATE member_master_tbl SET account_status = @status WHERE member_id = @member_id",
                        con);

                    cmd.Parameters.AddWithValue("@status", status);
                    cmd.Parameters.AddWithValue("@member_id", TextBox1.Text.Trim());

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        GridView1.DataBind();
                        Response.Write("<script>alert('Member Status Updated Successfully');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Member ID not found');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message.Replace("'", "") + "');</script>");
            }
        }


        void deleteMemberByID()
        {
            string memberId = TextBox1.Text.Trim();

            if (string.IsNullOrEmpty(memberId))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter Member ID');", true);
                return;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand(
                        "DELETE FROM member_master_tbl WHERE member_id = @member_id", con);
                    cmd.Parameters.AddWithValue("@member_id", memberId); // Treat as string

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        GridView1.DataBind();
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Member Deleted Successfully');", true);
                        clearForm();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No member found with this ID');", true);
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
            }
        }


        void clearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
        }


    }
}