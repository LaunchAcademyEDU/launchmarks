window.Launchmarks.Views.Registrations.Dialog = function(options){
  this.el = options.el;
  this.$el = $(this.el);
  this.$el.addClass('reveal-modal');

  this.trigger = options.trigger;

  this.triggerClick = function(e){
    e.preventDefault();
    this.open();
  };

  this.open = function(){
    this.modal = this.$el.reveal();
  };

  this.close = function(){
    if(this.modal){
      this.modal.trigger('reveal:close');
    }
  };

  _.bindAll(this, 'open', 'close', 'triggerClick');

  if(this.trigger){
    $(this.trigger).on('click', this.triggerClick);
  }
};
