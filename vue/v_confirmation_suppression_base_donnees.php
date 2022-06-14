<?php include "./vue/v_header.php"; ?>
<!-- MAIN DE LA PAGE -->
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Confirmation mise à jour de la base de données</h1>
    </div>

    <div class="alert alert-danger" role="alert">
  Êtes vous sûre de vouloir vider la base de donnée ?</br>
  Le catalogue sera définitivement vidé ainsi que les factures.</br>
  Les statistiques seront remises à 0.

</div>
 <form action="" method="POST"> 
  <input name="action" type="hidden" value="deleteBD"></input>
  <input width="30" height="30" type="submit" class="btn btn-danger btn-lg btn-block" value="Supprimer les données"></input>
</form>
<?php include "./vue/v_footer.php"; ?>