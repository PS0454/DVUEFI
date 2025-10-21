#!/bin/sh

# Ð¡Ð¾Ð·Ð´Ð°ÐµÑ‚ Ð¿Ð¾Ð´ÐºÐ°Ñ‚Ð°Ð»Ð¾Ð³ OtherVersion, ÐºÐ¾Ð¿Ð¸Ñ€ÑƒÐµÑ‚ Ð² Ð½ÐµÐ³Ð¾ Ð´Ð°Ð½Ð½Ñ‹Ðµ Ð´Ð»Ñ Ñ‚ÐµÑÑ‚Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ñ
# ÑÐ¾Ð²Ð¼ÐµÑÑ‚Ð¸Ð¼Ð¾ÑÑ‚Ð¸ Ñ Ð´Ñ€ÑƒÐ³Ð¸Ð¼Ð¸ Ð²ÐµÑ€ÑÐ¸ÑÐ¼Ð¸.
# Ð”Ð°Ð½Ð½Ñ‹Ðµ Ð±ÐµÑ€ÑƒÑ‚ÑÑ Ð¸Ð· Ñ€ÐµÐ·ÑƒÐ»ÑŒÑ‚Ð°Ñ‚Ð¾Ð² Ð¿Ñ€Ð¾Ð³Ð¾Ð½Ð° Ñ‚ÐµÑÑ‚Ð¾Ð² Ð´Ð»Ñ Ð¾Ñ‚ÐºÑ€Ñ‹Ñ‚Ð¾Ð³Ð¾ ÑÐ½Ð¶Ð¸Ð½Ð° 
# (Ð¿Ð¾ÑÐºÐ¾Ð»ÑŒÐºÑƒ Ð¸Ð¼ÐµÐ½Ð½Ð¾ Ð¾Ð½ Ð³Ð°Ñ€Ð°Ð½Ñ‚Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð½Ð¾ ÑƒÐ¼ÐµÐµÑ‚ Ð²ÑÐµ Ð½ÑƒÐ¶Ð½Ñ‹Ðµ Ð°Ð»Ð³Ð¾Ñ€Ð¸Ñ‚Ð¼Ñ‹, 
# Ð²ÐºÐ»ÑŽÑ‡Ð°Ñ ÑƒÑÑ‚Ð°Ñ€ÐµÐ²ÑˆÐ¸Ðµ).

TESTDIR=`hostname`-gost
SAVEDIR=OtherVersion
if ! [ -d ${TESTDIR} ]; then
	echo $TESTDIR does not exist.
	exit 1
fi 
[ -d ${SAVEDIR} ] && rm -fr ${SAVEDIR}
mkdir ${SAVEDIR}
cd ${TESTDIR}
cp -rp enc.enc enc.dat ../$SAVEDIR
cp -rp smimeCA test.crl test_crl_cacert.pem ../$SAVEDIR
cp -rp U_smime_* sign_*.msg ../$SAVEDIR
cp -rp cmsCA U_cms_* cms_sign_*.msg ../$SAVEDIR
cp -rp U_pkcs12_* ../$SAVEDIR
cp -rp encrypt.dat U_enc_* enc_*.msg ../$SAVEDIR
cp -rp U_cms_enc_* cms_enc_*.msg ../$SAVEDIR

