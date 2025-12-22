using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Web.UI.WebControls;

namespace ElibManagement
{
    public partial class adminbookinventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["elibrarydbConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataBind();
                fillAuthorPublisherValues();
            }
        }

        // ADD button
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists())
            {
                Response.Write("<script>alert('Book with this ID already exists.');</script>");
            }
            else
            {
                addNewBook();
            }
        }

        // UPDATE button
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists())
            {
                updateBook();
            }
            else
            {
                Response.Write("<script>alert('Book  does not exists.');</script>");
            }
        }

        // DELETE button
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists())
            {
                deleteBook();
            }
            else
            {
                Response.Write("<script>alert('Book  does not exists.');</script>");
            }
        }

        // GO button
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists())
            {
                getBookByID();
            }
            else
            {
                Response.Write("<script>alert('Book does not exists.');</script>");
            }
        }

        // User defined functions
        void fillAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT author_name FROM author_master_tbl;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList2.DataSource = dt;
                DropDownList2.DataValueField = "author_name";
                DropDownList2.DataBind();

                cmd = new SqlCommand("SELECT publisher_name FROM publisher_master_tbl;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DropDownList4.DataSource = dt;
                DropDownList4.DataValueField = "publisher_name";
                DropDownList4.DataBind();
            }
            catch { }
        }

        Boolean checkIfBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tbl WHERE book_id='" + txtBookID.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt.Rows.Count >= 1;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        void addNewBook()
        {
            try
            {
                string genres = "";
                foreach (int i in ListBox3.GetSelectedIndices())
                    genres += ListBox3.Items[i] + ",";
                if (genres.Length > 0)
                    genres = genres.Remove(genres.Length - 1);

                // Default image
                string filepath = "~/book_inventory/booksearch.jpg";

                // Save uploaded file if exists
                if (fileupload1.HasFile)
                {
                    string filename = Path.GetFileName(fileupload1.PostedFile.FileName);
                    string savePath = Server.MapPath("~/book_inventory/" + filename);
                    fileupload1.SaveAs(savePath);
                    filepath = "~/book_inventory/" + filename;

                    // Update preview
                    img.ImageUrl = filepath;
                }

                // Parse numbers and date
                if (!Decimal.TryParse(bookcost.Text.Trim(), out decimal bookCost) ||
                    !Int32.TryParse(pages.Text.Trim(), out int pagesCount) ||
                    !Int32.TryParse(actual.Text.Trim(), out int stock) ||
                    !DateTime.TryParse(txtPublishDate.Text.Trim(), out DateTime publishDate))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid input detected');", true);
                    return;
                }

                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    string query = @"
            INSERT INTO book_master_tbl
            (book_id, book_name, genre, author_name, publisher_name,
             publish_date, language, edition, book_cost, no_of_pages,
             book_description, actual_stock, current_stock, book_img_link)
            VALUES
            (@book_id, @book_name, @genre, @author_name, @publisher_name,
             @publish_date, @language, @edition, @book_cost, @no_of_pages,
             @book_description, @actual_stock, @current_stock, @book_img_link)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@book_id", txtBookID.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_name", textbox2.Text.Trim());
                        cmd.Parameters.AddWithValue("@genre", genres);
                        cmd.Parameters.AddWithValue("@author_name", DropDownList2.SelectedValue);
                        cmd.Parameters.AddWithValue("@publisher_name", DropDownList4.SelectedValue);
                        cmd.Parameters.AddWithValue("@publish_date", publishDate);
                        cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedValue);
                        cmd.Parameters.AddWithValue("@edition", edition.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_cost", bookCost);
                        cmd.Parameters.AddWithValue("@no_of_pages", pagesCount);
                        cmd.Parameters.AddWithValue("@book_description", txtBookDescription.Text.Trim());
                        cmd.Parameters.AddWithValue("@actual_stock", stock);
                        cmd.Parameters.AddWithValue("@current_stock", stock);
                        cmd.Parameters.AddWithValue("@book_img_link", filepath);

                        cmd.ExecuteNonQuery();
                    }
                }

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Book added successfully');", true);

                // Rebind GridView to show correct image
                GridView1.DataBind();

                // Reset fileupload after postback so user can choose new file if needed
                fileupload1.Attributes.Clear();

            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
            }
        }
        void updateBook()
        {
            try
            {
                if (!checkIfBookExists())
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Book does not exist.');", true);
                    return;
                }

                string genres = "";
                foreach (int i in ListBox3.GetSelectedIndices())
                    genres += ListBox3.Items[i] + ",";
                if (genres.Length > 0) genres = genres.Remove(genres.Length - 1);

                string filepath = null;

                if (fileupload1.HasFile)
                {
                    string filename = Path.GetFileName(fileupload1.PostedFile.FileName);
                    string savePath = Server.MapPath("~/book_inventory/" + filename);
                    fileupload1.SaveAs(savePath);
                    filepath = "~/book_inventory/" + filename;

                    // Update preview immediately
                    img.ImageUrl = filepath;
                }
                else
                {
                    // Keep existing image if no new file
                    using (SqlConnection con = new SqlConnection(strcon))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("SELECT book_img_link FROM book_master_tbl WHERE book_id=@book_id", con);
                        cmd.Parameters.AddWithValue("@book_id", txtBookID.Text.Trim());
                        object result = cmd.ExecuteScalar();
                        filepath = result != null ? result.ToString() : "~/book_inventory/booksearch.jpg";
                    }
                }

                if (!Decimal.TryParse(bookcost.Text.Trim(), out decimal bookCost) ||
                    !Int32.TryParse(pages.Text.Trim(), out int pagesCount) ||
                    !Int32.TryParse(actual.Text.Trim(), out int stock) ||
                    !DateTime.TryParse(txtPublishDate.Text.Trim(), out DateTime publishDate))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid input detected');", true);
                    return;
                }

                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    string query = @"
            UPDATE book_master_tbl
            SET book_name=@book_name, genre=@genre, author_name=@author_name,
                publisher_name=@publisher_name, publish_date=@publish_date, language=@language,
                edition=@edition, book_cost=@book_cost, no_of_pages=@no_of_pages,
                book_description=@book_description, actual_stock=@actual_stock,
                current_stock=@current_stock, book_img_link=@book_img_link
            WHERE book_id=@book_id";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@book_id", txtBookID.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_name", textbox2.Text.Trim());
                        cmd.Parameters.AddWithValue("@genre", genres);
                        cmd.Parameters.AddWithValue("@author_name", DropDownList2.SelectedValue);
                        cmd.Parameters.AddWithValue("@publisher_name", DropDownList4.SelectedValue);
                        cmd.Parameters.AddWithValue("@publish_date", publishDate);
                        cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedValue);
                        cmd.Parameters.AddWithValue("@edition", edition.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_cost", bookCost);
                        cmd.Parameters.AddWithValue("@no_of_pages", pagesCount);
                        cmd.Parameters.AddWithValue("@book_description", txtBookDescription.Text.Trim());
                        cmd.Parameters.AddWithValue("@actual_stock", stock);
                        cmd.Parameters.AddWithValue("@current_stock", stock);
                        cmd.Parameters.AddWithValue("@book_img_link", filepath);

                        cmd.ExecuteNonQuery();
                    }
                }

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Book updated successfully');", true);
                GridView1.DataBind();

                // Clear FileUpload after postback
                fileupload1.Attributes.Clear();

            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
            }
        }

        void deleteBook()
        {
            try
            {
                if (!checkIfBookExists())
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Book with this ID does not exist.');", true);
                    return;
                }

                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    string query = "DELETE FROM book_master_tbl WHERE book_id=@book_id";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@book_id", txtBookID.Text.Trim());
                        cmd.ExecuteNonQuery();
                    }
                }

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Book deleted successfully');", true);
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
            }
        }

        void getBookByID()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    string query = "SELECT * FROM book_master_tbl WHERE book_id=@book_id";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@book_id", txtBookID.Text.Trim());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            // Populate fields
                            textbox2.Text = dt.Rows[0]["book_name"].ToString();

                            // Genres
                            string[] selectedGenres = dt.Rows[0]["genre"].ToString().Split(',');
                            for (int i = 0; i < ListBox3.Items.Count; i++)
                            {
                                ListBox3.Items[i].Selected = selectedGenres.Contains(ListBox3.Items[i].Text);
                            }

                            DropDownList2.SelectedValue = dt.Rows[0]["author_name"].ToString();
                            DropDownList4.SelectedValue = dt.Rows[0]["publisher_name"].ToString();
                            DropDownList1.SelectedValue = dt.Rows[0]["language"].ToString();
                            edition.Text = dt.Rows[0]["edition"].ToString();
                            bookcost.Text = dt.Rows[0]["book_cost"].ToString();
                            pages.Text = dt.Rows[0]["no_of_pages"].ToString();
                            actual.Text = dt.Rows[0]["actual_stock"].ToString();
                            txtPublishDate.Text = Convert.ToDateTime(dt.Rows[0]["publish_date"]).ToString("yyyy-MM-dd");
                            txtBookDescription.Text = dt.Rows[0]["book_description"].ToString();

                            // --- NEW: Set Image preview ---
                            if (dt.Rows[0]["book_img_link"] != DBNull.Value)
                            {
                                img.ImageUrl = dt.Rows[0]["book_img_link"].ToString();
                            }
                            else
                            {
                                img.ImageUrl = "~/booksearch.jpg";
                            }
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Book not found');", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
