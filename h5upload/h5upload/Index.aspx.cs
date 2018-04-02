using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace h5upload
{
	public partial class Index : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			
				var aa = Request.Form.AllKeys;
				var bb = Request.FilePath[0];


			
		}
	}
}