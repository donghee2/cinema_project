$(function(){$("span.pie").peity("pie");$("span.line1").peity("line",{fill:["#f3f5f6"],stroke:["#33CABB"],height:32,width:120,});$("span.line2").peity("line",{fill:["#33cabb"],stroke:["#33cabb"],height:64,width:250,});$("span.line3").peity("line",{fill:["transparent"],stroke:["#ef5350"],height:96,width:250,});$(".donut").peity("donut");$(".bar").peity("bar");var a=$(".updating-chart").peity("line",{height:38,width:120,fill:["#eeeeee"],stroke:["#33cabb"],});setInterval(function(){var b=Math.round(Math.random()*10);var c=a.text().split(",");c.shift();c.push(b);a.text(c.join(",")).change()},1000)});