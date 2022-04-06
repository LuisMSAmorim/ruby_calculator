class Calculator

    def initialize
        @result = 0
    end

    def main
        puts "Seja bem-vindo a Calculadora Ruby..."
        execute
    end

    private 

    def execute
        exit_command = 7
        option = 0

        while option != exit_command
            show_result

            print_principal_menu

            option = enter_menu_option(exit_command)

            execute_selected_action(option)
        end
    end

    def print_principal_menu
        puts "1- Somar"
        puts "2- Subtrair"
        puts "3- Multiplicar"
        puts "4- Dividir"
        puts "5- Resultado"
        puts "6- Porcentagem"
        puts "7- Sair"
    end

    def execute_selected_action(option)
        case option

        when 1
            sum_operation
            return
        when 2
            return sub_operation
        when 3
            return mult_operation
        when 4
            return div_operation
        when 5
            return show_result
        when 6
            return percentage_operation
        when 7
            puts "Programa finalizado..."
            return
        else
            return "[ERRO]"
        end
    end

    def sum_operation
        number = enter_number("Insira um número para somar #{@result}: ")

        @result += number
        return @result
    end

    def sub_operation
        number = enter_number("Insira um número para subtrair #{@result}: ")

        @result -= number
        return @result
    end

    def mult_operation
        number = enter_number("Insira um número para multiplicar #{@result}: ")

        @result *= number
        return @result
    end

    def div_operation
        number = enter_number("Insira um número para dividir #{@result}: ")

        if number == 0
            puts "Operação inválida..."
            return
        end

        @result = @result / number
        return @result
    end

    def percentage_operation
        percentage = enter_number("Insira um número para calcular a porcentagem de #{@result}: ")

        @result = @result * (percentage / 100)
        return @result
    end

    def show_result
        puts @result
    end

    def enter_menu_option(exit_command)
        while true
            option = enter_number("Digite sua opção")

            if(option < 1 || option > exit_command)
                puts "Opção inválida, tente novamente..."
            else
                return option
            end
        end
    end

    def enter_number(message)
        puts message

        while true
            number = gets

            begin
                Float(number)
                return Float(number)
            rescue
                puts "Número inválido, tente novamente..."
            end
        end
    end

end

a = Calculator.new

puts a.main