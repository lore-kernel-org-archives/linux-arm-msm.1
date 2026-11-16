Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812943;
	b=ppEZ56BSMKelesFWGFH1zHx5uUE40BBCCWqQ2KAA21A66McM/7lcbKWYUrJ/g41diU5S
	 XnSYrgBLh1zFfe+lZxXpypxor4a+2/PIOn0dEiM+cqxo2pPCYsP5g+dyAusirdgMGLrDt
	 FHIZ14a96ONYP06h7Se1tYqqp3TcYId86SxoyG7WW//Rdkdou/0YpUtFhmBmCdduh/C7x
	 gAtVDBAxfEO3G0Kq+I3W7Kt+QoTqxiNOBu7nDqNpFmumM+TCDssIN5xjfTJZweIOdLKtJ
	 V5IJHbjbrV4D7hZdcebgyhDbJLxqyVgqu54eSDqcSY0aOPyUFYymJHcKfNP76H6PB+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812943;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9WdwW0PxcdlHIuh6wsyIMEhMeQ2NP8tLx3e3xYrc0iQ=;
	b=AczGGwq7b8OD7J737a5aIukvAcXoq4+2lrsG/lhZqY21JuCQHc/ardTvGN+tDRamWihH
	 mvK131xv+gAsU8wGTvgVejKblFuxB0IokABMedLQuAE/v88lMjBEuwe536Lm5gaSeYzZD
	 dsx2pEWlTL/zb8I/TyOHIVNAHJb7dInAhMZkpOck0zEUIKho5ACv+MKfCPrQ2uZpwG0j5
	 QP64cWQl6hzbOLqDDoO44hLkrOhq2tDtQhkTAQhznDJL+CHtcw9m4tfthPTIwcnbOcJYn
	 dtxLDftbzlCjHC+ldc5lBMkQxHlm/TxHxGJnYFcifWqvwmiSO4W1QstLJZ8pXRCv2ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZH8MeQs9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=edWR+TJ7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C160E606A323
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 07:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C160E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZH8MeQs9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=edWR+TJ7
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LmYY592524
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 07:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9WdwW0PxcdlHIuh6wsyIMEhMeQ2NP8tLx3e3xYrc0iQ=; b=ZH8MeQs97Jn+Nz7j
	oQXiHB4IkGURaQ8uD+A1xpdIhyqr3dFJIZKT4L7kqlPig5xoeR6JA0r/asWKYhJB
	D5jFdJuSbWoN15p31ZxK6Ssl/n1l9zmxe4JOXL34RTNZit1nGG1bzZG0xRSRpGYa
	7Bh/vGGSPgv/8OqLb7eluzdXznsvZ0FDTfaGMPczh/zTq7mmNidU/xrcNYzmjVFc
	ghixAsQypLshPo03XZNCxZsdlOqq6TI3kqTH87dUI+FgxB6gUMvCEF8eJS8owS1P
	CHwMQMF2wJDd/cAmu5BXC6IAuv/xvbMNpDN1U3/jnJlvjQaZqq+Ji6kl0sgf9a2y
	yv72GA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjwapv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 07:09:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a528ca65so2610694a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 23:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794812941; x=1795417741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9WdwW0PxcdlHIuh6wsyIMEhMeQ2NP8tLx3e3xYrc0iQ=;
        b=edWR+TJ7BkxF99l6V7m24S/Y5lqvWA+S6/1v8YrYnBqvwHOVRr9bd2S54ESoceHamS
         CB5r8ZBXTSJwuvzRm8JY4MP7ySwOdOU0ud9S5bB269YVyokgSvLBU4EA11lvMIClzjKk
         vBZ4Q/aMEXqG9JLkX2WDzJoBu2g9t0ieOrsE5yTXc0dJ+XE62ippT+LxWcJ1ron20JgN
         YdV0QznlbpOHVXEYcBD6Ki/g1TYL7J1XgiIikDtpD+BAjlHLqLUPTuIPBZ92j6m2P00s
         b7HAW+AxFaGNQ135E4femHepm1lM2GWn0/fQEahJy6Ogho897Vew3ch6iTNkTlRYpJUy
         z+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812941; x=1795417741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9WdwW0PxcdlHIuh6wsyIMEhMeQ2NP8tLx3e3xYrc0iQ=;
        b=WupTU5pN0sZgld4+/fFTWzQgXIHcHFb8fGNGZ9Jtvu0kHk4eGPNnnTYmxU5RAjg5HJ
         XVOrgwlpDN4oc3FZWho1hLOuoOCOdqA4ifmTIXiq8uYmu+EAJK1Mb+sOBZAnAsPzwv8w
         qQZ2hgZ1v9hDb0cl+TZd/QBygFoJJGK07oJw6bmVSI1ezl/rpd7pt5UjUWgFZncUJ/uR
         WL+GaPk6f47eRzYVZHkMKA4VOdj4m4P3nqXYEITZZ8LDfp23NaTWH04O9WUdNVvBWgEz
         Z1Ln3bOGLR4lZoQU5HF+7UD0twKe1dqXh1B6rpYH7k2IxAJKYqzGNhWg3ISsKB40ufv0
         JSrQ==
X-Forwarded-Encrypted: i=1; AL+hErFCww6rRmz7wglQutT5tXVBiRO90vP6FUnmkiZVbnvi6a5Y4feXjuYere8vB0bH8KLi/ELBRv3XVY+O2Hx8@vger.kernel.org
X-Gm-Message-State: APuU4Z9R2KgzzaMAYjIFWWgJDoQQuqsq/8hj93PY22rURHxeUmuzcQmp
	qRcoeFDgZAaqMU02iiij1vbh/P+l45B2/7TyGxa51z5y1PmDL9QXaHGUIEqg05rWxmEC2vJmsrl
	Ph6nnaVjLjh6gdkKL4OUyrbS4dyf44W+wMuWQVsZAj9khGSXEzPAf1wmIXk7uH0FGDS2t
X-Gm-Gg: AZFdTZdOOAHhRdqF/Gs69clCkPamczS7x/FpTH90e8zhP37wnkwLyCF987VYyEdUTNl
	N79zKAkMng/S3Df3I//PMoGgNYsJMX/3yAOYWV1EHDhGZc8XPAogDcD087G+1kHA+ikRl2kQv1e
	wDA+bdMQETFo5mEoeb7FKclwsdBeWQq1iGtQwI53utL+HLTUqETX2VPy2hnklRBsUhDgjT5sGTY
	q7rugIh30VjpnKkk2PtliQgrth7AGiSUX0jTc8KOu6yoO6NdgYFfsuSV28gEotoCDs1ZkIY1M/C
	/4ec90ry5TRw2T0/3kpo07vBT3be2MQEzYyHQYC//5g7NLB+pQmFB+yP0ysUJArLtw7U1KhoXNV
	V0QRwT9eL4+vJmPGmM42+OTVA+I7CGpesydQwX5qL1ON9FaeDQ0+GvRI/XzHJ8bTH2H7g4Fe6qw
	==
X-Received: by 2002:a17:90b:184d:b0:3b1:6cab:f68b with SMTP id 98e67ed59e1d1-3b1b0a0e8dcmr8498750a91.11.1794812941447;
        Sun, 15 Nov 2026 23:09:01 -0800 (PST)
X-Received: by 2002:a17:90b:184d:b0:3b1:6cab:f68b with SMTP id 98e67ed59e1d1-3b1b0a0e8dcmr8498723a91.11.1794812940978;
        Sun, 15 Nov 2026 23:09:00 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b1e9ef15sm8658667a91.0.2026.11.15.23.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:09:00 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 12:29:50 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: add Shikra PWM controller
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
Message-Id: <20261116-pwm_qcom_shikra-v1-3-67ee4553adc5@oss.qualcomm.com>
References: <20261116-pwm_qcom_shikra-v1-0-67ee4553adc5@oss.qualcomm.com>
In-Reply-To: <20261116-pwm_qcom_shikra-v1-0-67ee4553adc5@oss.qualcomm.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyOCBTYWx0ZWRfX9eBivMv3Cjok
 H5jhy7xEzqJ89/pEjJEFO1cFt5Sy6uUbNSi8CM33cBn6zn+fS/8tiRtJZ+a/E6sgIiDQS02sZCe
 spOPALyLhPIzZktMxei5jbuGywLD4hDO2/GaF88VlF2JmCklFCyD7F1WwY8ZrYrzpElSSl+x9R9
 u+WLTNEYCPRDECM4z406q/mDGhUYIdpI+b1c2UbRdutW+IyywuYw/ExXzZZ6BjTEHfJ6CNG6qNi
 ipgOmFIc1Rk+mrvmKPwFhzPOzqQt+rVz4cejtBWcYiAR6w1Zoa8h2cDKi1XhJKnOyRAG2CKFquD
 osKUZx/npAP21G5NLYGR47+AAorxHgRnTpRI74T1wRs4XiOCRGy7HbVJ7XVx1f/wNAEG6weZFh0
 dxoC2bWBZJ8kQwSVLQpAWy0x/uzQ6HfX33iuKaG1cnSXYiZKmBlWBKjYPkpivDhEqodn+4mB9Rr
 q+oejxkHAenwE7lx87w==
X-Proofpoint-ORIG-GUID: ThERKnS-zmWfHy8N4cJ4KHkjUPWPMAFo
X-Proofpoint-GUID: ThERKnS-zmWfHy8N4cJ4KHkjUPWPMAFo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyOCBTYWx0ZWRfX4DfbRfHo1RlF
 AEiuIYx7w2d7TIjOBtAgquKu0XZNwI8VFJpRbbNUu2RLEuYf0HcuoxaNn2rcfMlJ3ZWF/pv2UqR
 LnrE/TDACPrLOpfdfTqVgV93MW9Ity0=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6afaac0e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jcq69FRwgK9YgyupxYoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160028

Add the PWM controller node with its AHB and core clocks and the ten
PWM frame child nodes to the Shikra SoC DTSI. Assign the shared PWM
core clock a rate of 9.6MHz.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 63 ++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582c643f97e2b0725eb88a9f262d83c..d8a3de38382bdb00684acd709f4d34136792771c 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1303,6 +1303,69 @@ sram@4690000 {
 			reg = <0x0 0x04690000 0x0 0x14000>;
 		};
 
+		pwm: pwm@4700000 {
+			compatible = "qcom,shikra-pwm";
+			reg = <0x0 0x04700000 0x0 0x10>;
+			clocks = <&gcc GCC_PDM_AHB_CLK>, <&gcc GCC_PWM0_XO512_CLK>;
+			clock-names = "ahb", "core";
+			assigned-clocks = <&gcc GCC_PWM0_XO512_CLK>;
+			assigned-clock-rates = <9600000>;
+			#pwm-cells = <3>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			pwm@4701000 {
+				reg = <0x0 0x04701000 0x0 0x1c>;
+				qcom,frame-index = <0>;
+			};
+
+			pwm@4702000 {
+				reg = <0x0 0x04702000 0x0 0x1c>;
+				qcom,frame-index = <1>;
+			};
+
+			pwm@4703000 {
+				reg = <0x0 0x04703000 0x0 0x1c>;
+				qcom,frame-index = <2>;
+			};
+
+			pwm@4704000 {
+				reg = <0x0 0x04704000 0x0 0x1c>;
+				qcom,frame-index = <3>;
+			};
+
+			pwm@4705000 {
+				reg = <0x0 0x04705000 0x0 0x1c>;
+				qcom,frame-index = <4>;
+			};
+
+			pwm@4706000 {
+				reg = <0x0 0x04706000 0x0 0x1c>;
+				qcom,frame-index = <5>;
+			};
+
+			pwm@4707000 {
+				reg = <0x0 0x04707000 0x0 0x1c>;
+				qcom,frame-index = <6>;
+			};
+
+			pwm@4708000 {
+				reg = <0x0 0x04708000 0x0 0x1c>;
+				qcom,frame-index = <7>;
+			};
+
+			pwm@4709000 {
+				reg = <0x0 0x04709000 0x0 0x1c>;
+				qcom,frame-index = <8>;
+			};
+
+			pwm@470a000 {
+				reg = <0x0 0x0470a000 0x0 0x1c>;
+				qcom,frame-index = <9>;
+			};
+		};
+
 		sdhc_1: mmc@4744000 {
 			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
 

-- 
2.34.1

