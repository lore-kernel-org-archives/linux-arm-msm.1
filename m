Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687944;
	b=ZJHS1kdCoRN2vUfpEauQMutE+ZrF2G24/EjDeb4gHQfTbifNM25yQXSc3HjU7HAaW1Vl
	 ww1rqrLBVB//JEGMJDMn1sy1zbSKh85xzisCXBCWoolDFgCw5llUAdj7uUImi70hG8s/3
	 1DREp3AMRFmSIiHhADXTbWSUyqAk5IlQ7ZZnr1t4HlCE5wbBJrj6PcKGYd/MgJ3yf/XrB
	 xh44eScOso3gfeJgMf7iJeD1iE6jaPyp95baL66xrL1Dt095mOA2XzcrCjXdUMQ8aGgWN
	 oNqxoaeyQ1Qb0O/5H2a9kiyBXN6mhnBTQQvNyrMXPN2jYVXOyAjn2EZb703PeueMmcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jMHX9wN/BHCrbGnqRhP4+R8W0f/fc00EEaOQLsHpHDs=;
	b=Hg15EYHEK027/5dXVdnsW4GdM5f5j0fbahbgBkjVhp8HpJCglkwAnAgS89uVQDPYCSpz
	 c2zWpInvg2DEfUsNA0n/05YKJwPdprkSZnWwMm50tB5eAoUeOcwm8zGA5lY+Uj79vOHBG
	 xgrC9sYHc6KZL/9uhf9RO9HYWx/SUN/fKJvrUASa+8GFWVZu2NU9f3VhK6z47x1i4BIuY
	 5egyOISeVk8qR5pv3UBrEFg4bLLHV/rs1hh+Ysn+3WW12v3rWMEUmVPif9kS6yHlYW314
	 cHnklaw+XH3HtK/8N01r/ohxKmWM4ByIqluA2m4yWwNosHs5doUSKqrZ2t1HanlSuNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZNtXLkbq;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC124606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 16:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC124606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZNtXLkbq
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35d0be18c71so1237309eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792687943; x=1793292743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jMHX9wN/BHCrbGnqRhP4+R8W0f/fc00EEaOQLsHpHDs=;
        b=ZNtXLkbqxXKhm9LkyYZ3wmwXyLpGV4IAMBJmnHcSAGUODvO78X7nykOabEjPuQR/6f
         UJjQ8pmf1efreQGhE1YwaQaViWz9q249jdFTEIfmWX3XBPj9z7s3XwzGFgcOfczn++gz
         NTBj4IxQauJoxjGBa8VKbnSRin1Tj8KjOLKJnsiHfg1j0l9sr8diNw0TxgMjHAR7HgNc
         uIaNm7r872/J7oPO8pOrqw6J7nz6ImCe5V2GcLsmylQOAZ+YrlhGBCnZ90Xk2O740Tj9
         z7Rn/idIEICZqAckbDNFdfzo8OktNwoYo579qWKB0A8UfmKffQi12opciVzkXFjGV/F0
         gTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687943; x=1793292743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jMHX9wN/BHCrbGnqRhP4+R8W0f/fc00EEaOQLsHpHDs=;
        b=asjg4qcPhTSy0TLPLJYaPzj9/erYcTvUstLwDDWrCr53PLIvrNki5DYqD8LzMe/GR3
         /pcKkzceUPfbeFc/6oILlDate/oZmhqktC5XbvkV/4ob/HaWCubn1mDOrwkwFeiLqSq/
         X0TkpF7ejeYFaLfYS012dQ679vjjBmE1ly1pBY8OQ7G4NK+5UX9mVUJA9eRKgZ20TqXc
         AdXYpttLBn1nyLDsYZagtz+7Fvstci7Ri99LLCBSkn0plu4A9KVRCEEfwyUPZZlzk/ce
         hNGjT3jBhCT2mxqB9V2szCcFVLcl6nbSfFPRjWEj0ZTdzvPiQ+bGo2agIRa8BTWangHD
         AGrw==
X-Forwarded-Encrypted: i=1; AKwUvBzlLaqP72LVRxpbKkbbnFw7d3lAyWZ+sXF834U/jiFtXRS5eUoiqzLB5B4cP6ExPyGVxaZFOoYHnqDsnt0m@vger.kernel.org
X-Gm-Message-State: AFq9FYIc2+yBD+GFQaGUvFslCpaD8z1A8DpFahqN76+iZ5P6M++hJ5Lb
	N5FcdI7MugSdOvRPeorJ1magHuHETDEv/Z4NZgU1DYAK+gEd2KdmO7VZRq9Y2Uc2h4IrCw==
X-Gm-Gg: AYBFou31tIVurxDZ/+JdGbn+r8Eu73NzJVZMqm0yUh32oBr8rqUw9PHs+BVyPSJPux0
	O7vpodXN8CzJj0qruGV/qXZNxhs2la7xxbC0cm8CVZNpkQFG4E9yeyuNEwYE8eLINEWHrznwOXZ
	Oaqf3/NWrYOAKU7QQC6Qrzgi198DcG0ecUGOyUfdRQ/Nkpk/u63rdOzAaMQ4fg8VhGi5qnJvXVO
	v2NvoeQ0Uurhnuof+uOxjWLNPnIKxq0Rff5e3+xxcFOELsJKrF/7Pi5g07/zSkoucD0sq2Qv/V2
	joj+XChBFUZ6QmqDDlvXuuvVB660YioJ1QdzplgvKgia+MVWf/NigU7nbiUClH3N+FhBJfAoltw
	e9yguUTO37z1y/Myy8r1zCf87OB7AP5Uz67Z7CPOIzCrfQyPvxR8FoLDTX1smtqzM69eVjeay3V
	w9+/NvcnRr3m+nmfTAWKWhEgNbt8JzjTQOr+l5d5cQoPP1vim1RuvDxl+Y5cPVtRO26uSB9a3no
	9Li1mbv+X2RrMq1B5V+vKVfTsCa9RXAajToCjwuOJ2mAZCroNz0nhqjL9XvPA+td5mpBJo=
X-Received: by 2002:a05:701b:4250:10b0:184:40db:6bb9 with SMTP id a92af1059eb24-192f2d2204cmr3620614c88.8.1792687942800;
        Thu, 22 Oct 2026 09:52:22 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bb7f098sm25263741c88.12.2026.10.22.09.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:52:21 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	mani@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	val@packett.cool,
	wesley.cheng@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: qcom: qmp-combo: Leave the USB PCS alone in DP-only mode
Date: Fri, 23 Oct 2026 01:52:19 +0900
Message-ID: <20261022165219.1368-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In DP-only mode (DisplayPort pin assignments C and E) all four lanes
belong to the DisplayPort PHY and the USB PCS stays powered down. The
USB controller can still exit and re-init its PHY in this state, e.g.
across a system suspend that loses power. qmp_combo_usb_init() then
programs the USB serdes, lane and PCS tables over the DisplayPort
configuration and times out waiting for PHYSTATUS, and
qmp_combo_usb_exit() resets and powers down a PCS that is not in use.

In DP-only mode only take and drop the common reference, but keep
counting the USB user, so that qmp_combo_reconfigure_phy() powers the
USB PCS up when the port leaves DP-only mode.

On a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with a USB-C monitor
in pin assignment C, resume from s2idle failed with "phy initialization
timed-out", the dwc3 resume returned -110 and the following xHCI resume
hung the system.

Fixes: 896277138c13 ("phy: qcom: qmp-combo: register a typec mux to change the QMPPHY_MODE")
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Tested on a 7.3-rc4 based tree, where the mux switch itself still drops
usb_init_count when it enters DP-only mode, so the tested change skipped
the count as well. This version follows the reworked mux path in
phy-next and is build-tested only.

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 187f0cd11f6c..6e3406d519d2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4459,10 +4459,12 @@ static int qmp_combo_usb_init(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = qmp_combo_usb_power_on(phy);
-	if (ret) {
-		qmp_combo_com_exit(qmp, false);
-		return ret;
+	if (qmp->qmpphy_mode != QMPPHY_MODE_DP_ONLY) {
+		ret = qmp_combo_usb_power_on(phy);
+		if (ret) {
+			qmp_combo_com_exit(qmp, false);
+			return ret;
+		}
 	}
 
 	qmp->usb_init_count++;
@@ -4484,9 +4486,11 @@ static int qmp_combo_usb_exit(struct phy *phy)
 		return 0;
 	}
 
-	ret = qmp_combo_usb_power_off(phy);
-	if (ret)
-		return ret;
+	if (qmp->qmpphy_mode != QMPPHY_MODE_DP_ONLY) {
+		ret = qmp_combo_usb_power_off(phy);
+		if (ret)
+			return ret;
+	}
 
 	ret = qmp_combo_com_exit(qmp, false);
 	if (ret)

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.43.0

