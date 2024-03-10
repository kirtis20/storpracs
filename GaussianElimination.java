package pracs;

import java.util.Scanner;

public class GaussianElimination {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.out.println("Enter the number of variables: ");
        int n = in.nextInt();

        // Create an augmented matrix
        int[][] matrix = new int[n][n + 1];

        // Input coefficients with constants
        for (int i = 0; i < n; i++) {
            for (int j = 0; j <= n; j++) {
                System.out.println("Enter coefficients with constant for equation " + (i + 1) + ": ");
                matrix[i][j] = in.nextInt();
            }
        }

        // Apply Gaussian Elimination
        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j < n; j++) {
                double ratio = (double) matrix[j][i] / matrix[i][i];
                for (int k = 0; k <= n; k++) {
                    matrix[j][k] -= ratio * matrix[i][k];
                }
            }
        }

        // Back substitution to find solutions
        double[] solutions = new double[n];
        for (int i = n - 1; i >= 0; i--) {
            double sum = 0.0;
            for (int j = i + 1; j < n; j++) {
                sum += matrix[i][j] * solutions[j];
            }
            solutions[i] = (matrix[i][n] - sum) / matrix[i][i];
        }

        // Output the solutions
        System.out.println("Solutions:");
        for (int i = 0; i < n; i++) {
            System.out.println("x" + (i + 1) + ": " + solutions[i]);
        }
    }
}
