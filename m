Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172885;
	b=Djht2YYCQ11NWVNLe7pQubbDRv14mLqx8Qp5iM6DloC1lnDOZrTbO2KcCg/yjpS7TIBC
	 cX0wc4BebgWAA5/F52N0w4GBR+R7z7htzD9tNCVYDsC/at8F/oJ/D5/NURX/tf4CGpfn/
	 3argvNRyJvxgESLf8X817q2VQPQtg3IckSkGZsB6IBYYRYKSCxe26BQaV1UlrOwGSt7mL
	 fFlA5S3wyZeGYQ8nS4o4tK5735Au09gT3qtCW7PdgGQErmr0UDE/NHXRffOa7WAUZT9R+
	 rp4ho/EUfbpnEmu5mo47uUQ6cS873K0vA/Hj8jTI2BRf6fMBPOASgxTBp+Vi9dgx3Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172885;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=drpSu4HheKaqlFGXfa2FVpmGxrRLS+U8hS+KH99KJHU=;
	b=fTwVnkmc+QutFB72YYx1Yae94YYF9QGEate5CxW4AeNxqzfWZ740rGJfJcyDmo1PtFt9
	 rkBZp3AQV3HftksHcWmS1CGnZFXwb/JGcWyqfQ4AAXIp3Vco3BNG5MtEcYo4jYZBpntVA
	 4Z1/4Rxu9jvwsEMc0Egk+iNU9/SEWrn2B3MrgErW0EEpK6NI89z4/g0xzOOA7d5yh8CrT
	 TbMzEHJgGyNRmQ/zlCTV/IkhRuX+CGV8Gt1hHbM7dSRrtwTDw9MC3gL5D0PJqkrZS7qHn
	 UsRPb1Mvi5wqdbVAmalCgLTwT+LNBpK1ctjGOZOiFQJ0gJThAdjnjIPx5kQYOjQn/oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ggyc8/hy";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DXYLEjsS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E220606A33C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E220606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ggyc8/hy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DXYLEjsS
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk0sU1060577
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	drpSu4HheKaqlFGXfa2FVpmGxrRLS+U8hS+KH99KJHU=; b=ggyc8/hyxmlWS//p
	IvODsdges0NNEEIs43B2ATBJOjzvWfwHStiFyHfdclZtyYmrcTVan/UBSiHQPiBa
	pmXLOae1fWbk/32MeJlctcEPkuIMSxbMywnbCUSY+HmnoJjt3/kMtGJwmQg1GPi2
	LDFYYFBreFl3GDYzDzum3yJtPAEaRcU4u8COdKB7jjj/Wb5xGaAg2yX0CasB8QP4
	fDAxoXG+cC/xd75ozCAYeK/hIqrqHIggVHmH9iUqprcFZy1Pua9rTq9BloUsEvCi
	sMLxmlbxFsWJAUbIhPhe0fxgI1PXerT7PRRYYsLz/OxfZBcc3oR6yIJn6GYqAMEB
	5BtBBA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykbbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:08:04 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383435e46f9so605108eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172883; x=1795777683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drpSu4HheKaqlFGXfa2FVpmGxrRLS+U8hS+KH99KJHU=;
        b=DXYLEjsSr9wonQrekUy8TcpQ8VTQm7N9wCrXveLVTN2y8wlDSHhJKNJtvxCeV+1Scf
         xnT41CP5S7Speg2mznMIYp8iQoq7BCrxGzu6iVVNN2wfhXw1UAkP3kHfK85Y9WGYXv2+
         OZPWGfROA4yUBnUjVBHOoPja4mvk9mTuOYuVpKPqkFogT+hkaYLoJqbgU0qWwrwSnSGG
         HeqmOA+2i1XHwDkbfj1ubCvSdICGLH+Z4KHNF+RR1peGxd3EEqJupEWESZxKWSDja6O6
         MCOqYeOgiIRLbmzbwhNjNGU8ptsShEnFB/kEHo5lkFo7ROOGj4Hts3pTX4NcMCJJVOaM
         hIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172883; x=1795777683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drpSu4HheKaqlFGXfa2FVpmGxrRLS+U8hS+KH99KJHU=;
        b=Svg1C6BXhR7d0Jejl7BfJUB1rdPwRzae7EXx5NZouH+DZ50MLlUPPOMlsydAaYBKX2
         uEN8VyPaqoC1c1frs0FIFu/1ivFF6hWR6ge+7RHb4rDoASlY5/AYrXUKaLBPIIIxgHEA
         5f57W+6UC5I9cdp/Ab0BC8HPg0TJC+jyME8apf2UABwFBULoGmwroz5X6JD5o8LGePuh
         69MhtR4iYdH/wnruSlogBXh2f5mE7p/MF05evyt9DuJwnnBCzuJ7KP6Cf9EWgII4JEeR
         K10UPtDYe3SAwjxGL1DjRQMIkk34+Uq0VxXjJNhhsXMrA41AmaPwdkUG14+Ovd5kXZEy
         cdNw==
X-Forwarded-Encrypted: i=1; AL+hErF8muTNX5tAFol5MunYaD4sj8f0RmDJeUvvvZGvt9ZNunHYnhZYj9oUUN6qH1cYpSL7x04txcQZlwvYoitn@vger.kernel.org
X-Gm-Message-State: APuU4Z+VHZOixXDtGNk8VKBSdzvEZXgNFwyV/T0sFS1fmExSKWMKkp5Y
	+y8sWb5U0UgweysTSnRaccLe212iAs5+H7LLVD6HpjhVLJ9czrxNQHYyBYH+8xxR4Ylf/sTiqw6
	nUZnVPi1czhFnLqj3pbv/9mKKUbCXM8lgCpfbBiDZu3LUySScWmVxyWxHIzqB4TDIOLLE
X-Gm-Gg: AZFdTZev0rmaewVWZyzFELWQ3UVyQQ1UCSwPsfnjIRuK2sStOhaeOM/qp3scW+DJoLB
	LymiOtxVC/rRRyxVftgKyCIPoa5kUF0tqvczm5CbZz9/X45RZXJYnTe3eOy4ndmgzSN5JABVPDP
	lW5g66zsqh8WEBFntUbzQVeMBvisgVLuxwI8fe9h0OnwqRs61KVzYV0BjQh8tFcdmYHqY8gW23j
	FLSpIa3DDOQt1G9WDH23hVrNjB00D5TGTWk9CkoHYuhLL3u5+rOSKITmgN2nkWfrfCN+W3S9HjO
	VUzOW7eBBb6555okk1a/38QVR+3SdXvz5tF1SC6/adASMkK5JZWDk5MVnG9JDELlzQlQUALICWb
	sjxQ/UgrGeMFYOnbsmZbwhbxJYa1hePQ2NpNDku7CFe9VDQJTyjBdb5QkOavpJiGzsLIpYBGXCB
	AaT/tp
X-Received: by 2002:a05:7301:6182:20b0:381:fe77:7d31 with SMTP id 5a478bee46e88-3856f14707amr2344802eec.12.1795172883014;
        Fri, 20 Nov 2026 03:08:03 -0800 (PST)
X-Received: by 2002:a05:7301:6182:20b0:381:fe77:7d31 with SMTP id 5a478bee46e88-3856f14707amr2344752eec.12.1795172882285;
        Fri, 20 Nov 2026 03:08:02 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:01 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:55 +0530
Subject: [PATCH v4 14/20] arm64: dts: qcom: sm8650: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-14-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1282;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=nRKWODwhqsti/JCMKzfpHOUMvXfhBSP+GT/cARrj/+0=;
 b=c5WtPJ0sQu94WJMaTQu9JE5PzvJ7kuyQVvPNmn3/oAka+ojdMg0UnobB5jSbCZWOdUIE7w8Oj
 i7g0V7lmEc9BM4/rk317+KDNiQCg0iQXHuwtIRhaaPXA8Cy9CozEvTO
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXw64lIxVixLw4
 jtM2wV379XJ2bQob8pljezvmsmbBdIF/yFb86FG2ImoW10vYXGwANa0m4KakKTyIClaPzje2EvJ
 PBxhd7IXBJ9PPoDkHDZxwwpzzy0N7jY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX+KtUe/Y1OmU6
 Ahaszb1/eyCIlDXMVVQUH9D0Ehy1xIVxCXcLXbzT7+xPJUgLUodsx1//93CLYCisoK8upqE7JZA
 M6nMvwjoexgNJAXx8clzKHwXsWvu+5RdcM46s6OV+gLVZn/souYQqB0SuRGHfY23kPTJ5bnbUh7
 PZCOFmrVl0ARPy9SW2+Xh45SAnidFD3kgDoBkKNnoxQiBIqIn7EktLWRMeCq+kyH6I/z7Pv6m7F
 41nm5qBqRLVWSb+4jYzADv6gKUDmGnMC7z3e7lQ3UWe/i4E1fIQig4s6oQfYvDcnXewvN1CN+Y7
 byVK29qpoi4b5CKKAM3WupBNXJ33E+gbLk5rEmnprIhx2j1f9cZPwDQvt8FSKGS6W+3NIp8f2AW
 rROjcURnPz6gZV9l/zseaVDXGMZB6ScZ+ESrLdnIDV1NSMkSZLerAb+zh6Rcic173TkYkvHlqFP
 l5qb0Cbh+aR/Cb+Rq/g==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b002a14 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UZQlob4mJqq41ALSq9YA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: Wbuu01QOJ9SwPEnlqz1nZBO3H8Oz2fEI
X-Proofpoint-GUID: Wbuu01QOJ9SwPEnlqz1nZBO3H8Oz2fEI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On SM8650 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 5a030f9646c8..86b3fa4cf05a 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4214,7 +4214,6 @@ gpu: gpu@3d00000 {
 
 			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "gfx-mem";
 
 			status = "disabled";
 
@@ -4413,6 +4412,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipa: ipa@3f40000 {

-- 
2.34.1

