<?php
class Home extends Controller
{
    public function __construct() {
        session_start();
        if (!empty($_SESSION['activo'])) {
            header("location: ".BASE_URL. "admin/home");
        }
        parent::__construct();
    }
    public function index()
    {
        $this->views->getView('home',  "index");
    }
}
