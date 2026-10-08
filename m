Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C9E47ACEF
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 09:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450893; cv=none; b=TQI05GoBaxaAzEAMcGx9u6OAdpXSqzZHst+TPd05sqk+PdP8ipo0XHyInOxd4BgmEQe8ftV34nzAETI53mE39Btuj1EtXGMnw2Ufx39+m0bZHfgdCqBGfzpEVH7CLHZUfmBUM2SbdgidWAqXWXrKOKi7tb2ltnJrn/6QXSU5fdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450893; c=relaxed/simple;
	bh=vrYb2t0m+G63nNvSenUd/NzCQrfLca1rtXAnnP4ag/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kcr3Bzfo9I/MlIyiUi0DYTLGASCvsTtFLnfTl2U5meoN8JRYe+kZFIjii81NcpxV5gzUJA1lvr8NsxOJB0HqqxUyVtAOTfxULrVJ6gEzgPm+cODtvu//ZZLLxKe6BnDX7Clzug1Gr3/fi9iAQgUV008AHvqbVYgEVb8VCZK7MlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHJNbYT3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNtDE8ko; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHJNbYT3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNtDE8ko"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KOMM2167101
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 09:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EFgeEVc36/9HsHj+IBx2w1oRupD1Wphz8jrH0qJ3tYA=; b=jHJNbYT3yiWWhmng
	IsDbt3FTdqE6YYZkMTkJWFa6TS/w5Qf4ivk7E24m9DYxIxf6ytnh0vhh9Hu6/NkO
	igPUaX8SejDaEHVTqs/GWgCHIA7GeHQQGm/ER8RUx9RpwMscc2NbTZc1evGZJUii
	CzQ216wbl66qruyPTzfXQFNoFMNkc4S8ggrWhyRmVFfdPbJ18nabb0JfL04a3WYk
	rlxDcaTicTmpuQQSmPqFY9tyEwfY6g6SY2TqFFgXgkzsENuRI0zLsdny8d5i2ScD
	MrJE2Skt0x7TDFIfphqVvHzctn2l0XlTVbnPRFmxxgK7Nx4I6ekCWciMPN7sWOCi
	PAoPbw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2t81q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 09:14:45 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-154e9d2d94fso10408090c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 02:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450885; x=1792055685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EFgeEVc36/9HsHj+IBx2w1oRupD1Wphz8jrH0qJ3tYA=;
        b=DNtDE8ko6JfzzzKtUQOMsv2YjAVwZ5I2/jYNvGJgqS3OllAjY+i7v5iK3XO37MkXeg
         DqL+6cPXKs4+PEuAT1H+AklDk7IAOVO/S3HTM2K0RR0F7+yIIaNys2Ns7I0z9QXgiMyR
         xOLX3TZwTerrwWpucf+72Bq1SI4DBR2Xx1TGXtmQeYEKMbtvTUR9YT7xt8hyKj4+sj0l
         YtzvfWmgfr18QaVwu4MkMIYyapLaiahCZjASniSBMR4oLi0Xz5+Kl9Sw3AjHZIIygD3c
         WnuHnHo2wlzBKd7GGs0195Qh/etp418Cwk9MTqzCGyQ5uwgTkYgGW1mirCcKHhuU6kGU
         tqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450885; x=1792055685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EFgeEVc36/9HsHj+IBx2w1oRupD1Wphz8jrH0qJ3tYA=;
        b=2PhRBZl2x4ob4GDbQVty90MAJS2fVaqG1DQcNnfAOqVeavov2WKyY5cmrv7sH9vt76
         hnRBHcN4SmFge3zADjkxZdu7b+G1bqisvUoVIPTJlLcl37Ib8iRDK1au5Yzi8M9flHgL
         1K/OojIeZQ1gv6Ch12HxreTAXJecd5Z6bk7PQUJrM/nkaTq8NlmtYJSSdtAosWKjednu
         nYn8bZLGkJa6xoxzHTLeqla2mAbsgtI6p3gUBV/iJw+DLlHhnRhzcpjmVaI1Y88sv4mT
         FALZ9YOcxxSHwCHln2iIk57aOiFOz02vqxB5zfO3B2RC5GhTBQdzbDQijsah3AXJ2G7D
         kh8Q==
X-Gm-Message-State: AFuF++lbigsCoMKiVY6N0nDW9ChH1L+KepgZ+7qvFCTZYObMVulcfmAr
	qcGbSwcoM8t4QWlx1CnW2kYPz5/uoa/IEdjmBn5MpfQQWz9dMbj3IH95vaIMkWjWJKOqY0G56Fy
	K5V5rtqk9mQ1xCT+c5js+WleBa9iTxXGln01boYq0FyO9u2pEIVe5BcjDhTkIcs7uPZPV
X-Gm-Gg: AYBFou0W0bgat05bu9l8tTXWMOwX6tf8T8JM8CY22tW94Y3Ar7nsv1YgAexLZjjezeD
	9Wl6WbJtWAvN0v+jamgy3i1SXRZTnR4gOU93fTFnBedC5JanLKA8j9lUrUxA28b0YSRh5nXaZLL
	ohpG14cRbDJpJvOW9KcgEbh8yo1cEuM1ZiJGqDH56f5Fd612yvOaMqf29lXxnG6Eaj7HmXGGrcN
	jPRZ5keQJrQDvmmqg4DCkvYmg0BCMHGpBP46cgll+f43YtqO9J129qhqKR13kbhM/vj+a2WP+pG
	I++I3aXYZ0Zc4xJqtOeZ0riHUl/2VYH2UKn6WNhksZl6iVEHiskKp21JkCaiZa5mqnZYJvPXxWc
	M+JIVl0aikjBUjZ19bH36q1+dYQhZCofIcfMqLpVSZU8k/j6w0gsSNK0vNFDzWJbWzHubfD68B2
	sbjZzJG3jv4bIPCgjOlw7H+sSgFnau
X-Received: by 2002:a05:7022:3a81:b0:158:d432:c816 with SMTP id a92af1059eb24-16208fb3d7bmr6773245c88.34.1791450884651;
        Thu, 08 Oct 2026 02:14:44 -0700 (PDT)
X-Received: by 2002:a05:7022:3a81:b0:158:d432:c816 with SMTP id a92af1059eb24-16208fb3d7bmr6773209c88.34.1791450884045;
        Thu, 08 Oct 2026 02:14:44 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:14:43 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:23 +0530
Subject: [PATCH v6 03/11] arm64: dts: qcom: ipq5210: Introduce RDP504 NAND
 variant DT file
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-3-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac75f05 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=r5J3puGfL9QIZnCGJ14A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: O1yeaeohiraOifuadD2juvBPYlSnGZa-
X-Proofpoint-ORIG-GUID: O1yeaeohiraOifuadD2juvBPYlSnGZa-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfXyF0xgPUgx7Z8
 ZlTbWx2ITPhoqBR+8byFmH+dwbd8AkGNtsabqpReWOo72ig+FQR3Q2RSJRIVjsf1o1zswiyimLJ
 G3f1QK4mHFIluvhhEj+ZsVylwfW9vsU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX2VV5ZXOkpclx
 NcOqQ45XKDdgIzlxbXg9h9sv3ZFTXNrbpH+1N2ErfcMWzZrc0GTa4IRXGyF3W4l1X07Zd5hZyjt
 MF++d23vjw2O0gOJaDOQK2GcV/RmTl115ytit4qi5CtPPsheAAKL+BT4fnHzChmaGYqYK4EETq8
 K2UC25xCwaHEOVYfCIMJ9xUZlkmokNA8GUUuiPSZrZ2nOEXOWXNKMK+kw7ICxSalHRnrdtoXdUJ
 e/I2fOfYfwWxxTEqJCYCNxgsEZROiAbF99L0Q6gNp6eZXz4g8K6nnpa9l6cUfTeZr70LaHRvMOX
 pebwyafsmgaqYC8FU0Oa4vJIiX3Lm46EW2VRsHGmfZ+uQYd6Pni0tACIH7fv72rqEAm4z8qy04w
 quv0XCFuWUvw8Tg0fdX3yy6qhXwUK9MyaMurB2kNwCiKg1K5rKhNsSx7SJDFuZzSu+nPDiukXQr
 ts0j4fpi/rsrjXfASVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Add DT file for the NAND variant and include it in the Makefile.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                |  2 +-
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts | 29 ++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..94ab6355176f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -32,7 +32,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hawi-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb ipq5210-rdp504-nand.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
new file mode 100644
index 000000000000..8b7106cbd7c6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq5210-rdp504-common.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504 (NAND)";
+	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
+};
+
+&qpic_nand {
+	status = "okay";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		nand-ecc-engine = <&qpic_nand>;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+	};
+};

-- 
2.34.1

