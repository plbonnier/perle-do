<?php

namespace App\Controller;

use App\Model\TypeManager;

class TypeController extends AbstractController
{
    public function indexType()
    {
        if (isset($_SESSION['user_id'])) {
            echo "bonjour";
        } else {
            header('Location: /');
            die();
        }
    }
}
