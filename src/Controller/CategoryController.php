<?php

namespace App\Controller;

use App\Model\CategoryManager;
use App\Service\ValidationCategory;

class CategoryController extends AbstractController
{
    public function indexCategory(): string
    {
        if (isset($_SESSION['user_id'])) {
            $categoryManager = new CategoryManager();
            $categories = $categoryManager->selectAll('name');

            return $this->twig->render('Category/index.html.twig', ['categories' => $categories]);
        } else {
            header('Location: /');
            die();
        }
    }

    public function show(int $id): string
    {
        if (isset($_SESSION['user_id'])) {
            $categoryManager = new CategoryManager();
            $item = $categoryManager->selectOneById($id);

            return $this->twig->render('Category/index.html.twig', ['item' => $item]);
        } else {
            header('Location: /');
            die();
        }
    }

    public function addCategory(): ?string
    {
        if (isset($_SESSION['user_id'])) {
            $errors = [];
            if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                // clean $_POST data
                $category = array_map('trim', $_POST);

                $errorsValidation = new ValidationCategory();
                $errorsValidation->formValidationCategory($category);
                $errors = $errorsValidation->errors;

                if (empty($errors)) {
                    // if validation is ok, insert and redirection
                    $categoryManager = new CategoryManager();
                    $category = $categoryManager->addCategory($category);

                    header('Location:/categories/');
                    return null;
                }
            }
            return $this->twig->render('Category/add.html.twig', ["errors" => $errors]);
        } else {
            header('Location: /');
            die();
        }
    }

    public function delete(): void
    {
        if (isset($_SESSION['user_id'])) {
            if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                $id = trim($_POST['id']);
                $categoryManager = new CategoryManager();
                $categoryManager->delete((int)$id);

                header('Location:/Categories');
            }
        } else {
            header('Location: /');
            die();
        }
    }
    public function editCategory(int $id): ?string
    {
        if (isset($_SESSION['user_id'])) {
            $errors = [];
            $categoryManager = new CategoryManager();
            $category = $categoryManager->selectOneById($id);


            if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                // clean $_POST data
                $updatedCategory = array_map('trim', $_POST);
                // TODO validations (length, format...)
                $errorsValidation = new ValidationCategory();
                $errorsValidation->formValidationCategory($category);
                $errors = $errorsValidation->errors;

                if (empty($errors)) {
                    // if validation is ok, update and redirection
                    $categoryManager->updateCategory($updatedCategory);

                    header('Location: /categories');

                    // we are redirecting so we don't want any content rendered
                    return null;
                }
            }
            return $this->twig->render('Category/edit.html.twig', [
                'category' => $category,
                'errors' => $errors
            ]);
        } else {
            header('Location: /');
            die();
        }
    }
}
