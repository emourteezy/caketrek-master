<div id="fb-root"></div>

<div class="users form row thumbnails">

<div class="span6 offset3">
	
	<h2>Se connecter avec facebook</h2>	
	<a href="<?php echo $this->Html->url(array('action'=>'facebook')); ?>" class="facebookConnect">Se connecter avec Facebook</a>
</div>

	<div class="span6 offset2">
		<div class="thumbnail">
<?php echo $this->Session->flash('auth'); ?>
<?php echo $this->Form->create('User'); ?>
	<fieldset>
		<legend><?php echo __('Please enter your username and password'); ?></legend>
		<?php echo $this->Form->input('username');
		echo $this->Form->input('password');
	?>
	</fieldset>
<?php echo $this->Form->end(array(
	'label'=>__('Login'),'class'=>'btn btn-primary','div'=>array('class'=>'form-actions'))); ?>
		</div>
	</div>
</div>
<h2>Session utilisateur</h2>

<?php echo $this->Html->script('jquery'); ?>

<?php echo $this->Html->script('facebook'); ?>

