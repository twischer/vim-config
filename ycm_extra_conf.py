import glob

includes = [
    ]

for path in {"./", "../", "../../", "../../../"}:
    for d in ["", "inc", "include", "lib", "build"]:
        includes.append(path + d)
    includes.extend( glob.glob(path + d + "/*/") )


for sub in ["cores/esp8266", "tools/sdk/include", "libraries/ArduinoOTA", "libraries/ESP8266WiFi/src"]:
    includes.append("/home/timo/.platformio/packages/framework-arduinoespressif8266/" + sub)


flags = [
#    '-DESP8266',
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

