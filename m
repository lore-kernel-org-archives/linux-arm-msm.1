Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182213;
	b=mo1t+7ikoH89Z9N6fwZz+I0wNz222M4pm0xAd1qVbIuigcbSdC68WAB+KXGzr8s8u8vh
	 QvvdUKiZ3gJ+/Qhai5pyCP0U/YIr6qjcJ25FQVle+pIb3kGgul2UeYBXSHQIJ2xVznH8D
	 zBqX8HeRyrv9BXL/p/5gmajNtRVOzl17J8WnggUEO4/t6hCffwI7lMmYrs75ze4NzqK+h
	 B6vNJYa3i1Zgc/A/MPt6XXE1aVkRbI9AtNogDZzPRDkyFXfpsamerQWUmPooip5subA5b
	 GmxvdLzgYVTOFFAu7NP6Rmo+uQh1DMHNphXQrSKQACcpdeq2XtKNsbm6yu9m++mlLog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182213;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=;
	b=kQujSoYGucFKG+Ww7cCnHz0cymASwt9VNmGzoWZGQsKbMNpCw+2YT8EWD2QCf1f1a15k
	 PlOKXA/oPcsOfq8+XgNV7GrIyW0IfLLrlbqH3uBu5LKMvAmrK8txPLfFCXjhK5j2Pwdb3
	 O+2kPuW1EpFZKY1jPatR7kRKsYg/KNNqCbiSMpaInumn4X86v0IWqPE87f+6GlRcLCUe/
	 AFZqxhspaUJehPG7N4qLhJXEVDaYP2ULZ88sze71vHWtH6Q7JoqWdxcq3YdKuKm23/aQ7
	 2EwMhDpqN2zd6LzMbFidDEja3c8JDa3rzOWYjsmT2pOUlnTEjNMoeyQypFmIS5IzYsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iDX0SQ+C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QHojL/qi";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9565160A2622
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9565160A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iDX0SQ+C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHojL/qi
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk8KX3731854
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=; b=iDX0SQ+Cr1ar4w2/
	/00qhlTElkSDRnEmUQlPi+xNC0A/bMK5ZEluq4xFreDF08sHnD7XlIDatmHuEbXL
	Cl14V2IIgHrxwOOZ5ftiGmRyt7AvupSMONsCgdNX7rhQa0QBAazPYgsx3GgenvxQ
	KotBHRuAbiL7u3y3L0QFuc5vEOhTDTmyskYlAScrl39mlucL+B+41vVCA0vJJ/0C
	LrrQEmZQjEsJT/gr3TJgVR6a3maErIxRiuiK6dZptPpxLSNgTv9rnS0vmIgWmNjA
	CQp6zALCNzC691rLA8UD6khSdDEYpBzfTkwCMAkswx/abSzJ/rtWR4w8qcLMUbh6
	gKvcTQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4gnfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:31 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-382af5cfc58so2557641eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182211; x=1795787011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=;
        b=QHojL/qi9fj5sw0R4poubuxdu1kdgVQWNiyAfa9TYDF9h/TJPQxW48/BDDc+dE0Hun
         zh+hthr//hzAIRqAsA8LqdOOFoOsAl8qWrXvfX3TN5oMiEPu/yhOakyIIbRWCF/rT9L2
         g89fzpuEq+7FXsIM8NH7reXckSbh23EC8T6lLoqZ0o6yJh0T6WcEJZFmahARRxkH23Qs
         VmoEzWjLhHe6m1PXhgfOKyU1F8gNsDncGwv8pwc6hHp7mkflVCBhUmoImnUSeVzr1Hp2
         8tNQKehH/zwjFrMY8jRnRjBuJP9itJ0tOPDdQ/zyD200JIBG2W4Qn1iihn34e8ylFovZ
         61NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182211; x=1795787011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=;
        b=cUyI4LApUBfVeOmiNAIBlMql68epSmyxMW3WcpfaRiQO5Jsbzx+FKjpnwCLfTWPSh/
         S2KXfrvpYbnfiU3W3xwsb8YalkNbVMxzoSaSXQhn+wgGPSgC4sUmyn+qkOZvPA3ZaaP3
         NOug2nacKdMt8YwfGr/yy5r1Gj0kj5ihxkCRRFvYRmLFQAhUg7Q1dnBFZ7Z/4MpLs4rr
         /jEVR2VApmd0OAl+BvnVjKuVxi8o9qFpuMWiTF8Bz5GtMwxmkWIs71clZsRr7rzs9QVt
         hvSkoCkpZK6to2LGkgotGjpza8SxuHmoCPLuV818uXr3sdnKj1W1iO24/KhfajRjWp0b
         q/pA==
X-Forwarded-Encrypted: i=1; AL+hErEpnXDn1ZK2e7MMH/jx2JH7QudfdwzwFrPIm7YzeCuNXBYpY756RJbtuDJvk0yH8Af9ZrDzWws3/otpUM0X@vger.kernel.org
X-Gm-Message-State: APuU4Z+SMZ7COdhZxh71R2yLQEvg29SdVX883gA7tVS4mdUUI5yDjCdH
	BPhqWodc/mwsgQc3zG0Fhjg/zD4vgEw2+8L0eazupa0Ca+ryaJxstRApQ7R+tkCQgQ9E6oesoG9
	SS6tmTD1SisTRBPwBxuULMpb28JMmgVfD82BXE7pMGLmhR2kX/6rwFcY0uSpiR/qU4P7uXJ919V
	Id
X-Gm-Gg: AZFdTZfXXOsb/P5Z/M+f3qhY/MmvNqueNexvGS2jyX1y2hYyHS6IzoHAYNMnzcKLZuy
	C3RJk27Sd2NOc316dhMRNiYvwpXDztpR5lqcIXD89sNSMP6GZ/a/4XGEz9JVyiZdxGINg4sWeO5
	M6eGHj2Tp3snWmhC8oPc3tvuqZIcT52ZVYaIzkqF97MgKXfaMFDdrOdwAUhqDs+fSgbK0fANth/
	otlYIKUQ1H8hNe2/3YAy2K+/H4CKlAjROmhuRQdfOJPO7ayDy52qT462FtMt5X3Q1ubC5xynxB4
	I1JeUGLOBVNo1JtMTuhVekLrrXxxmVu9Ea5KzJxeerEace5URHoLYT8smX11gCgTYow7tcX5par
	z9eUrgbd4IKEgvNTUqKBmxn7EkZApwEkdO62lFgJA+4d4ZV5/UrIfiHVGgLWcDwK7AstNj5JUHs
	Q/1Wo=
X-Received: by 2002:a05:7300:ce11:b0:385:774:fb23 with SMTP id 5a478bee46e88-3856e63b5cdmr2985137eec.6.1795182210325;
        Fri, 20 Nov 2026 05:43:30 -0800 (PST)
X-Received: by 2002:a05:7300:ce11:b0:385:774:fb23 with SMTP id 5a478bee46e88-3856e63b5cdmr2985097eec.6.1795182209587;
        Fri, 20 Nov 2026 05:43:29 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:29 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:43 +0530
Subject: [PATCH RESEND v4 12/20] arm64: dts: qcom: sm8450: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-12-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1046;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=XGSCDo+PAJtTWrK9Yli/KgTXld6tpUWo0Tp3e8IW/LM=;
 b=pw8cWvyKwent69F39bfc+dvHudt8wpagQHoCzw0hmqpwl4FfInvFtYZNwSN1sydn3qGmcjJ/b
 vgngXSRqSFgDW6kPfAk8Dm4svPRauiLxmUoEh69/6Or/Laf/oJ2Tzp4
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: vKJ151ZV486MW3q7bJl47fbLSP-vRznH
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b004e83 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fzENmhSgVi5qTvzIpAsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXxnLu7a7EWdPs
 lSNUV34b/bL2eTB471sRB4q3nO7jHFN6nj6fMaUi9fwJH75bLyuupExUyLiQf7b2RtECGxq/+1/
 2al7b65hcNd9jIgKcbs3bycz8Xs3nus=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX0kGyllB+64WK
 J9AThr8OY2RG9WyVq1UKofQ2XyGTjd6yy/TVBVrrMRCv7NeeRwC35mFDZVhpekAGY4c8RUt8Uo5
 MoeEdPlCpxl5ZQ7n/INLqR8OwkzV4fpBG8hX4P2+YFKR7+4dcRobpPXkkCiTkV+F+wHjGAaNVzF
 cbgFsIVTrz43pHSEOnw94vvdsCdv1BA/riMLhUvs0aYEFM/s2n4BvFmuZF6QDOFo0Vxhecbr8CU
 aXCJWa9WAk2ocRIbZgD7H70GsM+CsSlC2J+wkcZVd57LrsgLNxZ8yDXyJdRn7tlnRAHpCyUUtmm
 OwhSVvsDt8N4lPYYdLfaiE3FS6NMctONdG6ARAupstYwKE6Kkxuk+n7uQW0TwyrMY71R6IP0bhA
 i8fieG0ftjjX3UFg04I4kKuX5+Zl2kqpZ1CUAgIipE20NbgSBp7mBR+l9A98hJspGCkHnu8NlkM
 HF8sWweNMV/JXJmj+Ow==
X-Proofpoint-GUID: vKJ151ZV486MW3q7bJl47fbLSP-vRznH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On SM8450 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 8f84668169fd..f7dab346cc70 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2619,6 +2619,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		usb_1_hsphy: phy@88e3000 {

-- 
2.34.1

