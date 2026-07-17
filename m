Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC0D3A1683
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784320957; cv=none; b=rkww+lj1PsFL8ujQLr/phNvoqf8ZRTkqS/ifTlTyJ95iPtvz4eozRjOWwu6eVQDTqAR9qgcedBF96CeSE4Aa1YvBcPbmKhPei28MIpbDA0rF8NkwLzXLAj092Lz/XeJ9gvu/w+88IyFKadfy8XgFS7RFr1uu27IOH/Lth66jb3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784320957; c=relaxed/simple;
	bh=9Brf+yWI1x+F65UFC9Bw1afbeyT16t4oVeyZuscMvkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jm+x0qjV1IoGXIUGHatbBcQuuG8dGsNxvs5E9QdxgMlhoNiwAyBtQuUQttsQ0q3Nk9HOlsX3RabvfM7FtGFFcsMhhumC+hRWar13YPvb6pkpdZf9jrmWca6P47Kx8IqhTotvjtakI88H7hTJl1Q+zLBX3Iv9X5ZvBzdriWS5sck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1+sFPv3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fGaKtUl4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1+sFPv3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fGaKtUl4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtWaJ2906324
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q61K7rQL8TzxQSbcJjMDH84anlusBLwuWl2h6jLOOmQ=; b=S1+sFPv3oD8ZA4D1
	6NQJIZ1xqUfwllz50zIRqPmGzoEcg5+y2zpdUY6J3qfkScQ8DgHhkxXU27swrtcj
	tbBLWU0DDrKFCJPEtMiqll4uU1IQjxCjdKgApxmZEWMfJR5bPsPzojfj3rnxRzEv
	BcE1+0Aw15aX8ItF7etjkVQnPpRMDGUcvFa0b0cwVzCjKjMn0fkUs/1T33ZEHk4Q
	E31ptetYOI7hUXTz4KSjywLE64xSC78GVEgwYW2bQxit3gP+5Zcu6bYbaM7T6ov0
	fG/kEgxpKy43MxYDn26ajGVwP+olmkvIGDlEBGzBOTTsnKt/JW9TsrVH3Ui4OK6P
	oTdVhQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrsq8qjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:42:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so145242645ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784320954; x=1784925754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q61K7rQL8TzxQSbcJjMDH84anlusBLwuWl2h6jLOOmQ=;
        b=fGaKtUl4kqnFg4m2Xfzx1rtIz2jt9Z0JmZcKH7jgXYBu3WP5E0gImYo1NlWpjYy8wu
         bGJ5kp9Cy9a5nG2iI4LkBtMa2aaNjGc/UdF8GNQ5XAwEyM1BJhbeRTokcrDIxKXYAnzm
         1RZAtHZ+L8oBUtQo7tyHtX11bh88zFKeaCLsn/xBZ+H3r3dF9ROMRZnOnQHRaMyGPvU9
         T4A4njqc7rGBGxZa/WrDuQyJzDasj2RkgkpvcI2yxtyl79yjzEjsy6XlDsk1yQDTR6Yv
         WePfVRdoY/KRuBZAHT+5eaC6UQZUXb1OVEY5W6sT7WDw3ALytnsd7kPa9Nz8lNqQ6vQJ
         z4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320954; x=1784925754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q61K7rQL8TzxQSbcJjMDH84anlusBLwuWl2h6jLOOmQ=;
        b=cL0p7gE1midsFZZ8KgGmsaZUZKPBXptCIO41zTvhPbPRdQ2mBR3jY4N01ksmaWuf9o
         3cvgc3H1YkHHzn0L/BeOGFZgdhaWwYgG2330Kbxf5t14VGj5VUWxf9DfmzL0B9UBxSTb
         b0gMIREwPGS+Hz7GciSVNAWyRb6W9L9zL5Oe+Km5vJiLPN9PrxofgpzHnWur4mi1NDM+
         wfwXbqrdFqIolj77A0OfJMjpPpasjELe+iBukM5tv9UxeDcNwvqOrdttDFN+k80Y4+mI
         V/yeSJqpg4mTOG2oeQxQ1wR4zcHvgUrSQcvRmrySQW30gm7H/ii+dgUFiX5cXs/uvki6
         OCMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrnrQR9LRDgtdagp2kBh5QyEaBYKG5UcYTBlTXmAWuX4H2TMGbCqZlTCCebFDzyEDOfxcBEu/HDB9PAWfO7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnt+ZaBOB6Ukk3N/+z8IMOs2rZ2KPCZ5D8ZRv/fMqNGB1yXvPk
	omc2yuCEStVzgMBhBjSZL1Jnmyqg5c5mZFW8VBwx5p6fTvwWX7BqmnHte/eQ0HzfRweDLaIiSL3
	nlL/Hrg9qB1TVSBk8aKgm+3H69JZogs1ITTINZV3KgWqWmS8bkgJa3GDqb2vEQ0bgWqdi
X-Gm-Gg: AfdE7clZ1ceXr0g1HwYc7lADoJlyzZ1OQ8v31QDKn1Bi+j+QO7YgIo+nOOAYkKqePip
	HTJKhflIbTx/cZeZvhsIEzfbTnbZVYSKlE/7Ik/4Vlo4Ecipg7nrZYVIau/wt5pJZs3lYeaEt8s
	X0t7ytphOUYLsX3wE5WWgUyOwkUXtLjy6DA9HEwnNxWY3bxUB+l15oBKcc/3rtA6UDyP5kNmuxl
	8DjfC8hvLWhHjBT49apjFx7lYiT6Y+fCmSYmiU0kQVpomkw7YA19gDLXqkN7TfVKv/Z4/yNiEd8
	313DxP8Bjne/J3Zr9LDEBg7BtUwIn8KVstewn/jlFQ8wUGNVPCnFMcj7ppqF/rmdNUdM6jipO5w
	zGS5SZINeKLWfNpGQyFpYTX5g
X-Received: by 2002:a17:90b:3f85:b0:38e:3fdc:62e5 with SMTP id 98e67ed59e1d1-38e4b479ecfmr4276414a91.19.1784320953912;
        Fri, 17 Jul 2026 13:42:33 -0700 (PDT)
X-Received: by 2002:a17:90b:3f85:b0:38e:3fdc:62e5 with SMTP id 98e67ed59e1d1-38e4b479ecfmr4276375a91.19.1784320953504;
        Fri, 17 Jul 2026 13:42:33 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm11322997eec.25.2026.07.17.13.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:42:33 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 02:11:30 +0530
Subject: [PATCH v2 5/9] dt-bindings: display/msm: Document Adreno 722 GPU
 and GMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-eliza-gpu-v2-5-64379dbebd7a@oss.qualcomm.com>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320899; l=1977;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=H03u72Mj2+0Q/DcdLyrGjsdWiF04QoAQmREqPJ+DCmI=;
 b=SJZVRrqpECN/vKCAH/EzAokdNAPN9nODY536Kc/SKD/uVN/Wi+sIO/cXcpc14W8BcSLEm31gH
 3S8w7NqkDqRAHSQssaeMIUwci5dn3785frvA+sLtN95U3m9ljtJW6d2
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX1bcd5BElS/zX
 tCrFXy0fF7Qkk53CktRXtd/Ae82LQYn49Tb/Nw7ICjGnxQnmt29ErRtwRGWq3OEibC4W/9R8ZZ9
 9vpEMbPUl/3fzxcZ9TmMq/p2V2z6ZOA=
X-Proofpoint-ORIG-GUID: K7H1G4tCtXccKGAdoRBzRvm5plP6qipV
X-Proofpoint-GUID: K7H1G4tCtXccKGAdoRBzRvm5plP6qipV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX22XYeHq433+e
 bdp6KNPkYoMGHRz3b0KVY/HSzmxEHjBQMQ78nT5tz1Dwl8yfyaI+a2oo0LfdSgy2B+LpdraunMw
 18p/2EAqra/JhVryUl0C8eBW5YMTBHSnAgtJwbWSYdpLba9zPQtQhbm2ESPca6KGu3hVT9LpkQi
 3/nMQ0tBFfQN7BJSPGs7E4rnSnGc65IVvbkoP2+y2kZS5RRLbmehNpEcQP1pSM1AJug+KQQKbLl
 bGWnh/vLsR06zvVn5rMdq1fhuxJ+cGZK8DsfaVl36jXZrhlYFm1q0Zzkdg0hOcrzjogrYKunmhO
 phQKzas4EG/Aa5zLUWs+zDJC0IrxA7fvUk3NmmnyNhcNGIXNsKlUESWMUBsRBSMbdT8COhJ5TzC
 hVYPG8jTuLHUk0US6mNC80LxPExVcVfcawtpiOMFxax52ngycfry74PvBeyHTfOtRJ1I6B070uz
 JQI1WjnCD5I2BA11Ssg==
X-Authority-Analysis: v=2.4 cv=OJIXGyaB c=1 sm=1 tr=0 ts=6a5a93ba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=byR7QgRKzgUKQ7cIeKEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170212

From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Adreno 722 found in Eliza chipset belongs to the A7x Gen1 family. It is
derived from A730 and shares the same IP-level configurations: HWCG
registers, protected registers, GBIF CX registers and gmu_cgc_mode.
Major differences include lower cache/core counts, 1MB GMEM, no
Concurrent Binning & LPAC support. Some of the peripheral blocks like
RSCC are from A740 that resulted in updates to RSC layout.

Update the dt-binding docs to document this GPU and GMU.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 8578c2f8122e..9e459f12ce3f 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -262,6 +262,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,adreno-gmu-722.0
               - qcom,adreno-gmu-730.1
               - qcom,adreno-gmu-740.1
               - qcom,adreno-gmu-750.1
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index dbbd8b814189..d096632694c9 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -443,6 +443,7 @@ allOf:
               - qcom,adreno-680.1
               - qcom,adreno-690.0
               - qcom,adreno-730.1
+              - qcom,adreno-43020100
               - qcom,adreno-43030c00
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01

-- 
2.54.0

