# frozen_string_literal: true

module Integrations
  class AvalaraIntegration < BaseIntegration
    has_many :error_details, -> { where({error_details: {error_code: "tax_error"}}) },
      primary_key: :organization_id,
      foreign_key: :organization_id

    validates :company_code, :connection_id, :account_id, :license_key, presence: true

    settings_accessors :account_id, :company_code, :company_id
    secrets_accessors :connection_id, :license_key
  end
end

# == Schema Information
#
# Table name: integrations
#
#  id              :uuid             not null, primary key
#  code            :string           not null
#  name            :string           not null
#  secrets         :string
#  settings        :jsonb            not null
#  type            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :uuid             not null
#
# Indexes
#
#  index_integrations_on_code_and_organization_id  (code,organization_id) UNIQUE
#  index_integrations_on_organization_id           (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#
