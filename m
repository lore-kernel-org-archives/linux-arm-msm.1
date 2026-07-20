Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0C23E63AD
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544672; cv=none; b=U7A2lN5ILIrjthiIbMB+A86DSEWUcLi5RW2I9Kma8L/XOC8y/QdcNnyEGdEDU4pe+44T+DrZCaR6H/JofyE4NroMvwbpC6s/huAQV+vwj7J4m0HD8hyCLFGLUYs2R1iLt95xKbJ3NEy+ueYnHHtt3EnAsIvdfNGuryMYcIO66CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544672; c=relaxed/simple;
	bh=W+J47DLyzKHe2QopLDHxTslHmL997c14k/yofWkF6Fo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o6uE+vrkC8kkEkV0zvjMpv7q1CU8eMusHTBBERbDsbhCW6R6ti07DI+5ojIyhyZHxCLMmQVc489CDBLNQ/sel+XrBPCS92+x+i8o59KsxR4+nSdHV3aAbKTdfwU+uS2fsbsHHgOAPHr17UPyv9s/0mnl2gml5E3pTI3ZojJyjD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQoB52MY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=erDZzWVN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQoB52MY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="erDZzWVN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9vqwd2189002
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=; b=TQoB52MYxPUPNtpB
	CjZsdSV7vUtw0GHJbQYdXNcheLXvDcneoAw8Yqx/j7Tx7hfJJFcN5Dak5V27e5r3
	+l9K5qtq7b7ax85iw5SOs1G7TxQwjIcUoYXCuw9l6klnqXpt/2k22IboQlXQWr/+
	gbagWrfpg45mLCedLOJccGqdKzkkQsSu2Bjwqebzep+xPduAebWXQsQJmkcLGACD
	W9QMaEbxCZ8LaM7nWRIayXluj07rQqe4hoN0tAtGTaGyrSqj7trHqoKYGZiFPz3F
	p1R2wLTpjFVfWTeR7jz+Pb31XWgiNRnQtJNO9wGAsOtwIhliU8zUM5vVh23WAra4
	UXoIEw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fgd04vtk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:50:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848544a8496so7594020b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784544653; x=1785149453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=;
        b=erDZzWVNIiMNxamrPpOi6mgrpM5nS2A8Ob+oErNFN0YPa3srmMcmPhcVs5vvTB+HO3
         51Dj/7d+bBVhdX3vzsx2dxBGBXK4ipoE7yoQ2ZudvwTA344greavnKSgn2wTBW4stP++
         4uejvrINRhb7Q21RoY1wUDbCqrNT0PWudIs50cG2oiYLdhfA2sLcNbHzWyJAacLWwj+D
         vf7ao6vaV7bA0QrhReGEMI5mZB6cPY9as8Y5fIInvvstOBbBp8cE0Si/zxn8b2ZZToqm
         OhlRMpYo71jI8ki3W4pmbzrf9UcQyACAGYg7j34Jjxg+S7eiP6/Gtl29aff0ghGSelrt
         2qhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544653; x=1785149453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=;
        b=WLH0fSnvdmufyBvgQqRgORdWyzU+HQYt4y2eScfHF1Sjd1ZjdyIgbd8AA6/UsJ9cwp
         Gh/momTfVOxPi/wPeh/ucCTJQkELsoUuatwDm450Exk04NZue4vLGDlPy7MwpTgDRjhP
         e+jy4eWWvYtrt/gpY5dshclfa9bGRmFuAnYtprPQ5rW6vukdBhP3MWjGgVWNeBi1ZzO6
         skEyhVH37T3EjCbdxVBbChyGHURrY1ROoRCkI/NEk6EFowNUo4t1K6hzwpMGPPM50DrT
         HJrjmXg310wWf8uS0m/bAWNyavjj8LMX+8vR/3wdhswY3BRpHLGw0N0LLTh6qpTViKoR
         g2rQ==
X-Gm-Message-State: AOJu0Yz04S949+ZiM8vBr4QuDPp+6igXwqdHtqtfn2YbrxoAfsRbC2VA
	Rqu9dKutauM3fzvQ3E/aQUED6zmBUqVZIurI0wbCy2WQWMAFCRMukq5lEaPcoQ+/76e/szSQ97c
	uB4Jcls0tzYIEnzvz0tx9zNComA88z+o1G8sAmQNw72m4c/zT4X4PNnuQEPyQbXqtlCUchUf+d5
	vc
X-Gm-Gg: AfdE7cnxOmB10eds8MaQ+2anNCHyZ0n9hQSTCfsfpkAXpg45XDUKzPv4Rz3e38YBs//
	/bh9RGKOQsWER+XB7qwiPMoJjqHHK8CYxygcuv0PDQFDDTL0pkmiiaboZQsC0OiYdSitc8iZkAA
	97Wbp7lJD1QKvbt5h7+FzfMpm0N/upGxL6HT3/O49vSMyUfWqafHG0LbTmlZM5koqWIZcqicbzj
	R7sVfGevPlvCO8POZRtGfYFl2zbx3VxdnJtCLosfOk5Z2is3JhZOfkmv8aN1wK04VJrQ8luqn0k
	Yy2oo0pbrICHx0QLwETDocymMyXChYacAEfsk6UoG1JUZqWjQ3hvbCim+5DpTe2e+6WDoH0I8vq
	mn2hUR61Y6uH9paQ=
X-Received: by 2002:a05:6a00:94c6:b0:848:6ef9:f5df with SMTP id d2e1a72fcca58-84c2954ed4dmr13883290b3a.64.1784544653344;
        Mon, 20 Jul 2026 03:50:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:94c6:b0:848:6ef9:f5df with SMTP id d2e1a72fcca58-84c2954ed4dmr13883269b3a.64.1784544652872;
        Mon, 20 Jul 2026 03:50:52 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb5159b11a5sm4343368a12.0.2026.07.20.03.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:50:52 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:19:22 +0530
Subject: [PATCH v7 06/10] arm64: dts: qcom: shikra: Enable CDSP, LPAICP and
 MPSS on EVK boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-shikra-dt-m1-v7-6-7dc99100c6dd@oss.qualcomm.com>
References: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
In-Reply-To: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784544606; l=2699;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=B2Dpn2axDYIMHLk1wigFR9Q2p/KX8LBdfSSHhm53znE=;
 b=hSEXl+yjQSMLpcZtTvfp44qFT5sxqRAQoE/kRQ6Mic+5t0jaEs6S2o9ncqL5KgISLfsyCWLvf
 8b8h11VqAXgCnkekf6hCNQmjCwpVTvjAA+eHbTmNMz/24/S1zHi/VXO
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=POs/P/qC c=1 sm=1 tr=0 ts=6a5dfd8e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=nu3v8zf0uA-Bo5sjUnsA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfX4/cCAPKTYvU0
 eidDuTHFysc+HANTFl38+D93ik/2Jen9M3Dt+bleWoCdvjp/Nzn9i005XQRhiCh8kX8gJ8DMNxE
 +zO6ZnoD4vkLCt1A/r8cyJ/mvhYbCFddEoYvsLvVZOx8Fip4Gyah2RFHY2/927mZXiquaRBNVMx
 4z9CL1Ha52hzuRE4CU7+SPEudo2h9lzf+60OJ5ODJHOM/A9IXGKnzQbiw1AIf6iU6TnK/cJGOfj
 r9z/s2I57RqmUylDbYoqitQ9MSiCtiZ8H8IAHnkbeBVX1/duK+46y2ZsmlKwS4bHI0qCDeJ8aln
 vmMo7WiiTp/iMEgSa9/v0CsthBvHSZaAaVxJ3+H7wHlaTe9X2ORAAWchz4z0MDjqicHHmQPEjjf
 P/PV4QUkogQlZRkRbx7GsuBBc2fs4UVeFFhB0m1DgfZcMHWQZw4+mUNEhl9lLNd3Lq+oGqBPtbQ
 05iclQMdGva7QVqjYKQ==
X-Proofpoint-ORIG-GUID: vNwxXnxbrARnG9KfOgZP9_E1W8fd7giM
X-Proofpoint-GUID: vNwxXnxbrARnG9KfOgZP9_E1W8fd7giM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfX0+VHfvVq06ch
 Evu8I45w1xGZEPn/4Eh3p+iw4l8XwOrMbnulqyXEemzgko8qOe9BHfJ7plX3ee7tVW3fp1g5527
 zWowAPGnaW6ePu3rhlxCpBw4k47cHJI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200120

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM, CQS and
IQS EVK board.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 19 +++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c..b112b21b1d79 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqm/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7ae..e62ba5aef71f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd759..727809430fd1 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm8150_l17>;
 	vqmmc-supply = <&pm8150_s4>;

-- 
2.34.1

