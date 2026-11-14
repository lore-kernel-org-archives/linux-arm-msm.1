Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655927;
	b=QADi0uV4SYL6XAtGuXr5wNFumJfQx9vwluw4/snifqdbODEAJ/auFhp/x1pdTVOYFD3A
	 aSMWbb16JJoAnNS8Mjzn9P9XAATI9VdX5HfDwsZlYUnAeCr2cq/EuzzWqU4j45T1xJ9P/
	 Wy7ujJY16EmYG76oiZcMJg+2UxQMN/MKaLhtsE7P2gcljjDYVB2C60Rhw0hdFFgRAGQE3
	 diBv0ZlECou0yovwP5EUJ19fIhsnJtGkDNF97pqi6FZWQwXd3vzANbg1mpMSp8garaEIP
	 wia2VMaRfxDFYElgkU88b/KrXPdRQfA5Xv5urtqxlBjP8GjAozwVe9VNSiFtzHKWNYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655927;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zQQmVhv+kzuoV/3wI6+2SQdGx9hm3pY3alCduLOYJsw=;
	b=1FZx5k0vm1t/ajIbEk8tLd8w3CV+DSDaemdpnB6R3Acp0TeYbCJGwGklk7/cpxbEqVpe
	 Xq3xnbzcZl4z4dAGlT7KTO+5aQcj8W+1kEKPPfPYca5k18T020c6Gv/Zye5+S8KyOAQ0a
	 /L7xSUg2txYcru+Tr89JotYmWIZ5Wu1VKWX2aANUE6zxqzbvh2GOg0FX31WPfd1TnZn4p
	 zljXkpcXnCwmJGMxhOiVbbsPcLfBu1fEvu09ErPSZcW40WKPEtvUH+Oj1A7l6thFSwZFX
	 Cmkey2RWR1wmfHI2EXDAIAr8fSMKSiMT/I1lf1ChLlquoX1POo27z5ttljI1Cl8P/7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GfDF4bRn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kPaHjZFD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FE5606A332
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 11:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99FE5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GfDF4bRn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kPaHjZFD
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wC8d3379147
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 11:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zQQmVhv+kzuoV/3wI6+2SQdGx9hm3pY3alCduLOYJsw=; b=GfDF4bRniBmoJGta
	ZvOSUYf2qdPZ/aVWKN7CyLz93HCP8yROKLbKur4uf8O1GBECQxDBJ7AGoFSAEPRh
	qibeL9PGZVtzLkLM8RgIOIFDVar+viOd5ROJWOjlSSdIudeBHoqvc76KN8GAfZwo
	PgUXLgsaozH29zLxyPLWZUiqq1OPR1dgot1udMQXA3uu/RmjdQ0N23OtWqvxJRZM
	/YIdVC7DnL5R/s1Bo8UPtLLnDRJzZSwSZzg1NYVlmJU26ZcUsLNEBuK98sTtw2b7
	0XNhP2QvG6UGYoLjcykYppXJxHewbtMl+7Kr8OQWh63QBmHyaH/N2cgK8nodcbG+
	cgHpRA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx0n76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 11:32:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-544019b1831so36872731cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 03:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655925; x=1795260725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQQmVhv+kzuoV/3wI6+2SQdGx9hm3pY3alCduLOYJsw=;
        b=kPaHjZFDLv7FTF5FsKdX9n424HD+UQQHyNjgcRfNGUjSyCSFWH7KzVDq1o5tHWZJm+
         9bQmvTfIwbPCp2j77USdoKJy0IPq8ImDRIvbclDuS83EK4oBs+vet0mi3ZBUlUVDOIB5
         9jOKcZkL1Ko47q4dN1hhmU5CbLXro9vrWJow9wIWef8qxeJnjjK3LPrTN7yLiMt402Tz
         WoJ15uwb+ApXMMgmXt7812J+9pwI0IkuC1jBYdIO1oe6ihpojaMQ8LLBuPdvcS2RKY6Q
         V2amE4UvbPX9Z0mrSY41kvBNbrREDwLM60b7C0VON3tqEL+2ouDpv4XITa/t4G3dRHVH
         oypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655925; x=1795260725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQQmVhv+kzuoV/3wI6+2SQdGx9hm3pY3alCduLOYJsw=;
        b=2oOhhxNC5UGQaPKQOud1Sv05eCeWZm36pKQ+We0AurnWACuhC0IsJOVHZrV5SLiH3D
         09ABFF1MXzgfFpTILc5zqF3OvWX9dNYm8kaQOIvcLtgwZx1UF01breeacR7Ce5PfARqJ
         DW3GZF8D3zsfwWl/j7PDUl3OhGumdR6lImve++qBkha1gR8m/jIFA/UiKLn6+xrB1qJ7
         rTMf3lJq7HWqNTb1s8NzQjCIxH3saPL+V8q50oIIQWmE1c3YsXgU5A7VxGaezK3FWAu/
         n/tkvgq6RHvc6blAj2hz7t8vFOo65QmNOeeHSs4Cn5SWfoai6mi+kLRKg8m+h29sOvGZ
         0pmQ==
X-Forwarded-Encrypted: i=1; AL+hErGqM/kiiVNN23GOCk0RO4sn5sNC6hl2rorPB1N6+wkO2OLeOeQVyKTOfDamjswrJnUn4C9bMlsKPxMyB2Mm@vger.kernel.org
X-Gm-Message-State: APuU4Z/b6zo7HqDofVNgreVnajGi3+JjDi5OJFHO8TrJfdlHCnbYnlny
	mOM/pgo67dSJy0+YLdUHNSCWYWwz08cEmy7mffPK0VxIq4hMkDO/D5nHDllbXbERntXToeOF+RU
	eew4skEJke+A85yM629W5U17MiaDaAbM3YAEb+ABkxXLAks/R9pipUUblhc7zeOr1Zn0C
X-Gm-Gg: AYBFou3FFXoYfmWWWDQKmCvJzDnrWgF8aloPdFc1uN1Jml+y17Z9LmU2GzGHmWYqSEg
	vh5KtnZ/0dEc1XvXHF4tWHlfMGfGn5Jsdcg8Qcvu7fpnzavk6b56h22ZbS8EbWPB02rYANPZqD6
	RfQUbR2v5DMxw2uHLfXYzBbRqdsV1TwJCWoywNRjpRtHbac5FrFoB+yxm0h/6dR/S3hvGGDQwnn
	zMU3EWHXnrh8JmZqWtiXfTqOvrtHQiFSlUXECb9CprU6XRLOT2vBY/kSmdAfyC8N4Cw9kUAi0Qw
	qYlqThWscPdAof8deiEyqTB/ruVw1SgDFTlViQodWlgIwkOjSZBV5NGtv7UJ7F01fCnHyftUlgK
	3GvK5SZhWwTGPG7eO/aV9bDg3/+v4GYp4WLORYgzxkbH5ozLu4YKow1xENWTVkEoPo8t79ULjow
	ggKEkSg3C8urq64pqzYer149GdgrQ8ULlv4rvFsThW
X-Received: by 2002:a05:622a:4185:b0:55c:66f0:5bfe with SMTP id d75a77b69052e-55c66f05fefmr24047761cf.22.1794655924670;
        Sat, 14 Nov 2026 03:32:04 -0800 (PST)
X-Received: by 2002:a05:622a:4185:b0:55c:66f0:5bfe with SMTP id d75a77b69052e-55c66f05fefmr24047421cf.22.1794655924162;
        Sat, 14 Nov 2026 03:32:04 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:32:03 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:32 +0800
Subject: [PATCH v7 15/23] arm64: dts: qcom: sm8750: Add CCI definitions
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-15-8ff2a11835f6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=7530;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=naOrccvepD7GWw2rHiX1+vICpFHGnqZKYg6wsoLbfpg=;
 b=rXus8NvuZiTv/m5iks9SVfNKqwxXWGTqCo8s/sNCrjTKECXaflXLXf5c4cKCWeTQhA/Jd7UxJ
 CnuPhqrnsXmBqS40XEdEZlsEkrmptIZi9+e6ItjuPFVuQw9K61PU2rR
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX+Y6O3EOz2XBo
 Hr14nRzM2U0ArOfDMmPGtkt3liaeZuVHajwgmHXUo6bh7ocSEEFzbb5gS5hkpXOAPjum/1tjGQF
 kVuNEdO8nYlip/5hHo8zQpZTK6Vt9SGMrYoiBBgrpi0AtgElVw8hTLCaQxWNjbxMgn8SEF4Um4S
 cJuCHCx5vxhADn20SgpQriYnGkiyVPLR9tS2wRLuvJh5qFkCtUoad5IGVvxsIiqGxy8ccoLt9H7
 beHPnf1DXQsVIMRigHFpDjWj/mFeDMVB8Ut4SOy6oOu6nr+N0SlAcvGfQMDTW59wMO/IbRXpr5F
 E7Yr8iMvb8pImaoP+PJLanghp1Oygac7llhaVvpHO0pqgxxm8hax1k/YotSt98lxZgNyZFhDzAP
 epmXPRDy9yVY4qwxiQv3O0gw+UOVfqc4amCIdu1BbMg3qQQmXr+WgOMPG5+ENF3po9it7KIUdTP
 /8zI8nNg7h/5dmAekUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX4efVf52Ejyw3
 hTOxhqi4+PEm5JBYPIPnT32QuvKDzbq75t65JpjDWjAYFtEmYIbjlo5rEeW00L6/ZCPENjNUfCG
 xwsVO5Xx+ZAdCPjto8YcvdgfF5wAY4M=
X-Proofpoint-ORIG-GUID: e2B45i6DolXAFo7bjTg_YKkWUg9w_zcr
X-Proofpoint-GUID: e2B45i6DolXAFo7bjTg_YKkWUg9w_zcr
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6af846b5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qxfSyLteW3qA2b6KDJoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Qualcomm SM8750 SoC has three Camera Control Interface (CCI). Each
controller contains two I2C hosts.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 282 +++++++++++++++++++++++++++++++++++
 1 file changed, 282 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index e91f7f8377c0c37cd54e5e91585ef58a4f8a65a0..b1fe1c2f5ae9c5b6107729fbdf31c2577ee3ebd3 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3496,6 +3496,96 @@ camss_csiphy5_in_port: port@5 {
 			};
 		};
 
+		cci0: cci@ac7b000 {
+			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
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
+			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
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
+		cci2: cci@ac7d000 {
+			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7d000 0x0 0x1000>;
+			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_2_CLK>;
+			clock-names = "ahb", "cci";
+			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
+			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
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
 		csiphy0: phy@ada9000 {
 			compatible = "qcom,sm8750-csi2-phy";
 			reg = <0x0 0x0ada9000 0x0 0x2000>;
@@ -4296,6 +4386,198 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 216>;
 			wakeup-parent = <&pdc>;
 
+			cci0_0_default: cci0-0-default-state {
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_0_sleep: cci0-0-sleep-state {
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci0_1_default: cci0-1-default-state {
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_1_sleep: cci0-1-sleep-state {
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_0_default: cci1-0-default-state {
+				sda-pins {
+					pins = "gpio117";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio118";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_0_sleep: cci1-0-sleep-state {
+				sda-pins {
+					pins = "gpio117";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio118";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_1_default: cci1-1-default-state {
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio164";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_1_sleep: cci1-1-sleep-state {
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio164";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci2_0_default: cci2-0-default-state {
+				sda-pins {
+					pins = "gpio112";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio153";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci2_0_sleep: cci2-0-sleep-state {
+				sda-pins {
+					pins = "gpio112";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio153";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci2_1_default: cci2-1-default-state {
+				sda-pins {
+					pins = "gpio119";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio120";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci2_1_sleep: cci2-1-sleep-state {
+				sda-pins {
+					pins = "gpio119";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio120";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio64", "gpio65";

-- 
2.34.1

