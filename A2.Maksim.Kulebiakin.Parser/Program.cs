using A2.Maksim.Kuelbiakin.BLL.Core;
using A2.Maksim.Kuelbiakin.BLL.Handlers;
using Entities.ClassForJson;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Threading;

namespace A2.Maksim.Kulebiakin.Parser
{
    public class Program
    {
        static CoreLogic coreLogic = new CoreLogic();
        
        static void Main(string[] args)
        {
            while (true)
            {
                Console.WriteLine(DateTime.Now + " Parsing process was started");
                coreLogic.Update();
                Console.WriteLine(DateTime.Now + " Database was updated");
                Thread.Sleep(TimeSpan.FromMinutes(10));
            }
        }
    }
}
