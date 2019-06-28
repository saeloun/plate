# frozen_string_literal: true

require "test_helper"

class ContactsMailerJobTest < ActiveJob::TestCase
  def setup
    @contact = create(:contact, email: "test@example.com")
  end

  def test_contacts_mailer_enqueue_job
    assert_no_performed_jobs

    perform_enqueued_jobs do
      ContactsMailerJob.perform_later(@contact)
    end
    assert_performed_jobs 1
  end

  def test_enqueue_contacts_mailer_job_only
    assert_no_performed_jobs except: ContactsMailerJob do
      ContactsMailerJob.perform_later(@contact)
    end
  end
end
