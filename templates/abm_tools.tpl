{include file="header.tpl"} 
{include file="show_solapas.tpl"}

<!---------Alta/Edit maquinarias------------>
<div class="container">
  <div class="col-12">
    <form action="{BASE_URL}{$accion}" method="POST" class="my-2" enctype="multipart/form-data">
      <input name="id" value="{if isset($tool)}{$tool->id}{/if}" type="hidden" >
      <div class="row">
        <div class="col-3">
          <div class="form-group">
            <label>Rubro</label>
              <select class="form-control" name="rubro">
                {foreach from=$rubros item=rubro}
                  <option value="{$rubro->id}"
                    {if {$rubro->id} == {$tool->idRubro}} 
                      {" selected"}
                    {/if}   
                  >{$rubro->descripcion}</option>
                 {/foreach}
              </select>
          </div>
        </div>
        <div class="col-4">
          <div class="form-group">
               <label>Maquinaria Usada</label>
               <input name="descripcion" value="{if isset($tool)} {$tool->descripcion}{/if}" type="text" class="form-control" >
          </div>
        </div>
        <div class="col-2">
          <div class="form-group">
            <label>Modelo</label>
            <input name="modelo" value="{if isset($tool)} {$tool->modelo}{/if}" type="text" class="form-control">
          </div>
        </div>  
        <div class="col-3">
          <div class="form-group">
            <label>Precio</label>
            <input name="precio" type="number" class="form-control" value={if isset($tool)} {$tool->precio}{/if}>
          </div> 
        </div>
      </div>

      <div class="row">
        <div class="col-12 form-group">
          <label>Descripción de la maquinaria</label>
          <textarea name="notas" class="form-control" rows="2">{if isset($tool)} {$tool->notas}{/if}</textarea>
        </div>
      </div>
      
      <div class="row">
        <div class="form-group col-12">
          <label>Seleccionar imagen de la herramienta</label>
          <input type="file" name="img_name" id="imageToUpload" value={if isset($tool)} {$tool->imagen}{/if} >
        </div>
      
        <div class="col-3 form-group">
          <button type="submit" class="btn btn-dark btn-sm">{$boton}</button>
        </div>
      </div>
    </form>
  </div>
</div>

<div class='container'>
  <nav class="navbar navbar-light bg-light">
    <form class="form-inline" action="{BASE_URL}search-tools" method="POST">
      <input name="search" class="form-control md-8" type="search" placeholder="Búsqueda avanzada" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
    </form>
  </nav>
  <div class="tab-content overflow-auto" id="myTabContent">
    <table class="table table-bordered table-hover table-sm">
      <thead class="bg-secondary text-white">
        <tr>
          <th scope="col">Maquinaria</th>
          <th scope="col">Rubro</th>
          <th scope="col">Modelo</th>
          <th scope="col">Descripcion</th>
          <th scope="col">Precio</th>
          <th scope="col">Acciones</th>
        </tr>
      </thead>
      <tbody>
        {foreach from=$tools item=$tool}              
          <tr>
            <td>{$tool->descripcion}</td>
            <td>{$tool->descrubro}</td>
            <td>{$tool->modelo}</td>
            <td>{$tool->notas}</td>
            <td>{$tool->precio}</td>
            <td class="d-flex ">
              <a class="btn btn-success btn-sm" href="{BASE_URL}editar-tool/{$tool->id}">Editar</a>
              <a class="btn btn-danger btn-sm"  href="{BASE_URL}eliminar/{$tool->id}">Eliminar</a>
            </td>
          </tr>     
        {/foreach} 
        {if $tools|@count == 0}
          <tr><td> No se han encontrado herramientas </td></tr>
        {/if}
      </tbody>
    </table>
  </div> 
</div> 

{include file="footer.tpl" }  