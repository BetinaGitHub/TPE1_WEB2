<!-- formulario de alta de las herramientas -->
<div class="container">
  <div class="row">
    <div class="col-3">
        <div id='list-example' class='list-group ' style='max-width: 250px' action="modi-rubro" >
           <a class='list-group-item list-group-item-action text-white bg-info'></a>
        </div>

    </div>
    <div class="col-9">
        <form action="insertar" method="POST" class="my-4">
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
                        <label>Maquinaria Usada</label>
                        <input name="descripcion" type="text" class="form-control">
                    </div>
                </div>
                <div class="col-3">
                    <div class="form-group">
                        <label>Modelo</label>
                        <input name="modelo" type="number" class="form-control">
                    </div>
                </div>
 
            </div>
            <div class="form-group">
               <label>Descripción de la maquinaria</label>
               <textarea name="notas" class="form-control" rows="3"></textarea>
            </div>
            <button type="submit" class="btn btn-dark">Guardar</button>
        </form>
              
    </div>
  </div>
 
</div>
    
<div class="d-flex bd-highlight"> 
    <div class="p-2 flex-fill text-light bg-secondary">Maquinarias</div>
    <div class="p-2 flex-fill text-light bg-secondary">Descripción</div>
    <div class="p-2 flex-fill text-light bg-secondary">Modelo</div>
</div> 


