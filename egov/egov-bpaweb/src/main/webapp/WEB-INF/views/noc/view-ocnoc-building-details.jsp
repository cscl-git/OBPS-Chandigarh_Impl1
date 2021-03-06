<%--
  ~ eGov suite of products aim to improve the internal efficiency,transparency,
  ~    accountability and the service delivery of the government  organizations.
  ~
  ~     Copyright (C) <2017>  eGovernments Foundation
  ~
  ~     The updated version of eGov suite of products as by eGovernments Foundation
  ~     is available at http://www.egovernments.org
  ~
  ~     This program is free software: you can redistribute it and/or modify
  ~     it under the terms of the GNU General Public License as published by
  ~     the Free Software Foundation, either version 3 of the License, or
  ~     any later version.
  ~
  ~     This program is distributed in the hope that it will be useful,
  ~     but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ~     GNU General Public License for more details.
  ~
  ~     You should have received a copy of the GNU General Public License
  ~     along with this program. If not, see http://www.gnu.org/licenses/ or
  ~     http://www.gnu.org/licenses/gpl.html .
  ~
  ~     In addition to the terms of the GPL license to be adhered to in using this
  ~     program, the following additional terms are to be complied with:
  ~
  ~         1) All versions of this program, verbatim or modified must carry this
  ~            Legal Notice.
  ~
  ~         2) Any misrepresentation of the origin of the material is prohibited. It
  ~            is required that all modified versions of this material be marked in
  ~            reasonable ways as different from the original version.
  ~
  ~         3) This license does not grant any rights to any user of the program
  ~            with regards to rights under trademark law for use of the trade names
  ~            or trademarks of eGovernments Foundation.
  ~
  ~   In case of any queries, you can reach eGovernments Foundation at contact@egovernments.org.
  --%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/WEB-INF/taglib/cdn.tld" prefix="cdn" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="panel-heading toggle-header custom_form_panel_heading">
    <div class="panel-title">
        <spring:message code="lbl.cmplted.bldg.dtl"/>
    </div>
    <div class="history-icon toggle-icon">
        <i class="fa fa-angle-up fa-2x"></i>
    </div>
</div>

<div class="panel-body display-hide">
    <c:if test="${not empty oc.buildings}">
        <c:forEach
                items="${oc.buildings}"
                var="bldg" varStatus="bldgCounter">
            <c:if test="${not empty bldg.floorDetails}">
                <div class="panel-heading custom_form_panel_heading toggle-bldg-header toggle-head${bldgCounter.index}"
                     data-bldg-idx="${bldgCounter.index}">
                    <div class="panel-title">
                        <c:if test="${fn:length(oc.buildings) gt 1}">Block - ${bldg.name}</c:if>
                        <spring:message code="lbl.plint.carpet.details"/>
                    </div>
                    <c:if test="${fn:length(oc.buildings) gt 1}">
                        <div class="history-icon toggle-icon${bldgCounter.index}">
                            <i class="fa fa-angle-up fa-2x"></i>
                        </div>
                    </c:if>
                </div>
                <div <c:if
                    test="${fn:length(oc.buildings) gt 1}">class="buildingDetailsToggle${bldgCounter.index} display-hide" </c:if>>
                <table class="table table-striped table-bordered" id="buildingAreaDetails${bldgCounter.index}">
                    <thead>
                    <tr>
                        <th class="text-center"><spring:message code="lbl.srl.no"/></th>
                        <th class="text-center"><spring:message code="lbl.floor.name"/></th>
                        <th class="text-center"><spring:message code="lbl.floor.level"/></th>
                        <th class="text-center"><spring:message code="lbl.occupancy"/></th>
                        <th class="text-center"><spring:message code="lbl.plinth.area"/></th>
                        <th class="text-center"><spring:message code="lbl.floor.area"/></th>
                        <th class="text-center"><spring:message code="lbl.carpet.area"/></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set var="floorAreaTotal" value="${0}"/>
                    <c:set var="plinthAreaTotal" value="${0}"/>
                    <c:set var="carpetAreaTotal" value="${0}"/>
                    <c:forEach
                            items="${bldg.floorDetails}"
                            var="floorDetails" varStatus="counter">
                        <c:set var="floorAreaTotal"
                               value="${ floorAreaTotal + floorDetails.floorArea}"/>
                        <c:set var="plinthAreaTotal"
                               value="${plinthAreaTotal + floorDetails.plinthArea}"/>
                        <c:set var="carpetAreaTotal"
                               value="${carpetAreaTotal + floorDetails.carpetArea}"/>
                        <input type="hidden" value="${floorDetails.id}"
                               id="table_fieldInspections${counter.index}"
                               name="buildings[${bldgCounter.index}].floorDetails[${counter.index}].id"/>
                        <tr class="data-fetched">
                            <td class="text-center view-content"><span class="serialNo"
                                                                       id="slNoInsp">${counter.index+1}</span></td>
                            <td class="view-content"><c:out
                                    value="${floorDetails.floorDescription}" default="0"></c:out>
                            <td class="text-center view-content"><c:out
											value="${floorDetails.floorNumber}" default="0"></c:out><td class="view-content"><c:out
                                    value="${floorDetails.subOccupancy.description}" default="0"></c:out>
                            <td class="text-right view-content"><fmt:formatNumber type="number"
                                                                                  maxFractionDigits="2"
                                                                                  value="${floorDetails.plinthArea}"/>
                            <td class="text-right view-content"><fmt:formatNumber type="number"
                                                                                  maxFractionDigits="2"
                                                                                  value="${floorDetails.floorArea}"/>
                            <td class="text-right view-content"><fmt:formatNumber type="number"
                                                                                  maxFractionDigits="2"
                                                                                  value="${floorDetails.carpetArea}"/>
                        </tr>
                    </c:forEach>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td class="text-right view-content">Total</td>
                        <td class="text-right view-content"><fmt:formatNumber type="number"
                                                                              maxFractionDigits="2"
                                                                              value="${plinthAreaTotal}"/></td>
                        <td class="text-right view-content"><fmt:formatNumber type="number"
                                                                              maxFractionDigits="2"
                                                                              value="${floorAreaTotal}"/></td>
                        <td class="text-right view-content"><fmt:formatNumber type="number"
                                                                              maxFractionDigits="2"
                                                                              value="${carpetAreaTotal}"/></td>
                    </tr>
                    </tfoot>
                </table>
            </c:if>
            <div class="row add-border">
                <div class="col-sm-3 add-margin show-hide totalPlintArea">
                    <spring:message code="lbl.build.total.plinth"/>
                </div>
                <div class="col-sm-3 add-margin view-content">
                    <fmt:formatNumber type="number" maxFractionDigits="2"
                                      value="${bldg.totalPlinthArea}"/>
                </div>
                <div class="col-sm-3 add-margin">
                    <spring:message code="lbl.floor.count"/>
                </div>
                <div class="col-sm-3 add-margin view-content">
                    <c:out value="${bldg.floorCount}"
                           default="N/A"></c:out>
                </div>
            </div>
            <div class="row add-border">
                <div class="col-sm-3 add-margin">
                    <spring:message code="lbl.grnd.wo.stair"/>
                </div>
                <div class="col-sm-3 add-margin view-content">
                    <fmt:formatNumber type="number" maxFractionDigits="2"
                                      value="${bldg.heightFromGroundWithOutStairRoom}"
                                      var="heightFromGroundWithOutStairRoom"/>
                    <c:out value="${heightFromGroundWithOutStairRoom}" default="N/A"></c:out>
                </div>
            </div>
            </div>
        </c:forEach>
    </c:if>
</div>
