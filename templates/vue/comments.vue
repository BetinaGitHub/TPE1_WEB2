{literal}
<section id="app">
    <form class="form-inline" action="{BASE_URL}abm-comments" method="POST">
        <div class="form-group col-md-6">
            <h4>Califica el producto</h4>
        </div>

        <div class="form-check form-group col-md-6">
            <input class="form-check-input" type="radio" name="radiobutton" id="radiobutton1" value="1" checked>
            <label class="form-check-label" for="radiobutton1"> 1 </label>
        </div>
        <div class="form-check form-group col-md-6">
            <input class="form-check-input" type="radio" name="radiobutton" id="radiobutton2" value="2">
            <label class="form-check-label" for="radiobutton2"> 2 </label>
        </div>
        <div class="form-check form-group col-md-6">
            <input class="form-check-input" type="radio" name="radiobutton" id="radiobutton3" value="3" >
            <label class="form-check-label" for="radiobutton3"> 3 </label>
        </div>
        <div class="form-check form-group col-md-6">
            <input class="form-check-input" type="radio" name="radiobutton" id="radiobutton4" value="4">
            <label class="form-check-label" for="radiobutton4"> 4 </label>
        </div>
        <div class="form-check form-group col-md-6">
            <input class="form-check-input" type="radio" name="radiobutton" id="radiobutton5" value="5" >
            <label class="form-check-label" for="radiobutton5"> 5 </label>
        </div>
    </form>

    <textarea name="comenta" class="form-control md-8"  placeholder="Escribe tu comentario" ></textarea>
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Agregar</button>

    <div class="tab-content overflow-auto" id="myTabContent">
        <table class="table table-bordered table-hover table-sm">
            <thead  class="bg-secondary text-white">
            <tr>
                <th scope="col">Comentario</th>
                <th scope="col">Puntuación</th>
                <th scope="col">Acción</th>           
            </tr>
            </thead> 
            <tbody>
                <tr v-for="comment in comments" v-bind:class ="{'bg-info': comment.puntaje == 5}">
                            
                    <td>{{ comment.comment }}</td>
                    <td>{{ comment.puntaje }}</td>
                    <td class="d-flex no-wrap"><a class="btn btn-dark btn-sm" href="">Eliminar</a></td>
                </tr>     
                 
                <tr>
              
                </tr> 
            </tbody>
        </table>
    </div> 

</section>
{/literal}