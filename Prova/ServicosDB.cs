using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AplicativosWeb.Libs
{
    public class ServicosDB : IDisposable
    {
        public const string SERVIDOR = "DESKTOP-TLF7PRK";
        public const string BANCO = "db_5si";
        public const string USUARIO = "sa";
        public const string SENHA = "37836920";

        private SqlConnection Conexao;

        public ServicosDB()
        {
            SqlConnectionStringBuilder sb = new SqlConnectionStringBuilder()
            {
                DataSource = SERVIDOR,
                InitialCatalog = BANCO,
                UserID = USUARIO,
                Password = SENHA
            };

            Conexao = new SqlConnection(sb.ToString());
            Conexao.Open();
        }

        public SqlCommand CriarCommand(string Sql)
        {
            return new SqlCommand(Sql, Conexao);
        }

        /// <summary>
        /// Quando for enviar um SELECT para o banco use este método
        /// </summary>
        /// <param name="Sql">Comando select a ser enviado</param>
        /// <returns>Um SqlDataReader para leitura dos dados retornados pelo select</returns>
        public SqlDataReader ExecQuery(string Sql)
        {
            return CriarCommand(Sql).ExecuteReader();
        }

        /// <summary>
        /// Quando for enviar um comando de atualização (INSERT, UPDATE, DELETE, etc) use este método
        /// </summary>
        /// <param name="Sql">Comando a ser enviado</param>
        /// <returns>Retorna o total de linhas atualizadas</returns>
        public int ExecUpdate(string Sql)
        {
            return CriarCommand(Sql).ExecuteNonQuery();
        }

        /// <summary>
        /// Quando for executar uma consulta que retorna apenas um valor (1 linha e 1 coluna)
        /// </summary>
        /// <param name="Sql">Comando a ser enviado</param>
        /// <returns>O valor</returns>
        public object ExecQueryValue(string Sql)
        {
            return CriarCommand(Sql).ExecuteScalar();
        }

        public void Dispose()
        {
            Conexao.Close();
            Conexao.Dispose();
        }
    }
}