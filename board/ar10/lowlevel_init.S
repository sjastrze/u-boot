
/*
 *  Memory sub-system initialization code for INCA-IP2 development board.
 *  Andre Messerschmidt
 *  Copyright (c) 2005  Infineon Technologies AG 
 *
 *  Based on Inca-IP code 
 *  Copyright (c) 2003  Wolfgang Denk <wd@denx.de>
 *
 * See file CREDITS for list of people who contributed to this
 * project.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
 * MA 02111-1307 USA
 */
/* History:
      Wu Qi Ming Sep 18, 2009 initial version
 */
#include <config.h>
#include <version.h>
#include <asm/regdef.h>


  .set  noreorder

/*
 * void cgu_init(long)
 */
  .globl  cgu_init
  .ent  cgu_init
cgu_init:
	
wait_reset:
    b   wait_reset
    nop
    .end  cgu_init



/*
 * void ddrram_init(long)
 */
  .globl  ddrram_init
  .ent  ddrram_init
ddrram_init:

   .end ddrram_init
   
  .globl  lowlevel_init
  .ent  lowlevel_init
lowlevel_init:
  /* EBU, CGU and SDRAM/DDR-RAM Initialization.
   */
  move  t0, ra

    bal cgu_init
    nop
 
  bal ddrram_init
  nop


ddr_init_finish:
  move  ra, t0
  j ra
  nop

  .end  lowlevel_init
