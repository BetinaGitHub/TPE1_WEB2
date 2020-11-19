{literal}
<section id="app">
    <ul class="list-group mt-5">
        <li v-for="comment in comments" v-bind:class="{'bg-warning': comment.score == 9}"
            class="list-group-item d-flex justify-content-between">
           {{ comment.descripcion }} - {{ comment.score }}
           <a class='btn btn-danger btn-sm' href="eliminar/{$comment->id}">ELIMINAR</a> 
        </li>
    </ul>
</section>
{/literal}