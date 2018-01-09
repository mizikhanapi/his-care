package lhr_tables;

import Config_Pack.Config;
import java.util.ArrayList;
import main.RMIConnector;

public class get_ehr_central_data {

    private String pmi_no;
    private String PERSON_ID_NO;
    private String PERSON_STATUS;
    private String LOCATION_CODE;
    private String Central_Code;
    private String Centre_Code;
    private String national_id_no;
    private String txndata;
    private Boolean result;
    RMIConnector rmic = new RMIConnector();
    
    public boolean getQuery() {

        
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_lis_master_detail = true;
        String sql2 = "SELECT "
                + "ec.central_code, " //0
                + "ec.pmi_no, " //1
                + "ec.c_txndate, " //2
                + "ec.c_txndata, " //3
                + "ec.status, " //4
                + "ssi.national_id_no," //5
                + "ssi.person_id_no," //6
                + "ssi.person_status," //7
                + "ssi.location_code " //8
                + "FROM ehr_central ec, pms_patient_biodata ppb "
                + "LEFT JOIN special_integration_information ssi "
                + "ON ppb.new_ic_no = ssi.national_id_no "
                + "WHERE ec.pmi_no = ppb.pmi_no "
                + "AND ec.status = 1"; // select undischarge patient (1)

        String sql3 = "SELECT ec.central_code,ec.pmi_no,ec.c_txndate,ec.c_txndata,ec.status,ssi.national_id_no,ssi.person_id_no,ssi.person_status,ssi.location_code FROM ehr_central ec, pms_patient_biodata ppb LEFT JOIN special_integration_information ssi ON ppb.new_ic_no = ssi.national_id_no WHERE ec.pmi_no = ppb.pmi_no AND ec.status = 1;";

        ArrayList<ArrayList<String>> data = rmic.getQuerySQL(Config.ipAddressServer, Config.portServer, sql3);
//        System.out.println(sql3);
//        System.out.println(data);
//
//        System.out.println(Config.ipAddressServer);
//        System.out.println(Config.portServer);
        if (data.size() > 0) {
            for (int j = 0; j < data.size(); j++) {
                try {

                    this.pmi_no = data.get(j).get(1);
                    this.national_id_no = data.get(j).get(5);
                    this.PERSON_ID_NO = data.get(j).get(6);
                    this.PERSON_STATUS = data.get(j).get(7);
                    this.LOCATION_CODE = data.get(j).get(8);
                    this.Centre_Code = data.get(j).get(8);
                    this.Central_Code = data.get(j).get(0);
                    this.txndata = data.get(j).get(3);

                } catch (Exception e) {
                    System.out.println(e.getStackTrace());
                }

            }
            result = true;
        } else {
            result = false;
        }
        return result;
    }

    public String getPmi_no() {
        return pmi_no;

    }

    public String getPERSON_ID_NO() {
        return PERSON_ID_NO;
    }

    public String getPERSON_STATUS() {
        return PERSON_STATUS;
    }

    public String getLOCATION_CODE() {
        return LOCATION_CODE;
    }

    public String getCentral_Code() {
        return Central_Code;
    }

    public String getCentre_Code() {
        return Centre_Code;
    }

    public String getNational_id_no() {
        return national_id_no;
    }

    public String getTxndata() {
        return txndata;
    }

}
