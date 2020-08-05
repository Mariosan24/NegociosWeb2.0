<div class="">
        <br>
        <div class="">
            <h1 class="">Roles del Usuario</h1>
            <div class="">
              <button class="" id="btnRegresar">Regresar</button>  
            </div>
            <br>
        </div>
        
        <div class="">
            <table class="">
                <thead>
                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th></th>
                </thead>
                <tbody>
                   
                   {{foreach userRoles}}
                    
                     <tr>
                         <form action="index.php?page=Roles&cod={{userCodUT}}" method="post">
                            <input type="hidden" name="typeCod" id="typeCod" value="{{typeCod}}">
                            <input type="hidden" name="typeDsc" id="typeDsc" value="{{typeDsc}}">
                            <input type="hidden" name="userCod" id="userCod" value="{{userCodUT}}"> 
                            <td>{{typeCod}}</td>
                            <td>{{typeDsc}}</td>
                            <td class="">
                            <button class="" name="btnDenegar" id="btnDenegar" type="submit"><i class="fas fa-ban"></i></button> 
                            </td>
                        </form>
                    </tr>
                     
                   {{endfor userRoles}}
                   
                </tbody>
            </table>
        </div>
        <br>
        <div class="">
            <h1 class="">Roles Disponibles</h1>
            
        </div>
        
        <div class="">
            <table class="">
                <thead>
                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th></th>
                </thead>
                <tbody>
                   
                   {{foreach userAvalaibleRoles}}
                     <tr>
                            <form action="index.php?page=Roles&cod={{userCod}}" method="post" class="col-s-12">
                                <input type="hidden" name="typeCod" id="typeCod" value="{{typeCod}}">
                                <input type="hidden" name="typeDsc" id="typeDsc" value="{{typeDsc}}">
                                <input type="hidden" name="userCod" id="userCod" value="{{userCod}}"> 
                                    <td>{{typeCod}}</td>
                                    <td>{{typeDsc}}</td>
                                    <td class="">
                                    <button class="" name="btnAcceder" id="btnAcceder" type="submit"></button> 
                                    </td>
                        </form>
                    </tr>
                   {{endfor userAvalaibleRoles}}
                    
                </tbody>
            </table>
        </div>
    </div>
<script>
  $().ready(function(){

    $("#btnRegresar").click(function(e){
      e.preventDefault();
      e.stopPropagation();
      window.location.assign("index.php?page=Users");
    });
  });
</script>