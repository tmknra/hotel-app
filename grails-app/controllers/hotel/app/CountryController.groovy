package hotel.app

import grails.gorm.transactions.Transactional
import org.hotelApp.Country

class CountryController {

    CountryService countryService

    static allowedMethods = [save: 'POST', update: 'PUT', delete: 'DELETE']

    def index() {
        params.max = params?.max ?: 10
        params.offset = params?.offset ?: 0
        List<Country> countries
        Integer countryTotal;
        if (params.searchInput == null) {
            countries = Country.list(params)
            countryTotal = Country.count
        } else {
            def c = Country.createCriteria()
            String pattern = '%'+ params.searchInput+'%'

            countries = c.list (params) {
                like ('name', pattern)
            } as List<Country>

            def list = Country.withCriteria {
                like ('name', pattern)
            } as List<Country>

            countryTotal = list.size()
        }
        render view: 'index',
                model:
                        [
                                countryList : countries,
                                countryTotal: countryTotal,
                                max         : params.max,
                                offset      : params.offset
                        ]
    }


    def show(Long id) {
        def get = Country.get(id)
        respond get, model: 'show'
    }

    def saveNewCountry() {
        countryService.save(params)
        redirect action: 'index'
    }

    def edit(Country country) {
        respond country
    }


    def update(Country country) {
        save(country)
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }
        countryService.delete(id)
        redirect action: 'index'
    }

    @Transactional
    def save(Country country) {
        if (country == null) {
            notFound()
            return
        }
        if (country.hasErrors()) {
            respond country.errors, view: 'create'
        }
        country.save flush: true
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