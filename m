Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FD936494B
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 15:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572489; cv=none; b=GyUzy4gTTODsOYKPZqS2e9xcwh+Ppw60w8UVw8qlcjHb4H6tQz+0aBRyKEWg70BNeAcUehZu1TC7wObsioNP4DBTOm9cvX9DDv3aZO5gX6T2R7pMJNFgF6hkKLGyNE2BvtNrztF/d0pJdC1t69UxFZaukuujNlsxtyK5w30tRbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572489; c=relaxed/simple;
	bh=fh4C/z0gOMcS2SxNxy2cC8TlLYkqOtVy2+16qwp+aMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eg+ItLfZhsJRePhm6v1qloNr0Ym7TF02bTQ7wt0YBSS6R5h/keatXgU8joKvX0wB6rMbnFaHbSSEcebYDLlPIgne418IbZuSQ2qhM/wEEyDSfeDpM0ro+RwBF6U12v0iiHlkgAz7MSHczbqtk+8dbvhn20WIGrZuzX1APgnGS/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=yYxo/qIr; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="yYxo/qIr"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso742760f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 08:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789572483; x=1790177283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvKdQrCWkYxqdOjbu2Fib0GGvdK3uXcjnoDDmIYN5Pg=;
        b=yYxo/qIr/y9irKQA/QuKts85tjgCEpyHa5xe/+EqFxB8MfiQ4zriov3x3QtKI4YhWZ
         TNO4cV9T0LYVXAPIgirdwPOhQlaKRJ6VZa0HvQFo7ycltG/ZZoyzQx11euSEVpGqWowS
         tANoXe9VqqVys3G2pwxcLbapShE4q5464An5H3WMahWzH7RAV9Zhy6tw9ujX/XITZidO
         +Zd8vk4P7RAy6KiCpd1+l/b+7Ac1JOwKbVCM7dg8MbwBdcalFcCdNLTjZFFqi3iaqNBK
         5F1Y2vDJBIKzVdpRmkiTvc0Unaan5F5s7Hl2ASBcPb/A7H3LH2pCV4a30icGmCcnPTTI
         GJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572483; x=1790177283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvKdQrCWkYxqdOjbu2Fib0GGvdK3uXcjnoDDmIYN5Pg=;
        b=0KQplawZdI7iITt3UwAKqDc5ZbbiYF1YAEyek+3ouW4zaIrBj6A+sseVFMnzz4Tz57
         Iv2wjPQMOhhNylTM/KpnIa94SO2O6OXYVizf2g0bvdMjQLnxB750Mcpep5oPCzP3h80c
         c2b8kbsW6KogExhh9InNfOwBa7/+PyEa7scuVxaxpBYekRfMFdPgQ5fUeMO9TpklCR+X
         WFrly/p8t7QS2Bp7R3VmcpGM7yGVh/uEG1nddx1/iDgbhF0wB8QwhaL7LL4Q7roCjoyr
         ZWO4SG/hlBC14GaHWJx+2F63gokfZnAyBFI245TfTRzVXspyY6BIg1Po5qWqRm0yvUpL
         kzwg==
X-Forwarded-Encrypted: i=1; AKwUvBzwmFAcrL1J2DNH66dqnDggkFGmfOp2t+tgHP3zNb7sAKApNddAijM5cYwgkHAxiKIcQ9QIGdyi0ZLwA2wg@vger.kernel.org
X-Gm-Message-State: AFuF++kvXa0Wd7bGq8+wQspbPekQdTLikkYVMwIE9vrgrcJ8FDrp6R74
	Tk11fGwljCPMkWpF+MO/TmGfLiIihPSqvdzLkWh2SHTIVyeWp6k4YuLmG/X4qJiiS8c=
X-Gm-Gg: AYBFou1JG+ziLLxcnvlnrPYg9v2cwgg3QH/geOL3VMJPDFSHfJJHAWzLmUY7pkQR9xk
	ByDBNggm3R4YYWpFraJpDYbTzil6j6W1OESyQ7TT0RrBJA8b+AuoDpBlIHk9y/mr5eWQ9qFcImP
	wQ3MD4VsjzRj7UqLTlmm86KX4MiyYuwcvR13axvKs/KLTfPuOQNeH8FfNdyK94/HAwmZf+m5q6M
	bieI9cMD/KD8q5HiRVBXsIwNsOx+hx+97RqCTBBbrUVurla2plkkyRGuWnL9u4ARKW3Qq1FQWVj
	ScuKczqChjW5SJoRvR2HXlXx2NpH01HuSQ4bbQilwH+f/ujodSBK9iL3n1xxk7haDRx8qOV3/Uu
	8shz5byiEyCYFRmZYt9AhZe3S5+XSPsWWjDYct9TNN0qIwaTCNJ1viHYZHFR8SyJLIfWhoSx0hJ
	p8OlVJlHCPZrZvfsYoFUKXJPWxRj42UUHQ/Qd6rMJo4u28ZG78V0Q40F/g3rW2AQoySvAPcrveK
	jk7ZnLsfY6Hw2z+2x91f1yHdQ==
X-Received: by 2002:a05:6000:4b12:b0:487:360:f17e with SMTP id ffacd0b85a97d-4870cef4138mr4081357f8f.17.1789572482988;
        Wed, 16 Sep 2026 08:28:02 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f89:61fa:af44:9a4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf37e69sm7886646f8f.29.2026.09.16.08.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:28:02 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 16 Sep 2026 16:27:56 +0100
Subject: [PATCH v3 3/4] dmaengine: qcom: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-acpi-dma-v3-3-0dac05654967@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789572477; l=1191;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=fh4C/z0gOMcS2SxNxy2cC8TlLYkqOtVy2+16qwp+aMQ=;
 b=RW7pP3MLxPosAiOITUM/7+vTicyGJZOPaExp0aJS5Zz/uedQ9Algz0ACDi+XTpXlvnH3IwPMZ
 zhk1eWRwV1QCsFVQsfSEBCIhKPp93+ZLpiA0+Il3hN17LG3DMcI23MP
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which makes the code
more readable and consistent with how lists are initialized in the rest of
the kernel code base.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/qcom/hidma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index c939635be21d..1349066b1544 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -935,10 +935,10 @@ static void hidma_remove(struct platform_device *pdev)
 
 #if IS_ENABLED(CONFIG_ACPI)
 static const struct acpi_device_id hidma_acpi_ids[] = {
-	{"QCOM8061"},
-	{"QCOM8062", HIDMA_MSI_CAP},
-	{"QCOM8063", (HIDMA_MSI_CAP | HIDMA_IDENTITY_CAP)},
-	{},
+	{ .id = "QCOM8061" },
+	{ .id = "QCOM8062", .driver_data = HIDMA_MSI_CAP },
+	{ .id = "QCOM8063", .driver_data = (HIDMA_MSI_CAP | HIDMA_IDENTITY_CAP) },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, hidma_acpi_ids);
 #endif

-- 
2.43.0

