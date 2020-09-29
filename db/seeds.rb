# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
MassageTherapist.create(first_name: 'Lindsay', years_of_experience: 5, specialty: 'Swedish Massage', biography: "My name is Lindsay. I am originally from Chicago, Illinois. I am a 90's baby. I love classical music, yoga, and nature walks. I look forward to meeting you.")
MassageTherapist.create(first_name:  'Alfred', years_of_experience: 7, specialty: 'Shiatsu Massage', biography: 'My name is Alfred. I was born in Atlanta, Georgia. I love to breakdance, weightlifting and drawing. I look forward to meeting you.')
MassageTherapist.create(first_name:  'Hank', years_of_experience: 2, specialty: 'Hot Stone Massage', biography: 'My name is Hank. I was born in Italy. I have been living in the U.S. for 7 years now. I have three dogs and two cats. I am allergic to seafood and onions. I look forward to meeting you.')
MassageTherapist.create(first_name:  'Melissa', years_of_experience: 9, specialty: 'Aromatherapy Massage', biography: 'My name is Melissa. I have five brothers and five sisters. I am the only left-handed person in my family. I look forward to meeting you.')
MassageTherapist.create(first_name:  'Sergio', years_of_experience: 4, specialty: 'Deep Tissue Massage', biography: 'My name is Sergio. I was born in Spain and migrated to the U.S. when I was 5 years old. I speak three languages. I love playing the guitar and spending time with my family. I look forward to meeting you.')
MassageTherapist.create(first_name:  'Alice', years_of_experience: 6, specialty: 'Reflexology Massage', biography: 'My name is Alice. I love to play video games and watching sci-fi movies. I look forward to meeting you.')
MassageTherapist.create(first_name:  'Camilla', years_of_experience: 8, specialty: 'Prenatal Massage', biography: 'My name is Camilla. In my free time, I love completing crossword puzzles. I look forward to meeting you.')
MassageTherapist.create(first_name:  'Nate', years_of_experience: 3, specialty: 'Lymphatic Massage', biography: 'My name is Nate. I am a Scorpio. I love to tan, workout, and going on vacation. My favorite vacation spot is Aruba. I look forward to meeting you.')

Massage.create(type_of_massage: 'Lymphatic Massage ', time_length: '60 mins', price: '$60')
Massage.create(type_of_massage: 'Prenatal Massage ', time_length: '45 mins', price: '$40')
Massage.create(type_of_massage: 'Reflexology Massage ', time_length: '60 mins', price: '$65')
Massage.create(type_of_massage: 'Deep Tissue Massage ', time_length: '60 mins', price: '$70')
Massage.create(type_of_massage: 'Aromatherapy Massage ', time_length: '45 mins', price: '$50')
Massage.create(type_of_massage: 'Hot Stone Massage ', time_length: '60 mins', price: '$80')
Massage.create(type_of_massage: 'Shiatsu Massage ', time_length: '60 mins', price: '$60')
Massage.create(type_of_massage: 'Swedish Massage ', time_length: '60 mins', price: '$75')
