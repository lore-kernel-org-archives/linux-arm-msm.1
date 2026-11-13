Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548067;
	b=C1be6F7HmUDN1o9ozmmyILWa8vK0Id+yVxxB9vMf2+wlxZ7SmUMhQ6p81ZCn/uOOVGKc
	 qnJ4FYsQ/nQ2ZJMiKNc7hnqbxOjhlGBwtbdQuLro7uuGwp1UPKRUJouVrA2/7aJgIKWEk
	 yKI4NzqA4wNpgfnbuGeo2ANKql2kuWrMpr7rQLLNwYu2ANd8MvXYsqEPXIFdxZ15TdPXw
	 hoYgAN994LlxBgdq/K96ES76kjL9Vej8/Kj38qFoUuT7hnMGOBURNtxsceFUXbEoH0ojR
	 hZy6RleLZS7Diy5cZtc3wLvrlH0SKXAq7hIGYLPZ2NCThwzXFXYS/cbDRlZRBo2KDbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548067;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4BLrYl5h4yMVFXBJ+rSB6i8v9tN+ezJoVhrSaE+41aI=;
	b=zk106tDT5TVrsHwJEU33qjc8ZHOthd1bsHrCyR0CLfntXQQPi+aCwxBMDEezB82AmG4s
	 vemzHncZZlXICVIDzx4ekSUV47P/e9MJXdUIgZ+T2SXJBqqyCq4gCpp6TjrHh9uectYMd
	 mOZat6Pbm1JWGLJPNV1GeZzXvGsgGrpsNfpqz9eJ3MQ63Qk5Eg2KOx2mHgAqtiQ1w+gg4
	 dooxtBwhQw4ImgkHakTarL9XNLfLhjGfQ7yDZgiSlUHQ0gnaFmeHvNYVY1Op+dByD1Yx3
	 ZeajOakxiLJHDEzUxqEXedurHXDe8agR57FrxdleIxBt4fJH6QarIMkCXT66Q4xdKyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kuqi/G3N";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VkCpS6+g;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B3D606B282
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2B3D606B282
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kuqi/G3N;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VkCpS6+g
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57AkY3615970
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4BLrYl5h4yMVFXBJ+rSB6i8v9tN+ezJoVhrSaE+41aI=; b=kuqi/G3Nvv+JxC2i
	TQcv752qreQ5+hjhHq5NAl4upMPDCb4T0eCLk2SI0rN2UKi2yFM3mNe4OcUi7Cv1
	hAyj0/ttaQxurAvaii+8e3VL+0SwR01Ayxw+07inhuV81HFJlS3/5nKgkHxQIHjG
	Y9clAcvk+pl3Q/e2HdUIPtEwpcqwe8nESL2ceuDmHFbhKzO5NdgtEB0UrUN3hhjJ
	I4k4rIP5GbMevVb/YIfiAm/yG0eurQZrYpKEViIiM2JdHXNKRGtZXvWqogc4cb8s
	216v6UHZz2CeKzGnkoJv7gR3wGnjhrZ1BWEVT5x1V1D8ALApbgFV85hiSub4INPj
	bRf1lw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0aja6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:25 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-46509ab0149so619806fac.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 21:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548065; x=1795152865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4BLrYl5h4yMVFXBJ+rSB6i8v9tN+ezJoVhrSaE+41aI=;
        b=VkCpS6+gzBeLqKdhE5eyx/ObjVQojLMpZ/0uUIWC9VjnPmmhi/MLQMCneZ7SqmaMFu
         F6atVK7nXyQHPLX2lOPHFzwsiSiQxNVePkwxQDZqbs63xpG6d3GJ5vp5i+as7RZMaOu/
         ccFvX1qSXWYCwC12ao+j63XWPZCp3HB4FiHiNzNWqYoQkJHkSSHpMM6e/CgdOrgiVtFy
         Mvz8N/NBDL1qp/0Knm00AdzvzHk+Zh2ShlgkTXsHvu8G0mEMFfhGTMpRA0AkJsZsshRA
         cFHMP8HIqLDwWwVbC4JbxALWM4D+2yv7Qxy8ko3wvm+2i3dmJLMrsWESlNbDCsgZGhGf
         0+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548065; x=1795152865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4BLrYl5h4yMVFXBJ+rSB6i8v9tN+ezJoVhrSaE+41aI=;
        b=ttrXtDF5SgQY9wyyZsgW67KWbWQ+zc7jQCljfxcMG68e5DnbMClGBFzMX0IwYGN08Z
         UGrZFdNPuyMm3wdkS3iGE4Xzm+YdFD17Wpo0ukhGgqY2/OUlKUpQK4W3mZvOPtyI3UYk
         JF3BDOi28c8yQ2Bsln1y61NnWGs9EmBC98+q8OmtFJq/NnTJ4k19PcKJEN62uN4aV3kX
         1gRFbrcec+XOq/2BM/pZlWjgdczyVzxrAvzLZnbVegj4LnCQ53pLRbpYHL6UthAmY84k
         KK1SQbl19ZpWejHLrL9NSwkMpe9CYguCPHkh4JiCNEtz4Rr89VRv2eRCJXW/Gti2rIZs
         IcHQ==
X-Forwarded-Encrypted: i=1; AL+hErENGweu0P2P02cMjsgQSamyHgynhjIkGXQ8XAWv2kQHDP/njCgzsATl/szlnqAcCQKzrj4VSoWMjtRO6+7R@vger.kernel.org
X-Gm-Message-State: APuU4Z8/ahQREiV93GSwrj4Nm1KJsZBWuCoRLXYLzrY/b3ex+k5xwnWC
	z4l81EA+bVAWLaB02CJZSQCEDhKvn2G8UxLSe0E5lhKpeHXV4Qd+4ffDzcGvgdtgyTYreAZ7R0c
	suiP9TRDKydRWpEDMIdaBjEw61SQFc1tE6WTqUEL769mHV/nj7hWoCfBWai5C5Nwm6XQ1
X-Gm-Gg: AYBFou3NCQmlyud5wgiWMYLf89GkAKMZtvRX4IfWwMoV23Y6LALvHAFrUw5meRAC0oc
	gtvlg2bcgP0Jl8ebcYw8cSMwvR+VeO62lUYo1YcNnNM8qQmpOgyQ4P2lZoEbzwykAsNsHRmhZtx
	KeWFZ8RWbPTWhkb+cmbaCBhI4rBZnsEH5442myTCUUXudKjAwC8kr1yQSehMM/uj1JAg1h8pFzF
	CPnkOKTFZojnLZYmVhEXubolYW/PxErYqixmQQmPeg79FNB+rGjkOXJc3V3aP6f1upNEbmORgzc
	orpXwyzRl0SQYIjuGroVvIJSI1Ay4lS5CHK8WgKw/59nvqIV9zOnItQsK0WE6MHN/bj1s1dDSP0
	XlnqT3/kdTP90MMRhxTB3LmTpJjyKMu39H7td1hx5PeBo/I6F6Mf0e+M7Djb4ArU2sMbxiyOemK
	K9iQCSto+HR0lW9mIa5rAmmlHnqBQ+9FDil6eu6joqctirTnL9VMEc0AKSpkcw
X-Received: by 2002:a05:6871:c914:b0:490:f2cf:2977 with SMTP id 586e51a60fabf-4afdf77c4ffmr1844574fac.45.1794548065050;
        Thu, 12 Nov 2026 21:34:25 -0800 (PST)
X-Received: by 2002:a05:6871:c914:b0:490:f2cf:2977 with SMTP id 586e51a60fabf-4afdf77c4ffmr1844561fac.45.1794548064639;
        Thu, 12 Nov 2026 21:34:24 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:24 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:47 -0800
Subject: [PATCH v25 15/15] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
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
Message-Id: <20261112-kaanapali-camss-v25-15-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX2mX05yuHJcxq
 SW3wWs+0XTTf1Y+e1dBTzkS7LsABof3dLNynQwkm2x+W18Bc1xbdMj/PycqMWo/9wltrWBJvSSj
 oXowo+AV3lFFW5SkAIOgDfz1cesaHis=
X-Proofpoint-GUID: resonpu-kJ-c6vrkpdfwSW5oitFmSAr_
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af6a161 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=azXR8Rw6a_W_3m1MFLIA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX4jUgwePkoPsd
 dEmHG7Sd2WGSwiu3kvIA8SFsQ7X0tsAeb7UANryLo+m6g5H7ZDGUPcEI0kEWpJruDaH3RFEbGLS
 RkEqM7HqOSSHviyocaNumRh/gXZ9tkQSoz82hD9NgyC4cv/orlFrie0qGCr+h9JHkBasa62iXgG
 ufCpyGzkzSZaRRXvPVTEtD2Hq5eMS66fHiuRfqn8yoEYRaU5HQBnCa+yjUursJ1yVDBIllmtWFd
 dUPF0BKVHrZnPIJXjtmKveadoxqx25YmdNq8a6aIRbdOCJf0ajjQmTN+BwApgUk51L80xTDcQu5
 mu9HEAgS/+KRHj4y2UrcWQsk5ovDVsClWZKW8OZJqctDrLDyUvBSyTfUDBnESk/H/lCf+jVceYE
 St3UjsSmdFn1R7oJmmo98QyiV49E6W4N0JvN92dWBkyAI7JqEVVod05M7Y7ruueQaPZSkueE5qq
 sCQ7EofU4nffsTXb/TA==
X-Proofpoint-ORIG-GUID: resonpu-kJ-c6vrkpdfwSW5oitFmSAr_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.

The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
lane mode on a rework camera module.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |  7 ++
 3 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8329c06b60a3..2e1a4cfa2505 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -57,6 +57,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp-camera-s5kjn5.dtbo
+
+kaanapali-mtp-camera-s5kjn5-dtbs	:= kaanapali-mtp.dtb kaanapali-mtp-camera-s5kjn5.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp-camera-s5kjn5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kalambo-crd.dtb
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
new file mode 100644
index 000000000000..d0e39855e0e6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy2_in_port {
+	camss_csiphy2_inep: endpoint {
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&csiphy2_out_ep>;
+	};
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@10 {
+		compatible = "samsung,s5kjn5";
+		reg = <0x10>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_mclk2_default &cam_reset2_default>;
+
+		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		vddio-supply = <&vreg_l4n_1p8>;
+		vddd-supply = <&vreg_l1m_1p0>;
+		vdda-supply = <&vreg_l4m_2p2>;
+		vddio1p2-supply = <&vreg_l2n_1p2>;
+		afvdd-supply = <&vreg_l7m_2p8>;
+
+		port {
+			s5kjn5_out_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <1248000000>;
+				remote-endpoint = <&csiphy2_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy2 {
+	vdda-0p9-supply = <&vreg_l3d_0p8>;
+	vdda-1p2-supply = <&vreg_l1d_1p2>;
+
+	status = "okay";
+};
+
+&csiphy2_in_port {
+	csiphy2_in_ep: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&s5kjn5_out_ep>;
+	};
+};
+
+&csiphy2_out_port {
+	csiphy2_out_ep: endpoint {
+		remote-endpoint = <&camss_csiphy2_inep>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 9eb02fd09dab..c70cd39bcb75 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -1243,6 +1243,13 @@ &tlmm {
 			       <119 2>, /* SoCCP */
 			       <144 4>; /* CXM UART */
 
+	cam_reset2_default: cam-reset2-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	wlan_en: wlan-en-state {
 		pins = "gpio16";
 		function = "gpio";

-- 
2.34.1

