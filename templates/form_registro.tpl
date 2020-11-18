{include 'header.tpl'}
<main class="container"> <!-- inicio del contenido pricipal -->
    <div class="mt-5 w-25 mx-auto">
        <form method="POST" action="verify">
            <div class="form-group">
                <label for="username">Apellido y Nombre</label>
                <input type="username" class="form-control" id="username" name="username" aria-describedby="usernameHelp">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" aria-describedby="usernameHelp">
            </div>
            <div class="form-group">
                <label for="password1">Password</label>
                <input type="password" class="form-control" id="password1" name="password1">
            </div>
            <div class="form-group">
                <label for="password2">Repetir Password</label>
                <input type="password" class="form-control" id="password2" name="password2">
            </div>
            {if $error}
                <div class="alert alert-danger">
                    {$error}
                </div>
            {/if}
            <button type="submit" name="registrarse" value="registrarse" class="btn btn-primary bg-dark">Registrarse</button>
          </form>
    </div>
{include file='footer.tpl'}
