#!/usr/bin/env bash

#set +x
#set -Eeuo pipefail

LINK="raw.githubusercontent.com/GitKitNet/add/main/ToolKit/cptoolkit.sh";
#bash -c "$(wget -O - $LINK || curl -fsSL $LINK)";
#bash -c "$(curl -L -fSs $LINK)"
#bash <(wget -O - $LINK)



# - - - - - - - - - - - - - - - - -
#            COLOR
# - - - - - - - - - - - - - - - - -
#BLACK='\033[1;40m';           # Black
#RED='\033[7;31m';             # Red
#GREEN='\033[7;32m';           # Green
#YELLOW='\033[1;33m';          # Yellow
#BLUE='\033[7;34m';            # Blue
#PURPLE='\033[1;35m';          # Purple
#CYAN='\033[4;36m';            # Cyan

BLACK='\033[0;40m';           # Black
RED='\033[0;31m'              # Red
GREEN='\033[0;32m'            # Green
YELLOW='\033[0;33m'           # Yellow
BLUE='\033[0;34m'             # Blue
PURPLE='\033[0;35m'           # Purple
CYAN='\033[0;36m'             # Cyan
NC='\033[0m'                  # No Color

Black="`tput setaf 0`"        # Black
Red="`tput setaf 1`"          # Red
Green="`tput setaf 2`"        # Green
Yellow="`tput setaf 3`"       # Yellow
Blue="`tput setaf 4`"         # Blue
Cyan="`tput setaf 5`"         # Cyan
Purple="`tput setaf 6`"       # Purple
White="`tput setaf 7`"        # White

BGBlack="`tput setab 0`"      # Black
BGRed="`tput setab 1`"        # Red
BGGreen="`tput setab 2`"      # Green
BGYellow="`tput setab 3`"     # Yellow
BGBlue="`tput setab 4`"       # Blue
BGCyan="`tput setab 5`"       # Cyan
BGPurple="`tput setab 6`"     # Purple
BGWhite="`tput setab 7`"      # White
RC="`tput sgr0`"              # Reset Color

TEXTCOLOR=$White;
BGCOLOR=$BLACK;




# - - - - - - - - - - - - - - - - - - - - - -
#       ASK START
# - - - - - - - - - - - - - - - - - - - - - -
function THIS() { 
  clear;
  while true; do 
  echo -en "\t${Yellow}Do you want Run This script [y/N] .?${RC} "; 
  read -e syn; 
    case $syn in 
      [Yy]* ) clear; echo -e "\n\t${GREEN}Starting NOW..${NC}"; sleep 3 && break ;; 
      [Nn]* ) exit 0;;
    esac; 
  done;
};

# = = = = = = = = = = = = = = = = = =
#      CHECK IF USER IS ROOT
# = = = = = = = = = = = = = = = = = =
function CheckIFroot() {
  if [ "$(id -u)" != "0" ]; then
  while true; do 
  clear && \
  echo -en "
${Blue}# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =           
${RED} ERROR:\t You must be ${CYAN} [root user] ${RED} to install the software. 
${RED}\t Use 'sudo su - root' to login as root!                               
${Blue}\n# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
${GREEN}\n\tDo you want Run ${CYAN}as root ${GREEN}script [ y/N ] ..? ${RC}";
  read -e syn; 
  case $syn in 
    [Yy]* ) sleep 3; 
    sudo su; 
    break ;; 
    [Nn]* ) exit 1 ;;
  esac; 
  done;
elif [ "$(id -u)" == "0" ]; then
  echo -e "\n\t${YELLOW}Checking ROOT ${GREEN}IS - OK! \n ${RC}";
  sleep 5;
  fi;
}; 


#  MAKE SURE SUDO AVAILABLE
[ -z "$(command -v sudo)" ] && { apt-get -y install sudo >>/dev/null 2>&1; }
[ -z "$(command -v curl)" ] && { apt-get -y install curl >>/dev/null 2>&1; }





# = = = = = = = = = = = = = = = = = =
#      VARIABLE & function
# = = = = = = = = = = = = = = = = = =

function title() { clear; echo "${title} ${TKEY}"; }
function pause() { read -p "Press [Enter] key to continue..." fackEnterKey; }
function wait() { read -p "Press [ANY] key to continue..? " -s -n 1; }


# # # # # # # # # # # # # # # # # # #
#      function STARTScript() {
# # # # # # # # # # # # # # # # # # #



# =============================
#       END MAIN SCRIPT
# =============================



# =============================
function MAIN() {

#==============================
#           MENU
#==============================
function MENU_MAIN() {
    clear;
    echo -e -n "\n\t${GREEN}${BGBlack}==== MAIN MENU ====${NC}\n"
    echo -e -n "${Yellow}
\t1. Create SSH key     ${NC} ${Purple}
\t2. Install LEMP       ${NC} ${BLUE}
\t3. Install LAMP       ${NC} ${Yellow}
\t4. Control Panel      ${NC} ${MAGENTO}
\t5. Free               ${NC} ${RED}
\t6. Free               ${NC} ${RED}
\t7. Free               ${NC} ${MAGENTO}
\t8. FTP & Ather        ${NC} ${RED}

\n\tq. Quit...          ${NC}";

}

#   Menu SSH
function MenuSSH() {
title="Generate Key SSH";
echo -e -n "\n\t${GREEN}SSH KeyGen:${NC}\n"
echo -e -n "
\t1. $title ${GREEN} ED25519       ${NC}
\t2. $title ${Yellow} RSA          ${NC}
\t3. $title ${CYAN}2 RSA [PEM]     ${NC}
\t4. $title ${BLUE} DSA            ${NC}
\t5. $title ${Purple} ECDSA        ${NC}
\t6. $title ${RED} EdDSA - [OFF]   ${NC}${RED}
\n\t0. Back ${NC}\n";

}

##   
function MenuLEMP() {
echo -e -n "\n\t ${GREEN}LEMP installation & Settings:${NC} \n"
echo -e -n "\t1. Install Mysql-Server ${CYAN}With WordPress LAND ${NC}"
echo -e -n "\t2. Add one more WordPress LAND ${CYAN}With New user ${NC}"
echo -e -n "\t3. PreInstall ${CYAN} Ngx Php7.4 Certbot ${NC}"
echo -e -n "\t4. Install WordPress ${CYAN} With All Services Cloudflare ${NC}"
echo -e -n "\t5. Instal WordPress ${CYAN} With All Services Certbot ${NC} ${RED}"
echo -e -n "\n\tq/0. Back ${NC}\n";
}

##   MENU 3: LAMP
function MenuLAMP() {
    echo -e "\n\t ${GREEN}LAMP installation & Settings:${NC} \n"
    echo -e -n "${Yellow}";
    echo -e -n "\t1. Install LAMP & WordPress";
    echo -e -n "\t${BLUE}(Apache, php7.4, phpMyAdmin) ${RED} \n";
    echo -e -n "\n\tq/0. Back ${NC}\n";
    echo -e -n "";
}; 
#MenuLAMP

##   MENU 4: Web Control Panel
function Menu_CPanel() {
    echo -e "\n\t ${GREEN}Menu 4: CONTROL PANEL ${Yellow} \n";
    echo -e "\t1. Install OwnCloud       ${PURPLE} ";
    echo -e "\t2. Install Vesta          ${BLUE} ";
    echo -e "\t3. FREE                   ${PURPLE} ";
    echo -e "\t4. FREE                   ${RED} ";
    echo -e "\n\tq/0. Back               ${NC}\n ";
};

##   MENU 8: Modules & Components
function MenuMODandCOMPON() {
    echo -e "\n\t ${GREEN}Menu 8: Modules & Components ${Yellow} \n";
    echo -e "\t1. Install Pure-FTP       ${PURPLE} ";
    echo -e "\t2. FREE                            ${PURPLE} ";
    echo -e "\t3. FREE                            ${PURPLE} ";
    echo -e "\t4. FREE                            ${RED} ";
    echo -e "\n\t0. Back                          ${NC}\n ";
};

#--------------------------
while :
do
  showBanner
  MENU_MAIN
  echo -n -e "\n\tSelection: "
  read -n1 opt
  a=true;
  case $opt in

# 1 SubMenu ----------------------------
     1) echo -e "==== Create SSH key ===="
     while :
     do
       showBanner
       MenuSSH
       echo -n -e "\n\tSelection: "
       read -n1 opt;
       case $opt in
         1) TKEY="ed25519" && MKEY="" && OnRUN ;;
         2) TKEY="rsa" && MKEY="" && OnRUN ;;
         3) TKEY="rsa" && MKEY="PEM" && OnRUN ;;
         4) TKEY="dsa" && MKEY="" && OnRUN ;;
         5) TKEY="ecdsa" && MKEY="" && OnRUN ;;
         6) TKEY="eddsa" && MKEY="" && OffRUN ;;
         /q | q | 0) break ;;
          *) ;;
        esac
       done
       ;;

# 2 ----------------------------
       2) echo -e "Install LEMP: "
       while :
       do
          showBanner
          MenuLEMP
          echo -n -e "\n\tSelection: "
          read -n1 opt;
          case $opt in
            1) echo -e "FREE $opt"  ;;
            2) echo -e "FREE $opt"  ;;
            3) echo -e "FREE $opt"  ;;
            4) echo -e "FREE $opt"  ;;
            5) echo -e "FREE $opt"  ;;
            /q | q | 0) break ;;
            *) ;;
          esac
        done
        ;;

# 3 ----------------------------
                3) echo -e "# submenu: MEMU 3"
                while :
                do
                        showBanner
                        MenuLAMP
                        echo -n -e "\n\tSelection: "
                        read -n1 opt;
                        case $opt in
                                1) echo -e "FREE $opt"  ;;
                                2) echo -e "FREE $opt"  ;;
                                3) echo -e "FREE $opt"  ;;
                                /q | q | 0) break ;;
                                *) ;;
                        esac
                done
                ;;

# 4 ----------------------------
                4) echo -e "Control Panell: "
                while :
                do
                        showBanner
                        Menu_CPanel
                        echo -n -e "\n\tSelection: "
                        read -n1 opt;
                        case $opt in
                                1) echo -e "FREE $opt"  ;;
                                2) echo -e "FREE $opt"  ;;
                                3) echo -e "FREE $opt"  ;;
                                4) echo -e "FREE $opt"  ;;
                                5) echo -e "FREE $opt"  ;;
                                /q | q | 0) break ;;
                                *) ;;
                        esac
                done
                ;;

# 8 ----------------------------
                8) echo -e "Modules & Components: "
                while :
                do
                        showBanner
                        MenuMODandCOMPON
                        echo -n -e "\n\tSelection: "
                        read -n1 opt;
                        case $opt in
                                1) echo -e "FREE $opt" ;;
                                2) echo -e "FREE $opt" ;;
                                3) echo -e "FREE $opt"  ;;
                                4) echo -e "FREE $opt"  ;;
                                5) echo -e "FREE $opt"  ;;
                                /q | q | 0) break ;;
                                *) ;;
                        esac
                done
                ;;

# END ----------------------------

       /q | q | 0) echo; break ;;
       *) ;;
    esac
  done

# ----------- END MENU -----------

  echo "Quit..." && sleep 3;
  clear;
  cleanup;
}; 

THIS
MAIN

# # # # # # # # # # # # # # # # # # # # # # #

# exit 1
