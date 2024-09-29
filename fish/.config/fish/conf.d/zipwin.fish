# https://qiita.com/321shoot/items/6104da2c89265cf6b5e3
function zipwin
    if test -z "$argv[1]" || test "$argv[1]" = "."
        # 現在の作業ディレクトリをZIPファイルに圧縮する
        set zip_name (basename (pwd))".zip"
        fd --type file --strip-cwd-prefix . -X 7z a -tzip -scsWIN $zip_name {}
    else
        # 指定したディレクトリをZIPファイルに圧縮する
        set loc_dir (dirname $argv[1])
        set target (basename $argv[1])
        set zip_name (pwd)"/$target.zip"
        fd --type file --base-directory=$loc_dir . $target -X 7z a -tzip -scsWIN $zip_name {}
    end

    # 作成したZIPファイルに含まれるファイルを確認する。不要であればコメントアウトしてください。
    7z l $zip_name

    return 0
end
