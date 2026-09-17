Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38964B0CA0
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643051; cv=none; b=DpNbre3/0W5mj9KXcWFlto7Oe/E1ifHFYFFWOwz+jF3HF/joGZlj0gEIhZH8bqvEJMg/fbQ7o0Sv6rq8JT4tUDJfCiHCgjQ8qyBIJgKbbqhNOEGPbvqzU5QimjDcmwbFpJFCMuINiwu+ASiuOBKOT2M2dWHbhIGS4SpF77CaGjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643051; c=relaxed/simple;
	bh=iWkCu/y3GF96z/dfl8cQBoWoQJrys+dS2lwwoXdC6ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kRb+/BYw0euRkhjPK6gUTp39kiSO6CWdjhfLHRQAuZ/MTlVKTeTVYTPG4eWOxGYoauQozy68QJvQQvV17z6jN4f9+tD3d535ZCt/g6zCG5ys2Sh2HwY2KaFyYO080GV0SF2Bp67OX2fjoZ7G5ZypN8rbAOkKru5oo/l5EABAYwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SNxM2gQh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AsHnSuHb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SNxM2gQh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AsHnSuHb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZvVQ1390241
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/e7A7scuotZ7PrPwLZLnKw
	qe0D3HalEMbTyx9Wc2ggo=; b=SNxM2gQh0gHEfEkvm21gwrTEsimniXfYghe/IT
	vu8VCY2pZXm9Izl2SqsVrGvrC78ed2yqwXWa1PfyThGdm5d1Uz7ZxpdNVKr0gsSD
	8T3Aqy+CG/n+oBoLbU9lq001Tpk3PF8alfpbovPEVU6RusEQBSjYVNxdEQ3wK9Ds
	B0CpcOjI5sdtcOm5L5pNIL+V7LWPab1tJAoIj0mMgt0X7ux6+jj1sqKgSyVc6/CG
	WpKV70LAuR1xgOp7f1uv0BEUf2IfVuID0uzyHWORbjZpqcRNhUX+xeSZQvkX5oz7
	9NN/tvpIXjAb1L91cx3sQGKlT5+1WcZ1wym1akyuMU3RKfcA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d41r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:03:57 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c1538bc4c0so544848eaf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789642968; x=1790247768; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/e7A7scuotZ7PrPwLZLnKwqe0D3HalEMbTyx9Wc2ggo=;
        b=AsHnSuHb7tqBfke38vCVnYwxCeg1LJXxn8Ct8rv4oWav/NJmy2OVxI4ci7bhL5iITC
         iL05eArrZasf7cGfpDqn4hlCA5dqNT5UlYwSeZXEbyBTwdTAlOR0Q3vfyEfQ4gLt4kwC
         63tVi6s2hV/L68H+dVDtdC/AWTJ1c4frl4u6qdjqcATL0yLWBn+0bwu0Xq4V4paG9tsB
         PoHTATN14/DzHCAp+0RIU/7r+BRENRXnRHpjWWvieAVgxVogDc48687EPPy86N59Mw5P
         58lROaaPV30iXWm1X5ODeRus6T5jL8gId1YIX/z9TLAhohd6AfFovNp/0LEzeofAiHe6
         iROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789642968; x=1790247768;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/e7A7scuotZ7PrPwLZLnKwqe0D3HalEMbTyx9Wc2ggo=;
        b=selMhQp9I4l2rZlnZNkPIxpVGeCoDKnt0nPOuTF4MpGSIxQc/78J2clits+gtWigQu
         UKDoFLpOSyq1QZnAKJmVUS85EIJ3MMS68fKz8xdzO6oJqouJhWDXONolR65SWvAd1sX2
         h8yb9jTTnM0MWh7hhYlQGgrrxOEv0SavNDaFUDbNbCdHrriEJ6wwLDpYh9QaRKE2eaYO
         6ruBru1wr6zB1OFbVMUZhIL5/ctmv/B6/WoyyIIouUFW0FBdD/tfNIkfFSLR0YUetGwH
         N44fQluH3AmqD+1PvgpxUsDvkOeIIWq8o8kqAXqbdyiFqBvbGizOMqmGcixvrew+yLo/
         OwIg==
X-Gm-Message-State: AFuF++mDVIn+y9YNdiZcHnh05sBKTVPKvIl0Y0yFhpkPACcckB+BHa3N
	DNwhcMGiHowjRMT4ZEUNWrKZHCb8WLfaN60BQ5E9sKFT8sagG+hNBnDhhuUQh7O4yA4o3DhKOLp
	9utCLR9CqBCqPxDasW/91Sv05rhM7XldgrEQHtMVFnhGtIpzqVy2lfn8hFNI1sA/6/lcu
X-Gm-Gg: AYBFou358OJWldPPiK7tOPYZgxmXF+YWtKfG56x7ZVtxcBsa7V4SHdCXwN+u0UFAkVp
	P/tZVkhUb9EMVqkgitUJ/YVBld1Jcqs2yu923ixznCKpa4RF77a23PJ0bD9SKWcL04E6lN3nn7l
	nRV0/4Weuay2CVExp5LNCHvl0k6BHWnl+C6xIQp6/kZXs+YT1iM9ZCzFMXswscQCdEGAcy2gSEt
	4OJUDUIkDCd4wKCWVsRL5wCa2C4BsL4SMgq4+XCCU9kCAjUpULa89Vd1bUZ+YJfVxAUCwqt//kQ
	HvbIKA5wkBjAU8pi9UpeZ0FCb7Hr65EKtZ3S1zo+MJeZV3ReU5EwjoPKgDdaZPf9KAovFzvnabs
	dbK8+EssK7IvXZCbkRU3nRJxPbbAPb65ry1hPWw==
X-Received: by 2002:a4a:ee1a:0:b0:6b7:46e9:970d with SMTP id 006d021491bc7-6c7d4af272dmr5484963eaf.61.1789642968360;
        Thu, 17 Sep 2026 04:02:48 -0700 (PDT)
X-Received: by 2002:a4a:ee1a:0:b0:6b7:46e9:970d with SMTP id 006d021491bc7-6c7d4af272dmr5484937eaf.61.1789642967908;
        Thu, 17 Sep 2026 04:02:47 -0700 (PDT)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b2753csm29806029eec.31.2026.09.17.04.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:02:47 -0700 (PDT)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 16:32:35 +0530
Subject: [PATCH v4] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Maili
 PCIe PHY compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-vdev_next-20260916_dt-v4-1-e2f22f67646e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMrIq2oC/y2MWwqAIBAArxL7nWD2MLtKhJRutT8WKhJEd0+iz
 xmYuSGgJwwwFDd4TBTocBmasgCzz25DRjYzCC46rirJksWkHV6R/arTNrJ+4aaWSnFsDeT29Lj
 S9X3H6Xle+dZEqGcAAAA=
X-Change-ID: 20260917-vdev_next-20260916_dt-8b0c37990e5c
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789642963; l=6218;
 i=vivek.pernamitta@oss.qualcomm.com; s=20241114; h=from:subject:message-id;
 bh=iWkCu/y3GF96z/dfl8cQBoWoQJrys+dS2lwwoXdC6ts=;
 b=Aye8HcLkEaWZsinGu5odswmYBoOefcEiw7l+qvqdL0GiYpHrhLupyRY7zga17bBhi6bC3yu1u
 7q5qv0RrJzqDL4UhHEvaUF9iZIik8MEALP0VxY4+vs/l+hJm92xJoEl
X-Developer-Key: i=vivek.pernamitta@oss.qualcomm.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Proofpoint-ORIG-GUID: khvRhbCDeNmt5gyRdL9U3QKvhk89qIHv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE1MiBTYWx0ZWRfX7GBQ4J2geYy+
 rvH9Mp3ZuFS17B945CMlFdGBpRBmibFB40uARPQLDV4VxtMgs0wC6YAgQrwAZ6Gs3ij13Tf9pu8
 d/d/U+1rTm5TcbTF5SVMbbnubMiEosQ=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aabc91f cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=19cs_hUoupj01Z9TeD4A:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: khvRhbCDeNmt5gyRdL9U3QKvhk89qIHv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE1MiBTYWx0ZWRfX5Hnkgk7EkuHj
 5k1pzR55YE5R7uUX+5WIvmkyD2jZFb45dMePvPr/P/l19xh1WeVHBSN0QQqfY0HmHdHZFiaWZ/L
 zV9G1PvNqET8jVgFcKurc8rLeUNNnxvDvQK3YtUp+yZBt3eA210m2cqFi5dMGZ+zOmQuyhoOW9q
 +YRi2oKgpvlv23Y0wChivmOTFK9BbZ5uyGB9DO4R/mTohemQse/iprdLOYynXRS1yWtKImwLmy2
 /aqk2SKEjR5CEhW5l1/vrRBL6yhBF5YKg0nn5/2sh24+Hg9pFSlxVwAe2QMfNfw5KVce5aWpAn8
 HlWXMdZ4sHe/0LXlbLGFnujrUXUQ4r8npELTVYTEBK26RPc2uNUk4n7K4HQlKRBbFI/wIgU7xjF
 cqoGTjL1uXa469zvZWOMemJ8AcKsqc2sp6hi4+Y0+VUUnSsH7H/CyMRyGGbLN4LIekMGai1KPU5
 Ba+ePrR3j1cxeUN9iFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170152

Add qcom,maili-qmp-gen3x2-pcie-phy and qcom,maili-qmp-gen4x1-pcie-phy
compatible strings for the Maili SoC PCIe QMP PHY.

Maili reuses the Hawi QMP PCIe PHY hardware, so the compatibles use
the two-item fallback format with Hawi as the fallback:

  qcom,maili-qmp-gen3x2-pcie-phy -> qcom,hawi-qmp-gen3x2-pcie-phy
  qcom,maili-qmp-gen4x1-pcie-phy -> qcom,hawi-qmp-gen4x1-pcie-phy

Since the allOf conditions use 'contains:' to match against the
compatible array, and Maili nodes always carry the Hawi fallback
string as the second compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
Changes in V4:
Rebasing the gerrit on to the latest linux-next.
V3 patch link: https://lore.kernel.org/all/20260903-vdev_next-20260902_new_post-v3-1-108223cbcc10@oss.qualcomm.com/

Changes in V3:
- Adding the falling back relationship between Maili and Hawi as per comments from
  Jingyi and Krzysztof.
V2 patch link: https://lore.kernel.org/all/20260831-vdev_phy_next-20260828-v2-1-08fe5dcd4b86@oss.qualcomm.com/

Changes in V2:
- Rebases to the latest code.
- PCIe controller dt-bindings: pci: qcom,hawi-pcie: Add Maili PCIe compatible
  change is already merged, so dropping change
V1 patch link: https://lore.kernel.org/all/e5516c61-44ea-4224-9da2-1694eac10fec@oss.qualcomm.com/
---

---
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 93 ++++++++++++----------
 1 file changed, 51 insertions(+), 42 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index d54202f6a897deaccfca20b5975ba93ed363296a..c0a3e1f160ad4fc65333f02a126a3d924d2b4474 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -15,48 +15,57 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,eliza-qmp-gen3x1-pcie-phy
-      - qcom,eliza-qmp-gen3x2-pcie-phy
-      - qcom,glymur-qmp-gen4x2-pcie-phy
-      - qcom,glymur-qmp-gen5x4-pcie-phy
-      - qcom,hawi-qmp-gen3x2-pcie-phy
-      - qcom,hawi-qmp-gen4x1-pcie-phy
-      - qcom,kaanapali-qmp-gen3x2-pcie-phy
-      - qcom,qcs615-qmp-gen3x1-pcie-phy
-      - qcom,qcs8300-qmp-gen4x2-pcie-phy
-      - qcom,sa8775p-qmp-gen4x2-pcie-phy
-      - qcom,sa8775p-qmp-gen4x4-pcie-phy
-      - qcom,sar2130p-qmp-gen3x2-pcie-phy
-      - qcom,sc8180x-qmp-pcie-phy
-      - qcom,sc8280xp-qmp-gen3x1-pcie-phy
-      - qcom,sc8280xp-qmp-gen3x2-pcie-phy
-      - qcom,sc8280xp-qmp-gen3x4-pcie-phy
-      - qcom,sdm845-qhp-pcie-phy
-      - qcom,sdm845-qmp-pcie-phy
-      - qcom,sdx55-qmp-pcie-phy
-      - qcom,sdx65-qmp-gen4x2-pcie-phy
-      - qcom,shikra-qmp-gen2x1-pcie-phy
-      - qcom,sm8150-qmp-gen3x1-pcie-phy
-      - qcom,sm8150-qmp-gen3x2-pcie-phy
-      - qcom,sm8250-qmp-gen3x1-pcie-phy
-      - qcom,sm8250-qmp-gen3x2-pcie-phy
-      - qcom,sm8250-qmp-modem-pcie-phy
-      - qcom,sm8350-qmp-gen3x1-pcie-phy
-      - qcom,sm8350-qmp-gen3x2-pcie-phy
-      - qcom,sm8450-qmp-gen3x1-pcie-phy
-      - qcom,sm8450-qmp-gen4x2-pcie-phy
-      - qcom,sm8475-qmp-gen3x1-pcie-phy
-      - qcom,sm8550-qmp-gen3x2-pcie-phy
-      - qcom,sm8550-qmp-gen4x2-pcie-phy
-      - qcom,sm8650-qmp-gen3x2-pcie-phy
-      - qcom,sm8650-qmp-gen4x2-pcie-phy
-      - qcom,sm8750-qmp-gen3x2-pcie-phy
-      - qcom,x1e80100-qmp-gen3x2-pcie-phy
-      - qcom,x1e80100-qmp-gen4x2-pcie-phy
-      - qcom,x1e80100-qmp-gen4x4-pcie-phy
-      - qcom,x1e80100-qmp-gen4x8-pcie-phy
-      - qcom,x1p42100-qmp-gen4x4-pcie-phy
+    oneOf:
+      - items:
+          - enum:
+              - qcom,maili-qmp-gen3x2-pcie-phy
+          - const: qcom,hawi-qmp-gen3x2-pcie-phy
+      - items:
+          - enum:
+              - qcom,maili-qmp-gen4x1-pcie-phy
+          - const: qcom,hawi-qmp-gen4x1-pcie-phy
+      - enum:
+          - qcom,eliza-qmp-gen3x1-pcie-phy
+          - qcom,eliza-qmp-gen3x2-pcie-phy
+          - qcom,glymur-qmp-gen4x2-pcie-phy
+          - qcom,glymur-qmp-gen5x4-pcie-phy
+          - qcom,hawi-qmp-gen3x2-pcie-phy
+          - qcom,hawi-qmp-gen4x1-pcie-phy
+          - qcom,kaanapali-qmp-gen3x2-pcie-phy
+          - qcom,qcs615-qmp-gen3x1-pcie-phy
+          - qcom,qcs8300-qmp-gen4x2-pcie-phy
+          - qcom,sa8775p-qmp-gen4x2-pcie-phy
+          - qcom,sa8775p-qmp-gen4x4-pcie-phy
+          - qcom,sar2130p-qmp-gen3x2-pcie-phy
+          - qcom,sc8180x-qmp-pcie-phy
+          - qcom,sc8280xp-qmp-gen3x1-pcie-phy
+          - qcom,sc8280xp-qmp-gen3x2-pcie-phy
+          - qcom,sc8280xp-qmp-gen3x4-pcie-phy
+          - qcom,sdm845-qhp-pcie-phy
+          - qcom,sdm845-qmp-pcie-phy
+          - qcom,sdx55-qmp-pcie-phy
+          - qcom,sdx65-qmp-gen4x2-pcie-phy
+          - qcom,shikra-qmp-gen2x1-pcie-phy
+          - qcom,sm8150-qmp-gen3x1-pcie-phy
+          - qcom,sm8150-qmp-gen3x2-pcie-phy
+          - qcom,sm8250-qmp-gen3x1-pcie-phy
+          - qcom,sm8250-qmp-gen3x2-pcie-phy
+          - qcom,sm8250-qmp-modem-pcie-phy
+          - qcom,sm8350-qmp-gen3x1-pcie-phy
+          - qcom,sm8350-qmp-gen3x2-pcie-phy
+          - qcom,sm8450-qmp-gen3x1-pcie-phy
+          - qcom,sm8450-qmp-gen4x2-pcie-phy
+          - qcom,sm8475-qmp-gen3x1-pcie-phy
+          - qcom,sm8550-qmp-gen3x2-pcie-phy
+          - qcom,sm8550-qmp-gen4x2-pcie-phy
+          - qcom,sm8650-qmp-gen3x2-pcie-phy
+          - qcom,sm8650-qmp-gen4x2-pcie-phy
+          - qcom,sm8750-qmp-gen3x2-pcie-phy
+          - qcom,x1e80100-qmp-gen3x2-pcie-phy
+          - qcom,x1e80100-qmp-gen4x2-pcie-phy
+          - qcom,x1e80100-qmp-gen4x4-pcie-phy
+          - qcom,x1e80100-qmp-gen4x8-pcie-phy
+          - qcom,x1p42100-qmp-gen4x4-pcie-phy
 
   reg:
     minItems: 1

---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260917-vdev_next-20260916_dt-8b0c37990e5c

Best regards,
-- 
Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

