Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5EF427F80
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784211949; cv=none; b=E55PAJ5QxhxLbnw1ydZQanT8SdOoJmRMIjEzhFhArjAjrdu2+0uOW/A9+3DwS2nU3XxeD1GkUJgTAGbRAAiiRAR1mPOmybRIhmIXQMFPTNuXCMmBflSIkbIZu1SjTJEH0nlMKVV/pk6yF182jd2CmdHtQpdWCTkJdUJzOz4CGZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784211949; c=relaxed/simple;
	bh=dqCuGdsyw8g4jpt1artn37Y6DLupqcaVz/lxcnZIprc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eMmc0YtBNoh4gTVt8ubs64wCbORxsPsI+LU63tuRT0MTiH/f27etuBsMSmj7QCJfx+SVgYqIaCtWBvRPkmmE+ANmYfxh0QjM/kEJaEXo34htr1KcrNX+IAkXL1PkxQn3o8BGpNOBtLz7yXyk4TNgF8c6pzkv+dpXWcMjc3TWxnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmEPOmqC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UdX4u0Jm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmEPOmqC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UdX4u0Jm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDKAea2722852
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Scx3avMH2Cs
	RoUcay9QQhUSVJ3CS/swBNzKFnFgQ864=; b=fmEPOmqC3hAX/h7nu0akDuWari9
	9TmtfbOyLpmQfK9dANzfMFrObn+KS3CFngyFZqb/LYUYnYoee6AkPTdGXiNt8Nwd
	KtAYBmmNXB3ba4ww+KJUmn9EP6+xXpuYEe6zugIvwwEjjIS7bkuIkH+tiBOi1qGM
	ybglIAqPT3pWYzFYS78Z/1tlha61yWW6zeUHlDEIadg5B/gti3vZxXEKlvyEXcnp
	2T7ceUnLIp7yDePISQRh6j6fqy0J16k6AfGn5Vl0pxONfipKfLfIclPXOQPOOIKl
	ucnf0hM1IcFLc4fUa0cob+PE+J5k5jSIWJPH5Lu3bc3fPTPzAfs1ro0+DYQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feehvcatv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:25:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1e6f602cso62759671cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 07:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784211941; x=1784816741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Scx3avMH2CsRoUcay9QQhUSVJ3CS/swBNzKFnFgQ864=;
        b=UdX4u0JmlEliEs9Oq3OxC4lMSmZY/7WxGFrTFlhnikEjgi6LKpcyCguQk8tLf5ikZD
         Imv+WBz+NKxzN0rfib0EbT0i7LZmNSHgjvJvka4ti9eED3b7TpKadOzZ+qzw9rg7fKAt
         pJ0X0Ojx08vnlm/kS405Qs6iCmEA4hzcIJPwwb/1j/3psPD0UI/EFx2NyZNF9pvINsFR
         0S8yenfHtUyMGKFafj7eOhrzOCfsdvAoNx4DiKu4YC2Q9lFQO+Qf1ZVRqhUZG+dW1DAE
         EmKC0PWA2V2dVvqQNYj7V6iR3B7ZdwgzwjX4sV6jYxHFZ4YBcomTHWfgJ5QQr+yMxmx0
         P8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784211941; x=1784816741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Scx3avMH2CsRoUcay9QQhUSVJ3CS/swBNzKFnFgQ864=;
        b=bh4ECSjUMwquJnPW+OMGmqMiqYdfrk3XgA0hN56nWT6G1V5/A6xVvMZgSvhEYFHwFY
         +jGDh2+H9efyJ2dCr2VGa8BCKkC2/b7KdJUmMAY2fT3VMDLaD8RC6HT39LiAErDr6tJ1
         fW2yDiRKCFe8Nx7G5WtW3Tv62Vf9ZmnOe+IYLYk2SMu1g6v9eFWdS3pYCeApzgDnjUrW
         Yzd3kmAbSYdisLQ6z0RDKFGV8q7ucoqOH/CQnRLueINUCvczPplBn7SkJJnbcNzsoGwS
         WldVdG4619BgvYWuUBWq/YyV7rkPs+AoZAVI/EbzEGWYuXrMTubrl8VeTxoNoYBTbNT/
         IDIQ==
X-Gm-Message-State: AOJu0YxdyzWkMsIWZwfPyPBoZq4Suei/QbuH4+4AMWnOz6lRjDVOvbHJ
	P6TVOkabXcJjQYoKyaSWiQ6FFLsmtWEEu4jcz1tgCfTaAagFCN6tql2cxpuFhQXB9RSMOT40ozB
	Kl0U+DHGfRTHpVodlaAAg15TahewqbpQayhUNUQ7uoLkm4bGmj7w5L/vfz51N6qwsNoK7EaXR/F
	wZ
X-Gm-Gg: AfdE7cmaDrHCqJ+WReJiSqLP9nfnfWbh+Mq1ZXbRkDayaBO+hEW7DBhr9ftW47/GSov
	1wK+7n/Spm+NVflHdjSpQhML3Xhwbq4lCMAfewn1OxeSxXMYpcxAnrLnAF/SzaC6GNGEHYAQGCV
	HiaeJkZDr0SnzHn582sOW6tQtV4Tl68l4c4/S/9xMB1Drb6vxltHaj0cqKE9e6dcf/AZqSE0uen
	KGBYD5Jas1Lrz9Kw9cS8AnXGRIsjISZtUTyRCLoFse8Hbyu0Xf4IehkE3ovG+YZrirD3XfVIR0i
	ffFeSVFSY4ef1E060yd3f+690pifxsxQY83Mb/ZXEBt5G4DUbVFT4NsDY4Xgm5QGlymgkyr726S
	CQ5ld0V9qf+DwF84zvXKzgJpoZIrXDjqjN90=
X-Received: by 2002:ac8:5e46:0:b0:51c:11ba:c51e with SMTP id d75a77b69052e-51cbf276df7mr225817381cf.56.1784211935669;
        Thu, 16 Jul 2026 07:25:35 -0700 (PDT)
X-Received: by 2002:ac8:5e46:0:b0:51c:11ba:c51e with SMTP id d75a77b69052e-51cbf276df7mr225816391cf.56.1784211934807;
        Thu, 16 Jul 2026 07:25:34 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541eb0343sm62091975e9.10.2026.07.16.07.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:25:33 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V4 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay
Date: Thu, 16 Jul 2026 19:54:45 +0530
Message-Id: <20260716142445.2767955-4-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260716142445.2767955-1-monish.chunara@oss.qualcomm.com>
References: <20260716142445.2767955-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZpDd7d7G c=1 sm=1 tr=0 ts=6a58e9ea cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=FLRs2unuW723IZJmkEMA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfX91ucl62RynWz
 b89HXyrdVBZirF/K1vVzcY0jMWI4IqnL3hHKVp6APDuJ4MfqwO1usGk+y8F3w8SDHv137sWvcsX
 eYbOisJ6jVWn0QFxQ9FhPR9vGVVBOX41S709w2iZcIA4LnIHi6MRqdUlYVNe0Afm8NHMq2Updej
 JA7wWGfv7AmWUclNsEca3wx6f6/z+MV3WqnJyV/uesW+zlpzs/PDIskkrq1zjS4UeLumDbztFiD
 tgRL73TufKWw8fdyWhwShPfH1lNtkSsyXn6Y8af2AWJInwyAuE97l6Dw2jKHqXIHdnalkZgFdIm
 sU/jMmmEhAclEVK+zgkJL6oZzE2XFyoaycdjZPaX9ckfk0iiB038/1SXor86f8JwO1/LZkcJNs3
 hoX1axga232fhxf/rBK/4YN8Jw3h0K5mFiUfY3haPOSrXlPgVoIeLzwMwKJm/e1WUfexXFuMokd
 kV/NDNuQG+LMFutkipg==
X-Proofpoint-GUID: n4ama2p4cd5w3YbCbRL9J8q1hwNl7i6Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfX8V6IvmSLwB97
 DlqTcoi3a0CExKZ2hW/y/lKg84QIN4w2P8Wc7rYtWJ6jB/5/PeG0I2TDTdqIzzfRy7hj+Wh+6Io
 hNeF8YGqHLdndzIJN7/DcFgawOG/lqg=
X-Proofpoint-ORIG-GUID: n4ama2p4cd5w3YbCbRL9J8q1hwNl7i6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160148

Enable the SDHCI controller for eMMC functionality on the Monaco EVK
using a device tree overlay.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  3 +++
 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso | 27 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 20e5a0fe7dbe..f175a33bc042 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -74,6 +74,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
 monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
 
+monaco-evk-emmc-dtbs := monaco-evk.dtb monaco-evk-emmc.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-emmc.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
new file mode 100644
index 000000000000..6454efc03ddb
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l8a>;
+	vqmmc-supply = <&vreg_s2s>;
+
+	supports-cqe;
+
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+
+	pinctrl-names = "default", "sleep";
+
+	non-removable;
+
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
-- 
2.34.1

