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
        puts "\nChoose your numbers"
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
        position_list = [self.p1, self.p2, self.p3, self.p4]
        ordered_answer = ['-','-','-','-']
        #check if is in the position and give \u2022
        index_1 = 0
        numbers = $random_numbers.dup
        for i in position_list
            x = index_1
            print numbers
            for j in numbers
                if i == j
                    ordered_answer[x] = ("*")
                    numbers.delete(i)
                    break
                end
            end
            index_1 += 1
        end
        
        index = 0
        while index < 4 do 
            i = index
            if position_list[i] == $random_numbers[i]
                ordered_answer[i] = ("\u2022")
            end
            index += 1
        end



        #make the answer to be in random place
        ordered_answer.shuffle!

        self.a1 = ordered_answer[0]
        self.a2 = ordered_answer[1]
        self.a3 = ordered_answer[2]
        self.a4 = ordered_answer[3]
    end

    def make_line
        if self.number == 12
            "\n\n\t\t#{self.number} |  #{self.p1}#{self.p2}#{self.p3}#{self.p4}  |  |#{self.a1}#{self.a2}#{self.a3}#{self.a4}"
        elsif self.number > 9
            "\t#{self.number} |  #{self.p1}#{self.p2}#{self.p3}#{self.p4}  |  |#{self.a1}#{self.a2}#{self.a3}#{self.a4}"
        elsif self.number == 3
            "\t#{self.number}  |  #{self.p1}#{self.p2}#{self.p3}#{self.p4}  |  |#{self.a1}#{self.a2}#{self.a3}#{self.a4}\t Choose Four Numbers From 1 to 6."
        elsif self.number == 2
            "\t#{self.number}  |  #{self.p1}#{self.p2}#{self.p3}#{self.p4}  |  |#{self.a1}#{self.a2}#{self.a3}#{self.a4}\t \u2022 = 100% Correct."
        elsif self.number == 1
            "\t#{self.number}  |  #{self.p1}#{self.p2}#{self.p3}#{self.p4}  |  |#{self.a1}#{self.a2}#{self.a3}#{self.a4}\t * = Right Number, Wrong Space.\n\n"
        else
            "\t#{self.number}  |  #{self.p1}#{self.p2}#{self.p3}#{self.p4}  |  |#{self.a1}#{self.a2}#{self.a3}#{self.a4}"
        end
    end

    def check_winner
        if self.p1 == $random_numbers[0] && self.p2 == $random_numbers[1] && self.p3 == $random_numbers[2] && self.p4 == $random_numbers[3]
            puts "You Won!!"
            $play_game = false
        end
        if self.number == 12
            if self.p1 != $random_numbers[0] && self.p2 != $random_numbers[1] && self.p3 != $random_numbers[2] && self.p4 != $random_numbers[3]
                puts "You loose!"
                $play_game = false
            end
        end
    end
end

class Board
    attr_accessor :l1, :l2, :l3, :l4, :l5, :l6, :l7, :l8, :l9,
     :l10, :l11, :l12, :board, :lines, :show_numbers
    def initialize
        
        @show_numbers = "    "

        @lines = [l1 = Line.new(1), l2 = Line.new(2), l3 = Line.new(3), l4 = Line.new(4), l5 = Line.new(5), l6 = Line.new(6), l7 = Line.new(7), l8 = Line.new(8), l9 = Line.new(9), l10 = Line.new(10), l11 = Line.new(11), l12 = Line.new(12)]
    end
=begin self.show_numbers 
=end
    def print_board
        system('clear')
        set_title
        puts "\n\n\t\t ->#{$random_numbers}<-
        #{self.lines[11].make_line}
        #{self.lines[10].make_line}
        #{self.lines[9].make_line}
        #{self.lines[8].make_line}
        #{self.lines[7].make_line}
        #{self.lines[6].make_line}
        #{self.lines[5].make_line}
        #{self.lines[4].make_line}
        #{self.lines[3].make_line}
        #{self.lines[2].make_line}
        #{self.lines[1].make_line}
        #{self.lines[0].make_line}"
    end
end

def select_numbers
    4.times do
        $random_numbers.push(rand(1..6).to_s)
    end
end

$random_numbers = []
$play_game = true
$board = Board.new
select_numbers
index_lines = 0

while $play_game == true
    i = index_lines
    $board.print_board
    $board.lines[i].get_answer
    $board.print_board
    $board.lines[i].give_feedback
    $board.print_board
    $board.lines[i].check_winner
    index_lines += 1
end

=begin
set_title
board = Board.new
select_numbers
board.print_board
board.l1.get_answer
system("clear")
set_title
board.print_board
board.l1.give_feedback
board.print_board
=end