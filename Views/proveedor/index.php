<?php include "Views/templates/header.php"; ?>
<?php if ($data['existe']) { ?>
    <button class="btn btn-outline-primary mb-2" type="button" onclick="frmProveedor();"><i class="fas fa-plus"></i></button>
<?php } ?>
<a class="btn btn-outline-danger mb-2" href="<?php echo BASE_URL; ?>proveedor/inactivos"><i class="fas fa-trash"></i></a>
<div class="card">
    <div class="card-header">
        Proveedores
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered table-hover display responsive nowrap" id="tblProveedor" style="width: 100%;">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Ruc</th>
                        <th>Nombre</th>
                        <th>Teléfono</th>
                        <th>Dirección</th>
                        <th>Estado</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>

<?php include "Views/templates/footer.php"; ?>

<script src="<?php echo BASE_URL; ?>assets/js/modulos/proveedor.js"></script>

</body>

</html>