Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173077;
	b=UUQbs4/2MbygHL7bfVr8M2Yk9VtLCyVE4Anos3xOMrGwOSTpLXuw7tClT/pUakAaeubP
	 XRQ6PHXs0ehqrAqkJouq47ASBmMj/5Q/YGu3hISw+aiyLEHmnV/nWo2RbsOX+2z+Kwpa6
	 18PVg4g9dBcSBf9l1F5G6aYTG8I+q1MB5TE8ny58QEAEbMbqHIFhlMiir7IwAMq2bilwZ
	 QyOu86z7Pp7VU0uT4+muTTkj+UTFSfIt1bXYqXv84JiY9SFnhf9aU7w8onX7EFbcK2WGR
	 2mLMKtPC5UnVsknmGaYElq5lsMfwt6uiCVnFpdqBAu6ntHHr1PToWH97WrIOW6j2cXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=;
	b=MfIPvQnrc4TTwK0s0Vkoo8XuBcn9nIzu/TMvvUvVmKBmMSxuoPidWdTfqEXJ/0CpUT71
	 fgWRAGZa31NV2416GZrlW3RXHQIJlUrPMGVnrD2Ccv+vfGLXvs2wkd0LW1cSUO+wQGgan
	 kYrYbgI1hfPNYDzHXM6friNIWgG2y+SKojOAkmtDYKeYQrXrGzrRjHCf3baqXPXMNxFWZ
	 Mlv1S6U+ydFvsAjP/BgERVYI61JlA5kZwsklPFF+biCabKK7hkOvFPZCHn1+4anIJ4jLw
	 WsKVbQmxNZzQaL5JcsBNe1FOQSJhewgvjeC5uMK1Rr9DDxXxmHT5ZabO4q/WqJvvXgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1oYaXsk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CUrQ50kS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF07260A2608
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF07260A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1oYaXsk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CUrQ50kS
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk3JI1061362
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=; b=X1oYaXskRqLrHtKS
	jZFVxJ5WvyU4KXJ+1gjhmAknfTU+k5PyevW8wn8wOaPl7iag3PK/xVsH87A4/7iE
	65U9JRvP5cW4UhbgXHYcMS0+YbT99DENl0eCQMtTZebInC7tJvto1V5+i9uPpBmy
	/AMwV6sGcf9XkmRfKqBvL38DTUmTmMau3v7icRyyI4p+YXbP/9V/1yGf3QBSrxur
	XT3NuFXwXKHel+gWLwpIKiFVzBO8ghO9u57ApNXUrnVtrErBVO5ShkNBMuXGSOFh
	42ooTx/Pq/NgGXiWWwz7mqMgF5awSKOrSLsF9pjm2gs9PhhIOJO6Fm04g0bVFRKN
	nGBa4w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykbsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:11:15 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso968172eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173074; x=1795777874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=;
        b=CUrQ50kSXVHY1FKiVRFqRW00l1elDTtdGr3SboGwSkNsFZEPSkgiij8LXV31mvdusm
         s5zTyv3YNb4VwlTTl/vCfRMcdJUeOzJECvdJ1M7VK3dsZVrx6EHT0fXu+TvlZuDJRcSN
         7j8DN4ZASRCYJGZ829U/tI61TYI3rovypvhgUX44618Aj8qLovMFmKZoiZ/7KoD+Vp0B
         4lAXebQnfztMUwUhahk4RBcuqDaucTOJo/1jjEVgz9qfKzfmdq+bYUX1ALJM7ZAjWkre
         mjazjqKjbVmln42YfOZpUccr5IerpOUjkFmhMpCpozMJNHugGXGsB+k/WzinXGAfTXCN
         8t+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173074; x=1795777874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=;
        b=QoQFtTeDhsstpd4RQ7O31PyvcVftYT6JX7DW6d/cYgmFTGdB7wrXtvjp3kUsVUuZjY
         B/SSpxTHK6ZMf/iJCwKerk+S+AGugOlTggdKouNx++oRMj/npHLAq0xP7VoKixnCKoVg
         fIXSkvLYyialuoNRgRcLYyQMTR2gSE92HUutXuZmFpce58r3UWAmrCuBS/rDeNuty1/+
         6DxhWzub0Nlh4uAfaJJpmHIPl+Xr5fT2BC4C9K/w8gKA0zS4Yv74e6xnZLq07NtmQ84j
         Xi0n2FvEzhkjk60orrQRY/Vm82TCh/ub5rD4oV8+JEZNMkxXxuvT5rlVHK7ew+laNj7U
         u+kw==
X-Forwarded-Encrypted: i=1; AL+hErFGc2x0f9zyFPggQq0a5W5Pjbe/CM5VV7DRGyzYlFJ2NgbPnRDsTsKIhbwOlL6yt/RXq7n4h+PcinV/dJWL@vger.kernel.org
X-Gm-Message-State: APuU4Z+LP9BTbCGsA7/qr6+260dXnrHWMgSNs4i4QD2YViwaa3whFjDV
	yulPB+ZN5AUwaNzKaJwyS3wgbk2odCT0Z/HFCd0xEi3W5Tog12I4vZwiXUObK8H9uQfzaDF+WSs
	3npTsbDispBZ1h7adsIlzd8cYSxU4ummO88ZCKlaW4LBrVxApq8d9whntO7S4SS24VSsr
X-Gm-Gg: AYBFou3aVQimLOCH9jzU1dlSiSsZCxQyqnXOzzpACBK3r1Zm5AL9Rm5DuRJt1nwvKfx
	Xk9O2nbYeLN19C/55aThsJMrtEPYpQWJ+Osu3A3xDv9OGEWjox0aKtTbos3noIxri0qll5ITDYE
	7HdQZQOdWW3FiDwQ+XImX4DkVy6H1SNA3RKURiGWmBnBd97eUtRcPRzqh2i0wQH2TJ7W99kXGR7
	rF1lgS3wJOmz+yNHPKMavCRallVCLHz05r/N16VBselPTschIblOZO4UDsFDZtxnBJgJ4+4ZkoT
	IeVRqrR/5Hy8gDcbg2vT4cEsTWEZp0R6ztnYbV1tapfmx3Mq9GuhPym/PJpjAdOix8xaycVmZNd
	CFFRCeBEY/Q37sZiE5X9qTcClUnU9XG6sD35ITxLDd1KrSwBK62cST9ywwld1eWhlU9Fnqqj8d2
	/+tJ5l7AYm
X-Received: by 2002:a05:7023:888:b0:1b3:ad63:b9c2 with SMTP id a92af1059eb24-1b5568ee910mr2747965c88.22.1795173074338;
        Fri, 20 Nov 2026 03:11:14 -0800 (PST)
X-Received: by 2002:a05:7023:888:b0:1b3:ad63:b9c2 with SMTP id a92af1059eb24-1b5568ee910mr2747925c88.22.1795173073491;
        Fri, 20 Nov 2026 03:11:13 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:13 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:40:51 +0530
Subject: [PATCH v7 01/12] dt-bindings: media: qcom,venus: Add context bank
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-1-25a771235a7f@oss.qualcomm.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=6195;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=QubAncHhhvP95+8S4/Hf0daptJaGxx+rk0qFwJM9cSE=;
 b=GJLLVLvJZg3eRglS4gj6HNYf/ZtzmRLyhRLdgszhX5eCa0sG3R2ydlGO59TBrF5FWLgpPzopR
 Z40gp3lH4ovDs6X+3Sv0JmZKHzYk/KLjzY1qXaEdHofU6gLNa3fkDae
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX608ki3SsDsAK
 ukQlgKHKqVxN7lwKVLOXHgOLmk2W6n9RqExSRYfDQu+Sf/kblKrmN/oO7ieKJVvBraEqXQKbkF3
 tiAZxG1pUDPZKmeEb3ajZgNSIsY0CVs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX7zoajCAYZA3P
 clxYstBc867WW03AvHuyPu1gqHT63r+HyvYrALY/ckGsjZI3vVeRllQy2+cANDVe+SMSxLLHx4j
 sNZJWCPoE249TAyg7IZavpx8dLHQWhCOB2j33EM3AxbDQ1UQuT01faDo5JXISxYRAXhh1QJfHV+
 OVTyb/R9DRHYfrCtzG/CPi4gSqdynmcjx8FroDFuAn2Eru2PyH/R/B1FqlveV/FlJ8+mE50SxLQ
 7UtukuhnCVKmorT1r1AfcOJ+FERElnuByRPe7udSNqVmtFin91TguL9ejq7gVG+us3f9j9Fvey7
 JqK/Bswk4eY84Wis9DuWyR2m1Hb5lvDTwIgXW19OnbGkpZuiLYEoEQcYFFxxnagC1GVzwt/YgeL
 un+eCKIulTsmpbdw3GaUNWbnv3S2QmLwniKIJbaYXIvJpfW0BvvjDmXh8Npu47qn6pCPrkoPXNE
 zJPKvDeToyXJIY3UPIg==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b002ad3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=voxwdBqwZatJwGYNWigA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: qzG3lEhb91UszgaHQy9fOxoUNTwwb5d2
X-Proofpoint-GUID: qzG3lEhb91UszgaHQy9fOxoUNTwwb5d2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
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

