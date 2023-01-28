package hotel.app.impl

import grails.gorm.transactions.Transactional
import org.hotelApp.Country

@Transactional
class CountryService implements hotel.app.CountryService {

    def serviceMethod() {

    }

    @Override
    Country save(Country country) {
        return null
    }

    @Override
    Country update(Country country) {
        return null
    }

    @Override
    void delete(Long id) {

    }
}
