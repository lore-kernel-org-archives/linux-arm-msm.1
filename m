Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0723911A9
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 06:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790404488; cv=none; b=pz3uPr919IjwO46X44JQkDJwexMKhoeYrUF2rftuhlRXULgVZU7xP7Pz0E0L2e0jxKnXlZ/eM51N83lNn7Escvo+iihJnusvfbL6YANolabMncglYqTdS06Rnm1nkXwjZ3dZaJV/XUJOf71uKZfgelRfdCOfIxlUnJ1mmSmMfgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790404488; c=relaxed/simple;
	bh=yHsO30A05MXmUjgWMqhSHRfHlmPgdfem/lqRi62WMjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h72pSitYT4DEUlmRhpeWMxodI4I0j+omhgALI5RtWSz2Cs0XetKgipwioGsoMQuztZx9a5c1D9Mj48OtG7w09bTVg4NXOrABuNRFW3MXIdZNRUuVsmg/HvJs2qSyNwc7YiRnzeSHecMg2Bm8cPIQfBpLwsnYBvAjxM9CqXNc7g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G1O8M2E2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T9bp/qhc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G1O8M2E2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T9bp/qhc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6PdtK3138008
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 06:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KLaMYwCwOkkTw4yWr611vV0+1feJAqLJ5YJx1fFHMQA=; b=G1O8M2E23Fb8jh5M
	wQNjkVIn8lKwe7CouAF+P79ut0uy8tUQjckBz5on82zsQXRybyc9TqVJoyGtU1vU
	9AfCTXIVp8fnhro6yXiQ+T9w3NuRLr2hmKs/2jEwYiG0BleZrgYjK4gD7fnUh61K
	D2tOQXX9JqSey2tL5iKGPApTF/femUtuc8YIoGJTFccMh3+pBAp+l0uYE5cYXTFD
	Zpx08LKqEqwLCTHQpr6uju5s1gmvQMWXCBNQhtHGEtAGiYuOQzHpxz+kIiNL4Erb
	839oBAxMYbMqx6i+boA6MO9QiXNvwxfUcfb7zWcg+H9j0OAt6ci2ZsntQKXlWGKl
	wLwaHw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx5cggcve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 06:34:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33f01b74124so2249959eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 23:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790404483; x=1791009283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KLaMYwCwOkkTw4yWr611vV0+1feJAqLJ5YJx1fFHMQA=;
        b=T9bp/qhcuVrDIF6jqiZHie9+th8ibHe/01dVgyuiyg5eD9Vo7o78ATXk3+jjJxhTM5
         va0UGe15dpqjBoU56iHlQnhuiyv3IrzQtz5qOywY6VJx5ytrKncjSOuKWq0y5ksfGXTH
         +KyCmDK215rD7DWMdkUQsfLfxnmUBlj01AxiGsBv9MhTCvJWFISrywIhomzV0OPbM9aS
         q3I2nNsVhr1XaJHppwJjLdvHcnL+iYnDZEyLz4veQ6juZkk24yFk2dQ4GeFdD44fznpy
         /xip1khkSfB8X9nhsQ4djMGCY7+Clgcx+7ORdHAWGmjsSDOXssYPforjCNZ57iKN5vwb
         nLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790404483; x=1791009283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLaMYwCwOkkTw4yWr611vV0+1feJAqLJ5YJx1fFHMQA=;
        b=HVINhrM6wRawDH04r50ywOcV8BTmj37LNvD218S1fnOT2vhyJZSnGX/EcuWmnksuT+
         tWgMtuTDMwCyZ5MTxpGJkswYk/BJCxSh78i09FvVmAfZYZyeskbAHXFy3HBP4FkWqz15
         3KJ7o6aKxJeQPy13tyT1E176Vz2yralnhj5VDM5CRU6JB2FP7cBvH8VHuZAaXYfoPlrF
         ZVcWLtMcO2jsYPGy9WI4R0ACTQ5lVmIpAFYhWHmFGxY+BJKWtfY6kauEWm7/NfVgdnjy
         HCuuVeJGTAdIaHw8JEjCmy3jOBg0Q3Sa2ZdSjaPzg8AYbol0ZGkY58C6xgUp//WMy5Ww
         xlBA==
X-Forwarded-Encrypted: i=1; AKwUvByiqiew2SXGr34WK5IP/8ZPzw4uobznwSpjjYgqKzXwnhA5w2OluW4bPfRJFZUPjWpcn2RaiNJzSQJKHCpy@vger.kernel.org
X-Gm-Message-State: AFuF++ltjr0lQJ3kMCeCr/eRyuxNmG3nmR/rsto1p26ld6FWqd1ufumT
	VcqYxe1FM2/F/jBwbph1fbRJsN9HNGvUD+/62RJH+KGZrMGZASLhacEtoV4VLilmbTRSf8grz07
	0lIrelEt7DKzFDnVbollnaXzisRq9uNpZU9WNgmvMJhIWIzcvN3e5EgCVbIyfHqOshM5d
X-Gm-Gg: AYBFou243XGKe+qOEhOlSudvKwju/UfYHlp2u36I6FiaRfvyzmvf6prhKyekvd60/Px
	VnmPVAbe/w5PDtgYA+B473iRrRjkTBUrwLFJJAy5wD6YF4FDbd+1nTwlTJ8i5eZAtMgyuWG9rap
	8FLRxZzA4x42zccYuJqjH9bEZ0oqBtCZ7J2sOA/5w3+wlWID/q85r8Z60gF61yUrpjME26Z3REG
	RZ5vgYsmiA++tnOJc6hnMaRBWwYSTJm3ZB2N0O0xdEbqnvDQYRBVnQNTv7K/x+x0KaqBpse5IjX
	wgzEFQ/GCr9SEFyTXU5JoE3DczOlF60dOJMs8FSp4w2X71r32YRNMRBjupf91u4YF1xL8MtxD+e
	hn7Tq3wjOlLcsQSZ2x2tfhzY2peYYFVbNPA==
X-Received: by 2002:a05:701b:2313:b0:13c:d071:f97c with SMTP id a92af1059eb24-146cfdd1e92mr2105104c88.11.1790404483089;
        Fri, 25 Sep 2026 23:34:43 -0700 (PDT)
X-Received: by 2002:a05:701b:2313:b0:13c:d071:f97c with SMTP id a92af1059eb24-146cfdd1e92mr2105071c88.11.1790404482112;
        Fri, 25 Sep 2026 23:34:42 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm9700691c88.7.2026.09.25.23.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 23:34:41 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 12:04:01 +0530
Subject: [PATCH v5 02/13] dt-bindings: media: qcom,sm8550-iris: Add context
 bank subnodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-vpu_iommu_iova_handling-v5-2-0322ca5dc10c@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
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
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790404457; l=3779;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=yHsO30A05MXmUjgWMqhSHRfHlmPgdfem/lqRi62WMjI=;
 b=Uw1Qs/lJhKz2n+Iqf/32r+jf3RsWE/D+ILHjzPTeNblWJtvhjnb0BixOmaLf6X9abqrXzVla8
 L20LeQ/KffjBLGuBF2ao34Oztr8oc/uF4diWgkFI/1CPdxXl0fPBcvg
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX7MHZagoC/D86
 DUjB4ZKDRZ2joQ2jqd2Px2Uw66le4Wz0YOmBIbbZHyvoqZtHkSgqcAvAGXdCeIwzppyOKqDxPKf
 fm1qZuddfw2Cka9FrPjfSqt19GS2V245VESEy13FaG+gk8rAXoB6THw1u679LWhV2tRdsJit2b9
 SPluYUus0S5MLmU0jZLuhSSWjupQIRsfWIgJCrxvrnVxXLd+HYh2dKzQR/NmjPLHhs1CNdPSdiF
 kmedAQeJtmNr/mRtQYTtL6AHkOJgxyYvz7ZrjLT4iZuRAEwj4vrPVKdVAk/BcjSPVZ1DGnF5pmd
 HHKEVnl8jJTlZcFC47vUKGlR1vZKgeOvlIQTmSnCEePbmpxQdwznCkR6SuJGBKBoYjWdm4aMDRU
 zsLgMzMnjU86UWFF+Ieq5C6VciR+Yt+hPSQbu2IqLRKOXB4zRTiHR05q/mbJi9ayjT6T48y8PRK
 3SyRDofIpZXFHAz0/dQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX1dY0+AG8Eukw
 DHZ6JKsMmeB5fU0f1LTDbNLyY0gEbzkoFYC5CcyAzYDccChLn/FuIJQhLd3mDEifRfzbDY8sywR
 jjZvUg99PWV3AUIQT18kZZmaArfOukU=
X-Proofpoint-GUID: JvkuCRcxAqhCOFz8IWNQvOybYaiDTV11
X-Authority-Analysis: v=2.4 cv=QvLLTlyd c=1 sm=1 tr=0 ts=6ab76784 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: JvkuCRcxAqhCOFz8IWNQvOybYaiDTV11
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260026

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
associated with its respective addressable range. The design was
discussed and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach was
later concluded to be a hack to avoid having subnodes, and was NAKed by
the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

Update example to the subnode form. Doing so, it picks up the supporting
properties needed on the video-codec node, address-cells, size-cells and
dma-ranges to declare 1:1 DMA translation into the parent.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8550-iris.yaml     | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..6ee9d23554cffb30c92017ef99de15c2493455ac 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -98,10 +98,10 @@ required:
   - interconnect-names
   - resets
   - reset-names
-  - iommus
   - dma-coherent
 
 allOf:
+  - $ref: qcom,venus-common.yaml#
   - if:
       properties:
         compatible:
@@ -177,12 +177,23 @@ examples:
         resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
         reset-names = "bus";
 
-        iommus = <&apps_smmu 0x1940 0x0000>,
-                 <&apps_smmu 0x1947 0x0000>;
         dma-coherent;
 
         operating-points-v2 = <&iris_opp_table>;
 
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

