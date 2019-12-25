# Author: Qt君
# QQ交流群: 732271126
# AUTHOR_INFO: 扫码关注微信公众号: [Qt君] 获取最新推送.
#██████████████    ██      ██████████████    ██████████████
#██          ██  ████  ████    ██  ██        ██          ██
#██  ██████  ██    ██████              ██    ██  ██████  ██
#██  ██████  ██  ████  ██    ████████    ██  ██  ██████  ██
#██  ██████  ██      ██  ██      ██    ████  ██  ██████  ██
#██          ██  ██  ██      ████    ██  ██  ██          ██
#██████████████  ██  ██  ██  ██  ██  ██  ██  ██████████████
#                        ██  ██████  ██████
#██████████  ██████████  ██  ████████████  ██  ██  ██  ██
#      ██        ████        ██  ██    ██  ████████      ██
#  ██  ██  ████  ████  ████████████  ██  ██  ██████
#    ██████        ██████        ██  ██  ██████        ██
#      ██████████  ██  ██  ██  ██  ██  ██  ██      ████
#                ██  ██  ██████  ████  ████████████  ██  ██
#████  ██████████    ██        ████  ██  ██  ██  ██  ██
#████    ████      ████  ██  ██████  ██████████        ██
#  ██  ████  ██    ████  ██████    ██  ██      ██    ██
#████████      ██  ██      ████  ██    ████  ██████████  ██
#██    ████  ████  ██  ████    ████      ████  ████████
#██  ████  ██  ██      ██      ████    ██              ██
#██  ██████  ████    ████  ██████████    ██████████  ██████
#                ████    ████  ████  ██  ██      ██████████
#██████████████  ████        ██████    ████  ██  ██████
#██          ██    ████  ██  ██████  ██████      ████    ██
#██  ██████  ██  ████    ████  ██  ██    ██████████████████
#██  ██████  ██  ████        ██████████  ██        ██  ████
#██  ██████  ██  ██  ██████    ██  ████████  ████████████
#██          ██  ██    ██    ████    ██  ████  ██████  ██
#██████████████  ██████████      ██            ████  ██

QMAKE_DIR = $$replace(QMAKE_QMAKE, ^(\S*/)\S+$, \1) # 获取QMake执行文件所在的目录

if (!isEmpty(DESTDIR)) {
    TARGET_OUT_DIR = $$OUT_PWD/$$DESTDIR/
}
else {
    # 判断时debug版本还是release版本
    CONFIG(debug, debug|release) {
        TARGET_OUT_DIR = $${OUT_PWD}/debug/
        DEPLOY_OPTIONS += --debug
    }
    else {
        TARGET_OUT_DIR = $${OUT_PWD}/release/
        DEPLOY_OPTIONS += --release
    }
}

message(TARGET_OUT_DIR: $$TARGET_OUT_DIR) # 生成文件的输出目录

win32 {
    WIN_DEPLOY_BIN = $${QMAKE_DIR}windeployqt.exe # 拼接Qt部署程序的文件(windows平台下为windeployqt.exe)
    QMAKE_POST_LINK += $$WIN_DEPLOY_BIN $$DEPLOY_OPTIONS $$TARGET_OUT_DIR$${TARGET}.exe  # 编译完成后执行打包命令
#    QMAKE_POST_LINK += && start $$TARGET_OUT_DIR # 打包完成后自动打开目标路径
}

message(QMAKE_POST_LINK: $$QMAKE_POST_LINK) # 打印命令
