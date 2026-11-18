Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001061;
	b=DWV2oJvB3nB2jAdeTG1gbeoB30yyzx4w+E6g7ZmHxExgMu0bHyRUyMU24JlFDgQNgJ6Q
	 Sgz9oRBtUK2koLnI0O22hg1VyUzAiNpgM8aRJERvEwHQO58D2fQFxtCceaxUuAILPWBbS
	 CmD/UNxAPkDyE4vHH2on2wUer4aDtJJC4cE2vTphJLmtRDLotsHdzZUJKdSe+8rbfOUKs
	 xY94k53W2nt+2LBLFtlHnNt6MMNb1XPOQ4g+0VAxMot+efND8J3m7HE3N2cCisvoAbJCE
	 jQQO0QLmZUcWpp6M0zgI3xaIVGNKcilhzxZvnuj7ZkAKTMgXSHzwcPhSx7xe4TqfhCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001061;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2I+DHXwITsm8CNgQHFnpSZNFTs3D/P5SlVGIf4B/W3Y=;
	b=JztmvPwtAC4ZuQ6ZbOHfkgvaHRyApFJW3tvEzVfSgaucTXMSYqv+bfvOT/n05ZakNdz0
	 mslq6cIehhnsW2ZXRBFAjwg+0HGEnKdeWBwblzjuYOJftOOLiGoHIsnOXw+xXFcL0Flrf
	 EaXi0aGFCZInK5b3sNVWveQWzbj1LuDAv6S0UGbIPml/Em1uN3NfJDon96tsi/j+gflMC
	 RhjXzA2ZAVMtg5DEX6rg0nGc68d9XK98uvRnEl11eNRqjgAoWge/zwJExuh2pSFd90CYg
	 UNs72fLS9ZOwApWk5AksbVhafdLkC59dOcGnmcAj7gMAy0oh3VA+SZ1W2VZ2RNkRuoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k65oliZF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NRhIqWgt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C765606A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 11:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C765606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k65oliZF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NRhIqWgt
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBL1Hx2610395
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 11:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2I+DHXwITsm8CNgQHFnpSZNFTs3D/P5SlVG
	If4B/W3Y=; b=k65oliZFrcUSmKlMQQG0970K6+RRHzEVQE/jbIm21Qs74HDRrle
	zk7z3VuDmuVgvRlzWMsjr0dNmetUHQkyiQkgmJ8MDtIb6GcRcHVx5sEVqyqUmY2U
	eRNusZfULBOqmiSk+iYMpiScyhwmAdcjZHMseiFP8Zy4BEC9C8zhUbJkxLbYrf5r
	pKpaGuKPNqz1475lfeO3O7++iM3bskuQEC11lBBMVbgrS7ejTA4gFbQpTPXgsNNO
	zfODdU7MkLMVsqXhQClCTPK71vh0BZEWn2+ghEqUNLbUFmLTZSX96su1LZCpHyCA
	PLcBglxIZipZYThm79ZZffa7SD5PFdUm2Bw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv92srd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 11:24:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94961511b61so182001885a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 03:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795001059; x=1795605859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2I+DHXwITsm8CNgQHFnpSZNFTs3D/P5SlVGIf4B/W3Y=;
        b=NRhIqWgtO4nLX6FM64tnJQlfYegwEK5bVWKg2IFmzoIg2d4VY2vpMftA9+vAw1LcYB
         cFEj9BzEVzw55HHR/+Ei9M8T53bTGjqBryklpflt3G5fYcvPBHjGnLBL4U4lgvw+szt1
         0ZL9dZK8Qhbx2GJ6SSrG5apXD0MsLKnygxgl8irFukPgYjM5iaJlIn9UtHT7JFdLvJgz
         oTx0I+ubvvmLwZA4Hn/1UkGvHWrqhJA072CJz6Pgx+uXeIte3kHMOyk5ScS1h3s9PcsJ
         efb5X7ElZGmllaOqQqz9jyzlL4tmo9Ykbs9umuSC/vI1zhfp7j1+XxSF7zWByr+hyFjn
         8Ohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001059; x=1795605859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2I+DHXwITsm8CNgQHFnpSZNFTs3D/P5SlVGIf4B/W3Y=;
        b=L6P2YDktoXNorT/9p3vl++P4VsuuArgbS54d4G6Ke8RpPskXdijjvG1upyWXtlA4b1
         ZIFxyAsFZV46fOJEfGCZMNEqlOe7VnqMKHoZtseGMkdMBvJOgiysmBUsThCp15bQrUsf
         RRMxPrwBbLw3sblgg/XdyNjQZ13VkUKKrU2GEc6srTFgMNfZlWgYxBweI1z1z5LsnIJV
         Pm24DpznZKIi3WMxxa2pK4DBExlgB/XSK62cUgZ7b5zalDVhIe5qYAKoqNdHVpPwVPla
         9HswacPPX3S0fVoPqr/wyJPoPznr1kUCiu9FPyxXUPmcImheGPUXuvZPrRU0e8BR8W6+
         O0mQ==
X-Forwarded-Encrypted: i=1; AL+hErGklkNuQwXevTovAoHCGQ1ML+3qKqePmZmVuv4a5qhdmgR//UZ3O95xRcnqvYzOtyHUYGmBRT5799jI+l7O@vger.kernel.org
X-Gm-Message-State: APuU4Z8RZdtERa4UE4s78r35y0fBX5AUZ3OHi1hvOJ/c0EJpq/SZnf+U
	NyA5eG846+WeL00X0r8nDzfM8bSMpbdeR7J5GReuVIEHhQOrTJxM2h0qMeActYJE82iepPdCMKW
	BhH5+nT6NYA5X7ZSmxITNt4tDq4yovRTdeRXuwCIj9W+ixb8Gm9DvOKlw+h3kxAZbZSZz
X-Gm-Gg: AYBFou1J9xo0tP6nGxJ26nzuvHpuwkYusUjnWvjMWPtdr8oGI2ZnwFYj4ja9exHW1oa
	bZhVzylu/++bPcFl2R0o2No530crQRbhd+8zvqXXMg1kgRQYc0DQrGZ6NFFlhWv90EeBCILDQIU
	6R0ml6u2pAzCHHwcwB7hWN5MSOZ8bunVmiZOo9W2NJddvGlf4Jg9pqy7+luXwGKiRMBB3wzg3++
	6QOnG3qj143HwT0drPT+OB+Gck0uM8/r4b5BybtUc+AQ4t76HjWWi3rQcGdb2JhLGHvDgTcQpQe
	CbBQVmCCykCjzMREkaRoK7jG8y38n9noTCUtsJCVSrnfi/aviXR3YkCSwGUCszPWT91ujZkCX4r
	ypBKa/+1Ou7KNpOHGp58KG6kVrRBZL3RjvFhQfq7WBRd46R6SHVXhCIolCrtwayh3KQe/ZV0vic
	r6bnZ7880=
X-Received: by 2002:a05:620a:1b93:b0:949:7572:e76f with SMTP id af79cd13be357-94999759b2amr437533685a.46.1795001059207;
        Wed, 18 Nov 2026 03:24:19 -0800 (PST)
X-Received: by 2002:a05:620a:1b93:b0:949:7572:e76f with SMTP id af79cd13be357-94999759b2amr437529785a.46.1795001058768;
        Wed, 18 Nov 2026 03:24:18 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c3a7sm4569411f8f.9.2026.11.18.03.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:24:18 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: nord: Fix GPI DMA wiring of QUP SPI engines
Date: Wed, 18 Nov 2026 12:24:07 +0100
Message-ID: <20261118112407.103412-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0NSBTYWx0ZWRfX8umnmLF4rTpf
 GdKKL5heLebcbMlam+V1vjaQwudYcZpJ1nAL/1xGuRVkWc1LMjxhfUYeUzfGybXrBFFzkMA+Vs3
 nEZg3HluuN5KpDNKPvkq1f7tKenwjC3VWOZQsJs9GnpnP+qHwGWaPZTDmJdmos6c4tsN//WDsDU
 IbY9VHpJTOq6eCcCNDuXUfSY019lNsGUjiaCH+iW/FZzBgNZo6wDyxdesnOG6SJtajqBg0OMuyR
 t/u+h0f4vEcdsfyPjJ8EBEV5nVjebRCORecRmrmSxYt1Ct+2eIHMT97TQ/MSSMOBpYqotNKCczk
 G4T89n689eWB7J0zzijyg3UfZkzud5XjuJQYjd5L5M3HqSfVRy6p6BPI8bAj0FkIRz5VhCKAZnd
 N2UKv8qBcYFhwLqnN9X3HDGPjNfiaI8f21EYFFuucJj0+hP8zz4BGiaAhubtw2eu+rTywac0da6
 uwpka2odZnwHfgU61Mg==
X-Proofpoint-GUID: a2EVOpweCKnisH_31oL6vlwCiHOUdoHj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0NSBTYWx0ZWRfX+3sH/8iCDqUW
 fltAXgDaoEtmRvTUbgblWtTSaEiRlLXrWnxMzxVe2AL7f86q2YpifTdBEHLfgaSkP/NymGP+vTR
 ua6qDsD7t22cWS9VjrA9/EwZSsR7n8g=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd8ae4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=if-8UaqqpKS-Wo8cnIYA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: a2EVOpweCKnisH_31oL6vlwCiHOUdoHj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180045

Commit d8005dd04efc ("arm64: dts: qcom: nord: wire up GPI DMA for QUP
I2C/SPI engines") put the QCOM_GPI_SPI channels of SE 0-3, 7, 8, 11
and 12 into the uartN nodes instead of their spiN siblings, and left
spi4 and spi14..spi19 without any. The UART nodes now carry dmas
properties the GENI UART binding doesn't allow, and 15 of 18 SPI
engines can't use GPI DMA.

Move the channels from the UART nodes to the SPI nodes, and add the
missing ones for spi4 and spi14..spi19.

Fixes: d8005dd04efc ("arm64: dts: qcom: nord: wire up GPI DMA for QUP I2C/SPI engines")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 92 +++++++++++++++++++-----------
 1 file changed, 60 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 39de48e5bff0..256bc766ea6e 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1136,6 +1136,10 @@ spi14: spi@880000 {
 				reg = <0x0 0x00880000 0x0 0x4000>;
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1167,6 +1171,10 @@ spi15: spi@884000 {
 				reg = <0x0 0x00884000 0x0 0x4000>;
 				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1198,6 +1206,10 @@ spi16: spi@888000 {
 				reg = <0x0 0x00888000 0x0 0x4000>;
 				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1229,6 +1241,10 @@ spi17: spi@88c000 {
 				reg = <0x0 0x0088c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1260,6 +1276,10 @@ spi18: spi@890000 {
 				reg = <0x0 0x00890000 0x0 0x4000>;
 				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1291,6 +1311,10 @@ spi19: spi@894000 {
 				reg = <0x0 0x00894000 0x0 0x4000>;
 				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1387,6 +1411,10 @@ spi0: spi@980000 {
 				reg = <0x0 0x00980000 0x0 0x4000>;
 				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1395,10 +1423,6 @@ uart0: serial@980000 {
 				reg = <0x0 0x00980000 0x0 0x4000>;
 				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
 
-				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
-				dma-names = "tx", "rx";
-
 				status = "disabled";
 			};
 
@@ -1422,6 +1446,10 @@ spi1: spi@984000 {
 				reg = <0x0 0x00984000 0x0 0x4000>;
 				interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1430,10 +1458,6 @@ uart1: serial@984000 {
 				reg = <0x0 0x00984000 0x0 0x4000>;
 				interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>;
 
-				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
-				dma-names = "tx", "rx";
-
 				status = "disabled";
 			};
 
@@ -1457,6 +1481,10 @@ spi2: spi@988000 {
 				reg = <0x0 0x00988000 0x0 0x4000>;
 				interrupts = <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1465,10 +1493,6 @@ uart2: serial@988000 {
 				reg = <0x0 0x00988000 0x0 0x4000>;
 				interrupts = <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>;
 
-				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
-				dma-names = "tx", "rx";
-
 				status = "disabled";
 			};
 
@@ -1492,6 +1516,10 @@ spi3: spi@98c000 {
 				reg = <0x0 0x0098c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1500,10 +1528,6 @@ uart3: serial@98c000 {
 				reg = <0x0 0x0098c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
 
-				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
-				dma-names = "tx", "rx";
-
 				status = "disabled";
 			};
 
@@ -1527,6 +1551,10 @@ spi4: spi@990000 {
 				reg = <0x0 0x00990000 0x0 0x4000>;
 				interrupts = <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1623,6 +1651,10 @@ spi7: spi@a80000 {
 				reg = <0x0 0x00a80000 0x0 0x4000>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1631,10 +1663,6 @@ uart7: serial@a80000 {
 				reg = <0x0 0x00a80000 0x0 0x4000>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 
-				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
-				dma-names = "tx", "rx";
-
 				status = "disabled";
 			};
 
@@ -1658,6 +1686,10 @@ spi8: spi@a84000 {
 				reg = <0x0 0x00a84000 0x0 0x4000>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1666,10 +1698,6 @@ uart8: serial@a84000 {
 				reg = <0x0 0x00a84000 0x0 0x4000>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
 
-				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
-				dma-names = "tx", "rx";
-
 				status = "disabled";
 			};
 
@@ -1739,6 +1767,10 @@ spi11: spi@a90000 {
 				reg = <0x0 0x00a90000 0x0 0x4000>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1747,10 +1779,6 @@ uart11: serial@a90000 {
 				reg = <0x0 0x00a90000 0x0 0x4000>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 
-				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
-				dma-names = "tx", "rx";
-
 				status = "disabled";
 			};
 
@@ -1774,6 +1802,10 @@ spi12: spi@a94000 {
 				reg = <0x0 0x00a94000 0x0 0x4000>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1782,10 +1814,6 @@ uart12: serial@a94000 {
 				reg = <0x0 0x00a94000 0x0 0x4000>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 
-				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
-				dma-names = "tx", "rx";
-
 				status = "disabled";
 			};
 
-- 
2.43.0

