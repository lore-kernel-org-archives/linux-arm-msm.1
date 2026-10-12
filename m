Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84915443C11
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789816; cv=none; b=ne+RARw5MQyr+G28ytpbjdynpTckVOGELaoGpvgAGjfk1DM5RodNwM7UcFklc31uKEgImAUTnXus+DywLuFHUkjBVDf+dZ7NdHw666KImNeNam8wH8K9R6EDv8dY/uDc8ITWUcGNCfccd556I15sLSTWZNvCNBwtVlKYtr/HwDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789816; c=relaxed/simple;
	bh=5JUdAanaiMiwR1iB1aPEj2+csMyh+P5epWoBxXQKgLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eYM+/QwaehDeOpRueqUXUSfUA2LrffxD0k+G/SnbEkmFMjWHOFb4Telu4fJGhbQ9oDEaBIdGHaU9wg2PWNzrBihzed1pyxIWJzXLv+fVCkdF+SWg9DdKLdXvsT2V5Ts33jibjZB6cPjXt+nfNWDrUAXJpb4u/Sn3ls4aq7L1K9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gehmW/iD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffdLt1+a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gehmW/iD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffdLt1+a"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C5PXf21786966
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zeVsU2om/0Ysp3Ac5o6eachP5fErzwvxEMxXU7LspME=; b=gehmW/iDAXmKff3d
	AlCrobZ8W2weGH5uHt/K2opcHmOyVwUJ/dSBRGkPCPKBLN2WtewARYYkPSYIBa83
	24NLFgAOJwjtyiLILmJ+24Nkpky4wK5BJrMjt8qw/BqJqDnxADvNZ7KaLdlYICzp
	j9V8n3J7euovc9FbK75dwaZVAdkuHr9LMU6rUeG/11QTgFywmasc42D7WMZkS9hA
	BexVH1eiauXg+9Sq3sDuND6AvqhbRN90E+YtlVQZlPejMbpo0O0k2/PUfNRDvDC2
	vXYFI7f+vhNPDOXZNB+07/hn/YQgEa6JPOoyIp4DgkrZZN9ng9V0mLZqpIzmVUFi
	L3Gcog==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1rghv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:23:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso856588eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 00:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789813; x=1792394613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zeVsU2om/0Ysp3Ac5o6eachP5fErzwvxEMxXU7LspME=;
        b=ffdLt1+avL3DeYHRsWK9b2aNpqE2wRr+ZeMk96An4I84GMAsi7gjkbyqS/YcFtwq7e
         +od/mFXgLC4mFRnvCVOiWRDySsvgPqavegzDgU4wrQk552SG9PAtRUr/bLdqjv/Y4nDH
         0JJl6y8S6dJdHkmPUZ9B5NdNGpESYxCjBPfn6aqVybTxotbo7IEqL7PYwfk72DwHZCTw
         pZzd7KBuyiOYf1NNLyyYU9jSJmuig/sdM4qTZrB1/uA/Sa/d5kkAkTzo2OxjYuT1J9Af
         in/qvvX0T+59yL28RGCqyC5sTE6MX1wSAJoIVs+GUxnqIFGOdZuG8NdYnKM2yPQ9rPTo
         mhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789813; x=1792394613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zeVsU2om/0Ysp3Ac5o6eachP5fErzwvxEMxXU7LspME=;
        b=RgMoHCLVjkV6M8Shhaq8ZKvyT4oom3Hqa5mtdgfwsyCQwievJnQQBQ9rJmhHc7hd6A
         10+hzWgiWk8BLE4v28O4Xea1itpXuLyiP9uXadBR1vQgDj6IZejKq4CpVkxfcwJtBk41
         68m/WFinhl4Z0ujKh6UeMj8b9+b7a6JdiDwsDGW3ZoUyjYPR/N64PzeygLuTb982+Sm7
         i/8uFblAmDj1q6VvkJT55oC9fUYq5n4ppfe6osdPmW+o30JNFGG05upOdw0xYqxfQSim
         QEA5VxRgR9RBg1pXax32MxZSZL5ezRMaxkWPWSPf/lckcGPn4TfMuDieLokbfIluF7Dd
         ajrw==
X-Gm-Message-State: AFq9FYIktK91E7FwzsxMy/YJfS9DlF+lNst6tC0r4hI5RjiPJgzMP3B7
	TMblu9ceg5s7vbuCh3r0/Q6X71EE886RxrR5wZC/xpPvnz2btfyE7zvtOize8BKmUx1CkV/fs+A
	ocPDSS8gqtl8VzVt0QACEZzC3NfOyz45XzpPM8harTvyH7KSfVLeOS3izK4ggGDP0Z7+7YhLnWK
	4i
X-Gm-Gg: AYBFou3uT2N212V9pDy95Atc9JtvAxwTdKmP2J9jPcY8+qPcURgtIA208SrYZKg1o+2
	+DjZhUjOqiDQ5sjiec6Z8JxM8qnkz0QDlwMKa376vm7qvitYGnuyq0TaYmG/Fcb2FLoguNfCStX
	pQWu7lm5v/O1t8loLMN0oDrMos/3jErwCvFDLFwI9BLHYVNEscIydRaO6TBdXnBSqNAixpV8JOn
	RIKY02FVfTKc6oi9fA16VpD5jP9cEIiFLqfdZmlqRG93oI7+uNNVeyq2UHt1lJ8L9/ib9BH/FSq
	3ddVdRcJ6S7nnO8Ot29zVy+74ohdsAd1Rsws3WzMp3hIOKL2wwjoifE3ieKSW8Zh/XynplSLiXi
	WjT8IzpUir22p6AhgARD/8lUiZKFjTjvPfN0vPS8vE8S4ZOgmFikbg5YCZvewChEvE6Wis21n5o
	EyjbepO38yutBq6s4M6BrHxBCZG7mG
X-Received: by 2002:a05:7022:ed06:b0:14a:a6dc:9cbf with SMTP id a92af1059eb24-16a5ac102d3mr11247428c88.4.1791789813126;
        Mon, 12 Oct 2026 00:23:33 -0700 (PDT)
X-Received: by 2002:a05:7022:ed06:b0:14a:a6dc:9cbf with SMTP id a92af1059eb24-16a5ac102d3mr11247389c88.4.1791789812538;
        Mon, 12 Oct 2026 00:23:32 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm29748733c88.5.2026.10.12.00.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:23:32 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:53:06 +0530
Subject: [PATCH v7 06/11] arm64: dts: qcom: ipq5210: Add ICE support to
 SDHCI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-08-dts-v7-6-77bd3d68d850@oss.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: Qmkvopqj4iIjC9jJPXYtJjloOtFK09lb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX8k+aog3jx3HA
 A1+vLyqR+Lk0se0xwgCpUle9TPZCSIs6EC9+MHc+LIibjQPRyXHNQ7krAfXpS+Gqn/E4INF/HaI
 E1jFZED+UBrEhTi4cmrGUaOumckIhBE=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acc8af6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=oTQqOnWIMzOobJ4mAXcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: Qmkvopqj4iIjC9jJPXYtJjloOtFK09lb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX7LoAVesq5F6O
 5RS+NmivAHosGFOUO/sxqZpgJPz5YA1EbSC+6O+c445y2dqIEiFppvwclYftJgaAwPtuhH+zctE
 bUZHEsHu4MEoUKrWZPS/axGrOs2DemenfF5Mi3RajC5ocOG87O9RJ4W3Mu7Ym9KocFTYtrz6xto
 hOwKtjUuUQzK8fjh1IEBgzQOoSATycmbF75qOFNtW716WAV36hRP4QSYWgg6TGyjOePQmmLMJLj
 AzTF9Z1hcoWSZrHNtPgbQYLiwSnXe9aIEJdhgX6FW4Sm50wyRYMhPFmGoip/8uS/YgAokKx/THL
 EUQQ0lOmM3JIdrMqa4aI/75cdwuPnQFbMFS09U/cOrMgY2bbCtImVnpNp+hrfI724S/QAd+Ldn7
 jAtVnu6q/EHN8pOngnuZ5N7OhTintaK/rNaV/H3WYAfjy4w7b6TBzSLMBwcKhY6U3Yq4zrupXPf
 UpdUG8jUUxnbSRc5qrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120029

Describe the SDHCI ICE register region and clock, and enable CQE support
for the IPQ5210 SDHCI controller.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index d28d68a10958..c14b42c22616 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -416,9 +416,11 @@ uart1: serial@1a84000 {
 		sdhc: mmc@7804000 {
 			compatible = "qcom,ipq5210-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0x0 0x07804000 0x0 0x1000>,
-			      <0x0 0x07805000 0x0 0x1000>;
+			      <0x0 0x07805000 0x0 0x1000>,
+			      <0x0 0x07808000 0x0 0x2000>;
 			reg-names = "hc",
-				    "cqhci";
+				    "cqhci",
+				    "ice";
 
 			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
@@ -427,11 +429,16 @@ sdhc: mmc@7804000 {
 
 			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
 				 <&gcc GCC_SDCC1_APPS_CLK>,
-				 <&xo_board>;
+				 <&xo_board>,
+				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
 			clock-names = "iface",
 				      "core",
-				      "xo";
+				      "xo",
+				      "ice";
 			non-removable;
+			assigned-clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
+			assigned-clock-rates = <300000000>;
+			supports-cqe;
 
 			status = "disabled";
 		};

-- 
2.34.1

