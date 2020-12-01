{include file="header.tpl"} 
{include file="show_solapas.tpl"}

<!---------Alta/Edit user------------>
<div class="container">
  <div class="col-12">
    <form action="{BASE_URL}updateRol" method="POST" class="my-2" >
      <input name="id" value="{if isset($user)}{$user->id}{/if}" type="hidden" >
      <div class="row">
        <div class="col-4">
          <div class="form-group">
               <label>Nombre</label>
               <input name="descripcion" value="{if isset($user)} {$user->username}{/if}" type="text" class="form-control" >
          </div>
        </div>
        <div class="col-2">
          <div class="form-group">
            <label>e-mail</label>
            <input name="modelo" value="{if isset($user)} {$user->email}{/if}" type="text" class="form-control">
          </div>
        </div>  
        <div class="col-3">
          <div class="form-group">
            <label>Contraseña</label>
            <input name="passw" type="text" class="form-control" value={if isset($user)} {$user->passw}{/if}>
          </div> 
        </div>
      </div>

      <div class="row">
        <div class="col-12 form-group">
          <label>Rol</label>
         <input name="rol" type="text" class="form-control" value={if isset($user)} {$user->rol}{/if}>
       
        </div>
      </div>
      
       
        <div class="col-3 form-group">
          <button type="submit" class="btn btn-dark btn-sm">Cambiar ROL</button>
        </div>
      </div>
    </form>
  </div>
</div>


<!---------Alta/Edit user------------>
<div class='container'>
  <div class="tab-content overflow-auto" id="myTabContent">
    <table class="table table-bordered table-hover table-sm">
      <thead class="bg-secondary text-white">
        <tr>
          <th scope="col">User</th>
          <th scope="col">e-mail</th>
          <th scope="col">Contraseña</th>
          <th scope="col">Rol</th>
          <th scope="col">Acciones</th>
        </tr>
      </thead>
      <tbody>
        {foreach from=$users item=$user}              
          <tr>
            <td>{$user->username}</td>
            <td>{$user->email}</td>
            <td>{$user->passw}</td>
            <td>{$user->rol}</td>
      
            <td class="d-flex ">
              <a class="btn btn-success btn-sm" href="{BASE_URL}modi-rol/{$user->id}">Editar</a>
              <a class="btn btn-danger btn-sm"  href="{BASE_URL}eliminar/{$user->id}">Eliminar</a>
            </td>
          </tr>     
        {/foreach} 
        {if $users|@count == 0}
          <tr><td> No se han encontrado usuarios </td></tr>
        {/if}
      </tbody>
    </table>
  </div> 
</div> 

{include file="footer.tpl" }  