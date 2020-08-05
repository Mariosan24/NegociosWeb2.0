<?php

require_once "libs/dao.php" ;

function obtainUserByEmail($userEmail){
   $usuario = array();
   $sqlStr = "SELECT `userCod`,`userEmail`, `userName`, `userPswd`,
   UNIX_TIMESTAMP(`userRgstrd`) as userRgstrd,
   `userState`,`userCell`
   FROM user where userEmail = '%s';";
   $usuario = obtenerUnRegistro(sprintf($sqlStr,$userEmail));
   return $usuario;
}
function userExists($mail){
   $sqlStr = "SELECT COUNT(*) as `exists` FROM `user` where userEmail = '%s';";
   $result = obtenerUnRegistro(sprintf($sqlStr,$mail));
   return $result["exists"];
}
function getUserByFilter($userEmail){
   $usuario = array();
   $sqlStr = "SELECT `userCod`,`userEmail`, `userName`,
   `userState`, `userCell`
   FROM user  where userEmail like '%s';";

   $usuarios = obtenerRegistros(sprintf($sqlStr,$userEmail.'%'));
   return $usuarios;
}

function getUserByCode($usercod){
   $usuario = array();
   $sqlStr = sprintf("SELECT `userCod`,`userEmail`, `userName`,`userPswd`,
     UNIX_TIMESTAMP(`userRgstrd`) as userRgstrd,`userState`,`userCell`
      FROM user where userCod = %d;",intval($usercod));
   $usuario = obtenerUnRegistro($sqlStr);
   return $usuario;
}

function authorized($userEmail, $assetcod){
  $data = array();  
  $sqlStr = "select u.userState from user u 
            inner join `user_type` ut on u.userCod = ut.userCodUT
            inner join `type` t on ut.typeCodUT = t.typeCod
            inner join type_module tm on t.typeCod = tm.typeCod
            where binary u.userEmail = '%s' and tm.mdlCod = '%s';";
    $data = obtenerUnRegistro(sprintf($sqlStr,$userEmail,valstr($assetcod)));
    if(!empty($data)){
        return true;
    }
    return false;
}
function makeMenu($userEmail){
   $menu = array();
   $sqlStr=" select m.mdlCod,m.mdlDsc FROM `user` u 
               inner join `user_type` ut on u.userCod = ut.userCodUT
               inner join `type` t on ut.typeCodUT = t.typeCod
               inner join `type_module` tm on tm.typeCod = t.typeCod
               inner join `module` m on m.mdlCod = tm.mdlCod
               where m.mdlClass = 'MNU' and m.mdlState = 'ACT' and u.userEmail = '%s'
               order by m.mdlDsc;";
      $menu = obtenerRegistros(sprintf($sqlStr, $userEmail));
   return $menu;
}
function newUser($userEmail, $userName,  $userPswd, $timestamp,$userCell='', $userState ='ACT'){
   
   $strsql = "INSERT INTO `user` 
   (`userEmail`, `userName`, `userPswd`,`userRgstrd`,`userState`, `userCell`)
   VALUES ('%s','%s','%s',FROM_UNIXTIME(%s),'%s','%s');";
   $strsql = sprintf($strsql, 
                    valstr($userEmail),
                    valstr($userName),
                    $userPswd,
                    $timestamp,
                    valstr($userState),
                    $userCell);
   if(ejecutarNonQuery($strsql)){
       return getLastInserId();
   }
   return 0;
}
function updateUser($userCod,$userEmail, $userName,  $userPswd, $timestamp,$userCell=' ', $userState ='ACT'){

   $pwsdChangeTime= $timestamp;

   $strsql = "UPDATE `user` set `userEmail`='%s', `userName`='%s', `userPswd`='%s',`userRgstrd`=FROM_UNIXTIME(%s), 
                           `userState`='%s', `userCell`='%s',
                           where `userCod` = %d;";
   $strsql = sprintf($strsql, 
                    valstr($userEmail),
                    valstr($userName),
                    $userPswd,
                    $timestamp,
                    valstr($userState),
                    $userCell,
                    intval($userCod));
   $affected = ejecutarNonQuery($strsql);
   return ($affected > 0);
}
function addRole($typeCod,$userCod){
   $sqlIns = "INSERT INTO `user_type`(`typeCodUT`, `userCodUT`)
   VALUES('%s',%d);";
   $sqlIns = sprintf($sqlIns,$typeCod, intval($userCod));
   $affected = ejecutarNonQuery($sqlIns);
   return ($affected > 0);

}
function removeRole($typeCod,$userCod){
   $sqlDel = "DELETE FROM `user_type` ut WHERE ut.userCodUT = %d and ut.typeCodUT = '%s'; ";
   $result = ejecutarNonQuery(sprintf($sqlDel, intval($userCod), $typeCod));
    if($result)
        return TRUE;
    else
        return FALSE;
}
function userRoles($userCod){
   $sqlStr ="SELECT t.typeCod,t.typeDsc,ut.userCodUT from `type` t 
            left join `user_type` ut on t.typeCod = ut.typeCodUT
            where ut.userCodUT = %d;";
   $roles = array();
   $roles = obtenerRegistros(sprintf($sqlStr, intval($userCod)));
   return $roles;
}
function userAvalaibleRoles($userCod){
   $sqlStr ="SELECT t.typeCod, t.typeDsc from `type` t 
            left join `user_type` ut on t.typeCod = ut.typeCodUT and ut.userCodUT = '%d'
            where ut.userCodUT is null;";
   $roles = array();
   $roles = obtenerRegistros(sprintf($sqlStr, intval($userCod)));
   return $roles;
}
function updateUserNameCell($userName,$userCell,$userCod){
   $sqlStr = "UPDATE  `user` set `userName` = '%s' ,`userCell` = '%s' where `userCod` = %d ; ";
   $result = ejecutarNonQuery(sprintf($sqlStr,$userName,$userCell,$userCod));
   return ($result > 0);
}
?>
