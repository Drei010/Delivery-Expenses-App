<%-- 
    Document   : ExpensesTable
    Created on : Mar 2, 2022, 5:38:31 PM
    Author     : x3me9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="icon" href="CSS/ImagesFolder/logoOfficial.png">
        <title>Expenses Table Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/StyleJSPs.css" media="screen" />
    </head>
    <body onload="displayHide()">

        <nav class="navbar navbar-expand-lg fixed-top bg-light navbar-light">
  <div class="container">
    <a class="navbar-brand" href=""
      ><img
        src="CSS/ImagesFolder/logoOfficial.png"
        alt="APP Logo"
        draggable="false"
        height="30"
    />
     <% out.println(getServletContext().getInitParameter("Header")); %>
    
    </a>
    <button
      class="navbar-toggler"
      type="button"
      data-mdb-toggle="collapse"
      data-mdb-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <i class="bi bi-list"></i>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto align-items-center">
        <li class="nav-item">
          <a class="btn btn-outline-success " href="index.jsp">Select Date</a>
        </li>

        <li class="nav-item ms-3">
            <form  action="AppController" method="get">
  <input type="hidden"  name="selectDate" id="today">
  <input type="hidden" name="instruction" value="1">
  <input   class="btn btn-outline-success " type="submit" value="Today's Expenses">
  </form>
        </li>
          <li class="nav-item ms-3">
          <a class="btn btn-outline-success " href="About.jsp">About</a>
        </li>
      </ul>
    </div>
  </div>
</nav>  
         
         
          
         
         
         <div class="container text-center">
      
         <br>   
        <br>
      <br>   
        <br>
         <div class="row">
         <div class="col-sm text-start " > 
             <% String date = request.getParameter("selectDate");%>
              <h1>Date:  <% out.println(date); %></h1></div>
                 <div class="col-sm text-start " >
        <h1>Total Expenses: <a id="totalExpenses"></a></h1> 
        
        </div>
        </div>
        
        <div class="table-responsive">
         <table  class="table  bg-light table-bordered table-hover table-sm" cellspacing="0" width="100%" id="table">
            <thead>
             <tr class="bg-success text-white">
                <th class="th-sm">Item</th>
                <th class="th-sm" >Description</th>
                <th class="th-sm">Delivery Source</th>
                <th class="th-sm">Total Price (php)</th>
                <th class="th-sm"></th>
                <th class="th-sm"></th>
            </tr>
             </thead>
             
             <tbody>
             <tr>
                  <form action="AppController" method="get">
                <td><input name="item" type="text" required/></td>
                <td><input name="description" type="text" required/></td>
                <td><input name="source" type="text" required/></td>
                <td><input name="price" type="number" step="0.01" required/></td>
                <td><input name="selectDate" type="hidden" value="<%out.println(date);%>"/>
                    <input class="btn btn-primary btn-lg"  type="submit"></td>
                 <td><input name="instruction" type="hidden" value="2"/> </td>
                 </form>
            </tr>
            <% ResultSet results = (ResultSet) request.getAttribute("results");
                    while (results.next()) {
                  %>
             <tr>
                <td><%=results.getString("item")%></td>
                <td><%=results.getString("description")%></td>
                <td><%=results.getString("itemsource")%></td>
                <td class="priceSum"><%=results.getString("price")%></td>
                
                
                <td>
                <form action="EditForm.jsp" method="get">
                    <input type="hidden" name="item"  value="<%=results.getString("item")%>"/>
                    <input  name="description" type="hidden" value="<%=results.getString("description")%>"/>
                    <input  name="source" type="hidden" value="<%=results.getString("itemsource")%>"/>
                    <input  name="price" type="hidden" value="<%=results.getString("price")%>"/>
                    <input type="hidden" name="selectDate" value="<%=results.getString("daterecieved")%>">
                    <input type="hidden" name="id" value="<%=results.getString("id")%>">
                    <input class="btn btn-info text-white btn-lg" type="submit" value="Edit">
            
                  </form>
                </td>
                
                
                <form action="AppController" method="get">
                   <td>
                       <input type="hidden" name="selectDate" value="<%=results.getString("daterecieved")%>">
                       <input type="hidden" name="idNumber" value="<%=results.getString("id")%>">
                       <input type="hidden" name="instruction" value="4">
                       <input class="btn btn-danger btn-lg" type="submit" value="Delete">
                   </td>
               </form>
             
                
                              </tr>
 	</tbody>
                <tfooter >

        </tfooter>
            <%	}  %>
        </table>
        </div></div>
        <br> <br> <br> <br> <br> <br>
        <div id="hider" class="bg-primary opacity-0" onmouseover="showHide(event)"></div>
         <div id="footer" class="container-xxl fixed-bottom text-center text-white  bg-dark ">
              <br>
      <p> <% out.println(getServletContext().getInitParameter("Footer")); %></p>
        <p> <% out.println(getServletContext().getInitParameter("Footer2")); %></p>
           
         </div> 
         
   
<script>

    // today date         
n =  new Date();
y = n.getFullYear();
m = n.getMonth() + 1;
d = n.getDate();

m=m.toString();
d=d.toString();

m.length===1? m = "0"+m :m ;
d.length===1? d = "0"+d :d ;
document.getElementById("today").value = y + "-" + m + "-" + d;
                
        // footer  
 function displayHide() {
            document.getElementById("footer").style.visibility = "hidden";
         }
 function displayShow() {
            document.getElementById("footer").style.visibility = "visible";
         }
                       
function showHide(event){
   document.getElementById("footer").style.visibility = "visible";
}       
                                                    
const isHover = e => e.parentElement.querySelector(':hover') === e;    

const footer = document.getElementById('footer');
document.addEventListener('mousemove', function checkHover() {
  const hovered = isHover(footer);
  if (hovered !== checkHover.hovered) {
    (hovered ? displayShow() : displayHide());
    checkHover.hovered = hovered;
  }
});                     
                             

var cls = document.getElementById("table").getElementsByTagName("td");
var sum = 0;
for (var i = 0; i < cls.length; i++) {
  if (cls[i].className === "priceSum") {
    sum += isNaN(cls[i].innerHTML) ? 0 : parseFloat(cls[i].innerHTML);
  }
}
document.getElementById("totalExpenses").innerHTML = "Php" + Number((sum).toFixed(2));

$(document).ready(function () {
  $('#table').DataTable();
  $('.dataTables_length').addClass('bs-select');
});




</script>
 </body>
</html>
