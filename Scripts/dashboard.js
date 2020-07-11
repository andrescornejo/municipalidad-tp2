/* Open */
function openNav() {
    document.getElementById("myNav").style.height = "100%";
  }
  
  /* Close */
  function closeNav() {
    document.getElementById("myNav").style.height = "0%";
  }
   
  $('.datepicker').datepicker({
    format: 'yyyy/mm/dd',
    startDate: '-1m',
    autoclose: true,
});