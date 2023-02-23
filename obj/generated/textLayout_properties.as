package 
{

import mx.resources.ResourceBundle;

[ExcludeClass]

public class ja_JP$textLayout_properties extends ResourceBundle
{

    public function ja_JP$textLayout_properties()
    {
		 super("ja_JP", "textLayout");
    }

    override protected function getContent():Object
    {
        var content:Object =
        {
            "badRemoveChild": "削除する子が見つかりません",
            "badReplaceChildrenIndex": "FlowGroupElement.replaceChildren のインデックスが範囲外です",
            "missingTextFlow": "解析する TextFlow がありません",
            "unexpectedNamespace": "名前空間 {0} は予期しない値です",
            "badMXMLChildrenArgument": "mxmlChildren に {0} タイプの不正なエレメントが渡されました",
            "invalidReplaceTextPositions": "SpanElement.replaceText に無効な位置が渡されました",
            "invalidSplitAtPosition": "splitAtPosition のパラメーターが無効です",
            "badSurrogatePairCopy": "SpanElement.shallowCopy のサロゲートペアの半分のみをコピーしています",
            "invalidChildType": "親になれないタイプの NewElement です",
            "unknownAttribute": "属性 {0} はエレメント {1} では使用できません",
            "invalidSurrogatePairSplit": "サロゲートペアの分割が無効です",
            "expectedExactlyOneTextLayoutFormat": "{0} には TextLayoutFormat が 1 つだけ必要です\t",
            "invalidFlowElementConstruct": "無効な FlowElement サブクラスを作成しようとしました",
            "malformedTag": "タグ {0} の形式が不適切です",
            "missingStringResource": "リソース {0} のストリングがありません",
            "invalidSplitAtIndex": "splitAtIndex のパラメーターが無効です",
            "illegalOperation": "不正な {0} 操作を実行しようとしています",
            "malformedMarkup": "マークアップ {0} の形式が不適切です",
            "unexpectedXMLElementInSpan": "span 内で予期しないエレメント {0} が見つかりました",
            "badPropertyValue": "プロパティ {0} の値 {1} は範囲外です",
            "badShallowCopyRange": "shallowCopy の範囲が正しくありません",
            "unknownElement": "エレメント {0} は不明です"
        };
        return content;
    }
}



}
