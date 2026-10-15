Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282653C9EF6
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075138; cv=none; b=lowuyZusP5Km8J+iuzxUF38dO96+hzvJ9qQCbrpoWKMZr0T/8IgiuBh4vsXGjcDtZQPAeYr3cVKAb9o3SnadVXgmsFRkddi5SGABPtNdvqbb0sOC8PqTM8e8cH3DU06+oZ6WbualJ9UQNtR8I/jwjEB4b+gQcRJpdrwn7j+84QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075138; c=relaxed/simple;
	bh=4mhyYh9AhJdWh2Z54n/rDsetUsO9wDF5wBn1LCUSmSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=osz4ZhxzOxlg5405uuctCwjjHwhHu9ijsVTN9Zpi4VQc71N0DmxtjQcK+rcYnIieU2X4wkaXaKK8276mJQrIClTTp3io20+nBv8JIac3h0H8e2zRceDWqTTOJT93pPfwXidNKXE3PBofqC/BEfd+ByeE9KoDOPHjhD7Yh+BB6/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=fHDn0JsS; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="fHDn0JsS"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-918f75a68f0so85284546d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792075136; x=1792679936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrZ4UoU0O5LeVfAO0Ji/pzxgUsFsUywSx2q0o8MOUoM=;
        b=fHDn0JsSQRiQ1IQKzOaAZDzR8HeKmDNC303oCK3wjOVrgAPQy0NnMph3ueZxeEXU+0
         syIfkxDMcff4VygMKizZ5bhXMcb/IznP2nfgEBMDUmnmhCE4feA3uwEEPTpG3UStE9+w
         qjRFN+pxog68RoxJVipo09Is93b/4HJ/SnTid8RXJujjVVXRBStkKhwEr++//r6N1RKx
         VnvMouU7QO7KA/aYaANOgI5X7/Wm1dsB+GxHYcssQjs7SEwLW+yIdqpP+98DC6lZMPmC
         5SVAZbAc9aT9CYMavyvcUS9F3FHm1lr530Jr74bDJJZqZE2oluG18cd5Eju+vJwy0kXJ
         uGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075136; x=1792679936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PrZ4UoU0O5LeVfAO0Ji/pzxgUsFsUywSx2q0o8MOUoM=;
        b=m9xk4AowVEWA27miUC37uoff+vYFFBbKBkLze5/K7bUdSaliCOo57npl6Astm6BAuZ
         weZRDegGon1RXodL4x7axF8eH3omXsf96hzJyd1iVeneoImF1HND5eWGFypMFu0wIUMG
         hwQ1rBw/o/EXdI3dSc6G1j4N9ZRhhp43wh7Gb0fu9mz7M95JvOdwP36HU8IGhBXdv54v
         tGvu2His3SYTXGbe/pvmUO0Be1i6wr8OgQtxxvRYc/NxmuWm2gDI4GUzib2rWPlk12HF
         UolHWuy4GFe6QpbvYIX8i6FyYxQTqZKnP7n963neBbvB0sVHU4RU4eXSyVp37ZewU/HP
         Jvyg==
X-Forwarded-Encrypted: i=1; AKwUvBypUaf7+drk9Pg6BJDlveui5s5ud1Ue3ua7er1Pf7MWVUAIMVIkZBo/DIH3YAjWz7NBZCUC1MfZPZmV6IEC@vger.kernel.org
X-Gm-Message-State: AFq9FYJeB/m2fMqwLHtLeK0ppOJjlOs8cbx6l+QbmQB0dN50Rb2PQkXm
	E1+4Ju20B3LsFywIx77adjAuvyaf70W9KXzKAg1YU1/3hWZzSGLot4+LFXpY5QzNO+4=
X-Gm-Gg: AYBFou20Kxim1NizuQ3Z/vII4Cf+McmXxigW2LpGvbP4SJV5n7s1UvzMe/9vyXJRBtf
	+6vzO03HUvtsoU/VH3odePs+6LwZn/OhzXVgHUiHhAdyH82xORS0M8DlU/WbHQ32s+m7YP+h+XK
	c31/vTnmwtJC6vVsNhQNRFH+l6pboG/X9zuIFRsSiFNGR/Dhtkfi7Fv66H2ccuwUvGac00aF+/o
	hHVTF6uBgBEPWjhbZLZVH1nb/kTAiYVOS2jVu+J4RwVrIQVo6VUlED4aKsJRS5gfB53dOu7dkHy
	Esm8tp1p8vIaLBx6JOAJuDgHi4HT1WU3PGG7ZIxapg/RXKFchT6qkbdPmowHn2B/bpkzjZ7Em2D
	52roAE5euJSfkQG/zOcepZxPUCRdnt7fzYJOzY8uXic81iANsQsv8V7TFty84YchGfdENuumnDg
	NgC7A4xjTG4VLXcLXJo7Qs3uiAeO7VcqqdRH9sPAWuFphLPZtUVysmPIyetLCEL8BlRHV+IGDse
	Kyu0druB9uVNA==
X-Received: by 2002:a05:620a:4411:b0:93e:9292:1ba5 with SMTP id af79cd13be357-93ebd20defbmr3353447685a.21.1792075135235;
        Thu, 15 Oct 2026 07:38:55 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97bc6d42sm82581486d6.34.2026.10.15.07.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:38:54 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk
Cc: Daniel Thompson <daniel@riscstar.com>,
	ansuelsmth@gmail.com,
	donggeunyoo.kernel@gmail.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 2/2] net: phy: qcom: qca808x: Add regulator management
Date: Thu, 15 Oct 2026 09:38:47 -0500
Message-ID: <20261015143849.483339-3-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015143849.483339-1-elder@riscstar.com>
References: <20261015143849.483339-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Thompson <daniel@riscstar.com>

QCA8081 appears in embedded board designs paired with GPIO controlled
regulators for its power rails. Add logic to allow these regulators to
be turned on during a probe.

In order to avoid the complexity of tracking state for suspend with and
without WoL we take a tremendously simple "always-on" approach to
regulator management, essentially relying on BMCR_PDOWN to conserve
power when the phy device exists.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Co-developed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/phy/qcom/qca808x.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808x.c
index bab26e4c61408..4aba513b9a512 100644
--- a/drivers/net/phy/qcom/qca808x.c
+++ b/drivers/net/phy/qcom/qca808x.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include <linux/phy.h>
+#include <linux/regulator/consumer.h>
 #include <linux/module.h>
 
 #include "qcom.h"
@@ -181,15 +182,43 @@ static void qca808x_fill_possible_interfaces(struct phy_device *phydev)
 		__set_bit(PHY_INTERFACE_MODE_2500BASEX, possible);
 }
 
+static int qca808x_power_on(struct phy_device *phydev)
+{
+	static const char * const regulator_names[] = {
+		"avdd18", "vdd", "vdd18", "vdd125"
+	};
+	struct device *dev = &phydev->mdio.dev;
+	u32 count = 0;
+	int ret;
+
+	for (u32 i = 0; i < ARRAY_SIZE(regulator_names); i++) {
+		ret = devm_regulator_get_enable_optional(dev, regulator_names[i]);
+		if (!ret)
+			count++;
+		else if (ret != -ENODEV)
+			return ret;
+	}
+
+	if (count)
+		fsleep(phydev->mdio.reset_assert_delay);
+
+	return 0;
+}
+
 static int qca808x_probe(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
 	struct qca808x_priv *priv;
+	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
+	ret = qca808x_power_on(phydev);
+	if (ret)
+		return ret;
+
 	priv->led_polarity_mode = QCA808X_PHY_LED_UNSET;
 
 	phydev->priv = priv;
-- 
2.53.0

