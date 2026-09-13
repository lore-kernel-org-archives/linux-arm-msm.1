Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE333F54D9
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 18:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325404; cv=none; b=JbDX9AwZZeSfdtEkI0RMKjfzQ7xf1lC5EusYWXuUDyylnwQdWWIkKhsGNUbDCZQkyWgTUb8gh6TxhNPRMx796YRbs68Y65sMA2GjG6sIvcwEEUZFgz0Of7V1kt2K7sEbzTBXy+RIJOKUDj9169L3ftnHwyu/cePJHoqqbae772g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325404; c=relaxed/simple;
	bh=qp0eeFSkW9qr12mPAr9R15JuDe58PZTGuiwGGGcfu88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tpGguv+B39/Z5NOlqCR2c/4gpzBnIDZBsMEpSlwFCg7xChxrK8e+w7bsdr6971vvUbzVolFrWx+e25L4uROnawBZXvV2leuQLY/qIq6JYJaEcshBiF+T08iz82BjfPN8JKDPeoTGa7xP38APrlC3d9iVR9Ik8Q3+4Vl/sVPmqdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2UDWIFh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYu3bKP4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2UDWIFh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYu3bKP4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI35UM1930098
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 18:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	782d8vA5qKhzXjsmtq848zNPg/gGyTeOCElg/IKXtGs=; b=m2UDWIFhOjm+Id5+
	2aKWySIYLUdIGILBkxQu9OVYcryJbSWq2gLhzcCWIzgkFo7qz2OQxmg39wn/u4Xg
	V0gpbpSmC1ov/qeiM+Ih1g5Y+deCzCcw4TD+5dF8S9s8FUB2BnxkhCIU4vqnp/Rk
	Ife+WiOTstQFzn+yHv1W82kJuzejZvhqP/PvtMg6AsJxJ1ElA5Wjl98zlHiHGUJn
	YnDc4T4FNsZRbpGmZuvUQnb02QPVG6/MkuaO/tKA1Gos2S+sZj5qW4sXjeYwveuf
	+Kz53DzdBUvhQekUvPoMnh+iRje8zDhsq81bBCS4APoJTLEgH2VAECY2Ds1xC8wz
	5cbFiw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd3y4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 18:50:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso5173919a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 11:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789325402; x=1789930202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=782d8vA5qKhzXjsmtq848zNPg/gGyTeOCElg/IKXtGs=;
        b=LYu3bKP4y++/pibnEF+TqGVojZG/AKKygb33KACLBgabiTzBbvlOiVAmQBIRQy/Ijy
         mWJG4pJmtk1m6PoAM2+UcQ41r7xr7HbF1jK1+NroyaQSz90m439xgdYzAVycYpHPl2nH
         PlQHE1CElBmXUltRUU6gX9XPf38kY+Kzrlqazm05Gp0EAaQ7cyjx4eg9KYt5YOhe5zYQ
         ut38xUAejq7eUHFthkr/7Pxm6ipri+YhzmZIlzJbKhgFZZ+hRsWqAU4NUuN8OEOWCFlv
         0KBxgqNK0rT70B/EdpYhiVy+htG+4A/WKv1fWT5Za3A5KiXr0NdnH7CrI/wgqsZk/nXK
         k9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325402; x=1789930202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=782d8vA5qKhzXjsmtq848zNPg/gGyTeOCElg/IKXtGs=;
        b=cMljRqQ12WpueRAY33mkDhe8aT9DO8Tmi8Zdrx3Agpova5iqodCtgLV/FHjMLa26ke
         JVC6mgE7ZFMy6wQMZcqJUt7BM48XKP6oKZHlu4NxRqevIv+do/m4zY0uhROQP7ArgI8T
         zm9mXFDwAqUeBNkUS0e0GRyZWkBW6mdm3zxECnhRwXCTtGplNYNOUpx3gRsWZv2ahVpE
         0rYnmCMQvURjFgMHC5QmM09Nu9xJSdPoEytzXBGRnQ343QP8TfVJ8yBaM1gpEQzv5OIZ
         WY/FNgWumjlyQcTNW6WTa0MrYH5w5HWsI5g+06ISajROLn9oN6+pp95k1G2uZ80n62CC
         OQeA==
X-Forwarded-Encrypted: i=1; AKwUvBxfjsBUpNd962p+2WGVp9Mn4Y/0FreSZFOJuGp2x/CQcDlRCqgq+wdP2q5DvjMPgqiWu3irUvyw0cjONGvU@vger.kernel.org
X-Gm-Message-State: AFuF++muaPgZUjhd8fbvvXvUMLymCde3lxVz4AadEaZuTyxOXAV8Uu6N
	tL6f95tdopWCt3+XXdAMUajB24M6Hx/IGKW5Ky2+otSFjYBJ8hgHKKvCD2Np3lIPgBrufTCOU4y
	wlGpfJmv7QuoQu256j57vyO3mbucFGu17ahNxDxSIE64UCZALSZ9MXMvyqmsJZAI2DaLj
X-Gm-Gg: AYBFou302N0vvoROTvKxjqnYpcRiVKTig2MueZmwWwYCIuNm9VUPZNrMHF1KDJyygDv
	fHXkzpoC3XrCnRKXgq4Y1adQv679x7RmT8guxpYpqh9SUryJpQYdsCySoW+Uv0MxtL3gTumEeNP
	+QYLqx6MA5zHqRjWs7kcO4KC6lk8VdKAxfcM4tTULO31R/wf/rR48iyEd0MxEWG3ws/ak16Web+
	ti1yYX14A0UirquyuxP5O/LAsbwJ8fiR0d7r2Cf5dW7+QCZjY0YguokMdVxaJuP2AECLGeOlhIF
	NCuZpy4LN0OTTSb7oT1IbDqjqXMpb+lqnFUtgu5rXBqPuSQlBmn6XG0SkHKnArKZeA6nqNYGkSk
	1AOCGSLwdZ9fRCcax70Wah2/60t2TC+so99E=
X-Received: by 2002:a17:90b:57e8:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39d9c22762emr29007917a91.20.1789325401466;
        Sun, 13 Sep 2026 11:50:01 -0700 (PDT)
X-Received: by 2002:a17:90b:57e8:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39d9c22762emr29007860a91.20.1789325401043;
        Sun, 13 Sep 2026 11:50:01 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm22473130eec.24.2026.09.13.11.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:50:00 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 00:19:19 +0530
Subject: [PATCH v4 02/13] dt-bindings: media: qcom,sm8550-iris: Add context
 bank subnodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vpu_iommu_iova_handling-v4-2-9b9074a73c41@oss.qualcomm.com>
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
In-Reply-To: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
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
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789325376; l=3706;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=qp0eeFSkW9qr12mPAr9R15JuDe58PZTGuiwGGGcfu88=;
 b=e3q/gARLkobKSIVL8IEYb1/H4SLP6nioe3uupeM+r9vAHJmujI9Vmw1i4Pn5seRY2EcbvlGKO
 0wrG7qrDmuoCw/T0vRWi1Szt39vWGCTfHJi+9qp4upYz8V7+goTvEiN
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa6f05a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX+FaUPnQBUe7i
 JJgorvrD2F/ky9VGrgCVJyKY7US0i0LI1vAoSjVgPnW/LwdU1nolzaqnzwnepMJeo2q4DY2QhI2
 Oc1C1hfzC7yYwvdgr21iaKwNnT70heOF5EG/373dWqVstdiVVbCHh77sdqiwQxLsMGRh65bVIqw
 KCDHGB6FsbsY3aaV9m6vZ+YYLj3Hv/QQzGPtzAPiGtBfMNqrYX/ua8Hd5jS2FKflGi8OKElEpg9
 zPI2SVQci7b49lle04IXEosMnMR2fCLRImIbxAFN8MLh1d4rl898HkVjo1Rg6mpQQ/8sIqtjauI
 uQcHHtSAj37BB4Zcz6j/nPGxEvkRQpYzV4GR4w0xI6hzw122xs8s07oF+1ywV0enEpPzN3mtb1j
 fZNQnMmX7J6pfBvs1Zb+7ORRuvQbpYeMsECXi9xqsVjTcWbmFu0RHXeS/eAomU4+6lMhvk8N3uS
 wg4knLMCqwEXKqGuI2w==
X-Proofpoint-ORIG-GUID: 6Fu32tBnoHU-yHQYLLSACVnx9_vYx24Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX8YaZKV7WLyfV
 olBFL2kZjCh+KS4ZlEa68WEgYrMus+SGZmBzpxjrx/Q7aAo44CHvwLuzfIvl9DBW6OqUcHebMXF
 Fzj3LE3uyAUA+ESjdBJ3eQsUix+tY44=
X-Proofpoint-GUID: 6Fu32tBnoHU-yHQYLLSACVnx9_vYx24Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130267

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

