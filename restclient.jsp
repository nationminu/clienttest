<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="org.apache.http.HttpResponse" %>
<%@page import="org.apache.http.NameValuePair" %>
<%@page import="org.apache.http.message.BasicNameValuePair" %>
<%@page import="org.apache.http.client.entity.UrlEncodedFormEntity" %>
<%@page import="org.apache.http.client.ClientProtocolException" %>
<%@page import="org.apache.http.client.HttpClient" %>
<%@page import="org.apache.http.client.methods.HttpGet" %>
<%@page import="org.apache.http.client.methods.HttpPost" %>
<%@page import="org.apache.http.impl.client.HttpClientBuilder" %> 
<%@page import="org.apache.http.impl.client.DefaultHttpClient" %> 

<html>
<head>
	<title>Rest Client</title>
</head>
<body>
    <h1>Rest Client Test</h1>
    <P>
	<%
		String USER_AGENT = "curl/7.58.0/restclientexample";

		String url = request.getParameter("url"); // "http://dummy.restapiexample.com/api/v1/employees";
		String method = request.getParameter("method"); // "http://dummy.restapiexample.com/api/v1/employees";

		HttpClient client = HttpClientBuilder.create().build();
		HttpResponse rs;

		if(method.equals("POST")) {
			HttpPost post = new HttpPost(url);		
			// add header
			post.setHeader("User-Agent", USER_AGENT);  
			rs = client.execute(post);
		}else{
			HttpGet get = new HttpGet(url);		
			// add header
			get.setHeader("User-Agent", USER_AGENT);  
			rs = client.execute(get);
		} 

		out.println("<strong> Response Code : </strong>" 
	                + rs.getStatusLine().getStatusCode());

		BufferedReader rd = new BufferedReader(
		        new InputStreamReader(rs.getEntity().getContent()));

		StringBuffer result = new StringBuffer();
		String line = "";
		while ((line = rd.readLine()) != null) {
			result.append(line);
		}
		out.println("<BR>");

		out.println("<strong> Response Body : </strong> " 
					+ result.toString());
	%>
    </P>
</body>
</html>
<% 
 System.out.println("- Done");
%>
