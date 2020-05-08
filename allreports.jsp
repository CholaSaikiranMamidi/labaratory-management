
<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ include file="adminheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
a:link {
  color:blue;
  background-color: transparent;
  text-decoration: none;
}
a:visited {
  color: blue;
  background-color: transparent;
  text-decoration: none;
}
a:hover {
  color: red;
  background-color: transparent;
  text-decoration: underline;
}
a:active {
  color: blue;
  background-color: transparent;
  text-decoration: underline;
}
</style>
</head>
<body>
<br>
<br>
<input type="button" align="top-right" style="background-color:green;font-weight:bold;color:white;float:right;" value="print" onClick="window.print()"  >
<h1><center>Over All Reports</center></h1>
<br>
<div class="container">
<form action="" method="post">
<div class="form-group">
<div class="col-sm-5">
<div class="input-group">
<input type="text"  name="search" class="form-control" placeholder="Type the company name " autocomplete="off" >
<div class="input-group-btn">

<button type="submit" value="Serach" class="btn btn-primary" ><i class="fa fa-search"></i></button>
</div>
</div>
</div><br>





<br>
<br>
<%

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/lms1?serverTimezone=UTC", "root","");
	if(request.getParameter("search")!=null)
	{
		%>
		<table  border="1">
<tr>
<th style="width: 15%">SID</th>
<th style="width: 15%">CPU_ID</th>
<th style="width: 15%">RAM</th>
<th style="width: 15%">MAC</th>

<th style="width: 15%">COMPANY</th>
<th style="width: 15%">HARD_DISC</th>
<th style="width: 15%">PRICE</th>
<th style="width: 15%">LOCATION</th>
<th style="width: 15%">BILL_DATE</th>
<th style="width: 15%">STATUS</th>
<th style="width: 15%">COM_ID</th>
<th style="width: 15%">COM_NAME</th>

<th style="width: 15%">COM_COMPANY</th>
<th style="width: 15%">PRICE</th>
<th style="width: 15%">BILL_DATE</th>
<th style="width: 15%">STATUS</th>
</tr>
		<%
String qr="select * from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.labname like '%"+request.getParameter("search")+"%'";
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(qr);
while(rs.next())
{
	

	%>
	<TR>
	<TD><%=rs.getString("s.sid")%></TD>
<TD><%=rs.getString("c.cid")%></TD>
<TD><%=rs.getString("c.ram")%></TD>
<TD><%=rs.getString("c.MAC")%></TD>

<TD><%=rs.getString("c.company")%></TD>
<TD><%=rs.getString("c.HardDisk")%></TD>
<TD><%=rs.getInt("c.price")%></TD>
<TD><%=rs.getString("l.labname")%></TD>
<TD><%=rs.getString("c.BillDate")%></TD>
<TD><%=rs.getInt("c.status")%></TD>
<TD><%=rs.getString("m.com_id") %></TD>
<TD><%=rs.getString("m.com_name")%></TD>

<TD><%=rs.getString("m.com_company")%></TD>
<TD><%=rs.getString("m.price")%></TD>
<TD><%=rs.getString("m.BillDate")%></TD>
<TD><%=rs.getInt("m.status")%></TD>



	</TR>
	
	</table>
	<br>
	
	
	<table class="table table-bordered table-striped" align="center" border="1">
	<th style="width: 15%">item_name</th>
<th style="width: 15%">TOTLE</th>
<th style="width: 15%">WORKING</th>
<th style="width: 15%">NOT EORKING</th>




<tr>
	<td style="width: 15%">CPU</td>
	<%
	
}
String s="select count(DISTINCT c.cid) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id  && s.sid=l.sid && l.labname like '%"+request.getParameter("search")+"%'";
Statement n=con.createStatement();
ResultSet w=n.executeQuery(s);
while(w.next())
{
	%>
	<br>
	
<td ><%=w.getString(1)%></td>

	
	<%
	
}
String ch="select count(*) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && c.status=0 && l.labname like '%"+request.getParameter("search")+"%'";
Statement me=con.createStatement();
ResultSet pa=me.executeQuery(ch);
while(pa.next())
{
	%>
	<br>
	

<td><%=pa.getString(1)%></td>

	

	
	<%
	
}
String du="select count(*) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && c.status=1 && s.sid=l.sid && l.labname like '%"+request.getParameter("search")+"%'";
Statement ne=con.createStatement();
ResultSet sw=ne.executeQuery(du);
while(sw.next())
{
	%>
	<br>
	
<td><%=sw.getString(1)%></td>

</tr>
<tr><td style="width: 15%">MOUSE</td>	
<%
	
}
String h="select count(*) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && m.com_name='mouse' && m.status=1 && l.labname like '%"+request.getParameter("search")+"%'";
Statement j=con.createStatement();
ResultSet l=j.executeQuery(h);
while(l.next())
{
	%>
	<br>
    
<td><%=l.getString(1)%></td>
	
	<%
	
}
String ab="select count(*) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && m.com_name='mouse' && m.status=0 && l.labname like '%"+request.getParameter("search")+"%'";
Statement cd=con.createStatement();
ResultSet ef=cd.executeQuery(ab);
while(ef.next())
{
	%>
	<br>


<td><%=ef.getString(1)%></td>

	<%
	
}
String gh="select count(*) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && m.com_name='mouse' && m.status=1 && l.labname like '%"+request.getParameter("search")+"%'";
Statement ij=con.createStatement();
ResultSet kl=cd.executeQuery(gh);
while(kl.next())
{
	%>
	<br>
    
<td><%=kl.getString(1)%></td>
</tr>
<tr><td style="width: 15%">KEYBOARD</td>
<%
	
}
String p="select count(*) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && m.com_name='keyboard' && m.status=0 && l.labname like '%"+request.getParameter("search")+"%'";
Statement v=con.createStatement();
ResultSet x=v.executeQuery(p);
while(x.next())
{
	%>
	<br>
	
<td><%=x.getString(1)%></td>
	<%
	
}
String mn="select count(*) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && m.com_name='keyboard' && m.status=1 && l.labname like '%"+request.getParameter("search")+"%'";
Statement op=con.createStatement();
ResultSet qz=op.executeQuery(mn);
while(qz.next())
{
	%>
	<br>
	
<td><%=qz.getString(1)%></td>

	<%
	
}
String sp="select count(*) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && m.com_name='keyboard' && m.status=0 && l.labname like '%"+request.getParameter("search")+"%'";
Statement uv=con.createStatement();
ResultSet wx=uv.executeQuery(sp);
while(wx.next())
{
	%>
	<br>
	
<td><%=wx.getString(1)%></td>
</tr>
<tr><td style="width: 15%">MONITOR</td>
<%
	
}
String d="select count(*) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && m.com_name='monitor' && m.status=1 && l.labname like '%"+request.getParameter("search")+"%'";

ResultSet u=v.executeQuery(d);
while(u.next())
{
	%>
	<td><%=u.getString(1)%></td>
	<%
	
}
String az="select count(*) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && m.com_name='monitor' && m.status=0 && l.labname like '%"+request.getParameter("search")+"%'";
Statement by=con.createStatement();
ResultSet cx=by.executeQuery(az);
while(cx.next())
{
	%>
	<br>
	
<td><%=cx.getString(1)%></td>
	<%
	
}
String dw="select count(*) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && m.com_name='monitor' && m.status=1 && l.labname like '%"+request.getParameter("search")+"%'";
Statement ev=con.createStatement();
ResultSet fu=ev.executeQuery(dw);
while(fu.next())
{
	%>
	<br>
	
<td><%=fu.getString(1)%></td>
</tr>



</table>

	<%
	
}%>


<%
	}
	else
	{
		%>
		<table  border="1">
<tr>
<th style="width: 15%">SID</th>
<th style="width: 15%">CPU_ID</th>
<th style="width: 15%">RAM</th>
<th style="width: 15%">MAC</th>

<th style="width: 15%">COMPANY</th>
<th style="width: 15%">HARD_DISC</th>
<th style="width: 15%">PRICE</th>
<th style="width: 15%">LOCATION</th>
<th style="width: 15%">BILL_DATE</th>
<th style="width: 15%">STATUS</th>
<th style="width: 15%">COM_ID</th>
<th style="width: 15%">COM_NAME</th>

<th style="width: 15%">COM_COMPANY</th>
<th style="width: 15%">PRICE</th>
<th style="width: 15%">BILL_DATE</th>
<th style="width: 15%">STATUS</th>
</tr>
		<%
		String qr="select * from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(qr);
		while(rs.next())
		{
			%>
			<TR>
			<TD><%=rs.getString("s.sid")%></TD>
		<TD><%=rs.getString("c.cid")%></TD>
		<TD><%=rs.getString("c.ram")%></TD>
		<TD><%=rs.getString("c.MAC")%></TD>
		
		<TD><%=rs.getString("c.company")%></TD>
		<TD><%=rs.getString("c.HardDisk")%></TD>
		<TD><%=rs.getInt("c.price")%></TD>
		<TD><%=rs.getString("l.labname")%></TD>
		<TD><%=rs.getString("c.BillDate")%></TD>
		<TD><%=rs.getInt("c.status")%></TD>
		<TD><%=rs.getString("m.com_id") %></TD>
		<TD><%=rs.getString("m.com_name")%></TD>
		
		<TD><%=rs.getString("m.com_company")%></TD>
		<TD><%=rs.getString("m.price")%></TD>
		<TD><%=rs.getString("m.BillDate")%></TD>
		<TD><%=rs.getInt("m.status")%></TD>
		
		

			</TR>
			
			</table>
			
			<br>
			
			
			<table class="table table-bordered table-striped" align="center" border="1">
			<th style="width: 15%">item_name</th>
<th style="width: 15%">TOTLE</th>
<th style="width: 15%">WORKING</th>
<th style="width: 15%">NOT EORKING</th>
				
			<tr>
	<td style="width: 15%">CPU</td>
	<%
			
		}
		String q="select count(DISTINCT c.cid) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid";
		Statement p=con.createStatement();
		ResultSet o=p.executeQuery(q);
		while(o.next())
		{
			%>
			<br>
			
		<td><%=o.getString(1)%></td>
			<%
			
		}
		String gt="select count(*) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && c.status=1 && s.sid=l.sid ";
		Statement hs=con.createStatement();
		ResultSet ir=hs.executeQuery(gt);
		while(ir.next())
		{
			%>
			<br>

		<td><%=ir.getString(1)%></td>

			

			
			<%
			
		}
		String jq="select count(*) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && c.status=0";
		Statement kp=con.createStatement();
		ResultSet lo=kp.executeQuery(jq);
		while(lo.next())
		{
			%>
			<br>
			
		<td><%=lo.getString(1)%></td>


			</tr>
						<tr>
	<td style="width: 15%">Mouse</td>
			<%
			
		}
		String z="select count(*) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && m.com_name='mouse'  ";
		Statement x=con.createStatement();
		ResultSet l=x.executeQuery(z);
		while(l.next())
		{
			%>
			<br>

		<td><%=l.getString(1)%></td>
			
			<%
			
		}
		String mz="select count(*) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id &&s.sid=l.sid && m.com_name='mouse' && m.status=0";
		Statement na=con.createStatement();
		ResultSet oz=na.executeQuery(mz);
		while(oz.next())
		{
			%>
<br>

		<td><%=oz.getString(1)%></td>

			<%
			
		}
		String pz="select count(*) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && m.com_name='mouse' && m.status=1 ";
		Statement qx=con.createStatement();
		ResultSet rl=qx.executeQuery(pz);
		while(rl.next())
		{
			%>
			<br>

		<td><%=rl.getString(1)%></td>
		</tr><tr>
	<td style="width: 15%">Mouse</td>

			<%
			
		}
		String a="select count(*) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && m.com_name='keyboard' ";
		Statement v=con.createStatement();
		ResultSet c=v.executeQuery(a);
		while(c.next())
		{
			%>
			<br>
			
		<td><%=c.getString(1)%></td>
			<%
			
		}
		String sh="select count(*) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && m.com_name='keyboard' && m.status=1";
		Statement lq=con.createStatement();
		ResultSet qwe=lq.executeQuery(sh);
		while(qwe.next())
		{
			%>
			<br>
			
			
		<td><%=qwe.getString(1)%></td>

			<%
			
		}
		String spa="select count(*) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && m.com_name='keyboard' && m.status=0";
		Statement uva=con.createStatement();
		ResultSet wxc=uva.executeQuery(spa);
		while(wxc.next())
		{
			%>
			<br>
			
		<td><%=wxc.getString(1)%></td>
</tr><tr>
	<td style="width: 15%">Mouse</td>
	<%
			
		}
		String w="select count(*) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && m.com_name='monitor'";
		Statement evee=con.createStatement();
		ResultSet f=evee.executeQuery(w);
		while(f.next())
		{
			%>
			<br>
			
		<td><%=f.getString(1)%></td>
			<%
			
		}
		String azw="select count(*) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && m.com_name='monitor' && m.status=0";
		Statement bye=con.createStatement();
		ResultSet cxd=bye.executeQuery(azw);
		while(cxd.next())
		{
			%>
			<br>
			
		<td><%=cxd.getString(1)%></td>
			<%
			
		}
		String dwl="select count(*) from cpu c,components m,system s,lab l where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && m.com_name='monitor' && m.status=1";
		Statement eve=con.createStatement();
		ResultSet ful=eve.executeQuery(dwl);
		while(ful.next())
		{
			%>
			<br>
			
		<td><%=ful.getString(1)%></td>
		</tr>
		</table>

			<%
			
		}


		
		
	}
	
			
				
	
}
catch(Exception e)
{
e.printStackTrace();
out.print(e);
}
%>
<center><a href="allreports.jsp" target="_blank">Back</a></center>

</div>

</form>
</body>
</html>

