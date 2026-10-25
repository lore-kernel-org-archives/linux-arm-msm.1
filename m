Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898260;
	b=f/WEABX/JBJQMF1dGuTKnVbRvOq+mZIDy+C+bwsC0iEKIoUjTcDMKT90y6xNdk88ZUX+
	 JS6E78Yr0UD/tfPvte1Gs2+81f2WQ5Eh3+rdgRGsI/+JqXE8VJcAdBtmz+Hw1unHe1T6l
	 ZJh06TkVVPmBWXiqzUvnon4A8KS7IyIEa1kkzNe/fFh7wF+ra8MAd0QbTs/LR80XjcbZi
	 vfQy0LLn1yNbwGnkPN1C65+tLx+yMPScfAo75aoudhgd98M57adXc9J5lQXl/48UIasAU
	 8s0uXgMMAu1IwPnjNaneX1RN/gOqx1hsQZpE31WFN5OHtG4RqMDJd2az9TeKL64MfqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898260;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p2iZ2VHss0+GjJt1WqicxgOylCTLcpkomSb24+V8EpY=;
	b=h4mQaqJvNsFQucD31M+WMEV7KfYonQKP3JvE6CmSIGDNEpx4Tz0jqKEBp8nHK1Ts36HB
	 7ps7nbCvcYK1I4jwtSnc2zEVouJGN9/yLXskAtx9j8nAmEyuQY83zSvXjR6R1qrU53CRU
	 EIXS3YQSWiP5jR4ACHhLAuZmPpltTKN2rsgZ/RWwvjSnkU1EMT4QSPVBSBocqneDfhBCo
	 Bz6dnpe15bwN3Ceeh+kTNkh7SXc4zSpz9cprBqrgKptsaiD5jyudunFyADrqlQcl2MoTp
	 dF6q8IdHYmZ8JT9ZaazMYG2jPzqmpnxXpt+9KL9eWWc5B27HuM6KZijyGypTom/5rwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MZ46rIin;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UZwPPr63;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A3560A3831
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41A3560A3831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MZ46rIin;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UZwPPr63
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P165OO3094755
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p2iZ2VHss0+GjJt1WqicxgOylCTLcpkomSb24+V8EpY=; b=MZ46rIinpKsUFGSw
	XR3zRNG/8G9TrlhSNh2AWVM9tsYYciP6xIPYTaxjbDhn1XC8fOCUxfRo0GScT9q0
	2QL01ndVOER9tzIiotyZ7KwZ11G+Utwoe5YSdGPpXt9Hk1lSZVXCpSTG4ZeqIHq2
	NqbIIy3Rb/T9ckHLMk1Y6g4pBM9OixmUFQRCtkIHdkNCp9gn6G9tZQK9LPDkZBAO
	0Pb3g0cdHcoZDu4f/C6GmZbXg6bgYa8eattSffKnYnFP9RBogcJVAFXjTdBLJ/kz
	3zKEWBDMoKgZsuSqYDPUkiLVdM4fGJkeyEszTuEU6r0HKopKntHkEW2OcY7OejJH
	5CBElw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgj1pantm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so5805580eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898258; x=1793503058; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p2iZ2VHss0+GjJt1WqicxgOylCTLcpkomSb24+V8EpY=;
        b=UZwPPr631RQglAE12Ye+sT7jbN9OLVFI7nyhcXel2kNTMAOOzeZ2b0EA+xoVlXfNdW
         IOzK/E93LfiKCncMy26ven7T8oMvS2+Qb/IErJpVXWoBlYovsSLdW5yBhLMbHo3P/w+D
         a+sMT00rv7tlvfE2NKakpb8djIPUBE0G2bs/9PCB8TvtRhu5hXd/4lVWTlsbeulc2HD0
         NrXoKQ9vG3/SywmhMQK1GPL2SQsp5wRd+ggF1gLoBqHLfXHZIik8vItCfmaj9yRhkLEU
         75+qOMicjhJofgiSe9Qgu77hz3XBzTvHTXRIaRTJ4ZCiBYjAQ/A2CAzMw680WDHAr2TU
         aNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898258; x=1793503058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2iZ2VHss0+GjJt1WqicxgOylCTLcpkomSb24+V8EpY=;
        b=y5ABGgfLbHxfG0dYYyjbWnqL9csLteS5AP7T9r/0Gtb0mme1XJrjvK9g0xvQ9StHQO
         DCTkbdfBc2zaHjsl5N+A8xuZrYwvEPe4EhBugjwCsGw0vjvnmTYNxxUGyPS/R8Hsl/pV
         Z6hEDqcRmaSYD6+SLPi938ErBmXDXtesv5rWa1sf7/FeJXn0wT+nA4p5gJkkM7Qk+Ncy
         S0p8xpy6Bd4io8YxeOTwaIGYCAFY537m5nG5AABNdqKX0JKpd/J31QD+n+cH8Yy+M/ne
         UdamNkbCZ/aNQbeWxtEu7ZMSzFhEYO9uwcAAa8Itvf02/C0RHkCKCf8g72trn0txwSJL
         kVOw==
X-Forwarded-Encrypted: i=1; AKwUvBwiLojwY4MLR501Rdz1D86BQ5uwTc1XuHrnpzLvZOwwp8EKgKERkOpLXpBugLdO8sZIeDWZYBezUZNa57bZ@vger.kernel.org
X-Gm-Message-State: AFq9FYLVs2qC/c3ntrFFnptaoPiAxR8gAqMn1h0+BYxicu9G1MYUqfif
	Rm8JSFOgXJfzLyEVoYZgiE+AcPRYKFrDHOwVgQlwZqaHe8qspkrua1ezW7sa6ddM9gQPqOG/pqt
	RlIFF0vIpsgkbSn+M6lcL5dw9csdsV9vsXyMprB3dquaaXIaHqre2Vu8oTY3eEtuA3L9y
X-Gm-Gg: AYBFou11AUmmujAkb+8bsc5f4U39xnGQ5Wx+JmnSc3qxL2+ZEwmsPy50987ToVAhsTu
	Xl9FyiyffUKhPnOA+XexftMqKwj//Y4w6Hm4+MnvmkJhjXvRiVGbgA4CXUNfDvXRj9yi2kvZ7VW
	78RnOBCMOzd51iU9zBOpmOIpPwjjXrWRRClcgpoY0aAaI8H0mvt0v7iG+X5K4HVNlB6Jmx5LTy0
	bER35O+IoMeakAS8FTqtnMjMlLSeVY8jDx9LJYBv+2+r3K1OAEaIIBArOa4JRywMUbx+VfHo+E0
	xP+shJbei2y0lycjQB+eg4vtQd0J2yQGX2fZSTWk8gfGQt9xyJw9dEhKRvIz5wxakpWeMiPRgez
	kBlUg43KO5EZk8iEq372eKHmVlO2C+0r6rZ/UC3t3ycJpt37WogNOF4Pp0Z+1rqtDRpP3U7hsyH
	GYperHpEfmkw==
X-Received: by 2002:a05:7301:fa6:b0:369:f64e:7feb with SMTP id 5a478bee46e88-369f64e83damr1517244eec.2.1792898258051;
        Sat, 24 Oct 2026 20:17:38 -0700 (PDT)
X-Received: by 2002:a05:7301:fa6:b0:369:f64e:7feb with SMTP id 5a478bee46e88-369f64e83damr1517202eec.2.1792898257486;
        Sat, 24 Oct 2026 20:17:37 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:37 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:31 -0700
Subject: [PATCH v22 12/14] arm64: dts: qcom: kaanapali: Add CCI controller
 nodes
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
Message-Id: <20261024-kaanapali-camss-v22-12-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX6iRYBDDvr9KC
 4kcT4b+LynZaJjwE5UZdR4P1Y1Wr1IUcYjIgoxlZDjrKgR4FNAIuwHDZbYi4uONAwJCJAdURC8g
 5JjZ1yYe84BpC3Qgd+gdhcqZYag2SFY=
X-Proofpoint-GUID: IrVcB9uXwo_gouEHa52k7_9UV_fDJm14
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX0nCRz79aChUm
 IKfU+qLuR6WCP4ggwbVCjhXjXYut4VIpDw+GL2ajk1UsIHXWkqWmsHG43d5fXthVg4exe3bBS/3
 0DFt/N9lwqEGAqJqWEP7/8Ca48ifGSkXg43F3OZAklRP1wiZZI3lhRjV+nF2R4c29ft9p9UPLyT
 K+CsM96v6D0KMj6qbAMiTetAb3Sg4ojraRrJcOWs0Hck1DewkgLq8aV6DuxZiuaxe5gzGCKYc++
 eU8cyr7hltyu9TbD1lhHGQM7bN3JXzRXp4Ze1nH/E1lICc3Ftdf50i5ehF7DITzGeFxklQRpT7N
 UW0WX/eaXljdpIEu0Wfn/sjRQTqFf86AGvRat3rj5r7bT0hLi2BJzSQLqtnQi+t1G4bq5OnAGK0
 QbhYylXNb4/CndvskeHSrAtkBHt9ah+r0AeZxdkyYyBhlZnwoUjhpM46dD9BKtDE+cuLkqX0Olo
 ZfFwOa1ZhG5oZP6ZqJg==
X-Proofpoint-ORIG-GUID: IrVcB9uXwo_gouEHa52k7_9UV_fDJm14
X-Authority-Analysis: v=2.4 cv=D5vSufRj c=1 sm=1 tr=0 ts=6add74d3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=09nyjJ-fxQ_OzqxZyrIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

Add the three Camera Control Interface (CCI) controllers present on the
Kaanapali SoC. Each controller provides two I2C hosts used for camera
sensor control, so define the controller nodes and their pinctrl states.

The first bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio109
cci_i2c_scl0 = gpio110

cci_i2c_sda1 = gpio111
cci_i2c_scl1 = gpio112

The second bus has two CCI bus master pinouts:
cci_i2c_sda3 = gpio113
cci_i2c_scl3 = gpio114

cci_i2c_sda4 = gpio107
cci_i2c_scl4 = gpio160

The third bus has two CCI bus master pinouts:
cci_i2c_sda5 = gpio108
cci_i2c_scl5 = gpio149

cci_i2c_sda6 = gpio115
cci_i2c_scl6 = gpio116

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 303 ++++++++++++++++++++++++++++++++
 1 file changed, 303 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 11df1c7c6e31..86dc1400a25e 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3746,6 +3746,117 @@ camss_csiphy5_in_port: port@5 {
 			};
 		};
 
+		cci0: cci@941b000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_i2c0_default &cci0_i2c1_default>;
+			pinctrl-1 = <&cci0_i2c0_sleep &cci0_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@941c000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941c000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_i2c0_default &cci1_i2c1_default>;
+			pinctrl-1 = <&cci1_i2c0_sleep &cci1_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci2: cci@941d000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941d000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_2_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci2_i2c0_default &cci2_i2c1_default>;
+			pinctrl-1 = <&cci2_i2c0_sleep &cci2_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci2_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci2_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		csiphy0: phy@9523000 {
 			compatible = "qcom,kaanapali-csi2-phy";
 			reg = <0x0 0x09523000 0x0 0x2000>;
@@ -4534,6 +4645,198 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci0_i2c0_default: cci0-i2c0-default-state {
+				scl-pins {
+					pins = "gpio110";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio109";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci0_i2c0_sleep: cci0-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio110";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio109";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci0_i2c1_default: cci0-i2c1-default-state {
+				scl-pins {
+					pins = "gpio112";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci0_i2c1_sleep: cci0-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio112";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c0_default: cci1-i2c0-default-state {
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c0_sleep: cci1-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c1_default: cci1-i2c1-default-state {
+				scl-pins {
+					pins = "gpio160";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio107";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c1_sleep: cci1-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio160";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio107";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c0_default: cci2-i2c0-default-state {
+				scl-pins {
+					pins = "gpio149";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio108";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c0_sleep: cci2-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio149";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio108";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c1_default: cci2-i2c1-default-state {
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c1_sleep: cci2-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
 			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio66", "gpio67";

-- 
2.34.1

