{include 'header.tpl'}
    <div class="container"> 
        <div class="row">
            <div class="col-md-4">
                {include 'show_details.tpl' upload=false}
            </div>
           
            <div class="col-md-8">
                <h2 class="text-white bg-dark"> Comentarios</h2>
                {if (isset($smarty.session.EMAIL_USER) && ($smarty.session.ROL_USER == 1))}  
                <input name = "iduser" id="iduser" type = "hidden" value = {$smarty.session.ID_USER}>   
                <input name = "roluser" id="roluser" type = "hidden" value = {$smarty.session.ROL_USER}>  
                <div class="form-group col-md-6">
                    <form id="form_alta_comment" name="form_alta_comment" class="form-inline">
                        <div class="form-group col-md-12">
                           <h4>Califica el producto</h4>
                        </div>
                        <div class="form-check form-group col-md-3 ">
                            <input class="form-check-input" type="radio" name="r_button_score" id="r_button_score1" value="1" checked>
                            <label class="form-check-label" for="r_button_score"> 1 </label>
                        </div>
                        <div class="form-check form-group col-md-3">
                            <input class="form-check-input" type="radio" name="r_button_score" id="r_button_score2" value="2">
                            <label class="form-check-label" for="r_button_score"> 2 </label>
                        </div>
                        <div class="form-check form-group col-md-3">
                            <input class="form-check-input" type="radio" name="r_button_score" id="r_button_score3" value="3" >
                            <label class="form-check-label" for="r_button_score"> 3 </label>
                        </div>
                        <div class="form-check form-group col-md-3">
                            <input class="form-check-input" type="radio" name="r_button_score" id="r_button_score4" value="4">
                            <label class="form-check-label" for="r_button_score"> 4 </label>
                        </div>
                        <div class="form-check form-group col-md-3">
                            <input class="form-check-input" type="radio" name="r_button_score" id="r_button_score5" value="5" >
                            <label class="form-check-label" for="r_button_score"> 5 </label>
                        </div>
                        </div>
                       <div class="row">
                          <div class="col-12 form-group">
                             <textarea id="det_comment" name="det_comment" class="form-control md-8"  placeholder="Escribe tu comentario" ></textarea>
                           </div>
                        </div>
                       
                          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Agregar</button>
                        
                    </form>
                    {else}
                      <input name = "iduser" id="iduser" type = "hidden" value = 0>   
                      <input name = "roluser" id="roluser" type = "hidden" value = 2>   
                    {/if}
                    {include file="vue/comments.vue"}
                </div>
            </div>
           
        </div>
    </div>

    <!--  JS para CSR -->
      <script src="../js/comments.js"></script>    
     <script src="../js/addcomment.js"></script> 
    {include file="footer.tpl"}
</body>
</html>    