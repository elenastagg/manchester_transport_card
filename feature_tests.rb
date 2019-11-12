# frozen_string_literal: true

require './lib/transport_card'

# ---------
# Transport card
# ---------

# transport_card = TransportCard.new

# p transport_card

# puts transport_card.balance

# transport_card.top_up(30)

# transport_card.top_up(10)

# puts transport_card.balance == 40

# # transport_card.top_up(51)

# # puts 'An error should have been thrown and we shouldn\'t see this message'

# transport_card.tap_in

# puts '£1.50 should have been taken off my card = £38.50'
# puts transport_card.balance == 38.50
# puts 'User is in journey now'
# puts transport_card.in_journey? == true

# transport_card.tap_out
# puts 'User has completed their journey'
# puts transport_card.in_journey? == false

# ---------
# Station
# ---------

transport_card = TransportCard.new
transport_card.top_up(30)
transport_card.tap_in("didsbury")
transport_card.tap_out("withington")
transport_card.entry_station == nil
transport_card.tap_in("manchester victoria")
transport_card.tap_out("chorlton")
transport_card.entry_station == nil
transport_card.journey_history == ["didsbury", "manchester victoria"]