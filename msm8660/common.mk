#Common headers
common_includes := hardware/qcom/display/msm8660/libgralloc
common_includes += hardware/qcom/display/msm8660/liboverlay
common_includes += hardware/qcom/display/msm8660/libcopybit
common_includes += hardware/qcom/display/msm8660/libqdutils
common_includes += hardware/qcom/display/msm8660/libhwcomposer
common_includes += hardware/qcom/display/msm8660/libexternal
common_includes += hardware/qcom/display/msm8660/libqservice

common_header_export_path := qcom/display

#Common libraries external to display HAL
common_libs := liblog libutils libcutils libhardware

#Common C flags
common_flags := -DDEBUG_CALC_FPS -Wno-missing-field-initializers
common_flags += -Werror -Wno-unused-parameter

ifeq ($(ARCH_ARM_HAVE_NEON),true)
    common_flags += -D__ARM_HAVE_NEON
endif

ifneq ($(filter msm8974 msm8x74 msm8226 msm8x26,$(TARGET_BOARD_PLATFORM)),)
    common_flags += -DVENUS_COLOR_FORMAT
    common_flags += -DMDSS_TARGET
endif

common_deps  :=
kernel_includes :=

# Executed only on QCOM BSPs
#ifeq ($(call is-vendor-board-platform,QCOM),true)
    common_deps += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
    kernel_includes += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
#endif
