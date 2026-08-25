Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FA3490BE6
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 22:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787698660; cv=none; b=TXx+rmf58CzUhe7AMMCwX/wk4hxidhGZ9mYrggDfXYzNSKB2eG7RSGdFefwextto8XPfYloP4yD2vR9vzawAaVe0+JiwSN5lotPivI9Il/UmfhG7EypNjdidESxshOoEjzle7leh70KLQDijkKgZ9Z1LshL49dshuOSoU6L8Ssw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787698660; c=relaxed/simple;
	bh=H439HTjAH5dM4uX8OR3vXNZdu2DjuQFuKkGAS0OsIzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LlvmC2lrKuVM0IYLKP1cMAkc8xxQl91k3eQz9GN0MLiRel7be/iH3DhgFvFMMmhwjUqNI7CRpyL2t8UBwIRU/ttCudabR39tgeaHnRafdkcRH3kGZV+yLwgj2InHYLxy9SKR6R1ef5NlQBquK7Adh2Jgsr+I/IZR0jv29kd2Rvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ji1g2IAT; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ji1g2IAT"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482e1bfcc63so233280f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 15:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787698657; x=1788303457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1BNZfeSpsImXxyWM4Nros6L3ghk7bEqIIZ7T7oPkLY=;
        b=ji1g2IATrmx7AVOojcE9Fa4ESjnOAJ82SrXh2yLh29SaONM+XgYHKM5NXsFzqdh8iD
         00a4kD69b9Jw1OmnkJRQ4CaTfE26sZc7YdXlZwmZFddAGaVED2nQ3vbHObrcIPdGxwf9
         XJl+om98ldkq3bQu+Gt/GX3o33FeCHDLLHoAEqm8/8tCTpzQyGJ/l3EAIdxl60951RHt
         RAzAWGXFhCf0y9Vvoo2b85TWG9ejMSNwZKNFEvy8qLh7nsz+Ht09PcSzUg4xRuwlzR9Z
         s85/OTHvF9S0R9oIaEFTrGfQY51OydfgdDSCPQuqpbN7UGoeEl+et9AVic+0FRjHXSrO
         H2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787698657; x=1788303457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1BNZfeSpsImXxyWM4Nros6L3ghk7bEqIIZ7T7oPkLY=;
        b=oDxDbloJFKaeAQ0kRs78InKKSAZmKGCHMmat7JrmMYK9/V0gVdnLQAMv6TQ7U6KKRt
         P28ftKfJhK+nzq7Q/vhA1cifY3NwgbLNvrtuHv3Wl07PVwkLGdGLg/oQPlEBKm88ek5v
         JNtNXazVZYz0CXVuTsYOVisIkTSwiHygwwHg7O1rEQBdBk7+nSyeZz6lqoePZ7roOOwI
         jYvf61d6TFXKAbgA0KomUZ1XiVDNLgiqa6S438SdB9pwwhaUQ7glpF4ZlXswRZqgcKKH
         yKVA+0eBYtdgyAdPGFAGMi3KBoX3IpfRhwsuUsyQ6loRNo0e6HB0NQ05V5Bo/+UsVb/G
         MQ8g==
X-Forwarded-Encrypted: i=1; AHgh+Rp/4a7kYpnHcpcV6vcUzBQgY0ROVcNbm6WpDWfvRN15VQ7VoyxXZOY1aL9XCe95PAFW7NOyqpZuX/51QX9Z@vger.kernel.org
X-Gm-Message-State: AFuF++mRr+0CVM0LL2cS/xFH+WKoQAhON25VBbync6iwNe4ee/3+VQ9G
	QvcJJ291Hm7HK91I6NS2jp+5MEUC1FYX6Ya62YglGPDCmnN2q9ABNM/H
X-Gm-Gg: AR+sD119TMTPFsP1XjB2oQxanMGRSAWwIUa77IYMghyAuC50WsaYDOS0fWROm28HDQm
	csDDNkJi5DVnrrhCMbIC5/t1vnBaV1b0WBNYBS+sCWJ145622ZkxA18CPijV0+g15wtL+Hg2zSM
	DiRjnypUjFEYxcnMRrcBX2x+3sSKYjCKRsmj3KR/LXourh2sDHj2CS1S1Npf1hW77BXrVZYUrmP
	zXWxAUSvIK/3DJL1cMWkkSr7x0IX8tLEidSqydwSssyP2gC7xFJeKxxj69C5L9inawTEFPFPjUL
	fzxnvxqLSrSSSkc/nEEt3Jy1lWhr0cBOd89YfxPtIAiJX8wSC8/ZYqFuxRsBA4dIbh0fl0TZ8Ju
	Y63QONgvVLe/O18DSJbtVzv9hrlrFrNqPt3T44aMdjUPCFXSVeA+CG9RBP1aWAUfrrHNLL3zOvc
	UFgVZzwA5v7y1U+EbYY8tBgMtTYd5eB1ZsA0Cr0DlfdExXKoGcOGCzhUW1ACkv/0uGuQyvTY4Uc
	upIfnX+vPr6hns1mtl1tLXfoe6haFu+6N/0mmCBGg81JR1E
X-Received: by 2002:a05:6000:2f89:b0:47f:ece1:1eca with SMTP id ffacd0b85a97d-482e267646bmr2331968f8f.1.1787698656959;
        Tue, 25 Aug 2026 15:57:36 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f6917sm782658f8f.35.2026.08.25.15.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 15:57:35 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	qiang.yu@oss.qualcomm.com,
	mani@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	krishna.chundru@oss.qualcomm.com,
	linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH 2/2] phy: qcom: qmp-pcie: Check clock-output-names count in the multi-PHY driver
Date: Tue, 25 Aug 2026 23:57:29 +0100
Message-ID: <20260825225729.230493-2-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260825225729.230493-1-devnexen@gmail.com>
References: <20260825225729.230493-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_property_count_strings() returns a negative errno when the property
is missing or malformed. The value was passed straight to
devm_kcalloc(), whose overflow check rejected it, turning a device tree
problem into a bogus -ENOMEM with no diagnostic.

Fixes: 1781be3c8a5d ("phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
index e93cba4369fb..e747ff9c3e5d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
@@ -555,6 +555,9 @@ static int qmp_pcie_multiphy_register_clocks(struct device *dev,
 	int i, ret;
 
 	num_pipe_outputs = of_property_count_strings(np, "clock-output-names");
+	if (num_pipe_outputs < 0)
+		return dev_err_probe(dev, num_pipe_outputs,
+				     "failed to read clock-output-names\n");
 
 	qmp_data->num_pipe_outputs = num_pipe_outputs;
 	qmp_data->pipe_out_clks = devm_kcalloc(dev, num_pipe_outputs,
-- 
2.55.0

