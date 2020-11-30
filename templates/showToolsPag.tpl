<div class="row w-75" >  
  <input type="hidden" name="cant_paginas" value={$tot_paginas}>
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
          <td>{$tool->descrubro}</td>
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
  <nav aria-label="Page navigation example" class="d-flex justify-content-center">
    <ul class="pagination">   
      <li class="page-item">
          <a class="page-link" {if $actual_page> 1} href= '{BASE_URL}home/{$actual_page-1}' {else} href= '{BASE_URL}home/1' {/if} tabindex="-1">&laquo;Anterior</a>
      </li> 
                       
      {for $i=1 to $tot_paginas}
          {if $actual_page == $i}
              <li class="page-item active"><a class="page-link" href='{BASE_URL}home/{$i}'>{$i} <span class="sr-only">(current)</span></a></li>
          {else}
              <li class="page-item"><a class="page-link" href='{BASE_URL}home/{$i}'>{$i} <span class="sr-only">(current)</span></a></li>
          {/if}
      {/for} 

      <li class="page-item">
          <a class="page-link" {if $actual_page == (($tot_paginas) +1)|string_format:"%d"} href='{BASE_URL}home/{$actual_page}' {else} href='{BASE_URL}home/{$actual_page+1}' {/if}>&raquo;Siguiente</a>
      </li> 
    </ul>
</nav>
</div> 
{include file="footer.tpl" }    

