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

<script>

  document.addEventListener('DOMContentLoaded', function() {
    var srcCalendarEl = document.getElementById('source-calendar');
    var destCalendarEl = document.getElementById('destination-calendar');

    var srcCalendar = new FullCalendar.Calendar(srcCalendarEl, {
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

    var destCalendar = new FullCalendar.Calendar(destCalendarEl, {
      initialDate: '2023-01-12',
      editable: true,
      droppable: true, // will let it receive events!
      eventReceive: function(info) {
        console.log('event received!', info.event);
      }
    });

    srcCalendar.render();
    destCalendar.render();
  });

</script>
<style>

  body {
    margin: 20px 0 0 20px;
    font-size: 14px;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  }

  #source-calendar,
  #destination-calendar {
    float: left;
    width: 600px;
    margin: 0 20px 20px 0;
  }

</style>
</head>
<body>

  <div id='source-calendar'></div>
  <div id='destination-calendar'></div>

</body>
</html>