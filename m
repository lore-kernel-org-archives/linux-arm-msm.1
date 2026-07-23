Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B44314B8F
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 01:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771196; cv=none; b=Ec1z6lDB+doy1vcJq2oj+3DOgk95pI7e6ECNzSijAStHlUHT/ZhDeyrsJs/btlnRfEhcnDnvbV2utBeRECRNeH63eA1bTNTFE5/4e1Jtw2PZ2AeoDFOTInSvoq6ULaINgbqhLk3lXu/E2K2MY01aKNGf1pzcNqfupptreCZNCjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771196; c=relaxed/simple;
	bh=wgB4PIrpr1YYgW5ec9JpjdnWXn1cEPDlUN91lmzw3xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dAgT8QSh6a8eBbidr+fYaXNaa4YaQNb66nmGCUk06VmhNLUFAml9pdSTp1xdrByDOiiBr//xloOdxUfM08eaD7bv0pd+gTOoL7KGre7w4zC/X1+YBJ0r0qvu6sZdamezVf5jgagHwAIMoucRFaJi/f9LvECHlvTx0IcSdS1JyEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oa/D86CB; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oa/D86CB"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6688dfaed31so81766d50.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 18:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784771194; x=1785375994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+JKcIPJqaMAyH6OdXJ30k6mM2iyhDEyD4OzquhdMaNo=;
        b=oa/D86CB9+pJpks4qRYo1YV/GyId2jzZfPJbOTRC1teikO5Okr4L6pyDaEQd2G87Nz
         u0Bfy43RbI6mdJcx3jIy6RoTo5Od5+MDSHWrWuyaQP/14FyBF3Jqun2lmVITJrxq8HaE
         j9yqNlejFXlf40qb97/ju5sVLaizIC0aww/rWX85XfVaFAsShCMT+/fHgoNsqlBpxAek
         iE7EwbEr+evE8uNXF3eZD1txjb/lDKnd0mo093WT9H55D8jX2ZFkmW5SQ5KgPziuBboL
         Mv10kkEHyw28Y5RBLsw9kBvHE/LgfnPrUDV19H+qXooV9k8FkQtdz6pubd3iqRF3xx3W
         P3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784771194; x=1785375994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+JKcIPJqaMAyH6OdXJ30k6mM2iyhDEyD4OzquhdMaNo=;
        b=N3TSgdKFTyCPa00yNq0u8SvRBPAkyiz/7+r+5W3u0ylGi9Qi1Ihl+8BKb+amjdWOvG
         qYvQQQ4QBgeY5ZWbfWZz2O1Lhf2Rk/2p5SMVOzBcXYgvpG9PmPVZifFc4hMWOD7Vmhn3
         PlS+RAaoFm0gBxZDbWWf2Jf9QOdjtb3KqPNyeOO79B6vsXiKluryJ7nGRE7irzKovyEK
         kDwG/benn8D5ATCh2Etb0fWrQVdChrhvgUqr7aRVl/enF8b10EUEteAn6OI//leBuq43
         3szNDdJGwRwx9ghyj2L2JoNOPC08m7u+qdkknm8x5ODYxveBp7l2pEaSkqX2mzkNph1k
         SbuA==
X-Forwarded-Encrypted: i=1; AHgh+RqEpkOiVSRMzQYKfJFWogCtEgeQ+WcIh8y6FUKrCdKQC5jOHAjLH082rOEA9gwKvOUjIP9boAjAB7m66q77@vger.kernel.org
X-Gm-Message-State: AOJu0YxivxTxCmQy4kjmEExnKUPibeLH8cFfo9J1TTMLATSYZIaRcsE+
	EjAk6I6rrwTf/KI8sYMQCw6sybGfdNEUdVyfJZ4X3iV4tl0RzVBAcSBp
X-Gm-Gg: AR+sD11br4binb90p5MKX/pv+yy9r9aMo5Pb1baqc1ijb4QT2eRRFWbPYbMkehOJ1al
	HGm4Nd7CQEAXUsPhnMDz7w8SjNI0QTSZxY8x1Q39rhNzwYs19O4kqpY/Nb+AqJzOSFejh11ejBV
	E0ufvlFWae4cnYm1bQEuWH3pc5IM24tyqmizDb6aW0srat8um4YHxUSi9KeiVst3U+48ueexJuc
	1zwZZ67m/VDVtYaypMQrX2d13ogtb5rePvuwBpr/Nae2dfYmyoCzZ8E1kaHP7TuEfosbEw+eYC/
	idmT2pqAfNWt/t+K9ryhYtjAoJywChE7mrQvZqoEVkbqm/Rz6mvEptchD1+t3BgJGT16ri8wL7g
	7iWJX5UfxZ/XF+23/FkzlSMXQD6rb4KmexGMzi6LXD1bCrizh4rYcWyCUP97IA3bugmSykieFNL
	xGTdHyzoDhdGDF7ydRq/EEn9kXBsoW
X-Received: by 2002:a05:690c:c4e7:b0:81e:8f17:a943 with SMTP id 00721157ae682-81f4c1c1dc5mr3385497b3.29.1784771194053;
        Wed, 22 Jul 2026 18:46:34 -0700 (PDT)
Received: from karli.attlocal.net ([2600:1700:7270:4eb0::19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33bf2e50sm22038487b3.10.2026.07.22.18.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:46:33 -0700 (PDT)
From: Aneesh Pradhan <aneeshpradhan2004@gmail.com>
X-Google-Original-From: Aneesh Pradhan <aneeshpradhan@acm.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Catherine Frederick <serenity@floorchan.org>,
	linux-clk@vger.kernel.org,
	Aneesh Pradhan <aneeshpradhan@acm.org>
Subject: [PATCH v2 2/3] arm64: dts: qcom: add initial MSM8920 device tree
Date: Wed, 22 Jul 2026 18:46:26 -0700
Message-ID: <20260723014627.63310-3-aneeshpradhan@acm.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723014627.63310-1-aneeshpradhan@acm.org>
References: <20260723012431.48499-1-aneeshpradhan@acm.org>
 <20260723014627.63310-1-aneeshpradhan@acm.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Catherine Frederick (coolguy)" <serenity@floorchan.org>

MSM8920 is MSM8917 with a different RPM clock compatible (IPA clocks
present in rpmcc-msm8920). Start with the minimal SoC dtsi: include
msm8917.dtsi and override &rpmcc. IPA and other 8920-only peripherals
are deferred until their drivers/bindings are upstream.

Depends on the qcom,rpmcc-msm8920 binding/driver series.

Signed-off-by: Catherine Frederick (coolguy) <serenity@floorchan.org>
[aneesh: strip IPA node for initial upstream; rpmcc override only]
Signed-off-by: Aneesh Pradhan <aneeshpradhan@acm.org>
---
 arch/arm64/boot/dts/qcom/msm8920.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8920.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8920.dtsi b/arch/arm64/boot/dts/qcom/msm8920.dtsi
new file mode 100644
index 000000000000..f2747e5133f5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8920.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023, Dang Huynh <danct12@riseup.net>
+ * Copyright (c) 2026, Aneesh Pradhan <aneeshpradhan@acm.org>
+ */
+
+#include "msm8917.dtsi"
+
+/* MSM8920 uses the MSM8917 RPM clock set plus IPA clocks (see rpmcc-msm8920). */
+&rpmcc {
+	compatible = "qcom,rpmcc-msm8920", "qcom,rpmcc";
+};
-- 
2.53.0

