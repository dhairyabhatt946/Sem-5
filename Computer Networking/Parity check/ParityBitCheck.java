import java.util.Scanner;

public class ParityBitCheck {
    public static int countOnes(String data) {
        int count = 0;
        for (char bit : data.toCharArray()) {
            if (bit == '1') {
                count++;
            }
        }
        return count;
    }

    public static char calculateParityBit(String data, String parityType) {
        int onesCount = countOnes(data);

        if (parityType.equalsIgnoreCase("even")) {
            return (onesCount % 2 == 0) ? '0' : '1';
        } else if (parityType.equalsIgnoreCase("odd")) {
            return (onesCount % 2 == 0) ? '1' : '0';
        } else {
            throw new IllegalArgumentException("Invalid parity type. Use 'even' or 'odd'.");
        }
    }

    public static boolean checkParity(String dataWithParity, String parityType) {
        int onesCount = countOnes(dataWithParity);
        if (parityType.equalsIgnoreCase("even")) {
            return onesCount % 2 == 0;
        } else if (parityType.equalsIgnoreCase("odd")) {
            return onesCount % 2 != 0;
        }
        return false;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter binary data (e.g., 1011001): ");
        String data = scanner.nextLine();

        if (!data.matches("[01]+")) {
            System.out.println("Invalid input! Only binary digits (0 and 1) are allowed.");
            return;
        }

        System.out.print("Choose parity type (even/odd): ");
        String parityType = scanner.nextLine();

        if (!parityType.equalsIgnoreCase("even") && !parityType.equalsIgnoreCase("odd")) {
            System.out.println("Invalid parity type! Please choose 'even' or 'odd'.");
            return;
        }

        char parityBit = calculateParityBit(data, parityType);
        String dataWithParity = data + parityBit;

        System.out.println("Data to be transmitted (with parity bit): " + dataWithParity);

        System.out.print("Enter received data (including parity bit): ");
        String receivedData = scanner.nextLine();

        if (!receivedData.matches("[01]+") || receivedData.length() != dataWithParity.length()) {
            System.out.println("Received data is invalid or of incorrect length.");
            return;
        }

        boolean isValid = checkParity(receivedData, parityType);

        if (isValid) {
            System.out.println("No error detected in received data.");
        } else {
            System.out.println("Error detected in received data.");
        }

        scanner.close();
    }
}
