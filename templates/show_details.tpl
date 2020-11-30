{* <div class='container w-50'>   *}
<div class="card">

{*   <img class="card-img-top sm img-thumbnail"  src="../img/sembradora.jpg" style='max-width: 300px' alt="Crucianelli">   *}  
  <div class="form-group">
    {if $tools->imagen}
      <img width="280px" src="../uploads/{$tools->imagen}">
    {else}
      <h3 class="bg-info text-white text-center">No hay imagen ilustrativa</h3>
    {/if}
  </div>
  <div class="card-body">
    <h4 class="card-title">{$tools->descripcion}</h5>
    <p class="card-text">{$tools->notas}</p>
    <p class="card-text">Modelo: {$tools->modelo}</p>
    <p class="card-text">Precio: {$tools->precio}</p>
   
    <input name = "idtool" id="idtool" type = "hidden" value = {$tools->id}>
  </div> 
</div>
<a class="col-4 btn bg-dark text-white " href="{BASE_URL}">Volver</a>
{* </div>  *}