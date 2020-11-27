{include 'header.tpl'}
    <div class="container"> 
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                <img class="card-img-top sm img-thumbnail"  src="../img/sembradora.jpg" style='max-width: 300px' alt="Crucianelli">    
                {* <img class="card-img-top sm img-thumbnail"  value={$tools->foto} style='max-width: 300px' alt="Crucianelli"> *} 
            
                <div class="card-body">
                <h4 class="card-title">{$tools->descripcion}</h5>
                <p class="card-text">{$tools->notas}</p>
                <p class="card-text">Modelo: {$tools->modelo}</p>
                <p class="card-text">Precio: {$tools->precio}</p>
                <input name = "idtool" id="idtool" type = "hidden" value = {$tools->id}>
                </div> 
            </div>
            <a class="col-4 btn bg-dark text-white " href="{BASE_URL}">Volver</a>
        </div>
            <div class="col-md-8">
                <h2 class="text-white bg-dark"> Comentarios</h2>
                <a class="col-4 btn bg-dark text-white " href="{BASE_URL}listar-csr">Ver comentarios</a>
            </div>
        </div>
    </div>

    {include file="footer.tpl"}
</body>
</html>   