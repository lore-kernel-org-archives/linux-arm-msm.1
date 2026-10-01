Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0F752CCC5
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 15:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867500; cv=none; b=lRUvA0td5HPUJLjDPt43p7VFmIQ4X9gL+N1zA74MOfSyBSWzcEG544u20Z5hO0AKRjHq/aLwajV/nvYQlOhkmKRs2MVNOnpDRfEilwJmkj6rzqAccCe9UcthU0Q+O0fxFs7KOed1meGy6xg7p+UOiiCZWSGayT2HBiDmZXTxcRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867500; c=relaxed/simple;
	bh=b7PwNKrUTbBjFvlvUJeBMdFvTRE/6fFMDE4OvnZCeS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O7MTtaVS8XL0newZ04HqWoEwThsdaybjgWblRXvcLspSkQ8aDutrdaqlcEp939XlkVBqcL2HPMlJfYrYRLoMLp4QoAaXP6rOTAYZEe9zrlaBKSulmYNiSnUYYffmJYK39wXAOWQyczEELfcDdmSGiywaRf+8p0GIp8AsBBPBRYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EAyFMGBa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZE05votW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EAyFMGBa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZE05votW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Dk6EJ1857009
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 15:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqhXceR7YvU9pc3ZKzgyu+8pOAFFFFcPulo//ooWwzs=; b=EAyFMGBaFIfiPCu+
	ujTO6LWltDPtlanMGPe38X8U0ZuKO/40DlMXYgL3TgFEd9KxEvEA/HTwAG7EuL6s
	+7g09kIzr3yVvoKfhXWTfXWHAao1hqc79o2dOOLX98Mxewnfd6PwcDhJROkDwOVo
	SA/OGoFT2M8RJb6NId8AjaPxKqJFCXrt2InvcbabF0gxYx1n0PHzONBhScFcWXX+
	Ug9aiJUpX7gu+5MuysOt0L6zd22r6UJrdAlduqF66wKI5qkxWmUy0KFLxdjwv+mL
	oCUvLWlqqqw66Qva0xn5m2cA5Jlb0jKhL9b3WhRDH8Rsj5ct4LpyC8hTLwuz6wDJ
	r35M5Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wcvw9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 15:11:36 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-143826c4a13so6004910c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 08:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867496; x=1791472296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqhXceR7YvU9pc3ZKzgyu+8pOAFFFFcPulo//ooWwzs=;
        b=ZE05votWpUodr14i4wOm4ifnXS2/4Dl43gkvCcr5NEr4W/NGMBzs/wH3BEF8hOsqrB
         p3g40y0SXvG2siBoYgWiRnJwqsh4QrDVGkaSmN91oeA9/6lFHjWgewlQ/U+wJbpJnAl/
         cwMqhU0Pe21QFwz3fNJJ3eg4TryV4EZcKF/H7VAgyM0v7nJG52EZ0vpeUV6txbwlMPCR
         C1GdiCcRt32eDPjgxxIZ3iCEGSm4kgIDuMrVmwzs6nXMSpkCvAAxtFoXejdMV9mABNPm
         KFUQTViJ7Wz4nvGgZOK5/4K+aRRBOUgMrJwkSrI35jDA7PsAXGDEFZNvK/RFlsFoy4bv
         ugOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867496; x=1791472296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqhXceR7YvU9pc3ZKzgyu+8pOAFFFFcPulo//ooWwzs=;
        b=fY7xE6MwiCxRdfJA7ZLN+cl3TeP/T6m/xDo5i9ChwqpxAKl0iM7vtMOOO1WeKQJLQS
         x3gMEaPDdjGAQwcF/CMjPXqDx0p4MMwiU561PWC6nu42T9EE4uIw1qK+4uAsw37QViOp
         KZrFh6K+MO+OcKpXvp2JX9nMB0hNuc8MrveDx2z8QiG1QsnNJEITOewCe5Nh4MHQEbr4
         a1MDRoVdtC7wU5Ky312nHVVUC2Wxd9lnSW+FcEKTX6vla1Hse+9yK1g8sKx1x67W8vGH
         wFQA3ysonhh5AQB/MbQ5fptA39ovM82TYdp9HCirx4cds+ApmQk+oiglxs6De1gw6s49
         Y0PA==
X-Forwarded-Encrypted: i=1; AKwUvBy+u+zB4FoymQjNlWpCPaoTiPCchPRDfr13+bU40fBitFUCNVFrVqoJVqO9NmP367U0PVyIaIT21kLNd92H@vger.kernel.org
X-Gm-Message-State: AFuF++kbD05ZdKYAur0CY0S1oVcf2OJVaCQ5mTOcUcDm9m8cH2IN0ZiN
	Zk8SBN6qYeryZp26KxYK9/FnW+fbZwGgB07x9RGFHztZK328Tan2ovRHU3Ve44GWaQVHOy6Q+Re
	Indz27sInvS+1XjMpm6uMBcNyE/w1WO+Wpx0Slu62layoYp+NBPOtd1J37e0zIiE1EOMk
X-Gm-Gg: AYBFou1Mh00fYyt0hCFSrAdtsQX/MuqBbiQmdKXzcMv502qjiFejyH5IRij8id896Eg
	3AKHBl3LQ5R4S7UtPs587e+xDtuVIVWohq+SyxamyV/ILu+HvIIkmyrrCyd3zsJgqSTdVdS2QnU
	bsQqtaXv9Se5ra6LTfcJMB+YwYuHlG1hYd0nEkXb1SbyBWGsZfBaltp94IPcdPqwLpVlIH4JMli
	bfloHlH3mYTOu+PLcJOQGZn9x2frqK0HCW2oj8IFzYIJ/PfJKnO1Nr/XtBiqAukNyWz/yeHJmhf
	430YOKsSSw1rK4L6ox2itcq5bGouEcQk8SIDi5hzI70f760m1T3quOaM/ZVRlWtw9Ymo4WRf2mv
	iwBvvvUhVwQFjl0GiC07T9CT5/NlQ1Ltk2g+ZqT2YgwYnCVaGDKVD+B7zb9VQnaQw91F0y+x8fl
	s8r8o5olyuOiH1bVzQXwukNsw0KrUTPnF3p4po+2Kv3prr
X-Received: by 2002:a05:7022:5f14:b0:144:c123:4036 with SMTP id a92af1059eb24-14d33491276mr4970647c88.35.1790867495244;
        Thu, 01 Oct 2026 08:11:35 -0700 (PDT)
X-Received: by 2002:a05:7022:5f14:b0:144:c123:4036 with SMTP id a92af1059eb24-14d33491276mr4970602c88.35.1790867494617;
        Thu, 01 Oct 2026 08:11:34 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f265d307fsm56159c88.3.2026.10.01.08.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:11:33 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:41:12 +0530
Subject: [PATCH 2/5] arm64: dts: qcom: ipq9574: add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-imem_restart_reason-v1-2-79f516906010@oss.qualcomm.com>
References: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
In-Reply-To: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfXxq/M9CW98oKv
 AB+2m2L97WUI7B5sKGyanXSRFZyFCxouzn3ooe6KNEFgieV4HzOnWYwHRC53BJrc/VRvSMNPpnP
 RBuSQZSTGlesLbudPNOsOGDWrNP2t4vqw0/qeaYar28Sh/FvWVem2z7K6DxKZ4brH4R0AX1z/A1
 CIgZU9T6xPaLzGMkg+xzy2C6xI3IjphdaWUbwxflwkqr7E6LsfLOm2/U3vC16PbahhXWNcA/mKd
 q7umYdvmAjjfxzbxR4K3dDOhuhVx8jipxlUAGVNLWUI3bdMhZElFz/pEXGsHl8a3hZ+WwbaGFpt
 q3ZJ2W8FEe4HNaqytVIb4xo58BQnugI7RwZfGVeEG/AAu4LUxPFrUiwDnCpnWdYRUs5lsB53uF8
 JrB0twzX+u91eRIDf1VxDVhk/YPq0QSNEf84NoVQioOe7Pa0hOURS30P72J08Ui5ztgwH0XuQie
 mkkDCTRyuAOCt7QHb/A==
X-Proofpoint-GUID: dCgFFJc3RWu5BSC8Y1Pp5mFFEVY-dvEV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX3N3C6Jw8RENZ
 ifdLxsdzH54bs/HWDeZpwwfxDUYcTqBjKf7KX48IBz+MmsG1Bmk2Pn/G4MW0r6YL7qekyq3ksO7
 ZcVX5PKgFFjYuJT+SYzydfLeOx7nAuc=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abe7828 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1EpwE-knX81bZyav7xYA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: dCgFFJc3RWu5BSC8Y1Pp5mFFEVY-dvEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010060

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 32KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 771a59585645..f7cc6f274ca9 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -757,6 +757,13 @@ usb_0_qmpphy: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq9574-imem", "mmio-sram";
+			reg = <0x08600000 0x8000>;
+
+			no-memory-wc;
+		};
+
 		usb3: usb@8af8800 {
 			compatible = "qcom,ipq9574-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1

