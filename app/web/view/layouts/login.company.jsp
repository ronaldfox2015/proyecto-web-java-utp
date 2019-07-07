<!-- Modal -->
<div class="modal fade" id="modalLogin" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalLoginLabel">Ingresar cuenta de empresa</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="GET">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email</label>
                        <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter email">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Contraseņa</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Contraseņa">
                    </div>
                    <div class="form-group form-check">
                        <input type="hidden" class="form-check-input" id="rol" name="rol" value="admin-empresa">
                    </div>
                    <button id="btn-login" type="button" class="btn btn-primary">Ingresar</button>     
                </form>
            </div>

        </div>
    </div>
</div>
<script>
    $(function () {
        $("#btn-login").on("click", function (event) {
            event.preventDefault(); // prevent default submit behaviour
            var email = $("input#email").val();
            var password = $("input#password").val();
            var rol = $("input#rol").val();
            $.ajax({
                url: '/auth/login',
                type: 'POST',
                dataType: 'json',
                async: true,
                data: {
                    "email": email,
                    "password": password,
                    "rol": rol
                },
                success: function (data, status) {
                    if (data.response.status) {
                        window.location.href = "/empresa/dashboard";
                    }

                },
                error: function (xhr, textStatus, errorThrown) {
                    alert('Ajax request failed.');
                }
            });
        });
    });
</script>