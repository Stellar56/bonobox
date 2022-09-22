#!/bin/bash

# langues
OPTS=$("$CMDGETOPT" -o vhns: --long fr,en,de,ru,es,pt,ptbr -n 'parse-options' -- "$@")
eval set -- "$OPTS"
while true; do
	case "$1" in
			--fr) GENLANG="fr"; break ;;
			--en) GENLANG="en"; break ;;
			--de) GENLANG="de"; break ;;
			--ru) GENLANG="ru"; break ;;
			--es) GENLANG="es"; break ;;
			--pt) GENLANG="pt"; break ;;
			--ptbr) GENLANG="ptbr"; break ;;
		*|\?)
			BASELANG="${LANG:0:2}"
			# detection auto
			if [ "$BASELANG" = "fr" ]; then GENLANG="fr"
			elif [ "$BASELANG" = "en" ]; then GENLANG="en"
			elif [ "$BASELANG" = "de" ]; then GENLANG="de"
			elif [ "$BASELANG" = "ru" ]; then GENLANG="ru"
			elif [ "$BASELANG" = "es" ]; then GENLANG="es"
			elif [ "$BASELANG" = "pt" ]; then GENLANG="pt"
			elif [ "$BASELANG" = "pt_BR" ]; then GENLANG="ptbr"
			else
				GENLANG="fr"
			fi
			break ;;
	esac
done

# fix langue shell root
"$CMDECHO" "export LANG=$LANG" >> /root/.bashrc
