<%-- 
    Document   : index
    Created on : Mar 2, 2022, 11:48:30 AM
    Author     : x3me9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="icon" href="CSS/ImagesFolder/logoOfficial.png">
        <title>Error Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/StyleJSPs.css" media="screen" />
    </head>
    <body  onload="displayHide()">
 

       
        
  
        
        
                          
            <nav class="navbar navbar-expand-lg fixed-top bg-light navbar-light">
  <div class="container">
    <a class="navbar-brand" href="#"
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
            
            
            
            
 
               
               
         <div class="container float-left align-items-center">

             <div class="row"><br><br><br></div>
             
               <div class="row align-items-center">
                  <div class="col-sm h-50" >
               <img class="w-100" src="CSS/ImagesFolder/ErrorOfficial.png" alt="APP Logo" draggable="false"   />
          </div>  
                    
    <div class="col-sm text-start " name="title">
    <h2 class="display-1">ERROR</h2>
    <h2 class="display-1">404</h2>
   
    </div>
                   
   
    <div class="col-sm">
        <div class="container rounded" name="instructions">
            <br>
      <h2>Error</h2>
       <p class="justify-content-start"> File not Found! Page is missing.</p>
       <br>
       </div>
    </div>
                   
  </div> 
             
       
         
             
       
        </div>
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
                                             
            </script>
      
            
    </body>
</html>
