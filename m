Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463556;
	b=sFMXViWZope+zf/QoaWYQx1g2YqsTHb1augkcMJ5t0aKZaxmP7cKLrwIC1dT9Uxl4xNq
	 Ht1GFXDYcpwQu7/DiMX5h4CtA5C6CFzTvlu2IJKX1X2XVdQQqzEwSZdeoIxE61khu2rGZ
	 keSdO2VEWJal7hv8CzL3WhpR3yfzcvm1zR91bEIidT/RLdWgRGCcLuitxPiZYSCKXMfIO
	 ZM1eMKcbDmldnZdYpNAU4Ey72SWAbFls6YW1ntOnWkaixd/hkdrwtBlEF9G0qyzHYRlS+
	 pVgFcI3YfQG+x2iqXgn3fNlYC8LgHvmR6kjHRpszAszxzKw3eFGfXYm/U20Iw/c7kcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463556;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vrzuixifcgj4ieImFYZkDs5YxdebevQpN1By2OneWM0=;
	b=tCKZ8P7s0x1zV98GXWiQIP01PaRUZ0/SEngNCqHqFxB2FQGNHLaqk1PBFgkZZ8GCyqUR
	 aj2eKAVLtgN0HGv7CiT5vLGlBIRloa7wnD38L+Qy0FrNDGFtmeMbwn/3WKYuK0nlBR5RB
	 ZbexFraiHKR8sFNuWnVXURSWhPKqpSLhO/ivZ7HCboMuTkabb6y7JRPIYgYZYqiVPekK1
	 aGs4Olz8F0m4IPY6aOwYXEbUIU2JdRcuGRWTdZtr5xsMjC7EKXusBB3hPGRR2su5xH7Zo
	 EF121FtkSCaal296SJZEnaS7ULQCSpgFZSbbXLDY3bRn8RV8yvXurpqIyNEXFPO1Ueg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jxF/MHQN";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MPcvWDat;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3081606A32E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3081606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jxF/MHQN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MPcvWDat
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGxrX2377203
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vrzuixifcgj4ieImFYZkDs5YxdebevQpN1By2OneWM0=; b=jxF/MHQNRK4rlZJC
	uidrjDDFeqZL8iSWhn8PNkEDS7Hgx79vauSEpalFIzPwkujyOatXfBEmhCN8bLYo
	IF/9hKoafE//RYaWdUD5A7u+na6sQgg1fj5lbkPUyDvPDgxY+xgkhSSefAEXX82V
	nG+oXN9KPMzjqvuFdHOFftZVkS8e2nn0HGeVbtGJHsXvogoE3Ti5gsr4ktTYHIIT
	w7G+T90Ta867z4di7fLATnB631mFFTtJ00YQP4qDmgDKkdcK63WosjtBnTjPxGGA
	z7o7oSHypZ2FgIfxcDT6RymzoCQrcFanGA7LB/Hy0sy1D/2Z/7PvWuO1HSssytGn
	JN3CTQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7ut5up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:52:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a7af8b94so1719884eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463554; x=1796068354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vrzuixifcgj4ieImFYZkDs5YxdebevQpN1By2OneWM0=;
        b=MPcvWDatwtYh6jxBLmMD/rCxLEpOWjqi99GdC4qHws8IQKaPyjrlfTNAIdds4dL6SJ
         uF6dTCwxRggaiHaj/9UhLQ7+YS0Qqrz4NKwRvSm3wQuTzIABkvoa8u+4zF5xEp8iku0q
         phCUv0sI2/7cYbOf8bfFwUb3fnyAnmdFPZ5nLg99tIooYdhRHIIcEzmQgcUpgxXKWVAC
         FWuMNPO+7lwpTekAFiErnPP0Uii1WIkBaJ9KHVXzEHXnyRWwjg9qbPIXAx8L7+qOBeq6
         FW/i0Hf14B0T2geGFsD075VipG73SJThA8g2sbQjwQSyPBj0NjV3erqQ4MF+olIkWCnf
         dkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463554; x=1796068354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vrzuixifcgj4ieImFYZkDs5YxdebevQpN1By2OneWM0=;
        b=fZC4U+4LhG0TFZcSYKWzgmi/n9Om0bAs/R4+qJOVYsFfknSXta0IZDwTHzAim8YISb
         Mz/R8Z0KHkOg7klHw4wkGwNBf+6vxD4fLx/HHeLdUEl1NVPZogMnfU014vfLVKE+3AX2
         tvq5V5IDl4axd88eG62NiQT5q0UCxkQeeCrShI8M85vF8bV/x0X1G5xOc98UdGQNHAZQ
         gRPOni9seu4j+Tz8TqALBKS5WvAs38hbibbZDm+vSH3BnBFMYB2AoIJg0FnR0vtMYQ/b
         E0nvp2WtKuYxQ07WJFd7Trmb5b07kCZIG9TQlzMhWyGwcGRmQ5AnbyejStIVS5QT75eb
         mdxQ==
X-Forwarded-Encrypted: i=1; AL+hErFGOdltHGFxSaacb23QbXww0F0ku6Q//0nM6aBpLdlwYNvKJqcMYWrHbGnC4RfGWjO7gnSDaEvfIEUwf99q@vger.kernel.org
X-Gm-Message-State: APuU4Z9TPZiTqsq/a9z2NFQ1lSxvtPQYRhkxnkwVR2OOLTDXN3msF5hS
	tAjrrrWHTklz1O+s3nzJack8sI2zC2MPsAt9LXUEmwbTwBBtGh0QKUez3ATde1AnHF4DcSGulEA
	tsViUGYoFTOuqNH/0tfVIXoGubfPBcxToULdcVId7pUP74ma90BQQb0GnxYf2rG3k4qbs
X-Gm-Gg: AZFdTZeZuJtbZvgk8h4Wd3kZrSNnkl0bJsOTVmh1GwA9MMdZRIS/cGd3oe2k5kprAZl
	B4NZIfLeN8MDTYMcej/00eJbpx62SYhPwkvjjSOEvbidduIGQHtGNgaIjlppzzTcFIenOmwH/A7
	fDgOIJF9FG/JteyquRg5NLFMWJAO+DGlyTOGrv3cQkJmLrWzgFpNq7Bsa7a8HSiYW4JUKoqrxjb
	xOZ8t3EC4sRXR5EBvBm31aTh5OWfZPwrM/nJ/OGLynDfqLtSDxnwwDaIok9KkwZOwlrH142miLk
	NSIHDZ3T5bTl/q2RLQyNtxPjLJUiG7F2RitVH02flC0uyVmxWsIGhekEz40Kq1BiGpUC2xYnvKW
	xXG/pgQITczduPu5MOp4awm8KiDM5XD8z/hkYfb+hoPZIpsGpVrC1DthsT2ycFZ+yj+icSHaH2g
	==
X-Received: by 2002:a05:7300:7b26:b0:380:f32e:d257 with SMTP id 5a478bee46e88-3856f6524a1mr12179033eec.13.1795463553692;
        Mon, 23 Nov 2026 11:52:33 -0800 (PST)
X-Received: by 2002:a05:7300:7b26:b0:380:f32e:d257 with SMTP id 5a478bee46e88-3856f6524a1mr12178991eec.13.1795463553150;
        Mon, 23 Nov 2026 11:52:33 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:32 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:38 +0530
Subject: [PATCH v3 07/10] arm64: dts: qcom: sc7280: Add GP M/N clock
 controller
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-7-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: r4QZeaUybSx1gBc533FLzGmNKiJj1pH1
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b049982 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=f-mW_kVclKPPUklfXV8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: r4QZeaUybSx1gBc533FLzGmNKiJj1pH1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX42AOFG4Dyirk
 QWm71FAb79s6cxsGzcC+HnIN/CvqjUEOrFqkHetN77kL/5B9Uu/D0L/U1lWJllV864Zd/lkb+fK
 GzOcurvX+e7klYsWGYDJrxOypLE5BTw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfXw2BHSiKnyl56
 oRnwntq/EU5Aob2mlc92WIrFpHDoMWIqrsb5CToSkrtRJxYbjwOH0CkCfEZO1Vlxy1EL1v9e8Wp
 T6dw5pDIuT9MCmq2S+CpbVQ+itj/0f5oeNYNfyG+TitQNA9ixjtrQ2TEgGNie028twnCfBU6wkF
 IKmCxnUPVTURBU4dEp1PfDFQs9TDShTFW3U5OTyq3zOlQj6Rz2JWGUrwL0K3ejyogNfc/qM3Eab
 agXdNX7oRUQ+v/RpJkbteEWBF6ccFlS0BhA9wojmRSE7gUJFtq022EY7HeCaqjIDHfQhagX7+tk
 UXpA4VTsgHDBJjGYKMZTXVoXWKd/1l98hi6/55spni29TcKvA59Tir06lL+vQufbGrgaUh2JdZQ
 NddocWXww7RGqnpG3LChiPy4zcBHJEjJXuJDzeNlENqykp6haD2ruqX0xaskTB9DBlS9xbSU9r8
 FFIkzrRucS47PnLDUuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for SC7280.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio60.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 10e9a5279ed60cea1514097354b8f0f59ffca2fc..773f4487d78301a18d5c27e9e97462e60adefd0b 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4454,6 +4454,20 @@ usb2_role_switch: endpoint {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm", "ahb";
+			#clock-cells = <0>;
+			pinctrl-0 = <&gp_mn_active>;
+			pinctrl-names = "default";
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+			status = "disabled";
+		};
+
 		qspi: spi@88dc000 {
 			compatible = "qcom,sc7280-qspi", "qcom,qspi-v1";
 			reg = <0 0x088dc000 0 0x1000>;
@@ -6683,6 +6697,13 @@ mi2s0_ws: mi2s0-ws-state {
 				function = "mi2s0_ws";
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio60";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			mi2s1_sclk: mi2s1-sclk-state {
 				pins = "gpio106";
 				function = "mi2s1_sck";

-- 
2.34.1

