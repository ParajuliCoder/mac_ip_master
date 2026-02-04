# MAC & IP Changer (Linux)

A lightweight Bash script to **automatically rotate MAC and IP addresses** on a Linux network interface. This tool is useful for **testing, lab environments, privacy research, and network experimentation**.

> ⚠️ **Disclaimer:** This project is intended for **educational and authorized use only**. Do not use it on networks you do not own or have explicit permission to test.

---

## ✨ Features

- Randomly generates **locally administered MAC addresses**
- Assigns random IP addresses in the **192.168.x.x** private range
- Fully automated loop with configurable interval
- Uses native Linux `ip` utilities (no external dependencies)
- Simple, readable, and easy to modify

---

## 📂 Project Structure

```
mac_ip_changer.sh   # Main script
README.md           # Documentation
```

---

## 🛠 Requirements

- Linux OS (Tested on Kali Linux / Debian-based systems)
- Root privileges (`sudo`)
- `iproute2` package (installed by default on most distros)

---

## 🚀 Installation & Usage

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/ParajuliCoder/mac_ip_master.git
cd mac_ip_changer
```

### 2️⃣ Make the Script Executable

```bash
chmod +x mac_ip_changer.sh
```

### 3️⃣ Run as Root

```bash
sudo ./mac_ip_changer.sh
```

The script will continuously rotate the MAC and IP address every **2 seconds** until stopped manually (`Ctrl + C`).

---

## ⚙️ Configuration

You can modify the following variables in the script:

```bash
INTERFACE="eth0"   # Change to wlan0, ens33, etc.
sleep 2             # Rotation interval (seconds)
```

> 💡 Tip: Use `ip a` to find your correct network interface name.

---

## 🧠 How It Works

- Brings the network interface down
- Assigns a randomly generated locally administered MAC address
- Flushes existing IP addresses
- Assigns a new private IPv4 address
- Brings the interface back up
- Repeats the process in a loop

---

## 🔐 Security & Ethical Use

This tool is designed for:

- Network labs
- Cybersecurity practice
- Privacy research
- Educational demonstrations

❌ **Not recommended for:**
- Production systems
- Public or restricted networks
- Illegal or unauthorized activities

---

## 📌 Known Limitations

- Static IP assignment may not work on DHCP-controlled networks
- Frequent changes can cause connectivity loss
- Some ISPs or routers may block MAC changes

---

## 🤝 Contributing

Contributions are welcome!

- Fork the repository
- Create a feature branch
- Submit a pull request with clear documentation

---

## 👤 Author

**ParajuliCoder**  
Linkedin: https://www.linkedin.com/in/anish-parajuli-9a9333398/

---

---

⭐ If you find this project useful, consider giving it a star on GitHub!

