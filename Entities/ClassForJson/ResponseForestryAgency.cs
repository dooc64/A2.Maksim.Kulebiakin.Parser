using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.ClassForJson
{
    public class ResponseForestryAgency
    {
        public ListOfWoodDeals Data { get; set; }
    }

    public class ListOfWoodDeals
    {
        [JsonProperty("searchReportWoodDeal")]
        public WoodDeals WoodDeals { get; set; }
    }

    public class WoodDeals
    {
        [JsonProperty("content")]
        public List<Deal> Deals { get; set; }
    }
}
