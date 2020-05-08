
<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>

<!--style>
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
</style-->
<body>
<h1><center>Report</center></h1>
<br>
<form action="" method="post">
<div class="container">
<div class="form-group">
<div class="col-sm-5">
<div class="input-group">
<input type="text"  name="search" class="form-control" placeholder="name of the lab " autocomplete="off">
<div class="input-group-btn">
<button type="submit" value="Search" class="btn btn-primary" ><span class="fa fa-search"></span></button>
</div>
</div>
</div>
</div>
</div>
</form><br>



</tr>
<input type="button" class="btn btn-primary" align="left-top-corner"value="print" onClick="window.print()" style="float:right" >
<br>
<br>
<%

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lms1", "root", "");
		

if(request.getParameter("search")!=null)
	{%>
		<table  class="table table-bordered table-striped">
<tr>
<th style="color:green">SID</th>

<th style="color:green">RAM</th>
<th style="color:green">MAC</th>

<th style="color:green">COMPANY</th>
<th style="color:green">HARD_DISC</th>
<th style="color:green">PRICE</th>
<th style="color:green">LOCATION</th>
<th style="color:green">BILL_DATE</th>
<th style="color:green">STATUS</th>


<th style="color:green">Mouse</th>
<th style="color:green">Key Board</th>

<th style="color:green">Monitor</th>




		<%
		
String qr="select * from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid  && l.labname like '%"+request.getParameter("search")+"%'";
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(qr);

String query1="select m.com_company from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && m.com_name='Mouse' ";
		Statement statement1=con.createStatement();
		ResultSet resultset1=statement1.executeQuery(query1);
		
		String query2="select m.com_company from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && m.com_name='KeyBoard' ";
		Statement statement2=con.createStatement();
		ResultSet resultset2=statement2.executeQuery(query2);
		
		String query3="select m.com_company from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && m.com_name='Monitor' ";
		Statement statement3=con.createStatement();
		ResultSet resultset3=statement3.executeQuery(query3);

while(rs.next() || resultset1.next() || resultset2.next() || resultset3.next())
{
	

	%>
	<TR>
	<TD><%=rs.getString("s.sid")%></TD>

<TD><%=rs.getString("c.ram")%></TD>
<TD><%=rs.getString("c.MAC")%></TD>

<TD><%=rs.getString("c.company")%></TD>
<TD><%=rs.getString("c.HardDisk")%></TD>
<TD><%=rs.getInt("c.price")%></TD>
<TD><%=rs.getString("l.labname")%></TD>
<TD><%=rs.getString("c.BillDate")%></TD>
	<% int un=rs.getInt("c.status");
				if(un==0){%>
<b><td style="color:green">working</td></b>
<%}
else{%>
<b><td style="color:red">Not Working</td></b>
<%}%>
<TD><%=resultset1.getString("m.com_company") %></TD>
<TD><%=resultset2.getString("m.com_company")%></TD>

<TD><%=resultset3.getString("m.com_company")%></TD>



	</TR>
<% } %>
	</table>
	<br>
	<br>
	<br>
	
	<br>
	
	<table align="center" class="table table-bordered table-striped">
	<th style="color:green">Item_name</th>
	<th style="color:green">TOTAL</th>
	<th style="color:green">WORKING</th>
	<th style="color:green">NOT WORKING</th>




<tr>
	<td>CPU</td>
	<%
	

String s="select count(DISTINCT c.cid) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id  && s.sid=l.sid && l.empid=e.empid  && l.labname like '%"+request.getParameter("search")+"%'";
Statement n=con.createStatement();
ResultSet w=n.executeQuery(s);
while(w.next())
{
	%>
	<br>
	
<td><%=w.getString(1)%></td>

	
	<%
	
}
String ch="select count(DISTINCT c.cid) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && c.status=0 && l.labname like '%"+request.getParameter("search")+"%'";
Statement me=con.createStatement();
ResultSet pa=me.executeQuery(ch);
while(pa.next())
{
	%>
	<br>
	

<td><%=pa.getString(1)%></td>

	

	
	<%
	
}
String du="select count(DISTINCT c.cid) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && l.empid=e.empid && s.sid=l.sid && c.status=1  && l.labname like '%"+request.getParameter("search")+"%'";
Statement ne=con.createStatement();
ResultSet sw=ne.executeQuery(du);
while(sw.next())
{
	%>
	<br>
	
<td><%=sw.getString(1)%></td>

</tr>
<tr><td>Mouse</td>	
<%
	
}
String h="select count(*) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && m.com_name='mouse'   && l.labname like '%"+request.getParameter("search")+"%'";
Statement j=con.createStatement();
ResultSet l=j.executeQuery(h);
while(l.next())
{
	%>
	<br>
    
<td><%=l.getString(1)%></td>
	
	<%
	
}
String ab="select count(*) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && m.com_name='mouse' && m.status=0  && l.labname like '%"+request.getParameter("search")+"%'";
Statement cd=con.createStatement();
ResultSet ef=cd.executeQuery(ab);
while(ef.next())
{
	%>
	<br>


<td><%=ef.getString(1)%></td>

	<%
	
}
String gh="select count(*) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && m.com_name='mouse' && m.status=1  && l.labname like '%"+request.getParameter("search")+"%'";
Statement ij=con.createStatement();
ResultSet kl=cd.executeQuery(gh);
while(kl.next())
{
	%>
	<br>
    
<td><%=kl.getString(1)%></td>
</tr>
<tr><td>Key Board</td>
<%
	
}
String p="select count(*) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && m.com_name='keyboard'   && l.labname like '%"+request.getParameter("search")+"%'";
Statement v=con.createStatement();
ResultSet x=v.executeQuery(p);
while(x.next())
{
	%>
	<br>
	
<td><%=x.getString(1)%></td>
	<%
	
}
String mn="select count(*) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && m.com_name='keyboard' && m.status=0  && l.labname like '%"+request.getParameter("search")+"%'";
Statement op=con.createStatement();
ResultSet qz=op.executeQuery(mn);
while(qz.next())
{
	%>
	<br>
	
<td><%=qz.getString(1)%></td>

	<%
	
}
String sp="select count(*) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && m.com_name='keyboard' && m.status=1 && l.labname like '%"+request.getParameter("search")+"%'";
Statement uv=con.createStatement();
ResultSet wx=uv.executeQuery(sp);
while(wx.next())
{
	%>
	<br>
	
<td><%=wx.getString(1)%></td>
</tr>
<tr><td>Monitor</td>
<%
	
}
String d="select count(*) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && m.com_name='monitor'   && l.labname like '%"+request.getParameter("search")+"%'";

ResultSet u=v.executeQuery(d);
while(u.next())
{
	%>
	<td><%=u.getString(1)%></td>
	<%
	
}
String az="select count(*) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && m.com_name='monitor' && m.status=0  && l.labname like '%"+request.getParameter("search")+"%'";
Statement by=con.createStatement();
ResultSet cx=by.executeQuery(az);
while(cx.next())
{
	%>
	<br>
	
<td><%=cx.getString(1)%></td>
	<%
	
}
String dw="select count(*) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && m.com_name='monitor' && m.status=1  && l.labname like '%"+request.getParameter("search")+"%'";
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
		<table  class="table table-bordered table-striped">
<tr>
<th style="color:green">SID</th>

<th style="color:green">RAM</th>
<th style="color:green">MAC</th>

<th style="color:green">COMPANY</th>
<th style="color:green">HARD_DISC</th>
<th style="color:green">PRICE</th>
<th style="color:green">LOCATION</th>
<th style="color:green">BILL_DATE</th>
<th style="color:green">STATUS</th>


<th style="color:green">Mouse</th>
<th style="color:green">Key Board</th>

<th style="color:green">Monitor</th>
</tr>
		<%
		
		String qr="select * from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && e.Department='"+labname+"'";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(qr);
		
		String query1="select m.com_company from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && m.com_name='Mouse' && e.Department='"+labname+"'";
		Statement statement1=con.createStatement();
		ResultSet resultset1=statement1.executeQuery(query1);
		
		String query2="select m.com_company from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && m.com_name='KeyBoard' && e.Department='"+labname+"'";
		Statement statement2=con.createStatement();
		ResultSet resultset2=statement2.executeQuery(query2);
		
		String query3="select m.com_company from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && m.com_name='Monitor' && e.Department='"+labname+"'";
		Statement statement3=con.createStatement();
		ResultSet resultset3=statement3.executeQuery(query3);
		
		while((rs.next()) || (resultset1.next()) || (resultset2.next()) || (resultset3.next()))
		{
			%>
			<TR>
			<TD><%=rs.getString("s.sid")%></TD>
		
		<TD><%=rs.getString("c.ram")%></TD>
		<TD><%=rs.getString("c.MAC")%></TD>
		
		<TD><%=rs.getString("c.company")%></TD>
		<TD><%=rs.getString("c.HardDisk")%></TD>
		<TD><%=rs.getInt("c.price")%></TD>
		<TD><%=rs.getString("l.labname")%></TD>
		<TD><%=rs.getString("c.BillDate")%></TD>
			<% int un=rs.getInt("c.status");
				if(un==0){%>
			<b><td style="color:green">working</td></b>
			<%}
			else{%>
			<b><td style="color:red">Not Working</td></b>
			<%}%>
			
		<TD><%=resultset1.getString("m.com_company") %></TD>
		<TD><%=resultset2.getString("m.com_company")%></TD>
		
		<TD><%=resultset3.getString("m.com_company")%></TD>
		
		
			</TR>
		<% } %>
			
			</table>
			
			<br>
			
			
		<table align="center" class="table table-bordered table-striped">
		<th style="color:green">Item_name</th>
		<th style="color:green">TOTAL</th>
		<th style="color:green">WORKING</th>
		<th style="color:green">NOT WORKING</th>
				
			<tr>
	<td>CPU</td>
	<%
			
		
		String q="select count(DISTINCT c.cid) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && e.Department='"+labname+"'";
		Statement p=con.createStatement();
		ResultSet o=p.executeQuery(q);
		while(o.next())
		{
			%>
			<br>
			
		<td><%=o.getString(1)%></td>
			<%
			
		}
		String gt="select count(DISTINCT c.cid) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && c.status=0 && s.sid=l.sid && l.empid=e.empid && e.Department='"+labname+"'";
		Statement hs=con.createStatement();
		ResultSet ir=hs.executeQuery(gt);
		while(ir.next())
		{
			%>
			<br>

		<td><%=ir.getString(1)%></td>

			

			
			<%
			
		}
		String jq="select count(DISTINCT c.cid) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && c.status=1 && e.Department='"+labname+"'";
		Statement kp=con.createStatement();
		ResultSet lo=kp.executeQuery(jq);
		while(lo.next())
		{
			%>
			<br>
			
		<td><%=lo.getString(1)%></td>


			</tr>
						<tr>
	<td>Mouse</td>
			<%
			
		}
		String z="select count(*) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && m.com_name='mouse' && e.Department='"+labname+"'";
		Statement x=con.createStatement();
		ResultSet l=x.executeQuery(z);
		while(l.next())
		{
			%>
			<br>

		<td><%=l.getString(1)%></td>
			
			<%
			
		}
		String mz="select count(*) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id &&s.sid=l.sid && l.empid=e.empid && m.com_name='mouse' && m.status=0 && e.Department='"+labname+"'";
		Statement na=con.createStatement();
		ResultSet oz=na.executeQuery(mz);
		while(oz.next())
		{
			%>
<br>

		<td><%=oz.getString(1)%></td>

			<%
			
		}
		String pz="select count(*) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && m.com_name='mouse' && m.status=1 && e.Department='"+labname+"' ";
		Statement qx=con.createStatement();
		ResultSet rl=qx.executeQuery(pz);
		while(rl.next())
		{
			%>
			<br>

		<td><%=rl.getString(1)%></td>
		</tr><tr>
	<td>Key Board</td>

			<%
			
		}
		String a="select count(*) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && m.com_name='keyboard' && e.Department='"+labname+"'";
		Statement v=con.createStatement();
		ResultSet c=v.executeQuery(a);
		while(c.next())
		{
			%>
			<br>
			
		<td><%=c.getString(1)%></td>
			<%
			
		}
		String sh="select count(*) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && m.com_name='keyboard' && m.status=0 && e.Department='"+labname+"'";
		Statement lq=con.createStatement();
		ResultSet qwe=lq.executeQuery(sh);
		while(qwe.next())
		{
			%>
			<br>
			
			
		<td><%=qwe.getString(1)%></td>

			<%
			
		}
		String spa="select count(*) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && m.com_name='keyboard' && m.status=1 && e.Department='"+labname+"'";
		Statement uva=con.createStatement();
		ResultSet wxc=uva.executeQuery(spa);
		while(wxc.next())
		{
			%>
			<br>
			
		<td><%=wxc.getString(1)%></td>
</tr><tr>
	<td>Monitor</td>
	<%
			
		}
		String w="select count(*) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && m.com_name='monitor' && e.Department='"+labname+"'";
		Statement evee=con.createStatement();
		ResultSet f=evee.executeQuery(w);
		while(f.next())
		{
			%>
			<br>
			
		<td><%=f.getString(1)%></td>
			<%
			
		}
		String azw="select count(*) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && m.com_name='monitor' && m.status=0 && e.Department='"+labname+"'";
		Statement bye=con.createStatement();
		ResultSet cxd=bye.executeQuery(azw);
		while(cxd.next())
		{
			%>
			<br>
			
		<td><%=cxd.getString(1)%></td>
			<%
			
		}
		String dwl="select count(*) from cpu c,components m,system s,lab l,employee e where c.cid=s.cid && m.com_id=s.com_id && s.sid=l.sid && l.empid=e.empid && m.com_name='monitor' && m.status=1 && e.Department='"+labname+"'";
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

<!--/div>

</form-->
</body>
</html>

