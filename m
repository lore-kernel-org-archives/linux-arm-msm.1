Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6504C33FA
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728028; cv=none; b=laUkSLhT6fJpJEMBxiclT7viJ0EJr6Xe6YoQYjxe/Rc6NcVvWwLb69MqGpGiFbj8z0xjPJ/YEJXxmP5RWW9LdPwIknR3HaabXl2+qTDG6UOxH1eaO0Wua7w/fopY7NlZsePg2a7r9SfCW4qHq5xG5GTreFB80ZhU8gdDSAxwjdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728028; c=relaxed/simple;
	bh=vvboFhjhTvFie91LJaaJcuqWM/kZ5yCsf5rhMJlRAuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qpMG/03NGnNMzU7AHOuvc1ZgZ0dRpNAWBknbrj1nRQcJyx3EKfIDma4WtVIPcgmkiTNyxSQ/TniVJbU3PZXp66bM7JqJPwVIFAqNjUt311wwLJfFMz7mFtNBn9Eolo88sA6druXcCCzUF2H1owDrMffsS9pSVngAKNHSHAgBALI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7F46Pyb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gucf4wT6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7F46Pyb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gucf4wT6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dYGZ705508
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Nh+NmNFCLw6H1mKl79KS+XuOQAwflA4sy/wRgQsFUc=; b=a7F46PybGK8Uhcai
	UQLJWFVqFydV93V1SN/zkHjk6/oFEd16tQbG49/Yynw7rtrnJZsLgZK2+LsSGT0A
	GpSTQTLxdJjF6n8oCSSQTlPuhM3kbiaR5xPHYWeEgrarz5GQMgo3GsFDtHFKAl5f
	5Y9W5oVf+mhqFQlRhrYajwwmQ0B4n3zXWERYvAAPdAJhM6l4OXRtMFMl8yOiR6KN
	/5npVhNo5RxhS7IyEtf8KIKIPsdeIFsXGFUeMxL89S+7bz/DEr2xV2szZTqBOE3E
	NtNNZmiG0SYAkkSy/t8+i2ECa0q9V8cNOac3vqdX6WdkMQK4dnDksNUqxS7ZY2y6
	g8fA/w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grxp2sb6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:40:18 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so482262a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 03:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789728017; x=1790332817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Nh+NmNFCLw6H1mKl79KS+XuOQAwflA4sy/wRgQsFUc=;
        b=Gucf4wT6PXmI/HW1Ike8aee6Clu1LcVnDLi+YY2ZyLKT4kH2DhomUDZk7vOM3lBIB9
         wJRiDo9pUpe0YZlw3Wz891A8fx19J8mbL98T5Eq298y7GNQo0bhQWIsMBiYmq4qZ7FwS
         rU13A40jRctxP3HL+xGDFEhcTCXl/E6oE/+uM3JV61tBgflaVU80ktnaWv3SvbjP4Y9e
         jFfpr4cPAsHkxSCSOitenyQHC+Wv7BaAQeNjFR/q8fv5GTYDRyJ0gpONrvy8WZmGGIFa
         gYx//RmgxLJhshSDnaoz94M7jjU+SEJy5+u/qdhS7XPgTF0ex8SAjuYcSFoIKti1DqSy
         r9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789728017; x=1790332817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Nh+NmNFCLw6H1mKl79KS+XuOQAwflA4sy/wRgQsFUc=;
        b=WKPajnaqviQ/W08tL6zL8ynp7/zAu5Enf1D8fAvuGVUocw5YoS/8VXvrPIeVDSwD+p
         3Sv+cc8ma4aOh1sFuyMLATrziypGSaOYUOGRFNMa7l/4K6jkaxRow8pW5wDZz+VgEo8h
         t+gb+kHhxHkYIgRvLHedpe6AOIPTcJCWjozbOdbP8Q90aRRvV1ejIokRJ1/RBTTWsrgi
         lyoNYHWLeYbIzpw+sh7zCGpaMRiIy1G4nLXk+HWqVnug5xmC1TyOLGmUlZx9xBSO6sNL
         lupitKr3L5NPob0wBzK/ToLRZrFKfNmCzkGc1+9k9NGNWMVEefGndUEqjAy0uaWM3h6E
         0hmw==
X-Gm-Message-State: AFuF++lVAk9Rh+G3QUDQSBMDKG+t2h2W80/71TNGhG9E3uSHdkDnYWTu
	3ra1f7OVhp6ddIKYVdByX3wn1FA92o9YuwJcFD4Eh0+QKGmR6meBsNeBp63cvHRpsL5O65dvBRV
	Nu53XuJ4yG9qkY41atLclAwM7Bb4AU3O4ZM2HPfClxPnXsh3sn0K0uOxyudmOF0tZgma5
X-Gm-Gg: AYBFou0NxQdpru1AUMDJ1F1dESbVfuUoApp9jJbHTRP5h98YvUWQYEfRmw6Gu2FiLHQ
	pqPXpa/JlubE8nAabiBmxqChONohE60O9m3mRJfXFLx0m2RR//YwxNvDbTUGLsmuUvsMynjr3Vz
	7AdICgcledLNIpt6IjbXnrXNpmzLlZLZA30kQLEVmubFvdEaNEo7GJ6LunGBQfCQn4HY1XL/DwO
	CEPf+KGDiuH+vWlK3toBRybdZW/uUo6+kdpt/tEnwyDvJRMXeLClYN6L2me10Fi4u3GE103n0G3
	iVTGi3hUYNsNZ2RgKzc4jh3ruIHtG4bolav/Y2scqswfFs2OT1x0g2ULg5VVRnkHBiTatX3Yd3K
	19/m2iGu2hlJm8IfTVciyC5Bj3w==
X-Received: by 2002:a05:6a20:4306:b0:3d3:ad3c:49a7 with SMTP id adf61e73a8af0-3dd8c5161b8mr4390029637.21.1789728016905;
        Fri, 18 Sep 2026 03:40:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:4306:b0:3d3:ad3c:49a7 with SMTP id adf61e73a8af0-3dd8c5161b8mr4389948637.21.1789728016410;
        Fri, 18 Sep 2026 03:40:16 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c286d98e7sm4020702eec.9.2026.09.18.03.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 03:40:15 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:09:11 +0530
Subject: [PATCH v2 5/5] phy: qcom-qmp-ufs: Add Glymur support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-glymur_ufs_qcb_enablement-v2-5-16619f7e36a6@oss.qualcomm.com>
References: <20260918-glymur_ufs_qcb_enablement-v2-0-16619f7e36a6@oss.qualcomm.com>
In-Reply-To: <20260918-glymur_ufs_qcb_enablement-v2-0-16619f7e36a6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789727970; l=6280;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=vvboFhjhTvFie91LJaaJcuqWM/kZ5yCsf5rhMJlRAuE=;
 b=wX81ODLVtK0gR9Se07QBYj1Yf+XWlGZ1/jwnHoyT9vt6Bv1Kr4YJdyBwgXnHy0TlqllzlzpBo
 hOeTQgzNBC7CPMp2zWB7MUZ2EN9FsDAEJu/Hc0Nd07JoN3h+TNEZL/X
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0OSBTYWx0ZWRfX3BOHmzbqcjdt
 pQhFtzpR+B9Mz9doISXHHeKuo5cODaj05WcH9RKmCr5F7eEl7aZTSrbbv00XmZn21s9d7Of81Dq
 dS5Kq+s2nJGwpOKNoTBEdR/+QhRyM1g=
X-Proofpoint-GUID: hDo-ik5yrWJwh8Al8VvGpdPhuQZKYizW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0OSBTYWx0ZWRfXy1KZ3Ywwkc0b
 4btWtbKBD/Nu1deSm8vMYF15wqSgSNhsF2lXWtk7/33OUP14hEDhsXKQpMkQHV8HlLLstoHtuw9
 PRCNxQMIk4jnPL4ZJ8GzrBusmaNWMPueifoUtGs/9bGyI4nnTDi+7pJTDZ9HoI1G+QnBSNkxXkP
 0e3Axp+l779jtrjh4/RK770Wuv+d7mvX0fRtZhWsRDng4wwF2RRZ+OTd53m/HLDi5kzAnltzKzm
 SAfMGHzIH2qXuIvaYw/armPdMH3BDbHpVMm0rC9T6TklTazRnaOJ+QDo9gyyuk3RmEUeZOqDDm5
 oVzVOspH1OVQe1IqcpWdN1hAK9ul1Jl96h24HB12c5BvergPDcVtGF2kRAsZS7aHmr+n5jcyty+
 y07rATNMcB+EjETQccEJHXLPUTQ62CI2T6TsNErQ3jIizNuJNlon/teV5e28iy+1MGTJela5p+g
 oOWdnIqsodQMSmxHIGw==
X-Proofpoint-ORIG-GUID: hDo-ik5yrWJwh8Al8VvGpdPhuQZKYizW
X-Authority-Analysis: v=2.4 cv=cNF1IVeN c=1 sm=1 tr=0 ts=6aad1512 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=EEZK_nQxm5Uv2-YDnh4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180149

Add the init sequence tables and config for the UFS QMP phy found in
the Glymur SoC.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 99 +++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index d4aca22c181e..ffef8801143a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -93,6 +93,59 @@ static const unsigned int ufsphy_v7_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V7_PCS_UFS_POWER_DOWN_CONTROL,
 };
 
+static const struct qmp_phy_init_tbl glymur_ufsphy_rx[] = {
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_FO_GAIN_RATE2, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_FO_GAIN_RATE4, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_SO_GAIN_RATE4, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_PI_CONTROLS, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_OFFSET_ADAPTOR_CNTRL3, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_FASTLOCK_COUNT_HIGH_RATE4, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_FASTLOCK_FO_GAIN_RATE4, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_FASTLOCK_SO_GAIN_RATE4, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_VGA_CAL_MAN_VAL, 0xce),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_EQU_ADAPTOR_CNTRL4, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B0, 0xce),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B1, 0xce),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B2, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B3, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B4, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B6, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B7, 0x62),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE2_B3, 0x9a),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE2_B6, 0xe2),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE2_B7, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B0, 0x1b),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B1, 0x1b),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B2, 0x98),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B3, 0x9b),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B4, 0x2a),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B5, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B7, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B8, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B0, 0x93),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B1, 0x93),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B2, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B3, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B4, 0x5f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B5, 0x92),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B6, 0xe3),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B7, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B0, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B1, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B2, 0xe0),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B3, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B4, 0x5f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B5, 0x92),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B6, 0xfb),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B7, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_SO_SATURATION, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_PI_CTRL1, 0x94),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_TERM_BW_CTRL0, 0xfa),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_DLL0_FTUNE_CTRL, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_SIGDET_CAL_TRIM, 0x77),
+};
+
 static const struct qmp_phy_init_tbl milos_ufsphy_serdes[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0xd9),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
@@ -1236,6 +1289,11 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
 }
 
 /* Regulator bulk data with load values for specific configurations */
+static const struct regulator_bulk_data glymur_ufsphy_vreg_l[] = {
+	{ .supply = "vdda-phy", .init_load_uA = 217130 },
+	{ .supply = "vdda-pll", .init_load_uA = 18340 },
+};
+
 static const struct regulator_bulk_data milos_ufsphy_vreg_l[] = {
 	{ .supply = "vdda-phy", .init_load_uA = 140120 },
 	{ .supply = "vdda-pll", .init_load_uA = 18340 },
@@ -1348,6 +1406,44 @@ static const struct qmp_ufs_offsets qmp_ufs_offsets_v7 = {
 	.rx2		= 0x3000,
 };
 
+static const struct qmp_phy_cfg glymur_ufsphy_cfg = {
+	.lanes			= 2,
+
+	.offsets		= &qmp_ufs_offsets_v6,
+	.max_supported_gear	= UFS_HS_G5,
+
+	.tbls = {
+		.serdes		= sm8750_ufsphy_serdes,
+		.serdes_num	= ARRAY_SIZE(sm8750_ufsphy_serdes),
+		.tx		= sm8750_ufsphy_tx,
+		.tx_num		= ARRAY_SIZE(sm8750_ufsphy_tx),
+		.rx		= glymur_ufsphy_rx,
+		.rx_num		= ARRAY_SIZE(glymur_ufsphy_rx),
+		.pcs		= sm8750_ufsphy_pcs,
+		.pcs_num	= ARRAY_SIZE(sm8750_ufsphy_pcs),
+	},
+
+	.tbls_hs_b = {
+		.pcs		= sm8750_ufsphy_hs_b_pcs,
+		.pcs_num	= ARRAY_SIZE(sm8750_ufsphy_hs_b_pcs),
+	},
+
+	.tbls_hs_overlay[0] = {
+		.pcs		= sm8750_ufsphy_g4_pcs,
+		.pcs_num	= ARRAY_SIZE(sm8750_ufsphy_g4_pcs),
+		.max_gear	= UFS_HS_G4,
+	},
+	.tbls_hs_overlay[1] = {
+		.pcs		= sm8650_ufsphy_g5_pcs,
+		.pcs_num	= ARRAY_SIZE(sm8650_ufsphy_g5_pcs),
+		.max_gear	= UFS_HS_G5,
+	},
+
+	.vreg_list		= glymur_ufsphy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(glymur_ufsphy_vreg_l),
+	.regs			= ufsphy_v6_regs_layout,
+};
+
 static const struct qmp_phy_cfg milos_ufsphy_cfg = {
 	.lanes			= 2,
 
@@ -2395,6 +2491,9 @@ static int qmp_ufs_probe(struct platform_device *pdev)
 
 static const struct of_device_id qmp_ufs_of_match_table[] = {
 	{
+		.compatible = "qcom,glymur-qmp-ufs-phy",
+		.data = &glymur_ufsphy_cfg,
+	}, {
 		.compatible = "qcom,hawi-qmp-ufs-phy",
 		.data = &hawi_ufsphy_cfg,
 	}, {

-- 
2.34.1

