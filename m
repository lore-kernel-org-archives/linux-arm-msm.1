Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C920D432E97
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 18:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785176974; cv=none; b=UasTmVnV132XrDcdxyyUgAH33QEJuvyXXU2/bNwL+H5JR7d/RZOzITrXBWSVV2rrjUSSeHvgPtcBrSLJ3U14goX5ZXjVYKrAnvPz2E3p+OXCjvajwURAOsb8rzwma4jbkJgJMWKKHlK6Od/C6BebHI2Ews8+kAz2VVIJAAFD89w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785176974; c=relaxed/simple;
	bh=0TMQsD8HdtxtrloI4SS2ZbE/Q6kNWOy27N0zCHKXDDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k8YuVFs/Dd3dG4BQFzmslumNlZhW8dX8JR9zdDdt010lzSh9lI4XItDOyWUmMknMR9pmzFKNninn2iSYGVr5m2yKyX1T6uiqHhZbqyXID4bs3VXtle1BXPsdf0O2wWBqctn614656+mRBLHhWCFzOQ4DX7n6AArtAOlbtLOziQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dhC447lT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zr2PFlrR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dhC447lT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zr2PFlrR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RIC1jb4028793
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 18:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iu6qBkEAtXGL2JpseAyS6osyszuia6QPp7utfQoubVw=; b=dhC447lTIW/OYwAg
	8BWUwYu+N5LTrwQQPvwm6tS/SXekFy/9z0V5DA1okIhqAY0Qp9TEDwUuKDA/uYNd
	bStUaU7tvMzW7NGlALrxgKq0uK8cOI2rWuY3Gst1zPc4UXEKZ7bDmUUp7P3EHNel
	YDMes8+W/agipBkuHbUJN+LaswY3n+yTfKr8zeeV2TXBPm0DmewUkmIDfRyxcrHd
	Fzd9RvF7ZqEDAhfVqQLem4GJukMmKOTuF7KccZlirS1huFEfU+eF6H+vQ1T3lW5e
	re7e3dlfo00pNYRbXMJ6ID3jEI0sW1AsiRX6E1u+Lin3//FRGzgFgW/z/VnM0RRQ
	xGhzcQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4v6aatn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 18:29:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so2166428a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 11:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785176971; x=1785781771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iu6qBkEAtXGL2JpseAyS6osyszuia6QPp7utfQoubVw=;
        b=Zr2PFlrRadwk/qCfHVKxwvGR3XmmigccNjHeSZEjeIcxz2mnuFCpQD8KiyXwqBoBhI
         Uptk4+xeLeWcv/oZSE79c3jFmdL0xJ8qRB287R8fVUY2dI19oIyNdiZlJh6o7Qw1d9uo
         BxQj0hVSQEXpKcQs5SlpY+JKVL09zrfJMv7Gm5IwB7srTvz0lpJbPBNquoZsh/NHWZHH
         6ICuUm2Q8mDjD6MHhQ5huEoMEVjRZx6Ze8kYzssipEH6uDko8H9+4QYaAZ3m/Q7NP6cO
         +bixuMc2Hv3SD7jOGp5/qTIDWEKXgSuxh9XfEaJorg1aMTFhR8VWZTQswjNpP+Pvoqdb
         91Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785176971; x=1785781771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iu6qBkEAtXGL2JpseAyS6osyszuia6QPp7utfQoubVw=;
        b=TH+c+SUvgoh38Wtx6KBXNog9OQGlnIXNVENkoSMImvTjQ+zP5XzK5q4V1vOPbjUhPd
         pVx0mrg5WsMmTvNoVpkIopR7BgV9fs//Jxt7XBVwhVqjQK61Rv7QhG5LmMfkAU/sAM0+
         9D0sJQ7UoXHLQSdg/1mpmfAO9ELtTfAnlQYBd4AjsgVI5y+cxZH8ZXB4blQN1NdvXtcu
         gYjCcbZUmqQF2f7Nwr5j2YJWsb7JT6jUntUhzNdSgMdG9ZS80TzTL9waOs7wGKxFMWIG
         xY+dhPPTpCEFC19jdLMiELY8zmIUSYtg1A3UHH8dTHxpID1ZTM2vAut0M01SfyP5vMkl
         4m4w==
X-Gm-Message-State: AOJu0YyZm1kS2Oqx2iNXkVickXJMQ7BAm7HCtkOwVFYr9vBA8Mp/2yZz
	SohmOe8Q2Pr5cOLrp2r7IgJX5/XXgwPFZQJJFQQ7zDn0zMjs6167VQPsrBo2/bJbPOI85IvuqnL
	rjRaB5oZDaHXQzx/diGUu1rI7a0+LpWuQ+ftYqytfcKYQExjXPmzLwEwXcXYDOUPPr4g+
X-Gm-Gg: AR+sD12+Q87bcU+hbVRa3ErbTVEZuWa5jEk8NJeXuq+xFthajp/jmcyyln8K33edHAa
	mBIwanPpi+BELJ0QpLXF+4BvN0nJeJHKOlHcI7ch/BlL/OI1vMfxv+mpBxHq/oBb7rYOydNYh6W
	wGQkHwuxkstyyPx9p4SoEGFoPACf9aPaJhOFrkyvh50buz8KpwKKq1scmFPX4mv2+PfxkcAI+o7
	niM4a6C/9d/aLdogk/+WHa+PunhD/SzaS3zcp1o0bTiqIposJsVFMrZVOJ0xAPxybENS+FyQDbs
	GO9WZ+p4LX///eMqeuLLBBYu0YYAS+a+VzbDTinmkmTcdw/JOiYAwNq1typWTGYoOzIN8T4FhWw
	7B7iPn+pDnSzBgXrSRwn75zVYES9LD8A=
X-Received: by 2002:a05:6a21:6b02:b0:3c3:954d:279a with SMTP id adf61e73a8af0-3c67daecd2bmr9207870637.33.1785176971523;
        Mon, 27 Jul 2026 11:29:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b02:b0:3c3:954d:279a with SMTP id adf61e73a8af0-3c67daecd2bmr9207842637.33.1785176971126;
        Mon, 27 Jul 2026 11:29:31 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a04b2sm31963087eec.28.2026.07.27.11.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:29:30 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 23:59:09 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add Maili camera clock
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-maili_camcc-v1-1-01dbd7ddb276@oss.qualcomm.com>
References: <20260727-maili_camcc-v1-0-01dbd7ddb276@oss.qualcomm.com>
In-Reply-To: <20260727-maili_camcc-v1-0-01dbd7ddb276@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE3MCBTYWx0ZWRfXziD91efFhEUl
 uNn/QMV9xlM0gVGMBGvB94Xf/YpZ7hTmmoluFcWeQS1dsZVrXFDMru0hTtX6S3xwVSlfqbCldls
 WfzEQkKLuqWW4wNwUlOC9nxA5V3zPk8=
X-Proofpoint-GUID: L7CNOkuAaxUco36lWQgJ4B-hDwfiXU9W
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a67a38c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=itb3sOZw9SQNzPTiAAwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: L7CNOkuAaxUco36lWQgJ4B-hDwfiXU9W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE3MCBTYWx0ZWRfX/LjKhZKn1uhU
 EuL27J7WSKpYTqcuN9vvnCaSaRphAmrWwchhaJQdzrkL/PU7LY2hhO+2lMDpYdojfwMa8+taz6f
 Sn6pcCnVshFIsb4vP1ttpMHG+AvenpAgn8eT4v5N3z7EIFwk8GGBwTzPLCf3hmChuphmdjso2x/
 pC+FRoW4jjU5PD6AfN73rAs+qanZP+i/UBrVrFAYMGf8RpPbjHnHab/ABKbSFtxkTaarB5MO6KA
 i5jlqwvwa0yQ7rH6QCnnfBgvUPCO29/DhFgaHY66rcmhy5h+EqwdrNmsyngo/af1CJjXydg8Gk1
 iLX4edE0C3C3njmaI/5JGUzaKp1EmfPwzMqhCx1mrxjBoq8vczIZT6k9KNtQB3a6npexqUeveTQ
 /tmKHhxP+dnU3X7D3k3+JolLFNphwekTRiOMMeU1/6ME44Pn3pwgSaeV15+vSgiIBc1X3KzNx/z
 nJEJV70ljArtNL1cHIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270170

Maili camcc is a derivative of Hawi camcc with minor changes, and
hence reuses the Hawi camcc driver. Maili cambistmclkcc is the same
as Kaanapali cambistmclkcc and falls back to it. Add the compatibles
for the camera clock controllers on the Qualcomm Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index cdc19418c06471ea8f3233e96c0169fb8b590942..4b961226a2d1a1fecaa0bbda004974f4a1e9592f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,hawi-camcc
           - qcom,kaanapali-cambistmclkcc
           - qcom,kaanapali-camcc
+          - qcom,maili-camcc
           - qcom,sm8450-camcc
           - qcom,sm8475-camcc
           - qcom,sm8550-camcc
@@ -41,6 +42,7 @@ properties:
       - items:
           - enum:
               - qcom,hawi-cambistmclkcc
+              - qcom,maili-cambistmclkcc
           - const: qcom,kaanapali-cambistmclkcc
 
   clocks:

-- 
2.34.1

