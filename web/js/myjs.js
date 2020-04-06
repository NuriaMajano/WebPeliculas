$(document).ready(function() {
    console.log('ready');
    init();
});

function init(){
    filmografia();
}

function filmografia(){
    $('#modalfilmografia').on('show.bs.modal', function (event) {
      var button = $(event.relatedTarget);
      var idpersona = button.data('id');
      var nombrepersona = button.data('nombre');
      var modal = $(this);
      modal.find('#name').text(nombrepersona);
      $.ajax({
          type: "GET",
          url: "Controller?op=filmografia&idpersona=" + idpersona,
          success: function (info) {
              modal.find('#filmografia').html(info);
          }
      });
    });
}
