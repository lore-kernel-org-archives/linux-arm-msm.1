Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52F9379C48
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 08:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786090644; cv=none; b=CLGZhWaQpkuJAQZY3+u/hagRZEli+Kz3GCsnrJ+YolGtN3IRgeBd6GIUHGVGNf9Hf3BrGwNfM3bDNWHVD0xyc6HdPcXdiLmRfwgSIptoCQK3yUL5beBQZyI1OweeiD4q11JLGeHDy0JkM1h4j2o2q1wDRFIXkRFAj3SwVfPPupc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786090644; c=relaxed/simple;
	bh=TLaM4ipt2XvrvL65uL1X15EPNsDhuS4EXrTa53tDWfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QOOjoha8cBRhgQVbmV607w3HDhc7W6Xrcn3fTCmuhC1ySsgZFF+fMRFKTXM39bAy40FhTUiO72FRlX5n+LrFvpREPBJIRb6u+DQkDUxGjQWo7vKT41ddyijsXaa0D0WyCapPophdR1sCaP1MG+hqylHKURz5mXDQCTZ6QtmALNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/f/CngN; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/f/CngN"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso3153410a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 01:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786090642; x=1786695442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhHhQhUh884edb2pkrtgwkkFMcH6OBy0eevlqyMXflE=;
        b=D/f/CngNp4w4TMyfTleHZflZQMtHsWXHqYMGkzcaZ9anqk/6kbo1RFVNyrE6YKT+ZD
         qAGKlw+jlbAULGK7xx07Q3zYqyNOJi4hImdkClRjJ2MzydMm96t22ktHgHjjxc8jCTip
         3nWm98Sqsl9vLewjaJYdxZ8tvzgehaL06soIZ9+YYvTpbg1iQB39tSCOZBjvT/D0ydf8
         NyWwyKBl0LwWB4GIJLX1fMVeGo9LB4nqLD0jEhCCKQfQTLZMxI4nqYOFhHPkJ5XOlMts
         5EyLGislUYIZg1qeO82okaI+pOPOY2eghjMBjKRkKMb5DywvaRZedj/6D+iqZJpJs3Rk
         VjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786090642; x=1786695442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xhHhQhUh884edb2pkrtgwkkFMcH6OBy0eevlqyMXflE=;
        b=MII6FOjco4k8r91YSb9ciAuY9pRJO/3Z+wTpiAgyXcJ8Hl97rNrLDh2LsVPCUjfBYn
         TuaawKit/oMDSY/kWTxbcF5CB3u80ckg/UtrCoMrsTw7zdoFD32CzLUM+PkgREJi/Q/q
         zITTahRBaALDObAjWAJBVutKXDFcbLl888YkcRoHJ/EHAhmgIdvLO3Do2JaIVMvoBeFG
         6yu0rETBtRaMWGlawInLDpL8qau2fVmtR0JytG8899FOYJn1YM2VdAxq5z53h4vT4PpM
         o3gk2IzOVgl990q8WgUuf2LwugN3MHTXqlLKPqL9+UsAgdqCi3WaRIo57A0rIbpq4DHs
         byCA==
X-Gm-Message-State: AOJu0YymeIACm8YHl3UjT09SFbHDLZbeV/pjQxKPW3XQ6auVcpwTYxyQ
	srr6pmzgl1snXJEmIky+HT6UuIfUXWFnyOyMNDd6Avq7uV2jXNN9gqsv
X-Gm-Gg: AR+sD13P/yFk5/DdiCb0EYRdUFCvAYkGib5Kclgb+pFQuhiYujCtBk3YdSySrXiJoYL
	ddCoTOTe7fIx88tDEIYL9q8fJ5MxVyASBFzRXqUD8ZD51caT7ueXP5FgkKxWzeXKmH/XM5lW3vE
	DY+4d3RUDST8DQj/kCnknFieVACP6owGKLT1E/AaLe0gC165noNM3sFj/ko8TgFFt2fR4x2s9TI
	7ivbzd5TihoOM3E5qF/ScneCsejq94AneBTeI+0nHxr7dgM9ODQ8gNm1D2xVcW5PL/8WMkLPpnS
	KvDvu8WS/HiAuTtCJLPGG1HIyqcFGsv3pBPbreynLnvKWL5b+ZoEpn37U4J8Wmvgi6e/PmYueVQ
	ZlzxoNSK2v4ayGmy6pAPn/GXsDKRlU/zW0aS69jQSZB+5DUPuhi3gRX/IcLv47x+TV/0wpA51SA
	ScZEye42rZjjvkZ1oIyP6/2hV1w+hZPX2+Ebmf1R8tReq+wOY157OjJbKF2Bc1F4WvHa7s3KWzP
	rqByF0GvUXmbVIK8g9ERasieu1ySAMW+NdagQM9YhH1G+M3OYaScKhBIR2myeuorBZsHKc5eHoz
	B73E
X-Received: by 2002:a17:90b:4e8d:b0:38d:ec31:4840 with SMTP id 98e67ed59e1d1-3903c5932femr22557442a91.13.1786090642107;
        Fri, 07 Aug 2026 01:17:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085de8ddcsm3913377a91.6.2026.08.07.01.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:17:21 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/4] watchdog: aspeed: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 15:16:52 +0700
Message-ID: <20260807081652.38692-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807081652.38692-1-phucduc.bui@gmail.com>
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/watchdog/aspeed_wdt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index c9e79851504c..48454ac86074 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -429,6 +429,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	if (wdt->cfg->irq_mask) {
 		int irq = platform_get_irq_optional(pdev, 0);
 
+		if (irq < 0 && irq != -ENXIO)
+			return irq;
 		if (irq > 0) {
 			ret = devm_request_irq(dev, irq, aspeed_wdt_irq,
 					       IRQF_SHARED, dev_name(dev),
-- 
2.43.0

