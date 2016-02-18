require 'active_support/concern'

module NotifyableMixin
  extend ActiveSupport::Concern

  included do
    after_create :create_notification
  end

  def create_notification
    n = Notification.new entity: self, new: true

    if respond_to? :answer # Comment
      n.answer = answer
    elsif self.class == Answer
      n.answer = self
    elsif respond_to?(:entity) && entity.class == Answer # smile
      n.answer = entity
    end

    if !n.answer.nil?
      n.question = n.answer.question
    elsif respond_to? :questions
      n.question = question
    elsif self.class == Question
      n.question = self
    end

    if !n.answer.nil?
      Subscription.batch n, n.answer
    end

    if !n.question.nil?
      Subscription.batch n, n.question
    end

    return if !respond_to?(:destination)

    n.account = destination
    n.save
  end
end
