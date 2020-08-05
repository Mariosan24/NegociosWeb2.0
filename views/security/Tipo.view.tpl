<div class="">
    <br>

    <div class=""><h1>{{mode}}</h1></div>

    <div class="">

        <form class="" action="index.php?page=Tipo&act={{act}}&cod={{typeCod}}" method="POST">
            <input type="hidden" name="token" id="token" value="{{token}}">
            <input type="hidden" name="typeCod" value="{{typeCod}}">
            <input type="hidden" name="btnConfirmar" value="confirmar">
            <div class="">
                <br>
                <label class="" for="text">Codigo de Tipo de Usuario</label><br>
                <input class="" type="text" name="typeCod" id="typeCod" placeholder="Codigo de Usuario" value="{{typeCod}}" {{readonly}}>
            </div>
            <div class="">
                <br>
                <label class="left" for="text">Nombre de Tipo de Usuario</label><br>
                <input class="" type="text" name="typeDsc" id="typeDsc" placeholder="Tipo de Usuario" value="{{typeDsc}}" {{readonly}}>
            </div>
            <div class="">
                <label for="typeState">Estado</label><br>
                <select class="" name="typeState" id="typeState" 
                {{if readonly}} readonly="readonly" disabled {{endif readonly}} >
                    {{foreach states}}
                        <option value="{{stateCod}}" {{selected}} >{{stateDsc}}</option>
                    {{endfor states}}
                </select>
            </div>
            <div class="">
                <button class=""  type="submit" id="btnConfirmar" {{readonly}}>Confirmar</button>&nbsp;
                <button class="" type="submit" id="btnCancelar">Cancelar</button>
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
      window.location.assign("index.php?page=Tipos");
    });


    
    $("#btnConfirmar").click(function(e){
      e.preventDefault();
      e.stopPropagation();
      document.forms[0].submit();
    });


  });
</script>