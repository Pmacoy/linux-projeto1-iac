#!/bin/bash

echo "Criando Diretorios"

mkdir /adm 
mkdir /publico 
mkdir /ven 
mkdir /sec

echo "Diretorios Criados:"
ls -lha / | grep adm && ls -lha / | grep publico && ls -lha / | grep ven && ls -lha / | grep sec

echo "Criando User Groups"

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando Usuários e adicionando aos Grupos"

useradd carlos -c "Carlos Amado" -m -s /bin/bash -p $(openssl passwd -crypt passwd123)  -G GRP_ADM
useradd maria -c "Maria dos Anjos" -m -s /bin/bash -p $(openssl passwd -crypt passwd123) -G GRP_ADM
useradd joao -c "João Souza" -m -s /bin/bash -p $(openssl passwd -crypt passwd123) -G GRP_ADM
 
useradd debora -c "Débora Mattos" -m -s /bin/bash -p $(openssl passwd -crypt passwd123) -G GRP_VEN
useradd sebastiana -c "Sebastiana Silva" -m -s /bin/bash -p $(openssl passwd -crypt passwd123) -G GRP_VEN
useradd roberto -c "Roberto Duarte" -m -s /bin/bash -p $(openssl passwd -crypt passwd123) -G GRP_VEN

useradd josefina -c "Josefina Santos" -m -s /bin/bash -p $(openssl passwd -crypt passwd123) -G GRP_SEC
useradd amanda -c "Amanda Montes" -m -s /bin/bash -p $(openssl passwd -crypt passwd123) -G GRP_SEC
useradd rogerio -c "Rogério Pinho" -m -s /bin/bash -p $(openssl passwd -crypt passwd123) -G GRP_SEC

echo "Permissões aos Diretórios"

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Diretorios Criados:"
ls -lha / | grep adm && ls -lha / | grep publico && ls -lha / | grep ven && ls -lha / | grep sec

echo "Users Criados:"
cat /etc/passwd | grep carlos && cat /etc/passwd | grep maria && cat /etc/passwd | grep joao && cat /etc/passwd | grep debora && cat /etc/passwd | grep sebastiana && cat /etc/passwd | grep roberto && cat /etc/passwd | grep josefina && cat /etc/passwd | grep amanda && cat /etc/passwd | grep rogerio 

echo "Groups Criados:"
cat /etc/group | grep GRP_ADM && cat /etc/group  | grep GRP_VEN && cat /etc/group | grep GRP_SEC

echo "FIM"
