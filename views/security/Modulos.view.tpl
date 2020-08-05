<div class="">
        <br>
        <div class="">
            <h1 class="">Manejo de Modulos</h1>
        </div>
        <div class="">
            <table class="">
                <thead>
                    <th>Codigo</th>
                    <th>Nombre Español</th>
                    <th>Nombre Ingles</th>
                    <th>Estado</th>
                    <th>Clase</th>
                    <th><a href="index.php?page=Modulo&act=INS"></a></th>
                </thead>
                <tbody>
                   {{foreach module}}
                     <tr>
                        <td>{{mdlCod}}</td>
                        <td>{{mdlDsc}}</td>
                        <td>{{mdlDscEN}}</td>
                        <td>{{mdlState}}</td>
                        <td>{{mdlClass}}</td>
                        <td class="col-s-2 col-m-3 col-2">
                           <a href="index.php?page=Modulo&act=UPD&cod={{mdlCod}}"></a> 
                           <a href="index.php?page=Modulo&act=DSP&cod={{mdlCod}}"></a>
                        </td>
                    </tr>
                   {{endfor module}}
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