import glob

PROJECT='/home/wti2hi/work/es3r_latest2'
includes = [
    ]

for path in {"./", "../", "../../", "../../../"}:
    for d in ["", "inc", "include", "lib", "build", "protected"]:
        includes.append(path + d)
#    includes.extend( glob.glob(path + d + "/*/") )

# QNX build?
if False:
    #for sub in ["", "aarch64", "c++/5.4.0", "c++/5.4.0/aarch64-unknown-nto-qnx7.0.0", "c++/v1"]:
    #    includes.append(PROJECT+"/vcu/qnx/qnx-sdp/target/qnx7/usr/include/" + sub)

    includes.extend( glob.glob(PROJECT+"/vcu/qnx/bosch/qnx_interfaces/*/inc") )
    includes.extend( glob.glob(PROJECT+"/vcu/qnx/gm/prebuilts/*/include") )

    includes.append(PROJECT+"/vcu/qnx/qcom/qcom_qnx/apps/qnx_ap/AMSS/platform/qavb/qavb_lib/qavtp/inc")
    includes.append(PROJECT+"/vcu/qnx/qcom/qcom_qnx/apps/qnx_ap/AMSS/platform/utilities/qnp_include/public/amss/core")
    includes.append(PROJECT+"/vcu/qnx/bosch/pal-impl/pal-diagnostics/libpal_diagnostics/inc")
    includes.append(PROJECT+"/vcu/qnx/bosch/pal-impl/pal-diagnostics/libpal_diagnostics/inc/gm")
    includes.append(PROJECT+"/vcu/qnx/bosch/unittest/mocks/header")
else:
    includes.append("/usr/include/glib-2.0")
    includes.append("/usr/lib/x86_64-linux-gnu/glib-2.0/include")
    includes.append("/usr/include/gstreamer-1.0")

#ESP8266
#for sub in ["cores/esp8266", "tools/sdk/include", "libraries/ArduinoOTA", "libraries/ESP8266WiFi/src"]:
#    includes.append("/home/timo/.platformio/packages/framework-arduinoespressif8266/" + sub)

flags = [
#    '-DESP8266',
        '-D__LITTLEENDIAN__',
        '-D__QNXNTO__',
        '-D__aarch64__',
]

for i in includes:
    flags.append("-I" + i)

def Settings( **kwargs ):
  language = kwargs[ 'language' ]
  if language == 'cfamily':
    return {
      'flags': flags,
    }
  else:
    return {}

