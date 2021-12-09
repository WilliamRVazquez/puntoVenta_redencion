
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- BARRA DE NAVEGACION || DASHBOARD -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- TITULO & LOGO -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="dashboard.php">
                <div class="sidebar-brand-icon rotate-n-15">
                    <img src="../img/logo.png" width="80%" alt="logo">
                </div>
                <div class="sidebar-brand-text mx-3">Abarrotes</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Dashboard Celda -->
            <li class="nav-item active">
                <a class="nav-link" href="dashboard.php">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- APARTADO TIENDA -->
            <div class="sidebar-heading">
                TIENDA
            </div>
            <li class="nav-item">
                <a class="nav-link collapsed" href="listaProductos.php">
                    <span>LISTA DE PRODUCTOS</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="listaUsuarios.php">
                    <span>USUARIOS</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#">
                    <span>VENTAS REALIZADAS</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">
            <br>

            <!-- CONTROL TIENDA -->
            <div class="sidebar-heading">
                CONTROL PANEL
            </div>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#">
                    <span>COLABORADORES</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">
            <br>

            <!-- Boton de Esconder -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- FIN || BARRA DE NAVEGACION -->

        <!-- CONTENIDO -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- USUARIO -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Barra NAV || Usuario ingresadp -->
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="listaProductos.php" aria-haspopup="true" aria-expanded="false">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">LISTA DE PRODUCTOS</div>
                            </a>
                        </li>

                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="ventas.php" aria-haspopup="true" aria-expanded="false">
                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">VENTAS</div>
                            </a>
                        </li>

                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="ventas.php" aria-haspopup="true" aria-expanded="false">
                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">PROVEEDORES</div>
                            </a>
                        </li>
                        <div class="topbar-divider d-none d-sm-block"></div>
                        <!-- Usuario ingresado -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><?php echo $_SESSION['usuario']?></span>
                                <img class="img-profile rounded-circle"
                                    src="../img/undraw_profile.svg">
                            </a>
                            <!-- Cerrar Sesion || Boton -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="../cerrar_session.php">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Cerrar Sesion
                                </a>
                            </div>
                        </li>

                    </ul>
                    
                </nav>
                <!-- FIN Barra NAV -->
