Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550509;
	b=XNzecbMWiOlrRkRh88GmSGbrfeQQcEJex9Z97vYBcnhNhugnfZzFAek0H1gCeMhEMj6b
	 syG/scfFataO+HWLklfVmSxYmy0ziBdNxItvP7zKaVhjnGVNa/TmIOaeP+MhXVvuPxdGI
	 6nZrucUDkBTexQUsylNZSxJHJf4b5qwkEX6ZCxxvP/vAScCEss3S6Dx7GHUT8jdRPdLEU
	 4+Fn8Bc3/vOgIrkUqFCeJ0x5hU8z6f97LHxoQnlx+4RWjdRl70MmXmd2RDSn0MTB3XHir
	 SasPcesu3Nrz1XuM0y009A+Wcc+jAi+r17JvlSb8YRSBZKmncjXZONcd5bi7gy3jCsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550509;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9++EjZZXOS4NJ0u4WUgR+GPL0YP1zFMSphdYQ6zyF40=;
	b=YoYNH0aXF3zwZRQGOv0V3JsgIeTao3ta3G173Z+ARHGDrZNTHJ78k/FZWpT8xN5D29pC
	 kthvHGDEPNQZxqtyH7R6AR1kbSMIfqfjyuMn0yeJsFgYY9ilBfNG8eQNqyGUp/XhV3gz2
	 T7aRGwI4jswg01F4IVq9Ormp5LWBZUfsGpBFgoWTFbr7Ze1ztxiVlSqVFw12gOlSJo0IM
	 ZNf8NVx3CxwxyZOo+AIDtnn7wTbZQRP4L4iadEa7K3ardxfGNi5VZTDkrFT3sO/uhnVwL
	 +BH+k4o63eT+W5OVNy/r2j11DmOxJ544pOS9TvfxyQxw/4olqb1XEOHLEQRBX8psloA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=onxWI2js;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MtBan3rW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEAE606A681
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CEAE606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=onxWI2js;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MtBan3rW
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOJKl1K2855381
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9++EjZZXOS4NJ0u4WUgR+GPL0YP1zFMSphdYQ6zyF40=; b=onxWI2js/qa0c91h
	l/J8lCF49XdAetJqFVrI7XmVpaEGNRwzO2ejLUesHar/CwxBp1Kh+WJTJ3pk+IwM
	QNIOCNFEy4ZV0Q4oDM1xZSAaghIxGoYZky54XgIduzeTXWeLjfg0F5jvi2MMJc0i
	ASDpMpSHAY+/j3aAWgTqMzMsFrH/ka6/FOQqDiICHDf4DAmGUaSFTdTK7TdckGGD
	0wl36+4VHsgOXuelx5nzd653eNdAEvk+RlJfOySyIuO8VUexEEaFJ+lLkjcgRSYA
	2Zuq5HH+mWIJWoGxjfkj6S2hrW51B0opt76jFqxFDj4CkfFHeErjgMGzsqoQy7hZ
	FSZwkA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnf8568-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:01:48 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2ca26a454so174385137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550508; x=1796155308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9++EjZZXOS4NJ0u4WUgR+GPL0YP1zFMSphdYQ6zyF40=;
        b=MtBan3rW37pLiQifQ+aIzVBaYsE2OeMBWk7lfXo0tFM38gZq9jD4m4b4S+ICBwQNBZ
         W2pQ0U+qSf/NySx2i0uQVLH58GkUw3n8XdMP3O5KMN+3NMQsDmPR1ra23IX4EoPkTa84
         UjT/QJyG/uV6gXGjrm/5rJqu0kBjTHU4kN7x+/It0d0ep85V+aFysNjO7/ihTXQkhe4W
         /znM/mlMCxEnXNEs1IpNaFsTWCuF4r4ACeJN+0qVVSoT+At5FMMZJihUT3gNBkR+OIAC
         ASX/djui+LK4xkBBNZdptemQNZ2pvKexCeUqkHOO0Dg+gTsDoj6BfiSSaS0a8MoKlpw+
         u9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550508; x=1796155308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9++EjZZXOS4NJ0u4WUgR+GPL0YP1zFMSphdYQ6zyF40=;
        b=NTtrnrKeLHVmVpjmxaqSEGYvWhjW5aoZBbVxST0He7mE4IadK6xMsJILnBlhqfo+1O
         BeUwWrkdz2V8f9+Jm51iHK2qy8eIA/wPhkukcxkoq93u7ErqKjUv63m4ItGC6rVMAWsZ
         qFDPoRA3edRsCaDslQH4EM5PSIxqv0zndJhtgCPGf9CixaeTq34SVqB1Rv1omTVUXIqj
         ipMVHKEAZ371+6F6veSXxUCrCpa8WyXvBaP646nVA2HeWfw1hVq+njitPjHDXpJG36Lx
         f8ndFAjYJ1zlngOymexQ5IuMKXMVeht91F3gcHa5lJ4omNu6r0YDw3EU1AAXZSSW8dbK
         SU+w==
X-Gm-Message-State: APuU4Z+Q9eoZm6emMmd6W3k0+4t76s16EPGOwyD5N39DFZolzG4N2Ys9
	FAeS+N57UUN+Yk2XS94sxwzYR1YUDByy0u9ezfDjLUEfePrRe8VgCUNQgbHGqSpYc2zrSE23AAH
	eULRiTMHpCEWIklQsH0fMr1V9NuYEYGxuUpQj6BEdoCysmoL9MJJU7z1ziWGvpy6ZEUU4
X-Gm-Gg: AZFdTZfRBynrXJ1lfM8YLN2QQigExAvIVu8qkJ4jhx/zWaGaLzpvcuOk0n9UBRGnFIO
	G3lb6/zxSaig6zZ4rgVCu+ll1L+wbAYnkKl+BgxfsDqB4li9ij+vMWt/UUfUs1K6Pc2BKRm/Rum
	+BnYWo6ZyUG0loayWtMB2S3XKnw/M1CwDtHCpMcVZLa/8o0GL654sIDrdqKyivVFhfSKe9HoIlG
	dxK6EIeldrlsa4hjlf0hHnAyvS2qn0yKj+IEcLUJBEltUwixN3TfBTZ/34xOuyAWUGaJXNoBsaM
	U8wfvRCyj8Xv2hTe2P7y+N1DVrbe5GclJauVzvqfFXWeNXRenAWBwYo8Yyw+7T1hf/Ew1Rc9gEF
	HC64ZYRUvZdMdNbe6W+AXEy85mQ+YfGjzgkUsZ7+cnjyhwfwdZIRXdVhzevf9HPW4yxUSjFDDp1
	k6S3wiBE0=
X-Received: by 2002:a05:6122:2b1:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee8ad0ec78mr9654737e0c.0.1795550507186;
        Tue, 24 Nov 2026 12:01:47 -0800 (PST)
X-Received: by 2002:a05:6122:2b1:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee8ad0ec78mr9654601e0c.0.1795550506454;
        Tue, 24 Nov 2026 12:01:46 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:01:45 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:31 +0100
Subject: [PATCH RFC DNM 02/15] phy: qualcomm: qmp-combo: Add USB4
 power_on/off to de/assert USB4 clamps
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-2-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=1739;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=srDcbvCKmzTW6ZFC7dL4jM5RmKmDLk6L/F70k459R2U=;
 b=DfUOTBjSbX0G43dLFvbwRwSUp1QIURcaf26xg7MQFnmkwZFDhPAYrQBYi9bxMtPyd5DhHL2vt
 v/BQpOYKbSMBQSXZAZARt6EWTVGTYwoL/LONH9icnOTkbQiOeETL874
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX0H5iX2y+Hp0n
 i3cz6r8ZnmbndffM/EditE4M1sfGKv/F2jtTwdMR+lyJI+naZBf0pEc6rZx7eoh5WnsGqnzhJt1
 4iGgH+gw48zZxS+hmho1uLg4yz5H3jY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXzMLaM8tl7Qav
 l6O01hCcOyzHDX/YysKZ60+yUWIEmFqN9Nsk0a/oV6m+nLsmddzIAR08both03u7mryNTu61P1a
 zlcA/ln8lw3MA6NNAs+x9KsTLgnZ+r+qSo1P0T4/vIaPUES87EnXfrBv5o6RRwEXPXgPZgmBXjP
 ZmXcgpwnXG1DTDJNJcHEz+YSt1sQ8LSp/qdGXIbm035umHPZD9CaL2YSIz+nlVYeLyKaQm+7Jq4
 hDjSPR5vAZIgIncBRzKOIAaTg7Qnx+P4QjoKAtYXm1mLwSqD/DVByUr6Al2Ve5pdei+Wo2lZ8+z
 Qkw4enSF0zy+Y5fw06pEaBiSd2jJYyDxDDsNnFGbizdkzCQrl2AHVcDqr8PSuEMeFvM8j+LbaMV
 oC+z6FyPq5olKJPxZ9Zj6KB7Bf/AOGTJd60TqQzXZewDkALAR72LbuMcDWGr44lr0b2zD2E4IdR
 EoegFnHq0O9vYnegHyg==
X-Authority-Analysis: v=2.4 cv=f/Xdl+yM c=1 sm=1 tr=0 ts=6b05ed2c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=1SUI9jfhOX1tsDrs7xYA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: MBCNHHQ_n_wcIl5DrziqNjrs6dgRNmZr
X-Proofpoint-ORIG-GUID: MBCNHHQ_n_wcIl5DrziqNjrs6dgRNmZr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240078

The USB4 part of the PHY comes with its own clamps, which need to be
asserted during suspend. Use phy_power_on/off to let the router driver
do that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 03fe66dae8b86837fddcc59956529ae374c1f6de..475b9a43baeeeaf18efb6e55d8151c170169c742 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -5085,6 +5085,28 @@ static int qmp_combo_usb4_exit(struct phy *phy)
 	return 0;
 }
 
+static int qmp_combo_usb4_power_on(struct phy *phy)
+{
+	struct qmp_combo *qmp = phy_get_drvdata(phy);
+
+	guard(mutex)(&qmp->phy_mutex);
+
+	qphy_setbits(qmp->pcs_aon, qmp->cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_EN);
+
+	return 0;
+}
+
+static int qmp_combo_usb4_power_off(struct phy *phy)
+{
+	struct qmp_combo *qmp = phy_get_drvdata(phy);
+
+	guard(mutex)(&qmp->phy_mutex);
+
+	qphy_clrbits(qmp->pcs_aon, qmp->cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_EN);
+
+	return 0;
+}
+
 static int qmp_combo_usb4_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 {
 	struct qmp_combo *qmp = phy_get_drvdata(phy);
@@ -5110,6 +5132,8 @@ static const struct phy_ops qmp_combo_usb_phy_ops = {
 static const struct phy_ops qmp_combo_usb4_phy_ops = {
 	.init		= qmp_combo_usb4_init,
 	.exit		= qmp_combo_usb4_exit,
+	.power_on	= qmp_combo_usb4_power_on,
+	.power_off	= qmp_combo_usb4_power_off,
 	.set_mode	= qmp_combo_usb4_set_mode,
 	.owner		= THIS_MODULE,
 };

-- 
2.55.0

