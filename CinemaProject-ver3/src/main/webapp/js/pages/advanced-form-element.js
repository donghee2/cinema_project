$(function(){$(".select2").select2();$("#datemask").inputmask("dd/mm/yyyy",{placeholder:"dd/mm/yyyy"});$("#datemask2").inputmask("mm/dd/yyyy",{placeholder:"mm/dd/yyyy"});$("[data-mask]").inputmask();$("#reservation").daterangepicker();$("#reservationtime").daterangepicker({timePicker:true,timePickerIncrement:30,format:"MM/DD/YYYY h:mm A"});$("#daterange-btn").daterangepicker({ranges:{Today:[moment(),moment()],Yesterday:[moment().subtract(1,"days"),moment().subtract(1,"days")],"Last 7 Days":[moment().subtract(6,"days"),moment()],"Last 30 Days":[moment().subtract(29,"days"),moment()],"This Month":[moment().startOf("month"),moment().endOf("month")],"Last Month":[moment().subtract(1,"month").startOf("month"),moment().subtract(1,"month").endOf("month")]},startDate:moment().subtract(29,"days"),endDate:moment()},function(b,a){$("#daterange-btn span").html(b.format("MMMM D, YYYY")+" - "+a.format("MMMM D, YYYY"))});$("#datepicker").datepicker({autoclose:true});$('.ichack-input input[type="checkbox"].minimal, .ichack-input input[type="radio"].minimal').iCheck({checkboxClass:"icheckbox_minimal-blue",radioClass:"icheckbox_minimal-blue"});$('.ichack-input input[type="checkbox"].minimal-red, .ichack-input input[type="radio"].minimal-red').iCheck({checkboxClass:"icheckbox_minimal-red",radioClass:"iradio_minimal-red"});$('.ichack-input input[type="checkbox"].flat-red, .ichack-input input[type="radio"].flat-red').iCheck({checkboxClass:"icheckbox_flat-green",radioClass:"iradio_flat-green"});$(".my-colorpicker1").colorpicker();$(".my-colorpicker2").colorpicker();$(".timepicker").timepicker({showInputs:false})});