{include file="header.tpl"}
{include file="show_solapas.tpl"}

<!---------Alta rubros------------>

<div class='container'>
<form action="insertar-rubro" method="POST" class="my-2">
  <div class="row">
    <div class="col-6">
      <div class="form-group">
        <label>Descripcion rubro</label>
        <input name="desc_rubro" type="text" class="form-control">
      </div>
    </div>
  </div>
  <button type="submit" class="btn btn-dark btn-sm">Agregar</button>
</form>

<!---------Lista de  rubros------------>

<div class="tab-content overflow-auto" id="myTabContent">
  <table class="table table-bordered table-hover table-sm">
     <thead  class="bg-secondary text-white">
      <tr>
        <th scope="col">Código</th>
        <th scope="col">Descripcion rubro</th>
        <th scope="col">Acciones</th>
      </tr>
    </thead> 
    <tbody>
      {foreach from=$rubros item=$rubro}              
        <tr>
          <td>{$rubro->id}</td>
          <td>{$rubro->descripcion}</td>
          <td class="d-flex no-wrap">
            <a class="btn btn-success btn-sm" href="editar-rubro/{$rubro->id}">Editar</a>
            <a class="btn btn-danger btn-sm" href="eliminar-rubro/{$rubro->id}">Eliminar</a>
          </td>
        </tr>     
        {/foreach} 
        {if $rubros|@count == 0}
          <tr><td> No se han encontrado rubros </td></tr>
        {/if}
    </tbody>
  </table>
</div> 
</div> 

{include file="footer.tpl" }  