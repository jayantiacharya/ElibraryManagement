using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElibManagement
{
    public partial class usersignup : System.Web.UI.Page
    {
        string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Sign Up button click event
        protected void Button1_Click(object sender, EventArgs e)

        {
            if (checkMemberExists())
            {
                Response.Write("<script>alert('Member Already Exist with this Member ID, try other ID');</script>");
            }
            else {
                signUpNewMember();
            }
            

        }


        //user defined function
        bool checkMemberExists()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id='" + Textbox9.Text.Trim() + "'"
                     , con);
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


                    con.Close();
                    Response.Write("<script>alert('Sign Up Successful. Go to User Login to Login');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<pre>" + ex.ToString() + "</pre>");
                return false;
            }
           

        }
        void signUpNewMember()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand(
                        "INSERT INTO member_master_tbl " +
                        "(full_name, dob, contact_no, email, state, city, zipcode, full_address, member_id, password, account_status) " +
                        "VALUES (@full_name, @dob, @contact_no, @email, @state, @city, @zipcode, @full_address, @member_id, @password, @account_status)", con);

                    cmd.Parameters.Add("@full_name", System.Data.SqlDbType.VarChar).Value = Textbox1.Text;
                    cmd.Parameters.Add("@dob", System.Data.SqlDbType.Date).Value = DateTime.Parse(Textbox2.Text);
                    cmd.Parameters.Add("@contact_no", System.Data.SqlDbType.VarChar).Value = Textbox3.Text;
                    cmd.Parameters.Add("@email", System.Data.SqlDbType.VarChar).Value = Textbox4.Text;
                    cmd.Parameters.Add("@state", System.Data.SqlDbType.VarChar).Value = DropDownList1.SelectedValue;
                    cmd.Parameters.Add("@city", System.Data.SqlDbType.VarChar).Value = Textbox6.Text;
                    cmd.Parameters.Add("@zipcode", System.Data.SqlDbType.Int).Value = int.Parse(Textbox7.Text);
                    cmd.Parameters.Add("@full_address", System.Data.SqlDbType.VarChar).Value = Textbox8.Text;
                    cmd.Parameters.Add("@member_id", System.Data.SqlDbType.VarChar).Value = Textbox9.Text;
                    cmd.Parameters.Add("@password", System.Data.SqlDbType.VarChar).Value = Textbox10.Text;
                    cmd.Parameters.Add("@account_status", System.Data.SqlDbType.VarChar).Value = "pending";

                    int rows = cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Sign Up Successful. Go to User Login to Login');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<pre>" + ex.ToString() + "</pre>");
            }
        }
    }
}