Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720479;
	b=b6btRgkRw1Aj4wsXFGYHmJBLrh59ncu7VGBbf53N/p2YJZh84740I1szyQqtITcYLaxo
	 C5WPDMppvpd9VHaNSpGdcsM/jYeHFfbJJ6DyBzRV+vXsDDdoD8uTjIG2xBHDKugjF4bF2
	 3hFIHMjGBuu2mfJrw45zelYya02ag0/mquitOpov2+YM87j7UJ2vcNcscU6qUghPMdxO+
	 9AgVBTZWN6XrVQYDGybvuhPDtuHyor10vdtw0uX1FCNDBbIPDgEkSgKKQ4ceT2kjvbI97
	 52t+wzdXNKGZWj5a0j1aXrO9AQXGIpyBbtWnDipp+1j9ywmDBElKNuCvX5TBbMqp+sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720479;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=;
	b=aTgPz0CluInYKGpntpGTnqjCOMTPAA1pVIxGqlci+EFdIxmeghihfq6QrZnb+imohjPO
	 0S3kAG/T9Bgc29qgeUNofh8UGz4ZKpqV/2wE2xLZ8Kk27baOFVDBTER2mGcOEcBub29f3
	 FAlScsvELpA8/GWxF/ZlOJE2lUjnMFWMFkfpQwgshBya+hIMgR9UbZhrX/kHIVlsPbwIK
	 2HhxFQXEpVzurtvV0SYjTxtO0FPX+jUhAw1ZajlMBpL8XdwS+k3tUcEMgkHJBo0LXzLLQ
	 3AjNPTtzoYjDRQDGF2icQ3x5CihAoAiKXIHNpCoVvUpeJeSg52ckDUr/Fk6oAlDha4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nt16aCb+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D7JJyh6d;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B086606A337
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 15:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B086606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nt16aCb+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D7JJyh6d
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EAKPY3658536
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 15:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=; b=nt16aCb+ZhhBiaQn
	sy1tCG1K4A3vKg43O3NICLh4CMx6gBopwGBq+WuzbJWZDYfrKq3jL+ZExgOzM4jl
	LnWKnW4LWdbucZTGuVzO9iew7Q5yM5b0F1LuZNIq39PtPkmQkiNWI5wPItb2LMpN
	lIlPtcwJoozlUw9+6lvfZ/9Q04oOqE7TRQX2ZFZbW5QzCpr3aDMg2MnSNWyLEGNc
	ChozJZdxuaZaW4YkiyDuyXzPpIa0QZ75CIrubiSymwPLZbV/iIs4b0sIzL80qo1n
	GVzTIRyz1GmHO0bvAOFOxUq9Nv9PNm7YcMHJ7iBXhjrUnu2sbKm1dreYhrIyv6yP
	LOypEA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94ctfm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 15:41:18 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a5005fd0f8so4069608c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 07:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720477; x=1794325277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=;
        b=D7JJyh6dN4KOp7w9MrzT9sYd7s+xHBWzwzYckrnhcdUlidZeCDX3YmCOmS9EdYcbN7
         I1bsWZAqKvETTcbiQpkM/xMm0G3RPCh9hR/vgbLYkcuadUQea6t9CVAWsCfvb34U3+Q/
         WpV1BktBsOUMwLeIG6I4guDcqK8e4pTNiUVM7Fm7hqso8vKEVXjW9jRByJM0OyNdMrvk
         tqQ3Pjokpn+0e9i9hzlnzUdLAyph873VgBAFJabijQcvROJyOPguM4E0CgKwRbADX7i6
         jFoKAKxxgZ5fFvKBOxpzVhxrCcQysOZxu+M+cL9fjMaqxAX1QdKHL8bX0G3dIneMtau2
         CXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720477; x=1794325277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=;
        b=Y1BUrVYHt+Vz4IH7grEG+BwjN/OYJ3YAfg6yR0ZgT3Woj2VBxPNqR26mUWMTQnyeKA
         27fOhlye0QmqRbsHZh89HXIMHHPeFZfuymJghcRUqEFgXw3HwL+v5F2PRLZdMm4p56Uo
         PL025UGM/LWZsPy+LI9gtQyOsG/ulqpB2GZuyzMuvUHfgSt0ptT67N/9w7v63eVYG6E5
         hAoyHyZyQmJevF087zzGPeNOWx0u/ht0kGLDZzBh/bPDJMiJ/xFzUnDnBe9/9KmIJK5Q
         w/LOlMMFPWfyq/5hiiIUMtuRrY1/3pyn7V+8x7PpExI/gd7QEyG5sye2q2HQ5+gaE+wM
         35dg==
X-Forwarded-Encrypted: i=1; AKwUvBxXZGuI4x0ToY9niyM0+QoEeOC66wPbB7hG9VSoryYQHAk/KmjOHe6aA57xqvmsKOHz0U1W43BEMWXnfVCb@vger.kernel.org
X-Gm-Message-State: APuU4Z+pXA8w3FNNTaX4rsgbyBIsHmI406xVHGJlK9SEJ/gMUup/nzdm
	32GyW8nXSGvIxYRzSXtz4eo57YuGvWWAeqCTuj1ycyBzriQ7X2rBTy4LsbtX9eJfl8PdzpgYbkG
	1yoxqDPDKPBKA2sPAyTF5rKrt53rAX4BxW0pPm+15WK9vkJ4aHlYYvdVnxk0TuI7axjOp
X-Gm-Gg: AYBFou3D28hOy+Fuw2eIEZBUkHBEQHE6RgwOW0LGJF+jdRwmpjS31K4SdYrnmLBBwGG
	qAmKhC10R64aGc0T6JW2JVhWrOrklfs3iEeR3FU90R6LnyR4DOWer+TNiBtw++/c0D4MTO/8aRm
	xb3rH9LxdScrkb4Hi0jK2Iiki93+aBQTirngWNZMy3WAdycY5nCNZNbsBxDg8OY47WjnAQnJPRr
	s6YPqQWPtgc01l/EMSurRc1sNxBo4SGhw+Bnt70qDirsjD1Imfr8VJahfCGpfXl/MXyMCIrOqlF
	TbImmnscyPb8rQ6Lo/SGKcmybpr+36kUIPMDJAAcnP9uh+hMqFyalY00DE/RVzszFH1QaniHvzO
	pjhx5VbZmqaa4ptlH52PpEoJ4ZWePZNGdQ36pWC1693o8W3EWOf0/WEblcyRQ0PYVKFaziABP36
	i9lxZcKhLn
X-Received: by 2002:a05:7022:f517:b0:193:9aa3:4758 with SMTP id a92af1059eb24-1ac55968b07mr20095858c88.4.1793720476866;
        Tue, 03 Nov 2026 07:41:16 -0800 (PST)
X-Received: by 2002:a05:7022:f517:b0:193:9aa3:4758 with SMTP id a92af1059eb24-1ac55968b07mr20095804c88.4.1793720476236;
        Tue, 03 Nov 2026 07:41:16 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:41:15 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:32 +0530
Subject: [PATCH v6 01/12] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
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
Message-Id: <20261103-vpu_iommu_iova_handling-v6-1-e4b6ad864f8f@oss.qualcomm.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720462; l=6195;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=QubAncHhhvP95+8S4/Hf0daptJaGxx+rk0qFwJM9cSE=;
 b=UEnMGq9ltxZfe+efuJ0SQNZ3L91/jGT5P2IkwUdUo7Yh7x+uwMAi6sdgm4DEsP2zKOD8lmsHi
 XiYdL2X6NmRDAWIWCTL45SlDi0c5vWn1cKFeDq29Gw7dA6I3kfgaXKE
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6aea009e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=voxwdBqwZatJwGYNWigA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: LygyhGCJzmeQGZJmG0FA0URcvmjboEGX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfXzerog20tAm2b
 Q95GzeUZQUTIFp8GY7IBL0GkxYDkH0n2YyPNrO9q1rZNsFq7wUhL4czoMIvO7OD+F4QD/UJwJXb
 S/A08hjFrw87pkPAYtnczbBYaA+8gZPPq/YYsut2OxGOWV189FaqOHoFEFUu+WmJBY+hHAw2PT3
 jUIqkX7wBaCB1S4CImroJTuZPtmUMbTZvksW7bYbU8oAPVtn9BgQgpWDQHw0/tTmDOXd4cGpg8y
 q9PRSD0rOPH/faVFUzAaQLeKFJ0rPol2dUJNYFy92d9cmm3AztvT9L56PgVeHX2/Td2BYFZkHSO
 udqiURDgxwNKaeXxVhx23XWJN5JrAVI+h/Pa5h7NLuBpjKKxiUCzibJBJY+5QaOzPW61Jur7pX5
 uvFB7y4ZGwuiJWnCIQ+oz0Bvu8aSV/IsTQ8aftprO5ImhFL/gwhyH8kKeD0KHNeGD+YtBPupJBZ
 NzMon3xFn1r/9fTmURg==
X-Proofpoint-GUID: LygyhGCJzmeQGZJmG0FA0URcvmjboEGX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX7UnnyhSs7QPh
 qQ8to2JqP48bnaDY48qJS8EhOYHXaYUvVHtfd8CPkySok3Spvo2EW0FOByxQHCGEtU+aytvaYq/
 MrwsCuS8OQtOfREELe1Q4VWDPENbKEw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030062

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

"iommu-ranges" on the subnode describes the *allowed* IOVA range that
stream is allowed to use, so the IOVA is allocated from the specified
range only. Define all the possible subnodes so as to describe all the
VPU hardware iommu interfaces, both secure as well as non secure.

address-cells, size-cells and dma-ranges declares the 1:1 DMA
translation into the parent.

The parent "iommus" is kept as an alternative via "oneOf", so platforms
that have not been converted to subnodes still validate. New platforms
should use the subnode form.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,sc7180-venus.yaml          | 15 ----
 .../bindings/media/qcom,venus-common.yaml          | 97 ++++++++++++++++++++++
 2 files changed, 97 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index b21bed314848480b82153e49602f0b19e08e7335..bfd8b1ad473128c974bce84639cb0aff59d8c2cc 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -91,21 +91,6 @@ properties:
     deprecated: true
     additionalProperties: false
 
-  video-firmware:
-    type: object
-    additionalProperties: false
-
-    description: |
-      Firmware subnode is needed when the platform does not
-      have TrustZone.
-
-    properties:
-      iommus:
-        maxItems: 1
-
-    required:
-      - iommus
-
 required:
   - compatible
   - power-domain-names
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 0be2f9119e78233928d23af86836ac294aa769ee..6c205077bea4d729335d7a5690a57bc1bb43ed9f 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -50,6 +50,93 @@ properties:
     minItems: 1
     maxItems: 4
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  dma-ranges:
+    maxItems: 1
+
+  non-pixel:
+    type: object
+    description:
+      Context bank for VPU non-pixel buffers, including compressed and internal buffers.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+      iommu-ranges:
+        maxItems: 1
+    required:
+      - iommus
+      - iommu-ranges
+
+  pixel:
+    type: object
+    description:
+      Context bank for VPU pixel buffers containing uncompressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  video-firmware:
+    type: object
+    description:
+      Context bank for the VPU firmware processing domain.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  secure-non-pixel:
+    type: object
+    description:
+      Context bank for VPU secure non-pixel buffers.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+      iommu-ranges:
+        maxItems: 1
+    required:
+      - iommus
+      - iommu-ranges
+
+  secure-pixel:
+    type: object
+    description:
+      Context bank for VPU secure pixel buffers containing uncompressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  secure-bitstream:
+    type: object
+    description:
+      Context bank for VPU secure bitstream buffers containing compressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
 required:
   - reg
   - clocks
@@ -58,4 +145,14 @@ required:
   - memory-region
   - power-domains
 
+oneOf:
+  - required:
+      - iommus
+  - required:
+      - '#address-cells'
+      - '#size-cells'
+      - dma-ranges
+      - non-pixel
+      - pixel
+
 additionalProperties: true

-- 
2.34.1

