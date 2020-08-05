<div class="">
    <br>

    <div class=""><h1>{{mode}}</h1></div>

    <div class="">

        <form class="" action="index.php?page=User&act={{act}}&cod={{userCod}}" method="POST">
            <input type="hidden" name="token" id="token" value="{{token}}">
            <input type="hidden" name="btnConfirmar" value="confirmar">

            <div class="">
                <br>
                <label class="" for="userEmail">Correo Electronico del Usuario</label><br>
                <input class="" type="text" name="userEmail" id="userEmail" 
                  placeholder="Correo Electronico" value="{{userEmail}}" {{readonly}}>
            </div>
            <div class="">
                <br>
                <label class="left" for="userName">Nombre del Usuario</label><br>
                <input class="" type="text" name="userName" id="userName" 
                  placeholder="Nombre Completo" value="{{userName}}" {{readonly}}>
            </div>
            <div class="">
                <br>
                <label class="left" for="userCell">Celular del Usuario</label><br>
                <input class="" type="text" name="userCell" id="userCell" 
                  placeholder="Numero Telefonico" value="{{userCell}}" {{readonly}}>
            </div>
            <div class="">
                <label for="userState">Estado de Usuario</label><br>
                <select class="" name="userState" id="userState" 
                {{if readonly}} readonly="readonly" disabled {{endif readonly}} >
                    {{foreach states}}
                        <option value="{{stateCod}}" {{selected}} >{{stateDsc}}</option>
                    {{endfor states}}
                </select>
            </div>
          
            <div class="">
                <br>
                <label class="left" for="userPswd">Contraseña del Usuario</label><br>
                <input class="" type="text" name="userPswd" id="userPswd" 
                  placeholder="Contraseña" {{readonly}}>
            </div>
            <div class="">
                {{if updating}} <button class="" type="submit" id="btnVariaciones">Roles</button>&nbsp; {{endif updating}}
                {{ifnot readonly}}<button class=""  type="submit" id="btnConfirmar" >Confirmar</button>&nbsp; {{endifnot readonly}}
                <button class="" type="submit" id="btnCancelar">Cancelar</button>
            </div>
            <br>
        </form>
        {{if hasErrors}}
            <ul>
                {{foreach errors}}
                    <li>{{this}}</li>
                {{endfor errors}}
            </ul>
        {{endif hasErrors}}
    </div>
</div>

<script>
  $().ready(function(){

    $("#btnCancelar").click(function(e){
      e.preventDefault();
      e.stopPropagation();
      window.location.assign("index.php?page=Users");
    });

    $("#btnVariaciones").click(function(e){
        e.stopPropagation();
        e.preventDefault();
        window.location.assign("index.php?page=Roles&cod={{userCod}}");
    });
    
    $("#btnConfirmar").click(function(e){
      e.preventDefault();
      e.stopPropagation();
      document.forms[0].submit();
    });


  });
</script>