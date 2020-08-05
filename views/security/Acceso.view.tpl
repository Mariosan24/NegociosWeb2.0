<div class="">
        <div class="">
            <table class="">
                <thead>
                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th>Clase</th>
                    <th>Denegar Acceso</th>
                </thead>
                <tbody>
                   
                   {{foreach hasAccess}}
                    
                     <tr>
                         <form action="index.php?page=Acceso&cod={{typeCod}}" method="post">
                            <input type="hidden" name="typeCod" id="typeCod" value="{{typeCod}}">
                            <input type="hidden" name="mdlCod" id="mdlCod" value="{{mdlCod}}"> 
                            <td>{{mdlCod}}</td>
                            <td>{{mdlDsc}}</td>
                            <td>{{mdlClass}}</td>
                            <td class="">
                            <button class="" name="btnDenegar" id="btnDenegar" type="submit"></button> 
                            </td>
                        </form>
                    </tr>
                     
                   {{endfor hasAccess}}
                   
                </tbody>
            </table>
        </div>
        <br>
        <div class="">
            <h1>Accesos Denegados</h1>
            
        </div>
        <div class="">
            <table class="">
                <thead>
                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th>Clase</th>
                    <th>Garantizar Acceso</th>
                </thead>
                <tbody>
                   
                   {{foreach deniedAccess}}
                     <tr>
                            <form action="index.php?page=Acceso&cod={{typeCod}}" method="post" class="col-s-12">
                                <input type="hidden" name="typeCod" id="typeCod" value="{{typeCod}}">
                                <input type="hidden" name="mdlCod" id="mdlCod" value="{{mdlCod}}"> 
                                    <td>{{mdlCod}}</td>
                                    <td>{{mdlDsc}}</td>
                                    <td>{{mdlClass}}</td>
                                    <td class="">
                                    <button class="" name="btnAcceder" id="btnAcceder" type="submit"></button> 
                                    </td>
                        </form>
                    </tr>
                   {{endfor deniedAccess}}
                    
                </tbody>
            </table>
        </div>
    </div>
<script>
  $().ready(function(){

    $("#btnFiltrarA").click(function(e){
      e.preventDefault();
      e.stopPropagation();
      document.forms[0].submit();
    });
    $("#btnFiltrarD").click(function(e){
      e.preventDefault();
      e.stopPropagation();
      document.forms[2].submit();
    });
    $("#btnRegresar").click(function(e){
      e.preventDefault();
      e.stopPropagation();
      window.location.assign("index.php?page=Accesos");
    });
  });
</script>