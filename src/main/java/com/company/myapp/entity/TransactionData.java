package com.company.myapp.entity;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.company.myapp.service.ProcessServiceImpl.ProcessOperation;
import com.company.myapp.service.ProcessServiceImpl.Status;

@Entity
@Table(name = "Transaction_Data")
public class TransactionData {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long Id;

	@Column(name = "Transaction_Number")
	private String transactionNumber;

	@Column(name = "Transaction_Type")
	private ProcessOperation transactionType;

	// Prasad
	@Column(name="Process_Name")
	private String processName;

	@Column(name = "Transaction_Date")
	private Timestamp transactionDate;

	@Column(name = "Status")
	private Status status;

	@Column(name = "Changed_By")
	private String changedBy;

	@Column(name = "Changed_On")
	private LocalDateTime changedOn;

	public Long getId() {
		return Id;
	}

	public void setId(Long id) {
		Id = id;
	}

	public String getProcessName() {
		return processName;
	}

	public void setProcessName(String processName) {
		this.processName = processName;
	}

	public String getTransactionNumber() {
		return this.transactionNumber;
	}

	public void setTransactionNumber(String transactionNumber) {
		this.transactionNumber = transactionNumber;
	}

	public ProcessOperation getTransactionType() {
		return this.transactionType;
	}

	public void setTransactionType(ProcessOperation transactionType) {
		this.transactionType = transactionType;
	}

	public Timestamp getTransactionDate() {
		return this.transactionDate;
	}

	public void setTransactionDate(Timestamp transactionDate) {
		this.transactionDate = transactionDate;
	}

	public Status getStatus() {
		return this.status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public String getChangedBy() {
		return this.changedBy;
	}

	public void setChangedBy(String changedBy) {
		this.changedBy = changedBy;
	}

	public LocalDateTime getChangedOn() {
		return this.changedOn;
	}

	public void setChangedOn(LocalDateTime changedOn) {
		this.changedOn = changedOn;
	}

}
