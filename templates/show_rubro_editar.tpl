{include file="header.tpl"}

<!--------- Solapas ------------>
{include file="show_solapas.tpl"}

<!--------- Pantalla edicion ------------>
<div class='container d-flex justify-content-center align-items-center"'>
<form action ='{BASE_URL}upd-rubro' method = "POST">
 <table class="table table-bordered table-sm">
  <thead class="bg-secondary text-white" >
    <tr>
      <th scope="col">Código</th>
      <th scope="col">Descripción rubro</th>
    </tr>
  </thead>
  <tbody>
     <tr>
      <td><input type="text" class="form-control" name="idrubro" readonly value="{$rubro->id}"></td>
      <td><input  name="descrubro"  type="text" class="form-control" value={$rubro->descripcion}></td>
      <td ><button type="submit" class="btn btn-dark btn-sm">Modificar</button></td>
    </tr>    
  <tbody>
  </table>
</form>
</div> 
{include file="footer.tpl" }  