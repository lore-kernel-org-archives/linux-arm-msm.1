Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173089;
	b=id6pp4XdD84iOieIi/ti8dhkXAovvAsZNPAVcuGjVUBhUUQfIpoW1l7b+sRHhZrCmNjz
	 rth2XaL4FRkuZrXvaXHaqNZuMN9zwM5ipCfokiKiPhGk5mbuMiyO9uBwr7oKBC6bY4zly
	 5NS9rxdzSAc7cHLKh6LU5fe5j7JOr9ueXb+RUuK+6CgWP0KrgDKiWZ+fhAQja+1E7nsUH
	 oUPsL0Uta2ax7t0raZ91yU8LO9jIJFz8eQp2lLrsejzqJ/c/TUzUElNSm1lLcEqAVui6m
	 BG8GFqyvbe/2OEXfTA4B8t5roi5rSZC+EFHfLnMImej1bmKEm6dDRwikM0EAbdlllcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173089;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UFyVGKvWzfLCM7ZESFhQabAqKjSsfD9BF+7+SB0eaNc=;
	b=Sid2WiBOv/jcVP0++/yVd+zJJWEvlBGIAH0i6rgXxag4m9K2JacTPGf+6Fhl3qyZlx6x
	 /anfqrkCU1TxCXEE+KTRVsDdHeR3Y7vEm/pz3Ihw4ECciCbh2X6accczJ9nTAsU8rXcKF
	 6vFAXgWjcduvvONX5p+4YQrBuopCIvLyTDmgztf4+4w+PVvGseZ9XdrdNjJYl5M5v1s94
	 TVH8BNvnY9AH3iuTu9B+9Pre1+zHOWcwZMkhkzyjoi4dQTzNw+Wo3+6Auty7NX8D4arzn
	 AbL6apxFvklzumeipBWaLp2nwbTVnserJjNUSqVgPqkMZdbv9usfdyMzYTuQjn0AIhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DW5PlaHo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TA7kVeTa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B3C60A262D
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B3C60A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DW5PlaHo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TA7kVeTa
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkgan3107627
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UFyVGKvWzfLCM7ZESFhQabAqKjSsfD9BF+7+SB0eaNc=; b=DW5PlaHo+GMxM/ur
	MuT7MEh4O73P+B/nQXxKaAk1IBU5YP2fFrGOxcru62AFAsqkTk+RtkgM6ZNOVVff
	BMUUV7O1FrehgP1unaVAlZmktyO42a+Ns1LQbclsGSVLfZolyDU+4HT72QkMIXRn
	sPNInUIDtCjqeQBUW4+lSQALet/YQh0FVU9+oUmQzPbOa+qSHGrumP69v9Q5RuGt
	ASvbtd5raPeHtGsV1dK4gslr9LV7d5gQzYz96K0k2jMPdOba4suyu1b6bdSIMJ8b
	h/IUWKkp/avlhvCNUH9lcKy/mEUhA4qvNkFEClnwEpmTV5P32xlUPbAgMWNiJbNO
	oO5k1g==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3cfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:11:27 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso902095c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173086; x=1795777886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFyVGKvWzfLCM7ZESFhQabAqKjSsfD9BF+7+SB0eaNc=;
        b=TA7kVeTaXLAWow+VOrwkW//92eGD+mzync2wlDV4GXB3iUQLmGa464o2G4xFWYdSI/
         By5j5QYfh6a70cAJAiw4LTNtuHdTHld8gRefCH7zQxjjRo53pkDoNpE1LgB/phm6gYwi
         rzPNOICnHLX5tONCoYllrgs44gWKbcDNkH7tnFGj0hTXrIntgxxhFHKad0YgXHkdv0QE
         0ojyKe2fJNE3TKFjZ0ZCn0FLMlLXDB5JuFXT2azEGoPtZAJ7wmF4ShiRVxVWUNR4tpbD
         Gyracv6gtGT6qsdzDuTlSehIrCqY4uJ+k5VBowwQJ9TuDctBO6FnO0h9qEaZN9yGXiCF
         H8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173086; x=1795777886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFyVGKvWzfLCM7ZESFhQabAqKjSsfD9BF+7+SB0eaNc=;
        b=GKS/rSZj+klxC62hDlSzpPjis8EzCnYSqnGmV/+qcdX68nGKkSVSPhfvTr7hORVDw/
         xliIJceH2j92AAk+V0N8X35v7wcDHu5ueidLcboNl3aXClm+/8ApmeOZERscyaDLJEyK
         CH9hsAUw+7b0r8HRcMBsIX6YBsupTgGAVIK5oqDjjkatUdjPkOSce3slHjyYrODloEQV
         13GBUHLDu7KtNGR+LKFXQT8UEmrgiG0tnGNwZqJOBmzQq89dfkJ/sdnQD31tsnIcIkvw
         gODNv47SzlHJ40HF8bLRTDxjzdmlJa2iLgzUnwAA/Bf5XZYaJGvBFcczxeZRtBbvzlAv
         ZpKg==
X-Forwarded-Encrypted: i=1; AL+hErH5/ci3rG7bCpLpmEsQyhtppEsPm+++vfLA/tiK87w7JAGRKYop4CWTF2fGsLlLHI62mybCCkgJtD1FnVRx@vger.kernel.org
X-Gm-Message-State: APuU4Z8jWxj06aaq4tCHszDvgpe+NUSAzwlVXjE3cQqa50q27ebXHN8T
	wsp9kDZFeOxWjuccgdxSDxsd7/yTyMPGE1ZBdRjkG5HcLapvI67IZ5ZohW+2pPG1vHgLsYh7mHV
	V/Jsn9D39IGfdvBvJHNlYc0iB+01BjJaCdLQ5wtNgiDgzGH1TAXHhHYLm0RlOjkklUSfr
X-Gm-Gg: AYBFou2Txm2bksNmt1UUS3rTqtgqnD9JEUf5/3rglKnhwEoduMmL0vf1LxQbP/y8wcZ
	JDoPqDiZ3zDs4mxIoXUVP4INzgspZdXBFLqTQDO+Ly3SZDXnPfNafbnghlsmsX4k+b3CF4zX6Jf
	nBqmrKSM6IL1sXbqZQ9bVomJKo9pI5LT/b7A/lcCd4ee7ds9b5H5vnYJA0cemfWAXq3LhTwZgzs
	DZJeLxGbAeJOKYluZ/UOJNSEBsjohYED9MBDY+O0WuyMfu4r7r6W9ExFmFWtcbDM5iG8M3qhHKA
	QKyHK2mH0LLxaeUw5/RfzG8unrxIrC2PNL5EWJymTIuxIkVEsi19d4uZcbvnHuqCArg0LFhhgW7
	jVwaBWiunf1C97LuRRqpJm1AtdmhwPEJLhABoEShKnnrApfFhSY9jcAZs4cAp7xulHQYl258Hbg
	0PDCQH+8UZ
X-Received: by 2002:a05:701b:2816:b0:1b5:3b83:5374 with SMTP id a92af1059eb24-1b5568cfbd9mr2321097c88.19.1795173086101;
        Fri, 20 Nov 2026 03:11:26 -0800 (PST)
X-Received: by 2002:a05:701b:2816:b0:1b5:3b83:5374 with SMTP id a92af1059eb24-1b5568cfbd9mr2321060c88.19.1795173085529;
        Fri, 20 Nov 2026 03:11:25 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:25 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:40:53 +0530
Subject: [PATCH v7 03/12] dt-bindings: media: qcom,sm8750-iris: Add context
 bank subnodes
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-3-25a771235a7f@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=3890;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=PnAbHBLCBhwxjoECu5HtUTAmt7Aan6lX4I7y/GynILA=;
 b=qsZFnVFAbktuyaJ+PRXtoqLSAM8a7U1wDhjkQMmxbYUTZTy+P+7Z5W8SIFtEwd9cMYrvHV0T/
 RbM+XYPlqGQBWQUHMI3n4q/cX3FWka2jOvHiWOP702TcezwrbWzGial
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX9pZ1ug9CfPPU
 6Y97jVRjvK/MuHasS7PImZatjcogA0Ysq848SWfTQzdwTbP71gFYJLQXy8HBR8mMpITp8tT4o/T
 TU5EJZ+6PYgyzOzZguk1/KvF4+euXqs8+RiZRNkZzUlLa24EJwQTwwDl5udFACxrreWyM3cQeeg
 UjJuvp2fh0dsSsBFOz5oYA0WzFbZZ7/zrx9rpDpLUqjurDB7qS+sj2zFG4qblRXwHOFILGCZKuZ
 iZLSKwM6vZme5otsMfLcFMImh5G6y8LxG7QX2ceokedSIrmVAgrhr8QJnEAQUlINTDo6ytU0I7F
 O+4egRq0cl3zXb036wwqC8Nmj0n3YhSl5rDicT6h9BtTNjMLUaUAnfLgpxPhD+isWlblzU4Avnz
 Dbt5ji2uYMdyOMdg408oH6+BKVOzuFstsRsZzCuiSNyCXxIf6nhsq7vv3wE0jPNqQL8JCpJhuqO
 miuppTGlU90j31PO4ww==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX36eVPRMbWeyr
 RXla2LAzA7U5jQsNnGYu0RNaZYMartaRccqQg8WAbf6rw7wfFMq/a5qZKm2wKcKp8r69zifAzfW
 f8OH3LLCkupKsQ8zJwoPLLnM2jSAaAM=
X-Proofpoint-ORIG-GUID: zpylyjFE9jRynsjjHHTUep1Sy3IEGhly
X-Proofpoint-GUID: zpylyjFE9jRynsjjHHTUep1Sy3IEGhly
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b002adf cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
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

Update example to the subnode form. Doing so, it picks up the supporting
properties needed on the video-codec node, address-cells, size-cells and
dma-ranges to declare 1:1 DMA translation into the parent.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8750-iris.yaml      | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
index c42d3470bdac796cc878090e65becf6b62bd80ca..b6d5ded1aae6a1a6836c2c24b1dae548cdc6f9d2 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
@@ -72,7 +72,6 @@ required:
   - dma-coherent
   - interconnects
   - interconnect-names
-  - iommus
   - power-domain-names
   - resets
   - reset-names
@@ -110,8 +109,6 @@ examples:
                       "vcodec0_core_freerun";
 
         dma-coherent;
-        iommus = <&apps_smmu 0x1940 0>,
-                 <&apps_smmu 0x1947 0>;
 
         interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
                          &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
@@ -144,6 +141,19 @@ examples:
                       "core",
                       "vcodec0_core";
 
+        #address-cells = <1>;
+        #size-cells = <1>;
+        dma-ranges = <0x0 0x0 0xe0000000>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1940 0x0>;
+            iommu-ranges = <0x25800000 0xba800000>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1947 0x0>;
+        };
+
         iris_opp_table: opp-table {
             compatible = "operating-points-v2";
 

-- 
2.34.1

