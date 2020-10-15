<!-- formulario de alta de rubro -->
<form action="insertar-rubro" method="POST" class="my-4">
    <div class="row">
    <div class="col-3">
        <div class="form-group">
               <label>Rubro</label>
                <select name="rubro" class="form-control">
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                </select> 
         </div>
        </div>
        <div class="col-6">
            <div class="form-group">
                <label>Descripcion rubro</label>
                <input name="desc_rubro" type="text" class="form-control">
            </div>
        </div>
    </div>
   
    <button type="submit" class="btn btn-dark">Guardar</button>

    <div class="d-flex bd-highlight"> 
        <div class="p-2 flex-fill text-light bg-secondary">Codigo rubro</div>
        <div class="p-2 flex-fill text-light bg-secondary">Descripción</div>
    </div> 

</form>
