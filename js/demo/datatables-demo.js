/////// Call the dataTables jQuery plugin
//$(document).ready(function() {
//  $('#dataTable').DataTable();
//});
$(document).ready(function () {
    var table = $('#dataTable').DataTable({
        lengthChange: false,
        buttons: ['copy', 'excel', 'pdf', 'print', 'colvis']
    });

    table.buttons().container()
        .appendTo('#dataTable_wrapper .col-md-6:eq(0)');
});

