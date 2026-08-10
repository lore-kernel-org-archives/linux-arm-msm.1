Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E243AEF43
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 10:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786357323; cv=none; b=RDVD8Sw+NDME/da7bR3Tp/HEG1Lf3YLg3y7DgQ0qe/C6ahLZxxFSYw8wVGMNI3luwWrDZ4C4+33qU673KXylYDFDIQYviciO16/6sumSzA+03y/jke5FmNO1qtVKnGTPulH6FTzIebgvrA0lOtZMYgC+Af8Dj/1jVEcfMHe5umo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786357323; c=relaxed/simple;
	bh=otBjEI5x5e6oRJAULxGf/ldS0jPIB6uMht/s0aswS60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I4eYa33KpCDRnpZUGbfu57cxV0Vy7ETS1Ae2OJ2C/7FASw2VXsZbjRCrS0onDeODpYYt62lY4Midqdlcphxficsfs5Kc/ADcvJkxt4Lzwee5niRgCaodf9yFWOCzXXmp2ZtwFg6MKweFX8kSk09WnOK0HaKkk/HVc8+g+eesuRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYUpi12L; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYUpi12L"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3900e39d935so1665063a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 03:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786357321; x=1786962121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=80/k07EkbH1ecXMl0R5Fs9cFDQBD709H2DM1r3/6dkI=;
        b=iYUpi12LHsxExBoVbHX8w+E8e/nFEa6eUZSiUhbUL3qdWupnSYfBwGpW0Nmxtb4Sfb
         wg3DQSSq2O3/SuwJHO3brrLiDsXUo8olxfV9J/ft59EJEajgFIkE+NwraPw2oOFUuMYl
         9VO8IHgwCqB9zM/E/vamhqiE4wXGh/SAbyD+vOorWaBQCSBq8frCEsRULyctAV9I8Xev
         I2y5NWrPQmX7o+sLemynLAS+vCDy84FGQzh/8WCt3fAw5bBD/OjQzm+qpaGL9E5xrtum
         PpdvNIWrbDDVUei8xzxqoZ683JS3LMb2Iw6bI46jsjTvCAFX1J6jvdQmGw3vTSHyD1xJ
         T8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786357321; x=1786962121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=80/k07EkbH1ecXMl0R5Fs9cFDQBD709H2DM1r3/6dkI=;
        b=cmLzxSenQo9xR0lKXKp4yKHWSN8pMIocm9k0L1DNk6MDT2dqmL/Mu6uhIMTwZ2VBrC
         dkrAc3taaAVww5XVK3Xu6vWrpHqCSVbNEB6/cGLWg/psX6EdXZF7X7uY8OqXuPdl4dFY
         ZyC0UvsueAAQVcb6gBcarq2zuEFT/NsgkNn5CciUavUVruQiNAc058ordLEM9F1juaAl
         4Dx+42efGtur3UzKuyoHe59tG6hY/3sa9J03FZeiEdfFFOcLJ/H4i7kS0knCBr83m8hX
         5zgUrV4Dm5ANE99JwuJtuouGI1DHlih50zFYztp8NVyKMo0GLNvsPb2xYJakywYIDXeB
         krJA==
X-Gm-Message-State: AOJu0YynSX9OMzpvxz+BlXGIQtmgc93D1Qs2Aqe8Q5wxAEIpmh/h6ylj
	ECxBLyfRNXOHLiFijcvCKCxlf3IuqNJzgYPrGejt68vpq+G7hM/iHqUk
X-Gm-Gg: AR+sD12dSMq1UlWlkKlqyfu8i/19MsUZDc7fHTsgd/41SCu2aRofZjNqr/k25qyVUzP
	B20IhaZQ7XtqyotxJN2kegAZWYKQ6g6Qdl+clNPrjvGj6d4A8iMsY2Z4eJpgYPoEelYyJsTy2cR
	B1ZnkbFqJ6S7hU/eWk/yyw02jhKw0hAdqvExNM/gWb6GAn1+/5wQkgAAG6gjD0Jl751/SiYkF2b
	7sQS/cOmpuQIpHOhjo7I7Fnv7pBsAs6oKSHiAa8nrfpSxqMZw0vwURmpuQtS5sF35XFfXUXSLc1
	C08kvnOpsWAGe9UKh1lDkIxJAMy1ojrLM66X+1bkpduThDZJZfz+Pvb75+Pd5CH0mW41My5eeZU
	HSTg8OFKG3sI5JGLhUo5cSr7C90YklvhSpTowKc0vzKFsCgOJCxEA7j92Qg+tCc6vWK8fBYaQ9P
	VeMJdq5Gs1BRkO4Qcvl4vZ5W2kFOCULoCQ4tRICqAvYrrL3NOEOo+QxPpq5kZwh0Z6beP0zyVIX
	yyuTogDqM/nGz7QkdEgBZDLLMJ3KbGkrONwJcSScDtLiLlma/H/h48DSkzkqZKEGI13FkVwzjnk
	axapgWIPKVfTzAk=
X-Received: by 2002:a17:90b:3f8d:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-392cc9048ccmr260505a91.5.1786357321066;
        Mon, 10 Aug 2026 03:22:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b1573defsm5039831a91.1.2026.08.10.03.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:22:00 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2] watchdog: qcom: Propagate errors from optional IRQ lookup
Date: Mon, 10 Aug 2026 17:21:44 +0700
Message-ID: <20260810102144.51663-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Link v1 : 
https://lore.kernel.org/all/20260807081652.38692-1-phucduc.bui@gmail.com/

Changes in v2 : 
 - Update pretimeout handling based on Guenter's review.

 drivers/watchdog/qcom-wdt.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index 49bd04841f0c..9fee18fda750 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -289,18 +289,20 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 
 	/* check if there is pretimeout support */
 	irq = platform_get_irq_optional(pdev, 0);
-	if (data->pretimeout && irq > 0) {
-		ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
-				       "wdt_bark", &wdt->wdd);
-		if (ret)
-			return ret;
+	if (data->pretimeout) {
+		irq = platform_get_irq_optional(pdev, 0);
+		if (irq < 0 && irq != -ENXIO)
+			return irq;
+		if (irq > 0) {
+			ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
+					       "wdt_bark", &wdt->wdd);
+			if (ret)
+				return ret;
 
-		wdt->wdd.info = &qcom_wdt_pt_info;
-		wdt->wdd.pretimeout = 1;
+			wdt->wdd.info = &qcom_wdt_pt_info;
+			wdt->wdd.pretimeout = 1;
+		}
 	} else {
-		if (irq == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
 		wdt->wdd.info = &qcom_wdt_info;
 	}
 
-- 
2.43.0

