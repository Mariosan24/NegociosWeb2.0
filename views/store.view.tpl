<div class="">
  <div class="">
    <div class="">
      {{foreach products}}
      <form id="" class="" action="index.php?page={{page}}"
        >
        <input type="hidden" name="codProducto" value="{{codProducto}}">
        <div class="">
          <h2 class="center"> {{nombreProducto}} </h2>
          <img class="col-s-9 col-m-6 col-10 col-l-12 no-padding" src="{{imagenProducto}}" alt="">
        </div>
        <div class="line-red"></div>

        <div class="opciones">
          <h3>Medicamento</h3>
          <label>
            {{nombreProducto}}
          </label>
        </div>
        <div class="line-red"></div>
        <div class="opciones">
          <button name="btnCart" id="btnCart">+&nbsp;<i class="fa fa-shopping-cart"
              aria-hidden="true"></i>&nbsp;</button>
          <button name="btnCheckout" id="btnCheckout">Ordenar Ahora</button>
        </div>
      </form>
      {{endfor products}}
    </div>
  </div>
</div>