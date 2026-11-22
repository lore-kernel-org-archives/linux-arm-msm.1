Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795329982;
	b=QosXQbDUCuDyayuQvdedBX+o++6rZzCSIR/GaF82n+jXT+EXtwbN2k5TOuEUAcjNMjl4
	 qzsYGdulNdAi7hg/mFKP2kCoYqPiPX6hF2VxArD6HZKMygvlUaSKJKm+4CoMAdZdjE+Aq
	 fmUc1bb5CUcjMYilV5jk/SlrtZC1HrcOoZH3pm5rMYn4b9DxH0fWSlCC1kuvSbqOmRVpE
	 1vD0miLI1YJAxYzMg0p6QsKGiwNFTyXqDTRkzKfqMV565/ZNsY499RcmCinKCBibmxvsR
	 Z6gtFb713jYnKTP3Zria+M40A3AMCzNGXnUeWNk1nXX9n7ArYSjp7/DYGk3Hhjh8YiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795329982;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T2hwzlMo9LCIhFKqcy+WnAbtHTyj+Ik0hC26DXdFkAA=;
	b=E7AieaCIpcj2tzm/tpHywInRkp1ewr2N726KUGvYGf3FuAjzZO5aXV0mRUozp0z1wuGX
	 vZz+vho6vcKycA0N7KKjCrnNYAppb7JV3XigMCoHo+eberNVh2zOTWYPHL29ZBk66XJTo
	 Kie5Ze5NFuHMLzSOB7ctP7N/u3OnyQ6Bj7kdXqShV7o3yZG77iNO/lBQRNA6jl6kG6Lro
	 FG2UbWCwKarm6Fh5lU9noMwRM/L12sCvd4z4zBxWXvb6B/gi24ZrLktptuxzJ7C7cGt04
	 lsz8PNMdmOzSM4jECuNt0vQJL1Ci5i0FXmtA3I76W2ASWzDmpi0O4Ea3KNDk4j8oM2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LsfZZWu+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TK61b0c8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8836606A685
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 06:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8836606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LsfZZWu+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TK61b0c8
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM5UKWd3551828
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 06:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T2hwzlMo9LCIhFKqcy+WnAbtHTyj+Ik0hC26DXdFkAA=; b=LsfZZWu+YdfgIrH2
	Iegjwju0OOrYTkgJLKR8LbyqlXyDGSDloEDfcc5Tu91EUl3+CAakESqAG2TdEpCa
	9+lYy8oHhAlDTUs+Qdz9TH4Nx9OBNWaZ4A2g7m5TPGfaQIVf1OePi7ShwRkWenFN
	d1UtK8PvUkRSDD7Sm7IkMVQigJ3KT9w80lF9ThAYSVcu53nuhZTUtSo2NLkuqFxp
	AkpEUnz7V/FSpzjq5HMmQxmolRNA5QUqO0K8qEQxdvmjxFytJFL02IzH4syCIuDh
	GoZbyaHBwIMp/SOFyZsfmwMfuBjtfFMug2Ydn9vFyxg7sZ8hWVhparVv533OdLl5
	ARP/EQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j310fb532-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 06:46:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-38131260a5dso6308532eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 22:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795329980; x=1795934780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T2hwzlMo9LCIhFKqcy+WnAbtHTyj+Ik0hC26DXdFkAA=;
        b=TK61b0c8iBVlnbrdhc8BzLOSPoDhu6Md2Ytf9hBXeloBPL0VUwORqibZiGAcmv8fFO
         7W/Pl3Kgu2+Fxluyy0IovggQgjikgc9uOmqMQnomCoAUiUxyzefykUkaTkO/n2XqJwVe
         sEuBhgc+EXAQCwy6jjdtm3RVIYDwlDkshtA8R6K/TOChSERgB/P+y45BB8ekMssbtQb+
         xFu+sbP/2wKAC+ZW5HDoyr1cU562pDKuP1SvH0BIrndMCKTdGoVDcbZgO4TYhLQbxw0x
         y0soU3SD/lt5rhmllR9A9FjVtetR4lKf2Vg1JPaGgQDGJQE5tyFsVdrzNpLOEz5GtaZ4
         +bQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795329980; x=1795934780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2hwzlMo9LCIhFKqcy+WnAbtHTyj+Ik0hC26DXdFkAA=;
        b=yOnfo2ZvDjoOOjNTXyWF0OIPVzciOM7izs9HZcU3CLRMVTMcU49m3qAFRym66LeMfy
         SNjDVT6+FTZ0SR+pr/HvLIoYkqq1q6q3FbNYysIFMRnnk34amPzNb2Z1js4rSHMr/kxK
         sxYh4DFzDK4WT0RKJt+DPAtOQ9a8byGr7lPdIMJxeguYvpfG+1nJNWP4J4exKudkHxWI
         9lsOGMw8Tm3Q7IkYVaq1PPKEQNL+05cMOl7DQbe/lrn8YReqPeGIwrLbPBm8kONl1WF0
         T+4lgyX7pXF5UDmnGyvlxN64fqP7y9nCGSaan+GB2wF1XirStAg5XC4hTDl7AvhxBLsw
         PE0Q==
X-Forwarded-Encrypted: i=1; AL+hErFIBIN9+o22IoPupWKCFPktullMFALz4Ut1ecTiYzf8tChBtJH4cILjKmGakBR6QQjkRLRjrJxC0jX0Y1P8@vger.kernel.org
X-Gm-Message-State: APuU4Z+Wx0VBZ+47iSf2NhAJOlvHWLrhOdll2ZWvKNK+KwaD9H+yb2KR
	JjYRX44+b4YlmiGWCpmvL/c8vbe7YuylVD36TOirMbfyBZDPCHVdYMhf9D4ZH8f56h28WnQ8SWK
	uHmqmlBjOW1zmr4aU7F5ViVjU9+wHWUGEz3OxSk8Bz/Dgp1N7YP2RTPqNf9dcf94+qRh1
X-Gm-Gg: AZFdTZfB4ANucsVJW7gJjzrdFp7FA7uhHGEhO5kXx41jVLTJGyUS/5rN+GoiYJVnXoY
	9JRIl/xsMJ8NKahjMlLOZ1DjVpDZjTMuIWKa4iXvqYq8x7tsRee46/V60cn0u5J1rOGIU4P1rNJ
	QCDbYKG61WBAuBQAuvKmlRxunVjukKfYYxkjaNYa9I98jFFQZWI8ix15VusvDZKNwRWkcs9ozih
	sIMkzKsniQVvAYQd/GdzZz2swG5kfSuboeV6JgPGBkq4fcg+/DiKM4arptgqQfbS2DKtqWKTrzO
	6NsvHiIcuHAVS7Bo7UgVdpSNNA5zgrYPG3ADrSyVMe+aThfRo8gvuX+EzKnHjZ2HJVdAUyQ6COy
	cvayby0FnuUgHlWnNr6qOrbiewEee1JaxOsDvZv/j2pIR/9ZRjfgwu5QlXKlEwRwMVCpU/bEnf1
	fx2fvbW74S
X-Received: by 2002:a05:7300:8288:b0:384:f214:a408 with SMTP id 5a478bee46e88-3857044f2ffmr8905145eec.38.1795329980505;
        Sat, 21 Nov 2026 22:46:20 -0800 (PST)
X-Received: by 2002:a05:7300:8288:b0:384:f214:a408 with SMTP id 5a478bee46e88-3857044f2ffmr8905121eec.38.1795329980032;
        Sat, 21 Nov 2026 22:46:20 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm27598615eec.10.2026.11.21.22.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:46:19 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 12:15:54 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: nord-rrd: Describe the PCIe M.2
 Key B connector
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
Message-Id: <20261122-pcie6_fix-v2-4-2e0fe615d90b@oss.qualcomm.com>
References: <20261122-pcie6_fix-v2-0-2e0fe615d90b@oss.qualcomm.com>
In-Reply-To: <20261122-pcie6_fix-v2-0-2e0fe615d90b@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, alchark@flipper.net,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795329956; l=2116;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=xSU3owBM0txchkN3zsSOuMouYuY186IHzX74a8nKw8s=;
 b=LYm+5o9UAUI8UWrXpqljfX6SY+ut9AqqZn291W8ecTKj0wkOtXq/jb1fUcTPjNXSwpQLR2gaB
 sbkBZnRlP2uDiMw/ZSgBxEKMOyxnuN4sk8q70Lr1TGFdxZA0ZaxVyJK
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAyNiBTYWx0ZWRfXzJh4rWM3gID0
 /+rCBFipXdUKeahBzKV9+8qHlZLfutg9fYhn9PXJG4ptMICn0pxRsMSgevZhqPcYf1bjJo4bk6l
 m1aWGQcQ1+OrHyfRoyPAJhyXRv3jewcLr1vd7q7azTWBeUrlvdrIYoIpTOgHZs4IJISaH6mOELI
 3aGys7XVDkrG5kA8XiCn2089SgjtIbt2M/JMeSGt5kWQbpzaX3cyMDP694LAJKRs0k08EjlAEmj
 nZwGHMtafLF+U4KcQTRD4Ce+1aKPcgIuo92RsW0iPWuQIt97wm4W1l+NDJge+NPmitnfBxBTB66
 NPUp4b8Gg4hAyBRvhy3PlNi9STD7Fzh3sNd6MZyZF3se11I0gboEaUpD1/Khymqx8GPKoGTWXdR
 ogYIh3JgMvN9879UgMshhMxYFlnX15Qf41pMUdXfUZQcExD+smbF9gPAE6NKKx419CR8gslPIVZ
 w2t2/W+ixLsyQhIqKDA==
X-Proofpoint-ORIG-GUID: fbStvu8T0AvpA-G6NE_EzdNsQARo7cCM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAyNiBTYWx0ZWRfX4Ap3qZosqzFo
 x0ruuLz47VoQNJ8TbhhLVjxmjPUkD12GgQV6I1zygdo1uJktRkBCO7Qy1tySsS6H73WqN+LyE+o
 6Niu0gdkWTKEEBgPlSaBtj7hJzN9tNY=
X-Proofpoint-GUID: fbStvu8T0AvpA-G6NE_EzdNsQARo7cCM
X-Authority-Analysis: v=2.4 cv=UN1Ijyfy c=1 sm=1 tr=0 ts=6b028fbd cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bvY3E1ByFFb03tV5gjAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220026

The Nord RRD has an M.2 WWAN slot connected to PCIe3, but neither the
slot supply nor its power control is described. Describe the slot as a
PCIe M.2 Mechanical Key B connector, so that the slot power is
controlled through the pwrseq-pcie-m2 driver and the PCI pwrctrl
framework.

The slot is powered by the vreg_wwan fixed regulator, which is enabled
by the MODEM_SW_PWR_EN GPIO. The MOD_FULL_CARD_POWER_ON_OFF GPIO drives
FULL_CARD_POWER_OFF#, which the Adapter treats as asserted when the
signal is low, so describe it as active low.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 827d3ba3a238..59a0210e7fbd 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -100,6 +100,40 @@ vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
 		enable-active-high;
 	};
 
+	vreg_wwan: regulator-wwan {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_wwan";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 54 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	wwan-connector {
+		compatible = "pcie-m2-b-connector";
+		vpcie3v3-supply = <&vreg_wwan>;
+
+		full-card-power-off-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				wwan_m2_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie3_port0_ep>;
+				};
+			};
+		};
+	};
+
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
@@ -537,6 +571,12 @@ &pcie3 {
 &pcie3_port0 {
 	reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+
+	port {
+		pcie3_port0_ep: endpoint {
+			remote-endpoint = <&wwan_m2_pcie_ep>;
+		};
+	};
 };
 
 &qupv3_0 {

-- 
2.34.1

