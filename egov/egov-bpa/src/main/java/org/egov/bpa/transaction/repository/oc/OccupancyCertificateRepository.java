/*
 * eGov suite of products aim to improve the internal efficiency,transparency,
 *    accountability and the service delivery of the government  organizations.
 *
 *     Copyright (C) <2015>  eGovernments Foundation
 *
 *     The updated version of eGov suite of products as by eGovernments Foundation
 *     is available at http://www.egovernments.org
 *
 *     This program is free software: you can redistribute it and/or modify
 *     it under the terms of the GNU General Public License as published by
 *     the Free Software Foundation, either version 3 of the License, or
 *     any later version.
 *
 *     This program is distributed in the hope that it will be useful,
 *     but WITHOUT ANY WARRANTY; without even the implied warranty of
 *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *     GNU General Public License for more details.
 *
 *     You should have received a copy of the GNU General Public License
 *     along with this program. If not, see http://www.gnu.org/licenses/ or
 *     http://www.gnu.org/licenses/gpl.html .
 *
 *     In addition to the terms of the GPL license to be adhered to in using this
 *     program, the following additional terms are to be complied with:
 *
 *         1) All versions of this program, verbatim or modified must carry this
 *            Legal Notice.
 *
 *         2) Any misrepresentation of the origin of the material is prohibited. It
 *            is required that all modified versions of this material be marked in
 *            reasonable ways as different from the original version.
 *
 *         3) This license does not grant any rights to any user of the program
 *            with regards to rights under trademark law for use of the trade names
 *            or trademarks of eGovernments Foundation.
 *
 *   In case of any queries, you can reach eGovernments Foundation at contact@egovernments.org.
 */
package org.egov.bpa.transaction.repository.oc;

import java.util.List;

import org.egov.bpa.transaction.entity.BpaStatus;
import org.egov.bpa.transaction.entity.oc.OccupancyCertificate;
import org.egov.demand.model.EgDemand;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OccupancyCertificateRepository
		extends JpaRepository<OccupancyCertificate, Long>, JpaSpecificationExecutor<OccupancyCertificate> {

	OccupancyCertificate findByDemand(EgDemand demand);

	OccupancyCertificate findByApplicationNumber(String applicationNumber);

	@Query("select occupancycertificate from OccupancyCertificate occupancycertificate where occupancycertificate.eDcrNumber in :edcrNumber order by id desc")
	List<OccupancyCertificate> findByEDcrNumber(@Param("edcrNumber") String edcrNumber);

	@Query("select occupancycertificate from OccupancyCertificate occupancycertificate where occupancycertificate.status in :status order by createddate asc")
	List<OccupancyCertificate> findByStatusListOrderByCreatedDateAsc(@Param("status") List<BpaStatus> listOfBpaStatus);
	
	@Query("select occupancycertificate from OccupancyCertificate occupancycertificate where occupancycertificate.parent.planPermissionNumber =:permitNumber order by occupancycertificate.createdDate desc")
	List<OccupancyCertificate> findByPermitNumber(@Param("permitNumber") String permitNumber);

}
