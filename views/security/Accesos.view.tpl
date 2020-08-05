<div class="">
        <div class="">
            <table class="">
                <thead>
                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th>Dar Acceso</th>
                </thead>
                <tbody>
                   {{foreach types}}
                     <tr>
                        <td>{{typeCod}}</td>
                        <td>{{typeDsc}}</td>
                        <td class="">
                           <a href="index.php?page=Acceso&cod={{typeCod}}"></a> 
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