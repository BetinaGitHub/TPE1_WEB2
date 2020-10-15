{include file="header.tpl"}
<div class="col-2 ">
  <ul class='list-group'  style='max-width: 200px'  >
    <a class='list-group-item list-group-item-action text-white bg-success'   href='{BASE_URL}home'>TODOS</a>
    {foreach from=$rubros item=$rubro} 
      <a class='list-group-item list-group-item-action text-white bg-dark' href='{BASE_URL}filtrar/{$rubro->id}'>{$rubro->descripcion}</a>
    {/foreach}
  </ul> 
</div>