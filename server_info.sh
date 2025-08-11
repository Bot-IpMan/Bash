#!/bin/bash

# Скрипт для відображення можливостей сервера, підтримуваних технологій та ресурсів Linux системи

echo "========================================"
echo "  Інформація про сервер та ресурси"
echo "========================================"





# 1. Інформація про CPU
echo "\n--- Інформація про CPU ---"
cat /proc/cpuinfo | grep 'model name' | uniq
cat /proc/cpuinfo | grep 'cpu cores' | uniq
cat /proc/cpuinfo | grep 'processor' | wc -l




# 2. Інформація про RAM
echo "\n--- Інформація про RAM ---"
free -h




# 3. Інформація про дисковий простір
echo "\n--- Інформація про дисковий простір ---"
df -h




# 4. Інформація про мережеві інтерфейси
echo "\n--- Інформація про мережеві інтерфейси ---"
ip -brief a




# 5. Інформація про операційну систему
echo "\n--- Інформація про операційну систему ---"
lsb_release -a 2>/dev/null || cat /etc/os-release
uname -a




# 6. Інформація про встановлене програмне забезпечення (приклад)
echo "\n--- Встановлене програмне забезпечення (вибірково) ---"

# Перевірка наявності веб-серверів
command -v apache2 >/dev/null && echo "Apache2: Встановлено"
command -v nginx >/dev/null && echo "Nginx: Встановлено"

# Перевірка наявності баз даних
command -v mysql >/dev/null && echo "MySQL/MariaDB: Встановлено"
command -v psql >/dev/null && echo "PostgreSQL: Встановлено"

# Перевірка наявності мов програмування
command -v php >/dev/null && echo "PHP: Встановлено ($(php -v | head -n 1))"
command -v python3 >/dev/null && echo "Python3: Встановлено ($(python3 -V))"
command -v node >/dev/null && echo "Node.js: Встановлено ($(node -v))"
command -v ruby >/dev/null && echo "Ruby: Встановлено ($(ruby -v | head -n 1))"
command -v go >/dev/null && echo "Go: Встановлено ($(go version))"
command -v java >/dev/null && echo "Java: Встановлено ($(java -version 2>&1 | head -n 1))"

# Додайте інші перевірки за потребою




# 7. Поточне використання ресурсів
echo "\n--- Поточне використання ресурсів ---"

echo "\nВикористання CPU (останні 1, 5, 15 хвилин):"
uptime | awk -F'load average:' '{ print $2 }'

echo "\nВикористання пам'яті (MB):"
free -m | grep Mem | awk '{print "Всього: " $2 "MB, Використано: " $3 "MB, Вільно: " $4 "MB"}'

echo "\nВикористання диска (коренева файлова система):"
df -h / | awk 'NR==2 {print "Розмір: " $2 ", Використано: " $3 ", Доступно: " $4 ", Використання: " $5}'

echo "\nТоп-5 процесів за використанням CPU:"
ps aux --sort=-%cpu | head -n 6

echo "\nТоп-5 процесів за використанням пам'яті:"
ps aux --sort=-%mem | head -n 6





echo "\n========================================"
echo "  Звіт завершено"
echo "========================================"


