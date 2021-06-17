<%-- 
    Document   : viewHotel
    Created on : Dec 31, 2020, 12:38:17 AM
    Author     : User
--%>

<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver").newInstance(); %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view hotel</title>
        <link rel="stylesheet" href="Style.css">
        <script>
            var checkArr = [];
        </script>
        
        <style type="text/css">
@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

fieldset, label { margin: 0; padding: 0; }
body{ margin: 20px; }
h1 { font-size: 1.5em; margin: 10px; }

/****** Style Star Rating Widget *****/

.rating { 
  border: none;
  float: left;
}

.rating > input { display: none; } 
.rating > label:before { 
  margin: 5px;
  font-size: 1.25em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating > .half:before { 
  content: "\f089";
  position: absolute;
}

.rating > label { 
  color: #ddd; 
 float: right; 
}

/***** CSS Magic to Highlight Stars on Hover *****/

.rating > input:checked ~ label, /* show gold star when clicked */
.rating:not(:checked) > label:hover, /* hover current star */
.rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating > input:checked + label:hover, /* hover current star when changing rating */
.rating > input:checked ~ label:hover,
.rating > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating > input:checked ~ label:hover ~ label { color: #FFED85;  } </style>
       
    </head>
    <body class="v-hote-body">
        
        <div class="header">
            <h1>Booking system</h1>        
        </div>
        
        <div class="hoteldiv">
            <div class="phot-name">
        <%  
            String nights = "";
            String hotelName = "";
            try{
            nights = request.getParameter("nights").toString();
            request.getSession().setAttribute("nights", nights);
            hotelName = request.getParameter("hotelname").toString();
            session.setAttribute("hotelname", hotelName);
            }catch(Exception e){
                nights = request.getSession().getAttribute("nights").toString();
                hotelName = request.getSession().getAttribute("hotelname").toString();
            }
            
            out.print("<h1>" + hotelName + "</h1>");
                %>
                <div class="img-slider">
                    <div class="slide active">
                    <img  src = "images/<%out.print(hotelName);%>/0.jpg" width="300" height="250"/>
                    </div>
        <%
                File directory=new File("C:\\Users\\AMR\\Desktop\\htotelProject\\web\\images\\"+hotelName);
                int fileCount=directory.list().length;
               for (int i = 1; i < fileCount; i++) {
                String temp = hotelName + "/" + i + ".jpg";
        %>
        <div class="slide">
        <img  src = "images/<%out.print(temp);%>"/>
        </div>
        <%

            }

        %>
        <div class="navigation">
            <div class="btn active"></div>
            <%
              for(int i=1;i<fileCount;i++){%>
              <div class="btn"></div>
              <%}  
            %>
        </div>
        </div>
            </div>
          <div class="cmnt-rte">
        <form method="POST" action="rate">
	<fieldset class="rating">
	    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="5 stars"></label>
	    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="4 stars"></label>
	    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="3 stars"></label>
	    <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="2 stars"></label>
	    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="1 star"></label>
	</fieldset>
            <input type="text" name="comment" placeholder="Comment"/>
            <input type="submit" value="add rate" name="submit" class="rtbtn"/>
        </form>

        <%  Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3307/hotel";
            String user = "root";
            String password = "qwe123@thelover";
            Connection con = DriverManager.getConnection(url, user, password);
            Statement stmt = con.createStatement();
            ResultSet RS = stmt.executeQuery("SELECT map FROM hotelinfo WHERE name='" + hotelName + "'");
            RS.beforeFirst();
            RS.next();
            String map = RS.getString("map");
            RS.close();
            ResultSet RS2 = stmt.executeQuery("SELECT* FROM rate WHERE name ='" + hotelName + "'");
            int avgRate = 0, counter = 0;
            int rate = 0;
            while (RS2.next()) {
                int stars = RS2.getInt("stars");
                avgRate += stars;
                counter++;
                rate =(avgRate / counter);          
        %>
                <div class="card">
                    <label>Name: </label>
                    <p><%out.print(RS2.getString("Username"));%></p>
                    <br>
                    <label>Comment: </label>
                    <p><%out.print(RS2.getString("comment"));%></p>
                </div>
        <br>
        <%}
            RS2.close();
        %>  
        <iframe src= "<%= map%>"
                width="400"
                height="300"
                frameborder="0"
                style="border:0;"
                allowfullscreen=""
                aria-hidden="false"
                tabindex="0"> 
        </iframe>
            
        
        <form method="post" action="MakeReservation.jsp" id="reserveForm" class="mkform">
            <table style="width: 100%; border: 1px solid black" >
                <tr>
                    <th>Room Type</th>
                    <th>Price for <%= nights%> nights</th>
                <input type="hidden" name="nights" value="<%= nights%>">
                    <th>Select Rooms</th>
                </tr>
                <%
                    stmt.executeUpdate("Update hotelinfo SET rate = '"+rate+"' WHERE (name='"+hotelName+"') ");
                    long price =0;
                    try{
                       if(request.getSession().getAttribute("change").toString().equals("1"))
                    {
                        int id = Integer.parseInt(request.getSession().getAttribute("id").toString());
                    ResultSet RS4 = stmt.executeQuery("SELECT* FROM reservation WHERE idreservation ='"+id+"'");
                    RS4.beforeFirst();
                    RS4.next();
                    price = RS4.getLong("totalprice");
                    RS4.close();
                    } 
                    }catch(Exception e){
                        try{
                            price = Long.parseLong(request.getParameter("price")); 
                            request.getSession().setAttribute("price", price);
                        }catch(Exception w){
                            price = Long.parseLong(session.getAttribute("price").toString());
                        }
                        price = Long.parseLong(request.getSession().getAttribute("price").toString());
                    }
                    
                
                    ResultSet RS3 = stmt.executeQuery("SELECT* FROM rooms WHERE name='" + hotelName + "' AND available='1'");
                    int count = 0;
                    while (RS3.next()) {
                        String roomType = RS3.getString("roomtype");
                        String roomFacilities = RS3.getString("roomfacilities");
                        String view = RS3.getString("view");
                        String smoking = RS3.getString("smoking");
                        String size = RS3.getString("size");
                        String bedType = RS3.getString("bedtype");
                        String parking = RS3.getString("parking");
                        long totalPrice = RS3.getLong("price") + price;%>

                <tr>
                    <td><%out.println(roomType + "<br>");
                        out.println(roomFacilities + "<br>");
                        out.println(view + "<br>");
                        out.println(smoking + "<br>");
                        out.println(size + "<br>");
                        out.println(bedType + "<br>");
                        out.println(parking);%></td>
                    <td><% out.print(totalPrice);%></td>
                <input type="hidden" id="room<%=count%>" name="room<%=count%>" value="<%=roomType%>">
                    <td><input list="roomNumbers<%=count%>" name="roomNumber<%=count%>" id="check<%=count%>" placeholder="0" onchange="validate(<%=count%>)" required>
                        <datalist id="roomNumbers<%=count%>">
                            <option value="0">
                            <option value="1-<%=totalPrice%>">
                            <option value="2-<%=totalPrice*2%>">
                            <option value="3-<%=totalPrice*3%>">
                        </datalist>
                    </td>
                <input type="hidden" name="price<%=count%>">
                <input type="hidden" id="count" value="<%=count%>">
                </tr>
                
                <%
                        count++;
                    }
                %>
            </table>
            <input type="hidden" value="<%out.print(count);%>" name="count">
            <input type="submit" value="Reserve" id="reserve" class="resevebtn">
        </form>
            <script>
                function validate(count){
                   checkArr.push(document.getElementById("check"+count).value); 
                   var tmp=0;
                   if(checkArr.length===3){
                       for(i=0;i<checkArr.length;i++){
                          if(checkArr[i]==="0"){
                              tmp = tmp+1;
                          } 
                       }
                       if(tmp===3){
                           alert("Please,You should choose at least one room");
                           document.getElementById("reserve").disabled = true;
                       }else{
                          document.getElementById("reserve").disabled = false; 
                       }
                   }else if(checkArr.length>3){
                      document.getElementById("reserve").disabled = false;  
                   }
              }
              var slides = document.querySelectorAll('.slide');
    var btns = document.querySelectorAll('.btn');
    let currentSlide = 1;

    // Javascript for image slider manual navigation
    var manualNav = function(manual){
      slides.forEach((slide) => {
        slide.classList.remove('active');

        btns.forEach((btn) => {
          btn.classList.remove('active');
        });
      });

      slides[manual].classList.add('active');
      btns[manual].classList.add('active');
    }

    btns.forEach((btn, i) => {
      btn.addEventListener("click", () => {
        manualNav(i);
        currentSlide = i;
      });
    });

    // Javascript for image slider autoplay navigation
    var repeat = function(activeClass){
      let active = document.getElementsByClassName('active');
      let i = 1;

      var repeater = () => {
        setTimeout(function(){
          [...active].forEach((activeSlide) => {
            activeSlide.classList.remove('active');
          });

        slides[i].classList.add('active');
        btns[i].classList.add('active');
        i++;

        if(slides.length == i){
          i = 0;
        }
        if(i >= slides.length){
          return;
        }
        repeater();
      }, 10000);
      }
      repeater();
    }
    repeat();
            </script>
            </div>
    </body>
</html>
