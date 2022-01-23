#! /bin/bash
## author : WildboarG
## This pushplus script
function wcurl(){
  token="d74df72e2dc246a186763f6798ec886e"
  date=`date`
  curl -X POST --header 'Content-Type: application/json' \
          -d "{\"token\":\"$token\", 
              \"title\":\"$tt\",
	      \"template\:$template",
              \"content\":\"$msg \n  ---$date\"}" \
           "http://pushplus.hxtrip.com/send"
}
while getopts "f:m:t:h" opt;do
	case $opt in
		f)
				msg=$(cat $OPTARG)
				echo "[M]msg:"$OPTARG
				wcurl
		;;
		t)
				tt=$OPTARG
				echo "[T]title: "$tt
		;;
		p)
				template=$OPTARG
				echo "[P]type:"$template
		m)
				msg=$OPTARG
				echo "[M]msg: "$msg
				wcurl
		;;
		h)
			echo "[H]push:  
-t : 
   add one title for your send message
-m :
   you can add message push to your wechat
-f :
   send file content to your wechat
-p :
   add you send file type,
-h :
   no help"
   		;;
		\?)		
			echo "[E]:ERROR USER"
		;;
	esac
done

