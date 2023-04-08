Table 50001 "Vehicle Consumption Detail"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
        }
        field(2;"Vehicle Code";Code[20])
        {
        }
        field(3;"Item No.";Code[20])
        {
        }
        field(4;Quantity;Decimal)
        {
        }
        field(5;"Starting KM";Decimal)
        {
        }
        field(6;"Ending KM";Decimal)
        {
        }
        field(7;UOM;Code[20])
        {
        }
        field(8;"Driver Code";Code[20])
        {
        }
        field(9;"Driver Name";Text[50])
        {
        }
        field(10;"Posting Date";Date)
        {
        }
        field(11;"Document No.";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            Clustered = true;
        }
        key(Key2;"Vehicle Code")
        {
        }
    }

    fieldgroups
    {
    }
}

