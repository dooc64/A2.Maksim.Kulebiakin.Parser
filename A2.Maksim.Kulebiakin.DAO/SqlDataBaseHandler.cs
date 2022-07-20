using Entities.ClassForJson;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace A2.Maksim.Kulebiakin.DAO
{
    public class SqlDataBaseHandler
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["SqlString"].ConnectionString;

        public void Update(ResponseForestryAgency responses)
        {
            string json = JsonConvert.SerializeObject(responses.Data.WoodDeals);

            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();

                var command = connection.CreateCommand();

                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "UpdateDealsAndCustomerList";

                command.Parameters.AddWithValue("@json", json);

                command.ExecuteNonQuery();
            }
        }
    }
}
