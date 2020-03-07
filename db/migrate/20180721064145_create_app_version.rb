class CreateAppVersion < ActiveRecord::Migration[5.1]
  def change
    create_table :app_versions do |t|
      t.string  'platform', default: 'ios', comment: 'ios 平台或 android平台'
      t.string  'version', comment: '版本号'
      t.boolean 'force_upgrade', default: false, comment: '是否强制升级'
      t.string  'title', comment: '更新标题'
      t.string  'content', comment: '更新内容'
      t.string  'download_url', comment: '下载链接'
      t.timestamps
    end
  end
end
