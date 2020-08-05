<div class="">

<script>
    $().ready(function(){
    $("#btnOrder").click(function(e){
    e.preventDefault();
    e.stopPropagation();
    window.location.assign("index.php?page={{store}}");
    });
});
</script>   