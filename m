Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FDF38AC72
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 18:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226099; cv=none; b=EGaYu5V+XK646FxrJO/vOgVDpB9hhIlJ3IUMHZpZaQ/4h+aZneuE7qj+ystZalWMyjA555ZUIMvP9kuoReq3K3CZoAZW/gVa4suZAR/9EXUgnr7isTRMw4snVL+nYdguvLL8yokvx7LnoO2wu057YGzKhtd9hcUK1KeD47jngwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226099; c=relaxed/simple;
	bh=yrUsfkAtjRtLwh62KPwSFRFmpNvvFR+ddR6JC6p34sw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fsiXFwAk77dAkG+HPXzsyjFHzdkR2MbGh5KWdgkbMMuac3PRTzAicWVut08Xeih9vAum1gzPBjWPLIg/NKZC3Kxs/sP8KtGCu7mB5fa2OAq1zQUswWBo4RhVFRXIXId1aaM40EnbogaeC/SYo6WGNoc6Do+0+CL40Mg3vvRvaFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JDk9rqhJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="JDk9rqhJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso30816555e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 11:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784226085; x=1784830885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52Jp6a/iqi0BLwQzH7K5R1t/6SA31vHUiJs1fUpIqgU=;
        b=JDk9rqhJeFNbwLNAdw+6vtoviLdw+4j1Zs9Xvpu2O9Wr+s/S46W2kTva+lDHEtG9Do
         TxqMRuKwy4FFEr3GNXkEbOqHx9sRfR8HD7da/DjfnY741Kfw3qy1a44tqjBp60fp8zzO
         hJGmflOxJGBEkP5KzPgA/64OLDGRxRBHa53WbJahQfHOfcB45fc9X7E39QlL67+j1RGG
         rqJ0PBbq9vI3nVr6Uj4ELkuoZHYEoyJtTPj0p0D0JbM/USGX1W+1KaEJU6mb7Vut3Cgk
         fHOdSmt0Q+jQGgI8b5NKY1lXbIQ90OMuidzvr6NvZ1GfX/qJEbCI+bcuWn2STETzdbsc
         v6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784226085; x=1784830885;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=52Jp6a/iqi0BLwQzH7K5R1t/6SA31vHUiJs1fUpIqgU=;
        b=FJF+1eQFsL1WwLuyuP7L/NIvpRYt2bV7OCbLo0yTXARyrzsIFWWCZc2/stQ9XcdTvq
         jRWhkKZ1qPMEE4U8iKxpTdEF6o6JTW4DaNDAeQ82CEqkYECOqnIBl8CSpE7uYagTE7EZ
         01TqYC1i/oyPcSabhI/2pyS6tW5yvD5B/umcbg8XAUS+UY2cZpCX0kkkPuT39L6yy5Af
         N0t991ELU+TOalQDI0HIZrWvy6mfGDVkv3j3P0EOkIhs5sPLuUDd3j3Dx+7bmnvztW5O
         5tGKRV90xSSFiFvGW0epyxrSPr4zRBPps/EU3W34XOPtLWezXWoDinB6THy7XFSM25MM
         T92g==
X-Forwarded-Encrypted: i=1; AHgh+RpELwecsfW8TOVzv9uUrIsCcPHWY1apWNneAsdJdwxAU468wUysTyhc7aP6cqBAoh6tzIb+blUXLPYCpViG@vger.kernel.org
X-Gm-Message-State: AOJu0YwHRL99P7zkJw0t4dsdZUPpdttEIWRQYX2ePbrw5BMKKtG5c3Ok
	bGvU3iRgT2dZG4fp4DGiCGWFlYiL2pAuLHECkodiSzHdBGZtG/xmSajudPVQQ+Qe5tQ=
X-Gm-Gg: AfdE7cncKcg+wz4yOxrLzV6nLIAcEcHtTC7G2BlxB4GRLVJMpJqOlj+j8YiRnYCiKEQ
	iFCTnxkVvMyZWfs11xra5CuHmv56Ru3PU/FGv5IrFKYXC5lrSLZ9cplSP70lUMuGo0GHWvtWxhg
	voO68ltFETdgob+2w25j63FTQkPqfuc85krTgOQHrUqETF+a1Omd8gQzDXnBNojJaz3lXbmxuw9
	I9x1j9ZXScxSi4Jf0GguEIp1IkFovJl565bi1MgYGzH7hwqqety0JRbUGQF2lvkaZmUC/36EHu6
	cJ0HOH4lnQfGipmNpyfZWaHm2Xp778BGNE29Iv2J8XJvtlD83hx4ZdH1or9JZCVRINDajL0veAE
	v+1jhnKj3cO08zxgBc3zMSJzXntoK1nPjCA2c/Wqmdx2c9UAeBBNnDsxANCk1PyErCyPG2rF/uX
	CALY7QMXc=
X-Received: by 2002:a05:600c:198d:b0:493:ee57:1207 with SMTP id 5b1f17b1804b1-4954839a19cmr5641005e9.10.1784226085067;
        Thu, 16 Jul 2026 11:21:25 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f464c7c96sm25827713f8f.33.2026.07.16.11.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:21:24 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] clk: qcom: Drop inclusions of <linux/mod_devicetable.h>
Date: Thu, 16 Jul 2026 20:21:05 +0200
Message-ID:  <7b6441aa3b0dba35112ea486bfea3b3171d8527b.1784225976.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2182; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=yrUsfkAtjRtLwh62KPwSFRFmpNvvFR+ddR6JC6p34sw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqWSERdGPTgjjhXsbBfcUSN4GI8EVAWiWqpDuUO fVGlxMTBcGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCalkhEQAKCRCPgPtYfRL+ ThYYB/92Bx74+bJ07W5PS/6VfztgbJwZEQmfgl9HG/eqIill/5GWmPQi0Sg3sfAOGlPkadji11f 4CG3Y5cThhF/8bvlddzJnP2FZRFosZ3Fo5FFmJTL8GvXe7GCoCKsryah4ghlGX1n8C0yJVqCE/S sXANN1/VLSKPZoeswMAY+jWZeojd/62BiEKQ2gBxz2kQEtlq8e39kwgcy+tXwhxfoyRXy5luQ5t InemUur1SbR732PnJLh2W24zVPUubfDIe2arG8+7UM6M5Ci5QeEOBHVv36GCgGAWJdJzhC2NsSO hRK2XbMJerJYnjKYt2wD9zJdQ0ivKuNiglXe5lPViweF16x6
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The only used symbol in these four drivers that is provided by
<linux/mod_devicetable.h> is of_device_id and this is also provided by
<linux/platform_device.h>. So drop the unneeded include which brings us
one step closer to removing <linux/mod_devicetable.h>.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/clk/qcom/camcc-glymur.c | 1 -
 drivers/clk/qcom/evacc-glymur.c | 1 -
 drivers/clk/qcom/gcc-shikra.c   | 1 -
 drivers/clk/qcom/videocc-hawi.c | 1 -
 4 files changed, 4 deletions(-)

diff --git a/drivers/clk/qcom/camcc-glymur.c b/drivers/clk/qcom/camcc-glymur.c
index a80f05b7bc48..d4b11e6a6efc 100644
--- a/drivers/clk/qcom/camcc-glymur.c
+++ b/drivers/clk/qcom/camcc-glymur.c
@@ -4,7 +4,6 @@
  */
 
 #include <linux/clk-provider.h>
-#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/evacc-glymur.c b/drivers/clk/qcom/evacc-glymur.c
index ba124cfc1a4d..7f031b05a94a 100644
--- a/drivers/clk/qcom/evacc-glymur.c
+++ b/drivers/clk/qcom/evacc-glymur.c
@@ -4,7 +4,6 @@
  */
 
 #include <linux/clk-provider.h>
-#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
index d5222756f214..03e6a954de25 100644
--- a/drivers/clk/qcom/gcc-shikra.c
+++ b/drivers/clk/qcom/gcc-shikra.c
@@ -4,7 +4,6 @@
  */
 
 #include <linux/clk-provider.h>
-#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/videocc-hawi.c b/drivers/clk/qcom/videocc-hawi.c
index ac3ff7202fa0..318270105dfe 100644
--- a/drivers/clk/qcom/videocc-hawi.c
+++ b/drivers/clk/qcom/videocc-hawi.c
@@ -4,7 +4,6 @@
  */
 
 #include <linux/clk-provider.h>
-#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>

base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
-- 
2.55.0.11.g153666a7d9bb

