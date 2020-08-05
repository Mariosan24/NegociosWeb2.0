<div class="">


    <div class="">

        <form class="" action="index.php?page=Modulo&act={{act}}&cod={{mdlCod}}" method="POST">
            <input type="hidden" name="token" id="token" value="{{token}}">
            <input type="hidden" name="mdlCod" value="{{mdlCod}}">
            <input type="hidden" name="btnConfirmar" value="confirmar">
            <div class="">
                <br>
                <label class="" for="mdlCod">Codigo de Modulo</label><br>
                <input class="" type="text" name="mdlCod" id="mdlCod" placeholder="Codigo de Modulo" 
                    value="{{mdlCod}}" {{readonly}}>
            </div>
            <div class="">
                <br>
                <label class="" for="mdlDsc">Descripcion del Modulo</label><br>
                <input class="" type="text" name="mdlDsc" id="mdlDsc" placeholder="Descripcion de Modulo" 
                    value="{{mdlDsc}}" {{readonly}}>
            </div>
            <div class="">
                <label for="mdlState">Estado</label><br>
                <select class="" name="mdlState" id="mdlState" 
                {{if readonly}} readonly="readonly" disabled {{endif readonly}} >
                    {{foreach states}}
                        <option value="{{stateCod}}" {{selected}} >{{stateDsc}}</option>
                    {{endfor states}}
                </select>
            </div>
            <div class="">
                <label for="mdlClass">Clase de Modulo</label><br>
                <select class="" name="mdlClass" id="mdlClass" 
                {{if readonly}} readonly="readonly" disabled {{endif readonly}} >
                    {{foreach class}}
                        <option value="{{classCod}}" {{selected}} >{{classDsc}}</option>
                    {{endfor class}}
                </select>
            </div>
            <div class="">
                <button class="button-3"  type="submit" id="btnConfirmar" {{readonly}}>Confirmar</button>&nbsp;
                <button class="button-3" type="submit" id="btnCancelar">Cancelar</button>
            </div>
            <br>
        </form>
        {{if hasErrors}}
            <ul>
                {{foreach errors}}
                    <li>{{this}}</li>
                {{endofr errors}}
            </ul>
        {{endif hasErrors}}
    </div>
</div>

<script>
  $().ready(function(){

    $("#btnCancelar").click(function(e){
      e.preventDefault();
      e.stopPropagation();
      window.location.assign("index.php?page=Modulos");
    });


    
    $("#btnConfirmar").click(function(e){
      e.preventDefault();
      e.stopPropagation();
      document.forms[0].submit();
    });


  });
</script>