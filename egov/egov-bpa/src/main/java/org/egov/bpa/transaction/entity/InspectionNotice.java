/*
 * eGov  SmartCity eGovernance suite aims to improve the internal efficiency,transparency,
 * accountability and the service delivery of the government  organizations.
 *
 *  Copyright (C) <2017>  eGovernments Foundation
 *
 *  The updated version of eGov suite of products as by eGovernments Foundation
 *  is available at http://www.egovernments.org
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program. If not, see http://www.gnu.org/licenses/ or
 *  http://www.gnu.org/licenses/gpl.html .
 *
 *  In addition to the terms of the GPL license to be adhered to in using this
 *  program, the following additional terms are to be complied with:
 *
 *      1) All versions of this program, verbatim or modified must carry this
 *         Legal Notice.
 *      Further, all user interfaces, including but not limited to citizen facing interfaces,
 *         Urban Local Bodies interfaces, dashboards, mobile applications, of the program and any
 *         derived works should carry eGovernments Foundation logo on the top right corner.
 *
 *      For the logo, please refer http://egovernments.org/html/logo/egov_logo.png.
 *      For any further queries on attribution, including queries on brand guidelines,
 *         please contact contact@egovernments.org
 *
 *      2) Any misrepresentation of the origin of the material is prohibited. It
 *         is required that all modified versions of this material be marked in
 *         reasonable ways as different from the original version.
 *
 *      3) This license does not grant any rights to any user of the program
 *         with regards to rights under trademark law for use of the trade names
 *         or trademarks of eGovernments Foundation.
 *
 *  In case of any queries, you can reach eGovernments Foundation at contact@egovernments.org.
 */

package org.egov.bpa.transaction.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.egov.infra.filestore.entity.FileStoreMapper;
import org.hibernate.validator.constraints.SafeHtml;

@Entity
@Table(name = "egbpa_inspectionnotice")
@SequenceGenerator(name = InspectionNotice.SEQ_EGBPA_INSPECTIONNOTICE, sequenceName = InspectionNotice.SEQ_EGBPA_INSPECTIONNOTICE, allocationSize = 1)
public class InspectionNotice implements Serializable {

    private static final long serialVersionUID = 2340581885002571006L;

    public static final String SEQ_EGBPA_INSPECTIONNOTICE = "SEQ_EGBPA_INSPECTIONNOTICE";

    @Id
    @GeneratedValue(generator = SEQ_EGBPA_INSPECTIONNOTICE, strategy = GenerationType.SEQUENCE)
    private Long id;

    @SafeHtml
    private String inspectionNumber;

    @SafeHtml
    private String refNumber;

    private Date noticeGeneratedDate;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "noticeFileStore")
    private FileStoreMapper noticeFileStore;

    @SafeHtml
    private String applicationType;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public FileStoreMapper getNoticeFileStore() {
        return noticeFileStore;
    }

    public void setNoticeFileStore(FileStoreMapper noticeFileStore) {
        this.noticeFileStore = noticeFileStore;
    }

    public Date getNoticeGeneratedDate() {
        return noticeGeneratedDate;
    }

    public void setNoticeGeneratedDate(Date noticeGeneratedDate) {
        this.noticeGeneratedDate = noticeGeneratedDate;
    }

    public String getInspectionNumber() {
        return inspectionNumber;
    }

    public void setInspectionNumber(String inspectionNumber) {
        this.inspectionNumber = inspectionNumber;
    }

    public String getRefNumber() {
        return refNumber;
    }

    public void setRefNumber(String refNumber) {
        this.refNumber = refNumber;
    }

    public String getApplicationType() {
        return applicationType;
    }

    public void setApplicationType(String applicationType) {
        this.applicationType = applicationType;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}