<!-- Modal -->
<div class="modal fade" id="modalLogin" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalLoginLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="GET">
          <div class="form-group">
            <label for="exampleInputEmail1">Email address</label>
            <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter email">
            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Password">
          </div>
          <div class="form-group form-check">
            <input type="hidden" class="form-check-input" id="rol" name="rol" value="admin-empresa">
          </div>
          <button type="submit" class="btn btn-primary">Submit</button>
        </form>
      </div>
      <div class="modal-footer">
        <button id="btn-login" type="button" class="btn btn-primary">Ingresar</button>
      </div>
    </div>
  </div>
</div>
<script>
$(function() {
    $("#btn-login").on("click", function(event){
        event.preventDefault(); // prevent default submit behaviour
        var email = $("input#email").val();
        var pasword = $("input#pasword").val();
        var rol =$("input#rol").val();

        var rol = selector.options[selector.selectedIndex].value;
        $.ajax({
            url:        '/user/login',
            type:       'POST',
            dataType:   'json',
            async:      true,
            data: {
                "email": email,
                "pasword": pasword,
                "rol": rol
            },
            success: function(data, status) {
                alert('se grabo correctamentea')
            },
            error : function(xhr, textStatus, errorThrown) {
                alert('Ajax request failed.');
            }
        });
    });
});
</script>