Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F203E49ED
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167553; cv=none; b=Ut4XRqBIX0EKGfQpKZzE8qUldoM00uVURly43+BRXTsLdPdigDsW2LNj+FNtHdZz5Fv7V0vnInjLC5IL6vCy1l4/fJ280LHZ05Cld41kHuDwmw8jAVXQNtfVT1uaH928mET4t0qJbpfunPEfnyPb91jDiI/udFachdkSXOJo9wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167553; c=relaxed/simple;
	bh=kzbOwDoIQccc/vmXk10i4bMS/XkPcDdFLODAuPx/f60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bvKzmut0a4/FrG2nfc2NcsFFE98w99fC0jHZfQMjonAl219HykOAUg5zEs0mVPNQOYVRfUhb9oRbBZjWxZF3H3c8H44reDJyMo5qAn7GTmx+g8bgG+4T/K1HWIKPxwlJyVjruWssNc3F+BQHkk3RLhA9i2oEiQ3SifmP3/ZewIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=MN43CIhn; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="MN43CIhn"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so31703895e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 08:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1785167550; x=1785772350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yi9zpNI9ss5GZB7UaZ2xVdwfzZIpfrC3p37S+/6MGgU=;
        b=MN43CIhnkRkGGKF50XYXKA8X7kQvPAnklPOPz2jV5Dw5sn/josglIEkl6ZiumVPzAi
         /gMlWHOILy8t5/VEKkWZH7rCESbv0z9/iphDs/9ttYtriFJDmvOjbwGHOrjosJf6aY1g
         /MPRBRKKI24ncWDP2aQPO986/XaRVF20MvkHLPPv/G7I+Qfe+15pSsctUKIhbuJpAmUE
         Q3t0VwVMxQJB4kQjV8YnzfROLPWSZgeLOvRoxeUeFsB74v8kJYAOLIG8ZxjR90u7vYHS
         a/6Mb1ZgZBiQUgx8ZYaGtbVybqIudpHtBxkOPecMNvG0vzy0/QK0xPEBtrcrzVbzVQqK
         W9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167550; x=1785772350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yi9zpNI9ss5GZB7UaZ2xVdwfzZIpfrC3p37S+/6MGgU=;
        b=QL6uYolr77lav0y2e11XAgMUsd3LvQuVnuaMcNxvVVFYySworKkdzihLYAeFKJriSH
         3rIk8F90d20OKCTDK7yyuAE5i87p9SsQHT2iGJxXIjtJoVOL4SJE76UcRKsJZpF4adWk
         yF6zoKc0djeWdEglEAsHCVifuNmeCjz3DEwyvbK4rOCl9J5NwucY5fChEH2nOXiwVeLk
         2LmwdRnvWHF4ErPkuthDpMalVYN4GNfVUeKKbuj3C7ULIAsN8IcUJ5tX/1YZsFy5hRNJ
         4LV03V9cEsc7tBrDrcLzLNSyWqI7HPr8irPUtnMAlGgcX2EDIz7GdJ8Aja1gSyJlb/jN
         9S4g==
X-Forwarded-Encrypted: i=1; AHgh+Ror0DRl7qT3nkdnOE2iiuXOkrl8yPNFOlMZHYM+d7ccAQKucCqciBGzbe7F7mgNL7HwwPMLJLxAbDUNcMLc@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwa+HCZUb7qM2GVDyEaqrABgeca+opGx4JAwMGyGtpwZMtCWwB
	tCQfADYtZ4zsdjG3ISLW7Zd+/8zykuGxb68hNfjK3z3xijrixnlLmflyOeLEHbT4wKg=
X-Gm-Gg: AR+sD12pzZ+PZy6wpQvjnWR/NZ+PDpuSC2YckpwTHfJLk01FTaUix0TaTr+ngk0Y1OV
	KfBF+HyhfnUw8t+BZmb5l4wr0JytVYq6gcrgo+n98dE6eg7i/s6Pd9NUAo2RpO6QbntlszJ3sKq
	UFB/Z0pw4Ft5L25j+ME5cG5itWFBTVXSj2hAyCpUMv4Qs7FImu1x+jlq/s0EUMsZDqDWLIhp775
	+nXtKF/rI9NFbXaCjHwlXDucaRnWKwc7WJxfflZ7cWnanh69NE+r7hCNxgT4ntQug40hxMlDEwS
	C75JCroTdC+phu0uVEc9CuP2Z0GYWDf1W1Mmglodk/+z0ugIj2s6cJAnEmKKIu9TSQqpOG/q7+l
	yxuQ5Km0qhNDqBxETPXJ2ij73+aW8OWStxto47qRThs74maypFhBb6jAGrvyMxWvlPXLpX98u6B
	Zsq6+7/zm2X2Dm+Y0agKw=
X-Received: by 2002:a05:600c:a20a:b0:495:472c:208d with SMTP id 5b1f17b1804b1-496b572ee46mr71194445e9.38.1785167549849;
        Mon, 27 Jul 2026 08:52:29 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:7aab:bc55:e039:4aac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm51005161f8f.20.2026.07.27.08.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:52:29 -0700 (PDT)
From: "Pawel Zalewski (The Capable Hub)" <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 27 Jul 2026 16:51:52 +0100
Subject: [PATCH 2/2] Bluetooth: hci_intel: drop unused assignment of
 acpi_device_id::driver_data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-acpi-bluetooth-v1-2-b5558d53e6e7@thegoodpenguin.co.uk>
References: <20260727-acpi-bluetooth-v1-0-b5558d53e6e7@thegoodpenguin.co.uk>
In-Reply-To: <20260727-acpi-bluetooth-v1-0-b5558d53e6e7@thegoodpenguin.co.uk>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 "Pawel Zalewski (The Capable Hub)" <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785167547; l=989;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=kzbOwDoIQccc/vmXk10i4bMS/XkPcDdFLODAuPx/f60=;
 b=F/kqOyVs64baHfD4XL+UqtL8dkTvR6Rv4KJmGRykOlVGsfFGiNWB2TKsryoqymwjGI0QmfHnW
 /p1MxYj6BOIBz2tDJZ8LDuhRvvCugViZtiZtaK8SUlXTIiXiiH/weI1
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

This module sets the acpi_device_id::driver_data to 0 but
the field is not actually used within the module, we can
just drop it from the table.

While we are at it - use a named initializer for the
acpi_device_id::id field and drop setting the list
terminator fields explicitly as well.

Signed-off-by: Pawel Zalewski (The Capable Hub) <pzalewski@thegoodpenguin.co.uk>
---
 drivers/bluetooth/hci_intel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_intel.c b/drivers/bluetooth/hci_intel.c
index c31105b91e47..ecf597f3e201 100644
--- a/drivers/bluetooth/hci_intel.c
+++ b/drivers/bluetooth/hci_intel.c
@@ -1057,8 +1057,8 @@ static const struct hci_uart_proto intel_proto = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id intel_acpi_match[] = {
-	{ "INT33E1", 0 },
-	{ "INT33E3", 0 },
+	{ .id = "INT33E1" },
+	{ .id = "INT33E3" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, intel_acpi_match);

-- 
2.43.0

