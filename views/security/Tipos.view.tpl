<div class="">
        <br>
        <div class="">
            <h1 class="">Manejo de Usuarios</h1>
        </div>
        <div class="">
            <table class="">
                <thead>
                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th>Estado</th>
                    <th>Fecha de Expiracion</th>
                    <th><a href="index.php?page=Tipo&act=INS"></a></th>
                </thead>
                <tbody>
                   {{foreach types}}
                     <tr>
                        <td>{{typeCod}}</td>
                        <td>{{typeDsc}}</td>
                        <td>{{typeState}}</td>
                        <td>{{typeExp}}</td>
                        <td>
                           <a href="index.php?page=Tipo&act=UPD&cod={{typeCod}}"></a>
                           <a href="index.php?page=Tipo&act=DSP&cod={{typeCod}}"></a>
                        </td>
                    </tr>
                   {{endfor types}}
                </tbody>
            </table>
        </div>
    </div>
<script>
  $().ready(function(){
    $("#btnFiltrar").click(function(e){
      e.preventDefault();
      e.stopPropagation();
      document.forms[0].submit();
    });
  });
</script>