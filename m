Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E82335575
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 08:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141865; cv=none; b=i4Avv3eZN7sAwFiyqDwmvXnhG6K+lrynnCihfln8A2KiKFQ+NdRCy2/5lNCLrA3vq8ESMkcvIIfFXoWPamMPFHD5S0yxocuHBZCvweZjUheCWlZ82x72T4qjzQ3btYNO+586JXnJhL1e4DatqBImypPO5OvppYL9v9wz+zoRl+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141865; c=relaxed/simple;
	bh=i7BTahcjkzfQmr5e1JVqSXz+53oeEoy0G0dcvxeMRtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rP/dTTGqVboZTN3F/WJnvnTLDm5ByWEWbrN5gt8dxQJBDHy0d/Kqxs6AxW1t2fRVro7G//viOaRRGvkXcJHdDYsdocW5SQO5h9t40V3OlkcacGBYhdHlvFob8F2aguXFdRlrP6jBiKgJ4Sf3jIbOqJ8Qe8TzMRJjy5oEonnt+Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZtURrkS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ur++1pVW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZtURrkS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ur++1pVW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R8geZs3420990
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 08:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a4tQ7E1TjGuE566ghgtKg/
	TnpDcVjNblZGoADuY3Bls=; b=WZtURrkSxXgdLS+JrToE0pnHYAJifIlgcgSd96
	ZsKEwOPms8BCYcejZEi1DMic7BECeUlvtVOXABim2mjwFhW4UzcgVaKZm0P+UU6R
	Ytt4rvFSV2I3PE0Zt/hYElMw0bUwsNOS5/p73W57eOmwXEu2x7rCemBiLpcADIdq
	vcHmRIi4s/2ivy2WXaK2EVlR3BILYL0Yi+uBPXpKi0bEiQh+yqkZ768/ACWCV0GW
	rEuP9kWx4oZv3HCT0TxxskqFv/mU256Rwhhiub2X3hsAXP4xefVvGx1maY+vrthw
	HG6F2eSUoAiDUHm/munMZphoW1KxWs68IQmr6nI37ujzuvZA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm575kd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 08:44:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d001671a54so7769115ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 01:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785141862; x=1785746662; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a4tQ7E1TjGuE566ghgtKg/TnpDcVjNblZGoADuY3Bls=;
        b=Ur++1pVWRJqBJdyrs+J3EHfDPOXQx9kszHGKDMMOR49kATmxthWlgbvNVJDLH309gI
         OY+51N9ooLIS4r9wuWMWKDECe9CKdc5HABQ1g/e8jrpxp8Cn1Z6Z6pxbRoVfKjRPtFS1
         aSQAFNQYzRTdIhLVhrDXwO+3g91pYk69nqAMjYHBk1C4ZnS9jzYaVIpUv2NtuNM3xkWd
         iUq84VGvvx3d9ds/zZSItVhLshMGnFVyLPTGzjxnk2QpmqrkR1ciXJtrpJPwxdoyffmn
         1lHXxz9yBUFLbep5i8XRcMJO0N8RTrGEy8k20EwTJxmaWp4JKJN+9np+5fcJL6OOZQ7r
         9bcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785141862; x=1785746662;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=a4tQ7E1TjGuE566ghgtKg/TnpDcVjNblZGoADuY3Bls=;
        b=Owrksr/WYn3TR1vXKsUSFt4nqRyUlesFq//0uqqPFBHa46wcJ+HjV7et+myDmimMi9
         3r+ITW1KFy2zl6njy+sd0qnh8yDddTUG4hyLP6bQoYhHQ0S8vpFkDr491BMke6qqTLxX
         VTRNbGuFkyUmHF7C+G7TLViDQt/qhNn3ujRBFlIZYCWhKdrWiERwXNUOX2QM6geUb4kA
         HSdH8rQ4acZXwc32rDmXYdcp+0U3awH+fDdDUh3rlXSEzVXuKqZWOk1KO450beRFw/QK
         uxEl1Qsp3dMuSJ+3DuvwdOO0Omgy3oczw3oLADAzv2VJ7FusROY57IS2BgeeqjGr6VZS
         WWmQ==
X-Gm-Message-State: AOJu0YxzkvdG7NGbdrZj69LhrSFXTECrHPsYkW2FmMhm4p0+vyPWnn30
	xYv8WZlJS5ctxNJCs9W59GVlvjrWo+j+BjWtd7dUz9fQPEsUa9qJCvVfV0RAlTTHtvSRdPKsOFJ
	GIHKh93r7+3/WpOHprwvgEz+EXra+DH9UchMzK2YLqavfhpT26JC/jAJq8m9+6NMHxaIDPDwgZm
	gl
X-Gm-Gg: AR+sD12J3x93TRyI1QzcPcYlVVDMD1NEiTAw8EpmCSu6LgAjzTHpx7pbmYtI8QYTftr
	7Ba4LaEyWYm+eHhhCFv1yuuV7DhrVo3NBPfR7yoiz72pIcVj/1sH4O/yzCSvBpSy8Z8Xx4TkPnD
	ZI7CcEekfqp2V04c6dlzDvRZuCRT9vfIvmBb37c5QSjM3ASv1RHiTTlcbjtXteK/CTRuxpc8oD+
	vvHjMh7ykydWgn8IuEPCQ95+Hhb3Ey7kIkpzlvMPkVf+20ZSOHgoKOiqDezJXVqww7rVcrpudj4
	y3Qv1NYgbYT0+dsRJYCyuhWuzExjM6TIonFEy99g8M8eqB39eDgToTlolSDEqgLNga7y+7HOHDa
	QOP0owVpyZSb1eRZGj2GE8D23PCK5iKEh/JKA9At+7lmYzp1wi+lhVuv8XMN3z80iP5QrbAgsRu
	cEVtnTpTqNwUFft3YYh3QJDgmM+AMER1oz7e8=
X-Received: by 2002:a17:902:c401:b0:2cf:b066:7de2 with SMTP id d9443c01a7336-2cfde865c3emr71882495ad.22.1785141862213;
        Mon, 27 Jul 2026 01:44:22 -0700 (PDT)
X-Received: by 2002:a17:902:c401:b0:2cf:b066:7de2 with SMTP id d9443c01a7336-2cfde865c3emr71882295ad.22.1785141861788;
        Mon, 27 Jul 2026 01:44:21 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc548efesm30779643eec.14.2026.07.27.01.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:44:20 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 14:14:12 +0530
Subject: [PATCH RESEND] dt-bindings: mfd: qcom,tcsr: Document the IPQ9650
 TCSR block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-ipq9650_tcsr_binding-v1-1-931ac0e056d0@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA4NSBTYWx0ZWRfX8C3W+tZYn965
 e3Ng1x/1kgtQHG3tF2h69Xt8BCp7mN8UUXaAGifv6prqzwFnOAiiR8TNuqGn6rGeAcVKm/aNF87
 zVVX5x7yG/Mta4v6db29V/3wtT8jlfk=
X-Proofpoint-GUID: BqWoyd2MUnIKYQtVDX73fJBEiYiZNyJt
X-Authority-Analysis: v=2.4 cv=FOErAeos c=1 sm=1 tr=0 ts=6a671a67 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ifDjX6ND25ec3OlZEW0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: BqWoyd2MUnIKYQtVDX73fJBEiYiZNyJt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA4NSBTYWx0ZWRfX7SRvtthuXx2p
 j/APNjunFrIcoHd/2Ej8Co7ImSMlFkSStvajXXX20gMhvMu1fzFvc1mwydK4qEX3Q/AH2vzjoyr
 GhGBWLaMyOmwFbLBLxBn+IYiaxkZPA5gYXjnOPrmiuu7ZhAVdyvAELvg4nE7qjirCITOLe5wc3P
 sI9m647XQlh80kwz7LksFwbQUztlbi4t2ONd840GQUrXZNMRnO7GQ16JChw6rsxbEVVl4t3GO1S
 LwKR7CV5Opi7Bk+Uin2QxJZVAWjdqIXjpdq0JY9XPJ7DdHISe/RB7jvXRAkgWQHVpoLbqoiVQ2I
 t2ti80RsRrA7BTFTJdrnRWkiCzclx5k1SuaWiwLm2Nxv39ibV2CDhDKNOMq1UHYqQfLh6Mif2wI
 GqwuaGShsafbmx7GEFRz2v4TDZpt4k6hRkaoahW+rCAOTe0va9oFP11i43f6cCxWJL16vnBaZqt
 AaaTOnbPTuA0/BXRIHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270085

Document the TCSR block found on the Qualcomm's IPQ9650 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 14ae3f00ef7e..8914c882fc35 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -48,6 +48,7 @@ properties:
           - qcom,tcsr-ipq8064
           - qcom,tcsr-ipq8074
           - qcom,tcsr-ipq9574
+          - qcom,tcsr-ipq9650
           - qcom,tcsr-mdm9615
           - qcom,tcsr-msm8226
           - qcom,tcsr-msm8660

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260511-ipq9650_tcsr_binding-70d665950fdf

Best regards,
--
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

