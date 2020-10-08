# frozen_string_literal: true

class Massages
  include Ruby::Enum

  define :LYMPHATIC, 'Lymphatic Massage $60/hr'
  define :PRENATAL, 'Prenatal Massage $40/hr'
  define :REFLEXOLOGY, 'Reflexology Massage $65/hr'
  define :DEEP_TISSUE, 'Deep Tissue Massage $70/hr'
  define :AROMATHERAPY, 'Aromatherapy Massage $50/hr'
  define :HOT_STONE, 'Hot Stone Massage $80/hr'
  define :SHIATSU, 'Shiatsu Massage $60/hr'
  define :SWEDISH, 'Swedish Massage $75/hr'
end
