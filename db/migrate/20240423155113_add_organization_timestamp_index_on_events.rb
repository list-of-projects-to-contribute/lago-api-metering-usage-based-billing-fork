# frozen_string_literal: true

class AddOrganizationTimestampIndexOnEvents < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def change
    safety_assured do
      add_index :events, %i[organization_id timestamp], where: "deleted_at IS NULL"
    end
  end
end
