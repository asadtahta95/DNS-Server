DNS Checker Script

A simple Bash script to check the response time of various DNS servers using ping. It reads a list of DNS providers from a file and calculates the average response time over 3 ping attempts.
🚀 Features


    Supports multiple DNS providers from a text file.
    Displays results in a formatted table with provider name, type (Primary/Secondary), IP address, and average response time.
    Uses color coding:
        ✅ Green for successful responses.
        ❌ Red for timeouts.
    Debug mode to help troubleshoot any issues.


📜 Requirements

    Bash (bash shell)
    ping command
    tput (for colored output)


🔧 Installation

Clone the repository and navigate into the directory:

git clone https://github.com/asadtahta95/DNS-Server.git
cd dns-checker
chmod +x dns-checker.sh


📄 File Structure

.
├── dns-checker.sh   # The main script
└── dnstest.txt      # List of DNS servers to test


📝 Configuring the DNS List

Modify dnstest.txt to include your own DNS servers. Use the following format:

Provider : Type : IP Address

Google : Primary : 8.8.8.8

Google : Secondary : 8.8.4.4

Cloudflare : Primary : 1.1.1.1

Cloudflare : Secondary : 1.0.0.1

Quad9 : Primary : 9.9.9.9

Quad9 : Secondary : 149.112.112.112


▶️ Running the Script

Execute the script using:

./dns-checker.sh

or

bash dns-checker.sh

🖥️ Example Output

Provider             Type         IP Address       AVG TIME

---------------------------------------------------------------

Google               Primary      8.8.8.8         12.34 ms

Google               Secondary    8.8.4.4         15.67 ms

Cloudflare           Primary      1.1.1.1         8.90 ms

Cloudflare           Secondary    1.0.0.1         TIMEOUT

Quad9                Primary      9.9.9.9         20.11 ms

Quad9                Secondary    149.112.112.112 18.22 ms


🛠️ Troubleshooting
No Output or Incorrect Formatting?

    Ensure dnstest.txt is formatted correctly.
    Run this command to check for hidden spaces or incorrect characters:

cat -A dnstest.txt

Remove trailing spaces:

    sed -i 's/[[:space:]]*$//' dnstest.txt

Getting "Permission Denied"?

    Run:

    chmod +x dns-checker.sh

📜 License

This project is licensed under the MIT License.
❤️ Contributions

Feel free to fork this repository, submit pull requests, or report issues!
