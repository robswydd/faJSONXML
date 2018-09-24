using System.Xml;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Host;
using Newtonsoft.Json;

namespace faJSONXML
{
    [FunctionName("ConvertToJson")]
    public static IActionResult RunToJson([HttpTrigger
(AuthorizationLevel.Function, "post", Route = null)]HttpRequest req, TraceWriter log)
    {
        if (req.ContentType.IndexOf(@"/xml", 0, System.StringComparison.OrdinalIgnoreCase) == -1)
        {
            return new BadRequestObjectResult(@"Content-Type header must be an XML content type");
        }

        XmlDocument doc = new XmlDocument();
        doc.Load(req.Body);

        return new OkObjectResult(doc);
    }
       
}
