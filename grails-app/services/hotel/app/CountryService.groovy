package hotel.app

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap
import org.hotelApp.Country

@Transactional
class CountryService {

    Country save(String name, String capital) {
        def country = new Country(name: name, capital: capital)
        country.save()
        country
    }

    Country save(GrailsParameterMap params) {
        def country = new Country(params)
        def save = country.save()
        save
    }

    Country update(Country country) {
        def save = country.save()
        return save
    }

    void delete(Long id) {
        def get = Country.get(id)
        get.delete()
    }
}
