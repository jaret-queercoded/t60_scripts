#!/bin/sh
BATT_INFO=`acpi`
if [[ "$BATT_INFO" == *"Discharging"* ]]; then
    PERCENT=`echo $BATT_INFO | cut -d ' ' -f4 `
    PERCENT=${PERCENT%?}
    TIME=`echo $BATT_INFO | cut -d ' ' -f5 `
    echo $PERCENT:${TIME%:*}
else
    PERCENT=`echo $BATT_INFO | cut -d ' ' -f4`
    PERCENT=${PERCENT%?}
    TIME=`echo $BATT_INFO | cut -d ' ' -f5 `
    if [[ $TIME != "" ]];then
        echo +$PERCENT:${TIME%:*}
    else
        echo +$PERCENT
    fi
fi
