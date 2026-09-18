Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B746343D8A
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789736522; cv=none; b=Sm5jsK/NDduNytU82t/4xP2QuQj0SyL2zqVLPArxeqeX83Nc8Kv7kX7fV/Fls70PfhYm5fjBRjkjr/FZ+avGEazd3EkdRJfSjtze5v17kTWlMK3lSSPW3WlLGBWN2jRTIl2gstiWHRldR6UVqAJbZCYEd9sW6yCSSPib0Lwu5/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789736522; c=relaxed/simple;
	bh=JzY7qCjsMGCCDrnykYP+j+8saSrI+L+fwV77wWEiOrQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k791rlVhHDK20+6n1ypUQ1bFFa3KEOJfMJkY5pxaoMnz9AddTsQMNqrQX6sc1/WBvGjssu7fKpUJhr5L2n67krbr74EUWJSxEEVvdx9gZP8+SuWlDvq5cPH2FPM/oeyF5+L20hCs1BinzMbE+lidpC5lM1c65R//H1QGp5E9Bv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=y4vzGfwH; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="y4vzGfwH"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so4114725e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 06:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789736518; x=1790341318; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MGji7N6SbnVIadV5bhhuwD8KcQaMiAzmz+Si29Ez/Z4=;
        b=y4vzGfwHUASPzYUHOfNlprsMChiCOWrpCugsxLijRb6exUrMq5B4DQCYljXLjoYnVD
         XeGGu8ICy+irHISjKMXWwP7uDG4WWxpkWeoBBL3Uau6CxVapA/tgiF/YZ1ElzF5T7btH
         /6xlb+Ygh0bD+eaD2UiypLdRhK/IpG8GpDBqm7XUTxoatB7Ht4znflGfWddEWjMNL+Hk
         +cf7lPVXZjkrjZFi8D3EtPUBzYE9xLaz97mxl9/uzpAWaLZM2DxZZLnCcUGL6MsdTswb
         9VLNACTk/bZq3ZojRu0Fz7IFZzuo+530aEz3fIXGahRGCHs5je+GQo25ill+PJPVt+RB
         2VbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789736518; x=1790341318;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MGji7N6SbnVIadV5bhhuwD8KcQaMiAzmz+Si29Ez/Z4=;
        b=x+AcZiEBy7PcpB9G6bIGEDpkPp9nxGL86nEpLIBh/gD51Y+6g8b/wBTkbKxrUUS/gI
         HxZ+JVGsyOXdZ/jWSt6y2g8f3n8VHqctpCGYxV0ZukOFLWUv33G2Xj09s5X8gXDqdu8P
         QCCHJNI0Br42e6+OSl/FR7bWpCup15c/kUSInYFKIpCEMGbe1+kU6NHGoV4EWgw+h8r3
         6bCQI6PTXd0Qc+mJN4tcCwaTdN9bH/cG+peijbrrALB9L/1B1l7kPtIj5F7Bc2yrxsKv
         JGeCji16HME6MSBzWlXgRIAhfyVlh8Lbc4q6mztjj2xVZ/Q8506rDtWgWurH6g2WaLwX
         RGoQ==
X-Forwarded-Encrypted: i=1; AKwUvByMc0ncUIaixaYBhwqK7nEQ7VQELEKkouzSX71mcGZUna35/T8GLKVxFVs7Q0gWr2elzXixIjVkfEcMWbQS@vger.kernel.org
X-Gm-Message-State: AFuF++nHgZ/S3y14KkhW5lynrWWUPefSoex5qNVGgYbAHY0Rmc+gfZQ9
	ZInJU9P/TY+aJf6uXWrXkMv+GKNBCb3jdwLnLMA8B1amt6KnmrK7IblqknwqeKHKlVr6vOR5Bnx
	ZSaGHnC/+Og==
X-Gm-Gg: AYBFou1yIXNF2JDuRdyHLEqrXnZcZNz5eZuhFaI+YFodOJzem5hpv9sTWiDidDaZiZ8
	cjZqtnrGE/rVEZxmNVYS9zfo8v8qtt8iMoIMm6kczTNTM0/aKmjDG37XSrlgkzU4YAyDAhzAg2h
	d0SXlHJJCqrhkHlU1SWZoX1vrdCzbviK6SEM/EYCgB5U56MEA8bZrytgHxfPECGJtbTTBc6CSaV
	RUSMIrvkDnYfqIicS1+Q0p7xraiySpvVxeO4qy9VATykx3RhsoT96kG0bKWAVn1pFhbdlFFccyQ
	e7+J2QBY1Zt8JE8rT9J0dyEQhcgtb8RA/TIWJ8c/2rFaev3F5aEjihBf5fP/AwllpmnbzMzFRJ0
	w9MeLo4chea3XfHNJXux+DQFSEk9BYn2I9eSJicfJBEU7ZfZON12sFqkzEJIlLSHKjxwGAUpht7
	n4aiyCS9XjYdLhC77pTV0fGY5Ut+iluQT+4O9CfcTb638igi5ugQvRkbh7A+rjo8MK7HQsHTTBS
	bqaPRR2cwDeOX720Dg+COk5Zw==
X-Received: by 2002:a05:600c:8b21:b0:49d:1df8:156d with SMTP id 5b1f17b1804b1-49fc574f001mr30144785e9.18.1789736518421;
        Fri, 18 Sep 2026 06:01:58 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:767:e33f:e8e7:bc85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24034esm188663345e9.15.2026.09.18.06.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:01:57 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH 0/2] i2c: use designated initializers for acpi_device_id
Date: Fri, 18 Sep 2026 14:01:49 +0100
Message-Id: <20260918-acpi-i2c-v1-0-caf4bea4886c@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD02rWoC/yXMQQ5AMBCF4avIrDVpSxRXEYsaU8YCaRGJuLti+
 SX/excE8kwB6uQCTwcHXuYIlSaAo50HEtxHg5a6kJUywuLKgjWKXFUlllnvjCGI+erJ8fldNe3
 vsHcT4fbu4b4fJiVLhWwAAAA=
X-Change-ID: 20260917-acpi-i2c-4198c83df77e
To: Andi Shyti <andi.shyti@kernel.org>, 
 Mika Westerberg <westeri@kernel.org>, 
 Shyam Sundar S K <shyam-sundar.s-k@amd.com>, 
 Elie Morisse <syniurge@gmail.com>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Devyn Liu <liudingyuan@h-partners.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, 
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Hu <hanshu@zhaoxin.com>, 
 George Cherian <gcherian@marvell.com>
Cc: linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789736516; l=3020;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=JzY7qCjsMGCCDrnykYP+j+8saSrI+L+fwV77wWEiOrQ=;
 b=IDSzYBmue84R08QroUyy3NH/AxpYxihKb9K2xhN1QPp93+Ogye+hBhK4mHIOdf1zDUyhK9Zvj
 Ey74QzEBKIGB05J6xZ7TUIbv5ZKaL/sgYUsp72oIXBPUQ/meroTQnXV
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore,
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

Tested builds on x86-64 and a64 in Yocto using 7.3-rc3.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
Pawel Zalewski (2):
      i2c: i2c-core-acpi: use named initializers for acpi_device_id
      i2c: busses: use named initializers for acpi_device_id

 drivers/i2c/busses/i2c-amd-asf-plat.c       |  2 +-
 drivers/i2c/busses/i2c-amd-mp2-plat.c       |  2 +-
 drivers/i2c/busses/i2c-cros-ec-tunnel.c     |  2 +-
 drivers/i2c/busses/i2c-designware-platdrv.c | 42 ++++++++++++++---------------
 drivers/i2c/busses/i2c-gpio.c               |  2 +-
 drivers/i2c/busses/i2c-hisi.c               |  2 +-
 drivers/i2c/busses/i2c-imx.c                |  2 +-
 drivers/i2c/busses/i2c-ls2x.c               |  2 +-
 drivers/i2c/busses/i2c-mlxbf.c              |  8 +++---
 drivers/i2c/busses/i2c-qcom-geni.c          |  4 +--
 drivers/i2c/busses/i2c-qup.c                |  2 +-
 drivers/i2c/busses/i2c-scmi.c               |  8 +++---
 drivers/i2c/busses/i2c-synquacer.c          |  4 +--
 drivers/i2c/busses/i2c-tegra.c              |  8 +++---
 drivers/i2c/busses/i2c-usbio.c              | 12 ++++-----
 drivers/i2c/busses/i2c-viai2c-zhaoxin.c     |  2 +-
 drivers/i2c/busses/i2c-xgene-slimpro.c      |  6 ++---
 drivers/i2c/busses/i2c-xlp9xx.c             |  6 ++---
 drivers/i2c/i2c-core-acpi.c                 | 14 +++++-----
 19 files changed, 65 insertions(+), 65 deletions(-)
---
base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
change-id: 20260917-acpi-i2c-4198c83df77e

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

