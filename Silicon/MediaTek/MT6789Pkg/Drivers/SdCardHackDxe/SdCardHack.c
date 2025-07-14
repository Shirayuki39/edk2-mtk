#include <Library/UefiBootServicesTableLib.h>
#include <Library/DebugLib.h>
#include <Protocol/MtkGpio.h>

MTK_GPIO *MtkGpio;

VOID
ConfigureMSDCGpios ()
{
  UINT8 Pin;

  /* MT6789 MSDC1 Gpios:
   * GPIO71:    CLK
   * GPIO72:    CMD
   * GPIO73-76: DAT0-3
   */

  for (Pin = 71; Pin <= 76; Pin++) {
    MtkGpio->SetMode (Pin, GPIO_MODE_SPECIAL_FUNCTION_1);

    MtkGpio->SetDrv (Pin, 3);
    MtkGpio->SetR0 (Pin);

    if (Pin == 71) {
      MtkGpio->SetPupd (Pin, MTK_GPIO_PULL_DOWN);
    } else {
      MtkGpio->SetPupd (Pin, MTK_GPIO_PULL_UP);
    }
  }
}

EFI_STATUS
EFIAPI
SdCardHackDxeEntry (
  IN EFI_HANDLE ImageHandle,
  IN EFI_SYSTEM_TABLE *SystemTable
  )
{
  EFI_STATUS           Status;

  Status = gBS->LocateProtocol (&gMtkGpioProtocolGuid, NULL, (VOID **)&MtkGpio);
  if (EFI_ERROR (Status)) {
    DEBUG ((DEBUG_ERROR, "SdCardHackDxe: Failed to locate gpio protocol, Status = %r\n", Status));
    return Status;
  }

  ConfigureMSDCGpios ();

  return Status;
}