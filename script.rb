def set_title
    puts "     _____         _           _____ _       _ 
    |     |___ ___| |_ ___ ___|     |_|___ _| |
    | | | | .'|_ -|  _| -_|  _| | | | |   | . |
    |_|_|_|__,|___|_| |___|_| |_|_|_|_|_|_|___|"
end

class Line
    attr_accessor :p1, :p2, :p3, :p4, :a1, :a2, :a3, :a4, :line 
    def initialize (number)
        @p1 = "-"
        @p2 = "-"
        @p3 = "-"
        @p4 = "-"
        @a1 = "-"
        @a2 = "-"
        @a3 = "-"
        @a4 = "-"

        if number > 9
            @line = "#{number} |  #{self.p1}#{self.p2}#{self.p3}#{self.p4}  |  |#{self.a1}#{self.a2}#{self.a3}#{self.a4}"
        else
            @line = "#{number}  |  #{self.p1}#{self.p2}#{self.p3}#{self.p4}  |  |#{self.a1}#{self.a2}#{self.a3}#{self.a4}"
        end
    end

    def print_line
        puts self.line
    end
end

class Board
    attr_accessor :l1, :l2, :l3, :l4, :l5, :l6, :l7, :l8, :l9, :l10, :l11, :l12, :board
    def initialize
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

        @board = "#{self.l1.print_line}
        #{self.l2.print_line}
        #{self.l3.print_line}
        #{self.l4.print_line}
        #{self.l5.print_line}
        #{self.l6.print_line}
        #{self.l7.print_line}
        #{self.l8.print_line}
        #{self.l9.print_line}
        #{self.l10.print_line}
        #{self.l11.print_line}
        #{self.l12.print_line}"
    end

    def print
        puts self.board
    end
end


board = Board.new
board.print