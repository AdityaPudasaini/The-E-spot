package com.model;

public class AdminReportModel {
    private int exportId;
    private String reportType;
    private String timeFilter;
    private String exportedBy;
    private String exportDate;
    private int rowCount;

    public int getExportId()
    {
        return exportId;
    }
    
    public void setExportId(int exportId)
    {
        this.exportId = exportId;
    }

    public String getReportType()
    {
        return reportType;
    }
    
    public void setReportType(String reportType)
    {
        this.reportType = reportType;
    }

    public String getTimeFilter()
    {
        return timeFilter;
    }
    
    public void setTimeFilter(String timeFilter)
    {
        this.timeFilter = timeFilter;
    }

    public String getExportedBy()
    {
        return exportedBy;
    }
    
    public void setExportedBy(String exportedBy)
    {
        this.exportedBy = exportedBy;
    }

    public String getExportDate()
    {
        return exportDate;
    }
    
    public void setExportDate(String exportDate)
    {
        this.exportDate = exportDate;
    }

    public int getRowCount()
    {
        return rowCount;
    }
    
    public void setRowCount(int rowCount)
    {
        this.rowCount = rowCount;
    }
}