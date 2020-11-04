def set_title
    puts "     _____         _           _____ _       _ 
    |     |___ ___| |_ ___ ___|     |_|___ _| |
    | | | | .'|_ -|  _| -_|  _| | | | |   | . |
    |_|_|_|__,|___|_| |___|_| |_|_|_|_|_|_|___|"
end

class Line
    attr_accessor :p1, :p2, :p3, :p4, :a1, :a2, :a3, :a4, :number
    def initialize (number)
        @number = number
        @p1 = "-"
        @p2 = "-"
        @p3 = "-"
        @p4 = "-"
        @a1 = "-"
        @a2 = "-"
        @a3 = "-"
        @a4 = "-"
    end

    def get_answer
        puts "\n\nChoose your numbers"
        answer = gets.chomp
        while answer[0].to_i > 6 || answer[1].to_i > 6 || answer[2].to_i > 6 || answer[3].to_i > 6
            puts "\n\nChoose your numbers, they have to be numbers from 0 to 6."
            answer = gets.chomp
        end
        self.p1 = answer[0]
        self.p2 = answer[1]
        self.p3 = answer[2]
        self.p4 = answer[3]
    end
        
    
    def give_feedback

    end


    def print_line
        if self.number == 12
            "\n\n\t\t#{self.number} |  #{self.p1}#{self.p2}#{self.p3}#{self.p4}  |  |#{self.a1}#{self.a2}#{self.a3}#{self.a4}"
        elsif self.number > 9
            "\t#{self.number} |  #{self.p1}#{self.p2}#{self.p3}#{self.p4}  |  |#{self.a1}#{self.a2}#{self.a3}#{self.a4}"
        elsif self.number == 3
            "\t#{self.number}  |  #{self.p1}#{self.p2}#{self.p3}#{self.p4}  |  |#{self.a1}#{self.a2}#{self.a3}#{self.a4}\t Choose Four Numbers From 1 to 6."
        elsif self.number == 2
            "\t#{self.number}  |  #{self.p1}#{self.p2}#{self.p3}#{self.p4}  |  |#{self.a1}#{self.a2}#{self.a3}#{self.a4}\t \u2022 = 100% Correct."
        elsif self.number == 1
            "\t#{self.number}  |  #{self.p1}#{self.p2}#{self.p3}#{self.p4}  |  |#{self.a1}#{self.a2}#{self.a3}#{self.a4}\t * = Right Number, Wrong Space."
        else
            "\t#{self.number}  |  #{self.p1}#{self.p2}#{self.p3}#{self.p4}  |  |#{self.a1}#{self.a2}#{self.a3}#{self.a4}"
        end
    end

    def test
        
    end
end

class Board
    attr_accessor :l1, :l2, :l3, :l4, :l5, :l6, :l7, :l8, :l9,
     :l10, :l11, :l12, :board, :random_numbers, :show_numbers
    def initialize
        @random_numbers = []
        @show_numbers = "    "

        @l1 = Line.new(1)
        @l2 = Line.new(2)
        @l3 = Line.new(3)
        @l4 = Line.new(4)
        @l5 = Line.new(5)
        @l6 = Line.new(6)
        @l7 = Line.new(7)
        @l8 = Line.new(8)
        @l9 = Line.new(9)
        @l10 = Line.new(10)
        @l11 = Line.new(11)
        @l12 = Line.new(12)
    end

    def print_board
        puts "\n\n\t\t ->#{self.show_numbers}<-
        #{self.l12.print_line}
        #{self.l11.print_line}
        #{self.l10.print_line}
        #{self.l9.print_line}
        #{self.l8.print_line}
        #{self.l7.print_line}
        #{self.l6.print_line}
        #{self.l5.print_line}
        #{self.l4.print_line}
        #{self.l3.print_line}
        #{self.l2.print_line}
        #{self.l1.print_line}"
    end

    def select_number
        4.times do
            self.random_numbers.push(rand(1..6))
        end
    end
end


set_title
board = Board.new
board.select_number
board.print_board
board.l1.get_answer
system("clear")
set_title
board.print_board


