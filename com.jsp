
	<%@ include file="adminheader.jsp" %>
    <%
    String s2=(String)session.getAttribute("empid");
    if(s2==null)
    {
    response.sendRedirect("Login.jsp");	
    }
    else
    {
    %>
<!DOCTYPE html>
<html lang="en">
<head>
  
</head>
<body>

<h1><center>ADD COMPONENT</center></h1>
<div class="container">
  <div class="row">
<div class="column">
  <form class="" action="comdb.jsp" method="post">
  <div class ="form-group">
    <label for="com_id">COM_ID</label>
    <input type="text" class="form-control" id="com_id" name="com_id" placeholder="Enter Component ID">
  </div>
  
  <div class="form-group">
  <label for="com_name">COM_NAME</label>
  <select class="form-control" id="com_name" name="com_name" >
   <option>select</option>
   <option>Mouse</option>
   <option>KeyBoard</option>
   <option>Moniter</option>
   </select>
	</div>
  
  
 <!-- 
  
   <div class = "form-group">
    <label for="ram">RAM</label>
    <input type="text" class="form-control" id="ram" name="ram" placeholder="Enter RAM-SIZE">
   </div> 
    -->
      
   
   
   
   
      
   <div class = 'form-group'>
    <label for="com_company">COM_COMPANY</label>
    <input type="text" class="form-control" id="com_company" name="com_company" placeholder="Enter the componet Company">
   </div>
   </div>
   <div class="column">
   <div class = 'form-group'>
    <label for="price">Price</label>
    <input type="text" class="form-control" id="price" name="Price" placeholder="Enter the component price" >
   </div>
        <div class = 'form-group'>
    <label for="Bill_Date">BILLDATE</label>
    <input type="date" class="form-control" id="Bill_Date" name="Bill_Date" placeholder="Enter the BILL_DATE" >
   </div>
   <div class = 'form-group'>
    <label for="status">STATUS</label>
    <select class="form-control" id="status" name="status" >
   <option>select</option>
   <option>0</option>
   <option>1</option>
   </select>
   </div>
   </div>
</div>
      <div class="form-group" align="center">
     <button type="submit" class="btn btn-success">Submit</button>
    
    </div>
    
    </form>
</div>



</body>
</html>
<%
}
%>