Table 50003 "Customer Complaint Register"
{
    DataCaptionFields = "Complaint Type", "Customer Code";

    fields
    {
        field(1; "Complaint Number"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Date of Complaint"; Date)
        {
        }
        field(3; "Complaint Type"; Code[20])
        {
            //TableRelation = Table50014.Field1; //TODO
        }
        field(4; "Customer Code"; Code[20])
        {
            TableRelation = Customer."No.";
        }
        field(5; "Complained by (Person)"; Text[30])
        {
        }
        field(6; "Description of Complaint"; Text[250])
        {
        }
        field(7; "Complaint Received by"; Text[30])
        {
        }
        field(8; "Recommended Resolution"; Text[250])
        {
        }
        field(9; "Complaint Resolved"; Boolean)
        {
        }
        field(10; "Date of Resolution"; Date)
        {

            trigger OnValidate()
            begin
                if ("Date of Resolution" < "Date of Complaint") then
                    Error('Date of Resolution cannot be before Date of Complaint');

                "No. of Days" := ("Date of Resolution" - "Date of Complaint");
                Modify;
            end;
        }
        field(11; "Resolved / Authorized by"; Text[30])
        {
        }
        field(12; Comments; Text[250])
        {
        }
        field(13; "No. of Days"; Decimal)
        {
            DecimalPlaces = 0 : 1;
        }
    }

    keys
    {
        key(Key1; "Date of Complaint", "Customer Code", "Complaint Type")
        {
            Clustered = true;
        }
        key(Key2; "Complaint Number")
        {
        }
        key(Key3; "Date of Resolution")
        {
        }
        key(Key4; "Complaint Type")
        {
        }
    }

    fieldgroups
    {
    }
}

