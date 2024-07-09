<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src='/dist/index.global.js'></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<%@ include file="../layout/adminHeader.jsp" %>

<body>
    <main>
        <p>일반관</p>
        <ul id="normalCal">
            <li class="ncal"></li>
        </ul>
        <p>특별관</p>
        <ul id="specialCal">
            <li class="scal"></li>
        </ul>
    </main>
</body>
<script>
  document.addEventListener('DOMContentLoaded', function() {
      var normalCalEls = document.querySelectorAll('#normalCal .ncal');
      var specialCalEls = document.querySelectorAll('#specialCal .scal');

      normalCalEls.forEach(function(normalCalEl) {
          var normalCalendar = new FullCalendar.Calendar(normalCalEl, {
              plugins: ['dayGrid'],
              editable: true,
              initialDate: '2023-01-12',
              events: [
                  {
                      title: 'event1',
                      start: '2023-01-11T10:00:00',
                      end: '2023-01-11T16:00:00'
                  },
                  {
                      title: 'event2',
                      start: '2023-01-13T10:00:00',
                      end: '2023-01-13T16:00:00'
                  }
              ],
              eventLeave: function(info) {
                  console.log('event left!', info.event);
              }
          });
          normalCalendar.render();
      });

      specialCalEls.forEach(function(specialCalEl) {
          var specialCalendar = new FullCalendar.Calendar(specialCalEl, {
              plugins: ['dayGrid'],
              initialDate: '2023-01-12',
              editable: true,
              droppable: true, // will let it receive events!
              eventReceive: function(info) {
                  console.log('event received!', info.event);
              }
          });
          specialCalendar.render();
      });
  });
</script>
</html>