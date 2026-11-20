Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172832;
	b=BSklgWYdYJ+xjF0CuZ+WCgnP6EpuvncXfNGubu7JLmbxl5z60oeNzKlv7u/UfzOimQmy
	 viEESLN3fLpK4n5uJ1VedGZvngWPdXs6NNCmBEgl+fDjnvFfY3i6t4pPhtNb24lmMX+VZ
	 I5lMwWrXhNmSfZ/2KzpFyGTKL3lG1bTfIbAdGzRxVFYRaZ1lQm0FYcPZPStwKVq2Ax3Sv
	 plGn3bpGfMLA+ao/HjZ6wHnt/w5MjZHzSxFjXsobb+XYEBb6m7t9M74spGa6wTkmp1EpC
	 y8ZTZrcX5SZex+DTkBtfgxMRvA88Rj7uDMyxymLtmU5FQsriv4J3S8Pqj64o55wNGow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172832;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=;
	b=4jum4e1WHkdcPerSxogq5A5ZroyIR4hTnvADX4cYn22gMBb30qaCGVX2AzRE46V+AY0k
	 ffhkWSiy84yzl3Wm5pALtXG7OYJsjHclVIXKbxkW7jWWwDH7WxvT3LFJ7ZWKTPgzGdQaa
	 r0weOZ63l/pgYGBKjylqjFGnjoy3dCT8bTZSuhHgruVcXph3anODj2206f2KjFY0A+5Gl
	 xIBT+xxZyWBMUfB28IrqJfd0KayjvGG+oi4JmJR6VisUBDoTNbEdEOMfc1zZBVkG68jux
	 WH9AOzvODZA5U2HFJXF1qK4ejcHKeTsFru2DynuGm77tULYIJ7Drps19ODZwNjoIpzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QzZ29Kkb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ANEKq0j5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D4A606A339
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63D4A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QzZ29Kkb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ANEKq0j5
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkHXD1017120
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=; b=QzZ29Kkb8jPUNzaL
	tD9uX3Jh4A0ugKkJgKV0cOt7CS6/HnNa3uJ5E+jyN9Dtxf8glUCo9FqtbCgZ1G8H
	tkGSfdvmi53szEDW+MUHncxhTmQ87jA3+jSV/oJrSsmtu7GobAK2epjTWWox3jSe
	YAeAPTcc9r/oGhmno4VqMycNoL42okck5BzwpnIY/Z6orYaU12MCMyp1PkDb/nRi
	MngcPQxZgIWnFMCQCbxcH/VLT25578C9TaZznRFPZhEiu6DwQU9r16K8YfNShLlo
	Tiaw+TyF5Rv6XTs8OomFaEsNjUCiO6VL2u5ocGR3mSGfyRzdLInBgqxhNMpqoiG5
	sFlgVw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqs7f8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386177b0516so1026208eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172831; x=1795777631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=;
        b=ANEKq0j5pyfqYLozx5vuFbm2y3QufakoTm3ZVN2KxFI7dMOHnaQJOfrX4dhjAKyWlP
         rn18HAG0qOIu6e8iaxhFHJARRFxLV9N1LrOPPlmDfrFNpDvmPqSkGAUTyvcn9W2Xf5g0
         8D2JVvJlkDfWNuNZ3/unxV8URCcF+J0MGT12p2ATJo/IddfTLBfnR0VJKN2y1kH9jN1Z
         BEmK88Fe3uEa1tjmOzQyX3Gw6gaJJFCYagCAI98BzJMOXSuMr8FYzPpZnq2XBqil784U
         EyW2AssjC4KbSbUsNHpnsJibT/UXo+2qXt9iToxy8/y9ewX1bDzsuuyVrrILpr2Zin/P
         JE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172831; x=1795777631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=;
        b=ebUs2TLc8Y4cBAPpUatZhwoCzCkOVG8/Rwl0DjGjiczgtK7GfqXsM27BHgLTRUp9On
         6AnI1+KerJ9sXKPwLQrpNH10w7QMxGor6ncbCsbPVr1Raz6TXOqgD5y/XRH7yO8uFl40
         gI8l1tjIPxQ2ypY12c5gAcXGzQS0OVs4UQEqPv7vJEeQOM7G5heNhKwFGDXD935O2NTL
         jez6+kWul6e8cDRo9S0NyqDzV+nqUhWKtncHU03o28tYjb/vgm8DRaj/4K2itV07MASd
         di4NGLHVeOywjXFTOyhTdBf0/cRcSfcaoFgSwlDteX1EF7//E28HuUveC2IH7PM9R39z
         +how==
X-Forwarded-Encrypted: i=1; AL+hErH0JtVkzTENAKwHXYic2cSWeRVLNUWD/rY1tqDXpQtrNR71HY81ekdRoVLVs0WDtifniXHFVS3nXF7LdoXt@vger.kernel.org
X-Gm-Message-State: APuU4Z/rDpewOu7FEqlkXBEz/1cdJIuvCs1zVPjyaVnq9uoIeq9BS2MM
	I7s02q1m1Y6Y4Q5OloHtCihUeJxcyplO0Z38k1Knf7cH4RYD1fwSxPAcRXAu0UIQaaRsYbAw8uW
	AHrSIDHAZkSLCFym//cne3Z3s8/aChj5MAGaE+tqUUuD5g4lA7zIw67bVqywHgRURWosQ
X-Gm-Gg: AZFdTZeVjt5PTP7/beyI3nMswvg/bqS+qvbOeKEs3KUCYHCQYWfNYoNZIItdzWn1ma5
	X1wPB9w5n2GT3exfosAvAMObcgVrUJeaQEAErygsT2EQ1EW/2mCGaTIBID/mRgwi9aI26o4EEaY
	xDM6qxOgfVrawoO7IUx3DhekC6Ocu3Ilkxt0bsUWS31VCjAMZaLS1zPPM/9Di1VmLLk36Kra8iS
	fkviKl/YqGkj4t1/GjomXWPw3kF5zIQtajD1ASwpCEuD6/Au2EcWD7FPVpdzQQdq/wBd0LBJfGY
	rIevIKzKMIBNO05FJaMBDEcklZZ4vH0o7j6Rq+W+QBbzucanuY2inJNRLIe00R4K0Akx9EdzhiQ
	W1JIvoTX57JCtjxijnIwpVTP+ZZ8MPWAnbaHomASUnYMPRc8sCLtueA1eIQ5J60MXFJGi1a90k6
	xoua4+
X-Received: by 2002:a05:7300:8188:b0:382:61d0:f375 with SMTP id 5a478bee46e88-3856e63b050mr3380286eec.7.1795172830922;
        Fri, 20 Nov 2026 03:07:10 -0800 (PST)
X-Received: by 2002:a05:7300:8188:b0:382:61d0:f375 with SMTP id 5a478bee46e88-3856e63b050mr3380234eec.7.1795172830267;
        Fri, 20 Nov 2026 03:07:10 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:09 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:45 +0530
Subject: [PATCH v4 04/20] arm64: dts: qcom: lemans: Add GEM_NOC
 interconnect for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-4-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1069;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=J9MtDhNBRc3o2KPFtx8zuqYMoIVGqmO1gPFbpzrqgQo=;
 b=CxzlhjeUr8VvYUtjmp7JKW6HknNkVY9G9NNb994Oy2SYh/r7FFm1+OnmSzS9taDYET68xu9f6
 qG++w8LB6UOBPYBepaj5kOZ56dOvRRtQdRwSI+9scxEhST270OTcHXu
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX9nC3eVY7qnGT
 g0zoW5rBpaZQtU0vGOlLa3StkC0geo/kpJLahFrbEvGaGpZQyaX2809d5gBxmUpIbHGW8OBCQIE
 D3f6L/bW7xHWLa44oP+WOLtoXykBCBixREDt0HJn56ovfXiswFt+gNanqS0w8+A5YTTYB2ak0iR
 w9as2COQ+J8eoNCn/MZPOA8eoqenM3tQXUm+pTTpv4T4tSD+WwgIRi/eVJCctY6gm4wco3/KqG9
 cUgQnbW9LFal5AhU7ScyjALA+i5M48NV+4F9zoiy00wFkFend9EvLKZRgZorT1a0gk6asEoAUw0
 hiPE46d3nQkleyZy3gbbWodffpTM+u2jrzZbis4TERwWTwROJ2LKTdAf4L47aUyQvIqviLTDfzA
 S3qh2A3l/M9pbZboi3pjd0wPWzVJUMYEsLublqshNIi/Eda74dEhxSVTuOLIMCgvIwf76F6gDY2
 nBwLgyCHD3fE7ooIOIw==
X-Proofpoint-GUID: 7mB33KD5Bqpe7q0TJndDHVqVe_0Lff2W
X-Proofpoint-ORIG-GUID: 7mB33KD5Bqpe7q0TJndDHVqVe_0Lff2W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXwvxhPK7qRE+2
 rI5+AvpduIMW+LNJXw9/ZJ5For7gBU4i/UJy5SDbXTpvoj445guC47z0omP56R/60O9lJj6MVtg
 4Bpp/Q77UXNvNah+iP7XEzSl9fJk3qY=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b0029df cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JCeWlrImN8qIMoXkfH0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On Lemans platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 20f329c0df75..be71eb30f997 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3127,6 +3127,8 @@ adreno_smmu: iommu@3da0000 {
 				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		llcc_bwmon: pmu@9091000 {

-- 
2.34.1

