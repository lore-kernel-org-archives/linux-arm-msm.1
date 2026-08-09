Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863873A453B
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 20:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786306554; cv=none; b=TVD/ZErqWCzXJCR5BUoXKtyc5HcM/fihWMRgjqnLGQO6ko1JykBVH1Dq0jtm3SzGA7Lvr5XdeyASVD4hp5WrWg6xc8Osw655a5KTmCemblYRexT3MOO5Ch0CAMxGazIIwINyIAxGGojcmw3CxiAC5YsY8ec3h6PyKa79VbyJjFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786306554; c=relaxed/simple;
	bh=uCse0G4tqb7yw8phAOieTW4riZX8EVQqZbUSnb6rt0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dZP9mB54Iy0UHIJR4YtDQQqJpq8cJBAsJ/Z3Xh+1sxcwDFhHgDHg0hNkCy3BJL96PL8Gswp/zoA2uiX8EtGCSlL8RoE6DY76vJRGiKVi86ESrStZSjn59I4uMu9siN0TN94u2+M9Og4fTCjgn+hut0rDvWUtfwFJdNNx4tCOzag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MsDTcNBN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xp66vFd3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MsDTcNBN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xp66vFd3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679IAMwL3372239
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Aug 2026 20:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IzizJPNPjNfA/xYYjcXya67+pr2fJ/V/trczrmnBD7I=; b=MsDTcNBN6T7lOxBB
	BCgqY4hefdTCOGraIJtlKPG/VMQ7Jo9Wl114R0ow5VMx95SnAwqMKVKifPXbX3O2
	3opRGPQD+67ITCZTN1agBaiXIdRowd5MafuHcX/fkZHALM6F4byYMyhbaPd7iBQe
	ckqWyhArELAfJVQdUK/V50zHJcv+ctGx4UwpRgbwDvwTD/H8SlgHdezt3/4UO9ZE
	9eZHQTI0kt4Km70aMTyJysccdL10M2LiIkeIZ8J50RHoKcUprogYC5rnUAndZzO0
	Ez6TpHk9Wacbj+3rXM95mVzk7wR5GaI+XtzaXV2OT32lCo9GWING5HbIh/KkDuwv
	ITT24g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwush3hje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 20:15:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a236220so10236611cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 13:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306551; x=1786911351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IzizJPNPjNfA/xYYjcXya67+pr2fJ/V/trczrmnBD7I=;
        b=Xp66vFd3p5nGpeAuSXTmQhedVF3Dtb1QJVLoTEOtgPrv5WvJ3aP3e3QRstB3+cKCuF
         EvEIQTsxPhVIgArAbwCrlsLPvQSxfqJCySlxqrjNTih4qqcWzRfoVR6ydIwAbHpXyGrx
         JEZ18lBQ/Ge8ZgOj/7lzvfQNQvmEAKbHm4u4NskjaxCbs6soQct9oN+VsTgjvHQiPHpV
         7oINJbowhbY7KbpXdE2FPbunOATfxVr3lkvLSF2rzTFwvY0tAxtrLmxkJg4UXBE44Q5o
         ocITfjpzm8+iQchui39tHS0FCSxZIPuZc9ZY+PawUDCVsXk25V4LZ2CopOtbAw+wHvIQ
         YvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306551; x=1786911351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IzizJPNPjNfA/xYYjcXya67+pr2fJ/V/trczrmnBD7I=;
        b=ak9pZ4bcH6kk9C544sk6PqEnHy5jCLDENJJiHVlqW9wglmlmGdexkPo6P7+R5JfkCI
         H0TIxE8AioYzJlL2ZuE8RJkxeGvIAgbpPeZNa2rXtG5hka0arDFvQHOaHAZBTjs3lZxK
         DMem+rVqPT9D5bf/jVn2dbmb/S559aA4g/aUReaTvZ7rfpT3bw+48fi147Jpc8ANpTtK
         CCQnifkCzZ0GnfeUkSDdm9Gr1Os5S1D86AzxYrQ2/jMrbvngjRwR0wnuJr5F85JjV8uT
         tQDqXM2QjYfZwJmadct4WV61gx6t5ZaabHCoyHOZT6r08y5qF1BMKjbFFKg2Ydcz427y
         Y38A==
X-Gm-Message-State: AOJu0YwzThVxtfw0YEQ6BtCxHbDgDeixAVop8l/eWNX0n+AI0OT0fHW3
	rJUSmHsjAdCoj4aRM79zQW2I5peHT1otaXE530lRjywxr7XQAJWXsJKasknRNvXSn+8+eVPtvGa
	kco0IBpXHvKUJWlgHBY4ef3vAbfGCUfJM57tfOG0+dwp4929Xcm5BWoHTo2LXwqEg2yCB
X-Gm-Gg: AR+sD10sW1uN5lg6OhDvd2Dj2D9Biw3EpR+GB+tWYqbCgyHzeNmZtGxOr0DEPaK7zbo
	qx7THGDdwcLBM2nz7zm1Bc/5wPXEhsTfkAsZ5zTt4th3kVKM0MlfkQuk2A4f1bu5YhWfaSuKFO+
	LZd9LZvdYPEgTQOf0UgL95XhcDCrgU3+MCoR36ZaqZqmlrsGnZIQxtV85Z62eaP4YVvzoAbZllR
	7OtwngzYfPtC6lzEBxl716l3QwYikaq4kfmBLlioGS5SjdOtrZ4E3sAQTnYHD+8eZzgJmXaJVco
	3ZC40sr9wM9hEwj8+CKht+OwBCvPX9/pHl5muO/cYInsEbzoNBRT1H03G2y6P4l/J0xc3/CoKaB
	qnuL/QC8+3dwSLn8ZgO5zA6XWT1sPpe5igNX8S6cbg4ZYDe50atVf8yZj+u1KdLGLLlaZgzSzT/
	ZxkofcsooPZ1jywg==
X-Received: by 2002:a05:622a:4111:b0:51c:92a0:b2cb with SMTP id d75a77b69052e-52ce60d5ea6mr468766011cf.26.1786306550765;
        Sun, 09 Aug 2026 13:15:50 -0700 (PDT)
X-Received: by 2002:a05:622a:4111:b0:51c:92a0:b2cb with SMTP id d75a77b69052e-52ce60d5ea6mr468765701cf.26.1786306550409;
        Sun, 09 Aug 2026 13:15:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:15:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 23:15:41 +0300
Subject: [PATCH 02/12] iommu: arm-smmu: add global register definitions
 used by the QSMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-iommu-upstream-v1-2-87f5cd492560@oss.qualcomm.com>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2421;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uCse0G4tqb7yw8phAOieTW4riZX8EVQqZbUSnb6rt0Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeN/uOm5F41+fJk5lrC5TdNjqzxoqf3PLotfHc
 NBoDIXGCTeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjf7gAKCRCLPIo+Aiko
 1U4mB/9BkjLJ40OyMG0IH/Bav2udI9uSTLa2z5CQ/s6byYnQqqpJfmkKGapWsPPmTZOYi4xrwGE
 DH7SOwF7QybdC2czzYlfv9q4aganYXnX0yG7rheDfvDHXP2eIoiyBg1VD7u9g8vrfLZoHRUmOEr
 SzeGge2XA+1dWruNDf2P4NIJ6TRvGw51wd/ye6Pn7hkCfufp6Yz0ZFLDIwZcR4ERlH2n2x+UJJ2
 c/rBjygOzs29eHDg/ObTIX61fGFqAGCtuszCLfW8uy7JOtxjiraSvNL5Q2U+OtwmX9sqO7jSP8T
 wpNDypbpwympWONEQZOkL84Duewl2GrWQFXKPVK8VB1ZArWJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 8XfccAmP2KqgjdmDeqOMKO_P0kCUpztR
X-Authority-Analysis: v=2.4 cv=GvpyPE1C c=1 sm=1 tr=0 ts=6a78dff7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=M2U4UlAmMl8uHlp6m3MA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 8XfccAmP2KqgjdmDeqOMKO_P0kCUpztR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX35pNHXQTP1Pd
 nGX0W4YJPpdxIXjPc1pCMOnirNrYj5GeDTNr0QaJzNRPrhziolTB7g2xObR3pDPvDqA6u9Uwva+
 snFx0tPFGIxblkUF5UgFH7Vpt9p50SGRGOD88ZvEL3duAue0xPH9INSZjCamwQQx2uFHBrLsOyM
 8mnBMD02xaOO41F1azoK7wgLn5WDDNRePWZ+KAyz3pgN2vI7jCrG7tPlRsz5S9IGQCsxjtTmvuB
 X7Nv4V+Gf6FAjymvbVTXvBxJa5R34n8GAg+s14yHA9Gib6AbNwUaOB6s/+xYjth6SVBpj3ny1UI
 tWfREitNVOeh3jvPPNZKEnh253p+sXlL7b3WY1fmw63F1Fy7dHxiClhb+6ZQZPQQgB3b9489XD1
 6Fe8HELj6vQhgcGR78BZKIW8ltMPM1ybPSEPP0hVHaCC8iQ1T8beeI6ZTCp7HsV4C86SCB0JcDF
 WO4YFINL5fxEvwaGXcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX64AK5nwHOTEX
 Zf8QExydhioPrfduxvDMfr3khIX8p6Qof/6hvUQrRgTCh5wrKLJdNUhWWT0PXS1fLzqZObw+piH
 SL72rYZZVnQkNnxg3l2ZTDO5OPlD7Io=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090183

The MSM8974 QSMMU support about to be added to qcom_iommu has to
program the SMMU global register space itself, and several of the
architectural registers and fields it needs are missing from
arm-smmu.h: the secure configuration and fault registers sCR2, sGFAR
and sGFSRRESTORE, the sCR0 SMCFCFG and STALLD fields and the S2CR
NSCFG and MEMATTR fields.

Add them, sorted by their register offset and bit positions.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 26d2e33cd328..49424d8aca6b 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -26,11 +26,13 @@
 /* Configuration registers */
 #define ARM_SMMU_GR0_sCR0		0x0
 #define ARM_SMMU_sCR0_VMID16EN		BIT(31)
+#define ARM_SMMU_sCR0_SMCFCFG		BIT(21)
 #define ARM_SMMU_sCR0_BSU		GENMASK(15, 14)
 #define ARM_SMMU_sCR0_FB		BIT(13)
 #define ARM_SMMU_sCR0_PTM		BIT(12)
 #define ARM_SMMU_sCR0_VMIDPNE		BIT(11)
 #define ARM_SMMU_sCR0_USFCFG		BIT(10)
+#define ARM_SMMU_sCR0_STALLD		BIT(8)
 #define ARM_SMMU_sCR0_GCFGFIE		BIT(5)
 #define ARM_SMMU_sCR0_GCFGFRE		BIT(4)
 #define ARM_SMMU_sCR0_EXIDENABLE	BIT(3)
@@ -38,6 +40,8 @@
 #define ARM_SMMU_sCR0_GFRE		BIT(1)
 #define ARM_SMMU_sCR0_CLIENTPD		BIT(0)
 
+#define ARM_SMMU_GR0_sCR2		0x8
+
 /* Auxiliary Configuration register */
 #define ARM_SMMU_GR0_sACR		0x10
 
@@ -80,9 +84,13 @@
 #define ARM_SMMU_ID7_MAJOR		GENMASK(7, 4)
 #define ARM_SMMU_ID7_MINOR		GENMASK(3, 0)
 
+#define ARM_SMMU_GR0_sGFAR		0x40
+
 #define ARM_SMMU_GR0_sGFSR		0x48
 #define ARM_SMMU_sGFSR_USF		BIT(1)
 
+#define ARM_SMMU_GR0_sGFSRRESTORE	0x4c
+
 #define ARM_SMMU_GR0_sGFSYNR0		0x50
 #define ARM_SMMU_GR0_sGFSYNR1		0x54
 #define ARM_SMMU_GR0_sGFSYNR2		0x58
@@ -110,12 +118,14 @@ enum arm_smmu_s2cr_privcfg {
 	S2CR_PRIVCFG_UNPRIV,
 	S2CR_PRIVCFG_PRIV,
 };
+#define ARM_SMMU_S2CR_NSCFG		GENMASK(19, 18)
 #define ARM_SMMU_S2CR_TYPE		GENMASK(17, 16)
 enum arm_smmu_s2cr_type {
 	S2CR_TYPE_TRANS,
 	S2CR_TYPE_BYPASS,
 	S2CR_TYPE_FAULT,
 };
+#define ARM_SMMU_S2CR_MEMATTR		GENMASK(15, 12)
 #define ARM_SMMU_S2CR_EXIDVALID		BIT(10)
 #define ARM_SMMU_S2CR_CBNDX		GENMASK(7, 0)
 

-- 
2.47.3

