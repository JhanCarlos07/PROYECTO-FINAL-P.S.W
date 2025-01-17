<?php include "Views/templates/header.php"; ?>
<a class="btn btn-outline-primary mb-2" href="<?php echo BASE_URL; ?>usuarios"><i class="fas fa-reply"></i></a>
<div class="card">
    <div class="card-header">
        Usuarios Inactivos
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered table-hover display responsive nowrap" style="width: 100%;" id="tbl">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Correo</th>
                        <th>Caja</th>
                        <th>Estado</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($data['usuarios'] as $row) {
                        if ($row['estado'] == 0) {
                            $estado = '<span class="badge bg-danger">Inactivo</span>';
                        }
                    ?>
                        <tr>
                            <td><?php echo $row['id']; ?></td>
                            <td><?php echo $row['nombre']; ?></td>
                            <td><?php echo $row['correo']; ?></td>
                            <td><?php echo $row['caja']; ?></td>
                            <td><?php echo $estado; ?></td>
                            <td>
                                <?php if ($data['existe']) { ?>
                                    <button class="btn btn-outline-primary" type="button" onclick="btnReingresarUser(<?php echo $row['id'] ?>);"><i class="fas fa-trash-restore"></i></button>
                                <?php } ?>
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<?php include "Views/templates/footer.php"; ?>

<script src="<?php echo BASE_URL; ?>assets/js/modulos/usuario.js"></script>

</body>

</html>