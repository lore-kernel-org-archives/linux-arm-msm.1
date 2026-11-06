Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956912;
	b=YS6P7swH2n3lFsCQJL5hINZ1uW27nBBmJREldJ3kq1OW6W1p9bMvy/NAZfa5bbFyMTpN
	 P/X0w8+EL3ZQ8afxz2nrVW2Ff4qpVcl9cWotc3wk5IxmZImmmk3rKeKb3MwmpmX/A+eaY
	 jJuGijTQR5RPw0lR5vF/uiC5/SDX8iFqht6RkYjRkTWUkt5+/Ak7XQ7M5OIxBkNIsmsD8
	 NgCYZbVAmXazE6Y2+tTn4hLtghla/Ogq2dvIomyE4V6UylP2szpae3TG8nCwiMifNwfpn
	 x50QXHdVXpxTTjXZxKyCVolxfR6U8HnOFqcOscXwLaKLZ5UhRLplIf3CgsIBVm7m9Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956912;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/kpOyvftGfgApBEnhOqKSrtQQtbSnux34PBpSu7+OQU=;
	b=RnVp6Sd0aXq+bDG8ohPjMHffh7lHNiE1ScY8/Ja2nnyTfGN3BbKTYmGmT7syUmBfWJ+s
	 f1ca6vIKQ4X1aXQkpeJHpJGrubNtoE7F9QNK30SmJwz3W1pDafol3Iov0CuqL45pd3WS8
	 N9rQboCmK68+Y1MUz4hxhG4Mtn8fMYlopGsv4BmaLqLV5X/Qu/q3LwKUKpl+mgVU/u4M+
	 b8goH+upBQ2f9LN0fo4WtBLYokFRgMaSpzfrrtlJFf07uRnNkodwSXqg7fMVRe88yCsb0
	 /1gu19/xtC9UkgGz4h0RezwjiECuDxBDI3bpZZll+g6RL7Y6bGt4lCJRUcuxruX00SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xo1JhVKX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LSDskfeN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAA9606EEA3
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 09:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BAA9606EEA3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xo1JhVKX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LSDskfeN
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RJLR1679504
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 09:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/kpOyvftGfgApBEnhOqKSrtQQtbSnux34PBpSu7+OQU=; b=Xo1JhVKX77fbpcrO
	aera62y9qKBPU5VpNd/JzPwbOb8Nn07lhqzhDBCtvdEUogEyP263nIpZ9T7iYwFM
	OObAR4Q8cb0ViJS+90OiMmNVjqHg2K9nNujTx13txPnbpqrSUWTUZcdMCuTKQrau
	hHJ+zuEFabU7cDEHBQt8PJ2fV4mYMj+DooKeoVKp6byhGGRO8MQBsBqy6uO6zx0m
	27njwpooKpfnjL3wAAllP9/pkrTFni6itZLzOW3q0KLViN97CX4WntUs0u0Y4pDM
	/XLeTd9ND0m8ZzKEMluxOG6+8ZfBxg+XenS5p4Cd41OpcbHxDi5Vr6sfJfwclCJ8
	UwnzFA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pca2r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 09:21:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so1005000eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 01:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956911; x=1794561711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/kpOyvftGfgApBEnhOqKSrtQQtbSnux34PBpSu7+OQU=;
        b=LSDskfeNl3peHJLEKbnjlMaPX88OOoSx/SPIKg3FHptlz4UswbpnLOWBkdO+GhDYFZ
         c26g0SMGYxzWdEZQvqcqEYjw11tND1WnsXuwUDWqopcUPGDvBv+3GFL5wnMVS4I0Mjms
         1T1vzkzFeNwtVLXy9CxXKtHZsyRd9xKRKCaTRrTmM+1XiErXXtKwXWPZ6UUiZxttJTDm
         GGmXkhuHV6OAVsWjo9z+QGLFAscF4j4PDbXFKLGuHBbFMNIAHt/c8X3AWi+UYVsaFMYj
         NL/GmkPGJ4Ba02G1tqStM308ew1QdIWXXky+b1qMGHZVDWcote8uBIPfPJg24fkMwGmZ
         QzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956911; x=1794561711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/kpOyvftGfgApBEnhOqKSrtQQtbSnux34PBpSu7+OQU=;
        b=0PToK7voIr8YpFKFEcNwzeYJEDJpEELrR7CwLBe7oWNyp4Rp/wlIpe9y1l/1+i+RZB
         ZXSzbYamsj3yzlr4JaPPQizxfOlky5ME9S9re24Xfm+jCZn0ugg3QIzuWBUvxoyyCf3Y
         3utGwSCUeOiTEer7w/+pJpoqa6jZh52zIL6Qr0mDhX+lCNzlDyxlv9WaBXRMtZqL9Hu5
         d6cF5uXS6mXBfKlMyVrE6TTchPfv9OQNofXdBZHAP+VI9chznXeZXnb8LFFHpAHrZH0a
         X4XE4zd/2hUii23gQq3j1pFevr9hKvuxBhWmAkQy9C9kdJD+ifES4vBXBPPajUq3aDi5
         5eaA==
X-Gm-Message-State: APuU4Z8JbkjJM8l2+G6dvHyT5n0VbimbR2KM1scOtxvG3L3vl3qr1FSP
	t1Mcb2uueasEq07oITHBP/IVwKTdG2hXRO/kwF4bq5+s6XBzLqU3fJYmofc5kCcTURs1GrMnEti
	YfxVfzLKzZ+UswjVSg7HwubJEb8DNjRFlrdkiGSnuHqHGhkWyl4JCb2LP6Pcz/bkFpY48
X-Gm-Gg: AYBFou0d/P75WCOsQLXxy++IwPIbA0C6U9Y6I2V6A38cgSPeRPjhcJkvi1BxNOV9euH
	UGMLE+pE+Ia0gkoEfwjp8cwR/e7zrVQJqTcpN2OsvZ2220cuyB166H7ppPgE3WzF58VtJKZ86Pt
	gBbyvyKmQxJ8Gi0kfkygDUgcgRgvB4CBkJFndRClCVAFmqljL4xXAgLS4icjv2nqK8hHlBj9v+c
	iR1m0N6/iQ6UMe/x1sV0VzJel4wwzegjBaKHlbKB1mGcULhdqx9Andaw1Zs2jza4b/81gIdfWQe
	KN05joYLFj4ntqBRQAOLpIJAmTuWUGGjfaaJ5MGd/unu+Jws/ZC+KgUumTCAhOZMgC1fU9EoTc5
	weqh4j4QKcR73MUfgzjwpqkuQKel+EoHjiJbTJ+qWz3o6Nv7zlzjG9diZeifuKsvb4aFISNHmZK
	Q9FsvhJD6vUbgkgnZ1UPtJCHswy41m4O1OjGJWORZdZpqlgkXgZvLZmK7p2Md6FNEYiYzmseSWd
	/VQ3g==
X-Received: by 2002:a05:7301:4d0d:b0:36e:ff7e:e57f with SMTP id 5a478bee46e88-36f75e28a16mr2454541eec.19.1793956910693;
        Fri, 06 Nov 2026 01:21:50 -0800 (PST)
X-Received: by 2002:a05:7301:4d0d:b0:36e:ff7e:e57f with SMTP id 5a478bee46e88-36f75e28a16mr2454512eec.19.1793956910018;
        Fri, 06 Nov 2026 01:21:50 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:49 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:59 +0530
Subject: [PATCH v8 10/11] arm64: dts: qcom: ipq5210: Add SPI node
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
Message-Id: <20261106-08-dts-v8-10-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 0tefsR54s2QuJptR881gYMdvmqOlfXvZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX87/0nF8IWIbD
 I6l1BHMrZlostGCHSE0HomYhAVbyBLs3fJIWTT0o/78aukjpLkT+pwN/1NED23CUimqohBVCgfK
 vxRjrjCAl+isuvk4pV7CZX1qelLAG2V3XZFRmjQLN1t++Zg/98oWVNeM+MTe2fBDqMAmvbcRiZN
 EpRG13Z4QnnGlRPzYCG+EyIcnNm44MxMaBm9PvRsMeYgj4r+3eYRMvnPOvZ2QdaBqeqk3hsnYIC
 yz/cTUm4FIHpo2X9iiXGZjs+VPci3DKpmboBG8gAKmWCk3nBNxneGPpqpDWt4KG+1gAFVWXEnCQ
 GngyX7kbpwZpEh7VnF09NQ9Yq5saNDxd/LDtCioAw/KBE3SCFv0+AzZyQsLdVUFeV5qkXbUCxou
 vcET9ZARJVnlRwiJtKluZFXIJevM9IJp7bEvAIlTfhxrmz381WUGAEuAItW/sqkrB8WxRIXHEm6
 eJUXjdS9bg3O/XxzKEg==
X-Proofpoint-GUID: 0tefsR54s2QuJptR881gYMdvmqOlfXvZ
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aed9c2f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ll64UZJxbc1SGzsXvscA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX21NuvSfTTePZ
 tL8wRlRzIW9FmvYBxdTjhzoRDcvp8qbK2nkPdXYDTcRo3rf1R2Y6B7H4kWHs3Q/m7u5rwYI7K4j
 gMcr+qeZjirx7Z44e1elLFEauWSAShU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Add SPI node definition for the QUP SPI blocks present in IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 35cd55881969..61a58fd5d4ce 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -168,6 +168,14 @@ opp-32000000 {
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
@@ -434,6 +442,18 @@ qupv3: geniqup@1ac0000 {
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
@@ -470,6 +490,18 @@ i2c1: i2c@1a8c000 {
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

