Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720493;
	b=YzPyywQIrjiR+7F311zzgxbhZSnPi7zldFO5kYGwEJfjJu+N2KOOeibP4HC501q5555W
	 zQEl2UftTX7KRxqHUEQ0MonqR/J1SnYW5PcOtXMgYVAJcc+F0Df0Gu9/2SVYMUIJ33jdx
	 /paDgeVdgDyaj7ziIMZCHxnPGJzSHL+0+TyqNaEb5SEQJaXIaJJJHO0vLf6zHhGlGOmKX
	 1ZJSyI6zYIxLZMVkLtYaR9rKRkARwqb9nRoe/P6YTa2HEXZUWxSUBJFe+A1t8qL5wmq/2
	 mCXzzbUtnA2ZOk79kyqZDMO+SAsp9Fs2yby4+2FuKySVsNqzUqJmqZfW/aN7z6b0R6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720493;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UFyVGKvWzfLCM7ZESFhQabAqKjSsfD9BF+7+SB0eaNc=;
	b=DTsPfhMv8kAeUL1E0UGxH9mMSGmAJbwwhAG98sCt+de5+u0hVLUdyyt/7VMAxJVzXAtO
	 PJSuzdpgoUTmPzNVwgMb0oAuy94BBP9EHvdvh53+rj/46u3w0YFn2cCI+O1WaQ1wDIxHS
	 clmNiGoNdWjpA/OBrCGFAUyUqiH8hNi1m0XVcvtKJ/9/64XFUYp3XtTdxkKjOIJgMSz3m
	 oEWC2kjLsmpMH8DIcMjYbgPqgJmxHrlcrBGR5C9ElAc9rUdsDspYjBb9gsoRMAhwlJ2XJ
	 iTkOTUoWkQcAhhB9J34RS20WP+9TgBBuJDRQ1CuzR3D83+PePM5AAYQQblaTuhf0pgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E0QmMA93;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g0xfZUYK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E6E606A336
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 15:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73E6E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E0QmMA93;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g0xfZUYK
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9stE2727611
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 15:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UFyVGKvWzfLCM7ZESFhQabAqKjSsfD9BF+7+SB0eaNc=; b=E0QmMA93XbWgAj8H
	M5dli9jfvjbTkXod85kVjEX0WJRO7cWlDCk6gLka262gl97U1BdDvgJpQ9Gsrbnb
	C0wX3AacR12co4u8yn5MHSQRv3TPRSoQcQgw5xA4W4o025HykMSqWY/7iyB4k6p2
	xbgvjXneDEs4rQWcJf6ODypeTwDbtas3D7TaKQg0g0T0ExNW+EE7mRmt8+aEUDFD
	Apm/7Xv6ETK+yj0+9s0Z1TGybiIZdLW8cBHcNGPRs/IoOmQBCUB7wMd7Rsy5obHn
	CLE1F4VpP9EZVjagNwB1kwcUQPPYAlFbKIdHoaZUBM79fJ4mnNp2Rw/Brh/alzK9
	n1eJiw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bgdbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 15:41:31 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1aa0fb7f157so6600877c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 07:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720490; x=1794325290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFyVGKvWzfLCM7ZESFhQabAqKjSsfD9BF+7+SB0eaNc=;
        b=g0xfZUYKu6FSD5sGLpuMHFdkGFTqogjEOxNhb00n4YYvgnycyS4dGFw9tFvPS8yKeg
         q7r2qLNDmVBd0wqQiO3JKwDKKOrylwGg2ab/HuJNa5InxubjrxvYui+4Hb9JUUCe3IJ/
         /aVYkI5QJTnku0jJSXmAuL9mpx4HY0bwuPYbDRxZWGC2VKXXpylITmnOjfy5a148riXp
         FDV9rFiKDQ0I2PYL6ve6vAnVKnQKaI+Sn9L6I3DAiRPZaRODZp5LlIJjQ5EAHVVJnBsc
         TqvCb7/4ty0LBbLPXe3gUrMsWUvg2vfuOsADz2HejJWh8Lq6Giq5nIN9imfZfNlWmlTq
         USpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720490; x=1794325290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFyVGKvWzfLCM7ZESFhQabAqKjSsfD9BF+7+SB0eaNc=;
        b=Cz7UR+jjkdcZRU4OaVJ0FrGaefbpd2k1vKo/J3avevct4/b7Fr9rHvLifYcgmIaFfq
         UmxP5gVPhsL3+Ba7Ld2Xd8Moh8AVh6UpWEQ12JqhFucy2crqE0rUDIFMT3YnSwXtcn4R
         hAxoOcn3z7Nc9pXKnFMHf99/n14JTbTeKQ75gk2D4lWn+4Cxo4jVip8BdhRRXLFVcm4+
         m98vyz7AHeSxGQuChB0S0frkJERLAsMBqcUJtFH0lnz2LpeMeSmTHfKgM35iK6xHep3o
         nxfX+RofbmpLp8ZL7rdQOr5Q6atDElYwmflANxOSk6t3yWxa0Fel4Hnd1E+9rwt36qa8
         xeVA==
X-Forwarded-Encrypted: i=1; AKwUvByKsgIurMypUpjpT8Lh4kgyPN6qILyZYJHDE5J9QHUQILoRLR32SsZ3R9vB+PXa7J37r6W8SwqPMU9iGeQg@vger.kernel.org
X-Gm-Message-State: APuU4Z8Y60TKuLPcsTWyglfQ9uGwU/8pp33RnBtRsX7AlSYVyTA94rn4
	4+iPR2IIMCW/MUztXctMd4eFAV+52lpJt8ts80kISFidQypcxtw1n6aWeh4jB0s6kOV17xcQ0DL
	nQ9wicLx9M+P2yY9jgoSbg4wrt7KGJaAyulIlWJ9Tag3fZ2t8lyOPNSOGQg2bwg2OqQEl
X-Gm-Gg: AYBFou2iVp+ylC5yWz1Gp9hsU2Vb0ET/pJoM05nvFG1SzfMrA6RxSzqDSbK2RzpSCFj
	zJyinpSUEUSSf++fbXQmlMJ7fvVp4MRT+dvFPv6AZf/FXmBd/BJust3p1ECHYUra/ax30qCgcc7
	JDje8lVFbHhBRdKi96YW12hxNabV/bm/lKuCOxsEDSThQ5a8l6saSv+PqEs8TCt6g/z7TgMlXaz
	NyFdiXrdHyhHNaW61jfyv3M1fYoiWY4R/S9nX6kOdxGKkfgw9AQh/L/41mRjQ7dfyedjmQS29bA
	U3UcEdhrAO0XVHbyWMe7n/UZBxTU3zxsPyGjwgZPF4WczeSzR6TKbj6L1UgjXtEIRWO7fTknCnf
	9z4vXNr+26uWiD2FxEYAlgfU9bIB6PVRjoMRn5Em4XON5ZLaTP+6HetnFfbsn0KQKmq9jmn0HKL
	ChWdNJ6tIy
X-Received: by 2002:a05:7022:285:20b0:1ab:f77:2977 with SMTP id a92af1059eb24-1ac5b027fa5mr19238925c88.14.1793720489996;
        Tue, 03 Nov 2026 07:41:29 -0800 (PST)
X-Received: by 2002:a05:7022:285:20b0:1ab:f77:2977 with SMTP id a92af1059eb24-1ac5b027fa5mr19238873c88.14.1793720489326;
        Tue, 03 Nov 2026 07:41:29 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:41:28 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:34 +0530
Subject: [PATCH v6 03/12] dt-bindings: media: qcom,sm8750-iris: Add context
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
Message-Id: <20261103-vpu_iommu_iova_handling-v6-3-e4b6ad864f8f@oss.qualcomm.com>
References: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
In-Reply-To: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720462; l=3890;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=PnAbHBLCBhwxjoECu5HtUTAmt7Aan6lX4I7y/GynILA=;
 b=cYUCVRBesPsL4x1JYsT2fpY6QgruOLo2lbnS6EIip0eWMHJSxaplVYn+7IkE7PB5HCZsjqcsA
 84jX5FmEwNXDjLTnodiGW1bp59se2rIJhrrMY8u96v0uqSxQcw6737y
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX/zxNaEh52VK0
 9ImQdmqUhtokU2WTvWVAFWIbcMTGndg5Yu6+ZzQGeAqPbWy3Bkgc3nmD/KHoClhrMlszaQIuTRJ
 b8Mp+EKaMujO8x/r5Xfm24ZGA6oQ2NY=
X-Authority-Analysis: v=2.4 cv=Xs1vqlF9 c=1 sm=1 tr=0 ts=6aea00ab cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 0ksrHHZAgGM-qRvOY4o-e6JsD3YS8CfP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX/fNM+7zrDThj
 9QYWsITG4pTXZgk4yLJVK3BK1VccEuIgC8j4wzN5eaQUtnipTteRHFtWtG572MtzuGa2fqlIltn
 m5wszmUYtTUbVstwugY68K7vSg81K3PIqcsLMQ6AMEz7IC23kGbJ8MenIj5/PrnTafX9xTPcZ0o
 SNjlVj2/S+WNBR/KCL6iNd0FEZyJIUi7Zf8mZHmOIxldIVz9p09YlyNB9DksHwwGVGH/Hb09OEG
 HOiWIguOxh+VU6Qkme37pifJJOXOVzoLLTu805+rKMwqncG7rHBJoNMuXAYk5SXnNw8S/YeRrKo
 /cPPB7gR5kV55ffrJ0bz8fJflmbmsBi1UYYFr2cML/qHlHFkBS2EVFD7cB1jZ6dENK/XJHWj9tT
 5Ki82zaWnYuTx5yFkNAGt5vhexNv/JsK1PbI1G3aB7LPJWTBAh6GYHClg42P5XY4Wo62BZaxs5I
 bDYOkaIaM+iScTCR1cA==
X-Proofpoint-GUID: 0ksrHHZAgGM-qRvOY4o-e6JsD3YS8CfP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030062

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

