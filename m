Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D149481A84
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 16:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786032811; cv=none; b=IbqvXw4hfd73Xo4/cZwqOxYUZcszzF3jk7ADqVyfbtNfdB+IlcsUlfh3Cbu39ES0cZzCtfpNEnW21tmylI9te12Yss33dcrPqBMbKNyXGbq+z2J5JhXDV8JyeFBnSuixUHpyFzaSA/iOnh/wCXF6o/xEDUuteYffmBNvsudcbwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786032811; c=relaxed/simple;
	bh=5PeyoTECQ66Iqyyoy9iYlx9GtWsQf+y6hV+Ddu5GYAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=baApIoT5lGq4/TY8iaPM9y8pwxwFiCN8y21JC0o2esZ4NUXCASP260ldISWvmeF3m8r/gdreGlSS2x78u/GtBXds9aCJij02SX6r9A3RONmQ4DgcKclXKjvwAH9IsRXy4rNh0vyD1NkHUpYK9ti2i01FuhRvKi723GA0byk/jIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRwK+Osb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gvf+mx3C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRwK+Osb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gvf+mx3C"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676Encva2228053
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 16:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j3yTiCd5w6P
	Lx2rBgGNNwifxet4nzymC6R6SBfaIrOI=; b=nRwK+Osb4DDTr1qw/kiuuCOd77C
	IzQAz225o4NVXFBQ7JRM7lVuXGSMLtuJwP/gsJK+7hyep2XXG+c0ZhTSPMj2eOFa
	E4wGLqkY28mm/Klm9kooRWdU3LDEBi/fxaNzbiL7hyLB1iiKkWhZJjW2R8DGlnn+
	5eGYU5Dw0vdyB1THsuIGP8wnuZGLuLOLRz1IG9N7zogq7UFA1jO9TxqMHhVKDaAy
	bxhAJIsGiBYNoZ4WSizNJ2mXBgnlE45Avk5AsZTjKEHtnpPJkQuOadvPGh0fd/lW
	kkj5gwa597jwNQf0cVIma7WScTYeFTWqgvoTzWSxDHmATpE+GEN7M+nzPDA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvn8ptnwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 16:13:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf6acd760cso28531835ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 09:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786032807; x=1786637607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j3yTiCd5w6PLx2rBgGNNwifxet4nzymC6R6SBfaIrOI=;
        b=gvf+mx3CI3M6ihKQEhxnNXPHmvgQg9ZwcZ6t4/C+YQAI7k0ASUS0CQ4q4K1rBnq0t1
         nUNv2lHimnDefjmpOWzzN099a5mayiy62+Ytq9ZncnnVgJRLgywm5kg4zOtYg0KwNxXg
         S8uG0fCOipSduPkq4/0noi10fhi/tPskNo4LBfgiu2sfC2Oli54bwkhQDW4Ee4QQYEho
         hAeNaHin9EhUj2lK2tgI0kBcVR5gT3HjElbT+k3wLcjyDot7u13U0k5gtEW1nr6gaQr0
         vlme5sQMvFPrwR5DbnUiXqCCKLsz7cPs2RvQv4A7kSPgwwn6P99vpXABZA6KUELWCNBK
         HSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786032807; x=1786637607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j3yTiCd5w6PLx2rBgGNNwifxet4nzymC6R6SBfaIrOI=;
        b=aS2rQLUETgbUJpWBsppgPvrNfi4uGjBQVLbDKtSeAXiIUP66JnnvGtC2RLmK6YY6oi
         ZlkVSLR1j3O65HOIxna+lKhYtpEQOUgHK5Ea57WwtYWhUjspJG3hnYduuIOvwHyJ8dl5
         0cY9747sMq3OwbKt/T/GuRDIbDpp+BfFxk03WPAwlA12mYMaw17UIA4CbjzTrsp178/t
         Ifv0TG2EkDAzbQh8YIL5ZGwUNUFykQMDDLrAelAcr3BROG9E/tL26MENJyo9FPLUDoY/
         RzD7BxA1Djm2Hlg1wbIe9d+b/MmR4uTr7mkZz+UY1ONjufC3zGhhIiKR8RRIPKL2PIqG
         5wQQ==
X-Gm-Message-State: AOJu0YznOxS2XtiAl44nnj6dIut0uENPOu7WGp5vlhbo0lqIpZa1RMGv
	C9aIauiiKhwAtC1eF56v2g2dfKslNKV6cc/mHQr6mxOvqXpMhO3n7w2Gbbjf2crK9ea0hI3kldZ
	yUHCFpCNfJE7ojooOPrDI9FfTkeo7dDjpFiJWZpEoahPPZXIGRK/uKTRoNliYLxpUT7nm
X-Gm-Gg: AR+sD132eV6/uh5TX8K7hDn1FErgDEqcl9lEz2/kxYwupaUPPTneqEnjnCiMLmqkBxe
	OxCN7MRXcmGx26i0ATAHz/XckSMae/NyxZJleXTSmKlTdmtf924bHJsWRAHPYiJccY5Ewi1iP9M
	+LS5nWf31SoZ6FvKTeXP2/42KN40hS8N35u5t7LfZJDDvJsJ2u48VAtEb/HD61IRuKsokoqFia1
	25UnF3L433/C2ZzMjp83iXjnOX0DWxidLaymXJliHVMeSZRVX3uX1Gg/l0hZxAthZiiCIA1yUAF
	aFWSiVBiX7mXZG1a59FZpqk5rSoa3CFXrCXHYCgN3KqYbZCWa3BUF61izmNcDd12LO2E3FQuaHM
	QWQh3Nrur2VB/BgntdRGwK+rP+nilGDMd
X-Received: by 2002:a17:90b:5683:b0:381:26f:8f05 with SMTP id 98e67ed59e1d1-3903c5380f7mr15941410a91.3.1786032806936;
        Thu, 06 Aug 2026 09:13:26 -0700 (PDT)
X-Received: by 2002:a17:90b:5683:b0:381:26f:8f05 with SMTP id 98e67ed59e1d1-3903c5380f7mr15941347a91.3.1786032806380;
        Thu, 06 Aug 2026 09:13:26 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b761asm43074546eec.1.2026.08.06.09.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 09:13:25 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH v6 2/2] phy: qcom-qmp-ufs: Add UFS PHY support on Hawi
Date: Thu,  6 Aug 2026 21:43:01 +0530
Message-Id: <20260806161301.1010876-3-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806161301.1010876-1-palash.kambar@oss.qualcomm.com>
References: <20260806161301.1010876-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEyNiBTYWx0ZWRfX6kKE3B3E/IVC
 7hcfun6aF/N9DlEIXUDMieMVGSEpc+bNmu+HMydGYmDTZI84tavdrGRUMeuZKVz0gwERL7H1qOF
 xq9QGI3D+exj9aTh4ccDF4CYjuVvhj4=
X-Authority-Analysis: v=2.4 cv=RPeD2Yi+ c=1 sm=1 tr=0 ts=6a74b2a8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=C2KyqtCk6L2573COy70A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: XV1zZd9odQI7QcV0rRMHm9fJxByn-BDh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEyNiBTYWx0ZWRfX0iDhVUTBc2ck
 SJOkPZ014Spw3AP8Qev873Xi1QIi8X2eYz+sRtj3zBPN39FvKYHHlllh0tzL23WQ2XRjHbw8foM
 q5YWKsNImNIBnTnCw87BoXJewhT1Xs2YSd1AuPcDjDKY8ddtYntVzNGn1BcmRD8CznEO4NYNEvT
 fCx6WOjtlG0qIhJoZCLoSNapYJPvYIPL33plhsq/niWs03bjDuITa40K/2MYavvpvoBo0Bn1UKm
 ouy0mqHp6jft46l4OmBKj+CfOOduW2QchndcUn5HOHqYusryoCvjKHtxFrS48SRa62SexIeAj9T
 4i8dPrZBGooYfGOHcwQ/tlZYLRJRvVRPu9yFfdKBBShrOyuoGUyi1pN5hg0Vh3X8THJFtWSRYv7
 wj5GcITVaJ6/g4NsrlR1jqln3VjWxDEMl7yOzQoVSYVdibN5YvBTcvIFUYFIGpSQ6SO6SSFxSRB
 icZUor3pddIfmQU167A==
X-Proofpoint-ORIG-GUID: XV1zZd9odQI7QcV0rRMHm9fJxByn-BDh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_01,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060126

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

Add the init sequence tables and config for the UFS QMP phy found in
the Hawi SoC.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h    |  24 +++
 .../qualcomm/phy-qcom-qmp-qserdes-com-v8.h    |  13 +-
 .../phy-qcom-qmp-qserdes-txrx-ufs-v8.h        |  37 +++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 139 ++++++++++++++++++
 4 files changed, 212 insertions(+), 1 deletion(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
new file mode 100644
index 000000000000..e0e73ac88e8a
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_UFS_V7_H_
+#define QCOM_PHY_QMP_PCS_UFS_V7_H_
+
+/* Only for QMP V7 PHY - UFS PCS registers */
+#define QPHY_V7_PCS_UFS_PHY_START			0x000
+#define QPHY_V7_PCS_UFS_POWER_DOWN_CONTROL		0x004
+#define QPHY_V7_PCS_UFS_SW_RESET			0x008
+#define QPHY_V7_PCS_UFS_PCS_CTRL1			0x01c
+#define QPHY_V7_PCS_UFS_PLL_CNTL			0x028
+#define QPHY_V7_PCS_UFS_TX_LARGE_AMP_DRV_LVL		0x02c
+#define QPHY_V7_PCS_UFS_TX_HSGEAR_CAPABILITY		0x060
+#define QPHY_V7_PCS_UFS_RX_HSGEAR_CAPABILITY		0x094
+#define QPHY_V7_PCS_UFS_LINECFG_DISABLE			0x140
+#define QPHY_V7_PCS_UFS_RX_SIGDET_CTRL2			0x150
+#define QPHY_V7_PCS_UFS_READY_STATUS			0x16c
+#define QPHY_V7_PCS_UFS_TX_MID_TERM_CTRL1		0x1b8
+#define QPHY_V7_PCS_UFS_MULTI_LANE_CTRL1		0x1c0
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h
index d8ac4c4a2c31..a3432fa6e38e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2026, The Linux Foundation. All rights reserved.
  */
 
 #ifndef QCOM_PHY_QMP_QSERDES_COM_V8_H_
@@ -71,5 +71,16 @@
 #define QSERDES_V8_COM_ADDITIONAL_MISC			0x1b4
 #define QSERDES_V8_COM_CMN_STATUS			0x2c8
 #define QSERDES_V8_COM_C_READY_STATUS			0x2f0
+#define QSERDES_V8_COM_PLL_IVCO_MODE1			0xf8
+#define QSERDES_V8_COM_CMN_IETRIM			0xfc
+#define QSERDES_V8_COM_CMN_IPTRIM			0x100
+#define QSERDES_V8_COM_VCO_TUNE_CTRL			0x13c
+#define QSERDES_V8_COM_ADAPTIVE_ANALOG_CONFIG		0x268
+#define QSERDES_V8_COM_CP_CTRL_ADAPTIVE_MODE0		0x26c
+#define QSERDES_V8_COM_PLL_RCCTRL_ADAPTIVE_MODE0	0x270
+#define QSERDES_V8_COM_PLL_CCTRL_ADAPTIVE_MODE0		0x274
+#define QSERDES_V8_COM_CP_CTRL_ADAPTIVE_MODE1		0x278
+#define QSERDES_V8_COM_PLL_RCCTRL_ADAPTIVE_MODE1	0x27c
+#define QSERDES_V8_COM_PLL_CCTRL_ADAPTIVE_MODE1		0x280
 
 #endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h
new file mode 100644
index 000000000000..1adc6dbc68a0
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_UFS_V8_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_UFS_V8_H_
+
+#define QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_TX		(0x34)
+#define QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_RX		(0x38)
+#define QSERDES_UFS_V8_TX_LANE_MODE_1				(0x80)
+#define QSERDES_UFS_V8_RX_UCDR_FO_GAIN_RATE2			(0x1bc)
+#define QSERDES_UFS_V8_RX_UCDR_FO_GAIN_RATE4			(0x1c4)
+#define QSERDES_UFS_V8_RX_UCDR_SO_GAIN_RATE4			(0x1dc)
+#define QSERDES_UFS_V8_RX_EQ_OFFSET_ADAPTOR_CNTRL1		(0x2c8)
+#define QSERDES_UFS_V8_RX_UCDR_PI_CONTROLS			(0x1e4)
+#define QSERDES_UFS_V8_RX_OFFSET_ADAPTOR_CNTRL3			(0x2d0)
+#define QSERDES_UFS_V8_RX_UCDR_FASTLOCK_COUNT_HIGH_RATE4	(0x120)
+#define QSERDES_UFS_V8_RX_UCDR_FASTLOCK_FO_GAIN_RATE4		(0xd4)
+#define QSERDES_UFS_V8_RX_UCDR_FASTLOCK_SO_GAIN_RATE4		(0xec)
+#define QSERDES_UFS_V8_RX_VGA_CAL_MAN_VAL			(0x288)
+#define QSERDES_UFS_V8_RX_EQU_ADAPTOR_CNTRL4			(0x2b0)
+#define QSERDES_UFS_V8_RX_MODE_RATE_0_1_B4			(0x324)
+#define QSERDES_UFS_V8_RX_MODE_RATE4_SA_B7			(0x3b4)
+#define QSERDES_UFS_V8_RX_MODE_RATE4_SA_B9			(0x3bc)
+#define QSERDES_UFS_V8_RX_MODE_RATE4_SB_B7			(0x3e0)
+#define QSERDES_UFS_V8_RX_MODE_RATE4_SB_B9			(0x3e8)
+#define QSERDES_UFS_V8_RX_MODE_RATE5_SA_B7			(0x40c)
+#define QSERDES_UFS_V8_RX_MODE_RATE5_SA_B9			(0x414)
+#define QSERDES_UFS_V8_RX_MODE_RATE5_SB_B7			(0x438)
+#define QSERDES_UFS_V8_RX_MODE_RATE5_SB_B9			(0x440)
+#define QSERDES_UFS_V8_RX_UCDR_SO_SATURATION			(0xf4)
+#define QSERDES_UFS_V8_RX_TERM_BW_CTRL0				(0x1ac)
+#define QSERDES_UFS_V8_RX_DLL0_FTUNE_CTRL			(0x498)
+#define QSERDES_UFS_V8_RX_SIGDET_CAL_TRIM			(0x4d0)
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 0f4ad24aa405..d4aca22c181e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -29,9 +29,11 @@
 #include "phy-qcom-qmp-pcs-ufs-v4.h"
 #include "phy-qcom-qmp-pcs-ufs-v5.h"
 #include "phy-qcom-qmp-pcs-ufs-v6.h"
+#include "phy-qcom-qmp-pcs-ufs-v7.h"
 
 #include "phy-qcom-qmp-qserdes-txrx-ufs-v6.h"
 #include "phy-qcom-qmp-qserdes-txrx-ufs-v7.h"
+#include "phy-qcom-qmp-qserdes-txrx-ufs-v8.h"
 
 /* QPHY_PCS_READY_STATUS bit */
 #define PCS_READY				BIT(0)
@@ -84,6 +86,13 @@ static const unsigned int ufsphy_v6_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V6_PCS_UFS_POWER_DOWN_CONTROL,
 };
 
+static const unsigned int ufsphy_v7_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_START_CTRL]		= QPHY_V7_PCS_UFS_PHY_START,
+	[QPHY_PCS_READY_STATUS]		= QPHY_V7_PCS_UFS_READY_STATUS,
+	[QPHY_SW_RESET]			= QPHY_V7_PCS_UFS_SW_RESET,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V7_PCS_UFS_POWER_DOWN_CONTROL,
+};
+
 static const struct qmp_phy_init_tbl milos_ufsphy_serdes[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0xd9),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
@@ -1307,6 +1316,11 @@ static const struct regulator_bulk_data sm8750_ufsphy_vreg_l[] = {
 	{ .supply = "vdda-pll", .init_load_uA = 18300 },
 };
 
+static const struct regulator_bulk_data hawi_ufsphy_vreg_l[] = {
+	{ .supply = "vdda-phy", .init_load_uA = 324000 },
+	{ .supply = "vdda-pll", .init_load_uA = 27000 },
+};
+
 static const struct qmp_ufs_offsets qmp_ufs_offsets = {
 	.serdes		= 0,
 	.pcs		= 0xc00,
@@ -1325,6 +1339,15 @@ static const struct qmp_ufs_offsets qmp_ufs_offsets_v6 = {
 	.rx2		= 0x1a00,
 };
 
+static const struct qmp_ufs_offsets qmp_ufs_offsets_v7 = {
+	.serdes		= 0,
+	.pcs		= 0x0400,
+	.tx		= 0x2000,
+	.rx		= 0x2000,
+	.tx2		= 0x3000,
+	.rx2		= 0x3000,
+};
+
 static const struct qmp_phy_cfg milos_ufsphy_cfg = {
 	.lanes			= 2,
 
@@ -1845,6 +1868,119 @@ static const struct qmp_phy_cfg sm8750_ufsphy_cfg = {
 
 };
 
+static const struct qmp_phy_init_tbl hawi_ufsphy_serdes[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_SYSCLK_EN_SEL, 0xd9),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CMN_CONFIG_1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_HSCLK_SEL_1, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_HSCLK_HS_SWITCH_SEL_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP_EN, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP_CFG, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_IVCO, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_IVCO_MODE1, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CMN_IETRIM, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CMN_IPTRIM, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_VCO_TUNE_MAP, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_VCO_TUNE_CTRL, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_ADAPTIVE_ANALOG_CONFIG, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DEC_START_MODE0, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_RCTRL_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_CCTRL_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CP_CTRL_ADAPTIVE_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_RCCTRL_ADAPTIVE_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_CCTRL_ADAPTIVE_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP1_MODE0, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP2_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x92),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DEC_START_MODE1, 0x4c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CP_CTRL_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_RCTRL_MODE1, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_CCTRL_MODE1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CP_CTRL_ADAPTIVE_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_RCCTRL_ADAPTIVE_MODE1, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_CCTRL_ADAPTIVE_MODE1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP1_MODE1, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP2_MODE1, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xbe),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x23),
+};
+
+static const struct qmp_phy_init_tbl hawi_ufsphy_tx[] = {
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_TX_LANE_MODE_1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_TX, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_RX, 0x17),
+};
+
+static const struct qmp_phy_init_tbl hawi_ufsphy_rx[] = {
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_FO_GAIN_RATE2, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_FO_GAIN_RATE4, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_SO_GAIN_RATE4, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_PI_CONTROLS, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_OFFSET_ADAPTOR_CNTRL3, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_FASTLOCK_COUNT_HIGH_RATE4, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_FASTLOCK_FO_GAIN_RATE4, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_FASTLOCK_SO_GAIN_RATE4, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_VGA_CAL_MAN_VAL, 0x8e),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_EQU_ADAPTOR_CNTRL4, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE_0_1_B4, 0xb8),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE4_SA_B7, 0x66),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE4_SA_B9, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE4_SB_B7, 0x66),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE4_SB_B9, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE5_SA_B7, 0x66),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE5_SA_B9, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE5_SB_B7, 0x66),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE5_SB_B9, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_SO_SATURATION, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_TERM_BW_CTRL0, 0xfa),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_DLL0_FTUNE_CTRL, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_SIGDET_CAL_TRIM, 0x77),
+};
+
+static const struct qmp_phy_init_tbl hawi_ufsphy_pcs[] = {
+	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
+	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_PCS_CTRL1, 0x42),
+	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_RX_SIGDET_CTRL2, 0x68),
+	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
+};
+
+static const struct qmp_phy_init_tbl hawi_ufsphy_g5_pcs[] = {
+	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_PLL_CNTL, 0x3b),
+	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x05),
+	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x05),
+};
+
+static const struct qmp_phy_cfg hawi_ufsphy_cfg = {
+	.lanes			= 2,
+
+	.offsets		= &qmp_ufs_offsets_v7,
+	.max_supported_gear	= UFS_HS_G5,
+
+	.tbls = {
+		.serdes		= hawi_ufsphy_serdes,
+		.serdes_num	= ARRAY_SIZE(hawi_ufsphy_serdes),
+		.tx		= hawi_ufsphy_tx,
+		.tx_num		= ARRAY_SIZE(hawi_ufsphy_tx),
+		.rx		= hawi_ufsphy_rx,
+		.rx_num		= ARRAY_SIZE(hawi_ufsphy_rx),
+		.pcs		= hawi_ufsphy_pcs,
+		.pcs_num	= ARRAY_SIZE(hawi_ufsphy_pcs),
+	},
+
+	.tbls_hs_overlay[0] = {
+		.pcs		= hawi_ufsphy_g5_pcs,
+		.pcs_num	= ARRAY_SIZE(hawi_ufsphy_g5_pcs),
+		.max_gear	= UFS_HS_G5,
+	},
+
+	.vreg_list		= hawi_ufsphy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(hawi_ufsphy_vreg_l),
+	.regs			= ufsphy_v7_regs_layout,
+};
+
 static void qmp_ufs_serdes_init(struct qmp_ufs *qmp, const struct qmp_phy_cfg_tbls *tbls)
 {
 	void __iomem *serdes = qmp->serdes;
@@ -2259,6 +2395,9 @@ static int qmp_ufs_probe(struct platform_device *pdev)
 
 static const struct of_device_id qmp_ufs_of_match_table[] = {
 	{
+		.compatible = "qcom,hawi-qmp-ufs-phy",
+		.data = &hawi_ufsphy_cfg,
+	}, {
 		.compatible = "qcom,milos-qmp-ufs-phy",
 		.data = &milos_ufsphy_cfg,
 	}, {
-- 
2.34.1

