class ContactMailer < ApplicationMailer
  def contact_email(data)
    from_email = data[:email].present? ? data[:email] : 'contact-form@inflatedarrangemnts.com'
    from_name = data[:name].present? ? data[:name] : 'IA Contact'

    @message = data[:message]

    mail(
      reply_to: %("#{from_name}" <#{from_email}>),
      from: 'scott@inflatedarrangements.com',
      to: 'scott@inflatedarrangements.com',
      subject: data[:subject] || 'Inflated Arrangements - Contact Form'
    )
  end
end
