## Mailfire
(yes, its a bad name)
##### For when you don't want to send emails for real, but still want an easy way to sanity check the content (i.e. on dev)

```ruby
ActionMailer::Base.add_delivery_method :campfire,
  Mailfire::TextToRoom,
  account: 'youraccount',
  token: '9s8d7fasfdasdfasdfsdfnskldf......',
  room: 'mail'

if Rails.env.development?
  ActionMailer::Base.delivery_method = :ses
end
```

And your email to, from, subject and body will be 'delivered' to your campfire room
