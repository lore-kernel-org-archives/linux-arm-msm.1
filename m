Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8815221F0
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572489; cv=none; b=ci4DZRWOpwSBwtSuP6f/dMOUidksSQGvEh7Ps4fINwL8OCDljmwAqwBCcnlO8MwB0pLtDL6YRwYPW/RiWl5C2w0LpFvNFnFfW+tnYRwDDjaaWrK7MuyUSPmsueusghL2qCNgVgo1uDy/6YeSg4PJAYvK3BvSi25x4yop5h3ToIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572489; c=relaxed/simple;
	bh=/JpbrBR+OVjJpbG1LD4MSanTICNv4h/sWdJw0dgCPcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VS8z8wQFia4PPKy+PcKzrVuiYkjJ+nK3CJ862KdKLXvaDHwX5c99u2lIRS0zb/EL44jkKelN0DC+yTmvNFsNNtZizNbXjePGorPN2hNDVLnUqy5C1HxICH077btZ5A7XBFbRfOuVHXlygciqtXhxtL6yC28aOQGgOcfhzB0bypk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=ey2bpWat; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="ey2bpWat"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso4951745e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 08:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789572480; x=1790177280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=272OvMcHmohpZ1MgcLqkDT/DpXSmh2FGVJu3ZCPDf88=;
        b=ey2bpWatG3D6ewyK/3VWY/RpAA8CVpKHJHALVRbUaMVNEs3z04zPqPqe4Iu+0WTMWf
         NvUXQqm9fl07zyNxouWfNRshtbeJHDFqgfPwa0TJabuSPCvq8iVKnBm0HpZZgGsFb9Qz
         QRY65A2oJj5feU6sDC9rKyJRRsltI68T5NlDDlJE/oQOXhnfG1jjZURipTp/R7v/fcPS
         D8OoEOhtKD5YNlBoQKVTtFLLIZCoUGVz1qdR+gc86t2tTD3TasLLQ+i9jvdezpVk35/k
         NRWR1F6UF2p0oj8f2jN/1s1kJ6Mb+S8ods9PlvCwxwR1cuDum/QmhWBEks4tKyIZtUgZ
         t9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572480; x=1790177280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=272OvMcHmohpZ1MgcLqkDT/DpXSmh2FGVJu3ZCPDf88=;
        b=UAu6VCKRdvjql3EWiH36qdC93atHgLpTroDWsQQDeWY2yK/jHB0t8ilasOYSDgZBQM
         j9sEymul2j7HpmFKqu6qE/CNT34yaSsrM68fz0rF+EH9DArjjJ8Dh3ckBXIA6dQlyBVt
         90iEeggbHzIWIcZQnpa1oMaygaBbpqHzloH3nv+DY9s9JQ/FZ6hKnKfnumYcMmsmfuUk
         C7TGUkQ1HuTXTX9l0KiNdbLdMbZGju4Nkg0P7tbWmAzd2VgweJB4xikutWZnMrBT87l9
         CbMnvXzyOAy/rEFdChsmMeADCO4XGyQLXIRg6fY74g1ssDUJM8yFdMWCXVXAT6SsoEG0
         S6DA==
X-Forwarded-Encrypted: i=1; AKwUvBxFvg8b3ZoC1o15QQIC92ixqI8TDNR2mrgYsjU7x9occhgWGb/xdfuzEB3slx7mnHT6D2Z2/1VpN4QSoJTa@vger.kernel.org
X-Gm-Message-State: AFuF++kiA/60Vkppa1i5Pg3YttM08G0JbuZ0Bmw6fB+6C2yKFLneAmpP
	fk5eKUTV/RPdUnwP71T+SZoG/Iv5aNqZM4ol5VA8l53FUOfAk20S9b2AzjJV6ZSLWMQ=
X-Gm-Gg: AYBFou2tbtwiiwWOhfPtHZ3husTX1/58svTD6jZ9opk/3QHgoTpDlpWdhmbB1Y3lCiM
	ARYLoDc6tSaxAtdDFFwxf/lbDwfxy5MV+rGdctax8HS3ikPVtXjXcJkJ5t73Bg0eT1lWELQk7Wq
	7C/WS/zA/7BX5+OocyjgafHa49Q4gokMZYwr8EPmEcnoyzoEu34rGRi0GcWVIXNOzru6f3Uwyb9
	fCEhdee0f+bfG3/xbbMIBv4qvobS1fXz3GKlgGxPPjsjKTbmOpnkq3UgoxPlpihZ1bDfDf+FicH
	8Tf2w6a+VN0GT+ZM8eFeme5W83fjNtrZMP65pR9/un2oagp88nHwTRIfIwUIMuJ0wxYH85waBOh
	ARw2oza4RngEv7qepa8ZstmF1SAXW1lLe0AAwM1HLjim2aVUw2x8aF5rHsgD0I9TqBFyZZ1upLi
	J3jBKajIzUvADj4wW3dqbwYAKuO2TjixUa1xQYhZSOa4W5Xg+xRyaSi/jvkr5fNPxTl4HsaoKDi
	suBsU5WehG/TAk=
X-Received: by 2002:a05:600c:8011:b0:49c:ffe3:2b3f with SMTP id 5b1f17b1804b1-49eac45c233mr34194015e9.3.1789572480413;
        Wed, 16 Sep 2026 08:28:00 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f89:61fa:af44:9a4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf37e69sm7886646f8f.29.2026.09.16.08.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:27:59 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 16 Sep 2026 16:27:54 +0100
Subject: [PATCH v3 1/4] dmaengine: dw: use designated initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-acpi-dma-v3-1-0dac05654967@thegoodpenguin.co.uk>
References: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
In-Reply-To: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789572477; l=1636;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=/JpbrBR+OVjJpbG1LD4MSanTICNv4h/sWdJw0dgCPcI=;
 b=TI2PRLu+PWJwKb49U1K2vwZ2j85bEZfhXEHR8NJ+d63p/wSMy7K3t4wGWHCvZRvfhjdfwrpJj
 mt4OqQOoSpSBmb96hvLhHcQlKlhLNCaAB/spt580AE9pnNsSg/0wgfv
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which makes the code
more readable and consistent with how lists are initialized in the rest of
the kernel code base.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/dw/platform.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index c63fa52036d7f..5c1c97eb28a4a 100644
--- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -141,14 +141,14 @@ MODULE_DEVICE_TABLE(of, dw_dma_of_id_table);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id dw_dma_acpi_id_table[] = {
-	{ "INTL9C60", (kernel_ulong_t)&dw_dma_chip_pdata },
-	{ "80862286", (kernel_ulong_t)&dw_dma_chip_pdata },
-	{ "808622C0", (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ .id = "INTL9C60", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ .id = "80862286", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ .id = "808622C0", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
 
 	/* Elkhart Lake iDMA 32-bit (PSE DMA) */
-	{ "80864BB4", (kernel_ulong_t)&xbar_chip_pdata },
-	{ "80864BB5", (kernel_ulong_t)&xbar_chip_pdata },
-	{ "80864BB6", (kernel_ulong_t)&xbar_chip_pdata },
+	{ .id = "80864BB4", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
+	{ .id = "80864BB5", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
+	{ .id = "80864BB6", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
 
 	{ }
 };

-- 
2.43.0

