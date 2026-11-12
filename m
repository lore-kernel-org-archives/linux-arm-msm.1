Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458202;
	b=iO4Zj1UQ4yTzviBnuo705VDtFblj20MalJiPUmGAQCsZYSxJreE5P07oXEfgkg1yjYr5
	 Bvw1hYy6Aeob6rO6JEl1y7g0uRoM9N2B/oZY3tDokymp4X66N1KAEjWU45YNPEPnmL2m/
	 i3NUPoAjqoZVnImZn8AoQaXJ93ve0mFcMt/xSwc+JxFfQ3oKS+OgBzm2Sj8FA7aLQ1uTb
	 Qh44S8t205M0Uq39DjYM0OEkPUTFIbUMXhepMDp6djI57dLrkclfA6oa9+sfBbhBwsQng
	 hvhhuhyaJYYsL1dPfGaRHe7DWzGqkpsYv0s9LOta/jyF+7LC2hxjEO64p+xTkXJMoTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458202;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JWCmOpxpplATYJ2MkPLVAT615DmxtQ01VpFIS4sOd2U=;
	b=vdh/G124vrbqFiswqNkpIAQKJp/kxGDH6RaJlWGlSrr9+F+EocUX9GwILeBWwydL3ysy
	 SQM1k3Mb2ErvxP0tCvMn88nxw/hoF04jBgrU3I7Tni+MN1St1DunbyzV2vlbSPz+XHp4v
	 IFq/Dq0Ns3Mdks7b3g0WhC9pmLdMBVp2eJPu8wXLt8CCvDggRasMoVjkk9FUgsi5av644
	 bTCI7kYIRalZayopqgcnSutrnodn/BNND1tpFavgVGB8xNuW9+eEZYp1zDRryoYgZh77v
	 Z1ZFxZlRLFBk+sGqy8/u0PbLqRvwF6vcmbNbCq15x3gNovjNQ1mBx3bTEt8gWN3Dp/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DxZWFwkb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f3kg+pUD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C073D606B7E7
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C073D606B7E7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DxZWFwkb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f3kg+pUD
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZVGA3607567
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JWCmOpxpplATYJ2MkPLVAT615DmxtQ01VpFIS4sOd2U=; b=DxZWFwkbWLNRO9aD
	rAOa4f68bwdvWURteuMnNRsKfT3NvXfz0fM9rdwmtnQ1UOoB6nvjJfQL9KxoVb+0
	ACuMN7joL3hsDFIvCn20OJ2UEfw5HqsxscPX6tOhIha6/P6g21Clidai9aLYqdka
	zDAOO2Hb6Wuh0SRKBkbf2+YDu8CqLUAfxe8CLvxm/xPFzWQrHW7v4xsGUY6SpQQG
	ZPH8v6kM4mcHPAOUKf3+Vw9J+QH6nSbS6CR4NMlwKt34Lp8Zy2gjMhuQnxerJ8yD
	D/kyqTzdSJOjDx7Mo+DV15OmF7Rbg4MQc+0+NwU1EQUGl7ZYarG5IhhdQ735VCtu
	jV6z5Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawne3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:36:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d1353fdcdso1327558eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 20:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458200; x=1795063000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JWCmOpxpplATYJ2MkPLVAT615DmxtQ01VpFIS4sOd2U=;
        b=f3kg+pUDW+TioK4kf4KqbdPTeQw90j61rtyH30q0avsh6oPfIB8xKuMkcrCZ0B29NF
         UFw+ooowj114nKEn76w9jluX3aNgDpyAaCkenZjBktnMPQ3KehygGWidN6eSg+Dr5YDI
         LqkOgfk0hPHzz+pzd5sGhDso1DJORCB23n9TmJLCpoQLhxzEtgYtlL98wWTeCRg5d3zf
         p0TVRQ/N7ZeJzy2nZY0JKD++r4dgktA32MkLXkYzcz/kV5X6GthgT8uratFBvEpdJHCD
         Voc9tiWTzu/PrM2GS3TCufRxI5Zfa9xvaFAgQYD8/t58ZfgR4ROV/RYP9CprJdKUya79
         3fmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458200; x=1795063000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JWCmOpxpplATYJ2MkPLVAT615DmxtQ01VpFIS4sOd2U=;
        b=pkCRYlwP2klZZYiFdtkvpK3WZnpjiekk7RnieAubhuG2dAlizCE5MpNn/IZJROuTm2
         rTN1PXbGyQO2k1fxbawd5BW5UZRWEIcxWxTZ87q6aoM0iSw3xLm7WgjsqZHAnlAn/skE
         EEKRxoRMgl3ak7zTfvSzHJYvXJ0Kn/UYi79ZZbCK0ZnnoAVINSPTE+HOYuKjDq37h+Jw
         ofF9E7ZTVDPeDKc1Nkxp1O0/j0bOtmJMrUptjBBMmfH/BNoYwc4NUvhHsyxxSl/GzAS0
         OoGJWHFDuve5CuLnQmmvdx6MPBKP/FUI1Q5f604LOACVO1g58N2p0P8qyr0Vkh2DhLIs
         HaUA==
X-Gm-Message-State: APuU4Z/SASJtCRoKoVjTr7RJ6SzZs9ve8DaWov9FXCaBhU8L5woLDBvJ
	KyKpdWjXWo519op0uvsQjwPFmstrnUdM6JhZvLr1WvxjdvZSEsQxXpr3ZmI+VsIX/mMmfMDI2bK
	8YFYYylGDVq+v+pr1jOP9/0aJ00+4rlMwThtTDAup90lQFvoKCmQSGblUnRJE1zHJSi1z
X-Gm-Gg: AYBFou2MfHC1Du0hgQ6sxlv+TLBCqVOGeNmBBF9XJ8Ky1aBfTTauzBgCeOiTaDiA1oT
	zzS0kgOOpViBqwTydrgUJboQtuVKAoax/s8e7Nkui+JW6UNf+BtWo6hWtVkygBvBUq63KeyfxR2
	n9IQVnALm9XkWMEQH2FqEVwRXY0CSWj2K+zPgHSv2r+fMPrJdfvS2qjuxTY9jmoDPHy3/801RId
	PRxeVvisADFL2OPQXVGnJs/lxSERCWGlkeDismd2XpP5ZCMe4C2u3MpHDCRmC5MWT1bSczylqSv
	Eu3SXbFRA1AElRYCAIEYjqKpwxeVdvbF/wfh8am9sC+tQfP729yz5/I32MVjrt2+9nERxkzL4Aa
	yKBGFp+6RE5cQGl+zBpHEdWM/99RJq8FZqUQQKcPiDqW2Lbxq3R9CGpfqbqp1nIBZPBH1uLERnk
	V8LJUzRjgfzzFyGNmPy29Y5nEhDK/ZnM7qa73CBOufvZ6DEDt8/fVhdfE+l/mcpP7E81piPbMaZ
	/XWpc4=
X-Received: by 2002:a05:7300:d211:b0:372:eab:d700 with SMTP id 5a478bee46e88-376831886c3mr4269076eec.1.1794458200234;
        Wed, 11 Nov 2026 20:36:40 -0800 (PST)
X-Received: by 2002:a05:7300:d211:b0:372:eab:d700 with SMTP id 5a478bee46e88-376831886c3mr4269049eec.1.1794458199626;
        Wed, 11 Nov 2026 20:36:39 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:36:38 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:22 +0530
Subject: [PATCH v9 03/11] arm64: dts: qcom: ipq5210: Introduce RDP504 NAND
 variant DT file
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
Message-Id: <20261112-08-dts-v9-3-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX+IsceXb44nv7
 LrQ4D/3lwumV1aDCKa8ssTi1dDaqruC049a6I3K2RQsIMKqMkPNqqGx0O0giwJJi9jkqeIFU5M+
 +s1zeJ7m5ir1bRnRuiokp9tCyQnUaNU=
X-Proofpoint-ORIG-GUID: JBvxuvlw7wSedtNbTdIAznXvxiyiDa6h
X-Proofpoint-GUID: JBvxuvlw7wSedtNbTdIAznXvxiyiDa6h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfXwwlaGPDO6GKy
 K8XUbwAoi9P09lIh6q8INP0hKqWNWR0pzT+HN4qHSKaryAQ3qP5MnCizxetDnmsXhz87YK1YsLy
 +d1C333sHb86bVV47MUhL76B//K+5UHUuyJ0n3dvkr/VWGbLO7RYliLddo5ObFiAo+IA9KC1SwH
 iORomPoYkZi2JyTw8hzx18+Ezy/TnaHtjUfpHBSWnOgHKgBSCMV1ThiDS083Mk4hycgelgd8aEy
 RNWX6zDCs/5Dy2bzTuBsypankQYSSziK5hU7QcOKYseMV1Yi5xM3RnCjlJnoDlESVqXxP3XN1n6
 wxJKizHQ69bnaW0QRl8xhdLjpLLahfW+yZCs9Mt6Rpoovk0JHH0xMV0cPugvFW4Cx+pm3Wi6bUc
 iXFS7Ab3aElc65bBje7AQqSv92EbL69gwKS8qSKPLXWQqV10EvfYEhNIsQg5LYLS6q17UfDJz7W
 Sp/GJDQAksxcWFILjqA==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af54259 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vH_i_heqKRWij10IjioA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120018

Add a DT file for the RDP504 NAND variant and include it in the Makefile.
Enable QPIC NAND for the variant, and enable quad mode for it.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                   |  2 +-
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi |  2 ++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts    | 17 +++++++++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8329c06b60a3..fcc94cbb3233 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -41,7 +41,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-som-db5830.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hawi-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb ipq5210-rdp504-nand.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 6fb8666ffbfd..17daf277edbf 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -87,6 +87,8 @@ flash@0 {
 		nand-ecc-engine = <&qpic_nand>;
 		nand-ecc-strength = <4>;
 		nand-ecc-step-size = <512>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
new file mode 100644
index 000000000000..1145fcf0a302
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
@@ -0,0 +1,17 @@
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
+};

-- 
2.34.1

