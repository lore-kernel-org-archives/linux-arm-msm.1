Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98C439891D
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 15:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572485; cv=none; b=TFWlHgb+jsewFbKfsfN1yplT8NRyLlL4Ld5o2Fh1uM0GkFCSVG5/M6rKhiQ8tuo8jESGC/ScVeMrxSEDF6JkgeamqLq6GzL4MHTdSPuWiefN7QnlGFXef9JXFP5auVZgc/tWqJdn58bIa7/GxwfMaavlLNRuwjfopWUQYtrygJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572485; c=relaxed/simple;
	bh=xMf/gpDE3CEVf0a8x1oLHjdngryoYW8QqrujU/K+Ujk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Cj1srQrtp8L/UrcR2tVTza+jYb/v/Uw1fbURONkSNqcWvu/dI4rLw4HWYNxssLyMyJDIz40NFQBgD65zu1QIta9DluEOfQipeMIsdSmByxrC8CwkTkNoggH1VxCrwFfxOjPYjrP/bIE4vkP/eNq1ZFlvCzZ0k450F4rwaUXNbc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=FtGemT4j; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="FtGemT4j"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso549695f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 08:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789572479; x=1790177279; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CJkjTMnEfLvNmWFsl6YSzd8cXiPBAKu28vg9VmO1beI=;
        b=FtGemT4jer6oOzLRm79iIV1g2pf85YTfWTeObBod0mSDEkOKBevggDGZlh+zCPbNFU
         6iVZKcbZt3J6YCkQmuCGaYVGIaTBblKSt1j09AF/pYDBWBF8EKx4BRPFKIZcUOaNTfBe
         0U00UfpRxmtL/jpNOnf2kYwvPW8Z+CzHDXcmz2QGWNaBigUL3Mt7OkN75NdsnHJO4INF
         CrHpbwBk0IQjHWuMS+DNvKj4HDDlb7G0UKdppe/NycsDk4rLHRxhjih9ysHIpSMD35V8
         WTQcKLyWdVo3wDy1cpn82RYcK2dlxzg1YVF1vb/quC4bGiuVwyJdU3kkrfaJopY2iEvd
         9Yng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572479; x=1790177279;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CJkjTMnEfLvNmWFsl6YSzd8cXiPBAKu28vg9VmO1beI=;
        b=p+mYNu8JaF99tAJpO+UoA60XwBNdrd/YHFf0ZqVbAOtjBxeoyMl+iu3DmZfQ20P1sD
         8s5zUbIS5S58jIh3QeAWu8PNNpMT6ad5Nh/MEhYHWIr8UNSiHajqwDS7FvhbG/uDtrGW
         r4OVnQYdcYwtJvdtZ7HycoC9ZDKS84a/vNGEbAh3H9DMhQzhy81D7clebijvmNIjzW6+
         QvDzBzY07rrpfdo3flCpDpjxEXjc/zvyg50mZYfGeqU1ejWblyGIwS7ljK7p5QEZJp19
         K5XUVBWQn+aALbQo6vTJZzTDWir77qOSXY78eU9GefXC6BNzzN8MYyjKdzBlSXaG/zQQ
         p1Xw==
X-Forwarded-Encrypted: i=1; AKwUvBz3uhJ+TB01e2qCeBWeqkEWz2hzw3EAkznFUcJMNL2UbezG9mD64JakUvD0s+p+STFETRpBJ3H9ExINjvha@vger.kernel.org
X-Gm-Message-State: AFuF++m09bY1rwRzIZexhXJkeRfNr2/jRFA1IoHnzSjhOCyQcosg6jQ/
	g/t2IMGl+o9Ae6bRxnrL3IV9yBNL2G7zQzyj0XYeYYotGzRKndiF79pBAlizEJkfRyw=
X-Gm-Gg: AYBFou2szx5VuVDRJXM7KORiJmTH3ymsKwaewBU3G6m/5ftMc5tq6alwaZ/n2GA9rwb
	dPzBr1Y8/wq0swBueX0bfwRaqmndAB6r9WvTm9kv8YGsSXPW5/jJLpnw9B4zF7YVbX0yZslAWaF
	JfsMQwN2D9KmRpWstCH52pmfLr0u1wuw0c4SNYNaVE3bjAkPTpGcIrdX8icFri5B+2GBVN+dRjY
	PT4PIt+YqwXrZMo4+ShaaQcxAC9XnPSWJrXge8bijGD29sEX8fMXPJSnMgimfef497abLMc4RLS
	maYYV4dKurSFaEYXF3znqa4l4R+BkglvTRilTmCpmqduFMSmMkqhsK3a7ENuNxvm/oboZIQPCqq
	8LaWzB73PGwNUpNdbxvJzmArJZxACfb4re/gT/YZZiTpHb5D4p+G+wk8ZgiMwhgM6PmeSL3tXRa
	CTNdtxRcCUzKMTP+pfbhyznJxD7Y1CgSzoaD+50AWQ9hcQMY8+UKlT/CtoEqNQdyBJOmfQgxkpv
	JfjpBkLIrd6Au4=
X-Received: by 2002:a05:6000:4711:b0:487:fb0:9ff with SMTP id ffacd0b85a97d-4870fb00af5mr2859979f8f.22.1789572479446;
        Wed, 16 Sep 2026 08:27:59 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f89:61fa:af44:9a4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf37e69sm7886646f8f.29.2026.09.16.08.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:27:58 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH v3 0/4] dmaengine: use designated initializers for
 acpi_device_id
Date: Wed, 16 Sep 2026 16:27:53 +0100
Message-Id: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHm1qmoC/3XNQQ6DIBQE0KsY1sUgUo1deY+mC4Sv/jYFA0raG
 O9esBsX7XKSmTcr8eAQPLlkK3EQ0KM1MZSnjKhRmgEo6pgJZ7xiDRNUqgmpfkoKUEitRSdBAIn
 1yUGPr5263r7ZL90d1Jz2qTGin61771+hSL0fbCgoo6xXqip1dY5+O48wWKsnMMOCJlc2Xx4kP
 QR+NOqDwXejByEZq5uG/zG2bfsApY1KIQEBAAA=
X-Change-ID: 20260904-acpi-dma-ee1add4bae4e
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789572477; l=3080;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=xMf/gpDE3CEVf0a8x1oLHjdngryoYW8QqrujU/K+Ujk=;
 b=NLwmNsd6OiS/eQph+fKT6dNVFkkcujKQ6iNUzMupPtYl2RmhAB/8DTkDpNfrpQ4QhT2UlHYwZ
 7fydntIbbvnC4llPaRtFnpP4bi8ZQPGnT4IVI65ocFS9VbThSpJOgQ5
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

Tested builds on x86-64 and a64 in Yocto using 7.3-rc2.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
Changes in v3:
- Changed the title tag to dmaengine; added Reviewed-by from V2.
- Link to v2: https://patch.msgid.link/20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk

Changes in v2:
- Tidy up messages and wrapped at 75 chars; added Reviewed-bys from V1.
- Link to v1: https://patch.msgid.link/20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk

To: Viresh Kumar <vireshk@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
To: Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org

---
Pawel Zalewski (4):
      dmaengine: dw: use designated initializers for acpi_device_id
      dmaengine: loongson: use named initializers for acpi_device_id
      dmaengine: qcom: use named initializers for acpi_device_id
      dmaengine: xgene-dma: use named initializers for acpi_device_id

 drivers/dma/dw/platform.c                    | 12 ++++++------
 drivers/dma/loongson/loongson2-apb-cmc-dma.c |  4 ++--
 drivers/dma/qcom/hidma.c                     |  8 ++++----
 drivers/dma/xgene-dma.c                      |  4 ++--
 4 files changed, 14 insertions(+), 14 deletions(-)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260904-acpi-dma-ee1add4bae4e

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

