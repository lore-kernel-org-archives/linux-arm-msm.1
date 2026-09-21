Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A26357D09
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789969070; cv=none; b=VU/325H6S0EAJFLZskktlmfd/hz4R6lPS8ph9oVEj3ynMtuU/SfrfxrYSU4TwO4KgJVbFGBHHuW5kwDD3h+PJD0O8dALnhd0AhEu8nQV7s5tELloi28DYD4dqfmVChhdHTdH5B2DMKMYIKHWaSlkwgMnOIIbVS5EO9tN8vTfvag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789969070; c=relaxed/simple;
	bh=JVlVGeKhznT32YmeKi+KOo08Sju82h7c5GfgcSDaseE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kcBQwzykjMqkJ5XQ531T2JPospDscBRgQ2ThTQ+73q3zPJlriblPCbWi8KqtJYXLXXfqFkzWxYwzi/oR6DwzeiPe84Q5MqueOJP/bfJhGW1jUbE0Xt0czxLBFq37DlPcAdfvOvLKu4l1rZHd971P+GJKloshRtV+I+smhN6q1eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pvGD0wPr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C09OR1sV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pvGD0wPr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C09OR1sV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3ZLtB3550804
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WBcOxYwQ0Dfv588IqbZmpmvVHvpvwD3Y7+aa5k+MiV8=; b=pvGD0wPrdaLOj9DH
	SfB/evfCqStIV1oiC8xkQllyhwOP1N35oe9TYUtqHP0iwmhl+ZyxfD7oCSIJCs33
	bstIMAKvz12L9uf7/+JxWDIvJoSWVV0e8PXDfxM+4JvEGjJXTtMpFHquDR6Ic/UD
	JzXgqI/7soXAj/IYQgD4uIK+pu2VECVkcydkR/D8zWy5mW1EEnT8E1v1A+cKH3eV
	3lg3XVItBoMxwcb8MFCX/2Xbur3WtOsrjgxqfpdQ2PhpKHyx58bbiZKolOhPacpX
	oEVX50hDNUeYqYQzEnceFhuIkyRpMfbgY9KNX0eg/1SWNFcOcFjhsCJEmIO6Tc+b
	LYG/RQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs84t40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:37:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e3f521346so3107014a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 22:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789969067; x=1790573867; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WBcOxYwQ0Dfv588IqbZmpmvVHvpvwD3Y7+aa5k+MiV8=;
        b=C09OR1sVltOBZFJQgZ1V87iRXeGnOR2kz19z7XCb3vVsHvodcUIK3yu8H07CAkvoFD
         WtGlpO3UAJc0P6htXHkbmfy4mdLFsj6LU9VYn/UHNbho9ewaul9PZL9DR4c86XYfqu+p
         ExwvYkjWOVov62laOa2E9P5sxLTuVEt+hPcDy9AcGeRxiP2hnsgengM7bQ6JF356ULIR
         ic7TXp3010COWpr2ld8lf4hWTwE6uliKuJG5OOb/PQ06Oog1cZOW6OpAXmWwQvG+JJDw
         D90gS+8s5XZ2GaSTOpyq3080CwUPHF2R7AHO23rxPaqD3QHAa3zFjRPe6cuEKW3HEStM
         BEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789969067; x=1790573867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBcOxYwQ0Dfv588IqbZmpmvVHvpvwD3Y7+aa5k+MiV8=;
        b=nswsgtov1XpCCTaKVMWSUTJE4a0YYtowd5EjucOq9RxctE8L0SSyXp9dbUh9yyqZBa
         o0LQ5WxwCW9bdGqxEmd379KKjFDyYzPGciq7BVXfVGFIzh/KYAyAWnelKSyAnYNA7LEI
         g40SI+W6F+AvoYFnpe8Aivr2OxDBGuE6NcGARrM74jRRnAGDCIwXfbts8S6INcJv93dj
         i2scrH/3JFrdxvdcC/Z5hxzcehe+EuGVaTeoYVnRlS6JLaSdF34Nkx8WM1Xr2Sa6KT9M
         ZNuOJ0p2p1DUYv2LTsneXQYzwrvxacYFnta+HPZDqRh0KI/aRyxDwDb422+2gW8e6zTS
         6ShQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3FQtg53TvRDXbM6+eyjTF2pDvSE7OzHkvw8pIidrG0WWY7ovEUMWBe8qTKZHDiOa5wm3ae4Y3IGKYkm+9@vger.kernel.org
X-Gm-Message-State: AFuF++lmBO+9ZtRd2zfQGICiepRAyY5uoViOYLiyeHcuhJoXaY97cxeO
	BzDNU7lu52LR/6au0m/EGcyXkJpDsnKQYdBnY8e/W6CKS0Pjpr6hRhgwVFZYW4qVTHM+QKMZ/ms
	HGXAbMhVjwUZrLu9ssH2jPY6b3lDL9+nd47/dfryY+k3lxxcfUuSpEJDMq4lsnUuuQBfa
X-Gm-Gg: AYBFou1mRCjyBDRC6J3Kkoxz4oY9aU81i3r9Gz4Dfm5omLNjsnwanhWw3rAztl1J04W
	u4gVxb9nMBGLFqZfzWVp6aqZwvnF8uBjjPRySnW3hwgvFWBWLIZPSbWiZwa3C3hkFGbRXU/QUrc
	QzeWICkq0dRRpAcAL/33abcqETDAW9ohEeOSyGc7rOrh1nRZA/Thhoi4RUFu8rCvmLAfCppDekq
	0dqRQBduNZTHBmVBqE74SYjZNLPoNlWRi1YlqYsYh3V9WLUntNN69xOCaW+Z7JS0BPiRXinhQTO
	d4Fqpt5fwQsrcoCVeRRwQgX0PRSyxh16BdEuYKSXBUbDNtpA/CgGp0QKaKMLfZev9HPZTXoa2J5
	XY86MBEcFK2a9AyQrMnQNqqZeL5CHlpLcUA==
X-Received: by 2002:a17:90b:4e85:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-39e54d5ca4fmr14044691a91.24.1789969066446;
        Sun, 20 Sep 2026 22:37:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4e85:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-39e54d5ca4fmr14044658a91.24.1789969065987;
        Sun, 20 Sep 2026 22:37:45 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55d45a6sm15054568c88.9.2026.09.20.22.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 22:37:45 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:07:12 +0530
Subject: [PATCH v4 4/6] phy: qcom: qmp: Move qphy_setbits/clrbits/checkbits
 to common header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-nord-v4-4-ed05c6e09240@oss.qualcomm.com>
References: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
In-Reply-To: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
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
        shengchao.guo@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789969033; l=8474;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=JVlVGeKhznT32YmeKi+KOo08Sju82h7c5GfgcSDaseE=;
 b=dCttHvRw3vW02HbuvXqj4foXdaUtiebIdslRGRVKastwD6/pbNoOZEgyYTlLEt5QcZSnnD93z
 GcnKK1rZBY6Db10O4Eo7CgUsz//r28WM1k3xbPF56JMYT/mmoiCi42S
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: J_dMCV-TzNIM4U3NQ7I3iQHtQ411Kv9U
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA3OCBTYWx0ZWRfX+HLIRpNe4ERo
 8/dJIljDznS3dO03hCG6xbI3V6aOexIlnBc9iQ7//h/jbTzd8dsXrPiKUD88BjKGeaMSfgGBniu
 JHJ4xvAt2G7CrLDfUx4wXZF6t0714hY=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6ab0c2ab cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=NwoWoW-BFzdagI8Imy4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA3OCBTYWx0ZWRfXzDUi1EZTEZ6x
 BNpTDoDFeYaK114dDFGf6/k5aSR90smRWfiQIkECY7S/aiP6f3iX3/9BIvht81X7jMeu8e711v4
 G6W8Toz6cZta/fJCHcpyEMd+QzdWXjZtAOnb5jO0jkDtY8L8OI+Wgni8Yp4PnBQi6xniJKfSRc9
 m+7GWgKO9t1RmdT8Lwlo81xEZMSAxYENFB0TJdRahb535EhoAefIOmmAq5Ge7POCCMmvNWr0vl0
 q9irRVcW61tKLzRN5+W6sospZRE28/ksHfUC+Bp9J12VU3gQGUjyaQ79/jwX3rJ7b7jED7L+FGD
 dbglYnsLw14IKFSvF4zennGRYIPe+sHlnK9ii340h4m0d9KPBfgO/TVXpn4wDYaeuDRWZlIJvQ8
 c2KrNKC25VhbQxwmMAAKSdNa5pc+Y2qI0VBL7HEaF+moiyJMWdpkCyUyXt56oyM/DNbZjAMgL6L
 o1ge9hH7o3YV71kKkTA==
X-Proofpoint-GUID: J_dMCV-TzNIM4U3NQ7I3iQHtQ411Kv9U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210078

qphy_setbits(), qphy_clrbits() and qphy_checkbits() were duplicated
verbatim across phy-qcom-qmp-pcie.c, phy-qcom-qmp-pcie-msm8996.c,
phy-qcom-qmp-ufs.c, phy-qcom-qmp-usb.c, phy-qcom-qmp-usbc.c and
phy-qcom-qmp-combo.c. Move them to the shared phy-qcom-qmp-common.h,
which all of these drivers already include, and drop the local copies.

This also makes the helpers available to phy-qcom-qmp-pcie-multiphy.c
without introducing yet another copy.

Suggested-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
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

