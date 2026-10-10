Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584F23939D0
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 16:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648086; cv=none; b=YT3DMvU8C9MNDNXMgIxfZcDMHKuCbWR8+79dLkCa5SCyvzzpEMPhQ2MiTDobNE0gDXfDnUNjMkOS//iFbCqtg6tFloMOAomPMqSJrZTFIUk92UMPn5Li6GU0Soo8W+x9GAVKrhX1Qm8wjI6VXMNU5R1YPX5djAwPEAATg7+D5vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648086; c=relaxed/simple;
	bh=RzCywbWgx8dE3jNijkrCi/shzOFGdqaG/+4eys9w8X0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UOXjLmQrkAfqMUjLewiXN+/90kvmTXzybi39YxDyrT9WXSCCTXIQ5b5VzXK6AqEA0e8t9m2QNj9DAdW0YB2wwf111ha0SxnpRuK6mGWQlzjiuMiqm3+BebnXEPV3ppqpGAVLg0K+rH37vtmlIiXNMc3tB9x7xMjmz89AFW7O4OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eW2WKOA3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TEmmHmwz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eW2WKOA3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TEmmHmwz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFPFVS1489823
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 16:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=; b=eW2WKOA31ShPJ4f0
	/jEXeAjHajDOxy/nOuSfsf+7bW7zL5NyHTybai9T5Pt+YpxDR43QY/hFYk8hW74h
	MDrJ5o/Tbl0zzVXio3En0MrBh/K7QiV66vKEoxJhOsaJy77Af9ddggCAQg3zD6gp
	YEYL0za+foE8+ePw0qwkGX5qYnv3XFtoSEiez7o5vsXhP8Qo2rcZtcmoAL2QCjaH
	JPdfiNG7QECud6eZMLSPyxLhbCU7OWu3zME75aQ4dxpj6W4m+VsfJybrMHSb/UR/
	7CdB+b+rx/e/2ObmsCwudOQAcAc+D7fXlEpPCez9VQLQ1F9VkT0yfiORNY8qPUrb
	aKHnaw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cxxhee3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 16:01:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30f1b904861so1358249eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 09:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791648083; x=1792252883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=;
        b=TEmmHmwz7X+fIGqR6xzcEeuxA9KdGkkq3nBPf/elmpcU+lW5hUy8WRW3DVbAtuI9Td
         0IPAjlUMkB+xjYDYw7Y3Z7o/o0kUU4bK1B2ykhIMDLbfGrmfs7hNFX1dXdPYzrovOiPT
         VR9O7T/O7t5XYmHUnDHFNmIWvi5Nl8oMreAmIANC4zQ6iCV0fOnYjZtcbudsiLaBK/Xr
         EOFtwEMJqPqB06kF5aXepRi1LG1pkAd7FW9iER1pKfHzJYzMsMvduy4C1HVVmX5XvZVG
         +ez5fsiUlEYUMmBW/x/xqRTmBcUroN1+VxKlVFIvYQJm+22+04cQJg5015hr4QwXVqwM
         qrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648083; x=1792252883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=;
        b=qLSW51820sZBwexfWokw2FySCnwuJy/FoNWI2UpPUkyWVdb+L4JXxyludM4tXJYWxc
         r+umfwQbO+CT9kZWZ/wYu7qGH8dOTkZ8TkG9ycvscX2TsN0hfJYsDFbSblkE2YK8cGLC
         sXpN+9gdqQSZTx1+Dik4F1YIeXz5jWc3wglm2hZ1IH+vRPNIIEjQuCp2M//Ua/et3AHx
         sP8EUO+gxOPD7Ko3u9UAts72BO3WmZrnEECfmTIlaVT2bsjrWRMfcC5GhysaBvfYEW2A
         EfFlk4VNj69noEDQMi8GU8uQcLYIAX8/EApfOEGqccBo4O6cPHNpE1+1ulz9jgvuQ1R7
         QLYw==
X-Forwarded-Encrypted: i=1; AKwUvBxlrYhjYplIqrMR5oUdswWWnWmU/fCU5jwszUT9bBorUhmNDGsPKkNqkVZxMLJYThSDA4+fypcmf0iIJtyL@vger.kernel.org
X-Gm-Message-State: AFq9FYIe2LdaaoNrFsLzh3Hb9NSw2i0IrfIMTvoR4v0jF/DPadmMOVn/
	lFgsaAkiDjs7QrhAKrTi6qAUCOdKzDFw3eAPNu54I18VchC645jYrEPdQNefpGiZvJQusA8LAAz
	WtXw8x4bd/yOgKtFJyAGuyo88hOBMiBz8CBPgoDEY676NJX503xr37C98jN7PNf0o+KYe
X-Gm-Gg: AYBFou0ebhYEeBwDueXs04LwlycRUo25fZsCjhO208Y7KugeFe++oxd8yP2J0adAa7l
	ZwfEXi36acXZteKdmspxOyD43dwTOWsqwGAf+eVXa8JAz9WLMHRojLP9USoGGRrZFxwUwR0rYC+
	P7kiKSrMlos+qOT1gTj+SmbwHYNfIO4Wqg3Hjx65eKkvLOLb92AUHu7HedSCTRGTX0hVl2w6RUM
	ZbNhtVEyoFOjEjJNqFjXPf/4x16aYEr7hveRTxzLvHSVMstA09FpVATN7HIxsFoWQT4ydpHMUtV
	b0Tg0V2/NK3D0zUi3O1NcLMEsCFcHWF+p2UqwK/9djsRBLVYJAV8u1aTbwA1CdwrJzVEGmmu8Uu
	wmPRaQ1wQyazLiM0bfAa10Yoi09fW2AxLWSPutQZ2wocswrh/2IIPNW23bh3FP5jEBzwHeCfwhJ
	N9XmOQWkcRFg==
X-Received: by 2002:a05:701b:4512:20b0:14a:d8fe:33b3 with SMTP id a92af1059eb24-16a62bcc0a7mr6077951c88.40.1791648083132;
        Sat, 10 Oct 2026 09:01:23 -0700 (PDT)
X-Received: by 2002:a05:701b:4512:20b0:14a:d8fe:33b3 with SMTP id a92af1059eb24-16a62bcc0a7mr6077906c88.40.1791648082484;
        Sat, 10 Oct 2026 09:01:22 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm30786022c88.13.2026.10.10.09.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:22 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 09:01:07 -0700
Subject: [PATCH v20 02/13] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-kaanapali-camss-v20-2-63e98ce9ac0c@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
In-Reply-To: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
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
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: XYpfPTyAUEYD1DCXwS3kOKq-cjYcAD_3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX0Jo1q4HEumhX
 LpXMnk/9uXDb0bUZKTVg0BQHbX4EqlOUnbBqnyzNVgQ3J2pR5p92vS5X4FRndthckwKvUBusQP4
 pBMOiB4aOMhUaYTlazQbcG9fRNl1Zs4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX05Ded1R8Gijj
 Jz56as+pekzu2cOFqkOe110hls4NENkSE07LG/tvPRGQu6uiZ2HuGmdlkKX6Yb5DD1+Q7F3l4v6
 32Mmu2ciFNdmi4JhHh4+0VNjvRMOB7S4O8LXBVKBnjg62/bam+X1Xl5Fz9RabzgvtHlI+i+lcXS
 voIqjJ4Q9P7jsnIug+WTZkKVpE2v2BuQMADnVL88QppfAspktQtzU4NmMg2ZNlsZogdulopQwg2
 ibWZ8gg7PfBuQQpYM3pEQfkvX76Mtiz1n8al+X29TN/56AegNWgWcHby4HuRHryrprPd7hd8Qwu
 aBUNS3O+2+By/JhMYeGjc83pdSfg+22eMeBFs2GdQtcCo0sGI7JP3SaOiwGVtHzxnOdeUQ2kKgV
 gnBH0J6NoR0OWs6bZeUep46HRY/+lfn+vZyKxvY/UP5SDDO8Rrx58R1Zw/nPCKgMeBohqDVO2/T
 fRYmJ6LvOyBkZgpUk/g==
X-Authority-Analysis: v=2.4 cv=AsJ7T+9P c=1 sm=1 tr=0 ts=6aca6154 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: XYpfPTyAUEYD1DCXwS3kOKq-cjYcAD_3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100063

The CSI2 PHY common status registers are not at a fixed offset from the
common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
v2.4.0 parts differ.

Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
no-functional-change preparation for describing other SoC offsets.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
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

