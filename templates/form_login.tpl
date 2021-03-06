{include 'header.tpl'}
<main class="container"> <!-- inicio del contenido pricipal -->
    <div class="mt-5 w-25 mx-auto">
        <form method="POST" action="verify">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" aria-describedby="usernameHelp">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="passw" name="passw">
            </div>
            {if $error}
                <div class="alert alert-danger">
                    {$error}
                </div>
            {/if}
            <button type="submit" name="ingresar" value="ingresar" class="btn btn-primary bg-dark">Ingresar</button>
        </form>
        <a href='register' class="fourth btn btn-primary bg-dark"> Registrarse</a>
        </div>
{include file='footer.tpl'}