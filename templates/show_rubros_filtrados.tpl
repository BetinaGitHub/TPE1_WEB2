{include file="header.tpl"}
{* <div class="column" style='max-width: 250px'> *}
{* <div class="col-sm-2" style='padding:10px'> *}
<div class="col-2 ">
   <ul class='list-group'  style='max-width: 200px'  >
        <a class='list-group-item list-group-item-action text-white bg-success'   href='{BASE_URL}home'>TODOS</a>
        <a class='list-group-item list-group-item-action text-white bg-dark' href='{BASE_URL}filtrar/{$rubro->id}'>{$rubro->descripcion}</a>
   </ul> 
 </div>