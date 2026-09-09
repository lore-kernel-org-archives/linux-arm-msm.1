Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF6F548575
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 11:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954542; cv=none; b=CisNWWH50QVwSEwvTwWSSRvz7Khb/P0SBt+eWQ+7Dru8P6aLuxNCMPFmEpVZ6WgM6bZ23vlgHetbLhq/jkWVdb8o2ZCkeuZtozbhAp4hUY+8jCWEwOjFZQ6AYALNHk+aG1iYfGt1r04YLOvfajADP76wmwb8Lh+R/Zd02RSFjB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954542; c=relaxed/simple;
	bh=H4r2oOc7WRDvMW1NBsIUmNGfOhTuI7q4i8EH+5tNZ+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RLCKsA5dl8gc5aJM4PiN+r7IS6n+Quq77pdeCYaWqYuFl7E0N9lhQPhgQ5L+rHW/ZlzszodWB+nqhscSXD9Q+wdE4AqD64asheUPvBvaEOeiG6G8AjPi88hdxGfXjn8bIIhQkBtn28oJEHl+FQWXgMvDv9LedlFCnlGz0cPLehw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TfWBj5jv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQahbHxN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TfWBj5jv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQahbHxN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUAEq1307905
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 11:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A/3VVWUKnpeQjJ26Tv6oH3K+LWGjuzJb0mcJX9AvYgM=; b=TfWBj5jvj0Qwr/Tn
	06XeQL0ZgA9U1hmaimTSwbVoFJxKj4rYGGc5oE1wC9ik7cGCOim/sQInVFMhqTAb
	60anR8mIRlN7rIPKtJ3y0k4K7g9WId8vrC8jVK8Oal8gZpTbsyE4AujmKFsCeCXP
	8dkspiIPJiheaGhfPuhwxNN0HyVtK+NuNIodvCIMsADsh+DVBxBQ4AQ8gmInv+RJ
	ZNeiQEyBJXmOTgS8iwEyq69xeISmpLB2Rov3880rZdhJyf2dtjo8OaKFrMWlXr/3
	HTakuuwVmiS3dQxa2CAq0xHjHb3Beqq8Q3BxGosYA88YtdblnE9QC6qwOTB983Nh
	idgj/Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjstub1v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:48:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8627258ef12so4767378b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 04:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954539; x=1789559339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A/3VVWUKnpeQjJ26Tv6oH3K+LWGjuzJb0mcJX9AvYgM=;
        b=DQahbHxNAQS9FhuY/Yx5SBPOK0QTuRjvyOD9MSBogCWo1bpHI5rdDw0nV+CnjE7L4Z
         hh5k0GMZxR9sWFxTTzsnxTH0Hq5wwMygPr9EfgxkPPo8uz6KhXHu1YiTAplTiO5WkdO+
         v8giMw7YiM0Ts0fjkXp0t7rPrCofhJLnw19q1zG8ndhABP/rsOnnB748rX5sKQ+J24Zi
         VeU/WM+XTj7rbUM0oppou+SZibUfLI8DDiKbJcojDvRkSr1+nfeny+NSUbH4XkcH/xsa
         mpFhhNSBhPdiA9VEQzZDT0RzPxtK3eIMKpdF/jvseAQft0qokAP7tuwDPGhHDfYdSLzg
         dlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954539; x=1789559339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A/3VVWUKnpeQjJ26Tv6oH3K+LWGjuzJb0mcJX9AvYgM=;
        b=QcX80h00GhG1tcZ8DXrTql7uWVQUnnrX/0TVNAqujuWCqkAGm62IWlC4HTd+b/XI63
         S87F8n/fHi+vARKazUcjIbN3IsGI4rlhBPHEnI0kVih+s3SqBjWg9CzqXWEYyjGVrOA9
         CyKui24u8vs2JfHxZVTOOCj/6iXU+S2gKe0U/WCB0mpeKlOFXWOnLjSFYNKem6LOqAJJ
         sO1xkOfZ+RgDqNTSsIB/i5n/mlf6R9WMGzFcvy1PFpvwZTP6MX5vFDx5d25noSKp8BpM
         0TrlPinOgBZqMMXpoDAWrbOjVxeMRlscMSOrPxbuieoj45ej6SMGvVOSjJldT5IzCFER
         i4BA==
X-Forwarded-Encrypted: i=1; AKwUvBwV/A/ozJbkExfvPHD565/xWPig6S/z1OBZl1wIMSC3zPpA1wNvW7vGOxh4MJznuUFWFi0laBrXN0CwAT5s@vger.kernel.org
X-Gm-Message-State: AFuF++lf3Sehn+NplwECjUx7EGA/MSukA/Bo2F/OBsYqhbJhhaSQTv3s
	LurBQaDqPXQ5lpipjB3Zjdo5JZYGN+zGU5wmWLc7WaDHXllL4bjBc6rYGlQIWH+FzBQMep0YBYh
	wrgrxoylsVPX1IgHGZbJe1DKwvgAZAI3HaGhvYI4asJ6QTrgMMH66FxId5LDgZgkmD7S/
X-Gm-Gg: AYBFou115hkRgs7WNdLpxoaqyrUv2kG0dePlvK0bkclQmZoQLGCY+wwilBGKXYS67/U
	GuGnKwi9qQ4vatroe6y2YrTdhy2SKLtwl25NN2t0JNwXlUs8xoFynRf/PF5d9ZtFJLW1z5damzq
	CPo9+rojUMVAjoBCmYSzKXxJSR2g7dStDfzqUGRRM54vrKI78h4ylseFbXY6AWlnB+ajwLDjtAN
	R7IbEO08Yi4wBkmxMpQMwHmECTGUBEbDbqH4pY1SHy2jafqn0rNxt5VBuoYENQ6tcOUYCHbdH1/
	X9e8HQYQ3POMTjdbSP6rF7Ri5UnULEU07KBVhlRBCT6GXqn46QBqN6H0T+TNrd7AfwwjF6mMBDC
	bTojfAm48I4S3vYU75gIHEKWdmQj/L7BKLOc=
X-Received: by 2002:a05:6a21:114c:b0:3d1:e510:9052 with SMTP id adf61e73a8af0-3da39ee2689mr54213292637.7.1788954538792;
        Wed, 09 Sep 2026 04:48:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:114c:b0:3d1:e510:9052 with SMTP id adf61e73a8af0-3da39ee2689mr54213212637.7.1788954538370;
        Wed, 09 Sep 2026 04:48:58 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm50156857eec.21.2026.09.09.04.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:48:58 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 17:18:19 +0530
Subject: [PATCH v3 4/5] phy: qcom: qmp: Move qphy_setbits/clrbits/checkbits
 to common header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-nord-v3-4-b0a82721c547@oss.qualcomm.com>
References: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
In-Reply-To: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, shengchao.guo@oss.qualcomm.com,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788954507; l=8340;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=H4r2oOc7WRDvMW1NBsIUmNGfOhTuI7q4i8EH+5tNZ+c=;
 b=NhxNSLF9k2rlgECW4dULXyO0W9RUiPHMohCnyBQUR+D45MiUbAakhih5m89UeX4tiGZmDYvRV
 Q/ghc9vkeSqAeOTa8K+RgzBYaadmovnxIWRfsfM81tnEmWuTtvmaqJi
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=ItAutr/g c=1 sm=1 tr=0 ts=6aa147ab cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=NwoWoW-BFzdagI8Imy4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX9lzFQT93x8TX
 c0sqMaWinJokKRwKODmzd+nUDPc/GFJ2Sx4d7+sDA3XzLk01djFy3k6JK/nv7vzAODTuRR03aMp
 DqsdvaFqtRUclDmi6l0QGaLRyAF1x4E=
X-Proofpoint-ORIG-GUID: bzvbKk-_tCeIyAe8U4RAulbU_N3GsiAs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX1TTVSG+KJy5R
 fQvwgBAGV8TwP1hlzGKw/eMa7fkKP+McwLvAuDzZ1O66y+H42uHkkpyIXuu618MQ9UDE5gxHcJd
 YDhPCC6p3Gdjvrui5X8Ij46b0kN8yXOMvZAngiIL72EEqLaYC+gx4wFAuHCrGVt+rceK4iEmtud
 zPZ6x7opvqb0ZnMzGmfVbDoH2ZgbsgfGxx7mefXXen3yIA2XbgfmfmQQ6m3ORpQcP+4kmeaiubi
 a0itMmd/uvWvXxkKtH/JeMzwQ0gW4EtTaWb+L/uFs3cER16R9i7XdmwVNEH3D5mZ6cP8CqTzNgB
 GcpRcSianqoF6KMiT5VEF1cDlYUtPcWE22FwpZH/VqWCQQtJQ5qQrwu2mvoxlCa/CaMbgiKuWNY
 WDIUyzIUBIIKQr4UhwTvi2If9elCaEKZzJBzoZiPx9vMOt9oWSVefVWX3Tft+XxteiaWRZYRwmd
 w5P+l+3t560cOewtGDA==
X-Proofpoint-GUID: bzvbKk-_tCeIyAe8U4RAulbU_N3GsiAs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

qphy_setbits(), qphy_clrbits() and qphy_checkbits() were duplicated
verbatim across phy-qcom-qmp-pcie.c, phy-qcom-qmp-pcie-msm8996.c,
phy-qcom-qmp-ufs.c, phy-qcom-qmp-usb.c, phy-qcom-qmp-usbc.c and
phy-qcom-qmp-combo.c. Move them to the shared phy-qcom-qmp-common.h,
which all of these drivers already include, and drop the local copies.

This also makes the helpers available to phy-qcom-qmp-pcie-multiphy.c
without introducing yet another copy.

Suggested-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c        | 24 ------------------
 drivers/phy/qualcomm/phy-qcom-qmp-common.h       | 32 ++++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 24 ------------------
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c         | 32 ------------------------
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c          | 24 ------------------
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c          | 24 ------------------
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c         | 24 ------------------
 7 files changed, 32 insertions(+), 152 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index c39ced168d03..052d2f7cf671 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2622,30 +2622,6 @@ static void qmp_v8_dp_aux_init(struct qmp_combo *qmp);
 static int qmp_v8_configure_dp_clocks(struct qmp_combo *qmp);
 static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp);
 
-static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
-{
-	u32 reg;
-
-	reg = readl(base + offset);
-	reg |= val;
-	writel(reg, base + offset);
-
-	/* ensure that above write is through */
-	readl(base + offset);
-}
-
-static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
-{
-	u32 reg;
-
-	reg = readl(base + offset);
-	reg &= ~val;
-	writel(reg, base + offset);
-
-	/* ensure that above write is through */
-	readl(base + offset);
-}
-
 /* list of clocks required by phy */
 static const char * const qmp_combo_phy_clk_l[] = {
 	"aux", "cfg_ahb", "ref", "com_aux",
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-common.h b/drivers/phy/qualcomm/phy-qcom-qmp-common.h
index b945fc14cece..3c0e47f4af75 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-common.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-common.h
@@ -59,4 +59,36 @@ static inline void qmp_configure(struct device *dev, void __iomem *base,
 	qmp_configure_lane(dev, base, tbl, num, 0xff);
 }
 
+static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
+{
+	u32 reg;
+
+	reg = readl(base + offset);
+	reg |= val;
+	writel(reg, base + offset);
+
+	/* ensure that above write is through */
+	readl(base + offset);
+}
+
+static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
+{
+	u32 reg;
+
+	reg = readl(base + offset);
+	reg &= ~val;
+	writel(reg, base + offset);
+
+	/* ensure that above write is through */
+	readl(base + offset);
+}
+
+static inline bool qphy_checkbits(const void __iomem *base, u32 offset, u32 val)
+{
+	u32 reg;
+
+	reg = readl(base + offset);
+	return (reg & val) == val;
+}
+
 #endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
index 37e96493b722..ed22b7a256ef 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
@@ -218,30 +218,6 @@ struct qcom_qmp {
 	int init_count;
 };
 
-static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
-{
-	u32 reg;
-
-	reg = readl(base + offset);
-	reg |= val;
-	writel(reg, base + offset);
-
-	/* ensure that above write is through */
-	readl(base + offset);
-}
-
-static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
-{
-	u32 reg;
-
-	reg = readl(base + offset);
-	reg &= ~val;
-	writel(reg, base + offset);
-
-	/* ensure that above write is through */
-	readl(base + offset);
-}
-
 /* list of clocks required by phy */
 static const char * const msm8996_phy_clk_l[] = {
 	"aux", "cfg_ahb", "ref",
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index da83358c97ea..7fa9bb2b094a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -4044,38 +4044,6 @@ struct qmp_pcie {
 	struct clk_fixed_rate aux_clk_fixed;
 };
 
-static bool qphy_checkbits(const void __iomem *base, u32 offset, u32 val)
-{
-	u32 reg;
-
-	reg = readl(base + offset);
-	return (reg & val) == val;
-}
-
-static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
-{
-	u32 reg;
-
-	reg = readl(base + offset);
-	reg |= val;
-	writel(reg, base + offset);
-
-	/* ensure that above write is through */
-	readl(base + offset);
-}
-
-static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
-{
-	u32 reg;
-
-	reg = readl(base + offset);
-	reg &= ~val;
-	writel(reg, base + offset);
-
-	/* ensure that above write is through */
-	readl(base + offset);
-}
-
 /* list of clocks required by phy */
 static const char * const qmp_pciephy_clk_l[] = {
 	"aux", "cfg_ahb", "ref", "refgen", "rchng", "phy_aux",
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index d4aca22c181e..d15db9ab9a90 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1211,30 +1211,6 @@ struct qmp_ufs {
 	u32 submode;
 };
 
-static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
-{
-	u32 reg;
-
-	reg = readl(base + offset);
-	reg |= val;
-	writel(reg, base + offset);
-
-	/* ensure that above write is through */
-	readl(base + offset);
-}
-
-static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
-{
-	u32 reg;
-
-	reg = readl(base + offset);
-	reg &= ~val;
-	writel(reg, base + offset);
-
-	/* ensure that above write is through */
-	readl(base + offset);
-}
-
 /* Regulator bulk data with load values for specific configurations */
 static const struct regulator_bulk_data milos_ufsphy_vreg_l[] = {
 	{ .supply = "vdda-phy", .init_load_uA = 140120 },
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index b0790bcf0bc8..6a9faa0ce3bb 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -1441,30 +1441,6 @@ struct qmp_usb {
 	struct clk_fixed_rate pipe_clk_fixed;
 };
 
-static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
-{
-	u32 reg;
-
-	reg = readl(base + offset);
-	reg |= val;
-	writel(reg, base + offset);
-
-	/* ensure that above write is through */
-	readl(base + offset);
-}
-
-static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
-{
-	u32 reg;
-
-	reg = readl(base + offset);
-	reg &= ~val;
-	writel(reg, base + offset);
-
-	/* ensure that above write is through */
-	readl(base + offset);
-}
-
 /* list of clocks required by phy */
 static const char * const qmp_usb_phy_clk_l[] = {
 	"aux", "cfg_ahb", "ref", "com_aux",
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index e3465ab7c80e..548ec97373ac 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -474,30 +474,6 @@ struct qmp_usbc {
 	enum typec_orientation orientation;
 };
 
-static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
-{
-	u32 reg;
-
-	reg = readl(base + offset);
-	reg |= val;
-	writel(reg, base + offset);
-
-	/* ensure that above write is through */
-	readl(base + offset);
-}
-
-static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
-{
-	u32 reg;
-
-	reg = readl(base + offset);
-	reg &= ~val;
-	writel(reg, base + offset);
-
-	/* ensure that above write is through */
-	readl(base + offset);
-}
-
 /* list of clocks required by phy */
 static const char * const qmp_usbc_phy_clk_l[] = {
 	"aux", "cfg_ahb", "ref", "com_aux",

-- 
2.34.1

