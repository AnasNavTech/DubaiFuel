TableExtension 50008 tabExtSalesShipmentLine extends "Sales Shipment Line"
{
    fields
    {
        field(50002; "Print Item Description"; Text[30])
        {
        }
        field(50003; Cancelled; Boolean)
        {
            Description = '//GTFSDFPC1.00-Biswajit-03.05.11';
        }
        field(50010; "Print Item Code"; Code[20])
        {
        }
        field(50021; "Vehicle Code"; Code[20])
        {
            Description = '//GTFSDFPC1.00-Biswajit-08.05.11';
        }
        field(50022; "Driver No."; Code[20])
        {
            Description = '//GTFSDFPC1.00-Biswajit-08.05.11';
        }
        field(50023; "Driver Name"; Text[50])
        {
            Description = '//GTFSDFPC1.00-Biswajit-08.05.11';
        }
    }
    keys
    {
        key(Key1001; "No.", "Shipment Date")
        {
        }
    }
}

