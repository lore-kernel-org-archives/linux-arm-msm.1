Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200876;
	b=b3hyZltm/dwlqTczm2j+FxkZhCTn5FoYc3po8p/eRdwhsJFwpeuwKNLvFgkbQ+IEDWLh
	 2jytZmQ/28ih3hb6iJ7TRzSrlAK1JQrCZ/Rbo9RihJXRazOsEp2KDE8JymZuQytaImRVS
	 gMvfft1Ip9V082y3orQ4l+XS+tjxAeggRT7m3wELjDDHRgUkOKlGTWqLn+VKcn5Kc18rP
	 20vNRJrEpny5SRoU7AgHxrhalqa0Jc9xA0QhHjXLtrCDIeVwzUFQky6K2ymO6UYAt3Zdx
	 DoALNy5gk5zDNE8V1faPhExbqSTgSJ7U/UQ1kGOgPxuFI/HnQe7QweBI/zq65BFLv4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200876;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kYdDAFjJ3rtD6rABIEt1brTcYxqjkGmeij3k53H3y4Q=;
	b=Ot72H0BdhgK0uO4kjc00ze26GvyVytB9xBMnSpNK16E+6+bAwCc0zCVOKBNyM2iOnhLL
	 gaBbqmECSj/kTlByc9z91m7GYjb1siLYs4967am5CE13/Gz5MzcuP8Ob2q/qBs8WQBeR7
	 2tt/ULkn5IH8Yi3JSTLSQevk5NjOSCWN4AFd+CukbxZMg6v4aHYBYCSORRociB/a0ZExu
	 X7A0ScoTFEu/lzGbe4pJRu+ALwzXKgTpOye28Tw5/g2gdKECA+H8Of4LtAcuUHftmLj9r
	 gQmdDLUeNALiEHnlMnGh+lvjrDzr1/6rqo725FRyNCKQENNlZ3PQxjEfgoAsAJvyueg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hbCWKkgI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="E/eGJqrX";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53937606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53937606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hbCWKkgI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E/eGJqrX
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFADLZ2001642
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kYdDAFjJ3rtD6rABIEt1brTcYxqjkGmeij3k53H3y4Q=; b=hbCWKkgIyCBe6kIB
	wz9VIc5gT28d3hCzrZyWOedvl3qX4ZzPKUHadrYGAU/mhddLcasYGzTZqXsCsRf1
	ffL++ZrAAkUkT3AIvXTy60SU0wqYO3Uk3kZe8sGncRDz1WA+z8FgEoQBFetrobTy
	ubI21xt6eNtko4T9YAbhUh41pPYDC3ayJWB+1jyDx0HiX+44A06L1TN79CSpgBsW
	Lcfi1KO6qTT1WRRUDSMH7xJP+G/nVa/IXsds0YP9/eTfM8kaaf82N33Xc3e/v0/i
	b4m/7T0BqjeD+Sc3VS6OCyhVrZDAxSAScfbq0Cyj7FD5RMln/PiUQ9pfBSnyiR50
	nj8kaQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7sm45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:15 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-879b1d03d5fso19475757b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200875; x=1793805675; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYdDAFjJ3rtD6rABIEt1brTcYxqjkGmeij3k53H3y4Q=;
        b=E/eGJqrXwh/pDM5lK2zEAbqQCYoXMlRt2u2QhdNt4FRXzQGQg90eKlXwfPaAtOBjqy
         YYf+96BUTpVb8IdDWQYAy6Hp6/RNXVLwVjolj0yQghnjvZea9yDsFtSeLLTIbBE314bI
         LL9b8RQXH25OcnskghGh5ZRqavlrm8o0SIjnJpFIleN13kSwPZLKusAvai4P7WmxCyJI
         t8u3qI/3+tNeKDDvRV7pXusmFqvD7pVM8b/2wJ9fFtVXHG+H/5xA4PNqJD00rg/1lnMX
         3BQ0eCt3JqclejLtAfrIeXrknCgMaDTW9dJOaPtf6KBeHbUMkZEv/CEoWgaZxkU4HUg+
         eHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200875; x=1793805675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kYdDAFjJ3rtD6rABIEt1brTcYxqjkGmeij3k53H3y4Q=;
        b=bScSBl56SYjKm8tcb22+hIU9tw7G0GEVdimF+wp/v3Y0kOdz7bUcA1egqEu7lbR2Rj
         4okHFfDap/HneEr4QNB9ReKQbrl/0OgIPxh7uUg1se6kDVbsB9qj1JRd955ELDyiWfU6
         GVhvDoFYZMjdN+GU+wDM952MvrVf2StFynGYPuuD5rMKQnX2e7Abod1/i6840hkJ42rM
         2KkVwoXFGwRN/U8rG3wC4roTGDXSc3PqoN/gsyD6zuMLIQwnzladJnxt+lr+NldLHXJ7
         x6LHMn0E0AvJ1IwzP8YQ0fXWxviK6SHswryZIvzd3YmDqdDxxZWel8XuCLUwcStHAhEK
         cZFg==
X-Forwarded-Encrypted: i=1; AKwUvByH15IMUQN+K5HLUneX4KUKJRGp7yKRCKXRGZxMy+GZM7e3sei9KnCom/R5i8Xb6Hy1+7H+xONEd8haVoWf@vger.kernel.org
X-Gm-Message-State: AFq9FYIWuSt28BMlgAy/Jrvy4vlMRia9NfniGedN9ocSfaK+Xa1mFOPr
	bd35qEsqOFNvgf99C60LdDQvaqxsmJeMNzsDinz+IxyhSWEbLlf54HCvQOj3bIVEyVYHv+lHG+j
	gx1hEWRjwJd35/mE9N1641dAeLkGsTQ7A7/A7hECa/v2m0FlGuG9F+P5pC5iEIQHYIQoj
X-Gm-Gg: AYBFou2fRBWJbINqF8Pw+m1g6fzzT6FFjbrlLsPWTxzsWdSa8QMhB9lAG6b+5j5O6qZ
	JSV7x+E2N9BA1asHeR5BEEppKRDTHuP4wXVQGwfb0C9YGSC1AtS0EoP9inqfgP5fTaoMu5lX3Yp
	GbnVxEtsNIPK6hkRjM6ikWNZYRzkxlOwaQeRdJwQJbaloZ/C/QIMAqnbFmXFM8qnv7W+2juWA3t
	yR5v+qNRerZJaxlU2nFmfDNUtohmiAV0jPBYk1RLMUSryreWGPecgQxBSAZJS2i6hi9uIgrN3ve
	O/45GqbnPRlZoLR/Hwz/xvoRnKE/00LgcrhbDD/WXBD64m29nJ6cXF85sAQTVHRlqbwjdkOMRCK
	VbPSMMknEYP9BuwwG8D0V2YV4mNj8/z790mT8cWaaODFKqtc+Ej3VrBAnnRshjfuQ9JpL0t88hz
	qzNXFtDsrfTAZ5SNB8CNuyFrBH6fvfoSDeAXPyZWb6XCJX7cX5p+ZsY8JTDrJ6
X-Received: by 2002:a53:b890:0:b0:672:ef39:5fc6 with SMTP id 956f58d0204a3-67a7bd5995fmr1242792d50.147.1793200874481;
        Wed, 28 Oct 2026 08:21:14 -0700 (PDT)
X-Received: by 2002:a53:b890:0:b0:672:ef39:5fc6 with SMTP id 956f58d0204a3-67a7bd5995fmr1242777d50.147.1793200873776;
        Wed, 28 Oct 2026 08:21:13 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:13 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:39 -0700
Subject: [PATCH v23 05/15] media: dt-bindings: Add CAMSS device for
 Kaanapali
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
Message-Id: <20261028-kaanapali-camss-v23-5-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae212eb cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yzr0uxE_ijXmPgLYsrIA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: sqR1wUDVgvtyrClBsCXLnfonLYsuBtPJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX9kDIpxPO2Msi
 7csRD1N8g9cgOiSiL/f3Bg0f2QkiQA8yhdggZ7U01KSf0BHbDGSK2xY9k5LIDjIMe5uaHv6BXmn
 /+qmHPw4xv7hu8xheU9gX+3zrH5oICM=
X-Proofpoint-ORIG-GUID: sqR1wUDVgvtyrClBsCXLnfonLYsuBtPJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXxcmKiXe77Unb
 OT6oUWOuBojAyRry6nwtQqlktK9OqpqXbiivzoHAqvxwJ7PCAg2B4L7TcC4CThhhzAEy4QQXdyU
 3oyrZZoEXkee0g6Zr8ai4hqQKNqG79G4fWHP+GihnZP9YS009/4IRadZ48TYuJjBhZTCwxlmIUN
 X/l5ju53cww/B6GCZytnPYdSKX7TwYYalX/gFbVEvCdsFmqYBhDyy2O5ROAyXm82LW6r4/vruHZ
 pA3CCvVQjlmhl/sER3pccD3RrHnM3eyez+M3XI9dTwYBisX/VVljHKZZyHVnW6Cqh+lm50Je+0P
 rX0J3+mkjkERC2KvV4K/mb0Ci13LTHVatF5+yF+cSFTzCuothlnLbGQRkf9HS3kvtHtT/8UMNup
 ri2LIEhi0pljFqp05gYDbsV3zDsPk7Kfcz9J4neSTPk8ab0WkpImVST4fJtmh2OMfFHmLmVp6WN
 WQ+0bFMNpldsrAsVgpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Kaanapali
platform.

The Kaanapali platform provides:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../bindings/media/qcom,kaanapali-camss.yaml       | 306 +++++++++++++++++++++
 1 file changed, 306 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
new file mode 100644
index 000000000000..dec451fc940f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
@@ -0,0 +1,306 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
+
+maintainers:
+  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,kaanapali-camss
+
+  reg:
+    maxItems: 14
+
+  reg-names:
+    items:
+      - const: top
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csitpg0
+      - const: csitpg1
+      - const: csitpg2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  clocks:
+    maxItems: 23
+
+  clock-names:
+    items:
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: cpas_vfe0
+      - const: cpas_vfe1
+      - const: cpas_vfe2
+      - const: cpas_vfe_lite
+      - const: csid
+      - const: csid_csiphy_rx
+      - const: gcc_axi_hf
+      - const: gcc_axi_sf
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe2
+      - const: vfe2_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+      - const: qdss_debug_xo
+
+  interrupts:
+    maxItems: 10
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+
+  iommus:
+    items:
+      - description: S1 HLOS IFE non-protected stream
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Global Distributed Switch Controller for IFE0.
+      - description: IFE1 GDSC - Global Distributed Switch Controller for IFE1.
+      - description: IFE2 GDSC - Global Distributed Switch Controller for IFE2.
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: ife2
+      - const: top
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports. Each port receives the CSI data
+      decoded by the matching CSIPHY.
+
+    patternProperties:
+      "^port@[0-5]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data from CSIPHY 0-5.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - data-lanes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
+    #include <dt-bindings/clock/qcom,kaanapali-camcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@900b000 {
+            compatible = "qcom,kaanapali-camss";
+
+            reg = <0x0 0x0900b000 0x0 0x1000>,
+                  <0x0 0x09253000 0x0 0x5e80>,
+                  <0x0 0x09263000 0x0 0x5e80>,
+                  <0x0 0x09273000 0x0 0x5e80>,
+                  <0x0 0x092d3000 0x0 0x3880>,
+                  <0x0 0x092e7000 0x0 0x3880>,
+                  <0x0 0x093fd000 0x0 0x400>,
+                  <0x0 0x093fe000 0x0 0x400>,
+                  <0x0 0x093ff000 0x0 0x400>,
+                  <0x0 0x09151000 0x0 0x20000>,
+                  <0x0 0x09171000 0x0 0x20000>,
+                  <0x0 0x09191000 0x0 0x20000>,
+                  <0x0 0x092dc000 0x0 0x1300>,
+                  <0x0 0x092f0000 0x0 0x1300>;
+
+            reg-names = "top",
+                        "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "csitpg0",
+                        "csitpg1",
+                        "csitpg2",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite0",
+                        "vfe_lite1";
+
+            clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+                     <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+                     <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                     <&camcc CAM_CC_TFE_0_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TFE_1_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TFE_2_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+                     <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
+
+            clock-names = "camnoc_nrt_axi",
+                          "camnoc_rt_axi",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "cpas_vfe0",
+                          "cpas_vfe1",
+                          "cpas_vfe2",
+                          "cpas_vfe_lite",
+                          "csid",
+                          "csid_csiphy_rx",
+                          "gcc_axi_hf",
+                          "gcc_axi_sf",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe1",
+                          "vfe1_fast_ahb",
+                          "vfe2",
+                          "vfe2_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid",
+                          "qdss_debug_xo";
+
+            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
+
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "vfe0",
+                              "vfe1",
+                              "vfe2",
+                              "vfe_lite0",
+                              "vfe_lite1";
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc";
+
+            iommus = <&apps_smmu 0x1c00 0x00>;
+
+            power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
+                            <&camcc CAM_CC_TFE_1_GDSC>,
+                            <&camcc CAM_CC_TFE_2_GDSC>,
+                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "ife2",
+                                 "top";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    camss_csiphy0_ep: endpoint {
+                        data-lanes = <1 2 3 4>;
+                        remote-endpoint = <&csiphy0_out>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1

