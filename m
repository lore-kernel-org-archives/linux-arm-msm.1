Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60883BAD93
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 16:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648087; cv=none; b=Z6C42quTkljYRUEzxUTZEUhmW82Vn7DXd8MCE0OgGQPSbb3fwGhwBSat6R/k9+c41TTW7OmPUGkxKkt5aVbaO2A7+gTZWmgFOCNX6RFNzxNCT5AVHR40qubuR7bMv7mRYfjhExGmmeJFBKD0qv7iAPdRs/KNu5sdxAY2BjJyDOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648087; c=relaxed/simple;
	bh=ZHkg5zM+lJIOFrCLJ/Suoj+HX48bpaqLr1WZJ5FQ+VA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XCvKFKw7fqv7uiEq4+SlYYIotpyyfFbeMUX9AfaPzcJneiOO76krsbxI3Y7g1K9n1nB3PnZCy/hDGTr2rP/1M9x82rEsHNYQMkgrDxgAOKm9csBMCxXQ5YmVjLehsetqc3PMDjwCxiObB4Uoms+OCms+7M1Rgc3MjQmvxEqEz1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XoEPxQSO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y+SfDGdA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XoEPxQSO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y+SfDGdA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFOqOX2078232
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 16:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=; b=XoEPxQSOXzlZt8AX
	bMjFxRlBzJIsWvtrk4FAEGUr0BXAoxNVSLJaLI+V61pulY+s3WkQjU4+0wobLa6Y
	3bd+/6PGJms1vWYM92ck37fCgU4oORi1H3cIrrJO0pieC+SwMY9VeP58YQMkNHVM
	Au5t+9OWyveLcjImUTX2+/Y6rCHTr7bcD1JWIpM75VELbIsxY+xyIDIuiMWN1SMY
	qGHFfMGaMR5/EcPRUBzJpAv7xcjK2BK+oEZAzaRlOMDZhueVSkqmzsfNQcN37sGG
	5F7P/+XTesN1Vt0FVY8GDT7THpPeHnfja3wbZS5ll399n+1tU1qdWBm7Pu1cF5S1
	0XdwYQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7b2f9puv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 16:01:24 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14fed306427so2898393c88.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 09:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791648084; x=1792252884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=;
        b=Y+SfDGdADLWT+3iuSHKBLnEqV+iemMSSwXaMpMzC5Rs94GGbUcX3rWcEyMH0MD/kQg
         bIFbvZzoh2xdtYhV0IjIrSs9LGg5+EBcySFu7gQPhrRyWfxsA/qX2TBi2XbND7hr7FIk
         sfoEhunsMZppj2G+Vvsa2TpfTf+Je8c+ETnc/R67WSHqeq/q/EWGqaWxO76/VrMgTFH/
         BcSgFROzg5U7VBPpjejSYfGo3R1qgVvpquPOdfCJlHjirhFJdGSdCHi43wEB7XEM2Xh3
         2VMDcRSYOkxSP6gp3JGNpNqkoDYLNBqXUOBBU2DJ+zeqEkJmzs+3vQOXmpI12F3ySlVI
         jOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648084; x=1792252884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=;
        b=DZvDbok1Jph49m327qHsrAYYVoAiwMd0JXHB/gGmLq0d23uHwbAkGmTLDC3ZZHz4zO
         o9xqxGnG9E6h4F+45Z0nUsPzzeJ456Civ0WU2vVMaX7OhSrBlsdbS9fq566396xsTnT5
         Au7n5U2YkNuC2Rf1r3Qca5KkQmKJCkpQeCqnbVPdy8kl7dkwvxaJhoO/Cy7QSdD6bMWp
         AZW311T1tAGz+isJayz9KLAGQxhTOFYqDJwfp7p5sqGcPuoxz9KWfivUDrrQSzJlKXAz
         p4VD6m4aB+ZtTjogb6EX4xvqKanCh07Ita8DreRXFQVL6MApkQDLH50GNfexQ3H3LdDY
         mgZg==
X-Forwarded-Encrypted: i=1; AKwUvBxsNx6JJF7Qb1rUUFCxCpdPxIW6JKo2wxiG0xwmqRTzAN4OQlbpn8lDfNisXpjC3QF4aE2lXDnRTyi47aRc@vger.kernel.org
X-Gm-Message-State: AFq9FYII2kYsq/ZKGLyw/i6grO6TIyYIVkHanI+tzgl38VPb4ZvIBfrG
	HmuPityoPsf5/NTn07vOzQbGwMPXtAeCmH4RhuBwx8bPo/oMTJXNpP8BgHFMi1iEtzpticBzVeR
	jXVhT4RU1EXkbFaVtC35pN7SiRQcUqQeVx+Njz4EhY77J3wv7aAr55gonwHt/PvfMMk49
X-Gm-Gg: AYBFou1GIGz3vD2Nkxsz2Z8J+Vj6efAxrG0+t6lWTuYcRxKArV5z7U5VZy/2+BdMZqN
	nHAqDX84lV6NvhrpsOzMWFRfmqlEEoNZDw6U/kGAkyw1oULohziV6FjiGS+GQenUmcOFdfs27i2
	Uex+OwKHKI6uEcJEhwkuJ8sKc3VT/NCzbSa7NLBRRE9wo/G8ik0mMOxIW2rB4vZD4yiL0N3Y16x
	PnL4r6FIbZ1EcWUu3dPSZpliQ6IvG4j8UX8jI5r2kgc4+0McyRystpB7+I+6P/RzzGEqcynU2d3
	c59yDO2dutBQPXerOrQtvfGfL6AG+cNeToT+B0D/g7LgndY5fB+udcY9E+7UwiMAM7E/tF9iZ5k
	xZJPXcCRMLLiH0rIbf8FYhLU/HYOI9sphWfwnyz4cPt22iYCGISB+zzHJ5SzpkZjw6qGZagIylZ
	9ECEAav10Htg==
X-Received: by 2002:a05:701b:4583:20b0:151:9af3:1beb with SMTP id a92af1059eb24-16a5dee12e2mr6475642c88.10.1791648084222;
        Sat, 10 Oct 2026 09:01:24 -0700 (PDT)
X-Received: by 2002:a05:701b:4583:20b0:151:9af3:1beb with SMTP id a92af1059eb24-16a5dee12e2mr6475573c88.10.1791648083488;
        Sat, 10 Oct 2026 09:01:23 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm30786022c88.13.2026.10.10.09.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:23 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 09:01:08 -0700
Subject: [PATCH v20 03/13] phy: qcom-mipi-csi2: Add Kaanapali support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-kaanapali-camss-v20-3-63e98ce9ac0c@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX+40Xe57bFbn8
 CCXTcQKJK21DSpTSqNmKhwLBSimmurmCkC0QOkmPoJkDDCdYQ8RH0e2gfdbGswFsThCSc7MOrja
 B8TYIGd2ZCnM38hnXlwafMdqMmVwIEk=
X-Proofpoint-GUID: eyjgP5qK1hOJ-QcjAuskz_Wq6HBVFGnJ
X-Authority-Analysis: v=2.4 cv=NddzRGD4 c=1 sm=1 tr=0 ts=6aca6154 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1e3Zegj4IIqRqDCgfwkA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfXzgG/2LEXZ1Kq
 WP0FBBKfSZR+mAqCXxdrmMgR5k/3Aw5lRPkzkS681CMX4jahL/zfbc644f0lU4+A5XS2MBzbpuW
 5rwA4W2l5xdTtUV78P94FR/C7q5ok5en6jFteMmRE/K4EHlEMyAXxEyce6z/mXNjP6UvlKsplr1
 4NGkExIC+fGDTxwG035/GGZlU+4mgdV9nya2PcLZGR3CDV63VAlw1IR8lTrvhb4XguQOcTIPj/F
 sVNbDsXVC21RnJ+46Be1ZpjwjJCbpZ5FdN5Zm/Ite2otfTPexp0XWso9cojL30BKvQ7sLdgyQFH
 sfPcNtuupw50j8QfKD26i7/hSDa+j8at2lPBgwgEOqqUQeGqpI2Nx5psngsXGGlgFv/aMyBCVPO
 8nzDCfGJWBEnqkVz2E2WxU0V/ORjH+iXAlZH8GcfCm7XOErxonxE6g+JFOUI3WrQ90zriU8uxqS
 V8G0H1C4RXLqL+e3PvA==
X-Proofpoint-ORIG-GUID: eyjgP5qK1hOJ-QcjAuskz_Wq6HBVFGnJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100063

Add the Kaanapali 3nm configuration for the standalone CSI2 DPHY
driver, including the Kaanapali common status offset and power domain.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 3 files changed, 18 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 8cd331cfb4b3..658a39463104 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -389,3 +389,19 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.genpds = x1e_genpds,
 	.num_genpds = ARRAY_SIZE(x1e_genpds),
 };
+
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_x1e80100,
+		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
+		.common_regs_offset = 0x1000,
+		.common_status_offset = 0x138,
+	},
+	.supply_names = (const char **)x1e_supplies,
+	.num_supplies = ARRAY_SIZE(x1e_supplies),
+	.clk_names = (const char **)x1e_clks,
+	.num_clk = ARRAY_SIZE(x1e_clks),
+	.genpds = x1e_genpds,
+	.num_genpds = ARRAY_SIZE(x1e_genpds),
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index c0a4fa20eaf0..aff9e66f0352 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -444,6 +444,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
+	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, phy_qcom_mipi_csi2_of_match_table);
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index d6366f809e51..2355a1db9b94 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -94,5 +94,6 @@ struct mipi_csi2phy_device {
 };
 
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */

-- 
2.34.1

