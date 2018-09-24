using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Host;

namespace faJSONXML
{
    public static class ConvertToXML
    {
        [FunctionName("ConvertToXml")]
        public static async Task<HttpResponseMessage> RunToXmlAsync([HttpTrigger
(AuthorizationLevel.Function, "post", Route = null)]HttpRequest req, TraceWriter log)
        {
            if (req.ContentType.IndexOf(@"/json", 0, System.StringComparison.OrdinalIgnoreCase) == -1)
            {
                return new HttpResponseMessage(System.Net.HttpStatusCode.BadRequest)
                {
                    Content = new StringContent(@"Content-Type header must be a JSON content type")
                };
            }

            var json = await req.ReadAsStringAsync();
            XmlDocument doc = JsonConvert.DeserializeXmlNode(json);

            StringBuilder output = new StringBuilder();
            using (var sw = new StringWriter(output))
                doc.WriteTo(new XmlTextWriter(sw));

            return new HttpResponseMessage(System.Net.HttpStatusCode.OK)
            {
                Content = new StringContent(output.ToString(), Encoding.Default, @"application/xml"),
            };
        }
    }
}
