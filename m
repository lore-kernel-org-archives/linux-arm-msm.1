Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABD7393DF0
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167551; cv=none; b=En8QsVx1KNVob1QrSntG4ZyQEAZs30zfSb5L+Q4KR3Ejs6s1ZHsyRubho/d+DLXhoitHy3iPNbWy0q/bUwYGvPwHsFOj3mQEFDaA1nZLd+7tFklYOAY/24NbYyA3/HgYtj5IxlYz+E+Yb6VavTQ2a3T8zFZN9YVBym9WxK54hBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167551; c=relaxed/simple;
	bh=eLHa4dPs9DCUDJ1kmdQMo3rCaQZSwpaKrV5cA3MJQxg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CVxUn5TckaP26nx+qh/mYRQNYMrG5PgWS9B9pHozA6vJPUK52VjVVdLVN6lEKnPhI6Ml5Adm91leARvuuC327f1Ph62J+VWhZsXFaAyPbWk9V5T6YoxBadQcYJct5XKWY8O58R6X0eGeXPp9gLm0jR9ZTKsdEVF2yUWti/cdcSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=PutC60I+; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="PutC60I+"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4798bea72f9so1845245f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 08:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1785167548; x=1785772348; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/usFwe3FqFKu0J40zc5DLz7dssBvetQFn/WiBSSIrIA=;
        b=PutC60I+VnbIgpioJ7L0hCSsVtIbDNmicXYoOBE3EvlDprWzfYMzXE1zhiVZeej2yD
         ki2HmGw6B9yogUYZ3MIR0ww5cHaj8qlLZg7edpmY68snXhZlkPbRT+nY68Eq5eJ2re/P
         ESOK6MhzobA1CzB8YfOwih6Ja2XsBU1XUZyvv/RRf8Rg2p4zFl5fWvVgr9NCyZcm91Ts
         7vS4fyySDGsVukRwGtZktrLj41X43CeYnpgO4tbhXEWZ3AhTy01QTLFaUK0EmwfG099j
         cHx9pW1PNjVqnZ1AE7sqCPYJ+xZ6ZzsWuZMRbCIcDWl2KoOhsGKbzE/P+u9Mcb9DX/PC
         SWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167548; x=1785772348;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/usFwe3FqFKu0J40zc5DLz7dssBvetQFn/WiBSSIrIA=;
        b=CiVirGl0RmzSL76FJTTY5lfT0H4KCa/QFTBN4BrdJ5z0V5UpneRv/YfP21zrju3sml
         OJVabjRMr+9PlOaPfqfaMNisAlOB81WoDzL9IHwoTgAMXolNtT+89/FGg0JOPtOeGxnm
         zxGvPVcXhbdDFpN6/eTq4ba8ttKnnomdiX1eFSe9zCUC6OdBu1Weur7M2jFSg0At/IF7
         xUrXipUQR840xfa/hZRtiSTsl/QVF8IWvzfb7dMymZeeiRXvyK+hEfzhxL7skRJkHvCw
         TCJMzqWpwXc2dbiZhAT07bRZyUxjtnPQo5C3tXiliV8C2Dhg+DjQo0rH0xNJMWkUocVl
         Fjew==
X-Forwarded-Encrypted: i=1; AHgh+Rp5MgGE5UKZbtCThXIfa2LasrwkWE9duPRJ4xqEwrxwtb93R6BYZO+pMVW3yaKnhbAdq2tfEs67unqCk3t+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe0K3PKan87pQH5WtXkH3R1X4/0ajQIOZY7kT/YuWWOrD2pIWC
	bCZFA26OJ325JltVoFm6YS6OizprJwXiTjyfptutgqo5zCzGBP/mOctBVMLtPS6EoN0=
X-Gm-Gg: AR+sD13hB1prWXOlxKAXhA4sUSlTSWy8WgeAP4AjByPxqfpXIyGfARbzCMqVL+G+E8A
	0k8m28o3hGt0aXz9rMwDf6/inEcK85EMaNv8yrAptxYZh5D2R8KyC92tngPiz1X8d4LSWNQw4qY
	ooavb62wLMxIUD4TUuT9wJI2NMVuNzzPXJPeAaPfcRAgZvZiMzrtThSQ5pQPR20FT1rHrHk+8la
	IJ4/2SNB74IJE7TLKF7cJv74huG1E9G9n82slffg0c74rJl6Ant/983hstWgRK923E1SKiI00EN
	+lFqf812div3CVtb6zDHy1KCibwMeA+9Rg0i1NCaNk3aDh2Y4AZZJDJbYye2tn41lFJawb44ARo
	CqYynBe8vIvMETYlgxpMAymaVn8XKLFFvBIADvi939jr2mUfd8/ifQT0UOy+yTIGVlfcKfHs/2o
	2G4oJy0cjqI1VeOWU8eBQ=
X-Received: by 2002:a5d:5d86:0:b0:47f:8ed4:1337 with SMTP id ffacd0b85a97d-47f9feb26bdmr11243556f8f.46.1785167548075;
        Mon, 27 Jul 2026 08:52:28 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:7aab:bc55:e039:4aac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm51005161f8f.20.2026.07.27.08.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:52:27 -0700 (PDT)
From: "Pawel Zalewski (The Capable Hub)" <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH 0/2] Bluetooth: use named initializers for acpi_device_id
Date: Mon, 27 Jul 2026 16:51:50 +0100
Message-Id: <20260727-acpi-bluetooth-v1-0-b5558d53e6e7@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJZ+Z2oC/yXMTQ5AMBBA4avIrDUZJSSuIhZaU0ZEpT8iEXdXL
 L/Fexd4ckwe2uwCRwd7tltCkWeg52GbSPCYDBJljY1sxKB3FmqNFKwNs9ASTYEKqTQVpGh3ZPj
 8hl3/20e1kA7vBe77AXndVzNyAAAA
X-Change-ID: 20260727-acpi-bluetooth-c20f10b0e3f4
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 "Pawel Zalewski (The Capable Hub)" <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785167547; l=2140;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=eLHa4dPs9DCUDJ1kmdQMo3rCaQZSwpaKrV5cA3MJQxg=;
 b=OjFd4Z7BwigHzM38dyo/UnRdSBOrqEpVutkWyO5huNc5uog1lWZUs0749CPSIUQ0CRk4TDLzA
 o/PpK97yrk0AFI3JL/vn4elKJ+0jCzoC+BZ4S5+2pvEhhiup2ORXmwa
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

This series is converting lists that contain the acpi_device_id
struct, which is defined in the include/linux/device-id/acpi.h
to makes use of named initializers (which they do not use currently).
This work is part of the on going effort in the kernel associated
with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (as most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first. I already have patches that implement this and touching
a lot of kernel subsystmes that use the acpi_device_id struct and that list
keeps on growing. Therefore, I have decided to split the series per every
subsystem into:
- pre-clean-ups that convert the lists to use named initializers
- actual implementations that make some of the modules use the new driver_data_ptr

That way the task can be fragmented into manageable and independent
chunks of work and makes this effort easier to review.

Tested builds on arm64 and x86-64 in Yocto on 7.2-rc5

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/

Signed-off-by: Pawel Zalewski (The Capable Hub) <pzalewski@thegoodpenguin.co.uk>
---
Pawel Zalewski (The Capable Hub) (2):
      Bluetooth: use a named initializer for acpi_device_id
      Bluetooth: hci_intel: drop unused assignment of acpi_device_id::driver_data

 drivers/bluetooth/hci_bcm.c   | 336 +++++++++++++++++++++---------------------
 drivers/bluetooth/hci_h5.c    |   6 +-
 drivers/bluetooth/hci_intel.c |   4 +-
 drivers/bluetooth/hci_qca.c   |  12 +-
 4 files changed, 179 insertions(+), 179 deletions(-)
---
base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
change-id: 20260727-acpi-bluetooth-c20f10b0e3f4

Best regards,
--  
Pawel Zalewski (The Capable Hub) <pzalewski@thegoodpenguin.co.uk>

