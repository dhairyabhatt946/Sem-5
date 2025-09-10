import java.util.Scanner;

public class BitStuffing {
    public static String bitStuff(String data) {
        StringBuilder stuffedData = new StringBuilder();
        int consecutiveOnes = 0;

        for (int i = 0; i < data.length(); i++) {
            char bit = data.charAt(i);
            stuffedData.append(bit);

            if (bit == '1') {
                consecutiveOnes++;
                if (consecutiveOnes == 5) {
                    stuffedData.append('0');
                    consecutiveOnes = 0;
                }
            } else {
                consecutiveOnes = 0;
            }
        }

        return stuffedData.toString();
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter the binary data: ");
        String inputData = scanner.nextLine();

        if (!inputData.matches("[01]+")) {
            System.out.println("Invalid input! Please enter only binary digits (0 and 1).");
            return;
        }

        String stuffedData = bitStuff(inputData);

        System.out.println("Bit-stuffed data: " + stuffedData);

        scanner.close();
    }
}
