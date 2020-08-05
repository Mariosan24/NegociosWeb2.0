<div class="">

</div>
<div class="">
  <form id="formLogin" action="index.php?page=login" method="POST" class="">
    <h1>Inicia Sesión</h1>

  <div class=""> </div>

    <input name="returnto" value="{{returnto}}" type="hidden"/>
    <input name="tocken" value="{{tocken}}" type="hidden"/>

      <div class="">
        <label for="">Correo Electronico</label><br>
        <input class="" type="text" name="txtEmail" id="txtEmail" placeholder="tuCorreo@ejemplo.com"value="{{txtEmail}}" required/>
     </div>

     <div class="">
       <input class="" type="password" name="txtPswd" id="txtPswd" value="" placeholder="8 Caracteres o más" required/>
     </div>
      <button class="" id="btnSend"><span class="ion-log-in"></span>&nbsp;Iniciar Sesión</button>

    <div class=""> </div>
      {{if showerrors}}
        <div class="">
          <ul>
            {{foreach errors}}
              <li>
                {{this}}
              </li>
            {{endfor errors}}
          </ul>
        </div>
    {{endif showerrors}}
      <p>¿No tienes una cuenta?</p>
      <button class="" id="btnRegistrate"><a href="index.php?page=signup">Registrate</a></button>
  </form>
</div>
<script>
  $().ready(
    function(){
      $("#btnSend").click(function(e){
          e.preventDefault();
          e.stopPropagation();
          $("#formLogin").submit();
        });
    }
    );
</script>
