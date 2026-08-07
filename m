Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743BD4562A6
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 08:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786090639; cv=none; b=hQIn9fIhjkEAurfM8YQ59mOTmU7srYx5W9sb1FYtA+wShr7KAkmt2p0bu4+K2RklxAMeCV4ii4TCEawrIdAnu+YBi/7k6BBjEHfOnmMx8zMjeV9gDNjPynDaoH2ctq1Eebrj5GM0ZTveC0K23aSbn8MczyrZNHH08CDoOziICLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786090639; c=relaxed/simple;
	bh=lKJGpRyWh581Dqnj+3PEzfeC3ZAXZUwu2Hc1iYFreuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WxOk+dgIn5yW03Ike2dO8oLYZTx4uifGktz+SHjegL/5jx+Pp0gOdlAk7xEni/ygQarY6RGcVf3a5cLWfnZNKn1qNeddBR3gzRuYprbMigk7F3BjqPMqbpBJxSz8q0GzdpWTx0iJV5tGeifF1ACWSYv1LT6X9OP/drNwBxZ9tzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gX0j2CUQ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gX0j2CUQ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so3733740a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 01:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786090637; x=1786695437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PRtunFUAHa1sE6x3tYfwm8b9CkZHcpqXiGycwufdeh0=;
        b=gX0j2CUQcQp0KYGsc65nICrTD4ONv9Hp10YFwTJYmKkLJlOahV164F2VZ9AH8r3IQe
         AfVqlPKlgIhb40ZBgJsMpa0jUGLLL8xBSaLr998T3X4kfADCIsxWLV6z7CuAxPpTFdE+
         /qC/mnUPT4rJmz7QkXr6xB5C3tQ9zfHP28phncnwIqifzKijkWh+9rwUwzICaXKjyCe+
         vrLkVKmomm3q4YQnK8OOw0pPq0ODjYyjGnyBQScE0RQUhkEjwswzuzJjTkVX9bHfE+4B
         y1VU8ODZ479leqE5X91Ip5cdjBoSI4tLgUDiXC/jbjsv9OTLssao+X5SFC4GGpAI7Yli
         GRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786090637; x=1786695437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PRtunFUAHa1sE6x3tYfwm8b9CkZHcpqXiGycwufdeh0=;
        b=fXjOR7hR5/w3GmKakVNJqW4mRwLp/sZiI2+2oxNNshPs19HzhdsxW//3WMsbvcywG9
         H3vpZD03TKSp4ZuKdfs1ZFdGLq1D/ZeqMmpbxmtvaPx70Mv5gNvBRaEtAdp5v4yfEXBR
         F8gMmUIuk2HyHVJSARTwyGoYpHlVp+xoIAWojkuOOBALYF8DsLOONEubyYrztTeS5HSj
         20E+2485bjADB2sIQH7SdvXn7p3HNb6pBOb8todfA01abEKSysWvnMtZfXcuhicH7lUG
         UnGrBTohka+1S1J7oyEMohRsYKMltfARqOTeQ+7XTcvX9p4OCFNaSXQb01L1Iv0iYBQ0
         rBqg==
X-Gm-Message-State: AOJu0YzHERKU7NUNHtrvmFKBGEB7eHi0xrnUfmDszu+h7CobaRkEQc2W
	7/78pTJuALC016XMw1Hmha2fflLJRkEchHnBc4nq5XwWPCOScLX1869V
X-Gm-Gg: AR+sD10IuE04+svYvBK8CWD8DPAJh7/wxUbjL/4lRJ6CHjp5ic6WaI+Cpx1e87c6xjK
	trd3/n8MxTDtTQZ1TzzaaeyIWt986pBY/trSDULfun2yI0/NyNRm2Uptw/PWhHOtu+XnGVsSOO2
	8bthpr4PPe+GGKuxW+bBTUKSrKusCsmp6M7ELbJ0Uw7kchzj8j4qG/cUl0S3OL6jyJRyxrBiJ9R
	LFVBTC1ZPhxoblhOegEJ1qo3WuxZ7kb5v5GptsRM7mIjWgOLohlos9OcTyolVVDKakKAvRN1QN8
	siN8qQBUhYFJ9P9jlhAeMPVSxaRhsbBnWH/aYRJMV4OlBvMxd3sp8iTqMN0DNP4bmxu0HITuyF9
	FgSX1To1sWMAW/4lgswubQyJONS/SJpKlEPxPHyNqWkbIHcHg7U4iwNAQ1ccH/+sCH7AtZlDXV9
	xVy8h9b+691qKIfPKNiherBAHnv+rgbFkwCi4V9OHnf/5bEveWJN4neEZ2dilU++xmrMsAInbv2
	kusskLRuyxXlA2RfvNVx8+bm6bz0EVIqHsCRS0fbKuJIftBC/lLUbjt+pbM/Fw6liuIBPp2oVcM
	bEFm
X-Received: by 2002:a17:90b:3a8d:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-3903c5b9f70mr18650486a91.13.1786090637616;
        Fri, 07 Aug 2026 01:17:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085de8ddcsm3913377a91.6.2026.08.07.01.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:17:17 -0700 (PDT)
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
Subject: [PATCH 3/4] watchdog: dw_wdt: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 15:16:51 +0700
Message-ID: <20260807081652.38692-3-phucduc.bui@gmail.com>
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

Instead of only checking for -EPROBE_DEFER, propagate all error codes
returned by platform_get_irq_optional() other than -ENXIO, so that
failures are properly reported to the caller.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/watchdog/dw_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index c3fbb6068c52..39031445d754 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -611,7 +611,7 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 
 		dw_wdt->wdd.info = &dw_wdt_pt_ident;
 	} else {
-		if (ret == -EPROBE_DEFER)
+		if (ret != -ENXIO)
 			return ret;
 
 		dw_wdt->wdd.info = &dw_wdt_ident;
-- 
2.43.0

