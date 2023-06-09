class terminal: SmartHome {
    func addYourDevices() {
         let livingRoomTV = TV(name: "Телевизор в зале")
         let livingRoomThermostat = Thermostat(name: "Термостат в зале")
         let livingRoomCurtain = Curtain(name: "Шторы в зале")
         let livingRoomLight = Light(name: "Лампочка в зале")
         let livingRoomDoor = Door(name: "Дверь в зале")
         
         let kitchenCurtain = Curtain(name: "Шторы на кухне")
         let kitchenLight = Light(name: "Лампочка на кухне")
         let kitchenDoor = Door(name: "Дверь на кухне")
         
         let bedroomCurtain = Curtain(name: "Шторы в спальне")
         let bedroomLight = Light(name: "Лампочка в спальне")
         let bedroomDoor = Door(name: "Дверь в спальне")
         let bedroomTV = TV(name: "Телевизор в спальне")
         
         let bathroomCurtain = Curtain(name: "Шторы в ванной")
         let bathroomLight = Light(name: "Лампочка в ванной")
         let bathroomDoor = Door(name: "Дверь в ванную")
         
         addDevice(livingRoomTV)
         addDevice(livingRoomThermostat)
         addDevice(livingRoomCurtain)
         addDevice(livingRoomLight)
         addDevice(livingRoomDoor)
         
         addDevice(kitchenCurtain)
         addDevice(kitchenLight)
         addDevice(kitchenDoor)
         
         addDevice(bedroomCurtain)
         addDevice(bedroomLight)
         addDevice(bedroomDoor)
         addDevice(bedroomTV)
         
         addDevice(bathroomCurtain)
         addDevice(bathroomLight)
         addDevice(bathroomDoor)
     }
    func startProgramm() {
        print("Добро пожаловать в умный дом!")
        print("Доступные команды:")
        print("- 'статус' для получения статуса устройства")
        print("- 'все статусы' для получения статуса всех устройств")
        print("- 'включить' для включения устройства")
        print("- 'выключить' для выключения устройства")
        print("- 'открыть' для открытия дверей и штор")
        print("- 'закрыть' для закрытия дверей или штор")
        print("- 'заблокировать' для блокировки дверей")
        print("- 'разблокировать' для разблокировки дверей")
        print("- 'закрыть' для закрытия дверей или штор")
        print("- 'увеличить яркость' для увеличения яркости устройства")
        print("- 'уменьшить яркость' для уменьшения яркости устройства")
        print("- 'sleep': активировать режим Sleep (все двери блокируются и температура в комнате устанавливается на 25 градусах)")
        print("- 'safe': активировать режим Safe (все двери закрываются и блокируются)")
        print("- 'romantic': активировать режим Romantic (включается телевизор, устанавливается 4 канал (музыка), громкость устанавливается на 10, шторы открываются, температура термостата устанавливается на 25)")
        addYourDevices()
        while true {
            print("Введите команду:")
            guard let userInput = readLine() else {
                continue
            }
            let input = userInput.lowercased()
            if input == "статус" {
                print("Введите название устройства:")
                guard let deviceName = readLine() else {
                    continue
                }
                printDeviceStatus(deviceName: deviceName)
            } else if input == "все статусы" {
                printAllDeviceStatus()
            } else if input == "включить" {
                print("Введите название устройства:")
                guard let deviceName = readLine() else {
                    continue
                }
                turnOnDevice(deviceName: deviceName)
            } else if input == "выключить" {
                print("Введите название устройства:")
                guard let deviceName = readLine() else {
                    continue
                }
                turnOffDevice(deviceName: deviceName)
            } else if input == "увеличить яркость" {
                print("Введите название устройства:")
                guard let deviceName = readLine() else {
                    continue
                }
                increaseBrightness(deviceName: deviceName)
            } else if input == "уменьшить яркость" {
                print("Введите название устройства:")
                guard let deviceName = readLine() else {
                    continue
                }
                decreaseBrightness(deviceName: deviceName)
            }
            else if input == "открыть" {
                print("Введите название устройства:")
                guard let deviceName = readLine() else {
                    continue
                }
                openDevice(deviceName: deviceName)
            }
            else if input == "закрыть" {
                print("Введите название устройства:")
                guard let deviceName = readLine() else {
                    continue
                }
                closeDevice(deviceName: deviceName)
            }
            else if input == "заблокировать" {
                            print("Введите название устройства:")
                            guard let deviceName = readLine() else {
                                continue
                            }
                            lockDevice(deviceName: deviceName)
           } else if input == "разблокировать" {
                            print("Введите название устройства:")
                            guard let deviceName = readLine() else {
                                continue
                            }
                            unlockDevice(deviceName: deviceName)
                        }
            else if input == "sleep" {
                setSmartMode(.sleep)
                print("Режим Sleep активирован.")
            }
            else if input == "safe" {
                setSmartMode(.safe)
                print("Режим Safe активирован.")
            }
            else if input == "romantic" {
                setSmartMode(.romantic)
                print("Режим Romantic активирован.")
            }
            else {
                print("Недопустимая команда. Попробуйте еще раз.")
            }
        }
    }
}
