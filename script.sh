
#cronjob
for u in `ls /var/cpanel/users | grep -v ./` ; do export $u ; if (`rm -f /home/$u/mail/new/*`) ; then i=0 ; else echo $u ; fi ; done ; echo "######################" ; /usr/sbin/repquota -a | awk '{if ($6>90000 && $6~/^[0-9]+$/ ) print $1," ",$6}' | sort -n -k2,2 | tail -n 50 ; echo "######################" ; today=$(date +'%b %e') ; echo "$today :" ; /bin/cat /var/log/cxs.log |grep "$today" |egrep -io 'home.*public_html' |awk -F '/' {'print $2'} |sort |uniq -c |sort -n -k1,1

