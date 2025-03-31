# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class ManagerDashboardExtension < Base
  def switch_todos_to_training
    driver.find_element(id: 'tab-training').click
  end

  def view_open_training_request
    driver.find_element(
      css: '#tab-panel-training > div > table > tbody > tr > td.bdds-table__table-data.bdds-table__table-data--column-align-right > span > a' # rubocop:disable Layout/LineLength
    ).click
  end
end
