package 
{

import mx.resources.ResourceBundle;

[ExcludeClass]

public class ja_JP$sparkEffects_properties extends ResourceBundle
{

    public function ja_JP$sparkEffects_properties()
    {
		 super("ja_JP", "sparkEffects");
    }

    override protected function getContent():Object
    {
        var content:Object =
        {
            "cannotOperateOn": "AnimateShaderTransition は、IUIComponent および GraphicElement インスタンスにのみ作用します。",
            "accDecWithinRange": "(加速 + 減速) は [0,1] の範囲内である必要があります。",
            "propNotPropOrStyle": "プロパティ {0} は、プロパティでもオブジェクト {1}: {2} のスタイルでもありません。",
            "cannotCalculateValue": "startValue ({0}) または endValue ({1}) が数値でない場合、インターポレーターでは補間値を計算できません。",
            "illegalPropValue": "不正なプロパティ値 : {0}。",
            "arraysNotOfEqualLength": "開始配列と終了配列は同じ長さである必要があります。",
            "endValContainsNonNums": "endValue 配列には非数値が含まれています : アニメーションにカスタムインターポレーターを指定する必要があります。",
            "startValContainsNonNums": "startValue 配列には非数値が含まれています : アニメーションにインターポレーターを指定する必要があります。"
        };
        return content;
    }
}



}
