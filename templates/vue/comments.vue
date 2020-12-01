{literal}
<section id="app">
   

    <div class="tab-content overflow-auto" id="myTabContent">
        <table class="table table-bordered table-hover table-sm">
            <thead  class="bg-secondary text-white">
            <tr>
                <th scope="col">Comentario</th>
                <th scope="col">Puntuación</th>
                <th scope="col" v-if="rol == 0">Acción</th>           
            </tr>
            </thead> 
            <tbody>
                <tr v-for="comment in comments" v-bind:class ="{'bg-info': comment.puntaje == 5}">
                            
                    <td>{{ comment.comment }}</td>
                    <td>{{ comment.puntaje }}</td>
                    <td class="d-flex no-wrap" v-if="rol == 0">
                       <button class='btn btn-dark btn-sm' v-on:click="rmComment(comment.id)" v-if="rol == 0">Eliminar</button>
                    </td>

                </tr>     
            </tbody>
        </table>
    </div> 

</section>
{/literal}