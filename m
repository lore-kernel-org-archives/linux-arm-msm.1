Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B703C246788
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 02:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784427770; cv=none; b=N8md/9xv5AIGTeIDbWBM+yRSKwBoLMkLwAAk0VHQmp81059Kc8Zl11M5Wdq/dHqHgFUnO8JHFvR0k311kOzqQ/Zq3MbVa8wrC0bg5+OL7o3pC1ywFrdUnE1AEjAV0nvbKQq+b/oaPnZwoBp/nKuUFVAUogysC+4gC9aQw/+t9EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784427770; c=relaxed/simple;
	bh=205PGOhWA3GiaPzxyZjcK2paETYLYmho/eXrULg/4NA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZWOwh28DlX3KBvkh6DiswQ4xhna02MLimzzDCFQa2b6nLIXG+m9AezTKPGPEbnWAhL4ETCgKqwJthc09RGMwM0GBmNNF6NW7dN4dswFugbheCxibw/vEHunwRrEJzcNnMjAu8MiWzi91jGTwdzIvbSQjqW1+nLc6dl2aMI1V8BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RgMd3UGw; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RgMd3UGw"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66771ded50aso12122454d50.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 19:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784427767; x=1785032567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eflu4Al3WySioMoQONHlRvylppCSuqZirkAbybWJ4Ns=;
        b=RgMd3UGwl+d7XSbZz8/xVUUayKtnDSdl9UuDNalV+KfynfZZy6MUWam6PSmgFgngUY
         F4sQ+kg3ec2FhBkWSmsbrCQmBytpWpVW8mk/s95DlC85PmpGMdOLQDfRFLptpkda6vjW
         N7zoVFy7adHFBnXwPLxv/wFP2j/1MCKJLarWUXTQWOeI+UX2Gbt0V9kCYQ++C/KJDt74
         iQtPLmQQJukH+8oANp9stXKvue+9DNmQwFj6BGWXr+G3E0W13FLutz30dRvT+mD+rnsB
         Uvfdar4b5T4o82ZgTxf1b9PtfZNCF/LBiNvNmn6tGcl6cU8qjYyQdPSAjlY+nAqqbN+7
         0ftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784427767; x=1785032567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eflu4Al3WySioMoQONHlRvylppCSuqZirkAbybWJ4Ns=;
        b=W8/AsTG6Ws0ii1eX4CIXJH7+zHOIvtHqFbYhjZvbYONjgSbYBnRo/jd4lW9d+y0Klm
         mT4NzIG/lIxtEFdVcAwVOajiPkOspeReQiAqrAs/E+hhsrM+0ZVSu0W3163dX0JAKOTO
         eib7Ta0O1Q+W03jut0qteV7BgiMDU6O7t1cJLOjjLW3tC9yxVHuQoICw8jc1eawoGb/5
         EcOHjwZWVlTNrNanwjkYrJmES5l5v6WztTWMeZwxFiTLA1/nTAIPl+cnAAOi21ScrgO+
         enKhElHuP1k04VM6Xu+3hXPu28tnaw8t6pUiJGX18C3OQBt/BOC/HqQB6N7jLij3y8E8
         Jcpw==
X-Forwarded-Encrypted: i=1; AHgh+RqafB5oJxkQMKlpT0KpPwm2yuUB9ZfAfU8iMwoUWi75/K5SiBZg9qxyN9JMPYUK8Je7aXy1q+o2GrCO7bAg@vger.kernel.org
X-Gm-Message-State: AOJu0YwgJuW2W8zeNusDbpM8BWZ989LATT9SMigWXDlgd17BrpHebiFj
	vmtc9ZIydZFcBAF8/5hewRAF7h9ZT7fVS4ND87YW4cZxbwAMUn50Mrrt
X-Gm-Gg: AfdE7clyGAa8orLFvIgNAviNo2jki2LkcsHszhazOYirwqq8v9LLwPVeaRb/64uRzLy
	kEB4kjGJT5joL2USDBxy5r4Oz5h51DVryFmM3y3qaF++dUuN4eaECC0ywvcFaIcrZl8oiwLsN0b
	EtlNHcODPK/LHsw0MNCVgSUzTRYp0SFzVaSclZQsNV/xE0rTvzT+bhs3ID1KTKaER4vCEEsxdCc
	jLbmykfAL8RDEuFaKVaetimtc0aLBukAUUa5Q6oDa2zS6+6OY3Mtz11BxXyNYxXBk+JdeaWaYRg
	VtPZUvRTcyU4ftRqVy2zJeSGwxTs7R6gfh6xO+0zMgq3HvdQDTjw1n4NnIuYl3jF4Ol7vboUEai
	LwwH6NSrevOa1HEfCMyGXSklhL8+a7rJqvGeTJZq9UR2PVWHMTlSYKA6lGo0giKH1Z3efKsJg+k
	LOEW6KH77By5UhzsvF+pNYT2k2eKO69UT04jY0hnukfIkzYydvk6hoCl/UY6zqK4wm5AbTuw==
X-Received: by 2002:a05:690c:4d84:b0:80c:2874:67b8 with SMTP id 00721157ae682-81ef254a7d6mr29568917b3.32.1784427767541;
        Sat, 18 Jul 2026 19:22:47 -0700 (PDT)
Received: from nixos-office.attlocal.net ([2600:1700:566e:ba00:173e:d781:2a07:621c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ef4033935sm37247817b3.11.2026.07.18.19.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 19:22:45 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: srini@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	arnd@arndb.de,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] soc: qcom: fix unmet dependency for QCOM_PDR_MSG
Date: Sun, 19 Jul 2026 03:22:41 +0100
Message-ID: <20260719022242.139472-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

QCOM_PDR_MSG is defined in an 'if QCOM_SOC..endif', so its selectors
QCOM_PDR_HELPERS and SLIM_QCOM_NGD_CTRL also need to ensure QCOM_SOC is
enabled. Otherwise, QCOM_PDR_MSG has an unmet dependency, such as:

WARNING: unmet direct dependencies detected for QCOM_PDR_MSG
  Depends on [n]: QCOM_SOC [=n]
  Selected by [y]:
  - QCOM_PDR_HELPERS [=y] && ARCH_QCOM [=y] && NET [=y]

This unmet dependency was found by kconfirm, a static analysis tool for
Kconfig.

Fixes: f2866e6a27f7 ("soc: qcom: Hide all drivers behind selectable menu")
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/slimbus/Kconfig  | 2 +-
 drivers/soc/qcom/Kconfig | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/Kconfig b/drivers/slimbus/Kconfig
index 60b0dcbc0ebb..5dded61191e0 100644
--- a/drivers/slimbus/Kconfig
+++ b/drivers/slimbus/Kconfig
@@ -17,7 +17,7 @@ config SLIM_QCOM_NGD_CTRL
 	tristate "Qualcomm SLIMbus Satellite Non-Generic Device Component"
 	depends on HAS_IOMEM && DMA_ENGINE && NET
 	depends on QCOM_RPROC_COMMON || (COMPILE_TEST && !QCOM_RPROC_COMMON)
-	depends on ARCH_QCOM || COMPILE_TEST
+	depends on QCOM_SOC && (ARCH_QCOM || COMPILE_TEST)
 	select QCOM_QMI_HELPERS
 	select QCOM_PDR_HELPERS
 	help
diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index fd4d4ecd2df0..ef844947593c 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -292,7 +292,7 @@ config QCOM_PBS
 	  This module provides the APIs to the client drivers that wants to send the
 	  PBS trigger event to the PBS RAM.
 
-endif
+endif # QCOM_SOC
 
 # Options selected by other drivers from different subsystems must be outside
 # of the menuconfig if-block:
@@ -314,6 +314,7 @@ config QCOM_PDR_HELPERS
 	select QCOM_QMI_HELPERS
 	select QCOM_PDR_MSG
 	depends on NET
+	depends on QCOM_SOC
 
 config QCOM_QMI_HELPERS
 	tristate
-- 
2.54.0

