using System;

class Program
{
    static void Main()
    {
        do
        {
            Console.Clear();
           
            double num1 = GetNumber("Enter the first number: ");
            
            double num2 = GetNumber("Enter the second number: ");

            char operation = GetOperator();

            double result = Calculate(num1, num2, operation);

            Console.WriteLine($"\nResult: {num1} {operation} {num2} = {result}");

            Console.Write("\nDo you want another calculation? (yes/no): ");
        }
        while (Console.ReadLine().Trim().ToLower() == "y");

        Console.WriteLine("Closing.");
    }

    static double GetNumber(string prompt)
    {
        double number;
        while (true)
        {
            Console.Write(prompt);
            if (double.TryParse(Console.ReadLine(), out number))
                return number;

            Console.WriteLine("Invalid input, enter a valid number.");
        }
    }

    static char GetOperator()
    {
        while (true)
        {
            Console.Write("Enter an operator (+, -, *, /): ");
            char op = Console.ReadKey().KeyChar;
            Console.WriteLine();

            if (op == '+' || op == '-' || op == '*' || op == '/')
                return op;

            Console.WriteLine("Invalid operator, enter on of +, -, *, or /.");
        }
    }

    static double Calculate(double num1, double num2, char operation)
    {
        if (operation == '/' && num2 == 0)
        {
            Console.WriteLine("Error: Division by zero is not allowed!");
            return 0;
        }

        if (operation == '+') return num1 + num2;
        if (operation == '-') return num1 - num2;
        if (operation == '*') return num1 * num2;
        if (operation == '/') return num1 / num2;

        return 0;
    }
}
