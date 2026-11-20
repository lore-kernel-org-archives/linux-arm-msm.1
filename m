Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182170;
	b=tEFOKpB1WfF4g2BXTvm9l/lZdfmdz362D58/zuEhNgywKu9JDFY442ItYldFSZbckRNe
	 dqeKuAcDunlyMxk27dr9UxDl8wjuLT+zUVr7cj8ySbFPuDZiYVJuIj4aCMve2vM9gjagl
	 YlWCW4rOm0Qj8TaM2nVaTdN9GxHrf7Av3UsmlW/+d9lEkP+82iXM6S7p6GicSDgzJKMzI
	 66CPQ2jTzpcURc/VHp2CjJcUUoH0saV9qTUqXsE3AsFX9FiISEZUkJZjKEufTgLiwqKyU
	 E86duUNiqRjEsQr64235/8OiM99LxzskZgkwNVR5QWsfN8edoS1T3jZzll7+uqkxbTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182170;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=;
	b=nJ7F2cVcE/w/536jdNDrn9WH7j+kzSI6c8BcmAviW2zzxsSuWSRPLyVO3D3hemwh6/Ya
	 ygIWu8dklqzH9PmMwsr+SSWFPGF1ReUjZNZiL0j4qp/wmbSrpNpmOXck60eX0UbTHU4eS
	 aV3teHm/sAcG2Zsv+Vg8HuhrL0PQF7i6zJk8ZA0ljK7eIOUYP9RoK/PeEOFCGUAJNp9Ky
	 I/RYWUp3+AHxVfX5wF1sbEuNvSI+KI7ezOkr6qN5IWZ+xDWc4eYf8bN1sJCOZz9InK+Ke
	 pCCDEFxuHA1w5mQSuFAfx026GUQwbTwTV1530Q9Ru3BG+L2SslyN519Bd61C6VUdwRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O4brvdgV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=crhBRk2L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A9F606A325
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96A9F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O4brvdgV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=crhBRk2L
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKCouhL1333741
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=; b=O4brvdgVbiXuTMc9
	LN62Jg1q5tbIRntaWRcl3gHKiwH/ChVhSvmetIuALcoqkh2eEgyuRKknvmJ7fNPV
	AUvlfaWXST3o4P/Tivqu/+rWteNLV5YIxg6oQVDmXM2dFp9JP3P/fSFSmEcZhkQL
	ZKwVapbDXEvrHmL8Fo5Tkl4ahOYZEltCgO21hN+AA2zDCqtRZz1pPlVpClBldPoE
	7hiUZwYrItU49V/3zOMkWRL31X8Egy3EM5fO+JDlhFsYUa52ok3gYZJ97cn9cicH
	FO7Je6M/A7ryMgyt6Z448yXcLQ4TQK5bbbX2lVMEDZTo0qhXWrEDY/luGO3evel+
	spNcsQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykws1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:42:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386177b0516so1465665eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182168; x=1795786968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=;
        b=crhBRk2LINSaQrjNVeq/9cHEFUi49r3+A3PUG5PL1Z9XtgNDarpRQcoyerF7ugKIzZ
         F7okoJeY1HS0fOdC+fgCrms7O+1pmhy+S5Sc/BBMdONz3wAr/DGSR2FoohpDWfCE0Ktk
         zpLfUDdIsS6MhouMFFG/VX9XUQHRv7pgYUSIBLePH9sNS9hfFiTW0iqEYRRo6kgUgSNk
         J1A+QkAWR8G4/q6+MKYcoh8DhDRmMLKKtcpPw97XGFXwYPAOMJ5s/toNuGbHMdagzpGa
         UIj8GcjmTxOBmcS4U7KuDDiNEsXSZc24ENQZUamNRq1gF5oE+mGYDGq34Wy0l0iH461y
         zXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182168; x=1795786968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=;
        b=QfvsHjxcfnRBtw8djytiqUXyAd2UmsbpHWNBJye3Iz2DGd9W2pw4qfojNTnweJYY8L
         e9VHxNLYlJEunWyKTUANTzPge44BvRLA9xuv+tFyw5wE1azIVcvDHcDEZp1wtIWt5GiQ
         2vb0kelwMncp5mA+7YaUjrP+fwTfvJI7/NhcUYAIYH+aMXptwahLtnsCJZFXqWGSmCz/
         k+/t90Caxhem2Pe3AO/eHDNfMfOuxfbqc6OQZcs8B4pzeoUI+/1yVvOjL53kMLD0UIDB
         n5APcWVvT8OgEuR63PgPwX+PjZFxdh24PgL/fUbSNAVTjU2takY4GDwCFWWILj7p0W45
         9Gjg==
X-Forwarded-Encrypted: i=1; AL+hErH9KAHKYS/1yrWRbVJiu08cj6GyugGtmWgLSCYyEPA5Nb0gL18nwpFvBQHYG5Fd6RBqO/Z6Fi0vSug+zLYk@vger.kernel.org
X-Gm-Message-State: APuU4Z+jeYlXILGEEcJO2qfaKih4ZEBxT4uEItOzOFy31yKv/qEakVHw
	SD1R0pYK69wK9sWtfjCSeMoz8Kdp0c5MP7mf1V3quPJpVOYJLULURP+srfWLvbv5RqxMVAawJ69
	p+wNN1IElTxvf46FyDJDEWoGPXsH+Pap6mXQQDASOLlCSF7sd8PddZz9R+QYTQRZI0iBT22Qdg5
	7+
X-Gm-Gg: AZFdTZe11eij4OG0yijmg2fOB5ns2nL70mAkyTfs/iedLbDGnQzc/uQyLTpvaz/VTYB
	fo0rscO0Mji/V/oOAxn0V/YuTfK6hN5QNwdmRqkpgjwIobmeH8zB9r+o6ei6KbmyuXqD9d2QF8p
	tUu+TTeFIKD+3+Cp5mpG7hY/YhX4NuJds3r9QWJcCWoZq88CkIUG9575ChrMlAdEd1pVk/H55fs
	t6HIi6xd1KQfguDGy1wW3l5JGRJpxdX1mXF7bqhLqFRA7k3eKZvLyuPSNXrY6PqzznGj8amnW59
	dTGP1M8TVp8oA9BpM/K9j8iLSoq6gDWWi/SsUZmIOGEuhnQRl4Hcy9ENh4hfFQIURmfOBK7QuZP
	IQ9HAGjPOy9BF1kM9jjN2sCtVK73MYDD7yzXxTUkZ+4kYZrlWSFiNPUNXSgWl+9BCAQn4cVeaEp
	Hwci4=
X-Received: by 2002:a05:7300:7a21:b0:384:b001:4350 with SMTP id 5a478bee46e88-3856f04b191mr3187792eec.24.1795182167465;
        Fri, 20 Nov 2026 05:42:47 -0800 (PST)
X-Received: by 2002:a05:7300:7a21:b0:384:b001:4350 with SMTP id 5a478bee46e88-3856f04b191mr3187750eec.24.1795182166834;
        Fri, 20 Nov 2026 05:42:46 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:46 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:35 +0530
Subject: [PATCH RESEND v4 04/20] arm64: dts: qcom: lemans: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-4-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1069;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=J9MtDhNBRc3o2KPFtx8zuqYMoIVGqmO1gPFbpzrqgQo=;
 b=GunXIg6kgvtDV3uM/J82EzQCVo6lYY/weJi14MRG4ovrA4l4K3ivsa2Ji0ZDR/1rr+ACTwOJb
 JKuZYPMYWySD+fnfBCErjgyWMClxa6InplJWk3v7QoUiLidllSJzi8A
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX4hxqbGqJrA/k
 KarwKGhpuq+ROGQh0q+UCHOLilAEj18Fdk/TqdbFEl4FA+EiBfUUro3trytHfItTtQ4uoUNe9ri
 vM/TXa8f8TahK4sJ9h0WY1cfXCJkhsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX4SdZncfuLpr5
 FEIjKlNpow1fq9Dol/oc+VVxYBzA7TKUIFfdR/QTLeT5z0tvPEW48hmXYBPNlvaldDGjNT9Qy1c
 BhfBa2dPgdonCJ6kznNTQbC8qjt7fJXtTkYM3N0HMRx6GuLB2DCRTrxQsTUJmhh2mCXNO9Q8IIi
 OqdPX5KtQ/ftVvBxGFgia6o6cfrMIErMkUfaMJsV2fMfPMgJdC136HtjnINuA7d8DU3J99H5K17
 fXVA89F4sRctHz7FK+QoPnoqAXXjkJeM5Je/EZcIvbUVnI6u6zBtJHXgKK1Pi0KNlxc7QZm5m8O
 g2V8NYpmslKa/GYOp16RwLze8eZUHROjEYzOe2TGTF1q8IOfzYqNtK0olb1wCJSMAFOmwOr7c6N
 5g/iZdCW9qIndMIGpjvM6NOVsLth626goesdEkeabDWA+n8ZwnthFaAmAP4umepKthPCGtLlUxj
 pDUPPcMCRPH1LKxo8hw==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b004e58 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JCeWlrImN8qIMoXkfH0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: wRmTv_XDdqVT49FI3R1lJiPnk04BFPtu
X-Proofpoint-GUID: wRmTv_XDdqVT49FI3R1lJiPnk04BFPtu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054

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

