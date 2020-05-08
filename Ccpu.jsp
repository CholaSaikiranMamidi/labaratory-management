<!DOCTYPE html>
<%@ include file="adminheader.jsp" %>
<html lang="en">
<head>
  
</head>
<body>

<h1><center>ADD CPU</center></h1>
<div class="container">

<div class="row">
<div class="column">
  
  <form class="" action="cpu.jsp" method="post">
  <div class="form-group">
    <label for="cpuid">CPU-ID</label>
    <input type="text" class="form-control" id="cpuid" name="cpuid" placeholder="Enter CPU's ID"><br>
  
    <label for="location">LOCATION</label>
    <input type="text" class="form-control " id="location" name="location" placeholder="Enter the Location of the CPU" ><br>
  
    <label for="billdate" >BILLDATE</label>
    <input type="date" class="form-control" id="billdate" name="billdate" placeholder="Enter BillDate (YYYY/MM/DD)" ><br>
   
  <label for="ram">RAM:</label>
  <select class="form-control" id="ram" name="ram" placeholder="Enter RAM-SIZE"><br>
    <option>1GB</option>
    <option>2GB</option>
    <option>3GB</option>
    <option>4GB</option>
    <option>5GB</option>
    <option>6GB</option>
    <option>7GB</option>
    <option>8GB</option>
    <option>9GB</option>
    <option>10GB</option>
  </select><br>

    <label for="harddisk">HARDDISK</label>
    <input type="text" class="form-control" id="harddisk" name="harddisk" placeholder="Enter HardDisk Type"><br>
   </div>
   </div>
   <div class="column">


<div class="form-group">
    <label for="os">OS</label>
    <input type="text" class="form-control" id="os" name="os" placeholder="Enter the OS Type"><br>
  
 <!-- 
  
   <div class = "form-group">
    <label for="ram">RAM</label>
    <input type="text" class="form-control" id="ram" name="ram" placeholder="Enter RAM-SIZE">
   </div> 
    -->
      
   
   
   
   
      
    <label for="mac">MAC</label>
    <input type="text" class="form-control" id="mac" name="mac" placeholder="Enter MAC-id"><br>
   
    <label for="company">COMPANY</label>
    <input type="text" class="form-control" id="company" name="company" placeholder="Enter the Company Name" ><br>
   
    <label for="price">PRICE</label>
    <input type="text" class="form-control" id="price" name="price" placeholder="Enter Price of CPU (Rs) "><br>
  
    <label for="status">STATUS</label>
    <input type="text" class="form-control mb-2 mr-sm-2" id="status" name="status" placeholder="Enter Status(0(not-working)/1(working))"><br>
   </div>
</div>
</div><br/><br/></br><br><br>
   
   <div class="form-group" align="center">
    <button type="submit" class="btn btn-primary mb-2">Submit</button>
    
  <!--  <button type="button" class="btn btn-info">Submit</button> -->
    
    </div>
    </form>
</div>

</body>
</html>