# app/mailers/webforms_mailer.rb
class WebformsMailer < ApplicationMailer
  def batch_upload_email(uni_updates_batch, duplicates)
    @uni_updates_batch = uni_updates_batch
    @duplicates = duplicates
    all_recipients = ['sul-unicorn-devs@lists.stanford.edu']
    if @uni_updates_batch.user_email
      form_recipients = @uni_updates_batch.user_email.split(',')
      all_recipients << form_recipients
    end
    mail(to: all_recipients, subject: 'Batch update request')
  end

  def batch_delete_email(uni_updates_batch)
    @uni_updates_batch = uni_updates_batch
    all_recipients = ['sul-unicorn-devs@lists.stanford.edu']
    if @uni_updates_batch.user_email
      form_recipients = @uni_updates_batch.user_email.split(',')
      all_recipients << form_recipients
    end
    mail(to: all_recipients, subject: 'Batch update deletion')
  end
end
