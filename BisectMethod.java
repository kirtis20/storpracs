package pracs;

import java.util.*;

public class BisectMethod{

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter the degree of the polynomial: ");
        int degree = scanner.nextInt();

        double[] coefficients = new double[degree + 1];

        for (int i = degree; i >= 0; i--) {
            System.out.print("Enter the coefficient for x^" + i + ": ");
            coefficients[i] = scanner.nextDouble();
        }

        polynomialBisectionMethod(coefficients, 0.000001);
    }

    private static void polynomialBisectionMethod(double[] coefficients, double tolerance) {
        int iterations = 0;
        double a = 0;
        double b = 10;

        while (Math.abs(b - a) >= tolerance) {
            double c = (a + b) / 2;
            double fa = evaluatePolynomial(coefficients, a);
            double fc = evaluatePolynomial(coefficients, c);

            System.out.println("Iteration " + iterations + ": a = " + a + ", b = " + b + ", c = " + c +", f(a) = " + fa + ", f(c) = " + fc);

            if (fa * fc < 0) {
                b = c;
            } else {
                a = c;
            }

            iterations++;
        }

        System.out.println("Root found at x = " + (a + b) / 2);
        System.out.println("Number of iterations: " + iterations);
    }

    private static double evaluatePolynomial(double[] coefficients, double x) {
        double result = 0;
        for (int i = 0; i < coefficients.length; i++) {
            result += coefficients[i] * Math.pow(x, i);
        }
        return result;
    }
}
