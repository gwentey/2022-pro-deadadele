<?php

include_once "./modele/pdo.php";
include_once "./modele/fonctions.php";

logged_only();

if(isset($_SESSION["user"])){    
    if($_SESSION["user"]->role>1){ 
        $LesResultatsClasses = AfficherClasses();
        if (isset($_POST["action"])){
            if ($_POST["action"] == "deleteClasse"){
                SupprimerClasse($_POST["id"]);
        
                header('Location: ./?action=gestion_classes');
            }
        }        
    }else{
        header('Location: ./?action=#');
    }
}

include "./vue/v_gestion_classes.php";
?>
