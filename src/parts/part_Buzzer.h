/* ########################################################################

   PICsimLab - PIC laboratory simulator

   ########################################################################

   Copyright (c) : 2019-2022  Luis Claudio Gambôa Lopes

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

   For e-mail suggestions :  lcgamboa@yahoo.com
   ######################################################################## */

#ifndef PART_BUZZER_H
#define PART_BUZZER_H

#include <lxrad.h>
#include "part.h"

#define PART_BUZZER_Name "Buzzer"

class cpart_Buzzer : public part {
public:
    lxString GetName(void) override { return lxT(PART_BUZZER_Name); };

    lxString GetAboutInfo(void) override { return lxT("L.C. Gamboa \n <lcgamboa@yahoo.com>"); };
    cpart_Buzzer(unsigned x, unsigned y);
    ~cpart_Buzzer(void);
    void Draw(void) override;
    void PreProcess(void) override;
    void Process(void) override;
    void PostProcess(void) override;
    void Stop(void) override;
    void ConfigurePropertiesWindow(CPWindow* WProp) override;
    void ReadPropertiesWindow(CPWindow* WProp) override;
    lxString WritePreferences(void) override;
    void ReadPreferences(lxString value) override;
    unsigned short get_in_id(char* name) override;
    unsigned short get_out_id(char* name) override;

private:
    void RegisterRemoteControl(void) override;
    void ChangeType(unsigned char tp);
    unsigned char active;
    unsigned char input_pins[1];
    lxaudio buzzer;
    long int mcount;
    int JUMPSTEPS_;
    unsigned char type;
    unsigned int samplerate;
    short* buffer;
    unsigned int buffersize;
    unsigned int buffercount;
    unsigned int maxv;
    unsigned char optone;
    unsigned int ctone;
    float ftone;
    float oftone;
    float in[3];
    float out[3];
    lxFont font;
    lxColor color1;
    lxColor color2;
};

#endif /* PART_BUZZER */
