
for cluster in ocp1 ocp3 ocp4 ocp5 rhacm
do
  echo "Getting users for $cluster"
  oc login -u admin -p $PSWD --server=https://api.$cluster.stormshift.coe.muc.redhat.com:6443
  oc get users | grep @redhat.com |  cut -d ' ' -f1  >>tmp.txt
done
sort -u tmp.txt >users-$(date +%F).txt
rm tmp.txt
