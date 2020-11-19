<div class="row w-75" >  
  <table class="table table-bordered table-sm table-hover">
    <thead class='bg-secondary text-white'>
      <tr>
        <th scope="col">Maquinaria</th>
        <th scope="col">Rubro</th>
        <th scope="col">Modelo</th>
        <th scope="col"></th>
      </tr>
    </thead>
    <tbody>
      {foreach from=$tools item=$tool}              
        <tr>
          <td>{$tool->descripcion}</td>
          {* <td>{$rubro->descripcion}</td> *}
          <td>{$tool->modelo}</td>
          <td>{$tool->notas}</td> 
          <td class="d-flex no-wrap">
            <a class="btn btn-dark btn-sm" href="{BASE_URL}detalles/{$tool->id}">Detalles</a>
          </td>
        </tr>     
      {/foreach} 
      {if $tools|@count == 0}
        <tr><td> No se han encontrado herramientas </td></tr>
      {/if}
    </tbody> 
  </table>
</div> 

{include file="footer.tpl" }    