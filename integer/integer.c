#include <stdio.h>

int main() {
    int num1, num2;

    // Prompt the user to enter two integers
    printf("Enter two integers: ");
    scanf("%d %d", &num1, &num2);

    // Display the user input
    printf("You entered: %d and %d\n", num1, num2);

    // Calculate and display the sum of the two integers
    int sum = num1 + num2;
    printf("Sum: %d\n", sum);

    // Calculate and display the product of the two integers
    int product = num1 * num2;
    printf("Product: %d\n", product);

    // Calculate and display the logical AND of the two integers
    int logicalAnd = num1 & num2;
    printf("Logical AND: %d\n", logicalAnd);

    // Calculate and display the logical OR of the two integers
    int logicalOr = num1 | num2;
    printf("Logical OR: %d\n", logicalOr);

    return 0;
}
