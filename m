Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD594611E5
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 13:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946220; cv=none; b=UILZRV51Dyiv6YId+ehcdiniBCzCLcSW+cGJyP12oGJa8zpSq4Xz3jdqV0ngwLwyVnrKsuGjCFMZCzOf38VwKkqx8RUg+CZxlnNRtyyFCTVZWy2xS60dchco5CJ99u5MEUcvMe6Pko7Plh4qgWLVa0And5FWsoJkqYfLzeMvmo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946220; c=relaxed/simple;
	bh=GdZV1LuiuON7wDYiD4V7gQ5eXzvmuO/PlhMtlKThPH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=avu+7cTtIUG+Uq9QVej0qv2NokIcq+NKBM11ZsdiBdLKOgOTmJVinoPnsHpcDmUbv6LlbD1XJecqSS+To5Xl17M5DMoBCW7+gUBnVVPT+n8yPbuU49FYK90WyM9QVJReOyUyNXTVRsCi5RjMzEaN9JY4JSONjBY7UNI7dzsMUZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PMr3a9R2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LNBWZq+L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PMr3a9R2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LNBWZq+L"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929niVB755026
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 13:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Obxc3C1Z/hYxlx7zqZoAvkxQarjrDFjcRi8kNm2R3LU=; b=PMr3a9R2/jC0I8Ne
	RkA4UERnEleF+snIjoIJu/Yfd/Cr2KRoiIFCWWDtNgo3tpk3rdWY+yrlZ8XfDin0
	bm+aT1vhRvTeFi635/ZGVa7LIWFcznYFj/0GX6iENVgi7t65kaptsksx2YqTy+q3
	M86mQ/FLBYco1OZISP6wS13MGW+vKA83WUqsqmNVKSZ+vBel15mpp7llqds5P5/o
	r9emLq+arSbX/SwKXRsqziK1d6oklAGElILTpBBYvGEFu8alhbLbh/kQMSZs/D/J
	3t8sXaY5JICo4whxpHAfsGbKgQ6uOOyqcFXvPDhARiBNzTO/ZL17SZRcZ64ipm1V
	1bwFYw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1t9ac4ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 13:03:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33baaba6371so10066331eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 06:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790946211; x=1791551011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Obxc3C1Z/hYxlx7zqZoAvkxQarjrDFjcRi8kNm2R3LU=;
        b=LNBWZq+La+oKvmwm16yzwsLHrYLkZxpxFmnWSLrRWFduQg8Nsmu27WyqNWNvBjkpX+
         r0Gtd/hSPpwe7ePbQ9mPcTOqp4uh5CwPrdUv6vOsoNTR0IWHfJ2TJm4wUW+cbP8DXX07
         K24WRFvNJqv4R8fjvaHQex9fo5YJk3pIkGh5b97NALOUhv6Eq/oCjx8lFkd1IrDl+2ts
         WggYLJtXOoLNcn++caHHvHFP2wFXi2vX4MDGJpQjNKXgyj8JQeqeJFOMv2Z+twjcBk+e
         QtPIaQpj89nk9bTGFXa3kyzp7eEYswqFqpkbTGLsnaI678JIOE5sJl+w/IggjZlSFiwD
         bghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946211; x=1791551011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Obxc3C1Z/hYxlx7zqZoAvkxQarjrDFjcRi8kNm2R3LU=;
        b=dv49pZNcUr/IaYP1vFwO7giN/6UMbOG819SmKinLYrqhiT8rqXYr/qxv05cDm0pq5d
         fZFfuMa9FH+T0i6cLhx+2/jsypI107w+jClnDokNfTjFTBZVPQVZWTm2GWIkxbmtazSs
         X9PShvQBPr1o3SznQNp6sV70BbLat54QRzw4SSbT4Eo7m818xFDLsLAcN3oxGYMhb6Sy
         UL1xgq/82vtNSbyjP3dK6OMPHdUEZp1uZKX/pdUtPdO9qepA2n1khwUf17r4WufDjOaS
         eevXwhMuphM2VZT1lvJv6q+5+U+Fwhu1gMWtiPU7KQvtbrDFzGkjjaFJ4SdBryUT0mii
         NC3w==
X-Forwarded-Encrypted: i=1; AKwUvByodJvzEhB7pI3LiZSTDVpjBxpbWFCs0wJDY65q/gxm433Vq00+vhD3DhhA+NS+IbiUr9fzzgBlowe28d5d@vger.kernel.org
X-Gm-Message-State: AFq9FYJU0Ac5+ZN32NQv/ueU7Mwm4ohQA9li67gjuXJh3AOxcbzytJ8u
	n/ZnRPH9cfPs0xGzlTKyNbmSPmSqa4HbUJqiFVR3XkVBW1XjEbYiTy1WqIo/sKEn7+aAEwy3QGb
	wGsnsM6smpJS2rXX7zw6xvmSDD9qXW2tfIJ94LPnlFNIG/WiRCfTUalDjBZtubIvogUVK
X-Gm-Gg: AYBFou013WmHPBNYT6Un8G8ZQVNIAOmqQbhVsxlpK41xmhlUO1h+tJObmZZP+kl/Fq0
	XUSEkfC87FzF0BXXFmLNmuZETGdyPY1Iy8hQB6/2H3gpbFjHOTKrBloAVTyj7xhkiRbdQHUPm+T
	ckfiyvVkqFX3oCNtE5k3mCvycP+yA5U5SJUuiDYdBU7TU9qn49obZ8KdYsk3KJXcsmeoLQidtZ1
	EnXMMPt+T705wPNnilTsJyqo/+JovMNvTEGiznF+u9kHXLOLDULhHoeVYoZuIEcs9hwu6LfYJrF
	F61wx4pEF+NFjmTHq4aXDPcuFWh6+b7Nr0RyN+WR9HT2n5LrnTppOtsEjGNErka/096XgeIWjca
	C0obx0HScXlcCdMcJsbFs6erjH/LawQd494M8ZEyJcUJQul7ZbP7xt0geI8+c5fmFrAZcZhweZa
	js2D1/bgrrl9RKDbMfCFc48If9ItWVu80nFQ==
X-Received: by 2002:a05:7301:3f0a:b0:34e:9147:b862 with SMTP id 5a478bee46e88-34f21994f0emr4212180eec.34.1790946211126;
        Fri, 02 Oct 2026 06:03:31 -0700 (PDT)
X-Received: by 2002:a05:7301:3f0a:b0:34e:9147:b862 with SMTP id 5a478bee46e88-34f21994f0emr4212140eec.34.1790946210483;
        Fri, 02 Oct 2026 06:03:30 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510752b575sm4217543eec.6.2026.10.02.06.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:03:29 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 18:33:06 +0530
Subject: [PATCH v2 5/5] arm64: dts: qcom: ipq5332: add support to get
 watchdog bootstatus from IMEM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-imem_restart_reason-v2-5-61703c6362e3@oss.qualcomm.com>
References: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
In-Reply-To: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX5Ux5wqvve2Iu
 3458qnGA4kLF1XNL7iQCtXnW2fGBGfKfy8vR6luUUpmSKxIQFsEt7cZs+RXGBYQkNvKpxNWkphY
 +hHA6DQKUp6O+A/1Ed4tR065fX2mSBk=
X-Authority-Analysis: v=2.4 cv=N++8hG9B c=1 sm=1 tr=0 ts=6abfaba4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: S9zwqRCLwzvKOv16HScXDUiKtzapaZuP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfXzHKpDHfQk18L
 Nn5pPsCIFCJ4nsSyfKAgiXFi2mZkqX8vOyMSosE1cpMuAuqEHa3SsSTN9XKqY6fbXDLz3HjyEMC
 WVEasXBzDmLzPzwBfMIEFYCizSxAbM/e24Wn6+UIrmwWjWITSaThrlt7HQXx+WeHMgcOa8iMTGv
 Q7EBEjUYWw5pajdgwxsEQkaF28Y2abMEQv1nL+hYEiVSxcxCgvWtO32a6O06OB+KvmJ1f+j7Zvy
 FiUxtiArzI2cG8yINeYpi51eESkK8L6FBSceSiaBPSXkPwoxJgi5zagEKmtreZhTcdhvJtVsuIU
 OAfJiAOhO41zLOeAw5TgLRomoH/hUnUEdnwwdhY4xDnOJdqz49DG/zdn97ufFHvhEnlhrqK3d68
 pK+RsP3eVITSFEcv8li1ohkPMzurJxo9p4mJxJksXfYLyusbUXQ7HuYl//Wdhe8heVB9S2lpwox
 yW5Wt5p3IuHERxpcePA==
X-Proofpoint-GUID: S9zwqRCLwzvKOv16HScXDUiKtzapaZuP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020051

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 3e10f45e182e..c1b083624696 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -496,8 +496,16 @@ qpic_nand: spi@79b0000 {
 		sram@8600000 {
 			compatible = "qcom,ipq5332-imem", "mmio-sram";
 			reg = <0x08600000 0x14000>;
+			ranges = <0 0x08600000 0x14000>;
 
 			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7a4 {
+				reg = <0x7a4 0x4>;
+			};
 		};
 
 		usb: usb@8af8800 {
@@ -585,6 +593,7 @@ watchdog: watchdog@b017000 {
 			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
 			timeout-sec = <30>;
+			sram = <&restart_reason>;
 		};
 
 		apcs_glb: mailbox@b111000 {

-- 
2.34.1

