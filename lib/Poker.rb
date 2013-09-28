require_relative "Player"
require_relative "Deck"
require_relative "Hand"

class Poker

  BETTING_COMMANDS = %w(fold raise call withdraw)

  attr_accessor :players, :deck, :pot

  def initialize
    @players = [Player.new("Sleepy", 100), Player.new("Snooky", 100), Player.new("Darwin", 100), Player.new("Snoop Lion", 100)]
    @deck = Deck.new
    @hands = {}
    deal_start_hands
    @pot = 0
    @bet_amount = 0
    @remaining_players = @players
  end

  def deal
    @players.each do |player|
      until player.hand.length >= 5
        player.hand << @deck.draw_card
      end
    end
  end

  def play
    until @players.length == 1
      @remaining_players = @players
      deal
      betting
      # choose to discard cards
      # deal again
      # betting again (keeps going until everyone checks or folds)
      # show down (if remaining players.length > 1)
      # winner, winner gets the pot
      # remove existing hands/discard hands, reshuffle deck
    end
  end

  def betting
    player_has_raised = true
    @bet_amount = 0
    @remaining_players.each {|p|p.bet = 0}

    until !player_has_raised
      num_calls = 0
      player_has_raised = false
      @remaining_players.each do |player|
        bet_response = player.get_bet_response
        if bet_response == "fold"
          @pot += player.bet
          player.take_bet
          @remaining_players.delete(player)
        elsif bet_response == "raise"
          smallest_wallet = @remaining_players.sort_by(&:wallet).first.wallet
          if player.wallet == smallest_wallet && smallest_wallet == @bet_amount
            puts "You cannot raise. Instead, you will call. You have bet #{@bet_amount}."
            player.bet = @bet_amount
          else
            begin
              player_has_raised = true
              potential_raise_amount = player.get_raise_amount(@bet_amount)

              if potential_raise_amount > smallest_wallet
                raise ArgumentError.new "You cannot bet higher than the poorest player."
              end
              @bet_amount = potential_raise_amount
              num_calls = 0
            rescue ArgumentError => e
              puts "Error: #{e.message}"
              retry
            end
          end

          player.bet = @bet_amount
        elsif bet_response == "call"
          num_calls += 1
          if num_calls >= @remaining_players.length-1
            break
          end
          player.bet = @bet_amount
        elsif bet_response == "withdraw"
          @remaining_players.delete(player)
          @players.delete(player)
        end
      end
    end
  end

  private
    def deal_start_hands
      @players.each do |player|
        cards = []
        5.times {cards << @deck.draw_card}
        player.hand = Hand.new(cards)
      end
    end
end