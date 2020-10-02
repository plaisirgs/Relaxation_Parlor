# frozen_string_literal: true

class Massages < ActiveRecord::Base
  include Ruby::Enum

  define :LYMPHATIC, 'Lymphatic Massage $60/hr'
  define :GREEN, 'green'
end



# Massage.create(type_of_massage: 'Lymphatic Massage ', time_length: '60 mins', price: '$60')
# Massage.create(type_of_massage: 'Prenatal Massage ', time_length: '60 mins', price: '$40')
# Massage.create(type_of_massage: 'Reflexology Massage ', time_length: '60 mins', price: '$65')
# Massage.create(type_of_massage: 'Deep Tissue Massage ', time_length: '60 mins', price: '$70')
# Massage.create(type_of_massage: 'Aromatherapy Massage ', time_length: '60 mins', price: '$50')
# Massage.create(type_of_massage: 'Hot Stone Massage ', time_length: '60 mins', price: '$80')
# Massage.create(type_of_massage: 'Shiatsu Massage ', time_length: '60 mins', price: '$60')
# Massage.create(type_of_massage: 'Swedish Massage ', time_length: '60 mins', price: '$75')
