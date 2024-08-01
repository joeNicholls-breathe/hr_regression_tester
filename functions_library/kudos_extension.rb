# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
class KudosExtension < Base
  def create_kudos_individual
    driver.find_element(css: 'a[data-element-id=header-menu-button-star]').click
    sleep 0.50
    driver.find_element(css: 'button[data-element-id=kudos-modal-given-to-individual]').click
    sleep 0.25
    driver.find_element(css: '#radix-2 > div > div:nth-child(3) > form >
      div.kudos-modal__select-buttons > select:nth-child(2) > option').click
    sleep 0.25
    driver.find_element(css: 'button[data-element-id=kudos-modal-type-dropdown]').click
    sleep 0.25
    driver.find_element(css: '#radix-2 > div > div:nth-child(3) > form >
      div.kudos-modal__select-buttons > select:nth-child(4) > option:nth-child(3)').click
    sleep 0.25
    driver.find_element(css: 'textarea[data-element-id=kudos-modal-message]').send_keys 'Test for individual kudos'
    driver.find_element(css: 'button[data-element-id=kudos-modal-submit-button]').click
  end

  def create_kudos_departmental
    driver.find_element(css: 'a[data-element-id=header-menu-button-star]').click
    sleep 0.50
    driver.find_element(css: 'button[data-element-id=kudos-modal-given-to-department]').click
    driver.find_element(xpath: '//option[text()=Sales]').click
    sleep 0.25
    driver.find_element(css: 'button[data-element-id=kudos-modal-type-dropdown]').click
    driver.find_element(xpath: '//option[text()=Job well done').click
    driver.find_element(css: 'textarea[data-element-id=kudos-modal-message]').send_keys 'Test for individual kudos'
    driver.find_element(css: 'button[data-element-id=kudos-modal-submit-button]').click
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
