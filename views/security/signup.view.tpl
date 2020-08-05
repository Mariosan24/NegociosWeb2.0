<div class="">

</div>
<div class="">
<form id="formLogin" action="index.php?page=signup" method="POST" class="">
    <br>
    <a href="index.php?page=login">Regresar</a>
    <h1>Datos Generales</h1>
    <div class=""> </div>
    <br>
    <input type="hidden" name="token" id="token" value="{{token}}">
    <input type="hidden" name="btnConfirmar" value="confirmar">

    <div class="">
      <label for="txtNombre">Primer Nombre</label><br>
      <input class=" {{nErr}}" type="text" name="txtNombre" id="txtNombre" {{if nameErr}}placeholder="{{nameErr}}"{{endif nameErr}}
      placeholder="Ejem. Juan" required>
    </div>

    <div class="">
      <label for="txtApellido">Primer Apellido</label><br>
      <input class=" {{aErr}}"  type="text" name="txtApellido" id="txtApellido" {{if apeErr}}placeholder="{{apeErr}}"{{endif apeErr}}
        placeholder="Ejem. Perez" required>
    </div>

    <div class="">
      <label for="txtEmail">Correo Electronico</label><br>
      <input class=" {{eErr}}{{xErr}}" type="text" name="txtEmail" id="txtEmail" {{if existErr}}placeholder="{{existErr}}"{{endif existErr}}
        {{if emaErr}}placeholder="{{emaErr}}"{{endif emaErr}}
        placeholder="tuCorreo@ejemplo.com" required value="{{txtEmail}}"/>
    </div>

    <div class="">
      <label for="txtPswd">Contraseña</label><br>
      <input class=" {{wErr}}" type="password" name="txtPswd" id="txtPswd" value="" {{if pwdsErr}}placeholder="{{pwdsErr}}"{{endif pwdsErr}}
        placeholder="8 Caracteres o más" required/>
    </div>

    <div class="">
      <label for="txtRePswd">Repita la Contraseña</label><br>
      <input class=" {{pErr}}" type="password" name="txtRePswd" id="txtRePswd" value="" {{if pasErr}}placeholder="{{pasErr}}"{{endif pasErr}}
        placeholder="Repita la Contraseña" required/>
    </div>
    <br>
      <div class=""> </div>

      <br>
      <button class="" type="submit" id="btnConfirmar">Registrarse</button>
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
  </form>
</div>
