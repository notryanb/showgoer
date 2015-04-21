class Following < ActiveRecord::Base
  belongs_to :originator, class_name: 'User', foreign_key: :originator_id
  belongs_to :target, class_name: 'User', foreign_key: :target_id

  def self.user_originators(theuser)
    @user_originatorids = []
    @usr_originators = []
    @theoriginators = Following.where(target_id: theuser.id)
    @theoriginators.each do |target_object|
      @user_originatorids << target_object.originator_id
    end
    @user_originatorids.each do |originatorid|
      @usr_originators << User.find_by_id(originatorid)
    end
    return @usr_originators
  end

  def self.user_targetors(theuser)
    @user_targetids = []
    @user_targets = []
    @thetargets = Following.where(originator_id: theuser.id)
    @thetargets.each do |target_object|
      @user_targetids << target_object.target_id
    end
    @user_targetids.each do |targetid|
      @user_targets << User.find_by_id(targetid)
    end
    return @user_targets
  end
end