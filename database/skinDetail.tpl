//SkinDetail sin VUE

{include file="header.tpl"}
{include file="skinslistnav.tpl"}
<main class="container-fluid mt-5">
    {foreach from=$armas item=arma} 
        {if $skin->id_arma == $arma->id_arma}
            <section class="d-flex justify-content-center">
                <div class="invisible" id="idskin">{$skin->id}</div>
                <div class="col-5">
                    {if $arma->photo == 1}
                        <div class="img-holder">
                            <div class='container-img'>
                                <img src="images/{$skin->id_arma}.png" class="card-img-top img-fluid h-75" alt="...">
                            </div>
                        </div>
                        {else}
                            <div class="img-holder">
                                <div class='container-img'>
                                <img src='images/noimage.png' class="card-img-top img-fluid" alt="...">
                                </div>
                            </div>
                    {/if}
                </div>
                <div class="card col-5">
                    <!-- Creacion de la carta con sus especificaciones mas llamativas -->
                    <div class="card-body"> 
                        <h5 class="card-title text-center">{$arma->nombre} | {$skin->nombre}</h5>
                        <p class="card-text text-center">{$arma->descripcion}</p>
                    </div>
                    {if ($admin == 1)}
                        <ul class="list-group list-group-flush">
                            <form action='editskin/{$skin->id}' method='POST'>
                                <li class="list-group-item text-center">
                                    <label>Arma:</label>
                                    <select name='idarma'>
                                        <option value='{$arma->id_arma}'>{$arma->nombre}</option>
                                        <optgroup label="Pistola">
                                        {foreach from=$armas item=arma}
                                            {if $arma->tipo == 'Pistola'}
                                            <option value='{$arma->id_arma}'>{$arma->nombre}</option>
                                            {/if}
                                        {/foreach}
                                        </optgroup>
                                        <optgroup label="Subfusil">
                                        {foreach from=$armas item=arma}
                                            {if $arma->tipo == 'Subfusil'}
                                            <option value='{$arma->id_arma}'>{$arma->nombre}</option>
                                            {/if}
                                        {/foreach}
                                        </optgroup>
                                        <optgroup label="Rifle">
                                        {foreach from=$armas item=arma}   
                                            {if $arma->tipo == 'Rifle'}
                                            <option value='{$arma->id_arma}'>{$arma->nombre}</option>
                                            {/if}
                                        {/foreach}
                                        </optgroup>
                                        <optgroup label="Cuchillo">
                                        {foreach from=$armas item=arma}    
                                            {if $arma->tipo == 'Cuchillo'}
                                            <option value='{$arma->id_arma}'>{$arma->nombre}</option>
                                            {/if}
                                        {/foreach}
                                        </optgroup>
                                    </select>
                                </li>
                                <li class="list-group-item text-center">
                                    <label>Nombre del Skin:</label>
                                    <input value='{$skin->nombre}' name='nombre'>
                                </li>
                                <li class="list-group-item text-center">
                                    <label>Tipo:</label>
                                    <select name='tipo'>
                                        <option value="{$skin->tipo}">{$skin->tipo}</option>
                                        <optgroup label="Choose one">
                                        <option value='Consumidor'>Consumidor</option>
                                        <option value='Militar'>Militar</option>
                                        <option value='Indrustrial'>Indrustrial</option>
                                        <option value='Restringido'>Restringido</option>
                                        <option value='Clasificado'>Clasificado</option>
                                        <option value='Encubierto'>Encubierto</option>
                                        <option value='Contrabando'>Contrabando</option>
                                    </select>
                                </li>
                                <li class="list-group-item text-center">
                                    <label>Estado:</label>
                                    <select name='estado'>
                                        <option value="{$skin->estado}">{$skin->estado}</option>
                                        <optgroup label="Choose one">
                                        <option value='Recien Fabricado'>Recien Fabricado</option>
                                        <option value='Casi Nuevo'>Casi Nuevo</option>
                                        <option value='Algo Desgastado'>Algo Desgastado</option>
                                        <option value='Bastante Desgastado'>Bastante Desgastado</option>
                                        <option value='Deplorable'>Deplorable</option>
                                    </select>
                                    <label> | </label>
                                        <label> Stattrak:</label>
                                    <select name='stattrak'>
                                        <option value="{$skin->stattrak}">{if $skin->stattrak == 1}Si{else}No{/if}</option>
                                        <optgroup label="Choose one">
                                        <option value='1'>Si</option>
                                        <option value='0'>No</option>
                                    </select>
                                </li>
                                <li class="list-group-item text-center">
                                    <label>Coleccion:</label>
                                    {if $skin->coleccion !=''}
                                    <input value='{$skin->coleccion}' name='coleccion'>
                                    {else}
                                    <input value='Vacio' name='coleccion'>    
                                    {/if}
                                </li>
                                <li class="list-group-item text-center">
                                    <label>Precio: $</label>
                                    <input value='{$skin->precio}' name='precio'>
                                </li>
                                <li class="list-group-item text-center text-success">
                                    <button type='submit' class="btn btn-primary w-100">Confirmar edicion</button>
                                </li>
                            </form>
                        </ul>
                        {else}
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item text-center">{$arma->tipo}</li>
                            <li class="list-group-item text-center">{$skin->tipo}</li>
                            <li class="list-group-item text-center">{$skin->estado}{if $skin->stattrak == '1'} | Stattrak{/if}</li>
                            <li class="list-group-item text-center">{$skin->coleccion} {if $skin->coleccion == ''}No pertenece a ninguna coleccion{/if}</li>
                            <li class="list-group-item text-center text-success">${$skin->precio}</li>
                        </ul>
                    {/if}         
                </div>
            </section>
        {/if}
    {/foreach}
    <section class="mt-5 w-100">         
        <form id="comment-form" action="comments" class='bg-secondary' method="POST" class="my-4" enctype="multipart/form-data">
            <div class="row">
                <div class="col-8">
                    {if $userlogin == 1}
                        <span>Usuario: </span>
                        <span>{$smarty.session.USER_NAME}</span>
                        <param name='user' value='{$smarty.session.ID_USER}'>
                
                    {else}
                        <span>Usuario: </span>
                        <button><a href="login"> Iniciar Sesion</a></button>
                    {/if}
                </div>
                <div class="col-3">
                    <div class="form-group">
                        <label>Valoracion</label>
                        <select name="valoracion" class="form-control">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-7">
                    <label>Comentario:</label>
                    <textarea name="comment" class="form-control" rows="3"></textarea>
                </div>
                <div class='col-2'></div>
                <div class='col'>
                    {if $userlogin == 1}
                        <button type="submit" class="btn btn-primary">Enviar Comentario</button>
                    {else}
                        <button type="submit" class="btn btn-primary" disabled>Enviar Comentario</button>
                    {/if}
                </div>
            </div>
        </form>
    </section>
    <section class="mt-5 w-100">
        <div>
            <div class="d-flex flex-row bg-primary col">
                <div class="p-2 col-2">Usuario</div>
                <div class="p-2 col-2 text-center">Valoracion</div>
                <div class="p-2 col-8 text-center">Comentario</div>
            </div>
        </div>
        <div id="commentbox"></div>
    </section> 
</main>
<script type="text/javascript " src="js/comments.js"></script>
{include file="footer.tpl"}
