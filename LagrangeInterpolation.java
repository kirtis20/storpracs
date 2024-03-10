package pracs;
import java.util.Scanner;

public class LagrangeInterpolation {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.out.println("Enter the number of data points (n): ");
        int n = in.nextInt();

        int[] x = new int[n];
        int[] y = new int[n];

        // Input x and y values
        for (int i = 0; i < n; i++) {
            System.out.println("Enter x for point " + (i + 1) + ": ");
            x[i] = in.nextInt();

            System.out.println("Enter y for point " + (i + 1) + ": ");
            y[i] = in.nextInt();
        }

        System.out.println("Enter the value of xc: ");
        double xc = in.nextDouble();

        double result = lagrangeInterpolation(x, y, xc);
        System.out.println("Interpolated value at xc: " + result);
    }

    // Lagrange Interpolation Function
    private static double lagrangeInterpolation(int[] x, int[] y, double xc) {
        double term = 0.0;

        for (int i = 0; i < x.length; i++) {
            double num = 1.0;
            double den = 1.0;

            for (int j = 0; j < x.length; j++) {
                if (i != j) {
                    num *= (xc - x[j]);
                    den *= (x[i] - x[j]);
                }
            }

            term += (num * y[i] / den);
        }

        return term;
    }
}

