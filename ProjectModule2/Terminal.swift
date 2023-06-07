class terminal: SmartHome {
    func startProgramm() {
        print("Добро пожаловать в умный дом!")
        print("Доступные команды:")
        print("- 'статус' для получения статуса устройства")
        print("- 'все статусы' для получения статуса всех устройств")
        print("- 'включить' для включения устройства")
        print("- 'выключить' для выключения устройства")
        print("- 'увеличить яркость' для увеличения яркости устройства")
        print("- 'уменьшить яркость' для уменьшения яркости устройства")
        print("- 'sleep': активировать режим Sleep")
        print("- 'safe': активировать режим Safe")
        print("- 'romantic': активировать режим Romantic")
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
            else if input == "sleep" {
                smartHome.setSmartMode(.sleep)
                print("Режим Sleep активирован.")
            }
            else if input == "safe" {
                smartHome.setSmartMode(.safe)
                print("Режим Safe активирован.")
            }
            else if input == "romantic" {
                smartHome.setSmartMode(.romantic)
                print("Режим Romantic активирован.")
            }
            else {
                print("Недопустимая команда. Попробуйте еще раз.")
            }
        }
    }
}
