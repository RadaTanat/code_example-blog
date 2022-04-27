<?php

/**
 * Presneter class for editing post
 */

declare(strict_types=1);

namespace App\Presenters;

use Nette;
use Nette\Application\UI\Form;


final class EditPresenter extends Nette\Application\UI\Presenter
{
	private Nette\Database\Explorer $database;


	public function __construct(Nette\Database\Explorer $database)
	{
		$this->database = $database;
	}


	public function startup(): void
	{
		parent::startup();

		if (!$this->getUser()->isLoggedIn()) {
			$this->redirect('Sign:in');
		}
	}


	public function renderEdit(int $postId): void
	{
		$post = $this->database
			->table('posts')
			->get($postId);

		if (!$post) {
			$this->error('Téma neexistuje');
		}

		$this->getComponent('postForm')
			->setDefaults($post->toArray());
	}


	protected function createComponentPostForm(): Form
	{
		$form = new Form;
		$form->addText('title', 'Nadpis:')
			->setRequired();
		$form->addTextArea('content', 'Obsah:', 70, 6)
			->setRequired();

		$form->addSubmit('send', 'Vložit');
		$form->onSuccess[] = [$this, 'postFormSucceeded'];

		return $form;
	}


	public function postFormSucceeded(array $values): void
	{
		$postId = $this->getParameter('postId');

		if ($postId) {
			$post = $this->database
				->table('posts')
				->get($postId);
			$post->update($values);

		} else {
			$post = $this->database
				->table('posts')
				->insert($values);
		}

		$this->flashMessage('Vloženo', 'success');
		$this->redirect('Post:show', $post->id);
	}
}
