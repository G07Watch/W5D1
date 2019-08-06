# Ghost instance 


class Ghost

    attr_reader :dictionary, :frag

    def initialize(player1, player2, frag)
        dictionary = Hash.new(false)
        dict_file = File.open("dictionary.txt")
        dict_file.each{ |word| dictionary[word] = word}

        @dictionary = dictionary
        @frag = frag
        @player1 = player1
        @player2 = player2
    end

    def valid_play?(fragment)
        if dictionary.has_key?(fragment)
            gameover
        else 
            dictionary[key].include?(fragment)
                return true
            end
        end 
    end

    def play_round
    end

    def current_player
    end





    
end