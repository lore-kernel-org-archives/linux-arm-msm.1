Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172892;
	b=TJczmWwQDOy7HahpeB2928qFw/AWGO0a8wUjPPpEBRN0DJTnyjpAHX2oRnWtb0RNR+HV
	 +9HCSSYBBuNIzSSlMi1gnI4SAQYJEsY2D4m86to9rrztrCMtj4WNowWV9SBcgAJx5A2AS
	 azgrqTOMuFrQ1m2SBZ84Su7ZkrnzyrhlWM+h6yqswC+rnM8cmyRYz5y/dXbn7Efcnfrhd
	 /SQFNBVeLakd90bUQb8AzQ8pdP6c3vb1/SyqYme66FaqKxXRTuS5ts9ylu06gP3u0KwNb
	 Oh8xHP88YHePCiePKs7gd77817Oi9kjdCakYe1bogba7ynHpgmPiY2zoEjKs4REV+XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172892;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=;
	b=vcawoe6FxGklzJl+HBWSrS9eDJXH0EyNSnucwYjrz+9jJVcSxFPJQ7c7U5ASopIU6FLg
	 ayaULdGMV4M2NCcgUDoqCtHl+QZ1DQGTr4Bb0ifh0yEKhOdkgvLv2UhXeeDfc8AxMYNkc
	 IS8QURlOxs88XcI5adzqZQx/xF2BLBY+O4md0n/NNYfdROAAZVCoz8HNBpm4/eXYnRBJF
	 73AyybPOKowg6NcFXm6Ccu5CF2Xm6nfhcV3f8n9/hy3d2pBDQnJmdr/TaY2e+d8WkjABb
	 OIE7VZWXTW6LY18n2MurvsbPquoChcvQWrOBgBxWuENrya41YKnKnGHdvnxhoIOdh0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a5z1jAs5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q7eqa4m7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECD860A3837
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DECD860A3837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a5z1jAs5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q7eqa4m7
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjrKE3731045
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=; b=a5z1jAs5MMdI0hy9
	/2sSylcgaFjGeMT5+JQIh628CxXAkjfvE755/fL9f0OsvxCeDWj5ivd/rlibN1n4
	Qa+fzaJNafeiNUnRu0LFOguj5A86icgccw440qy/gvvJTboiPZuvxSrGzh5F1Nr3
	sfbQq95BT8cJRKWJx4AU5t11Y9X4O6FBOlasoDB6Oq/76AZOAtQMJ2J6J+VKMMr/
	Coc4Bo/iNSUu7te1HH3XdtDKo2csilTZOCnD6x9l5QgQwT7ym0M2ldbfM6GFJLk8
	qyX7GLmnCSTA8B/6rqgXY/ZXu+2L1FfFYpdXIj7jsIFMZII/dvhT+QsCyUoIlUos
	S8ZhdA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4g3xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:08:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386177b0516so1028708eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172890; x=1795777690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=;
        b=Q7eqa4m7CWX/wdho+bYX8ZXWEgNWuiigyuAD0efI9CLoODBZ/V5BX2qlPvzQYaAWqI
         /2sAuGHpxCcyNeECVNOZmuL7thItHakQJs5Epp86XNT4zbbvtyvpUkws2gtKEg64bXUG
         rEozSto6I7fW2yay2VUKOf9uxZPClF5pZyKLRwOqsZXL2dHlnejIHSLlQpxn21EXtK0C
         rEw9HyfUy9CCLuSN9qXYPz9EKKDnna887wQmwL5SOZfYyiXT1o3uli3Q6+lKalAvMpjb
         MzwO3WPYeMyZ/Exp4yCBem+zrwCe0EB3GeN0vECCx/Evps28cQKEZSQLBnE1xzA4zaep
         0GSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172890; x=1795777690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=;
        b=MxImnrKSjdwP2trJ4LWe+oEQNo5fydWTxCRcSfPP3TvqsPWe83MMCVm/sZnhriaBks
         nyUKqAJ0AvhSGbbCY0eaA5516D5aGsZYrfC9xYzwTU5yKEIWWjOUe6sh8/JGKkiI0SFt
         fzeB6ax9Bqr7A8cH3lOkiIKPUkpdjNcKP6cviqy0pyz+qnulmuOMEX9PTy6vyYdoUuNj
         +xtPRCYV/FWxC7r2hnKMurNd7hRfG/e/EmjWSfO1saow7jgpoZGLkbIu2Nv9Js13yCHZ
         uC13xwU9gQZAY8Ksp0aUNpK3b5lS0QN4FyXnQ2DTYIviemqk1e3mlVsxhGawQTuAshlp
         0Yfg==
X-Forwarded-Encrypted: i=1; AL+hErFDjQpF7n1y00UCeTxWNHdRd/Fp8pssBDQ57ett2WYJozwRNHA1BmFo9fOHg3utkhtsUHH1ptAKm4HNuzHI@vger.kernel.org
X-Gm-Message-State: APuU4Z8wUr4dAhJYQmms8O1tnv5yMeACeXfd+F2q9I1XpGOX2B2gYU64
	7Ehy1tYyu/mW1bFa/kZ59kfWEF1Fy+BmDxIDk69NAdsZ5u/k1Bfc/4Bz/V0QuRzzj57ILCJfYY0
	RMNvooH7V/AEN71wKfjfnW+jNPFrK8TgGXYus0+aF64NHfZ+2Oq+5eZhbAJG7+VOyKtLh
X-Gm-Gg: AZFdTZfLoiNtWw3ofuxlAzGQ9H1uIL7gzg686vqTt2LMR7ktRXEa6uUa4UznXk4+sI+
	oFa5Q4ILYJQeNDmNtPT30uSvIKCTF8SSfGiwoY0Yq/9LI0WfnSr6l+qET7q31AilkEk+Uh19vyA
	7HDROIIX1Re+wrfFR5TJ3CCwpc9IbKAWedq2DZmeCrECCFxHpdlWMXsOsMchZhEDYs6D8oQ4Ola
	q1UsJez1dMB3gSrK8Wdfspn+0SYFjhLo44hs6X+tAyPGr7olpbeJJSZuf2ykPp4Lo2BugMAdv8P
	zPkGeTgruXwHlX7+iX9CxIPV6UIMlIsNm8Pp96SPVpkjrvVSRZJwV9aaTgItd9ZBv8fniMY/u5q
	L+g60lrh1lQQ3/RZw66UA/y3ZJGDWfN3Mf57P4rrIjMgQ/4E08Wan1Tz4VU1Jqa0aHXE1mMd5JU
	H8z0ih
X-Received: by 2002:a05:7301:3a82:b0:374:ea35:9069 with SMTP id 5a478bee46e88-3856fb67380mr2199600eec.39.1795172889786;
        Fri, 20 Nov 2026 03:08:09 -0800 (PST)
X-Received: by 2002:a05:7301:3a82:b0:374:ea35:9069 with SMTP id 5a478bee46e88-3856fb67380mr2199453eec.39.1795172887470;
        Fri, 20 Nov 2026 03:08:07 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:07 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:56 +0530
Subject: [PATCH v4 15/20] arm64: dts: qcom: hamoa: Add GEM_NOC interconnect
 for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-15-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1049;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=o8a7Ojp0eNjNzQ0rCM2WmCZSQ5u7xFkQL6aYtQmrXTk=;
 b=d2eocCApPGXdnTgSfpyPl1IT3Npi+VGzlX8Texs24AYeMDJUpxzteo/necfGq9pPJ+rGkHPav
 w2QQPhTc/MEDRSCceJSSG8DMzmugQp/HbB/FtH22nfxMVhA/fxUyyUl
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: lUuJkf3mtradez8DIRY6kbUpaER24DdZ
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b002a1a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=WAcSZy-hVgrt5OVmuNwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX+WmRewwhhMS2
 g4Arg089QPZftAZ7bzEvRH1V3DIKqKJRrb1cnfPizEWVJ+FxumVovhdlJFJBysXVG6MBCMg0dQE
 8Yruq9tbwE1A2eYruL216Y/LZgYIayg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX9zmTOmNa41UO
 hopB+IVB0VCx5Ur/PtxAGl0zTnoC3r82P6WFRMGoUQXMBK557HndbD2Nd64kbeZtwcdKnK9n6dL
 uiFPf1LSCuod/pKnarEwzPbUjSIJ7Z7HftXhEfgVrxY1A2+rYjGbxvH9AGm5bxnXiUbY7zr+Ial
 KLeSPQiFKBH8ngUbQSjs/baffsZRLgbCAoej7H/MmEozCQg0ja8o2OsbnEZ+9EUSHp/PuqHNOif
 4rF+2aXB12SJ08zGIlXBsAkOZbJ3n34VxGSlucRhaAH1Qq/Ly6RC3cX54T1/R3GIlRWPhHYVJx6
 Ooo825VH3y6mRzeY/wthSu9QPVlJpiPAbfEPtp3uc3tElm7c9qY6wyyzj8Ma4IZt1/RT05xzK8n
 pCNjDSQzA1h58IwiIY5r8QMK7iVmbLkyxmrzXpRzQGeYDiPlD03xocd4HkvnlBR++YU2g0RG2oF
 L3CS2GaRxCveZjahUqQ==
X-Proofpoint-GUID: lUuJkf3mtradez8DIRY6kbUpaER24DdZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

On X1E80100 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 443c1a5c212d..f5b720d73a4e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -4289,6 +4289,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		gem_noc: interconnect@26400000 {

-- 
2.34.1

