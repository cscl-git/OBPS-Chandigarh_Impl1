<%--
  ~    eGov  SmartCity eGovernance suite aims to improve the internal efficiency,transparency,
  ~    accountability and the service delivery of the government  organizations.
  ~
  ~     Copyright (C) 2017  eGovernments Foundation
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
  ~            Further, all user interfaces, including but not limited to citizen facing interfaces,
  ~            Urban Local Bodies interfaces, dashboards, mobile applications, of the program and any
  ~            derived works should carry eGovernments Foundation logo on the top right corner.
  ~
  ~            For the logo, please refer http://egovernments.org/html/logo/egov_logo.png.
  ~            For any further queries on attribution, including queries on brand guidelines,
  ~            please contact contact@egovernments.org
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
  ~
  --%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/taglib/cdn.tld" prefix="cdn" %>

<div class="panel-body">
<c:if test="${bpaApplication.admissionfeeAmount > 0}">


<div class="panel-heading custom_form_panel_heading">
    <div class="panel-title">
        <spring:message code="lbl.admission.fees"/>
    </div>
</div>

 <table class="table table-striped table-bordered" id="bpaapplFeeDetail" style="width:50%;margin:0 auto;">
            <thead>
            <tr>
                <th class="text-center"><spring:message code="lbl.slno"/></th>
                <th style="width:50%;"><spring:message code="lbl.applicationFee.feeType"/></th>
                <th class="text-right"><spring:message code="lbl.applicationFee.amount"/></th>
            </tr>
            </thead>
            <tbody id="tblBody">
            <c:set var="totalAmount" value="${0}"/>
           
                <tr>
                    <td class="text-center view-content"><c:out value="1"/></td>
                    <td id="description" class="view-content"><spring:message text="Security fees"/></td>
                    <td class="text-right view-content"><c:set var="totalAmount"
                                                               value="${bpaApplication.admissionfeeAmount}"/>
                        <fmt:formatNumber type="number" maxFractionDigits="2" value="${bpaApplication.admissionfeeAmount}"/>
                    </td>
                </tr>
            </tbody>
            <tfoot>
            <tr>
                <td></td>
                <td class="text-right view-content"><spring:message code="lbl.total.amount"/></td>
                <td class="text-right view-content"><fmt:formatNumber type="number" maxFractionDigits="2"
                                                                      value="${totalAmount}"/></td>
            </tr>
            </tfoot>
        </table>
</c:if>



<c:if test="${!bpaApplication.permitFee.isEmpty()}">

<div class="panel-heading custom_form_panel_heading">
    <div class="panel-title">
        <spring:message code="lbl.fee.details"/>
    </div>
</div>

        <table class="table table-striped table-bordered" id="bpaChargesDetail" style="width:50%;margin:0 auto;">
            <thead>
            <tr>
                <th class="text-center"><spring:message code="lbl.slno"/></th>
                <th style="width:50%;"><spring:message code="lbl.applicationFee.feeType"/></th>
                <th class="text-right"><spring:message code="lbl.applicationFee.amount"/></th>
            </tr>
            </thead>
            <tbody id="tblBody">
            <c:set var="totalAmount" value="${0}"/>
            <c:forEach var="feeType" items="${bpaApplication.permitFee[0].applicationFee.applicationFeeDetail}"
                       varStatus="counter">
                <tr>
                    <td class="text-center view-content"><c:out value="${counter.index+1}"/></td>
                    <td id="description" class="view-content"><c:out value="${feeType.bpaFeeMapping.bpaFeeCommon.description}"/></td>
                    <td class="text-right view-content"><c:set var="totalAmount"
                                                               value="${totalAmount + feeType.amount}"/>
                        <fmt:formatNumber type="number" maxFractionDigits="2" value="${feeType.amount}"/>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
            <tfoot>
            <tr>
                <td></td>
                <td class="text-right view-content"><spring:message code="lbl.total.amount"/></td>
                <td class="text-right view-content"><fmt:formatNumber type="number" maxFractionDigits="2"
                                                                      value="${totalAmount}"/></td>
            </tr>
            </tfoot>
        </table>
    </c:if>
    <c:if
            test="${bpaApplication.permitFee[0].applicationFee.modifyFeeReason ne null}">
        <div class="row add-border">
            <div class="col-sm-5 text-right add-margin">
                <spring:message code="lbl.modify.fee.reason"/>
            </div>
            <div class="col-sm-7 add-margin view-content text-justify">
                <c:out value="${bpaApplication.permitFee[0].applicationFee.modifyFeeReason}"/>
            </div>
        </div>
    </c:if>
</div>
