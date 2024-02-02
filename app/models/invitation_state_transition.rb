# frozen_string_literal: true

class InvitationStateTransition
  include ActiveModel::Validations

  attr_reader :event, :invitation

  def initialize(event:, invitation:)
    @event = event
    @invitation = invitation
  end

  validates :event, presence: true
  validates :invitation, presence: true
  validate :event_is_defined, if: -> { event.present? }
  validate :invitation_state_compatible_with_event, if: -> { invitation.present? && event.present? }

  def save
    return false if invalid?

    # +Invitation+ +whiny_persistence+ machine state option makes bang operator return +true+ / +false+
    invitation.aasm.fire!(event)
  end

  private

  def event_is_defined
    return if Invitation.aasm.events.include?(event.to_sym)

    errors.add(:event, :not_defined)
  end

  def invitation_state_compatible_with_event
    compatible_events = invitation.compatible_events

    return if compatible_events.include?(event.to_sym)

    errors.add(:event, :incompatible_with_invitation_state)
  end
end
