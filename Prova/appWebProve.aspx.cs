using AplicativosWeb.Libs;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prova
{
    public partial class appWebProve : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                clear();
                updateGridView();
            }
        }

        public void updateGridView()
        {
            using (ServicosDB sdb = new ServicosDB()) {
                GridView1.DataSource = sdb.ExecQuery("select * from fornecedor");
                GridView1.DataBind();
            }
        }

        public void clear()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
        }

        public void alert(String msg)
        {
            Response.Write($"<script>alert('{msg}')</script>");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            clear();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            using (ServicosDB sdb = new ServicosDB())
            {
                String sql = $"insert into fornecedor values ('{TextBox1.Text}','{TextBox2.Text}','{TextBox3.Text}','{TextBox4.Text}')";
                if (sdb.ExecUpdate(sql) > 0)
                {
                    alert("Usuario inserido com sucesso");
                    clear();
                    updateGridView();
                }
                else
                {
                    alert("Não foi possivel inserir o usuario.");
                }
                
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            using (ServicosDB sdb = new ServicosDB())
            {
                String sql = $"update fornecedor set nome_fornecedor = '{TextBox2.Text}', nome_segmento = '{TextBox3.Text}', endereco_fornecedor = '{TextBox4.Text}' where cnpj_fornecedor = '{TextBox1.Text}'";
                if (sdb.ExecUpdate(sql) > 0)
                {
                    alert("Usuario atualizado com sucesso");
                    clear();
                    updateGridView();
                }
                else
                {
                    alert("Não foi possivel atualizar o usuario.");
                }

            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "carregar")
            {
                int row = Convert.ToInt32(e.CommandArgument);
                string cnpj = GridView1.Rows[row].Cells[0].Text;

                using (ServicosDB sdb = new ServicosDB())
                {
                    SqlDataReader sda = sdb.ExecQuery($"select * from fornecedor where cnpj_fornecedor = {cnpj}");
                    if (sda.Read())
                    {
                        TextBox1.Text = $"{sda["cnpj_fornecedor"]}";
                        TextBox2.Text = $"{sda["nome_fornecedor"]}";
                        TextBox3.Text = $"{sda["nome_segmento"]}";
                        TextBox4.Text = $"{sda["endereco_fornecedor"]}";
                    }
                    sda.Close();
                }
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            using (ServicosDB sdb = new ServicosDB())
            {
                String sql = $"delete from fornecedor where cnpj_fornecedor = {TextBox1.Text}";
                if (sdb.ExecUpdate(sql) > 0) {
                    alert("O usuario foi deletado com sucesso!");
                    clear();
                    updateGridView();
                }else{
                    alert("O usuario não pôde ser deletado.");
                }

            }
        }
    }
}