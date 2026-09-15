Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F1B483816
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 10:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467023; cv=none; b=YEVyDJaaWY3UTYJu5S6F5LDlZ17rIP2xB5olHr/8ucyu+gVc/gBA5gN1+02AVtkLZHtKgETcuNFj+Ze6e3lmWno03GZ4j1vVneCOc/KIEFXYGbIs2L7CBwVQ5ZLRHhq0eZBh5iLothkHW241TyQcbhllrzntteWHsKJ5pu+41jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467023; c=relaxed/simple;
	bh=k7+wjSAGjpR22f7rKksM9nAh3MeACrWaJ5KFpnnayHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FvMz5/kvuKm0y5J44U9WqOQrMMKN14cyONQAkplmCrZXS3J6905KctGmvAGGd5XZ2qAoLgqlSJfUyllibg8ELjUDh38/EMHxaLVWvwmVKKC+nUYMOGLdYjuyL4iPF7PHA9lTHIdjhqa2+9SO9f4eg7WmeSY271ItGnCWiyQ/Ol8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9Z1Y4+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=keCNWTfs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9Z1Y4+j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="keCNWTfs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9guQ0275469
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 10:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=; b=W9Z1Y4+jErut6rkx
	FQMuirTrHTIFb2BVCwyp9iljBGJ5GyD/sCZ23wS+dxXwWBLxXObNgAzUPZV+R5b7
	u3Kebg/wHaCPP9BtwLGxslY8RtodK8uSgNVu0whN0/bU24qa+qssHhU1CLOi/S7w
	ZlxckzHVynKQo+fSjnjNWYYMBW0sM4MXIe6RAil1VexsWk+spPZF/4oaAlg6wSYd
	sWw/bQULZ5yWdKS6oKPUwF24t4AntVHo0mnWKQRiwxHMxFE6GXZ7mt+1f8NXPYQa
	ODrL3pSYswhJ30BWFxSb0n3gemocCZEGBnb+KRxmWcIDvibSkr+zxI9/Fr2OiLBt
	fEPZOQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea17e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 10:10:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b8088202so3790920a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 03:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789467018; x=1790071818; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=;
        b=keCNWTfsRGrpjXO/rBC1gxA7ukzzAynGsGAOjwDhNSZ5K7AjuYltVZqLNOpYQgas/T
         vYtAAxKGAzxW7sZLOiIKTJncBw2jkEWLs5rAgJMH5E2lMCI+VjL9ByEq3Vy55suQcSxM
         ip+Mv4WwFffEmu2mLpuT6A0/x/clUl4yWznGEMbeln2qhFrk0EyZP/L4pUDoASs0swO1
         ib+9BcdDiEvHJdJevgf2tGJv008y9JvxK2cxNwrkGWYTSq6vxi7BzeuH4yR3XIKj5hm6
         Y2u2E+HrbVMGs4UC+bWpc1nzOgiqZUROxTfDpoNn+HoXBfb2tBx2rSnuCcR0NSSv4mcT
         LuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467018; x=1790071818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=;
        b=069S1Jcwl9IhBLKkX/EL7+xz6ZRyxLg8acciDd4J2bvTRZqpLCrqHyFTE9XewnhOxH
         K+c//yuAVZgpiXbJxSztp1A297PctZUnyL2Q1YfzBl5XyozbUAJaeSKJ9GWjv9sUJb9j
         YAnRSYOyiGSlFfKat+IOkSPZmy5PwSgULnRQXeIjsuDI24g+NDNPjiErFJ4S7MA1GRIk
         A7kY09iOLMNFTuljVOUxQ7JSaYG7psSMRvXm5LRYY9Au+HkbZG3Zan9H/JKmwWTtVkhs
         WcV7yt1a5AkKZ+WE/WmsFpvfYKqR8Xe0IeUBYcEECy/NJMLJSqJUmvxGqlyj8O/iJRUP
         Dn3Q==
X-Forwarded-Encrypted: i=1; AKwUvBz3FZrZuX0HG3FcQEtjRYJbNmVs591sM+1vqxZovQVhNtxfzN9g9F0P9DE7w52gKWN95nSIiZIw7xDaV+zu@vger.kernel.org
X-Gm-Message-State: AFuF++mQK/jqlMFNnqfJivDnsyV+mAnYq29dC3IiFFfDtajCIksP5JL8
	RkVXUTeqroWl6EVhmXg9BzrcE58tkfQwXMJSypP++G338zhpeRXz6T5AGcTNpk7WF4P0CgKRhHj
	pWCX/vv5eprMbE1PCpWUe8xfd8/dLStrbZurAq6Hh0gjriZ16xQ0pDfWyzpulnfwTFmwh
X-Gm-Gg: AYBFou33XH1gdYhYVFWMde5g0BUlc3Jf7UMBP4Fw1t7VCnbETH5rAlAnDjN5agxtUdP
	24wUNGZB+y5xFDW3pQ5zcLC7vSr4+je0vWt9VyeK6wSxcCIUSrzG6ktXDQmtSmvkEY9UymD2c2I
	gJeD7NWXcolJYaz8c4IskFlyAs2aJvYgSeQvbmY4pKXSpqKnfJ6d1M9nImTgZonioaAWp/Flqct
	GvTL9LtUuXT268YOnb1DWAKbVbhZQlUC3IX4sjiLMnxVy9vyB1YoL0jteqDa5NoXTrkwq6IYfBx
	JSAN/b4p+rMYk5aQHohWe1YOsG04FN2zMgvDWwdb45gb5puA6y+d6JmaPts3PH0ngCkJWYUiZYQ
	vn3owoTNJffE3yMB2zSUQ2w0+sr4itYR5yYHVABQLSECKVZX/wWz230Bxcmh2uQ9ST/GKRJPHPq
	jaeYmK9BPWywg=
X-Received: by 2002:a05:6a21:3383:b0:3c3:875d:7053 with SMTP id adf61e73a8af0-3db4049d144mr17326080637.8.1789467018076;
        Tue, 15 Sep 2026 03:10:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:3383:b0:3c3:875d:7053 with SMTP id adf61e73a8af0-3db4049d144mr17326024637.8.1789467017652;
        Tue, 15 Sep 2026 03:10:17 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14382741839sm14244091c88.6.2026.09.15.03.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:10:17 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:09:59 -0700
Subject: [PATCH v16 04/11] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-kaanapali-camss-v16-4-c9f3f6f4180c@oss.qualcomm.com>
References: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
In-Reply-To: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: uaqCVelJZaRR3IasAq_uLJuAbJnJuzr3
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa9198a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: uaqCVelJZaRR3IasAq_uLJuAbJnJuzr3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX0aSfFUNLsYxS
 Mc4qpxIC0nmIvqU0Oo0LsKSl8RHJkWM0gAN+MhLjbYkqLMp18ug8oJ984lrlxGRQeGPvcLoUbyr
 6Kfs6n4XIA1kvFkpEmyWb0yAg3mB9Dc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX1KN627fi8V6H
 w0jexdTs3j3RYnpjGDmyL+/xL40+Tyo/mQsIWMRfQisuOnoBSYt3DwQVAeUphl4Rjng7R+lPNq4
 XIDXpmwizrrGptNf4d2tOtZR9Dpc7sn9l3J7zUgVyq1xCGQYXoAmgowWAbh/jUk++guwJTLEi1h
 Pwq9c65N1h/+/IMb3/VzUxdyC8OlhtwP4VC3fDhPreukPZyo1TnqEeh0PegRbUf2pc1wkpUrea8
 t1/0uSzzzXwBJ26fYVg230tqKh0ts1TaSwzRFt4sklOyk18vSi3owTtHudMMu4Kb51Ph46Skq6m
 e4UcPaz2HQA2y0pWaKCvrNmDJha2jjJIE6DjC//EYRqmHaRg7vIN4Z45NVg5GhJtpYSo2Ezo3/K
 UrDV269IuwBm4Btracn8CzwSRlcio3bY6jY6O486BY+vU7OEbF9hZ3+NelzYcKebGyu3mHLJHYQ
 BJFHMPCA1IeaRzUDt+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150146

The CSI2 PHY common status registers are not at a fixed offset from the
common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
v2.4.0 parts differ.

Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
no-functional-change preparation for describing other SoC offsets.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 +++++++++++-----
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 966d79c98f9b..8cd331cfb4b3 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -19,7 +19,8 @@
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD	BIT(0)
-#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
+#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, common_status_offset, n) \
+	((offset) + (common_status_offset) + 0x4 * (n))
 
 #define CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(n)		((0x200 * (n)) + 0x24)
 
@@ -176,19 +177,23 @@ static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2p
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 12));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 12));
 	csi2phy->hw_version = tmp;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 13));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 13));
 	csi2phy->hw_version |= (tmp << 8) & 0xFF00;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 14));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 14));
 	csi2phy->hw_version |= (tmp << 16) & 0xFF0000;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 15));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 15));
 	csi2phy->hw_version |= (tmp << 24) & 0xFF000000;
 
 	dev_dbg_once(csi2phy->dev, "CSIPHY 3PH HW Version = 0x%08x\n", csi2phy->hw_version);
@@ -375,6 +380,7 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 		.init_seq = lane_regs_x1e80100,
 		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
 		.common_regs_offset = 0x1000,
+		.common_status_offset = 0xb0,
 	},
 	.supply_names = (const char **)x1e_supplies,
 	.num_supplies = ARRAY_SIZE(x1e_supplies),
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 7e55ae007370..d6366f809e51 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -51,6 +51,7 @@ struct mipi_csi2phy_device_regs {
 	const struct mipi_csi2phy_lane_regs *init_seq;
 	const int lane_array_size;
 	const u32 common_regs_offset;
+	const u32 common_status_offset;
 };
 
 struct mipi_csi2_genpd {

-- 
2.34.1

