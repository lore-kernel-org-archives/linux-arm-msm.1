Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A399946C82C
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 18:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522205; cv=none; b=UubCsPp+lqdTgDav+pwtzhmASt7sg+T8DhP75o7o5rOMptBvJ85jCk7sWVI6cQskAMqc29etZw6szVvTAVaTtlOvgMl1TGjDsbEqOq6nCGVQtthknuYFvKemNDjKLvvn7KuWedtHy0hnKlKdCIm5NouQcpEcjpUJqz+waRML4y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522205; c=relaxed/simple;
	bh=qlApsNCsQ4GXqwqCMeJ2hDu4QJX63CTHsIcYlQRJ8no=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L33wcUGLKHcpzumGSSdT+XLaRzUSLumgxEUj/n9CF6B36rDDNrKgIgZYa9YhksSvD8/MKci+LhVkYP2Oe/rX1ff+An2HwgJiE7VknfpnbyoVTtTsIGCRH36t4rkmge3EursPgW/y4Z4nNWaMRBA6Sm8FN37+N0UEg7OhiMD0jOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mf8//Qww; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KMi0WjJf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mf8//Qww";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KMi0WjJf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFNv1e105912
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 18:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	stsy/YjX/wtx1x9sv7xAkjZFnGaIQJvxRwp41nJ/XTA=; b=mf8//QwwsjCLe+PN
	KmIgYWco5ngU9aGtHWeuaSTmZUkFHSTz55HH5EQA2nssUB4t9FW151iWZWQApsRV
	pjhbIA5e0j1gMzMy1U42LSt+hTDg5AATcjhNAzFpW25OmJ4Mc6uL69GXCbDVzRoU
	2UaI1AgPd1m9o2/h7uJg4jEJ7Qi3SQ5BdMxnWGn14riF5wM1UHivuzkMi4OXcHq4
	GNevNl2zdA90AAIo6/f+YL1WmfeLqHcA4RtqwZaWrVPnuK5XciZLz8P8LFLLXeDj
	vfZQhd4nzM7Qh67VW7zzz77Kz0pkjAVYxIICWKwHOlmsa7ygjmy+J2jMH4iweBBL
	4avIeQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru2u1uam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 18:23:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d001671a54so24780645ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785522202; x=1786127002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=stsy/YjX/wtx1x9sv7xAkjZFnGaIQJvxRwp41nJ/XTA=;
        b=KMi0WjJfzbhlvDte5ryiwNQ3f9bmxxQg6l81GEefJqLg7Oov/Ee6bJ20C++MbHvDeg
         BswPq1W1E66/m01ze58TWMTssLg5Ub361LCundopHRYmkE9WUReyL8IeL1LeNhYyXy3J
         C3OqWmo07XWah6ciVV/SCxWR6Ie+MOut88+uWcEi3GVpy8sJGbV8xnewD2Pv3AYllawC
         Fp4ceshC1olVAb38ivtpTDJc19vTT+jvigEsk7zPnaldr96hB8Pi8CpWYyB9NE7ZNPqE
         I5T70VL82Z1xlETLMl46cIq2AX737aNAe5zaTCFPr+HwawpEeLR0sqIsXwk0LaKrRt5b
         tETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785522202; x=1786127002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=stsy/YjX/wtx1x9sv7xAkjZFnGaIQJvxRwp41nJ/XTA=;
        b=XlMtDgrl6VbfD7zd9scn0JwVKgf3dWLUOcD+2Q6Y/9vS/jZJCJ7Fm3gvgC2Y32VJPE
         ymNBwwyGvDIZDndoZDsBYE86uVbXDqtGBSstjqBMAK5JBS93JvoiNVURQJZcy3LxfVMu
         WED8qOD+0N9hCVEH6PUPdzyAuPSSvf3gX957fxRSYTVnRCC97oqdntjbiDWECXkpqExw
         /NmvumbcCgje3XItQu7RRYuT1UWlDwRVJuVFfKcIRBjNxJ2ECHnlSlqlggdEesiZ98jX
         oDryLzTLOb6RuiMw28amvuvprQYxcx4wRECUkX4k8OLYDPQeVlwOUZClMf1H1Dyv3h68
         5Uwg==
X-Forwarded-Encrypted: i=1; AHgh+RrTeTfDa4leQ5idGj8H4txy3Il05do+VLyFeRkAkrHitm67lssVa6bNgxoFwUp2yEZ8J2Vuxnups4E4LYiH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkw+LrDWYTPHSTjxIi3DL374rpt1hBu7MgSwoO/+DC1wRMLz8v
	uFH6wBbOMqqi4PvHGR1ek8PoYFaqtQ9/qzB+AGXtjrcCTbOWBtdxDywZ01G6JFVM+LfVV54kmAG
	8U+bSE+lqpvf9PDl74jW0PngQ6f32OtuP9g8J9mvzMN9Ws7U+rexcoWcT62yZ91StMela44iX3b
	Pa
X-Gm-Gg: AR+sD13PLCUFnr4JXJapaVmOraPivRZpWMZEOdC60+WU0n/ryuK87Jvi/C84xYuRE+L
	J+BTCCYXGf918yVRdsFtwfS6DoKtBsZN5xkSCQTc4HHfmXHLr+RXe9rANmdZ9vaBnii8jE9dz4o
	PoAkD3Biyp4QKqAWaucHTkMexm+zQ/DwKM6FStj42Q03WGoZNCOAcujPNflOEoxIQ2KQxhrmvtj
	BVFt8ItuGWC8YA79G3iprRkn9RnHdOt409n8kvKShRDha6JxCnpoHkQ9iQoGjUEmNexF3vMIcA4
	l68Dss6auM8KzBWDekeYfeYWQlbilPaj4K7C3mQbFWbSnuRGgTIxDANqv4tI50dWawRi1tLGkWr
	FgG7ZZbF9AtodkD9id7s5iPiNL/WzT6E0pS0=
X-Received: by 2002:a17:902:d2c9:b0:2c9:cf5d:d9bc with SMTP id d9443c01a7336-2d0524b5269mr8750625ad.35.1785522201799;
        Fri, 31 Jul 2026 11:23:21 -0700 (PDT)
X-Received: by 2002:a17:902:d2c9:b0:2c9:cf5d:d9bc with SMTP id d9443c01a7336-2d0524b5269mr8749985ad.35.1785522201121;
        Fri, 31 Jul 2026 11:23:21 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04456dsm7203089eec.14.2026.07.31.11.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:23:20 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 23:52:23 +0530
Subject: [PATCH v2 08/12] arm64: dts: qcom: hamoa: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-vpu_iommu_iova_handling-v2-8-da52b5228dbd@oss.qualcomm.com>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
In-Reply-To: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        stable@vger.kernel.org, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785522138; l=3782;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=qlApsNCsQ4GXqwqCMeJ2hDu4QJX63CTHsIcYlQRJ8no=;
 b=AWxJv6+Dh7ngfH6rc1WhOagBZ4bsblrUWBnEAOSAch8nIwGgsDu+hMacxZdKvs2eh4wU0Bj3Y
 r9ALVF16SV7ADn98bi+oQVHDIUrX01nPxjjsdNs07pucUnnMucx7Msb
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: eWAnDLYsUnm3pXKEWen1t1QZc5EYpmUO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE0MSBTYWx0ZWRfX+ACWO4qXd2hj
 i3tNtO8pJKAzZeZgHnz8JQZbhiddZUr7KWh9/aToDu3aylm9Mb25SRRBKBGAs2x8lDbmcz7Dc4V
 FxSlT5m/8T7iMA96ci8+nRmUY9a/o70f1wTAZg0WC+hhb12mO7EvnxJuluVYMUo2DQ9aLtTX0oC
 CK8qHdW3oseXGlCkWNGYo9D0lCX1yy7mQSiG66+r2Z/rSA4tkhV+Nda8ou8oB1p2h+uPSsU9e0z
 b3WDlW2Xze/PKBTSm/LYFfH9EKTUEz9ZVpy9FFcQUh2iQaWXteJKDAi8guqfreCCfZR11AYogog
 X+nJAUZ2zciAYp5HuZMr8xOUrKwjELq26YIW68Oww8H1PVzkgPuspJ7M8Hkc513UWmsByHJAYrE
 dSHKNopxY/sGaqTtOsGxiaCr2xpn2CTppJd9KjfYEWW0MVzfQG3I2nNeo24IrB8uTvPv7Iseo2w
 fq+Hb932ubGLYAof2Bw==
X-Proofpoint-GUID: eWAnDLYsUnm3pXKEWen1t1QZc5EYpmUO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE0MSBTYWx0ZWRfXx+PMpcBaUhTB
 S03eF5c4a342OafhdpGRJzLzpLrUzYfoA+UCQ4PuQBenzP+D0/yWBojmJE8LTIVPTZIvGXweBRL
 8ZzXWTYjU2VwhA9TGO18oVrigIRL5g8=
X-Authority-Analysis: v=2.4 cv=b+uCJNGx c=1 sm=1 tr=0 ts=6a6ce81a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8
 a=v0Z7u7uCyoCEKL_A5NIA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310141

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
is restricted to use 0-600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing keeps a
non-pixel buffer above 600 MB. Once an allocation lands below that
boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Describe the two streams as "non-pixel" and "pixel" subnodes so each gets
its own IOMMU domain, with stream 0x1940 becoming non-pixel and 0x1947
becoming pixel. Point the non-pixel subnode at a reserved-memory node
whose "iommu-addresses" covers [0, 0x25800000), which excludes the low
600 MB from that domain's IOVA allocator and keeps its allocations above
the boundary the stream can address. The reservation node carries no
"reg", so it is a pure IOVA carve-out rather than a memory mapping. The
pixel stream is left free to use the whole range.

The video-codec node also gains '#address-cells' and '#size-cells' of 2,
which set the cell widths used to parse the "iommu-addresses" entry that
refers to the non-pixel subnode, and an empty "dma-ranges" declaring the
1:1 DMA translation into the parent. Both are described in the common
schema change.

Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
Cc: stable@vger.kernel.org
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 09527dcf957672b4b9658988359e79d8a432fd93..37f4449aa91e605a2112f399604df0cc6c64162b 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -658,6 +658,10 @@ smem_mem: smem@ffe00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	qup_opp_table_100mhz: opp-table-qup100mhz {
@@ -5436,10 +5440,12 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 			dma-coherent;
 
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable on boards where the proper signed firmware
@@ -5447,6 +5453,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			iris_non_pixel: non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				memory-region = <&iris_resv>;
+			};
+
+			iris_pixel: pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

