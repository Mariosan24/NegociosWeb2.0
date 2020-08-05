<?php

require_once 'libs/dao.php';


function getModules()
{
    $module = array();
    $sqlStr = "SELECT * FROM `module`;";
    $module = obtenerRegistros($sqlStr);
    return $module;
}
function getModulesByCode($mdlCod){
    $sqlStr = "SELECT * FROM `module` where `mdlCod` = '%s';";
    $modules = array();
    $modules = obtenerUnRegistro(sprintf($sqlStr, $mdlCod));
    return $modules;
}
function getModulesByFilter($mdlCod = ""){
    $filter = array();
    $sqlStr = "SELECT * FROM `module` where mdlCod like '%s'; ";
    $filter = obtenerRegistros(sprintf($sqlStr, $mdlCod.'%'));
    return $filter;
}
function newModule($mdlCod,$mdlDsc,$mdlState, $mdlClass){
    $sqlIns = "INSERT INTO `module` (`mdlCod`,`mdlDsc`, `mdlState`, `mdlClass`)
     VALUES ('%s','%s', '%s', '%s');";
     $result = ejecutarNonQuery(sprintf($sqlIns,$mdlCod,$mdlDsc,$mdlState, $mdlClass));
     if($result)
        
        return TRUE;
    else
        return FALSE;
}
function updateModule($mdlCod,$mdlDsc,$mdlState, $mdlClass){
    $sqlUpd = "UPDATE `module` SET `mdlDsc` = '%s' , `mdlState` = '%s', `mdlClass` = '%s'  WHERE (`mdlCod` = '%s');";
    $result = ejecutarNonQuery(sprintf($sqlUpd, $mdlDsc, $mdlState,$mdlClass,$mdlCod));
    return ($result > 0);
}
?>
