using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace h5upload
{
	public partial class ajax : System.Web.UI.Page
	{
		protected string result = string.Empty;
		protected void Page_Load(object sender, EventArgs e)
		{
			Response.Clear();
			string type = Request.QueryString["type"];
			switch (type)
			{
				case "test":
					test();
					break;
				default:
					break;
			}
			Response.Write(result);
			Response.End();
		}

		private void test()
		{

			var p = HttpContext.Current.Server.MapPath("/upload/");
			//目录创建
			if (!Directory.Exists(p))
			{
				Directory.CreateDirectory(p);
			}

			try
			{
				var aa = Request.Form["imgbase64"];
				string base64 = aa.Split(',')[1];
				byte[] b = Convert.FromBase64String(base64);
				System.IO.MemoryStream ms = new System.IO.MemoryStream(b);
				System.Drawing.Image img = System.Drawing.Image.FromStream(ms);
				img.Save(p + new Random().Next(1000) + ".jpg");

			}
			catch (Exception ex)
			{
				throw;
			}


			HttpPostedFile postedFile = HttpContext.Current.Request.Files[0];

			if (postedFile.ContentLength > 0)
			{
				postedFile.SaveAs(p + new Random().Next(1000) + ".jpg");
			}
		}
	}
}