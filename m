Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0543DDDA1
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 13:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367038; cv=none; b=TTFau9NftG6rVJc97uu1Czg+lordruH8uAK1uQmrdctUtTF0RRsnqUgqV0u5dmOIOAC0jqPoTwnaCgJvda4lJ5BCKZVk99mFFfKdvc7YnV7PfQwxrTMW5VLcEV2+UsmXX0kXrictjjjrDgqt4Ir2ETyyCmENrAJCnOnzqnpJCGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367038; c=relaxed/simple;
	bh=GgOQlj+WKwIJYxC5QLRsUAoKnwyhA7Z5y8FiJwAXdKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ngnGV2Hy32Q0xJ2vzm/xmryQWS1DUjuuG4A/HsmgaU4QcZCBKgOmqlYD+vw3RtArYkrx3dJjT6fd6QIQbZ59pTfHjoqCqBN2u7uz8wDgv7GBfHholXuAH+MIuijC5znQ5nX/fgH6mYgmzBBohix/BDYBrc1GkJV1BH0OuF8iLqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zc+/Lh+4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fQNwP1Dp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zc+/Lh+4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fQNwP1Dp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACivqR914555
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 13:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zKz+4lotkXy05Ym8t/zKtYdqypdd3WV7+4QMu+Fg/1M=; b=Zc+/Lh+4Y1HdzZnp
	IYEoSGRGSIJEweHTORSqCL6PX1HdiqJBuYkkSKu1RlXbIRdzToChFwtcD9p1NJw7
	C6P/weUrX/4j7Tl6ZeN6P793UM5zkvx6cTrs3ARbZO7Ec/kBHKykes3m2yzbq+fJ
	2JmfKNqBuJ67JN1SBFulBihx8e4ahxyyvfyRBVDndCs1wLQN47VcfWcrWT1L9tYZ
	X4G3G7AzORzr7c5xq72kWF5GNh2bE/Yr5TqxJYDwEXgLK1bgkArL5j5VeFyLTIm1
	ktM/AI4oEtc5vBpOGMcGwczXJ+WCKUAdMEoEW+P7P9T7AhxhoWw9vzOxyAepK1Yr
	jStmBw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v91jye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 13:03:52 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6ae41d34275so1726995eaf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 06:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786367032; x=1786971832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zKz+4lotkXy05Ym8t/zKtYdqypdd3WV7+4QMu+Fg/1M=;
        b=fQNwP1DpB700jxVdEYjSWnT/fEGivUpRZeKMq6FdWUdnRuXhRfn/ml/WS+xrZ2h7ai
         7xasPoKyRxiY/QsqZS/1a+wWliiJ3OMYHiAIabaoI0WNpa1tEgFAC1RIy0dRI4fKNfKA
         nrn3Xm0H3g1vXxl/rnXr2/VqxRuUOJMM8VXYVdH/Q0iHhl/2H3EHAiLI5YyM39KHcu++
         FzOay7ZABE1DHheKRPMzB+uwQqXqK3dmdgjFc4CNRxRTocPxYLdn34zY0uFuOn8fIMBs
         qsQhw+SwsMEINkDv/MOEHwzp3smY2F12qYoaXWPNMjxxBGOa2JFUToh5YIeK6UUf1hJA
         mbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367032; x=1786971832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zKz+4lotkXy05Ym8t/zKtYdqypdd3WV7+4QMu+Fg/1M=;
        b=tUqmNomT2WokijMhn+5TleBNeMYoKOmNGRMRgQauTObo4XfG8Dzprb0gP8N6liXzWy
         5aklu9bp9A/KE9hIkDq2Q++TMHOjTTnm52nFIvsqtgYJ95/URF3mxb5gf+hreEoAZcET
         rpGELR8CtRLstDx6CGmCysyOjGuL8Xju4ULCik/1UNoky5vHI50zUxvliMupTWyba/SB
         13DtXuTQPB48nrMN5QUFLLsS6fPQS8cB09XmB4czl2FVGLtcfE5N9NGASCe1VoR7g08x
         AaZdnXejAt8skBJz3RJB/BFfDwtWZhr3h4O56FxZtmASn6K9/Cr1IAsQLdbTlG9PnqQT
         qPww==
X-Forwarded-Encrypted: i=1; AHgh+Rqr0ePSo2OB+Rbl1HLZdbo0yAmSf8Hgbf27bLfgR5LkN4dffBkEGQD1fmbcG6e3gGQ4wWnj/RON2lETIWvf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2QzQqnY7CVYh/pfXUk0ynaWRAo/XARBj2mr5NiOKIRiTCxSgy
	/l6F7wid4dTUwhLiBMN9pxabSGEQzvC6OO4CS95N7aCFx3AbbCC9FEUX0TGrkjACL6kYJVBKsYl
	M7j5gPAGCpzLMRT15jGq1HJKP678Tzl0q0uLDlm2Y+ByX1OgbZE8wV6dF0rAEovtZkzCl
X-Gm-Gg: AR+sD130avETfJn6qqtbMbrqvpXTC0RuL0bqxsNXrlE+06rwqFjMerJQiaKkpaS18KK
	lXdIx5Bdf8CXAIq0WCsn8/g6vmsfVQnRKTdrP8iKxkXlV3QUH0BiZqQK1sqKpguoRTiu55w5cXp
	+T9/0Kcpi/33tS1QtypGnPobBLkK78CMJv0M8Pl9UKnu7PTd/h4DySl3B5R/D9BhC0gkidePmWF
	2BgPJIQ6Jxdnen51K7CLP+r7QJOjRw3aUx3Fwg0xmhPV1dqAukXeWP98Cm4HwuYlZY3UVLPXTxi
	8Upy3JI2HQ2PfboP+ATS5/HodVTnkUVeRoHAtZxorT5GH8VVgyUJliLxdWY2G8NfNfSowuYhml3
	xpGFZ0YJ9TdgsvR4Nc6lLCxuE8kfH6CykZPFw1FKmKZuJEd+9Gi2DDD6cYgOvpgzt
X-Received: by 2002:a05:6820:81d5:b0:6a1:7dcb:b9fc with SMTP id 006d021491bc7-6ae9706e2fcmr24024793eaf.34.1786367031522;
        Mon, 10 Aug 2026 06:03:51 -0700 (PDT)
X-Received: by 2002:a05:6820:81d5:b0:6a1:7dcb:b9fc with SMTP id 006d021491bc7-6ae9706e2fcmr24024746eaf.34.1786367031114;
        Mon, 10 Aug 2026 06:03:51 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-459f1a9e431sm8218971fac.6.2026.08.10.06.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 06:03:50 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 06:03:27 -0700
Subject: [PATCH v2 1/4] dt-bindings: arm: qcom: Add Glymur QCB
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-glymur-qcb-v2-1-9e6ea7987b9e@oss.qualcomm.com>
References: <20260810-glymur-qcb-v2-0-9e6ea7987b9e@oss.qualcomm.com>
In-Reply-To: <20260810-glymur-qcb-v2-0-9e6ea7987b9e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786367028; l=892;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=GgOQlj+WKwIJYxC5QLRsUAoKnwyhA7Z5y8FiJwAXdKU=;
 b=527OJ0anRFOB7EI38tttp+60hzk7X8ROaXuVfSiUsGY+RZDWLjhE5on1I8v1/Zv2jOaoQdKYF
 difqJRERvBKDGbrSVQ7/4wpbE5CnIRL+O8jpZQMGKEyekBf/pTWiSe6
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDExMiBTYWx0ZWRfX3YuthHn/IbX5
 Sn2HhhnamVt7btEnjae31Gzse1XHImehS6dRf03bTaqc3JDRTSjJtDrbVKEgALoZIcJZ8osPZrA
 y68eVbEK7mZaMM5QJhVk4gDaMbPrT54=
X-Proofpoint-ORIG-GUID: X_8C7Dz0_rFMsW7i7f1BCVM5fSJfbVYa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDExMiBTYWx0ZWRfX0IuievcGgpOi
 qysy0TSZV0XpkUZOJcqk8e7HzKK+Plw1xqenKc9OAUYEnGqfE9OE/OWHYlm1Yfc6Lwqd2cXpI1m
 ByZ2FZsnZCkSQX50dDH29lGZUqiguZgyWhtbFQ19Ot+TttLRvaYccymMiCs4wn9dYTR8Epo1Frb
 Nzz1vrtx8N4GVpuRHgCfMcczd/hbgZ7TfAeWMcASFjXQ/4m0OikBraOUW9ESOm6eOKkyhUbVsZu
 n42SpmnHcCo0UrcMcFbxiO9Pcw+XPL6ig0J0iLPpVG8ox/iVljhctmnq8Cp3AJhWCyW+QyuCSLb
 UEhd1UGk6Fk3dMgLzA7z1Hj8XV0CFrYoVEyR1dAVz53LdXudU73oOUjSD3fUXMo032vqXuVoXtn
 0rUg/o1/cTEnT249M6LTxIMdNdt/w529xFHhneA/i2DUCP9NWPFeqRQ/0H8bw5clYMQ2tNTygu5
 xYjHCZDp0i+S1P5rdog==
X-Authority-Analysis: v=2.4 cv=T5m8ifKQ c=1 sm=1 tr=0 ts=6a79cc38 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Q3Bq8DPiCDqF4iPHc2QA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: X_8C7Dz0_rFMsW7i7f1BCVM5fSJfbVYa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100112

Document the Glymur QCB (Qualcomm Compute Board) board id, an open
form-factor Glymur board intended for compute bring-up and power/signal
measurement.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..68f4a3b18afd 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -88,6 +88,7 @@ properties:
           - enum:
               - asus,zenbook-a16-ux3607oa
               - qcom,glymur-crd
+              - qcom,glymur-qcb
           - const: qcom,glymur
 
       - items:

-- 
2.34.1

