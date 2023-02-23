package 
{

import mx.resources.ResourceBundle;

[ExcludeClass]

public class ja_JP$layout_properties extends ResourceBundle
{

    public function ja_JP$layout_properties()
    {
		 super("ja_JP", "layout");
    }

    override protected function getContent():Object
    {
        var content:Object =
        {
            "rowNotFound": "ConstraintRow \"{0}\" が見つかりませんでした。",
            "constraintLayoutNotVirtualized": "ConstraintLayout では、仮想化はサポートされません。",
            "basicLayoutNotVirtualized": "BasicLayout では、仮想化はサポートされません。",
            "columnNotFound": "ConstraintColumn \"{0}\" が見つかりませんでした。",
            "invalidIndex": "invalidIndex",
            "invalidBaselineOnRow": "行 {0} の無効なベースライン値 : \"{1}\"。数値または「maxAscent:x」の形式である必要があります。"
        };
        return content;
    }
}



}
