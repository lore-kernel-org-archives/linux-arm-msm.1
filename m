Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C840E51A75C
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572489; cv=none; b=rny5H57F+f0fCiInwyS2TB0qe/6pSTWG6/ldmRbyuyx/Tjif+46VsSsNtpioNYTACPkvUJFDeniL6xlvNQStxHUIeOTxo2eUMUN5yvHgCfxCDEk5nn4S9SkiqwWcjUGzZN/qof3zowP/qMWy6pZd0TmsP5FPtvXuBmohkWKLO8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572489; c=relaxed/simple;
	bh=mcQe2swm15Nmq8Y4i0Yhh/Z95MEtTy60FNwFlQB0qyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WiozmKLz4s2CDWQoA1+GScrfR7v9RLsFM9i1YLc7gbCcR9L+CuPiU7kHrsT9Kj2X9eO3QGa3XvMJ52Gf6MwOkUF4YcSNwEJAYyFl/FuYa3Ts1Q3DJvYlZfZT6++ANuE7iJiXMjwM3pMPKw0+MgoKsB2hRdNZeef7rE0646P3iJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=nEMottUS; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="nEMottUS"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so551760f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 08:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789572481; x=1790177281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/+QTxJeld428JJetLUQ3w0n69IV3ON69coAVWlYDS8=;
        b=nEMottUS/2of7FwGantLzGAw7/e4uhpb8PC5byzmMcX7WMXFfaP5szv5HJtKrYeD4k
         iihxm2XskTpCBLT5+AmTa6IbAEzDJfj9/4unC6LZrtd/SDx4+/zv9Q0oag1fslT7vboa
         e8oUDgBX4SZUra6AT+XNCV/QUYSRCISLUEytLHoSZBaPvAUu/r0kmOmC0uiX2YmRke78
         vVkPllXQDCz46oolRMDimck+zeeVOGrFuQGdw7/I3zeZCstkf78kTV4AYCECKovXQm0d
         gQ/M5/1lX5m/WEx0qphIzHZu5t1apsMVIihhCPCKVbgkUISAeR98eGARH77LrY21Mqd3
         J7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572481; x=1790177281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/+QTxJeld428JJetLUQ3w0n69IV3ON69coAVWlYDS8=;
        b=2ibzKIY6vEkThcnnlnKMA6SjHyz7GvkI4f4M4C8ifKiCvZ/hQfNOj2joOjeFcivRK2
         z38iR0wBRHEAWBFF3sEevI2kRo7XPOABEflPV5bjlZoLTyIDnJquXmOd4w5gR/c/eyFL
         xvL/3YLonQVTRP749CO1rxX2W61bpLZYOyL6HWIvh3w3ilKYcrWp7zrhlzTQToWH0n1c
         84bbdZpFGQFVD4/hnaga21Xdlsxy3k7J0sV+wCe5DAGb4fZPQmLe5ADTWEoqqTOPrebq
         dNLz/e7SmgahDH0EBkwL7YFQm91KqWhm0pI66tM8vSo7DCxZ4fIeD9SvVzIXbKIbiVzS
         xHtw==
X-Forwarded-Encrypted: i=1; AKwUvBziI/mgynoCgL2/3CqdK3YYmo8ksUY63uj25o0ylXoOvVeD3BWC2cOxfWbG8SChYENQYsVbzCNhUzlvlNtD@vger.kernel.org
X-Gm-Message-State: AFuF++lMnU73N1zBLgFMg+vqWbhTGOThkxpISvoq/r2OmH0ZPi/lVD4m
	cJKRFZN0C214IQ+9lsF/SusmUyXsksoH8feo7wR9hP8PUulPjZinWsvlYzkjrJXnV2w=
X-Gm-Gg: AYBFou2UGlWbX8tCKSx9tvgwSplwTkQ1LNkDmPvnPAKi7ARP/QOu1us+oa3lLy3nrFB
	75YCovfFzSh+An+ZiVo/U7IhG0nEqfP35dcNGYtrgdYZy6k1OV12EK5DpSVdpenSDq6j4zy7JYS
	51w8DoJa/AgyOKoTPx6tRVcgrlNb3Zvdb1U11gRoWewwng2s9jQO9gOqR6G4gMyG0BlENaIX4ku
	iM/6Xqmx9f5aNF8PvrhFZEGFR25rT7Go7TioJkV/YpZf9QytJDnrguXXTHYXDTR6TPZdFvknGBR
	Og921ebUaVbFCcbaFx5SiJdytsiIcPrx/OGxJKCDmLTjdjy1in2CVgd+YeGQrwIOy54QfdAfE3G
	P6SMhDlmvE2mls0yjVNLPngJCUwf8G5o1L4vHLy9t4ETO4DjUfVBMh2iSlrKFdmzNpxw1u/Zdvn
	wnVfAumIvIDbtHFhkW4PSMuxq9gTsgZLahtkru6aQe64Fr8jMrIXY0BMTqewZqqyw1uF0gPjqII
	G4hyPSRTH8nFYk=
X-Received: by 2002:a05:6000:4690:b0:487:d2e:144a with SMTP id ffacd0b85a97d-4870d2e14damr2660370f8f.4.1789572481423;
        Wed, 16 Sep 2026 08:28:01 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f89:61fa:af44:9a4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf37e69sm7886646f8f.29.2026.09.16.08.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:28:00 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 16 Sep 2026 16:27:55 +0100
Subject: [PATCH v3 2/4] dmaengine: loongson: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-acpi-dma-v3-2-0dac05654967@thegoodpenguin.co.uk>
References: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
In-Reply-To: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789572477; l=1307;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=mcQe2swm15Nmq8Y4i0Yhh/Z95MEtTy60FNwFlQB0qyY=;
 b=mCAMVQGsOjrzZnlE1KDLWefw6z2YDoXVc9+9UX4SNJa9SUb7C+WIzubLJibyTbBdmwrLp9uRR
 BUqsHUJnqkiCke3WPg7G/XSghdGEVnHkp6NzQewgkYj4D37bFTu/4N1
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which makes the code
more readable and consistent with how lists are initialized in the rest of
the kernel code base.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Reviewed-by: Binbin Zhou <zhoubinbin@loongson.cn>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/loongson/loongson2-apb-cmc-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
index 1c9a542edc859..70880625c6e92 100644
--- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
+++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
@@ -709,8 +709,8 @@ static const struct of_device_id loongson2_cmc_dma_of_match[] = {
 MODULE_DEVICE_TABLE(of, loongson2_cmc_dma_of_match);
 
 static const struct acpi_device_id loongson2_cmc_dma_acpi_match[] = {
-	{ "LOON0014", .driver_data = (kernel_ulong_t)&ls2k3000_cmc_dma_config },
-	{ /* sentinel */ }
+	{ .id = "LOON0014", .driver_data = (kernel_ulong_t)&ls2k3000_cmc_dma_config },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, loongson2_cmc_dma_acpi_match);
 

-- 
2.43.0

