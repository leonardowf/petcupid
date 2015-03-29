# encoding: utf-8
class AnimalMailer < ActionMailer::Base
  default from: "Equipe PetCupid <contact@petcupid.com.br>"

  def meet_up_proposal(animal, friendly_user)
    @animal = animal
    @friendly_user = friendly_user
    mail(:subject => "Quero conhecer o #{@animal.name}!", :to => @animal.user_owner.email) do |format|
      format.html { render layout: 'mailer_layout' }
    end
  end
end