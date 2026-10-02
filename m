Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C480E32B112
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 13:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946208; cv=none; b=m45d+NjgJC85DObEm+6uoNFikkeybYb0eqtsE+8BQIKi904PF74sgd0CejMBoILtAi+y5dVKLM8oIMeN/580XaQmVzxVUX5Ftd3U6kywMvayMDUVFyGbQP6soRb9ImFt/d8kVauT1OrqGAO4UFmzli5c5rTd6VVzsDfIAuPjwKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946208; c=relaxed/simple;
	bh=/w0aJOH+xoiyalrUqU9wOK5XaE/NxE7TbLjMkHrYZPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hXGsxJTajo0NPi+Rd2A2FPsDfyYidu9nM8uS2+Uqqj7OsNpdbSUKR6G8wN55jyh4AxLeqlDlnqfIWz9PgAJW+ZbDQm5HfhEfMsxws7g7HQMTJezsC+u1hRlhKID4QGcDSip0MqA1fcWGA1w6iU7AVLjK4l1714ZtrSURmPFN1oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tjm1nM9N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MyMymbCi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tjm1nM9N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MyMymbCi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nXNN344599
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 13:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PTzWQCCMyGuhdhfBCadmrc99Mjjl12xgtOGe4mlucRc=; b=Tjm1nM9Nix4buFrY
	zqDLpLqiHm/TvHkLYNjx4aRNMz/3Vv6r7wbe0p9YoqehkFfUcwh1v4ncX/guAvnV
	cNDo6RWkw2fqWv1tiOolR3FbWncymWxwTK+eGWPmr+pjBaw4xXph7KOOcld+vPQP
	y9tTm76RURgLTx49hDPebNyG3AYnvPULH5M+TlR2bTPFp2eK9L72V1Edn1z3/8Tl
	dCUTNPXibgdWyNPmOS0g+MxOoIPYDEmQW1UrbnZbDkC3b6EAGqoLgD+20jaGCtCK
	Kwrs4o5XtKGVpyszJhareqYD4FHn5oyrGMl367vDbef2hb59km7UP+0d8lkAs2AU
	X9DH+Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1rvqckma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 13:03:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3510d0baf63so170365eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 06:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790946202; x=1791551002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTzWQCCMyGuhdhfBCadmrc99Mjjl12xgtOGe4mlucRc=;
        b=MyMymbCiCtD6Xhjt3HpmL1FC3xqVVsjeppZ+Foid+9+K42lWzZF4h3ol6EVVJ5zN4m
         N/UdDjpAXrrBdSF5ziVNmZ6GaLFCFTFb+nzJBgDlI+zKptVcvPBbzIVPJymi6M+o1luC
         9cOm1BsertXTIrT8SzAWweUd9vHWHkSAPiXGzbU4etRW1bFhdOPsekvluW1VROWsTJij
         OlrvAQvbpJvjT/nPGT9Nx6aG26MyXXx2co2zSNmz17id7y/EmWkCFGEmFpDN3FJubRDW
         /FndYdNVmkdR+V2A3IhEAkYA58FoS5+x60ADiY2trnu1tqGhaljPL+Cn97M6kciTsqJW
         5sYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946202; x=1791551002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PTzWQCCMyGuhdhfBCadmrc99Mjjl12xgtOGe4mlucRc=;
        b=lNN6S0m26wp12tk33NBBIqVFrrPreK2YQNkNlBsD8uFx99goUerUHaNmndkKmQtttW
         I7+vJ8B3We7xiWhQbbOzZ896ptpYcWOqNt7j+MgXwjSLXeFHMoMlxogt7o4tpgIu7isJ
         KwnArGa8+PbB0OMo+souRZ9KSUznIbda9sCi0Bcz+5GvEs4V0UOVOetYkCFlzXuUFLHp
         kLIVgIM8djgixh6nXE24GEVUyxkECyaM9vTDiKgBSJUa6g/4WV70Uf4IfCPDlF9A/xjJ
         mWoqrRniRgMvh5Eb6z7XaqVuWumSm2CDsbRMrzFIHJX38zMoRTUQAO0Lzi9Ybv8LpOb0
         qhrA==
X-Forwarded-Encrypted: i=1; AKwUvByDpJgplqsER6Yav7jFSoNjVkFGb5N9U0tJ7Zh1Xp1vunuvxrgEKHzcAdEFJZAW7gBUg4n4Xfs4jNGrM/C9@vger.kernel.org
X-Gm-Message-State: AFq9FYIbrlLe08BdWMp+kgusJ6yyCDEQk3YML5Evkp3D8jJ6VQcurXsj
	PMlBeAk8iiRwtLWx6yjQIbjXOv5dqxGqedEsbVd51xMih/juJU4F2zzUUZkENFJX/LCeUTphOTy
	z7Oh8cO3V5xugFhvlcIVEKPBNZtwcqy8dDi2SiW97yeYoHewVSerzrVx4tmhP2rkUsmjm
X-Gm-Gg: AYBFou3JXBfc+qaXmkDbDpHZAsBEpubkTOFLFLR3SzwflQ4YPhyzhycBa7lqv16lzWn
	2t20zSAaPUlZ7ibkX1+LR54JPubF2zqlrlZP4j25hw6YFBGYuqTg+abrROhQEuZnu0tSrJEXrHX
	m+377G92YrBWBXxI2CH2fYRgmpL8F+g/Vwq5jhfqYgCEOWue5j1k3A7wUoB5QlCqognyeJNb4dO
	zILlmhDLCSDOjWjYZ8Ny/mNYHeVsHpP5kG9qOQSexD8IjSc1UC17l5GpdNEr7IphzJzP3ELxfNX
	+xZBmqN+iSKpytiRJY2YH6dhpGQ11SRwFVYiCzMXJi+X83RNVdrvyAi15cEwAKux4YJGdNEpZzM
	Y2m5d+dCRF2HndV9UEDF+AaPE21xl9jd0iAq37moVvm1pMpMCsA0UevkkqHG4c/MjP30S2M3NjU
	kiGL+t4TDAGX6TENNyAP/030yzI2KyFKjDkw==
X-Received: by 2002:a05:7300:d10b:b0:33c:13a1:84ea with SMTP id 5a478bee46e88-34f2199d876mr2517937eec.39.1790946201727;
        Fri, 02 Oct 2026 06:03:21 -0700 (PDT)
X-Received: by 2002:a05:7300:d10b:b0:33c:13a1:84ea with SMTP id 5a478bee46e88-34f2199d876mr2517906eec.39.1790946201122;
        Fri, 02 Oct 2026 06:03:21 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510752b575sm4217543eec.6.2026.10.02.06.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:03:20 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 18:33:04 +0530
Subject: [PATCH v2 3/5] arm64: dts: qcom: ipq5332: add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-imem_restart_reason-v2-3-61703c6362e3@oss.qualcomm.com>
References: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
In-Reply-To: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX1hVvEkqut3YF
 1NogvMRsbWJzoVCIUyN1lA8x6S+eovlyoZ/gt2gX14Xt3NYxv0kU2uM4UTZKavLQ7Nd5Se+gDBJ
 N+08wa+IZpybYvqGl13ubj6YzNF9rCWOCHAOaqjeL+gaQUh3ObzxP9mXgvPacEEJnAICp9bxe/U
 mf3R6T445Z0hxyvL26XabHuSRavWCrhXo4mutwv43KkYkJtOR9ZtF2L76N2G4Vi+pwk92sP/Wv8
 uhH+K4mHLk1QPPN15pmgNeCXWsBAZwoSxQJXjtUxA4TUTyhXzpg3p9zGsszwmncgTo6XFhvtMec
 NmpnqveSGBiA7Rgg+LRcrvslKtjba/sJH+rMSPVA9w01rSyXYMQX/ggvGNvXJIy21rcMHnOj5KX
 roTPSsjRfDlcUmdTNMn5DuvNty3oKg4TZFR7U1N4LK0Qut7tJLEGUD0hp+KWICxV61EKId2IW7V
 Zm4CEoN545GwWOG01YQ==
X-Authority-Analysis: v=2.4 cv=JIauIMKb c=1 sm=1 tr=0 ts=6abfab9a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1EpwE-knX81bZyav7xYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: aVsk049xt-kXY51iGiN2-5rf9doiP9JW
X-Proofpoint-ORIG-GUID: aVsk049xt-kXY51iGiN2-5rf9doiP9JW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX3ahpZcrfNQKc
 99Dpb6JIXIe6Ol36rj4ayaqgcA2jvEkqA4tWmx5m4xXrB1Dm7SPrGW0il85E36VWBbbAHrniZ2n
 pRTg3PmRYxU4+BdrpxmtSw5CGr+pA1k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020051

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 80KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 74d9de8d7641..3e10f45e182e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -493,6 +493,13 @@ qpic_nand: spi@79b0000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5332-imem", "mmio-sram";
+			reg = <0x08600000 0x14000>;
+
+			no-memory-wc;
+		};
+
 		usb: usb@8af8800 {
 			compatible = "qcom,ipq5332-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1

