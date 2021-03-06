package com.bonc.pure.web.action.demo;

import java.util.List;

import com.bonc.base.dao.DaoHelper;
import com.bonc.commons.orm.PagiParam;
import com.bonc.pure.web.action.CwCommon;

public class TableAction extends CwCommon {

	private DaoHelper daoHelper;
	private List list;
	private PagiParam pagiParam = new PagiParam();
	private String orgId;
	private String kpiId;

	public String execute() {
		return "success";
	}

	public String queryTable() {
		list = daoHelper.queryForList("cw.demo.table_queryTable", null);
		return "table";
	}

	public String queryPagiTable() {
		// 默认每页20条，可以在pagiParam定义时直接设置，也可以通过setPageSize设置
		pagiParam.setPageSize(5);
		list = daoHelper.queryForPagiList("cw.demo.table_queryPagiTable", this);
		return "pagiTable";
	}

	public String queryDrillTable() {
		list = daoHelper.queryForList("cw.demo.table_queryDrillTable", this);
		if (kpiId == null) {
			return "drillTable";
		} else {
			return "drillTableDrill";
		}
	}

	public String queryDrillTableByOrg() {
		list = daoHelper.queryForList("cw.demo.table_queryDrillTableByOrg", this);
		return "drillTableDrill";
	}

	public DaoHelper getDaoHelper() {
		return daoHelper;
	}

	public void setDaoHelper(DaoHelper daoHelper) {
		this.daoHelper = daoHelper;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public PagiParam getPagiParam() {
		return pagiParam;
	}

	public void setPagiParam(PagiParam pagiParam) {
		this.pagiParam = pagiParam;
	}

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public String getKpiId() {
		return kpiId;
	}

	public void setKpiId(String kpiId) {
		this.kpiId = kpiId;
	}

}
