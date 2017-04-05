require 'rails_helper'

describe EventSerializer, type: :serializer do
  describe 'data' do
    let(:community) { build_stubbed(:community) }
    let(:event) { build_stubbed(:event, community: community) }

    subject { serialize_with_json_api(event) }

    it do
      is_expected.to include_json(
        data: {
          id: event.id.to_s,
          attributes: {
            name: event.name,
            description: event.description,
            'community-id': event.community_id,
            'event-starts-at': event.event_starts_at.to_s,
            'event-ends-at': event.event_ends_at.to_s,
            address: event.address
          },
          relationships: {
            community: {
              data: {
                id: community.id.to_s
              }
            }
          }
        }
      )
    end

    context 'include tickets' do
      let(:tickets) { build_stubbed_list(:ticket, 2) }
      let(:event_with_tickets) do
        build_stubbed(:event, community: community, tickets: tickets)
      end

      subject { serialize_with_json_api(event_with_tickets, include: 'tickets') }

      it do
        is_expected.to include_json(
          data: {
            relationships: {
              tickets: {
                data: tickets.map {|ticket| ticket.attributes}
              }
            }
          }
        )
      end
    end
  end
end
