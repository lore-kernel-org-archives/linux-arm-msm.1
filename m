Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173113;
	b=dY5OQCyytJPwsTlW8iXG9M7cK9VYJc1Ppamhslu8ettVszqKRhS2zfs74/tAHFE6xAMm
	 rtxGZT3Idyt6izk1UBDDUGiNUV6wIEuPJPf0rcfCt17zzxV9mkfxd+Nc8mRJW4swwMy8q
	 wJu0G8ug7vZLqHPQ01yeIwWtxdBUsrQQtGQPBTyhTaRRDIrfcFZ3KCRoJQSLVjpixh7pW
	 VzUyJsd++O1c9Uvroyyvqbsdjo6plIBQzom3a9XTEGHQngnXEwmK3I4HDflWT4lsJZQf0
	 bdapxatEPyfDz6Q6fW/87GThF/9R7QeHYvZcJVTOiTIyXk17xz5YoX6h9AZeb4wz/Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173113;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LkJiU9K7M/5B0olfMctd3rMqA4igeZ4vNjLDXlC9cI0=;
	b=ss1P+ipqXxzHkOgrzBVikHaIiGdu8dgjmKuDYjh3Y+ft4mdIxKjX3imKU8d1NcnAjAN2
	 Wg/oZS28Bq1sNu8/KJ5rA2ZEZ3cofPrvkCKYc17PneohofCEGFxKYPj8v46SI6ZomK/UP
	 dq5jjy1WVBX8wVNtlJpMLnBAEnmhgbwBO8vUTCs0I7PRaoAwKqlT2tZfz2E2MRYjgue6W
	 B+Yv9vPLVtSRPc640+ZIUOHMiIiGSNP2MFcH/IQ0jVvKVbNY+EWwT9PngPw7XRmJTlPgN
	 aqYyKpV/h+tNerr/GrOeRhA5M7nC5Gs4gud0qqfs/+bYhY5JC0fdDz8CiQc60D6yXXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LB8K1e3o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g8AqT+T7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5610560A3806
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5610560A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LB8K1e3o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g8AqT+T7
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkBCq1017048
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkJiU9K7M/5B0olfMctd3rMqA4igeZ4vNjLDXlC9cI0=; b=LB8K1e3oOR9mdSPM
	RnXEQl7qgJqw2k0bbAgYFxXyJ1+jRbUwcibcelPlyW3oj9lk7hvs0Mjecxyf8wFr
	ujFOIJVp1tzQ6s17m9prDoqJb+SavYf6fOgMblyGYDSj6f8EfeYo5/WDUtLURcgi
	0VsT0Bk3DKv2iw285gDBmCokhrf8iXPwUuvnXm+BL+sT25JP8B9bEphFoJH4BxiB
	HAV34HSw5cdk6+BSpTNA1SzKkgTWN8i6Rd88oBIQltvrd2tHBitgQYsSo3LTx3LH
	YCvRzyX5g/e4GxkcLZmPsry8Uyos6fUcvb1DK1oBUL6m9vYVDzwL/NSKWr2TAyiR
	0WMHrw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqs859-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:11:50 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso902374c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173110; x=1795777910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkJiU9K7M/5B0olfMctd3rMqA4igeZ4vNjLDXlC9cI0=;
        b=g8AqT+T7RXOsnmE3jr20PGTdBz/S3MLpdTyhebhqpYJ0qWU3BmNXI7K+xEfHBiR/xA
         +etx1IviEnxbOxkwbGERIH6mPIrhodzq30YCGNaLTpvPEYUXXA2IiKxk9HbUNpqiuWy/
         /fovRJSTc1pqWV4cqebjiE72L4ShEacOkjlEElAMginI80ysN/0LIRZbCVF9xlq1UYTo
         PWAbPdpAtcAv8lAJusDiWkdo4R2rTjPnOs4C9zl9+qA7Ezs1mI16v/8/5XUEXq3GUyRO
         Ux64bWOPlOKtChaoaqqRJIn1Gurc6XOXMGaAGRbwBO6GBCNGbVHJrJ7dP7TQUaD3vdsc
         aSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173110; x=1795777910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkJiU9K7M/5B0olfMctd3rMqA4igeZ4vNjLDXlC9cI0=;
        b=fnUa/hXVGu+uEHrRRnXUhZEu7FvnFXTfbvjVRiDws4FMcBveVLf/dNRZDCaKFaSfug
         HotlgXM6BZWO+2NjTFZ/dD3WFdrC3vBnKubrcPaCsH6LXVHgVtEgW6YJvPPl/gmQbi6B
         bZkAvfUnMXSI9tUEd0BdfC972+0Nl8mVJlpCsjhcBnlhVctGZu06XyckIJkhWqJ7Caoh
         2e/JkpxNphszGaL7GiABKp8asoUk1yxkbeiOFsoVXKj+zd8UAAqXESKwZ6UhHirGcV0v
         RS4A17/OYEaOPbKeoRdwmvpb6vExTqzkfK7hJ2g0NCuUV0jV7DhTfVFpUeVFotHTh4fD
         47CA==
X-Forwarded-Encrypted: i=1; AL+hErFNylS71uQssn5vB9s/iKJnV0pdfLnNB/dVsOi8n8LEER6Rhyw4QDypWNl8DA8QcmkNCaOcf07k1qEQuzeM@vger.kernel.org
X-Gm-Message-State: APuU4Z9nv0Nf0B43i2ySUWrQ1mC0zMgBLSJHToubCJXrwloYYu4EpHp0
	5qzn1hMkSS/e+4mpsZ0DUsHTEY0FfQh4WYKcv+DGhQixv3pBH34BWkE52IVAhWssY0Jxr5x32bb
	Zb04OXGWHLLsAsTfU4UOCoj4zcd4Ydo/DxAKCwJmkjlhzOsTEptQA3hkYVwQOUZWb3r5F
X-Gm-Gg: AYBFou3re4fiERKZ/QhANDcacXn12uQ0ks4VtnxOUW2zdZ9ppkvIUgNJd9J0NNWXtSW
	DuK35Cq8Ibldy2rdLO8gkaH3bLEV0jC+dQw9DXpRMXxT37wWZPSE+ss2qLjLdUPiCLUkkd104Sb
	c/iJFhczQJ2RgNr0fyS/Gtp75InebV2q5pMbxNOJ2wRZ+djJbN2ZfDC0o4WXdwatRRu9SGHXxOy
	f54LOk7zwG+NN2pczjOuzqovJ6UQpQeyGR7lyh3e223eIFR8EYSRpub96owXPUy9xqDQ3d/MpNL
	bHKlt5K2/IZEKJ847GDYyBAIPESVho6FgFqUidSR2BlQsZV2oYsXglSpuEtbK6v5OPGfyz2a7Hs
	1zhM8Q1Tz4VvEc4ZLYxbXvS2ocE4rOgcPUIpaDSVHuEcpG2IfLblMxnN4wM/UkSVR1LgD1gpURY
	6ZVWs8SPww
X-Received: by 2002:a05:7022:2522:b0:1aa:47e7:97e3 with SMTP id a92af1059eb24-1b5568bc56emr3276844c88.15.1795173109866;
        Fri, 20 Nov 2026 03:11:49 -0800 (PST)
X-Received: by 2002:a05:7022:2522:b0:1aa:47e7:97e3 with SMTP id a92af1059eb24-1b5568bc56emr3276808c88.15.1795173109348;
        Fri, 20 Nov 2026 03:11:49 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:49 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:40:57 +0530
Subject: [PATCH v7 07/12] arm64: dts: qcom: hamoa: Add Iris context bank
 subnodes
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-7-25a771235a7f@oss.qualcomm.com>
References: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
In-Reply-To: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=3527;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=btoycFksCKZ6PMNp1zXewyTnDdYfBgLTtofpChNuEF4=;
 b=5YOI2i+ZclNqs2+JiTB+PR0IpZKhAX2VfEFjccA02pnnZ7ZIrVgtNHoaJuLPegJZSoks7KdVZ
 iA30PDUoQ0zCQE0xRXy6dCAdRwkM8SVLzcA4VPDgl+61e1+/m5IRo/M
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXwyziSCSvW1hP
 8hPpjgihZli0Nazns1YzIF08JyJsFj39uVY6xcM8GZOZnrvDucRLHP73nX9Iv7EF/zSfof0qsAs
 wOpWtAIx0bvioaH8Ib/crte42odyWydnPmcdC91xMhcpH5Yzg1cXpYW7NQqapNk4HWr6cB/IFBb
 vfJsvic3OrrdbZkynq4PWHEUqN/Ca8Z2IH3HiATZc72lsFQcWyAVRVcy6SMOEJ+J1LWprLITs12
 O4YGi76oLS0b0eKLbi7Vz7KV9SkyHGIj8/KcdAgYZWx8lMcUnmpXJBmp5+A8ahRuXDhcFpWUoF/
 +ox2CTNiLvc2ik1N0a8b5Kco3fHyw7aPeynyfk+e925mnpdM1OCbh7VyBpwbrz6c0ebPos6JOAC
 N4R4JyYBusHUibUJ//27RPpGGnHN5gdIU1kFYTlKoLamSCQrkaumwA8ybVQR8CgSIwS4Q3tp+jw
 JrceYzy9uvxSEU6ZKtQ==
X-Proofpoint-GUID: ISeURB0CcysW9_rt6Ve6f0lNtf7Ntjtf
X-Proofpoint-ORIG-GUID: ISeURB0CcysW9_rt6Ve6f0lNtf7Ntjtf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX9vARHmIO7uOW
 75sZuLEQQURAVWqRI+PvVwZGrHJaiDUXhT96lJr8uWik0a8zTLAkV61adbOf36opd1mmZ5huAxz
 yqFBB8gRWxv3C/0abSY9CoRELlsyP9k=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b002af6 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was discussed
and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The video-codec node includes address-cells, size-cells and dma-ranges
to declare 1:1 mapping for DMA translation to the parent.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 443c1a5c212d918dce2da13a55cd399a68449b6f..68f1d955096493ed6b00c29288ffc42b21bb0905 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5482,10 +5482,12 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable on boards where the proper signed firmware
@@ -5493,6 +5495,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

