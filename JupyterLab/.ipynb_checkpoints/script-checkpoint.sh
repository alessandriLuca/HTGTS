mkdir /home/utente/Documenti
cd /sharedFolder/
mkdir ./../home/utente/Libri
mkdir ./../home/utente/Libri/saggistica
touch /sharedFolder/file1.txt
touch /sharedFolder/file2.txt
touch /sharedFolder/romanzo.txt
touch /sharedFolder/saggio1.txt
mv /sharedFolder/file*.txt /home/utente/Documenti
mv /sharedFolder/romanzo.txt /home/utente/Libri
mv /sharedFolder/saggio1.txt /home/utente/Libri/saggistica
chmod -R 700 /home/utente/Documenti
ls /home/utente