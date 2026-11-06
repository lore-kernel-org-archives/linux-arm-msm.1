Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956883;
	b=MdSVDn8Ty+gXcYuGD2VKX/sWkg0algSCD+LwC9lQLVcGhptnJ/A1QISh5F1JneTLWL13
	 u4T+CDitAiMYLDxgaxq7ATA7yKDycl9VtV443QQq8rrSKg+usW0yfx8rjJFOV+Wb6PD4A
	 GK5n+5Z67tBf6MVZw8e8NNFEYZ0kXdQyF/QCPw3zjxI8TJgchw/aWk3yRxFnKH1SWvO8g
	 3rpci23o7bFwkwRPdqMavVfhfr/IzyLJSlKcAEzL6cs5FonDMOtwLSDMSmTqWbtRlRmRq
	 sBtDhBloJDAIwaisT0tahWcSmwsDvG4SdNaaCxOsXOoxvsJwwq2QWZVPJw7+/GNVEwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956883;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0neYuYn6liO33W8kTLukzzDPvYtIX3nBweNL+dyUNRY=;
	b=j+otZm0VIwabCtn8zBHqv5ZttGU42qgmyvLHmUJ33lJacrwZCvuByRYewXhb8FI+A270
	 t2VymP5Vrpl7k6QZNqhJiDBYaES05x/cGwkbgvxo4D3KcxphtekxUg9IAQIWHeGX+UIGz
	 oWBwZQPd2hJd+7syorQYQ9qJAvxzdqxLMgeLIbW68vAn1zu1wPd2Sh9+rw3dF3UKud71j
	 /bM7b1yC1UOXwyu/Xvda8t7ZA7DDzaHuMnK0ZSXTGEqRqZvwvNny5QVQzn3uP7y28CFQg
	 GzMtvqzNFoZG5ZToSPc7qO4LD9vuOkKmUuMXT7pNGRcwBbOJ56dntPmQnExBX9bFBOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SIDxxuy1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="FTui1p/1";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370FF606A337
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 09:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 370FF606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SIDxxuy1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FTui1p/1
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RJhg1679455
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 09:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0neYuYn6liO33W8kTLukzzDPvYtIX3nBweNL+dyUNRY=; b=SIDxxuy13FZYbzji
	+YxenOAaOCb7YN6xsnaHpvksuhiEYlbP88QmtmfLZ3a9vqHWSL8NOXclYyMHIOb4
	ozd+t+qOLiF1eRS1sja9jrX8tDxYF3CV6KhoMUzE4wju2L9uLQ8uR2H6flvBGLme
	pkvAm4Gb9Q71lPbp6GeQz7CtA+kiGfOa5AkzfAKuZOsc0HVAiSMMv0SAu5AYcwfe
	qsowclgi0yUGAR0SYmGmvx/wZ91pA/kcMduthRqzYkbzHKb271wN6hgIjASFJkkk
	Ouuezl8g+VbVNWTE1VxXrYOlHLzjaRZx8CSpN0wwCYb6QXIbdng6U+gaGooi52lb
	7fWvoA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pca2p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 09:21:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso940000eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 01:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956882; x=1794561682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0neYuYn6liO33W8kTLukzzDPvYtIX3nBweNL+dyUNRY=;
        b=FTui1p/1ii+lPFo/xxC6Uvg3T87+ci6XXZ+bCDjBCkPdPxW2pCEVuUNky9fYNRAK35
         gT71zFHRKEp6SzHBmGsPqOCzQiTpg8hneaG9vxNZh6b4cd9io9N+W4ozJw4j4dexyE04
         mczKLcMgLOdR4pY/Ve1gujYA10HNs5Z6/hZxgonjYFbY5z0VNxcvjAcsD9avEu8ePUAx
         SLijbg/wLpUf+zLKZBDIq4+i2e5XVFFWiIsrpq9IAZS/AvgenFNdH61mrloh67ozlhhk
         iJydBKRnQ61F3cxWcw1R2qM3Z/QJiV8OmHwtxTw5Ah09uUICnAo7tQi2mmzzgQm90wTC
         Z+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956882; x=1794561682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0neYuYn6liO33W8kTLukzzDPvYtIX3nBweNL+dyUNRY=;
        b=hw5CcNTKOLSMryaTAw92pZaSnZ1ecJ4l6aBq4F3wHh9LDZeOjhyF03FT0lgLa6bjFj
         zOlNqDQfgOdFkmoXFnm6k9W4EOjj2QfHHHELFy42k5W5AugXrmOqjhtzotA8l7gskIRj
         h7ybx7VcW+cK6a/ZwgFWJ24NaOV3Blue76APlVEV02Re4+6luaui56WnBBM8RKj02v+1
         XeBegJdwERUb3hnPYbt/0Rg/2qLDos34daoUoL+0XVPNx+r0BEJKYs8VKXNpTnIkPLSw
         aHHCk8JZinbyBWD5bEps80jZX1FbIBkNMzzsiQtxQoISK0+IY/u8tFOyFYwcwh4O4G/f
         3d1g==
X-Gm-Message-State: APuU4Z+mF4TdA6AxtrKSJ3Eb0mpicaK77WqXy6HeO8ecsqAaiPq9tsei
	Piotb5V1bX+sgLGG+nyzhA1bc9PuxuwUY1WbZWaIX6A9+hjR+CmIhS9dTJny/5qAdtmf7L19P+L
	IOmI+Qr8sQkXUBRPtTSYnqQzVUfCi49t39zUzn8iKn/TVhMknxcpMccH+j9Byn6TV/5IuK/y7Xq
	o5
X-Gm-Gg: AYBFou0Fp2aD+wFL/WxeiZDAka25w2mdlxLmUOPwMGmG0dR6FTlw8V+2ujGsjsj/MMj
	aXOqvuujPiv3X1xGITcFiQ65jxrlsmvPp++QoIQTOiWlcNw9SiLu2dEj0Hqc4i9yx2fDs8fFrXU
	CqPczr1OzmV7GtJP8+rhCs8HN3MONULsJhwJhOWCS6CO/3F8u2YDF/RSIt/MkboeBlxeyjX3gnG
	XG3aJbCvUQMuV6k2e1EH+0WpHj7gIWI4SxNmDJLUvOMVTeP3ve+PXfz1An/Dfa1opUOC9WhlMac
	EPbge4ltAUQYDaNj84Xg0V5AlwW0rkuSdfM+pMDqQpUuQGmEXLVYlbzPwfLJ+/mNl9ojBGIal8y
	0KQ2F/4o5IBRa/tJq2kYVh5oxQ7ZkSzCLS1rAfun/F9gdhurE+HjGT63XxtlX6HJ9pG54aKR/fC
	iOZAq+ftzyMVBwFC4QkZQ5LZcvkNvkN2tucr0g3ohD3cpFJP0y3lDkuweuRkpSAxUiB0f+GcVp3
	HYg8w==
X-Received: by 2002:a05:7301:182b:b0:36a:5126:a8aa with SMTP id 5a478bee46e88-36f7641e9aemr2477558eec.27.1793956881582;
        Fri, 06 Nov 2026 01:21:21 -0800 (PST)
X-Received: by 2002:a05:7301:182b:b0:36a:5126:a8aa with SMTP id 5a478bee46e88-36f7641e9aemr2477518eec.27.1793956880987;
        Fri, 06 Nov 2026 01:21:20 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:20 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:52 +0530
Subject: [PATCH v8 03/11] arm64: dts: qcom: ipq5210: Introduce RDP504 NAND
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
Message-Id: <20261106-08-dts-v8-3-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: CKhZzooDvFvtfC0D30U4OfKByxoiKeQ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX8zeF9sILElt3
 NHBI/tHXnLuo2Fz5lLFwe9aMFXuvRWSmxfmvaXHJUpDcTjsjE8hPDNKTbpdecg7zUD1Wy5oP4oJ
 JjwMWT8BDxVqYetZDh0v/gNMY0lr43bdIJ8TB41L3uXCvqsr18FEKvo/TY1u/vCukiMWOp1kl/2
 C1ZSDL/c/QiTjbE7mq8UEVL2Xe4PIzDHhFTjtWHeBMkUo/JtWWSzvNJ9bSBgA0fVFUL+A5crrQ6
 9lz9/P6/HPfWoDtr+c6CcVbhe3J13cZjdHkGJmaLRlBXyxr/ONfFIn9ViSE2Ce0XPjF+GzLz/o0
 4tB8BmtK1STq6JFPCPkkhFXeJSsTqiCvHpDNa7X2tPOVpyacp/RLpElwsTnIL/cV8+VCGQo5o8D
 7j6ADSEvZ+jMvzXvYkIwe91nGv4dF+ADkO9TTtV5xsYO75jwb6HFUalbJMSeQIIbxIxOn+6Qsss
 NgglVsZCYolonEV534A==
X-Proofpoint-GUID: CKhZzooDvFvtfC0D30U4OfKByxoiKeQ_
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aed9c12 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vH_i_heqKRWij10IjioA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX1o0Og9r7FC1E
 3H9Ojj7jpHy9EP/7DI+rv2I1q3T3jo2mivcZyhhDCTRWDgNpwDXSrosexGmwEqmBXc6dkTS38Fz
 SAEb5fOXFQWwNpvkjzSaEyVDBDqzySY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Add a DT file for the RDP504 NAND variant and include it in the Makefile.
Enable QPIC NAND for the variant, and enable quad mode for it.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                   |  2 +-
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi |  2 ++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts    | 17 +++++++++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)

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
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 36702bac331c..cb0adca9a151 100644
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

