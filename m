Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B873A1E80
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784320975; cv=none; b=Jn5slAq2JY0zB769wqZnyDqtJ8HiSH/SaupQqwUFdpRme59D4AaohzDVCwYDJRm9+R4wwhZv9IByK9NO0sLjpzFBRw+8Qy8SGMiiFXaDQOUZ/hjraFCqKLpW/2ZWr3nqR7Dpx6gmn4jUkRBn+P7I8JGSva1x7A8hOjqJJELDnBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784320975; c=relaxed/simple;
	bh=vQlIcgFAKYX/5ZAZklrZCNWjazzEwZ+v2QyY+72sT2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MhSXvDl1+a95B82F7fNVm5iAZ/GZxUFC3QkK3Sw5FSlhkYirFlWgqHKSN3QebEE7pKCY0Qw7wvwAPA4HpmWITtxxfui7z85nvQDPHZ2/G8lbO5oXPtlwDx0xgPtc/0IcYYEarzYC9h3NRWUgNJ8JcgGIMXqtXhQF0EDyc/xQ/T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l+KULMYp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0RRntKa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l+KULMYp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0RRntKa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtSMZ2886992
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p5EABLMYgrPqX+e6g9POPOLdFY8Rck09SBi7ZSFcSKQ=; b=l+KULMYpfhx31Xm2
	SEo+MCsYLBw0rqvsugbSuJE3U8AVVu9n7JQbKyTOwTopsx0Baxebl2TPoyQjTWgP
	ndTlv6auJpOfA9jfxYIpbn8Wh/D2dNzjTyRQMEUzi7uprVcvljwUkw8NvlFnZVaO
	2jb+MQggIjV7J/yERkZ1dw7e59EITu+O2P2P5uMNzvJ9rAFf+0UNL828GGRz+7VT
	Krbn6NkPe3Gs7OjPVJnBpB3duWq19K0vDf5Wh1HsE5+BoAUeKUbKomCmqeRdy+UO
	RHCBCGd6QD5xP94aykQe9weASI0/1dW4vQ+1+In5Hfv3UjgsZb9+k8USEkzfoFl7
	aBl42A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffhpfjmb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:42:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dad28e86eso12194057a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784320971; x=1784925771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p5EABLMYgrPqX+e6g9POPOLdFY8Rck09SBi7ZSFcSKQ=;
        b=j0RRntKaR2bzf5vlUdcESPDKD8l1FFtPSgrEpVxcpvNOdEzT9Bv0wr97wAA+ZV58t+
         CZcpjUlWNxgNVItkdxMvg784r0ESDrlNuYQQh9QBQVOIOCGOrmGYlMJ+3qQdLvJWN/zo
         c9hbeNpVx+lWyhrw2T3VPOgTp0iywSiZnfP9WQ5mSeJAnpXtaj9uahchfjceSh51P/o2
         oYrNABkegABhE8nerZoKGGqDGhTPY8HNX9/TLGZTnwVStNOQjCbEOBHPgoRzgqln9bHJ
         oo04QsgV2IkMvxY9RuTdej6zXeKRwFH+K+4UUIGz8LB0j3wc4UtPBO1KReNn1Y07rdDa
         Zs5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320971; x=1784925771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p5EABLMYgrPqX+e6g9POPOLdFY8Rck09SBi7ZSFcSKQ=;
        b=d/9XySWbi5NilU7Ay+Ptpma9ciMH37L0EoCOTNmtjK0z5uujKPRHKPtj2SZtfrVGsF
         jPtWl89RbxJbC1nroCZUCH/5vyDpSkgMa6nkX+0yBUQd0+UeXZbWGOmn5N5RF4k4aD4U
         RtJMEUwYHRTUPI3UlJfcTXqsz4SQnGTh3J0EReTsNaY1jjX8OqNPnZWENDb2Q5ftuzFw
         L82dn4AzGrH2NURlzt+Cp6NYycekz9JdRlsmBBTUw9Sm8WKsRT4A6Ldh6P96+1E/JlXh
         VXCawtCRtKd3hWBFVBb/Cw8T2Zm9efJpGOEYOCyaSSJQtXhUInAOxmM8bAjn2aktyDDf
         Uqzw==
X-Forwarded-Encrypted: i=1; AHgh+RrDI0PO1AFzEWAMCdkBq3S6FQtynnuDWMn6JIkrW6QaaoJC/G8NnpWl7+luGFH1h6VZvvpUiM3KD6kbHhA0@vger.kernel.org
X-Gm-Message-State: AOJu0YxShE64jVR0wtE8WliGbH1H3NAQNVCUz6BTbNLZ9SdZ3ZGkMu5h
	TEr51NpuBVGbw+9M+8uFQbw3KiX3GYbYmeMPDBzfJWAv+B459WWleTILiMNB2HLQa/vCbostU9h
	Q2j2L7dGPa/jFJ2YGzRZivS/hqVG0Oa8qEM1lUpukefBANs0hDGQvCsZqrvauV1BUq2ZV
X-Gm-Gg: AfdE7ckun4MOnCm2HA6HxzS++liyZdwgiaVpIOt6YVAruOUUlzL2Fq12eKNgSZLcgwN
	pLCoMU8d8Jw+jS8t2PeiNF0DXQEQf8qBgDeEPxiiLTUU0ScxVmohKhq1U7Xiz6tNxxlCBhunrO+
	5JF/5+Af+IZ7ga5vjm5mFdtpvyiHsQ7JLtJsSpO1CLawYR2+Q4iNH2wFU1Y6EdJurPvCjsEzhiN
	fFTk4x6x9tLBqiYHXXq1Pdy9mt9dspyNVLKbF2zSiQItZVxDLS+NyeOWBJh8rSdeBayocwal1fy
	H4obryidg5sdKXNR+ITR90BOXp5sdO5XpuYU/LxEHNNGi1M7xLVk5GNiT78s2ufHqcOsTwhTH/N
	YM86iANZI22rPJuK9gibqhJhp
X-Received: by 2002:a17:90b:4d09:b0:38e:2fa0:491b with SMTP id 98e67ed59e1d1-38e4b594eb3mr4384603a91.31.1784320971028;
        Fri, 17 Jul 2026 13:42:51 -0700 (PDT)
X-Received: by 2002:a17:90b:4d09:b0:38e:2fa0:491b with SMTP id 98e67ed59e1d1-38e4b594eb3mr4384579a91.31.1784320970601;
        Fri, 17 Jul 2026 13:42:50 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm11322997eec.25.2026.07.17.13.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:42:49 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 02:11:32 +0530
Subject: [PATCH v2 7/9] arm64: dts: qcom: eliza: Add GPU nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-eliza-gpu-v2-7-64379dbebd7a@oss.qualcomm.com>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320899; l=5441;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Tc760x2HSzCAh01NrUqagWazPo/xG5E3TZ5FY+sYPYo=;
 b=HA2PZqykYBrV4RxYXVrVfdMUsWyeU8C73KsGv99Xxxv8wFWMitPeXYsK/BRKzqOJIoyWF4R1r
 moUX080nk0OB48kkfTJC4ii2Cs8Joi8F03FvySccGIMkTAqODwsuEWv
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxMyBTYWx0ZWRfX3i9g0GEnrF+e
 rW0FW3hTNwFPVW4UtBJVNUmM+P5H7k6Ni8PkZiNcQwfmu9RkMsTSSrGVJBzql+IJZfZpDckVdml
 V/Nnr+aaWJzI0gKbS7/q/E8cL2NG2vyHc58pDEZ+Ekvc5peQojvl7iCr5aoKyNmJ4vfvsTKRi/E
 IH0cEUO77HuX2/Q3yfhMZX2A8IgGSbq0pgayOw8QOS3j1tIltvUYTfdr8H+0vNoT0nqzsuxSAxJ
 BpYatOplSlPZ8hd/nys/z0GC1YrZLagQJgkI1Aj36GTOa24NhrsKxLZRMvIraL/9yz3MUZKgT5v
 zWAZozgOzeYNbxGC+xImgiNA7vu+v1cnZkSDE/yw21BTITXQifZwyKwcd+nu07LxqXOVnljH38x
 RRHBNoE0f+xCs9sP+GeQ/U+UXxnOAIsaqys4XXROBE3Kw27FFKl99AtzLqPEJEE89nONeFk9aNL
 ZTsykSjkt5VMzPChxcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxMyBTYWx0ZWRfXyMnWXh0Xw0Ea
 AZ48etJNiA6OG44fsft7Pd+hjKvDsQLqXaZlS+DM1cu7sY2vfW/dIc96XsJK7b3LpLLPfA0kzpN
 w7UgQMFf/tGVPaBvDmF3Rtfiq9W1pL8=
X-Authority-Analysis: v=2.4 cv=YeWNIQRf c=1 sm=1 tr=0 ts=6a5a93cc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=p8LQYYvwJZuHz2WWpfMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: bSriBK-WNITIwr0Fox8MWNiQE_0M6qu0
X-Proofpoint-ORIG-GUID: bSriBK-WNITIwr0Fox8MWNiQE_0M6qu0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170213

From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Adreno 722 found in Eliza chipset belongs to the A7x GEN1 family. It is
derived from A730 and shares the same IP-level configurations: HWCG
registers, protected registers, GBIF CX registers and gmu_cgc_mode.
Major differences include lower cache/core counts, 1MB GMEM, no
Concurrent Binning & LPAC support. Some of the peripheral blocks like
RSCC are from A740 that resulted in updates to RSC layout.

Add the necessary devicetree nodes to describe this GPU.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 152 ++++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index e5b8377e6c3a..c24c5e9695d5 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3742,6 +3742,158 @@ nsp_noc: interconnect@320c0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 			#interconnect-cells = <2>;
 		};
+
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-43020100", "qcom,adreno";
+			reg = <0x0 0x03d00000 0x0 0x40000>,
+			      <0x0 0x03d9e000 0x0 0x1000>,
+			      <0x0 0x03d61000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&adreno_smmu 0x0 0x0>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+			qcom,gmu = <&gmu>;
+			#cooling-cells = <2>;
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
+			status = "disabled";
+
+			gpu_zap_shader: zap-shader {
+				memory-region = <&gpu_micro_code_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2-adreno",
+					     "operating-points-v2";
+
+				opp-259000000 {
+					opp-hz = /bits/ 64 <259000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <781250>;
+					qcom,opp-acd-level = <0xc82f5ffd>;
+				};
+
+				opp-345000000 {
+					opp-hz = /bits/ 64 <345000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <2136718>;
+					qcom,opp-acd-level = <0xc82f5ffd>;
+				};
+
+				opp-515000000 {
+					opp-hz = /bits/ 64 <515000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <5285156>;
+					qcom,opp-acd-level = <0xc02d5ffd>;
+				};
+
+				opp-645000000 {
+					opp-hz = /bits/ 64 <645000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <6074218>;
+					qcom,opp-acd-level = <0x882f5ffd>;
+				};
+
+				opp-724000000 {
+					opp-hz = /bits/ 64 <724000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <6671875>;
+					qcom,opp-acd-level = <0xa82d5ffd>;
+				};
+
+				opp-796000000 {
+					opp-hz = /bits/ 64 <796000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <10687500>;
+					qcom,opp-acd-level = <0x882d5ffd>;
+				};
+
+				opp-900000000 {
+					opp-hz = /bits/ 64 <900000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <10687500>;
+					qcom,opp-acd-level = <0x882d5ffd>;
+				};
+
+				opp-975000000 {
+					opp-hz = /bits/ 64 <975000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <12449218>;
+					qcom,opp-acd-level = <0x882c5ffd>;
+				};
+
+				opp-1075000000 {
+					opp-hz = /bits/ 64 <1075000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <16500000>;
+					qcom,opp-acd-level = <0xa82a5ffd>;
+				};
+
+				opp-1150000000 {
+					opp-hz = /bits/ 64 <1150000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L2>;
+					opp-peak-kBps = <16500000>;
+					qcom,opp-acd-level = <0xa8295ffd>;
+				};
+			};
+		};
+
+		gmu: gmu@3d6a000 {
+			compatible = "qcom,adreno-gmu-722.0", "qcom,adreno-gmu";
+			reg = <0x0 0x03d6a000 0x0 0x35000>,
+			      <0x0 0x03d50000 0x0 0x10000>,
+			      <0x0 0x0b290000 0x0 0x10000>;
+			reg-names = "gmu", "rscc", "gmu_pdc";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+
+			clocks = <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_GEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_DEMET_CLK>;
+			clock-names = "ahb",
+				      "gmu",
+				      "cxo",
+				      "axi",
+				      "memnoc",
+				      "hub",
+				      "demet";
+
+			power-domains = <&gpucc GPU_CC_CX_GDSC>,
+					<&gpucc GPU_CC_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+
+			iommus = <&adreno_smmu 0x5 0x0>;
+			qcom,qmp = <&aoss_qmp>;
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-220000000 {
+					opp-hz = /bits/ 64 <220000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+
+				opp-550000000 {
+					opp-hz = /bits/ 64 <550000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+			};
+		};
 	};
 
 	thermal-zones {

-- 
2.54.0

