Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884EC3F4103
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167281; cv=none; b=oUuviaCUY9tRlq7vynG6W6VbzZgRbAZ51NDLSJJlmakFZ1EO00ZOEzEwKElm0BAw5N4XNh+cfpNVOn/qxLeXZ3HrOgTudGnzYDhUz1HNEgL1JCKiY6JhEnpnS0ZnwThhQlQxfiqY/EdDUVE2sWkHV3SwQBWLYZzZ57f6wXcN6hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167281; c=relaxed/simple;
	bh=eTYd8XwPxxSKwBuex4X58kDcIqp8iWeFNrSeq0/GvEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e5JqVLtjnWmVwPlC5gP5rXFbQYio/x9fHaPtKR9KhlGyETiGh/YWNcSXEtnnYf3VoKHYkNJZ5aCK/BPWGmrVdskATrnIFGMiPfGh9Ny/EuLp/0CxCOk9cIlbGNHz7mCjdT1OgMSqLY1P/auXlu12arViz3JYiR82w2/QxMCNTVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4BRkzLz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KKNOheQ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4BRkzLz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KKNOheQ9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlhsu4061124
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mW4g07X1dPH7YwtsE5Onn57eNE0T0Z3+nYnkujzokns=; b=D4BRkzLzPIFNLrEf
	FS9EZuXTYUTrqXHp1PsuJfrSrNOwdUIhre/06FLcLIS1OOTyggbPqvLLdM+rtjsf
	wXcmQZfnhvn/FgtNVm9EAMMg9k6VkpuBXHWeDfs5ch985Ja8dgrdpvUE4SrK3NBp
	lRkFcDHKRUq6bMx6vDVHpksuMpFc8ByZ1EB85SPRNqvftb18Y0h0QNgih9JW6lW7
	cEemjuNm3FgAmiK/m0negEAHrmjy5j+N/kr7S8oflRyl6xsHj+tWHfk+T56bBbWf
	maWth8Q/HTkwXyZxTRycGWEUR6QgPt9AiQeq7Lq5tXVvkZFSnr7BzhG4XNTgSZei
	if60vg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq1hjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:47:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc5faecf01so61977335ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 08:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785167277; x=1785772077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mW4g07X1dPH7YwtsE5Onn57eNE0T0Z3+nYnkujzokns=;
        b=KKNOheQ968pzV/fzL7eAiMriyLNI0vZql4UoH4KyhlguLfiRDJHFq3R0PoNxbecSzo
         TeGzzgeOkEM5Aw1818SaTVo/qlaMInB3+TK24fikK2Ee48SwRCJbt8JarAiHTMSdmjJy
         bLtJmPBb+OIFh775qV/M+bH0BDviWWPLCdNLeaIgmdleY0txwEKwnhTwaUNx3pBwDvOY
         RrL7+BQjnWyV7XtcyVeHYgLLQniOg4BD89E7d/5QGpN7zjmqcxfMjZJHinBlaKy2mvic
         R3jj2pWmtHsNImW0eK0hj+FiEzq/UBjWyEpWhJ3oal4jxImdhh7P2XL3dpIcnqGaoC74
         KmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167277; x=1785772077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mW4g07X1dPH7YwtsE5Onn57eNE0T0Z3+nYnkujzokns=;
        b=GDLxrEUeD8Eemz8TBDaRajsE0tZz8ZIpFaq8TcXJmREJSeGNGTaTM0wbxmI/Leisub
         n8StaziYa/7kZX972hofoAs8ZSYYFShJcVfiLHDwBTP33M1KQ3w2fihU7gekwfU8rtqY
         8MJsDTmhAVe447b/77zxk993/HgjQ/oCZUpBPNuHVwNB/W01TP+2rbI0Bubv/4RjUerT
         joSZBtKWjL9wfd+ORAgcxWVrIXB/bKK717iBpJC4vAIvy3cG8+Yi3Px57AZM1HWaE7cW
         RlbtpHnD3mxxQJaTyDng1a0NE6nXy/5R4DefZ3mm/XPsRMtV6HxNWyCTZ/EsY2IaAkNZ
         0lEg==
X-Gm-Message-State: AOJu0YyMEGpiXr7KRzbxjmlJi6V9GaMh+wb6YeOc+iWOpkxHX4IrXwbr
	tUmBZlKsyu0gUG3/JRdg2i6bsJKqYk9W1T81xFR9TIBWHL+KgDQbQUqoEkv7sNL3yb15l3HJUVH
	Dsw9clwMx78Sex90oE3emIjn3Z1OfsuPHvIcdvtt6X6HIIG0dBALLR9WNaoqhoZ7+lBq4
X-Gm-Gg: AR+sD10Ic5+LyLpTazFJMNw3VEfPmYYkNR3S+1wUEjDjyj7Vb+AOeJdanYPxuX68G1V
	Ho031IVNDCfMx2QELg3RWsW7TE3JH0IuR/GNFqsyHmbO9o2Q+48kTd6DKSvvVccqBU1WAFnYmac
	LW4hN0ScPcAW9hYc6T25nBVxCxXqAST9ekWZ3AmWY3P57hLke93EmwH3Ph0g1pInC4lP2lXJguV
	pFNL86SOlDVcnPGq6DT5VA+wMI9+GcisQdkSNESfIB+5iB4LsPXyAQ5efwkkh5YbzHqnId2zEGC
	Z19SfzywkTzjIsidyPkugZDeVjM1omUa1C8fQsq3qkMk+S2XxMByJLAupKUGwMc1Dzqh+Mo8nBS
	Rb3UWIyiBcaAPbQfQlIXjmrY0IIbVr+3WSyxwgeoxolIK+zyTbMb/e1FTHv9pBU1ZArjiuYilpU
	u38oyfG4CRgNddQWjqxTVexKD7P2BInPrhDkw=
X-Received: by 2002:a17:902:ce0b:b0:2c7:f2c6:89e0 with SMTP id d9443c01a7336-2d008937d84mr11416765ad.4.1785167276952;
        Mon, 27 Jul 2026 08:47:56 -0700 (PDT)
X-Received: by 2002:a17:902:ce0b:b0:2c7:f2c6:89e0 with SMTP id d9443c01a7336-2d008937d84mr11416555ad.4.1785167276565;
        Mon, 27 Jul 2026 08:47:56 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc4164ddsm32845204eec.9.2026.07.27.08.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:47:56 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 21:17:37 +0530
Subject: [PATCH v11 3/3] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-wdt_reset_reason-v11-3-eeedb22beefe@oss.qualcomm.com>
References: <20260727-wdt_reset_reason-v11-0-eeedb22beefe@oss.qualcomm.com>
In-Reply-To: <20260727-wdt_reset_reason-v11-0-eeedb22beefe@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfX8buSwjJV2++d
 mqV1BLwQwJNe1LLEFJbxwZf2+Wj0eXZ+U/z7A7MSNtbFzQlLdsc3gN919kfkF1360XsiAH6QLTi
 mhNfY+gTyDxDjdf94teOXnrcRF9r9Kw=
X-Proofpoint-ORIG-GUID: 7IQmNcK2hYOLHSu_775YAyML1bxDhgzU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfXxQ9lFnY+k29x
 6Mfn3e0YeotFh/hhVdMX3wK64xaO1TXM+fBQEyv0eLARwRTnut3PW/h6o6VxDpYj3lp3mypNH67
 V6ooUGbY9HNb3WZOj0Qmm10ZyMTHFmKjQYUd+jgtyGsdyXUxohceJfTswh+Mv/Mpjm2lyHeknJD
 EaL6wCmaU6gLjhtLVPUAAFC3znOLSHnRKYO+F3Lz2AKYBPLZ7ePHDtdHJ/ymNZ0Fv/24s4bV5qm
 U6JSfkvi/H5xD6gtWKIMMuqWWUOpeV1rAuRgosHKSGXYPeNrYUbNd1iZWnvC6WA9FOn6mqpNHql
 +lEyNoyrB78HG/AH9l3oxnCUpfRzRnmmajbZv7pzSScOt4BtzLcvemuXp9d0+MYKBPWTG3/H9h2
 MpZ1EQhUtnIuR6lKaFgs7M218yv8CTkdTugKDO2tY4E4fIV/LH2PPcOE/By7Ou4QPqvTWkmAMLI
 SikY1ss1MW0j81hWAfA==
X-Proofpoint-GUID: 7IQmNcK2hYOLHSu_775YAyML1bxDhgzU
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a677dae cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270148

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index ed61db0749f8..23f851e9241f 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -624,6 +624,7 @@ watchdog@f410000 {
 			reg = <0 0x0f410000 0 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
+			sram = <&restart_reason>;
 		};
 
 		qusb_phy_1: phy@71000 {
@@ -739,6 +740,10 @@ sram@8600000 {
 
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7b0 {
+				reg = <0x7b0 0x4>;
+			};
 		};
 
 		usb3: usb3@8af8800 {

-- 
2.34.1

