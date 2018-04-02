using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace h5upload
{
	public partial class tmp : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

			var str = "dataimage;base64,adfasdfaadfasdfas/adsfasfdasdfasdfas0";
			var l = str.IndexOf(',')+1;			
			var s = str.Substring(l , str.Length - l);
			Response.Write(s);
		}
	}
}