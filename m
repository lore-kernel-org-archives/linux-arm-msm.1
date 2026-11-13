Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548063;
	b=DTNX5JBO6Ti53nq40CXSe3GFA2Br6DD5hP0jkTXZ3Wg7uI28F81HoV6gjNsOJn3LgFdQ
	 sgGTM2IIZApd+dlUv0UFHVtazlopMr3F6gLNNwIYZi4fXeWlxHi8WDIe7/tmcWpMDEKpp
	 o5lDaxrfmlGOeSaGgxY+f1AdS5K/S4KI6eTTMUkAiUEqcbRK0dHnE10VVgX2SOidUqK3J
	 fH5i8+f1vUeW6UtbvRTTGKp/oFVeNPslV6xbp/bqwN2u9zrJqEzJ+rjKOjWbfNZR1U0xo
	 L+/DQMNwQ6QgI/Ac547a6wSoGVwC/Ke9fUAGRbdiNHsZjhcmmQo7ohEhG7cWATUJvEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548063;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nJPwAoljw5+lmQOqvX+chl3cD6Qer3JM6uT5px6LGGE=;
	b=vX+dB2LoJMChN7lizjsF5O81zAfIPDsderztSqWo+VnNGI4Jto8onlb+MDx5oG06Whcy
	 duthJeSIdW/dKC7l/OKZwd/uKo1RfgR3GdZZMstHS/ZmGYugJqjWknMG/cewKvc9S97Og
	 zDEhKjmr6w5VYd9BCGiFUcBp4vUTI0fqnAb+al9/j7nzk89f1A9ITpvbsfRmMP5B7Lreo
	 g5YDa5jEN0Pb8IBtUQV40r01U7vrk2hSABAmy09xdYv6ct2ko8ORu5ABY6S8OxeQn3jkU
	 xVFgqfEUAMY2D4UbmtfYoi2RnkW4DRneD8TJ6AG+bRM0miPPEwrCwoPIT3XtGw0Fx+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="AS0/rkbd";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNkzGeit;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FBD606CBCD
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0FBD606CBCD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AS0/rkbd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNkzGeit
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD576gX073405
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nJPwAoljw5+lmQOqvX+chl3cD6Qer3JM6uT5px6LGGE=; b=AS0/rkbdJUBd/7MN
	xFxHCyqspuPEGtMJzl/7gy1OBVwlAQ2aADu73ViAr5TW13EM5vP+8n/wS9I8fnX4
	+Rk8L5YDDrzvoqxhd+BRkqx8iGBaDqk882kj4cO3syd9u7J8E/a/53lPoFjf+Oc/
	1LIYpbPVPz8M1bp/c7JbajRfqN21uecENJumTBdVGOzf6kiUwV6NJCNtGy5r26CQ
	d8JwQ7XtUcgQxQKz3xjRoJEQJyQfmdqY5gT0cebMSzfMF+hmMZawLsLSmjWt+NON
	7zromXGv47YVy3TZcuz2PT9qqP02OMZXh2WxNOksFc+yugNY0DEyMATRlaf9kAtY
	51DGIw==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs03mg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:21 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-458326d2d9aso665635fac.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 21:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548061; x=1795152861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJPwAoljw5+lmQOqvX+chl3cD6Qer3JM6uT5px6LGGE=;
        b=WNkzGeitkB/QwEu+eYvVszTC47X+dffb2RQDEfuaj398IOdnjc1RUgczurDczyoPwq
         9OCGpGH7O7l3HAY5oH9oKhCjCaIw9jc8ACsj7XV3twZVA9MuY9DBed/FLXxeVEO29ulx
         0XzHeNAMuGcU/W25jU5k1/a6RGpieNo5okyYFGVPdXAJcdNS2HXfpAeLPQy0KNXM+0SR
         9rO6d/Fs5gij5taFmXiGwgCarTsQOEKuAHjHImyI46HhP/d3Z7BzF71nbDA2EhEaGMuo
         7c0cJJJQFb8Q4A49d4hN/slP9Be8nYkKcpH1ViaiJgZIO8Id5nEPOROyGKU3Z6zG3wmb
         7CUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548061; x=1795152861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nJPwAoljw5+lmQOqvX+chl3cD6Qer3JM6uT5px6LGGE=;
        b=lQ2jrH9HBEGzjA/wO9RmcB+zJo64RVDCbtKCDtGhEAC1XBb4pTFY/b5KcdLby2iVCV
         fm0cEMIGXYcTbV5DsedIsvbu2hwT7u9qCyvizWfe+QZ/kgDehn3sbD2dmM+YUuXK4cVq
         R/Vq7ytq+5OthXq1/zgeUQQtVXX7INu5G5PIGIUdJvj3RGohX2xic5M+k1hS5M688LU2
         uduGvXa0qhrbtl2h+au2N2v4kDiaBROwgda7MpJrkCXl3/L19lnkWdxaIOyTsGXKqOrd
         3l6fAE6ebIHo+DBZJey1bFheVvAILtjF2qnGnHI75vQuV5pLjY4pIwrPlnO7DoH4u2RU
         uCrA==
X-Forwarded-Encrypted: i=1; AL+hErGIVysXrwZYFklKQyckA/GSToDUp17YlMkXOOECgI/7KlheNfLas8a5CX1Cyqokdj+QL5bI5/nJ6BjgaRR4@vger.kernel.org
X-Gm-Message-State: APuU4Z8F8zAGzS5M9JCoHDYkixWfImQPffYKyc7SV7dQgNPXneM5Z/FR
	Iz6zdm1YFdWVjWV48vsnm7WLg73LOfSieWH00TftcohECw0kG/YEBqk5EiuxiGWb2SMDiMA1J78
	Kt0P6YjOY2SYk19KYYvOi/mkgLnF5y3SR3UysrXpYEdMnHUy8mpvHbDWDcyqX4PTu1vh5
X-Gm-Gg: AYBFou1fR5xmLYZk5A7DSzykroNkNmnZ7PlWyQu8TU7+OEWKOaa+PlAX4tCu+csxmMF
	eyf+O8z3nJoPLa3G5Lc2YOhNhEatqySGCsWlvKRLX2IgHTR1f5Hj7IUxZRn2oJr/cKYD7eEwY4+
	vTZzDuwel4IriPJGMQaDguZCqffEZgjgyFWp0mipvkHPEPu31Kqkk1ld5b4NFEHR5YCqSdM5Wx0
	BcGq8ssQQjxqD4pcJ5S3Qz/fhaTrG+D8Cqy9a1glcqNrzlx4BNqCn+FS6o9VNkn2mkIrNIJ+lIl
	LrYPmTWAgUGphe2Ax0DcsnIKWZvP55LIQoHW90qAiroYMqvyh+WJ23atfpdSeT3CUqeubp4gZuf
	/Axv2bE7TExpK0VmE5W1riFzawiPw6PIoBJgurIwAmlbIxnPasj/9846KvYfuUNM56Rws+zkihe
	K5Z+yetGmFt0aOhcdxYROyZvURky4CLXMNolQtDa74u3xTAKWIXuDU9VKlyMiJ
X-Received: by 2002:a05:6871:522a:b0:493:7742:f0f7 with SMTP id 586e51a60fabf-4afdf49decfmr1711025fac.11.1794548060730;
        Thu, 12 Nov 2026 21:34:20 -0800 (PST)
X-Received: by 2002:a05:6871:522a:b0:493:7742:f0f7 with SMTP id 586e51a60fabf-4afdf49decfmr1711002fac.11.1794548060213;
        Thu, 12 Nov 2026 21:34:20 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:19 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:45 -0800
Subject: [PATCH v25 13/15] arm64: dts: qcom: kaanapali: Add CCI controller
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
Message-Id: <20261112-kaanapali-camss-v25-13-1d709f57f370@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX1zwdsm7dg+Od
 Vk3yiUCkXb4zut0HkEdTSKGgJ+OrROFlyvw7+fxfPRlhsC5qR2BMzdh1aSFry3sPzyfkz3mFYeZ
 DpG8yJrlEjPPkuVrFxAMKiEl5uczOYAhsV7ueA+3Z+dW+l61vaCE6VAQ8Y2e1jAEXOF4EVZ/Yqy
 WciBQ4c9ugUyD7uiPK7TUyRktpOz010ufWFzhvOZdQJFpKoPItHpjw6+voLW1It/OYFyb4b++2f
 rhDi5oDsMW5I1G6K+u6Ga9bpF+MuQeI8LaOr1JKFOhHG1fcfxmUYf+ISXi7oWbYu6mEO4EU8b4s
 DZ8mVmafp1acj7B2eiR4j/pKNRgRE6Gpk8fReg8itKrxjjVI0TquKk70772yWTk/cueXlqN7cbR
 Z+koLJeFIEsULZl3t7rFJUdj/OvK+oTWqJVtqBoVaUYYA6ZqPFZf40DHgiFiXzQIZqdvgUFIoLO
 dEknxPAwyQRt27z9nnA==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af6a15d cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=09nyjJ-fxQ_OzqxZyrIA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfXwZTcomBQBSEd
 eehjOtM0Zmu+7X3vZtGQ7U82bpqPHpGIBzCSy4q4TK/tJU8MDtWZ3FskU1DLKZb56yhO+P0YQU1
 8JaxAQQuuMiKKXKOmH5qML9FDTHTNYQ=
X-Proofpoint-GUID: gbmxH4PGbiEiMrGDsSf3wQDM3wbFFIwq
X-Proofpoint-ORIG-GUID: gbmxH4PGbiEiMrGDsSf3wQDM3wbFFIwq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

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
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 303 ++++++++++++++++++++++++++++++++
 1 file changed, 303 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 23406698370f..1662ebdfe729 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3763,6 +3763,117 @@ camss_csiphy5_in_port: port@5 {
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
@@ -4552,6 +4663,198 @@ tlmm: pinctrl@f100000 {
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
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio109";
+					function = "gpio";
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
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio111";
+					function = "gpio";
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
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio113";
+					function = "gpio";
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
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio107";
+					function = "gpio";
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
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio108";
+					function = "gpio";
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
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio115";
+					function = "gpio";
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

