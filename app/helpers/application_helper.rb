module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
    when :notice
      "success"   # 成功時のメッセージには "alert-success" クラスを適用
    when :alert
      "danger"    # エラーメッセージには "alert-danger" クラスを適用
    else
      "info"      # その他のメッセージには "alert-info" クラスを適用
    end
  end
end
