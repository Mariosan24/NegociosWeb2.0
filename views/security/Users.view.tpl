<div class="">

        <div class="">
            <table class="">
                <thead>
                    <th>Correo</th>
                    <th>Nombre</th>
                    <th>Estado</th>
                    <th>Celular</th>
                    <th><a href="index.php?page=User&act=INS"></a></th>
                </thead>
                <tbody>
                   {{foreach users}}
                     <tr>
                        <td>{{userEmail}}</td>
                        <td>{{userName}}</td>
                        <td>{{userState}}</td>
                        <td>{{userCell}}</td>
                        <td class="">
                           <a href="index.php?page=User&act=UPD&cod={{userCod}}"></a>
                           <a href="index.php?page=User&act=DSP&cod={{userCod}}"></a>
                        </td>
                    </tr>
                   {{endfor users}}
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