package hotel.app

import grails.gorm.transactions.Transactional
import org.hotelApp.Country
import org.hotelApp.Hotel

class CountryController {

    CountryService countryService

    static allowedMethods = [save: 'POST', update: 'PUT', delete: 'DELETE']

    def index() {
        params.max = params?.max ?: 10
        params.offset = params?.offset ?: 0
        List<Country> resultCountryList
        Integer countryTotalCount

        if (params.entityPatternSearchInput.toString().isEmpty() || params.entityPatternSearchInput == null) {
            resultCountryList = Country.list(offset: params.offset, max: params.max)
            countryTotalCount = Country.count
        } else {
            def countryCriteria = Country.createCriteria()
            String countryNameSearchPattern = "\\.{0,}(?i)" + params.entityPatternSearchInput + "\\.{0,}"

            resultCountryList = countryCriteria.list(offset: params.offset, max: params.max) {
                rlike('name', countryNameSearchPattern)
            } as List<Country>

            countryTotalCount = (Country.withCriteria {
                rlike('name', countryNameSearchPattern)
            } as List<Country>).size()
        }
        render view: 'index',
                model:
                        [
                                countryList      : resultCountryList,
                                countryTotalCount: countryTotalCount,
                                max              : params.max,
                                offset           : params.offset
                        ]
    }

    def show(Long id) {
        def get = Country.get(id)
        respond get, model: 'show'
    }

    def createNewCountry() {
        Country country;
        if (!(country = new Country(
                name: params.name,
                capital: params.capital))
                .validate()) {
            flash.error = message(error: "Invalid name or capital")
        } else {
            countryService.save(country)
            flash.message = message(message: "Country created")
        }
        redirect view: 'index'
    }

    def edit(Country country) {
        respond country
    }


    def update(Country country) {
        if (!country.validate()) {
            flash.error = message(error: "Invalid name or capital")
        } else {
            countryService.update(country)
            flash.message = message(message: "Country updated")
        }
        redirect action: 'show', id: country.getId()
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }
        countryService.delete(id)
        flash.message = message(message: "Country successfully deleted")
        redirect action: 'index'
    }

    protected void notFound() {
        request.withFormat {
            form with {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'country.label', default: 'Country'), params.id]) as Object
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}