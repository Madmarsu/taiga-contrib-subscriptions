###
# Copyright (C) 2014-2016 Taiga Agile LLC <taiga@taiga.io>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
# File: lightbox-plans.directive.coffee
###

module = angular.module('subscriptions')

LightboxPlanDirective = (lightboxService) ->
    link = (scope, el, attrs) ->
        scope.$watch 'vm.isPlanSelectorOpen', (value) ->
            if value
                lightboxService.open(el)

    return {
        scope: {
            validPlan: "=",
            selectedPlan: "=",
            isPlanSelectorOpen: '='
        },
        bindToController: true,
        controller: 'ContribLbPlansController',
        controllerAs: 'vm',
        templateUrl: 'compile-modules/taiga-contrib-subscriptions/partials/lightbox-plans.html',
        link: link
    }

LightboxPlanDirective.$inject = [
    "lightboxService"
]

module.directive("tgLbPlans", LightboxPlanDirective)