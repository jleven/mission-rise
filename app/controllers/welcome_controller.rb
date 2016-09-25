class WelcomeController < ApplicationController
  WORDS = %w{action active admire agree amazing angelic approve awesome beaming believe bliss bounty brave bravo bubbly calm certain champ cheery choice classic clean commend cool cute delight divine earnest easy elegant ethical fair famous fine fitting free fresh fun funny genius genuine giving glowing good great green grin growing happy healing healthy hearty honest honored hug idea ideal imagine instant jovial joy keen kind knowing laugh light learned lively lovely lucid lucky merit moving natural nice novel now okay one open perfect poised popular pretty proud quality quick quiet ready refined rejoice reward right robust safe secure seemly simple skilled smile soulful special success sunny super superb tops unreal up upbeat upright valued vibrant victory vital wealthy welcome well whole willing worthy wow yes yummy zeal zealous}
  
  def index
    session[:user_id] = generate_user_id
  end

  def my_code
    session[:user_id] = generate_user_id
  end

  private
  def generate_user_id
    WORDS.sample(3).join(' ')
  end
end
