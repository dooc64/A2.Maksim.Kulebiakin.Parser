using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace A2.Maksim.Kuelbiakin.BLL.Handlers
{
    public class PostRequestHandler
    {
        private HttpWebRequest _request;

        private string _address;

        public Dictionary<string, string> Headers { get; set; }

        public string Response { get; set; }

        public string Accept { get; set; }

        public string Host { get; set; }

        public string Referer { get; set; }

        public string UserAgent { get; set; }

        public string Data { get; set; }

        public string ContentType { get; set; }

        public WebProxy Proxy { get; set; }


        public PostRequestHandler(string address)
        {
            _address = address;
            Headers = new Dictionary<string, string>();
        }

        public void Run(CookieContainer cookieContainer)
        {
            _request = (HttpWebRequest)WebRequest.Create(_address);
            _request.Method = "Post";
            _request.CookieContainer = cookieContainer;
            _request.Proxy = Proxy;
            _request.Accept = Accept;
            _request.Host = Host;
            _request.ContentType = ContentType;
            _request.UserAgent = UserAgent;
            _request.Referer = Referer;

            byte[] sendData = Encoding.UTF8.GetBytes(Data);
            _request.ContentLength = sendData.Length;
            using (var sendStream = _request.GetRequestStream())
            {
                sendStream.Write(sendData, 0, sendData.Length);
            }

            foreach (var pair in Headers)
            {
                _request.Headers.Add(pair.Key, pair.Value);
            }

            try
            {
                HttpWebResponse response = (HttpWebResponse)_request.GetResponse();
                var stream = response.GetResponseStream();
                if (stream != null)
                {
                    Response = new StreamReader(stream).ReadToEnd();
                }
            }
            catch
            {

            }
        }
    }
}
