$(document).ready(function(){
  $(".add-task").click(function (e) {
    var list_id = e.target.id;
    $('#task_list_id').val(list_id);
  });
  $('#datetimepicker').datetimepicker({format: 'YYYY/MM/DD HH:mm'});
});
