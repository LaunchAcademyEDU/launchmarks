//= require spec_helper

describe('Registration Form', function(){
  beforeEach(function(){
    $('body').html(JST['templates/registrations/dialog']());
    this.dialog = new Launchmarks.Views.Registrations.Dialog({
      el: $('#registration-dialog')
    })
  });

  it('makes a registration form visible on open', function(){
    this.dialog.open();
    expect(this.dialog.$el).to.be.visible
  });

  it('makes a registration form not visible on close', function(){
    this.dialog.close();
    expect(this.dialog.$el).to.not.be.visible
  })
})
