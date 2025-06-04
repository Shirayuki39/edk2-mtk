## @file
#
#  Copyright (c) 2011-2015, ARM Limited. All rights reserved.
#  Copyright (c) 2014, Linaro Limited. All rights reserved.
#  Copyright (c) 2015 - 2016, Intel Corporation. All rights reserved.
#  Copyright (c) 2018 - 2019, Bingxing Wang. All rights reserved.
#  Copyright (c) 2022, Xilin Wu. All rights reserved.
#
#  SPDX-License-Identifier: BSD-2-Clause-Patent
#
##

################################################################################
#
# Defines Section - statements that will be processed to create a Makefile.
#
################################################################################

[Defines]
  SOC_PLATFORM            = mt8183
  USE_PHYSICAL_TIMER      = TRUE

!include MediaTekPkg/MediaTekCommonDsc.inc

[PcdsFixedAtBuild.common]
  gArmTokenSpaceGuid.PcdArmArchTimerFreqInHz|13000000
  gArmTokenSpaceGuid.PcdArmArchTimerSecIntrNum|13
  gArmTokenSpaceGuid.PcdArmArchTimerIntrNum|14
  gArmTokenSpaceGuid.PcdArmArchTimerVirtIntrNum|11
  gArmTokenSpaceGuid.PcdArmArchTimerHypIntrNum|10
  gArmTokenSpaceGuid.PcdGicDistributorBase|0x0c000000
  gArmTokenSpaceGuid.PcdGicRedistributorsBase|0x0c100000
  gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiDefaultOemRevision|0x00000850

  gArmPlatformTokenSpaceGuid.PcdCoreCount|8
  gArmPlatformTokenSpaceGuid.PcdClusterCount|2

[LibraryClasses.common]
  KeypadDeviceImplLib|MT8183Pkg/Library/KeypadDeviceImplLib/KeypadDeviceImplLib.inf
  PlatformPeiLib|MT8183Pkg/Library/PlatformPeiLib/PlatformPeiLib.inf
  PlatformPrePiLib|MT8183Pkg/Library/PlatformPrePiLib/PlatformPrePiLib.inf
  MtkGpioImplLib|MT8183Pkg/Library/MtkGpioImplLib/MtkGpioImplLib.inf

[Components.common]
  MediaTekPkg/Drivers/MtkGpioDxe/MtkGpioDxe.inf
