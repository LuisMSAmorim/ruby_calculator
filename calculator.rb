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
        when 2
            sub_operation
        when 3
            mult_operation
        when 4
            div_operation
        when 5
            show_result
        when 6
            percentage_operation
        when 7
            puts "Programa finalizado..."
            return
        else
            puts "[ERRO]"
            return
        end
    end

    def sum_operation
        number = enter_number("Insira um número para somar #{@result}: ")

        @result += number
    end

    def sub_operation
        number = enter_number("Insira um número para subtrair #{@result}: ")

        @result -= number
    end

    def mult_operation
        number = enter_number("Insira um número para multiplicar #{@result}: ")

        @result *= number
    end

    def div_operation
        number = enter_number("Insira um número para dividir #{@result}: ")

        if number == 0
            puts "Operação inválida..."
            return
        end

        @result = @result / number
    end

    def percentage_operation
        percentage = enter_number("Insira um número para calcular a porcentagem de #{@result}: ")

        @result = @result * (percentage / 100)
    end

    def show_result
        puts "O resultado atual é: #{@result}"
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
            begin
                number = Float(gets)

                return number
            rescue
                puts "Número inválido, tente novamente..."
            end
        end
    end
end

calculator = Calculator.new

calculator.main