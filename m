Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624118;
	b=j6aXcS9XI6LQIDRiGpodCHuvBgDPD79Sx7NrJFBgY5Yc5BdN69NAad0p1GLTFrIuorBV
	 43/m926oXNIbXkhE8XDF/SlvlURJbbpINEaVQz0VJIJVmz/8ySZmMpdIGPqz54PRglAyn
	 X97/pozpS0xX0cWU/FUhUzmM4/2LHMYBUxdi/E4iIsrftZ7Lyb3ftae09hzYgZOrwXvDi
	 ORnTZ5dYkjgx+ty6VoXL8yvJdj8EoriiGmZZeX4QEo/ykg4ie70p6xYkjXpnqmamCXdoZ
	 WIVccjJdxQGfFqMhcvM6oK8areaU3gAMyR68kcRA0mWMRrDsXB5D88VEPuANz2GERmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=F33PfOK0msjzeBxtvP6gRqlD2SQxJhJCJJqwD2eVgsE=;
	b=UFVPUgc4/mkkaeyACPtUUF/PH/UuRalCmplXYLDUf5pw4iU2DdcXFprvRq/11bqP+TP/
	 2DENoFsAB8Dcsry+uEEtSX0byFA3P7Emnuqi+8Ez5ut3qW2zz6a5P8SaBUI9tbvXnQCwW
	 c7fbY3pME6BnNkW+PKW5H9H8UN31Qww1aF3lvdQUd3JsL+3sbh7d/SsfSKm7cApZTvBFS
	 LYqXIQgLOieGAhrz96/NtoZ31g2PFcja/mKGYq0NB1JleKOOWAFkazI0VDhJ5NuEr1gOa
	 XsliprNE4F18I5qQizUU8IRXa1qanQml8M+qQnk7P+lc2W6ug4TMu/O/0qIOcvlXoRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=h+qqryqR;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ACA606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 16:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3ACA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=h+qqryqR
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so51024965e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624116; x=1796228916; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F33PfOK0msjzeBxtvP6gRqlD2SQxJhJCJJqwD2eVgsE=;
        b=h+qqryqR1Ovck0gRlo++6eEZTK5bo9GLe5NEQZqXoHrOhbgTMx+7+kLiM7oJ82hjcJ
         T1Bje06ySXgrgS3zSGaElO5atTz+DzRWGZPZyH5sJ2pPJmegu+FS5Iv1IVsGrtBa1A0Z
         Mv2Lh1Ae1rqgL01kuX84mfvtSyTRGwEe6BNCEZY8vWhFBwRQf3K9Eu/x5NLCJ93GgxUC
         46radye/pBMsLpvuJKyy3jDA+P2lKff1EKXIo57raii3ROeQ36SckuZUSKC6DST1raiJ
         nWXWw9vvLUFiduK7SCy0Qh5sm0m70KZMMnwXOYyA7lh7qNwmKFBqXZY/GGDKfHoQBhMI
         yUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624116; x=1796228916;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F33PfOK0msjzeBxtvP6gRqlD2SQxJhJCJJqwD2eVgsE=;
        b=g7SuYahETjxOt3eKmzGUXHaMCTqjyGsH/7IQ6loov15QQjazVXdODq+ZqpOJ5ZhPkq
         I08uHTRUOKxAaXcVUUxUZkqVIfnd6f3IfjzGVd4PgtsFfWhheLAudrvYTcRFcm2C+cnl
         On0nf6Y0opdrnnARQ97dEi5C1nbFBVHRHXnmMLdYM/MOibFPMs7r2bfAOdwDb7UOadgq
         oh4QPBYuTOx/xieF5daQ2WaQA3B2D8ttJT8iB+cllp2iMvuxgH2dVa5KkhJhgiuWYLBC
         nOXbTGocVK/D7ihqx8dGallVFs43PpJ3SOMbkg/ZvyTH7FgFHUVGrrZp92Wa4S/UMwBl
         J6bg==
X-Forwarded-Encrypted: i=1; AL+hErGjLD7ghhaezi22eXzOEenqee5P0E8h8g4Qvot3mw/wF5LmAfpz3ULYtxY/jhyhYBmWQfZh90TEsnSrMLpp@vger.kernel.org
X-Gm-Message-State: APuU4Z8iZ2IIS/ui19xFiDmE9Ys9noOgFcLNtb1S13QvEJMA4n2gZAmd
	BoCci1ZPmb4WyZOQg3UZjdLAm79vDrr0nqBUMdFigY2VTnO2KDDgu/Z4Tg4DlvLn3QI=
X-Gm-Gg: AZFdTZdgIgOYF1UQ2Op+P29JKaOfsxmyHvMAmcBQbje0rTd7T1IZBRUnnz7PzqGsL1+
	wZ/YFf6FxgbOXnyVz06rau8ZolumNzSwJ1a9NqjvnMrFtx6+pWoFHXjMTYSgSmT77He+4VS+JrH
	3cjwVhdQwnkgW6y2W/pnNwWOwkXQ5NIwvfIhamIaPqIqWKMC8g3I9V1Fv0LvD5AgfCXAUsUUrSG
	TXMLLxc2nGf3ZB5XZx3dfirWJLvIIN6nGF486gh1B3mTGVHNyLTeuxVG5eVau+nEy/AI+orMHi2
	RBleM4ecNCZKsfUJ6wX8vDllxkzU4sTsAdw2DhfHpmWUeH/0QAqnl9D7w4Kst0cvZ9sQokXEWNr
	z1zfAdwiTzhoWT6fQGjP5wNWEOlKO1/mHEOEQc9+sFUwWFhaifJXOZQF+xee0nUsyM0DDOEByaI
	F8dO6vpZkaKNwL4swclQgjQc0jsBxrqFVCrx4+zZD99p0XfNFNVwLANBXqN85UotTH5VH1j43ca
	WzHo47ngOdOx/Gga5snxGtuKiDw/M7ddqG9wBDKKLbhDlfQ3YoidjWt8yPDabKjy0wHWz8wIpKB
	yjWsMm8KC+qQpKbqtSMjJjDAdX+GyZek6RSdcQ0kswQ9J/r8v8R+B6ioe5+IJkIvYLk=
X-Received: by 2002:a05:600c:5395:b0:4a3:5a98:c279 with SMTP id 5b1f17b1804b1-4bb8880e599mr376023745e9.8.1795624116009;
        Wed, 25 Nov 2026 08:28:36 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:35 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH 00/10] mtd: use desginated initializers in *_device_id
 arrays
Date: Wed, 25 Nov 2026 16:28:26 +0000
Message-Id: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqAIBCF4avErBPUSqirRAvTqSbIQi2C6O5ZL
 T/437sgoCcM0GQXeDwo0OoSRJ6BmbQbkZFNBsmlEkIWTJuN2BIt4zgoXXHLy9pCyjePA53fVdv
 9Dns/o4nvHu77AVc++4JsAAAA
X-Change-ID: 20261123-acpi-mtd-0ef6a50d049d
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Joern Engel <joern@lazybastard.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Han Xu <han.xu@nxp.com>, Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=7528;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=5meG2QA5zHmWMtBw+F49CrqQgn4FVKx2LdaJonRgfn8=;
 b=VsRd3x/iYztgIPcpTxO4VQupjJr1Sy2+c/9eTKQar8LJIPG9KJ1ebtAJORbrWf8vSzuEg1YpX
 faQork5qqUYCOdbRXiu56hLw5mIk8BvbvFb2W3hRkqwPWXFxr+5Gj8A
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

This series is converting lists that contain the *_device_id structs,
to make use of named initializers (which they do not use currently).
This work is part of the on going effort in the kernel associated with
device-ids [1]

The plan is to convert *_device_id::driver_data to have an anonymous
union, like it was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces for that field.
This effort is split per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member (which is not needed in the mtd subsystem)

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

Patches 1-3 implement the named initializer change.
Patched 4-10 are just churn to unify the list termination and can be dropped.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
Pawel Zalewski (10):
      mtd: maps: pismo: Use named initializers for i2c_device_id
      mtd: spi-nor: Use named initializers for spi_device_id
      mtd: maps: int0800: Use named initializers for acpi_device_id
      mtd: spi-nor: Unify of_device_id list terminator
      mtd: devices: Unify *_device_id list terminator.
      mtd: nand: raw: Unify list terminator for *_device_id lists
      mtd: hyperbus: Unify list terminator for *_device_id lists
      mtd: maps: Unify list terminator for of_device_id lists
      mtd: nand: Unify list terminator for *_device_id lists
      mtd: parsers: Unify list terminator for of_device_id lists

 drivers/mtd/devices/docg3.c                        |  2 +-
 drivers/mtd/devices/mchp23k256.c                   |  4 +-
 drivers/mtd/devices/mchp48l640.c                   |  4 +-
 drivers/mtd/devices/mtd_dataflash.c                |  8 +--
 drivers/mtd/devices/mtd_intel_dg.c                 |  4 +-
 drivers/mtd/devices/phram.c                        |  2 +-
 drivers/mtd/devices/powernv_flash.c                |  2 +-
 drivers/mtd/devices/spear_smi.c                    |  2 +-
 drivers/mtd/devices/st_spi_fsm.c                   |  2 +-
 drivers/mtd/hyperbus/hbmc-am654.c                  |  2 +-
 drivers/mtd/hyperbus/rpc-if.c                      |  2 +-
 drivers/mtd/maps/int0800.c                         |  2 +-
 drivers/mtd/maps/lantiq-flash.c                    |  2 +-
 drivers/mtd/maps/physmap-versatile.c               |  4 +-
 drivers/mtd/maps/pismo.c                           |  4 +-
 drivers/mtd/maps/sun_uflash.c                      |  2 +-
 drivers/mtd/nand/ecc-mtk.c                         |  2 +-
 drivers/mtd/nand/ecc-mxic.c                        |  2 +-
 drivers/mtd/nand/ecc-realtek.c                     |  2 +-
 drivers/mtd/nand/onenand/onenand_omap2.c           |  2 +-
 drivers/mtd/nand/onenand/onenand_samsung.c         |  3 +-
 drivers/mtd/nand/raw/ams-delta.c                   |  7 +-
 drivers/mtd/nand/raw/arasan-nand-controller.c      |  2 +-
 drivers/mtd/nand/raw/atmel/nand-controller.c       |  4 +-
 drivers/mtd/nand/raw/atmel/pmecc.c                 |  4 +-
 drivers/mtd/nand/raw/brcmnand/bcm6368_nand.c       |  2 +-
 drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c        |  2 +-
 drivers/mtd/nand/raw/brcmnand/brcmnand.c           |  2 +-
 drivers/mtd/nand/raw/brcmnand/brcmstb_nand.c       |  2 +-
 drivers/mtd/nand/raw/brcmnand/iproc_nand.c         |  2 +-
 drivers/mtd/nand/raw/cadence-nand-controller.c     |  3 +-
 drivers/mtd/nand/raw/davinci_nand.c                |  2 +-
 drivers/mtd/nand/raw/denali_dt.c                   |  2 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c               |  2 +-
 drivers/mtd/nand/raw/fsl_ifc_nand.c                |  2 +-
 drivers/mtd/nand/raw/fsl_upm.c                     |  2 +-
 drivers/mtd/nand/raw/fsmc_nand.c                   |  2 +-
 drivers/mtd/nand/raw/gpio.c                        |  2 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c         |  2 +-
 drivers/mtd/nand/raw/hisi504_nand.c                |  2 +-
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c    |  2 +-
 drivers/mtd/nand/raw/ingenic/jz4725b_bch.c         |  2 +-
 drivers/mtd/nand/raw/ingenic/jz4740_ecc.c          |  2 +-
 drivers/mtd/nand/raw/ingenic/jz4780_bch.c          |  2 +-
 drivers/mtd/nand/raw/intel-nand-controller.c       |  2 +-
 drivers/mtd/nand/raw/loongson-nand-controller.c    |  2 +-
 drivers/mtd/nand/raw/lpc32xx_mlc.c                 |  2 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c                 |  2 +-
 drivers/mtd/nand/raw/marvell_nand.c                |  4 +-
 drivers/mtd/nand/raw/meson_nand.c                  |  2 +-
 drivers/mtd/nand/raw/mpc5121_nfc.c                 |  2 +-
 drivers/mtd/nand/raw/mtk_nand.c                    |  2 +-
 drivers/mtd/nand/raw/mxc_nand.c                    |  2 +-
 drivers/mtd/nand/raw/mxic_nand.c                   |  2 +-
 drivers/mtd/nand/raw/ndfc.c                        |  2 +-
 .../mtd/nand/raw/nuvoton-ma35d1-nand-controller.c  |  2 +-
 drivers/mtd/nand/raw/omap_elm.c                    |  2 +-
 drivers/mtd/nand/raw/orion_nand.c                  |  2 +-
 drivers/mtd/nand/raw/pasemi_nand.c                 |  2 +-
 drivers/mtd/nand/raw/pl35x-nand-controller.c       |  2 +-
 drivers/mtd/nand/raw/plat_nand.c                   |  2 +-
 drivers/mtd/nand/raw/qcom_nandc.c                  |  2 +-
 drivers/mtd/nand/raw/rockchip-nand-controller.c    |  2 +-
 drivers/mtd/nand/raw/sh_flctl.c                    |  2 +-
 drivers/mtd/nand/raw/socrates_nand.c               |  2 +-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c             |  2 +-
 drivers/mtd/nand/raw/sunxi_nand.c                  |  2 +-
 drivers/mtd/nand/raw/technologic-nand-controller.c |  2 +-
 drivers/mtd/nand/raw/tegra_nand.c                  |  2 +-
 drivers/mtd/nand/raw/vf610_nfc.c                   |  2 +-
 drivers/mtd/nand/raw/xway_nand.c                   |  2 +-
 drivers/mtd/nand/spi/core.c                        |  4 +-
 drivers/mtd/parsers/afs.c                          |  2 +-
 drivers/mtd/parsers/bcm47xxpart.c                  |  2 +-
 drivers/mtd/parsers/bcm63xxpart.c                  |  2 +-
 drivers/mtd/parsers/brcm_u-boot.c                  |  2 +-
 drivers/mtd/parsers/parser_imagetag.c              |  2 +-
 drivers/mtd/parsers/parser_trx.c                   |  2 +-
 drivers/mtd/parsers/qcomsmempart.c                 |  2 +-
 drivers/mtd/parsers/redboot.c                      |  2 +-
 drivers/mtd/parsers/scpart.c                       |  2 +-
 drivers/mtd/parsers/tplink_safeloader.c            |  2 +-
 drivers/mtd/spi-nor/controllers/hisi-sfc.c         |  2 +-
 drivers/mtd/spi-nor/controllers/nxp-spifi.c        |  2 +-
 drivers/mtd/spi-nor/core.c                         | 77 +++++++++++++++-------
 85 files changed, 153 insertions(+), 123 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-acpi-mtd-0ef6a50d049d

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

