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


<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/includes/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/tags/cdn.tld" prefix="cdn"%>
<form:form role="form" action="search" modelAttribute="bankStatementUploadFile" id="bankstatementsearchform" cssClass="form-horizontal form-groups-bordered" enctype="multipart/form-data">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary" data-collapsed="0">
				<div class="panel-heading">
					<div class="panel-title">
						<spring:message code="lbl.search.bankstatement" />
					</div>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<label class="col-sm-3 control-label text-right"><spring:message code="lbl.bank" />  </label>
						<div class="col-sm-3 add-margin">
						<form:select path="" data-first-option="false" id="bank" class="form-control" >
							<form:option value=""><spring:message code="lbl.select" /></form:option>
							<form:options items="${banks}" itemValue="id" itemLabel="name" />
						</form:select>
						</div>
						<label class="col-sm-2 control-label text-right"><spring:message code="lbl.bankbranch" />  </label>
						<div class="col-sm-3 add-margin">
							<form:select path="" id="bankbranch" class="form-control" data-first-option="false">
								<form:option value=""><spring:message code="lbl.select" /></form:option>
								<form:options items="${bankbranches}" itemValue="id" itemLabel="branchname" />
							</form:select>
							<form:errors path="" cssClass="error-msg" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label text-right"><spring:message code="lbl.accountnumber" />  </label>
						<div class="col-sm-3 add-margin">
							<form:select path="bankAccount" id="bankaccount" class="form-control" data-first-option="false">
								<form:option value=""><spring:message code="lbl.select" /></form:option>
							</form:select>
							<form:errors path="" cssClass="error-msg" />
						</div>
						<label class="col-sm-2 control-label text-right"><spring:message code="lbl.asondate" />
						</label>
						<div class="col-sm-3 add-margin">
							<form:input  path="asOnDate" id="filedate"  class="form-control datepicker" data-date-end-date="0d"  />
						</div>
					</div>

					<input type="hidden" id="filedate" name="filedate" value="${filedate}" />
				</div>
			</div>
		</div>
	</div>
	<div class="text-center">
		<button type='button' class='btn btn-primary' id="btnsearch">
			<spring:message code='lbl.search' />
		</button>
		<a href='javascript:void(0)' class='btn btn-default' onclick='self.close()'><spring:message code='lbl.close' /></a>
	</div>
</form:form>
<div class="row display-hide report-section">
	<div class="col-md-12 table-header text-left"><spring:message code="lbl.search.bankaccount.result" /></div>
	<div class="col-md-12 report-table-container">
		<table class="table table-bordered table-hover multiheadertbl"
			id="resultTable">
			<thead>
				<tr>
					<th><spring:message code="lbl.filename" /></th>
					<th><spring:message code="lbl.filedate" /></th>
					<th><spring:message code="lbl.file" /></th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script>
	$('#btnsearch').click(function(e) {
		if ($('form').valid()) {
		} else {
			e.preventDefault();
		}
	});
</script>
<link rel="stylesheet" href="<cdn:url value='/resources/global/css/jq/plugins/datatables/jq.dataTables.min.css' context='/egi'/>" />
<link rel="stylesheet" href="<cdn:url value='/resources/global/css/jq/plugins/datatables/dataTables.bts.min.css' context='/egi'/>">
<link rel="stylesheet" href="<cdn:url value='/resources/global/css/jq/plugins/datatables/buttons.bts.min.css' context='/egi'/>">
<script type="text/javascript" src="<cdn:url value='/resources/global/js/jq/plugins/datatables/jq.dataTables.min.js' context='/egi'/>"></script>
<script type="text/javascript" src="<cdn:url value='/resources/global/js/jq/plugins/datatables/dataTables.bts.js' context='/egi'/>"></script>
<script type="text/javascript" src="<cdn:url value='/resources/global/js/jq/plugins/datatables/extensions/buttons/dataTables.buttons.min.js' context='/egi'/>"></script>
<script type="text/javascript" src="<cdn:url value='/resources/global/js/jq/plugins/datatables/extensions/buttons/buttons.bts.min.js' context='/egi'/>"></script>
<script type="text/javascript" src="<cdn:url value='/resources/global/js/jq/plugins/datatables/extensions/buttons/buttons.flash.min.js' context='/egi'/>"></script>
<script type="text/javascript" src="<cdn:url value='/resources/global/js/jq/plugins/datatables/extensions/buttons/jszip.min.js' context='/egi'/>"></script>
<script type="text/javascript" src="<cdn:url value='/resources/global/js/jq/plugins/datatables/extensions/buttons/pdfmake.min.js' context='/egi'/>"></script>
<script type="text/javascript" src="<cdn:url value='/resources/global/js/jq/plugins/datatables/extensions/buttons/vfs_fonts.js' context='/egi'/>"></script>
<script type="text/javascript" src="<cdn:url value='/resources/global/js/jq/plugins/datatables/extensions/buttons/buttons.html5.min.js' context='/egi'/>"></script>
<script type="text/javascript" src="<cdn:url value='/resources/global/js/jq/plugins/datatables/exten
sions/buttons/buttons.print.min.js' context='/egi'/>"></script>
<script type="text/javascript" src="<cdn:url value='/resources/global/js/jq/plugins/jq.validate.min.js' context='/egi'/>"></script>
<script type="text/javascript" src="<cdn:url value='/resources/app/js/bankstatement/bankstatement-helper.js?rnd=${app_release_no}'/>"></script>
