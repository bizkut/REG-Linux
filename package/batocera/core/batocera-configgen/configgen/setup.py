#!/usr/bin/env python

from distutils.core import setup
setup(name='batocera-configgen',
      version='1.0',
      py_modules=['configgen'],
      packages=[
        'configgen',
        'configgen.generators',
        'configgen.generators.libretro',
        'configgen.generators.moonlight',
        'configgen.generators.mupen',
        'configgen.generators.scummvm',
        'configgen.generators.dosbox',
        'configgen.generators.dosboxstaging',
        'configgen.generators.dosboxx',
        'configgen.generators.vice',
        'configgen.generators.fsuae',
        'configgen.generators.amiberry',
        'configgen.generators.ppsspp',
        'configgen.generators.flycast',
        'configgen.generators.dolphin',
        'configgen.generators.dolphin_triforce' ,
        'configgen.generators.pcsx2',
        'configgen.generators.play',
        'configgen.generators.rpcs3',
        'configgen.generators.lime3ds',
        'configgen.generators.citra',
        'configgen.generators.hypseus_singe',
        'configgen.generators.cannonball',
        'configgen.generators.sdlpop',
        'configgen.generators.openbor',
        'configgen.generators.wine',
        'configgen.generators.cemu',
        'configgen.generators.melonds',
        'configgen.generators.pygame',
        'configgen.generators.mame',
        'configgen.generators.devilutionx',
        'configgen.generators.hatari',
        'configgen.generators.tsugaru',
        'configgen.generators.solarus',
        'configgen.generators.easyrpg',
        'configgen.generators.redream',
        'configgen.generators.supermodel',
        'configgen.generators.xash3d_fwgs',
        'configgen.generators.mugen',
        'configgen.generators.fpinball',
        'configgen.generators.tsugaru',
        'configgen.generators.ruffle',
        'configgen.generators.lightspark',
        'configgen.generators.duckstation',
        'configgen.generators.duckstation_legacy',
        'configgen.generators.drastic',
        'configgen.generators.xemu',
        'configgen.generators.cgenius',
        'configgen.generators.flatpak',
        'configgen.generators.steam',
        'configgen.generators.ecwolf',
        'configgen.generators.lexaloffle',
        'configgen.generators.model2emu',
        'configgen.generators.sonicretro',
        'configgen.generators.gsplus',
        'configgen.generators.fba2x',
        'configgen.generators.suyu',
        'configgen.generators.ryujinx',
        'configgen.generators.samcoupe',
        'configgen.generators.abuse',
        'configgen.generators.cdogs',
        'configgen.generators.hcl',
        'configgen.generators.hurrican',
        'configgen.generators.openjazz',
        'configgen.generators.tyrian',
        'configgen.generators.openmsx',
        'configgen.generators.demul',
        'configgen.generators.xenia',
        'configgen.generators.odcommander',
        'configgen.generators.gzdoom',
        'configgen.generators.eduke32',
        'configgen.generators.raze',
        'configgen.generators.vita3k',
        'configgen.generators.ikemen',
        'configgen.generators.bigpemu',
        'configgen.generators.pyxel',
        'configgen.generators.ioquake3',
        'configgen.generators.thextech',
        'configgen.generators.vpinball',
        'configgen.generators.applewin',
        'configgen.generators.corsixth',
        'configgen.generators.stella',
        'configgen.generators.theforceengine',
        'configgen.generators.iortcw',
        'configgen.generators.fallout1',
        'configgen.generators.fallout2',
        'configgen.generators.dxx_rebirth',
        'configgen.generators.etlegacy',
        'configgen.generators.sonic3_air',
        'configgen.generators.sonic_mania',
        'configgen.generators.uqm',
        'configgen.generators.sh',
        'configgen.settings',
        'configgen.utils',
        ],
        package_data={
          'configgen.generators.xash3d_fwgs': ['gamepad.cfg'],
        },
      )
