<%--
  ~ eGov  SmartCity eGovernance suite aims to improve the internal efficiency,transparency,
  ~ accountability and the service delivery of the government  organizations.
  ~
  ~  Copyright (C) <2017>  eGovernments Foundation
  ~
  ~  The updated version of eGov suite of products as by eGovernments Foundation
  ~  is available at http://www.egovernments.org
  ~
  ~  This program is free software: you can redistribute it and/or modify
  ~  it under the terms of the GNU General Public License as published by
  ~  the Free Software Foundation, either version 3 of the License, or
  ~  any later version.
  ~
  ~  This program is distributed in the hope that it will be useful,
  ~  but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ~  GNU General Public License for more details.
  ~
  ~  You should have received a copy of the GNU General Public License
  ~  along with this program. If not, see http://www.gnu.org/licenses/ or
  ~  http://www.gnu.org/licenses/gpl.html .
  ~
  ~  In addition to the terms of the GPL license to be adhered to in using this
  ~  program, the following additional terms are to be complied with:
  ~
  ~      1) All versions of this program, verbatim or modified must carry this
  ~         Legal Notice.
  ~ 	Further, all user interfaces, including but not limited to citizen facing interfaces,
  ~         Urban Local Bodies interfaces, dashboards, mobile applications, of the program and any
  ~         derived works should carry eGovernments Foundation logo on the top right corner.
  ~
  ~ 	For the logo, please refer http://egovernments.org/html/logo/egov_logo.png.
  ~ 	For any further queries on attribution, including queries on brand guidelines,
  ~         please contact contact@egovernments.org
  ~
  ~      2) Any misrepresentation of the origin of the material is prohibited. It
  ~         is required that all modified versions of this material be marked in
  ~         reasonable ways as different from the original version.
  ~
  ~      3) This license does not grant any rights to any user of the program
  ~         with regards to rights under trademark law for use of the trade names
  ~         or trademarks of eGovernments Foundation.
  ~
  ~  In case of any queries, you can reach eGovernments Foundation at contact@egovernments.org.
  --%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/taglib/cdn.tld" prefix="cdn" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="panel-heading custom_form_panel_heading">
    <div class="panel-title">
        <spring:message code="lbl.pln.scrty.rule"/>
    </div>
</div>
<div class="panel-body">
    <table class="table table-bordered  multiheadertbl"
           id="planScrutinyDetails">
        <thead>
        <tr>
            <th width="2%"><spring:message code="lbl.srl.no"/></th>
            <th width="50%"><spring:message code="lbl.description"/></th>
            <th width="9%"><spring:message code="lbl.is.applicable"/></th>
            <th><spring:message code="lbl.remarks"/></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="planScrutiny"
                   items="${permitInspection.inspection.planScrutinyChecklistForRule}"
                   varStatus="planScrutinyStatus">
            <tr>
                <td class="view-content" style="font-size: 97%;"><c:out value="${planScrutinyStatus.index+1}"/></td>
                <td class="view-content text-justify" style="font-size: 97%;"><c:out value="${planScrutiny.serviceChecklist.checklist.description}"/></td>
                <td class="view-content" style="font-size: 97%;"><c:out value="${planScrutiny.scrutinyValue.checkListVal}" default="N/A"/></td>
                <td class="view-content text-justify" style="font-size: 97%;"><c:out value="${planScrutiny.remarks}" default="N/A"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>