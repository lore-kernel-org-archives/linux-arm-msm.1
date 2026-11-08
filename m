Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143978;
	b=QOBrnxiut/Ze2e7ZjDgup1FbcJRaHYZeyKSrpBH13nn+LEQh/NaqFooEnWrYqn5/l6pW
	 AEX/E4cc/2C1NtSbV5hOy5I6mWBTF3BNTchztsrc7azSRlniBWlM9Qnvav61w3aitL8Pi
	 YIo+BMmB9VhFf7E8/yafs+LhWwLQrCDgBE4mP1usP19TGxB21IPOaqHrFB3/P0UfggqH2
	 EcRI+/xWqdO1b2OAmOASAOsMsmCYmdH/+aAQPD1mzOpyXSqgEj/lcgkum2BBj6L8Es63i
	 j+5KSvIMrJEqAV8SC1D6OVjZyrsaGu/w34qyv+mwWEM1vtN+X9hkAxtf1O/QOobMbmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143978;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=os3+Z3gmGPhuuIdUXa0F0UdTAjPYMsTLw1Ci60+60m0=;
	b=1wtHxiaPt3bCYY4up0rIWhkJH6ZwTdPh6WzGcAJW+RAJwPtV7Pii/wUOBCoHDKv2tCcs
	 pGKKUGdsjdhKTQd1GbwqmXxAmUc9mDz9XTsj8pmEmOYhXfWsfxBQDScuJ+OO79gfSTBex
	 ca8kjPizs54H7hw2ZUgCbMNn4aq6GJFT6WgOo8CteTCA1XI6pk1e84G3TbRGaEka7eNDz
	 xI+lzST7D0NApXSUMmxkcVMP1NKBYoyvxlaOJK8z5b6Ri22N7wWqZrEmDjs+VC+If0hyx
	 PJHugXIe9SyE0GwnZMe1U9fRGkVg3F1Cp11g8btzdSI4XjJnDyEk8HGzirXWOXrZk3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oqOeAZcf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X+M8Lwee;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5441606A335
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 13:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5441606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oqOeAZcf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X+M8Lwee
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8An0Fv1249028
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Nov 2026 13:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	os3+Z3gmGPhuuIdUXa0F0UdTAjPYMsTLw1Ci60+60m0=; b=oqOeAZcf1CEBgkNo
	osfPDYo2JSn6y4y7fric9epbL108442IsmosBfdD6B3zuzn9G7n1+chTak2rCo4P
	acnZWxaanxa0pzMhgcD926zyEH3ADJkBL/9gImOYXkPLjNAu7DIPXS4vbnGwqNRb
	MDIbXOrhYo4HkTxJHXOzF+APh5XKl2J2QMpHoNZTzwn7tnk1iBGCHr0EgN3m/IeB
	GdExYaGKmsFjHfVGW/N2sNhii2PWNqRXDBJdOwH+KGk5F0M6tmCrHv15GgjCAy0Q
	DCaSMr8StG6/27ncMjwFHZZM+UyDkdXSglPoXGZR8GQALPqQu6khytbj4kdIOGPD
	ibm0Zg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnucsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 13:19:36 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3724667bc16so48677eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 05:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143976; x=1794748776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=os3+Z3gmGPhuuIdUXa0F0UdTAjPYMsTLw1Ci60+60m0=;
        b=X+M8LweeeHu0BRPZnpXRxOSu/lsgE0c4EtkF3WPdg7cQ95kkkvQYoRg4O+aZDEzzMg
         y50E0qk7WL3pz3AweRW2RHVlNAYirWl/8NetZPxHFa0wZZyD4Pv3uV4n07sAptBjNC/g
         IVdreBGAtD7JVY4y2LcaGhBDtLWI0KXVyNFix3VF410JAzaSREi2AKzL7fnix8gEpHzO
         CmY/sjs0y0fRQtGxGLpT7D454AtuuB0MJRaBaemSHN+h5nxs8tWqJ/hsLsMA5sRuvwjp
         erd7WQFBLIj/RkUYOMEoV3yFjXrDVOES+ADTu8Rq8PAuhLJWkIr0XDyzpXhOxrKeFWwz
         itiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143976; x=1794748776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=os3+Z3gmGPhuuIdUXa0F0UdTAjPYMsTLw1Ci60+60m0=;
        b=DRlks401LNl5Z4Q56PNrna3dYn0imaODNefID5VWwRbm4OyKVNnY+O4/tMuXR1kjpj
         AY8Kd7yjxtI5o3XlyPomCXYfRGy5Zddq1Xv7CGZ2eqkHl4G41gp7J1xdi48uJPZAe2MC
         S21Ew75Zlrn/OUn2FG2RBnueXjiwKiM26pHuwWXdpCaqQZ58EdRq8wXbP4tJ9dE32008
         qZ5qgvEFngbSIZ6E27Bhen9Ops1PTsEDiChLVnysDqQLYSs6aYhHY/a7VTsbaP2523C5
         hdbLV4LPU8i4QYJm9tDMkR8BavezPgHT2EVsJDvFQPU1WWT/JYhkh+hBSs7mLjEdbyKx
         NCWg==
X-Forwarded-Encrypted: i=1; AL+hErF72IUGHYu7ZfWZO3vu9ni/50ZCQWEv4rq4O+jLmpTZylhBky3yJ5HiQKJxawQz70lxseApa1YQR79aG6zT@vger.kernel.org
X-Gm-Message-State: APuU4Z9yLdsqFSiIfBFr/ku2uaHoVkLnFNjU2uJ8dojw9IB8kIbEr6mx
	usWHhJUjYOh5mXPWUHmntvmb3PhhMeSWisccpJf2Dzl0qpSiN8a4eYGB5m2y+syKKIp7YZVmh1f
	YyS9oO1qV/QUt76POc3do2N4GuBf08XfB5kXgmEU3iyqsMPAcmdm19svQZXsnp5KW5MUP
X-Gm-Gg: AYBFou0YpTLVwjEdDCqwn+E/ZqUsxc1V3LU3eB4bdNidWYYSM1oTBRAjY5cKBrD7q9I
	QvTlVuVAUmPf6ld4taWYxcILqwnET/ueXzqnQxbdTWiCreqX0X6qAxu8qnj05LpUIRGCuYK5yVK
	TbGPieg9yFjfgvQwWkhHfhfQXrFNm1nCN2dQlH4YYpeZpZ4zk5d0sR4F2CohxQmiHhLgImb7bXb
	/VxDQO4syUI7TLOEYrlkqW5L75o2SOOH718kxbOcZYJEDAu+cvCF+/kncC2k35v4Q4giuBp/Am2
	lGhta1nhPEpVDX+YLyGWtEIxA4Xq1PbqEjMke/8ei714TrRrh5fvqHnBOOyR2zQkBxV7hTchRro
	YF4e7OF4PC7I8n1yZsQs1tmRbW5UE0MHpq9wtd7RX8nJkpi/jL0vYQaBO4VRMYTgx3BtVFmjlyj
	GjaVM=
X-Received: by 2002:a05:701b:428a:20b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1b269b0c10fmr6631581c88.14.1794143975522;
        Sun, 08 Nov 2026 05:19:35 -0800 (PST)
X-Received: by 2002:a05:701b:428a:20b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1b269b0c10fmr6631545c88.14.1794143974998;
        Sun, 08 Nov 2026 05:19:34 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:19:34 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:31 +0530
Subject: [PATCH v2 10/10] arm64: dts: qcom: nord: Add support for TSCSS
 node
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
Message-Id: <20261108-tscss-v2-10-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
In-Reply-To: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: iZMyaBqb-YUoxAAyauMwjcEdPPBH3qr2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX7oPVckO1eUsd
 vUsWt1EVtuKKvTBfPHIK8CvBrsUi7KayxcAho8smMw3KhfWRWNzQuNeZFoHWTJ18hx/Kj0KKVw/
 POXPdwMvS5deFQId+vJwiy0Fa4Mpxs4vryqR6EhWt2NRx3cl7SY1LwDCjJ3tRZqo5m5pHhYwchL
 WDhzMC5iY49JlwX9p+qkNenZJpDhOYXcQaiEOuf/NyBaOM+cc77zCAUk/mLA8TgxLmTsBqgc6Hh
 tky/gM89UzQPDVlYemEUR02VLvjSmNwrQj5vAV+r2YqSIMgV2O/3kEzMcjoauCQHZD+cOKShO+i
 +CBQoya03KQ7n6r8j/hAv/eH4q28dyJFuBK8TJ7mAJRr6wg5LDMjW9L7KICzgB+rsCZVvDqSPJI
 ybVGvf7rgoOpQEVw+HMBlAg8axgVXJpnokDuCQjZ7kifZlJHrzNfYJUNnh433b6teabcu3HBJYy
 ZnXDGPoxRcOT9OuslJQ==
X-Proofpoint-ORIG-GUID: iZMyaBqb-YUoxAAyauMwjcEdPPBH3qr2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX7hObfZCS2Gax
 5olqU7Fyj50za4jwf7eBlOW0SBBWxe9j6A2HJzAMHd0xSf1Ms6e2vh/aE2vWO9IyHZwFvs9CcHJ
 1g+QENmqa7d98Mgor8x4BEJ21pxjMs8=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af076e8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=CYmVgZtmzWouJOFkMRAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080052

Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Nord
SoCs.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 1ab7d9bc3cfe..1d5f27336f73 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -736,6 +736,20 @@ pcie_data_inbound: interconnect@1c00000 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	ptp@1c80000 {
+		compatible = "qcom,nord-tscss";
+		reg = <0x0 0x01c80000 0x0 0x2000>;
+		reg-names = "tsc";
+
+		clocks = <&segcc SE_GCC_TSCSS_AHB_CLK>,
+			 <&segcc SE_GCC_TSCSS_CNTR_CLK>,
+			 <&segcc SE_GCC_TSCSS_ETU_CLK>;
+		clock-names = "ahb", "cntr", "etu";
+
+		assigned-clocks = <&segcc SE_GCC_TSCSS_CNTR_CLK>;
+		assigned-clock-rates = <250000000>;
+	};
+
 	ufs_mem_phy: phy@1d40000 {
 		compatible = "qcom,nord-qmp-ufs-phy",
 			     "qcom,sm8650-qmp-ufs-phy";

-- 
2.34.1

