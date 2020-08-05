import Foundation

protocol SettingProvider {
    
    func loadSetting(completion: @escaping (Bool) -> Void)
    
}

final class SettingProviderImpl: SettingProvider {
    
    private let settingService: SettingService
    private var platforms: [Platform]?
    private var patitions: [Patition]?
    
    init(settingService: SettingService) {
        self.settingService = settingService
    }
    
    func loadSetting(completion: @escaping (Bool) -> Void) {
        print("=loadSetting")
        let queryGlobal = DispatchGroup()
        DispatchQueue.global().async(group: queryGlobal, qos: .userInteractive) {
            //async(group: queryGlobal) {
            self.platforms = self.settingService.loadPlatforms()
        }
        DispatchQueue.global().async(group: queryGlobal) {
            sleep(2)
            self.patitions = self.settingService.loadPatitions()
            sleep(2)
        }
        queryGlobal.notify(queue: DispatchQueue.main) {
            print("=loadSetting complete")
            completion(true)
        }
    }

}
