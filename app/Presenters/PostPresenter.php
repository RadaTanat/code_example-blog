<?php

/**
 * Presneter class for create and show new post
 */

declare(strict_types=1);

namespace App\Presenters;

use Nette;
use Nette\Application\UI\Form;


final class PostPresenter extends Nette\Application\UI\Presenter
{
	private Nette\Database\Explorer $database;


	public function __construct(Nette\Database\Explorer $database)
	{
		$this->database = $database;
	}


	public function renderShow(int $postId): void
	{
		$post = $this->database->table('posts')->get($postId);
		if (!$post) {
			$this->error('Post not found');
		}

		$this->template->post = $post;
		$this->template->comments = $post->related('comment')->order('created_at');
	}


	protected function createComponentCommentForm(): Form
	{
		$form = new Form;
		$form->addText('name', 'Jméno:')
			->setRequired();

		$form->addEmail('email', 'Email:');

		$form->addTextArea('content', 'Komentář:', 65, 4)
			->setRequired();

		$form->addSubmit('send', 'Poslat');
		$form->onSuccess[] = [$this, 'commentFormSucceeded'];

		return $form;
	}


	public function commentFormSucceeded(\stdClass $values): void
	{
		$this->database->table('comments')->insert([
			'post_id' => $this->getParameter('postId'),
			'name' => $values->name,
			'email' => $values->email,
			'content' => $values->content,
		]);

		$this->flashMessage('Díky za vložení', 'success');
		$this->redirect('this');
	}
}