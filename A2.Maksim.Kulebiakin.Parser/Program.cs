using A2.Maksim.Kuelbiakin.BLL.Handlers;
using A2.Maksim.Kuelbiakin.Handlers.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using Newtonsoft.Json;
using System.Text;
using System.Threading.Tasks;

namespace A2.Maksim.Kulebiakin.Parser
{
    public class Program
    {
        static void Main(string[] args)
        {
            var postRequest = new PostRequestHandler("https://www.lesegais.ru/open-area/graphql");

            var cookieContainer = new CookieContainer();

            postRequest.Proxy = new WebProxy("127.0.0.1:8888");

            postRequest.Data = "{\"query\":\"query SearchReportWoodDeal($size: Int!, $number: Int!, $filter: Filter, $orders: [Order!]) {\\n  searchReportWoodDeal(filter: $filter, pageable: {number: $number, size: $size}, orders: $orders) {\\n    content {\\n      sellerName\\n      sellerInn\\n      buyerName\\n      buyerInn\\n      woodVolumeBuyer\\n      woodVolumeSeller\\n      dealDate\\n      dealNumber\\n      __typename\\n    }\\n    __typename\\n  }\\n}\\n\",\"variables\":{\"size\":10000,\"number\":0},\"operationName\":\"SearchReportWoodDeal\"}";

            postRequest.Accept = "*/*";

            postRequest.UserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36";

            postRequest.ContentType = "application/json";

            postRequest.Host = "www.lesegais.ru";

            postRequest.Headers.Add("Origin", "https://www.lesegais.ru");

            postRequest.Headers.Add("sec-ch-ua", "\".Not/A)Brand\"; v = \"99\", \"Google Chrome\"; v = \"103\", \"Chromium\"; v = \"103\"");

            postRequest.Headers.Add("sec-ch-ua-mobile", "?0");

            postRequest.Headers.Add("sec-ch-ua-platform", "Windows");

            postRequest.Headers.Add("Sec-Fetch-Dest", "empty");

            postRequest.Headers.Add("Sec-Fetch-Mode", "cors");

            postRequest.Headers.Add("Sec-Fetch-Site", "same-origin");

            postRequest.Referer = "https://www.lesegais.ru/open-area/deal";

            postRequest.Run(cookieContainer);

            var response = postRequest.Response;
        }
    }
}
