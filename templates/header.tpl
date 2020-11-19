<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<?=BASE_URL?>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Maquinarias Agrícolas</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
     integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
     <!-- development version, includes helpful console warnings -->
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
  <header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-success">
      <a class="navbar-brand" href="{BASE_URL}home">MAQUINARIAS AGRICOLAS USADAS</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav d-flex w-100">
          <li class="nav-item active">
            <a class="nav-link" href="{BASE_URL}abm-tools">Administrar Datos<span class="sr-only">(current)</span></a>
          </li>
{*            {if !isset($smarty.session.EMAIL_USER)}
           <li class="nav-item ml-auto">
            <a class="nav-link" href="{BASE_URL}login">Login</a>
          </li>
          {/if}   *} 
          {if isset($smarty.session.EMAIL_USER)}
            <li class="nav-item ml-auto">
              <a class="nav-link" href="logout">{$smarty.session.EMAIL_USER} (LOGOUT)</a>
            </li>
          {/if}
        </ul>
      </div>
    </nav>
  </header>
  <main class='row'>  
