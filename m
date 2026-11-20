Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182181;
	b=VfaGHdDyPl5ypwQ/IrMIsIcupS5OtMAARANpJfHw4UGDd9hr7hg0yrJAnWirHRWSWOBD
	 +4CEMwbIwSMDEXcjKiM9kapMHwIVDfebodTwMY7MZksAtSGjNllc2AQ4XUb2M7nef6Dqp
	 9Ozfpeeub7qhdJc/WPwuQX3FlueXeUSgDm0dEp38oDSK3ikxuKMTDYYglphqFF7NpMzMM
	 PEC+LnAG2EJ8UYuQ2yJ0LSViWt7H/wpScWYO/jCNooFyrWkjS1C8bL32aFg9DLIpXnbjJ
	 KxxhDv9pcOvRTB2x+8UY9CZU6Bzl3S3sIBZ9pVlWWl7terP2Pw+JMLm9J10FTlInj2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182181;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=;
	b=PeSLia7XjTPnV9TKls5eYe7sk1pwBLnptwx3KH7Q/BIbQ3p26RnP0qiAwFWk0kJGZRRt
	 /KMZ8hysSULJc/1UfzPNVRIOCJBe6AmpKbZOeZaCAa1hHnkz5R5zAFz96IWILnhRhoqdU
	 RU8XmlDeWpVaRRdQ2AlAH1adNW0b6k47Kera+tiRJnwRghtVWiG1LZ9zCLEl93oJK29ct
	 DHbnNIg9FrVrt16NCAdJD8j397a1mVYgSdjtfgThWphxub2mhCjwYU09b3PrWBWyKA0aX
	 looVqASsOAhnoYZoo/AzVBGhVlKJGyfhXU3HIL4ICcOnL2qRDs4993Cq5QpLFwKTi+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="A6ZiGQf/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MBWNt3C5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9A660A2608
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA9A660A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A6ZiGQf/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MBWNt3C5
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk0nn2155245
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=; b=A6ZiGQf/QVWHmv7o
	LgLmcMQ6R3knvmGb13jNkA37r0ZEeWaan8DNF+zQ+gJ4rNPLDpE9I+aQxGawgK3V
	f1cd10G1EFFqtepllVHGXB69EQp/bSDCJFG2RyameJ2Zu1vk7wB5uu6Jz6at8vnd
	gE2PATx+RF7oV8PILaO2iDD4TIzdRfbd12OtzGs3JnyexMuOHQsWS2XBqwaiewgN
	FOUCLyf7a+LvaNV60LXsRxt5HW2Ps7uDijnszZqwMYHy6C6XPJhUuX+Hpyjcwg0n
	HrSC2BDo/QU3fNneX+LutL6URlmZoHVKSbiQRUxXZIbiPYypkm+7pUjV2YCDt9ls
	SU1rMw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yj58m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:42:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3846d5f54c1so1150513eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182178; x=1795786978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=;
        b=MBWNt3C5k0OiR2r3PKZVIe+YHPUqrS9d9TO4AiQ+Dsd3khiz6hXxnLjukSy8w5Xo/o
         17a4Pj+HOmxO4GT7TDFlqEd7vmlg/+kY5fH0VF9eDvD7gkQSLjotKWNOmmeFDQn2bFKn
         o1j3dwbDqNUjLM9tT+vDLxn9+9dNiVGWGmhLrramK/7i4mTVO+QI3ApA0FPxN7YMxCGB
         AHN1M51GzUw3Oz2ZQf+UXuUeY9fRK37lJUSeKi9eMkK7jLYHDHW4WLcVzhWW6utOtVBw
         Hq+g0yjg0LqztnEHspYmDMO8vVuZmoW/5T8NVlPTVmTo299n220ramN+D6mUrJ56Tpl5
         lpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182178; x=1795786978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=;
        b=v8XcTjWzgEfWiVYN3JptL4TMeAGgVCiWUzQmsNoBvZOx0EIlbuaaFGBQP7ockwwsBw
         B5s/FYzM6SK1XcIhSYV//IwDlprEaxX7Z0IZ3WTi76Ah/eSI8mUSR4COPUMrP6tB9PKv
         z4sqTnue5xXZHiTn8Wil/etMtMaXveU9++f4iW2n6GIbStqv07gTQxwDuNMlVGvkwsfX
         VLMeAqpTuJ9OHqezTuU+YkYoHfduBmdAqE1TmAajcA2ABnSQeKeS6NS4FtzmL29YHhpD
         AJ83Bfypb1WWz41FQWRVQLEZKyTxUvvlULKJJdwiM/rgTzaqbkWohli59gELCvozmg4A
         3Kng==
X-Forwarded-Encrypted: i=1; AL+hErFwIa6QyXu8z8TbcA6sNujfbrVluOpqYS0u2phaYisUe923UPbDcE4S2tUWfhFQQlx+zAGUMAi7xSl72SSE@vger.kernel.org
X-Gm-Message-State: APuU4Z+7Kt0/Eo1KxIeacUcWQrRqQ4uJ00RnTLtlHy/eWcooUE++EqMo
	BMqOBK3iSbF3ei4CMsPROFpv298Ach0MqGegEkbsE1zjVbsayDciQNDTcBe1b7DJQARTeIky+6k
	aBoHAZZ7yi7gH4xYEoreJF6MgCOr+8pAQ3pH/DNuSjMWxcoGZbQWbaJqv3lbc7HiJcbXV7ScYzU
	Bs
X-Gm-Gg: AZFdTZctKEDfMzhrmNSwb9EDFhAxEWM0PGEyRTOe0eyNh5jMqk+4TX6rEUVXWqDNagS
	AmF5QKNBdcXSWUNgBsoZgeiVNbaWiNSKOdves+vBTBqDibMpwbC1KTvh/bOistS6gYbPyNbyO3d
	JTlv9la1GXOAoZj2FuDQTyph3NhHnbyEZmXDVlEScRu+d4VjuHfALH6DHwmeiDPLMlARPt2Vb83
	WXBD4V8P7no5sMXb7DCDqaYrs9U8zlUpvJ28/bZAU4xx9YBG4oXHH5F2iuwfB13mV22j0tg4XAB
	6hD5GIDpAZ/2BmiUc0qusc3bWEWWxDZnrA23rdy67gyMCcSrSai36iiGL2g0ttn2JqLv5UIffb0
	6o5K8od5fZ5VWiETKQ+LUzvRXwyHC19It9R4N0m3oJBFe/3WZI1V4XduS1Y9H70WsRRFdJgR3v9
	IROzE=
X-Received: by 2002:a05:7300:2202:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-3857170afa1mr4024464eec.38.1795182178171;
        Fri, 20 Nov 2026 05:42:58 -0800 (PST)
X-Received: by 2002:a05:7300:2202:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-3857170afa1mr4024409eec.38.1795182177476;
        Fri, 20 Nov 2026 05:42:57 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:57 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:37 +0530
Subject: [PATCH RESEND v4 06/20] arm64: dts: qcom: talos: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-6-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=992;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=7PKy0XlSNrGfUIky+MIq+A+DSi/A91nh6BKC8dJ00Ww=;
 b=Wadu/4wuZPZ1RMqU647U3aYS4S7L9vnM9xaouvrfnAAIXIZwIt/SZos6s1LhBZwMDeZqVucST
 7xgxfkv7LgTCl7Wr2EN1tW/hAh1HfiYl14p8mUp5extAyIym+swkb5c
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b004e63 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=rfUXoPsZI_F71NZxNB8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX9azIXac8cFbs
 4ulzcS+5VE+MMXkje0xi2aoJx9Y+zBhRMHUWaLPfwVFZjhZKWdfminMdzINbOdq4yLz+TBWhCgy
 7MBhZglHHupa6ARDBLHeVwLTJKDUU5J8kOHH/kJtjToD3RQcvZLFRopl0X5cEUEmH6aRYDaVNG0
 7LLmDqNfqQubqq4xOVxaThePlm1dTIoYosCIlWaCJhV0IamMeevdo6u73d9OkYBZ/FMXCJUmxbt
 /O+WAUZIMbTeEdmxetLzbaVcw0+7cIzgiqJSYWPDHWGc6Pgx2H4Or0rYKhgusbVef87REETAdlz
 rFboBbHkMQSqAQHxX8FQ7gZpdAynuOdje/tudfaQ7TjGZRWAL5KJe4CW5rdDsXUMPwT56VfAi+a
 WyS4Vy26ztHqm3x3mNF9ntzbTD+aIdzwNCVvAcPtNZblGmzNYTL5wTm6363wc6/MD+ozxKPn7t/
 cLB9tFySHD0FWlmOIGg==
X-Proofpoint-GUID: Za-1Fy6XQCT-0iS_KERP_aApPhFexj2E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX412nI35POzrO
 Ua1PYg/+UPQR5cIg4aFGJvMbQR3kXaDWijFtk6rvaCApMeYs9NSJWWo+pW+SwEaFnoIgb4eABng
 VSSRa7x1aORHxSoVa6eZZVLLGQaO5HE=
X-Proofpoint-ORIG-GUID: Za-1Fy6XQCT-0iS_KERP_aApPhFexj2E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On Talos platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 1d74e459f892..f022a44ae5c8 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -2102,6 +2102,8 @@ adreno_smmu: iommu@50a0000 {
 				      "iface";
 			power-domains = <&gpucc CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		stm@6002000 {

-- 
2.34.1

