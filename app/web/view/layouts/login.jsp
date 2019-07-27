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
                <form>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <input name="email" type="email" class="form-control" 
                               id="email" aria-describedby="emailHelp" 
                               placeholder="Enter email">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Password</label>
                        <input name="password" type="password"
                               class="form-control"
                               id="password" placeholder="Password">
                    </div>
                    <div class="form-group form-check">
                        <input type="hidden" class="form-check-input" id="rol" name="rol" value="cliente-user">
                    </div>
                    <div class="modal-footer">
                        <button id="btn-login" type="button" class="btn btn-primary">Ingresar</button>
                    </div>        
                </form>
                <div id="response-error" style="   
                     width: 100%;
                     margin-top: .25rem;
                     font-size: 80%;
                     color: #dc3545;">

                </div>
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
                    document.getElementById("response-error").innerHTML = ""
                    if (data.response.status) {
                        window.location.href = "/buscar"
                    }
                    document.getElementById("response-error").innerHTML = data.response.messages
                },
                error: function (data) {
                    document.getElementById("response-error").innerHTML = data.response.messages
                }
            });
        });
    });
</script>