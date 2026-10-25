Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792935819;
	b=UTqACyhsaoZ69QZLXMmXfCz2V2GU+13l4TiWsT+rPL1PFbBQjZ5Y9OpoMJp7QmEGCKwN
	 +WH8u2LfbyRKsG7jB1fiuSFe9Ze2j88XwPmTqv1pBECD5NKIfzFv56ljV11hqKorxCGvK
	 B9HP9cKseRiZ9CSB2Zm3ngb7/KT53BwBT2EoRxz0fWYcBCwrrkTPr1LJHuwXmwX/7xbna
	 vsOqu2W496gcPTqKVBDIKeobl6c5KenVl87nrW4bgWoqB/V4MS5K1oR0Dt4HkMedZsp6g
	 i/WadxOMuqspDFhaKrpwyQbPrnusR/d+XYSwVttAUSVhHy+BCA1+gOwQClI0BjOnDbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792935819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZyVPnIb0kULpM+/plCk3hw12bg0v06X7Bexcn/YYCWU=;
	b=dYWT6QutqedSsq2PQuCRLYlaLZbyPqg//0GEMuPn8wRd0r98SJupWalBYNEkkVlhoA68
	 0ignumziLW3UsPlwel7roiRI6dwz85stkni+hXtCAw5K1wRXl7oe3P8scIOribUj9SSUD
	 TX5IJ06L8owN93jbQyEg0L02r4fjkFM0f2TJHWm5dVJw2j053xMYToFKusKIkh/QNQCD6
	 ULKepTbMGwZ0NNlfXITAyJaeSDKFGzFWJO6A2TUTp+umse6kzPu4uTBo0Pf9kZvcem4fy
	 cUlMlq1Nb7MzhZfQcK/yQliqz42TN3NN1S/aeRJ4uR1KPzy/VSzQ4/VOnQs/bHsPYmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OCo3xtms;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kZW+bZ2V;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0C6606A31D
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 13:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED0C6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OCo3xtms;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kZW+bZ2V
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69PCkwOR1379370
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 13:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZyVPnIb0kULpM+/plCk3hw
	12bg0v06X7Bexcn/YYCWU=; b=OCo3xtmsi814QbP993m3HWiNttysUi+BLzs3Gz
	lLVS+87bYkFS4NKaJGW3iCl1T+m5PBGFe/VE0YH1SINGjZF3owScWGAv6nNUH0u6
	yJDcSOfP9F0EvdcGkat1C2ZxG2EKlLgqxwxkAZ8CKJLwnEC0yyf49w7ugIrX4SNe
	u118TMf0sTdUPC3L2sis8WXjgIWa4hfyUm+BTG20lFdkw/nM10+Vro2QtmdmyqgV
	c1uzo5EtDf1+jFDqzilt1LtWggVcKYn589gqMJSLQKYB12PmbfqQ71e9bp9vqPL1
	bWoJW8zhAro4q8Fv2qmHkpYoNJci8oZrtYsPzr3j1+iYYrWQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgjcgug8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 13:43:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c5aef2a74so10883549eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 06:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792935817; x=1793540617; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZyVPnIb0kULpM+/plCk3hw12bg0v06X7Bexcn/YYCWU=;
        b=kZW+bZ2VKw2KRIspehzJkbD3Bm4PLIJWwMwA2MIuATkeCVCjAAQzZPh/fmbuakSTN9
         UNJJG+FmsBkYTQrqe+tqXh5KeLFrIMy58r1P33ZjltS/a8ry05112juJQnEskv8EpZ37
         JevRI8L8Xet3AQSP309TMzWSq/Phr8Fp1m2mvqnBfnc1jQ4c4zbwZ7RIr7xGDAB8oaN5
         ZkgH+Klx8eotPy2U43QCxZXMNArU0vSFoyccIEAVMFs9qw+xeaAwweFS/pUJMAtea47T
         XHgr+sUlNHmrIRGBkbT8tlyPQ2ZNNJGRRUD92YgWt5tttAIORGdG8eQaFQcqahyfcqpx
         E/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792935817; x=1793540617;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZyVPnIb0kULpM+/plCk3hw12bg0v06X7Bexcn/YYCWU=;
        b=AKs2qcfYP9RHzcpbXANYTevAsRy/EajJczLZ/P9McWgtbclumWkXINlw5MLOh62SHC
         q3RY09tu0+oHij3rx+i11G6IP/1203b4K1OE9yY7cSEcj8qc5DIa9GDj51NSn/hIsAnA
         e0Bc9dUUJu0agTVB+YVLIxqEeUQ7P11v3h7aAb5q0r98P+dUaW8CZ/rnKuPeVTyTJj2y
         O4YBKF7HezS368U6RRCvABcvtibzhaix2mHjhIeZ8B+J2/EAMU9L9B8C4/2KEEReBJah
         8rMalQ4VK5oC+LQOgb+LVrrb4Newwqs2VzEj9S1aYNoxzAWQAclRjps24Fn0F/nyqaz7
         MP7g==
X-Forwarded-Encrypted: i=1; AKwUvBzXNPij+DVdObImPqDpHvdkptzO6IbiCe9n6ufo6Oh6JuFLVlE0V6YoiFgOaW81Iwd+fg6JLQlliS7eyhAD@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5WwmuxlKdj2TF6lnN8KKy/DXKZxKTxp+yK27P9jRhBSaMdbqZ
	Ob5XI8J/C5a2oe1TBk9zn0nj3r0yWaB38yEsYKMLhvNKdbi5QeW5Fp7Axt9IW5Oz0HekPZRomwi
	J1Z9tAVgF+dvpzQbEaN8rIuwPePo56+s7bSw8wnSHS38mucY9GNx3ANwsRnGNPdB5xGa9
X-Gm-Gg: AYBFou36kYNKmIYpZcSqppGAtzJO0RGuWTiIJPng1dqy7YH8FXB/Lf+E0rjv0BYRIVz
	QUWFGz7/G7wVZGmtiCcucQgodcIRNQHO45748xHdl8CGJs/PKkysdQjk8kNO6zpTACJAlm9l0Kj
	tnoh5Ikv1+rfX3kJClaaDrIf/LDLnAJJ2hHS6HN9GiDiYMkyrsO3/9l6a7sgE83PT6Mk5q+17vW
	s0ExjSlMcVMSPdKGU69fch37dSg3ZqE+iHDrRO+ZM9NaVFHPQqwVChB+QhDf25wI306DqSokB8r
	y7jbHG5+0smfrzUHyo6hmEX96zZU/GhRIzO8JKEiCvneLLXFm4XunAkt6qD8uxJ9b7vMQCvIvT/
	jTOTKRCbl2nP748HFQKnofFMIYCPr1GE5eOq7
X-Received: by 2002:a05:693c:6390:20b0:366:b36f:a9ac with SMTP id 5a478bee46e88-369e861c209mr6836978eec.34.1792935817361;
        Sun, 25 Oct 2026 06:43:37 -0700 (PDT)
X-Received: by 2002:a05:693c:6390:20b0:366:b36f:a9ac with SMTP id 5a478bee46e88-369e861c209mr6836944eec.34.1792935816817;
        Sun, 25 Oct 2026 06:43:36 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ef6a71a4sm14608904eec.8.2026.10.25.06.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:43:36 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Sun, 25 Oct 2026 19:13:29 +0530
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Add SPI3 QUP core
 bandwidth OPP
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
Message-Id: <20261025-qcs6490-spi3-opp-table-v1-1-d0e0be6ed1b7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIAH3moC/yXMQQ6CMBBG4auQWTtJOwKKVzEuSv3VMQZKB40J4
 e5WXX6L9xYyZIXRoVoo46Wm41DgNxXFWxiuYD0XkzhpvZOGp2ht3Tm2pFseU+I59A8wAvY7qdG
 Jb6jEKeOi79/4ePrbnv0dcf7eaF0/g81/YHoAAAA=
X-Change-ID: 20261025-qcs6490-spi3-opp-table-eae8724e9215
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792935812; l=2093;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=VikVOS7UVUNtPxV/SyOLt07vTrA1qmdxUJpVFVngMu0=;
 b=FP4dkY0t3VMeNsfHXth9EnKf0NyQiqZWgOVvIIVk2I0cQHeliWy5atcJ/6hq37/iiAoSuSnKE
 wdEkbYuaRkJAV//E/2/oQatDKOp64dJta7XFu5FwofRtJCqnGp9BU4W
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDA1NCBTYWx0ZWRfX+KMF820pgA9i
 15a4xhSfPNewiTb54GK10q4f1PKE6u1WNigJcVON5eoX2+YlCGgaAPBibe66qdcRVYHkAIa9Bkq
 K38LbvbIfwBnQX3dasEp5Hw8xbX5qpI=
X-Proofpoint-GUID: TB-1TQ15KpCZy4cAo_ZIcCaTIln1MpY3
X-Authority-Analysis: v=2.4 cv=JvhkP84C c=1 sm=1 tr=0 ts=6ade078a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zOFECjqJgxj6X-Cpi28A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDA1NCBTYWx0ZWRfX6vnVY7JI0q7R
 TKn0/5/OksMxlD0fQ1ahoVuGqi8cl3dtIdMirImOewVv3yt0eBP7totgMmr9TD4wzE/MjIXTJxY
 03vRr/eHbfbiGlRj2VwxuoKZjihAois7MDuEZA2VlY7JQxQpaD6cPHfpq5CY24cfRdrB1uQJ5Tg
 iwjt1Q7GeCpYTXks7VkTQDch7I7K4VWxFMmH7xa6CyId1WArRLzaYaXyXf1Ge/wfOmVEqXkf9Yn
 ucCfndJ89Dzh0J5Ruy0UfAJ3LdDvJoFOaqQuVEjXVvIu1thpfrJ1Ll4OnZF+yoldqWNMZ/drgtG
 bvM5gsOUomu3YOU5yeLzExlk1KBd7LGwYGNILycbu5Qg9MDB935gATM3fTc/MXmM4+/Z4UE6tAT
 tmfWzZQJxUG+ZVuBFfm+b5pnSPVbEaqaM91De1skvAyIzeVnuAVJOnjpyAyGZbrvJOaQZ0yICqD
 Pk4pRav1PD8gwxe+fSQ==
X-Proofpoint-ORIG-GUID: TB-1TQ15KpCZy4cAo_ZIcCaTIln1MpY3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250054

Short SPI transfers are sensitive to the bandwidth available on the QUP
core interconnect path. An insufficient vote delays Serial Engine
register and FIFO accesses, increasing command-dispatch latency.

Add a dedicated SPI3 OPP table with the valid 75 MHz and 100 MHz
source-clock and RPMh power-domain OPPs. Add a 100000 kBps average and
peak vote for the QUP core interconnect path. This improves MCP2518FD CAN
payload throughput by approximately 38%.

Limit the vote to SPI3 on RB3Gen2, where it serves the MCP2518FD CAN
controller and its frequent short SPI transfers. Other QUP/SPI instances
do not require this vote, so avoid raising their interconnect bandwidth
unnecessarily.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 909039816a21..bbc16f5cb808 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -85,6 +85,24 @@ lt9611_1v2: lt9611-vdd12-regulator {
 		regulator-max-microvolt = <1200000>;
 	};
 
+	qup_spi3_opp_table: opp-table-spi3 {
+		compatible = "operating-points-v2";
+
+		opp-75000000 {
+			opp-hz = /bits/ 64 <75000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <100000 0>;
+			opp-avg-kBps = <100000 0>;
+		};
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <100000 0>;
+			opp-avg-kBps = <100000 0>;
+		};
+	};
+
 	reserved-memory {
 		xbl_mem: xbl@80700000 {
 			reg = <0x0 0x80700000 0x0 0x100000>;
@@ -1228,6 +1246,7 @@ platform {
 };
 
 &spi3 {
+	operating-points-v2 = <&qup_spi3_opp_table>;
 	status = "okay";
 
 	can@0 {

---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261025-qcs6490-spi3-opp-table-eae8724e9215

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

