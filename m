Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655960;
	b=zY19//7Xy8SAugxoXkY/7D2O3lrZWvF1Y3M6QoRKumyRCQDluWylK9UDT6ihovkZIIiQ
	 65/ps4jedex4e8QYTAoGTPEvyyGV9AkW2uS6Tycec2iyV1hXQVQLFCy7p2hrOC/p9FzAO
	 vt6rCEo7d1qr+Su5ROmLdMTQcjM2qQQmTraPJYIMJBQ/zh6lPqfcJ27wZA+17BsPiQBtF
	 R0vXRY3boDJ8AKRqespcikZbboiwDTHKpxv2zUZx+YyRQjNP9jK9qdkC9t2lanmFqW520
	 DuaW0+W9HcMEvOXl0Ke6CG6ihSmxZ8NMYDkF+q643zXT+HJVzyBwFc/ji/gEpmkEsLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655960;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iZaxRG29RknVY817FNbwaOahUHm9TuG+4UXX0Im9FiI=;
	b=x+TZZyji7xodfiz9Xr5lLPJ0QdHexlHqabZeLVaWk4Qj+M6ZQmUMRiNJp6wDvSZUdM/u
	 Iz9VAHo1B5ZsvOZD2VYTKhkog1tInWYUI66X71/NcM5GJKin0zJ2zTN4x5itu1nmYv6i5
	 f36D0VUlUo+kQ8j3rQXksVLHVNvfmqZrHtSz9O5fi5M3lxtx7mttY0EUUaPWaQ/xfYUuA
	 QF7NMPBL5aZg+XIkzNL1UPJboH/Gy3aeYgxM0eI8dVype9DoL7NJGQZGzX9/mEl9vf4KX
	 xsn4roCkOOQCChM3uuIIuMaY6r2jwYnxSEBdIfu7jx+fkHfGHhOcCrO+c1T0hAhB+Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fZSxltaM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VnIW7VTy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101E5606A327
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 11:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 101E5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fZSxltaM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VnIW7VTy
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9w9fY1750090
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 11:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iZaxRG29RknVY817FNbwaOahUHm9TuG+4UXX0Im9FiI=; b=fZSxltaMWxOlvyTS
	liBP5q85uM10hLNJeD31jrQCHp6gV1qA/C7DG5cjszv5tzV9pj1Vw8eYOSM5V9TY
	Kv+L2XhXff2mIOWokOSCXvqf6FnQXbQPwOy0h+Gj1u14xGTq+hr5BxHqKUYCptK8
	roYv/rt8Y19/mfYqF6C8oHKmuHFmybj5nyNQGmc8yrZ6d7/8mIE0MXPOs9GA63Q+
	eYt93MUxC/FUe8Yvh8gvaAdfJb98axB4e+EOdJ6+NEaVqNELulsAs5rYpbZNMijS
	3vld7CQQgfmpT1u0MerfOz/LqaQm1nJ/BIm2E8qIXXdDN3xp5GHqSwomAv6a9cMm
	vNF+qg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj40n2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 11:32:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91ea39a2f8eso42522896d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 03:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655958; x=1795260758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iZaxRG29RknVY817FNbwaOahUHm9TuG+4UXX0Im9FiI=;
        b=VnIW7VTy8SuP+489n9OCLxU6M6zWlpB83C9VFkxadooBtSA/ZBLMPv9ffToo6ELTrD
         4dbmgwUad6RPHQYFqhgNCR90ejWoz337/xPZKYJzulseZrHQBZYGFpK2bPqQERgdWtiY
         2ANhr5CF5qNks/PrbA3C6CVlRdnBwA2U/JodTASFEAcIQjFYohitIC10OSxzEKxuicU5
         HRdz4Klo+QPq5ujgYi5Qr3hzrmF6am9srk7fkaWAoK+M3+B9J+Pntrs/ztP4xcf2Lq7c
         gmx6LzDk8fXpyM6leH5AFzs2pV5s3L/Mj6ioYmOuCuJcUD73vw7RBBGONqrOVP81v8O4
         4UVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655958; x=1795260758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZaxRG29RknVY817FNbwaOahUHm9TuG+4UXX0Im9FiI=;
        b=FesMstDHlwttcI2MBVySdKarHP6is+Yoo+L1PxsdGnRRIb4HAeLyuLhoqdgmMxKMDd
         SMezRmexA/QAHnMI/4MeBikSr2GJ1aS5RzLyhmOuv+i4N6HerdM13IPjYHg/d98qJBil
         L0sksaTzVT9d3UT/1LRhVZdlfsfDZwfn75bAORiI1OANnupkXJUa4B8c5v53S47lwzfp
         tDeaQsrAu24ITIxtugAQrv7mur2BRSjZihckdZg4+SisTvi2flrhZ2WsDctYFQl9/Nzr
         n5UrDjky5Ey/bPzLWf97r/U1n1zfW9Ay+z8O+5MPu91X4UrZjtI9VZyN9l17ageQk7hF
         WIMg==
X-Forwarded-Encrypted: i=1; AL+hErGzQa3bIIg0DeTZ61MMBETnGIamWaKf/MrQjnQtiHRqh2JK3IQG+FkfjXNXv8Q1vKko/OzX5dIkDo2ncy7u@vger.kernel.org
X-Gm-Message-State: APuU4Z/zRqjlS3Ubs05qccq2aFuN3pXxCrKt1CUsjHQjK7oUY8ENk0SY
	LVH9g2ngvIgMZJyBoryRtvGA0dMu4Sa6DXu10sRV/Nmo5R4BezXhZPoedlBbTG0tSW1Tjm7t+fC
	w37bxph7F9iEYUoQqHgcClNeEljgYLxJj+HYiRtAjLn+4iJklpGnXvofNkWZsgEVH/I8y
X-Gm-Gg: AYBFou0EVPGL0kLipD/hPhy2S34azzqQ+KvWAGx1h1EJos09ZwT2K/8uxl7KYfZC+QW
	a0Fhbz4VRuFskGpAPI/GyBXLUDGAbaOo46hsXbunGoRLISsqi5jL0xG39+IG5w9rgCvoc+Uifa2
	mNDyX3N9S10J75aH8+EW8sqKQNaK8zTC/klA5x9yybobeu6+BbAaw8QA2zkFjgiJnsLw75oznqa
	Gl2Rp58Ia6+arXfg8p2jItq+lP9LGpBkscOl7N2lutn4fq0at1nb7RZ1vaFODx3BY64xJJak28W
	flrxic2ja1QD/UQEJU5WLlZl7LXxy4rmmf6TsPU2iCvtPnXT+Hzq939Eg/nl0GBs/uxICcr9D5O
	NFv8Or2ux1dMCYz3xmubL7F3xfePWeehnbvQlYMxXc4lwg74qxXGXtO5x4lNaCVb4QAlxfcWsOw
	n9hzG5RrCN1hJJZwljXaGeKfk68cmOZJ/H+k2BLOWG
X-Received: by 2002:a05:6214:2469:b0:91c:52f2:b469 with SMTP id 6a1803df08f44-91f24110424mr82261026d6.15.1794655958437;
        Sat, 14 Nov 2026 03:32:38 -0800 (PST)
X-Received: by 2002:a05:6214:2469:b0:91c:52f2:b469 with SMTP id 6a1803df08f44-91f24110424mr82260566d6.15.1794655957882;
        Sat, 14 Nov 2026 03:32:37 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:32:37 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:36 +0800
Subject: [PATCH v7 19/23] arm64: dts: qcom: eliza: Add CCI definitions
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-19-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=5423;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=2F/1hz8EqW+dxa4z4ZGC8nIylMjGJ1qkPeQTQ26Wm2M=;
 b=o44pkLOF5gJic5FJlKeOE7d0Xu1/qC2Eksnos8KlJAINoSwL56OWNSnoCDj5/eeRt8XOgZh1/
 VnJ3UIBkC/vCbE6nJuuvnCfjTrDsVbM5vQcRwyMQo10T29oovCpSDfl
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX3U0tUtYG0EQF
 9Xoe7Vft68UTKGuSifT8+SOjavdWCo2lh3gnej2nood4mGp/X6ra3sdPrQBXdxZX7KLqZMVcRaP
 weyLLPXQ56MRdNo7yu9L/hiC57wg+5PSR5Dzjt6rIEMvzlNtOUftTt1QDTOLD0uH6j95fd4Hato
 HL0Lq7kr3n0KsvN8dz/33roVCTqzhPwYb8c2017o4SD5xhHsu9568fw8kdMQkL+l1kTi0v1ZEX/
 0qPmhKk4lWPE/GOslRcEtu5OiwAZHvWBs0+Kb+Oq4hBZd+1P9B80svgDDUr9Uw0euWPNI1WaF6O
 UCKJvslR4P6Vo78JLc9ivzUDE9kfyXvUly85vs/Gld6iVQLyz9H66B2GObSb+fbI/KbbdpUyIGf
 a2PRiribw0UTDxMgVPEwab7MKQ0MMty6AZ6IrywBttsWYcQqZ9YY4OgrEoiOcoSwCn8X9Eqc49U
 Do/DCHM/tdJUudUPRyw==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6af846d7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hcSdZqVZxIdZ69JYko0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: jvRW4w3IMsyT-h01W0dKu7gSS-Pbl6N0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX//hhBRmsq10H
 ps8K+W+i3HmVDJ+OC1WrNy8i8adoLXuDjmQxbKN7mGBDSscSpDMN1j0as7TMKR0EGSXPr9UXumJ
 qBbN/wr1jagUAzCITCizhFUE4ttH938=
X-Proofpoint-ORIG-GUID: jvRW4w3IMsyT-h01W0dKu7gSS-Pbl6N0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

Eliza has two Camera Control Interface (CCI) controllers, each with two
I2C hosts. Add the CCI nodes and their pinctrl states. The nodes are
left disabled; boards enable the CCI instances their camera sensors are
attached to.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 188 ++++++++++++++++++++++++++++++++++++
 1 file changed, 188 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index dd21cc4d267787db3d8741f8a8970629bd20d0c4..0b759bf5b91e412743c12982b79ab4506b9a50b9 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3592,6 +3592,66 @@ camss_csiphy3_in_port: port@3 {
 			};
 		};
 
+		cci0: cci@ac7b000 {
+			compatible = "qcom,eliza-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7b000 0x0 0x1000>;
+			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb", "cci";
+			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
+			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
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
+		cci1: cci@ac7c000 {
+			compatible = "qcom,eliza-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7c000 0x0 0x1000>;
+			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb", "cci";
+			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
+			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
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
 		csiphy0: phy@ada9000 {
 			compatible = "qcom,eliza-csi2-phy", "qcom,x1e80100-csi2-phy";
 			reg = <0x0 0x0ada9000 0x0 0x2000>;
@@ -3953,6 +4013,134 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 186>;
 			wakeup-parent = <&pdc>;
 
+			cci0_0_default: cci0-0-default-state {
+				sda-pins {
+					pins = "gpio70";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio71";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_0_sleep: cci0-0-sleep-state {
+				sda-pins {
+					pins = "gpio70";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio71";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci0_1_default: cci0-1-default-state {
+				sda-pins {
+					pins = "gpio72";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio73";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_1_sleep: cci0-1-sleep-state {
+				sda-pins {
+					pins = "gpio72";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio73";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_0_default: cci1-0-default-state {
+				sda-pins {
+					pins = "gpio74";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio75";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_0_sleep: cci1-0-sleep-state {
+				sda-pins {
+					pins = "gpio74";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio75";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_1_default: cci1-1-default-state {
+				sda-pins {
+					pins = "gpio76";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio77";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_1_sleep: cci1-1-sleep-state {
+				sda-pins {
+					pins = "gpio76";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio77";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			pcie0_default_state: pcie0-default-state {
 				perst-pins {
 					pins = "gpio78";

-- 
2.34.1

