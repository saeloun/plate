# frozen_string_literal: true

require "test_helper"

class ContactsMailerJobTest < ActiveJob::TestCase
  def test_contacts_mailer_enqueue_job
    contact = create(:contact, email: "test@example.com")

    assert_no_performed_jobs

    perform_enqueued_jobs do
      ContactsMailerJob.perform_later(contact)
    end
    assert_performed_jobs 1
  end
end
