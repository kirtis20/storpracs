package pracs;
import java.util.Scanner;

public class TransportationProblem {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        // Input the number of supplies and demands
        System.out.println("Enter the number of suppliers: ");
        int s = in.nextInt();
        System.out.println("Enter the number of demand points: ");
        int d = in.nextInt();

        // Input supply and demand arrays
        int[] supply = new int[s];
        int[] demand = new int[d];

        System.out.println("Enter supply values: ");
        for (int i = 0; i < s; i++) {
            supply[i] = in.nextInt();
        }

        System.out.println("Enter demand values: ");
        for (int i = 0; i < d; i++) {
            demand[i] = in.nextInt();
        }

        // Input cost matrix
        int[][] cost = new int[s][d];
        int[][] allocation = new int[s][d];

        System.out.println("Enter cost values: ");
        for (int i = 0; i < s; i++) {
            for (int j = 0; j < d; j++) {
                cost[i][j] = in.nextInt();
                allocation[i][j] = 0;
            }
        }

        // North-West Corner Method
        for (int i = 0; i < s; i++) {
            for (int j = 0; j < d; j++) {
                int quantity = Math.min(supply[i], demand[j]);
                allocation[i][j] = quantity;
                supply[i] -= quantity;
                demand[j] -= quantity;
            }
        }

        // Calculate total cost
        int totalCost = 0;
        for (int i = 0; i < s; i++) {
            for (int j = 0; j < d; j++) {
                totalCost += allocation[i][j] * cost[i][j];
            }
        }

        // Output the total cost
        System.out.println("Total Cost: " + totalCost);
    }
}
