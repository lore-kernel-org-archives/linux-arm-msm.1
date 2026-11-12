Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458229;
	b=ua0SacOx8d1o3+wp8kIIE1Cd3HGczxLVMK57rR7yNVpfrsBLiEC1U30AT2rw2CbZeYsY
	 yRUIniHVha3M3BT24jwq3I1zGyMn/zjvMAvYF31FVh0lw8WOxqAARaosRkq8lKhmDy8Ig
	 rDUvqhxycWAy7GTdUOWHoiCMk2DCmCfQoGJMjmVyLrbTLvilquNTTymHk29o32BahTj9x
	 qvJo8Z0zZneAZgAUqjj3vESHx3XdQB/JbxhD+yQPH+5bn6GzP4Zqdko6vW7gJx769d7U6
	 QbIGGJhQ1zGL2cSxOXwDPbjozG+GkVDnmOy9wianej5EcepJebiXQZDdbzz5rttdPOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458229;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xc+dUcV2Z0iUpYUcIR0MrpJPt3cjmI+/DiKVoWU5iI4=;
	b=w/honNKHFjydKhwsUE/wF029VNa7RiIIgg61BeyLROt7V0qXYSGJy6llTOqWvZAgE/Ed
	 mGX6KPMUHESmg+1vZBfMrCPmLaKSTqgO8FuZPEVmRK0GIfuyqC4ZiWpQqjQK9Yxa0pUDg
	 s5XekM1VbueqBLH7d/N82+1V545db8AGqiluTnghcUX//1YAYwkUUEh9BZ86DiG3WNZRx
	 yOpwnAva/3TvTKQoPJ/VmZX5mWUreBApbd2wN85YrUl1/y6/HHO8so3lLCr2awtW+VhO3
	 1lN4eLVJH8mnx7RVQLZmIfC23lgFYz2/jDs7qPzL7ngF8tyQvTX+Oj5q8k+qaXDytcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JiUW5nH6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=awj2mZix;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D06B606A886
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D06B606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JiUW5nH6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=awj2mZix
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZscC4092872
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xc+dUcV2Z0iUpYUcIR0MrpJPt3cjmI+/DiKVoWU5iI4=; b=JiUW5nH6QF8Bg72j
	Y0mJjxcl0hRiZ9UCxgcsak2E7A6vE1Vd36XXK7I5uRY1HRlqb+IuVYj25sFwep/i
	VGa/8sjZdtMj7o17B29n2zMtWQOoQdJg430JAzXBvQ9FWfriidyIvplmZP2Aw4DE
	QUWLV3zWmK63E6IOODTnLswl6MQHIMg2O5EVTlUlFiZPosGP4SOPRZE5lvWW0wE3
	7duMRfDi6JPVnSl/xM7uTsTAbY5yuMrzBX3FHPQf8J7r3qqp8vIcvLq5xyQWk3s8
	Urb2HJ98Mb1SMMSh3EOUmVya2bY1hgao6yxSWWgybMAr24YzaxNxWC/otjh9AOAV
	gewm2g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8h6rg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:37:08 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3724667bc16so327342eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 20:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458228; x=1795063028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xc+dUcV2Z0iUpYUcIR0MrpJPt3cjmI+/DiKVoWU5iI4=;
        b=awj2mZix+clYa14MQ62RYXc9pjuX6vADvRsDKNXtO4ikdUffjiw7zwY+220oyw+YMW
         3GtqrzkFD9rr0WpKx9y/E/aWX7Rw6GCTZR0Vr+pCO1zIfiY+zNxwrE71BukfRZQU5bmn
         PqMVnlQY+KdYV3jnpUn7Z09AueRzR9+mHrICFWPz+jiImfJdIlOO4jffiLrER6tU++2I
         vCWK16lLAWx462e/fpFaqm+nFag0ZCmsMTa7EM3KwcoljGbEslGVb2zbueKF56VSNb1a
         rc2pfEyLz+OGNPizHf56ga1DTceWL3Z7hU5YPmgXUoYr+/N6G9DzkAuy5NoNdc0O6FkL
         mohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458228; x=1795063028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xc+dUcV2Z0iUpYUcIR0MrpJPt3cjmI+/DiKVoWU5iI4=;
        b=vwtnHbGKGH37T2ocC3NWrdfLLvHtjvpHawQhhuGnxPbfuTDEsgJq5F+2V3n0YKqRMH
         lPKoop14972NvMDhd8BqaeRxfppKUkL9dG2jVZXojOYL83ZivoWH5swCW9v1jc7WKMc0
         K7PbAT5lzh7pFdq9bRUwApybgN/FdEzdv5wDQjzL/S2AuDGmmuPZ1LCOwFswRP7nqeTs
         5YyBf5V/P6Iqgkm9pe3XuahKfVpT6MqLKsceA6XAMsmwhQWuvWHeRNF6MpMm9h1qBcMD
         VPPrlnN7/9rJXC82+t4cFevMR5WK2Z7/68/SUrdZyb/0m7husAyK531U407iwJd/hL2+
         79jg==
X-Gm-Message-State: APuU4Z83YaOcSnj0bWMoxhAMZW6AjaEkYdJb6YilcCHYHq4c0KytrsIC
	1HpMEQkxrP6cQaxCpoiowZsFOZ/AE9NNPem/HeH9F/a1wDbchKy3oPVr0YyjrEaZuZUUclOfKXZ
	OM9ubJnriPWFXS8lYXJpIKUhmptEXL0H9TzQkbv7UVdw45xH9qQRspGscinLQ4aEfcRNM
X-Gm-Gg: AYBFou3wt5yYVqaMlD+zcs6GOnfsK4foUVeMpg/XoelW3ER7d4WO6sCrLFPRxeOQzfi
	8WBJtlQalzVUxVbmBpbvRTbCAve2lzCw+otL/bCgErnuTmqRR3097qnEVbQqjgcqayAQSl5UGQB
	BsDlrKXkQawTsaTI3FyT4HL1tPL/2Y1Yegga+1t8GfV3w/VMOMGLccH7ObP7YyIeT0ve9i4CEaI
	Ya21tFQR0M8uDdXWkocn3/AHeDSh60uJqoTpjOHumezvWccNqh+ut0Gh6tnhaK0VZ5XQGp5nN7m
	pkvZ//1ffzml4Al2VfAWMeg8BIXFtKQY1rWJuHG29tPfVm34dH+sJFihCy+4uGy/u1DNFnV2A5H
	p/U8n3WUYd+Zn3nYkvd1W/QV4sTMz6JsiA25ILax8MZ4Bq89pR5U8Fxzxs5dbgF+ZK04uXHmA88
	1wkYkMlA3ZRrkL4BSFSBiJmFQI1gOoPvkHwBCBF7hDlG/rPJ9HOPV/L8JPfcnWzsEyEM7AZ17Vv
	6s011I=
X-Received: by 2002:a05:7300:c00b:10b0:36a:647b:2d7a with SMTP id 5a478bee46e88-377db7c8ac3mr1612424eec.0.1794458228063;
        Wed, 11 Nov 2026 20:37:08 -0800 (PST)
X-Received: by 2002:a05:7300:c00b:10b0:36a:647b:2d7a with SMTP id 5a478bee46e88-377db7c8ac3mr1612403eec.0.1794458227377;
        Wed, 11 Nov 2026 20:37:07 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:37:07 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:29 +0530
Subject: [PATCH v9 10/11] arm64: dts: qcom: ipq5210: Add SPI node
 definitions
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
Message-Id: <20261112-08-dts-v9-10-c34de4f78fbb@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX+CmVR60LIZmT
 Suq+5VVsDmtYyjy0whF9lDXb0Bt4fYIZe5+RFzoi6Hxky/jQ5R5MFGgTXsCkPTuVtMzFfQbVbAK
 5T91rgNDa5oRXYdos5ZLSnqqqXKPYfU=
X-Proofpoint-GUID: PrNZUwLfgCart0bAXzAMcEpwfOmIm58p
X-Proofpoint-ORIG-GUID: PrNZUwLfgCart0bAXzAMcEpwfOmIm58p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX3J9G6d215cUO
 ALHaLT/XxcdrA/BYxGElZ1KB4DS8dMtwT3f3J2WAgSJWDZSCmaxY2aNzrF5rrEfv/q28zo3cIiD
 QVWLUs3fWcL8wg4LT9hPbGQ6Qg+NoYuUn1YyMSTH3he8fwxVaokKGEYcDytQlpYGxQQwJpypSf4
 v/bW0XqFFqhVUjmynGIwg7U026WnScSVmLCK3YzGVWh6WoTJwm5WyWKnAjE+O2jahnURBngn8RW
 x4vPaX/T80fwhPgqpvgzMgvLUYed2gWlGYi0DfxWd5LQHD3gIQMaAe7tBjFaxHvpTlcdA8O931z
 XwR5s8oTd/xWkUjk+xWd1cXLXKDSf3BYyC5Lz1yVx5T60bbebKV2zbzkFppZ9P1DPZRNLXps0Qi
 hiLlP+CrvuiI+yYycVzLmFrmLwSkumH46mhRAkNEWoPMxsuakhvjm1a2Z1RsYJILWaXoL0LYkdW
 AOE7iMAso3fdV1MG09Q==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af54274 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ll64UZJxbc1SGzsXvscA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120018

Add SPI node definition for the QUP SPI blocks present in IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 36f874e57b42..052c2f3df94d 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -181,6 +181,14 @@ opp-32000000 {
 		};
 	};
 
+	spi_opp_table_50mhz: opp-table-spi50mhz {
+		compatible = "operating-points-v2";
+
+		opp-50000000 {
+			opp-hz = /bits/ 64 <50000000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
@@ -459,6 +467,18 @@ qupv3: geniqup@1ac0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 
+			spi0: spi@1a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01a80000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&spi_opp_table_50mhz>;
+				status = "disabled";
+			};
+
 			uart1: serial@1a84000 {
 				compatible = "qcom,geni-debug-uart";
 				reg = <0x0 0x01a84000 0x0 0x4000>;
@@ -495,6 +515,18 @@ i2c1: i2c@1a8c000 {
 				status = "disabled";
 			};
 
+			spi1: spi@1a90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01a90000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE4_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&spi_opp_table_50mhz>;
+				status = "disabled";
+			};
+
 			i2c2: i2c@1a94000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x01a94000 0x0 0x4000>;

-- 
2.34.1

