Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0533DB626
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 06:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785910742; cv=none; b=s8maHOuEaf0fxqbofH6UwqaDImk8izqm5tKieY0wU6G3+iGdl7GhMl4sJRNHarRTMkK7NfmOkxi8Q+ieFGW/sR86tRn9gM07wEC9oa/r1+qTj0d3R7L0uAO+Xqh8fwPKiseE9iomCHcF5u0SlKf/8mWhCHYUJu3iT7GMKeRvrPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785910742; c=relaxed/simple;
	bh=Ys197YC3XOD9CnVoetaGWg4eqH96ao9lELwA5QMf5CA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bhHW6ItYEiPKha9G8VtpH2TC+nL5tS0CLFaCGyjhDaY/md+QmMeAs1lJdg6Yws+3oDYbA0RT1I3XC5qfdJDz8iW4Ow0Re5/wmeEP4MDz+P5G6e6ARD1XwFi2gI53Jv1IDxo33kh+O0urrqKy1sdau+Cu6HvApk5HkxAlEQ0YKDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b7d3W7OU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JR2UKgQO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b7d3W7OU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JR2UKgQO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6755l9WJ2261046
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 06:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jPg7wDJPn0dLENWw36JR9/8Qv11GyQ72iD0SDfmmmZ0=; b=b7d3W7OUV4ompCrq
	5sR9oaRiUhTLcTVVqoDPuhfSFv/g4NFA0LiLstecmzAeet7J2TVkTiqc2zmVwtz4
	3QCTPx4nZ7rhoRnLFRCiqktfaVh6l5/cH3LYn7ujPEEAIvrZvVhBMW892iKwgfkT
	YjCwTdq2lQHGL+LOm7qer1E5/VFwJSxvfOvYUKMgsU6Hi0zFkJZkeJZPmsRDKXt7
	3rCsCOKinaIs6rC8EKciAOjgkAmKsAH7rc0fZq9pV7M1gqgbx1pldgNtkCvAfXaD
	FybiQRAT64TchYwYwdoSQpNUI1kdFh6h63pj+L2fNbKh68dWMoH8Mc+/sgXQRoQ3
	OO/yzA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fug65c8h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 06:18:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848662cd2a1so809146b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 23:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785910738; x=1786515538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPg7wDJPn0dLENWw36JR9/8Qv11GyQ72iD0SDfmmmZ0=;
        b=JR2UKgQOmy11uz2LBBbZmIKZJgYDKdpiLyBG7XDvKjKjIU1jzZ3DvJ0Y6ZraxfDRGk
         e0Ai0BZqOb6bvGjprGHCx6k4Io4D7SE5xBY+1ii/+Wfr3YqRhYwrMYe6SihIFMnxuOwl
         apAxhqtzmKLzH0giHxCtoV7Umgu0/KtdA88gmj+m/7e9YLA4WP432yOte9hQXucf61hr
         msOdZoXbbAsg+ipUeheTRBfsEtkyW9aNGS5HRomxyds00Agh8hUwVWhZwamZ5dbCUOrw
         E2h799C+kb1cYI3zjTSbrizThuOj3/vPpWWdWTtNSG5D6FIYcof/3TAfeUFOfHZ9G+E0
         DiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785910738; x=1786515538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jPg7wDJPn0dLENWw36JR9/8Qv11GyQ72iD0SDfmmmZ0=;
        b=SLYr0FIg+bvnXHsq99CNBlc8lizQtt+JnOybyJGJXmkY+OJMuUz6PWlyQ80R4sKxHM
         XGAKvnG9wBiEO+5exRic/rnTkWWhPfNNE+jpfcb154YT91tkZIfOhRN3026xwOewc/3B
         GOsZzztHjCnvYBqtL5FYAUOfWIqO8QMA7L5KZgIhjKR/VvdpFRcOg4h9dpTrCKdDm+BC
         SOy5f0+FnolEAiwy1qIeho+QaVmwCHB1FJLriG2ep3w97h1/HroP48WLqz7BiNm21K3w
         9oH6Hvn3p9qhjFWsynHQYVhx+4hAgtYB82+zcfIKdKqsEoGCWDC0CFuC1/0bu+/OZLJO
         j9yw==
X-Gm-Message-State: AOJu0YyxiKLuM1pGR2Adgw/LgkuLU8HGrq3kcQwrmLmzzUBbetzjQfcf
	mGXxcdFSl7rr7abf6KCpRCs+LxBJcY78Qjti9JP2Tht5OpiBrQG2A58ILWWmzzS8cQB4RzZz6IH
	HHgzEl5d9CeGixcBp1Ktq00UR49CQnXSUCF2KeX/M2pE94CDntHwQyZOqaUsROolsySQwmsVAwh
	39
X-Gm-Gg: AR+sD10rEUxtl6L+UQwbp0QE6QvafIkPjtwZv3wQpL0/mrFgIIoXmNwZ79jpBByxbSQ
	xQpEHg2p9pCnqRlu0pYqRtkU8J3cPiBYDTyriK7h7t6BMA1lzsCnFAMx1xM4SDIIkgTy+Ny/Mmm
	bvFmjuKveCpETc1/wPCgTMG2Et9pDdS/zh9FFIrqWIGAAb9NYFJJKWRvRJWwM6YjnDYG+Y0vxZ3
	LbAIhUX/XGQrlFaOA8R3oS5nyIBR4WqvwgaTs9xEjcjTdwJlTiXH0VYKpBopcj+bueU+AFeOzOS
	uZq88Wxzet6gAJFLix4PCQV9KTc4elIfELWkh/9q3lwSCJRnBiLwFil4EUqk3XSD4OgsYEFZ+1B
	KwCDwFfEOBRDehCvFJfTNpW8winMQQ7xC+13uXD2Cj1uUDsp/YD+S
X-Received: by 2002:a05:6a00:2441:b0:848:7731:d95a with SMTP id d2e1a72fcca58-84f2e1520admr4585422b3a.37.1785910738161;
        Tue, 04 Aug 2026 23:18:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:2441:b0:848:7731:d95a with SMTP id d2e1a72fcca58-84f2e1520admr4585378b3a.37.1785910737679;
        Tue, 04 Aug 2026 23:18:57 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e30d660sm487801b3a.25.2026.08.04.23.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 23:18:57 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:18:13 -0700
Subject: [PATCH v5 2/3] dt-bindings: mfd: qcom,spmi-pmic: Document haptics
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-qcom-spmi-haptics-v5-2-77128ebbdd2d@oss.qualcomm.com>
References: <20260804-qcom-spmi-haptics-v5-0-77128ebbdd2d@oss.qualcomm.com>
In-Reply-To: <20260804-qcom-spmi-haptics-v5-0-77128ebbdd2d@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785910733; l=964;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=Ys197YC3XOD9CnVoetaGWg4eqH96ao9lELwA5QMf5CA=;
 b=EqMl65gmDin3jRxjwtQtQpNWpvzIZdDXMVSX9oPXLZwE5wnymj/uoa6NQIuYb9Ch5d/ESag+F
 ewSRCkSdgCHDPi2dv/9LTnPMzvRch4mvXD1h9GmCPKpXl6J/+BcUe+J
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-ORIG-GUID: PcfWKjj_okBrAu3KAp3y9HXqpAPOfY9H
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=6a72d5d3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=GfP_bOASi7LDpkAm3wIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA0NyBTYWx0ZWRfX5U9E50tg0esn
 haZ1BYxUSqPHG5AyfikuUORnvdSsNaV8yXvILGH7Y/W6ncWb2pz3OaP9sWQMl0uJc38lOcF8fwC
 KdzGiFRulElmhRMHlf4PtK60Tm73liw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA0NyBTYWx0ZWRfXwV7TXPi7Un+j
 Ph1tCZRh8JTcUnKFhEsZIxt780PjBEbl1UnXrucxC2038jkLnopLRtuFOFZ3wadt8rpzkvsNkJd
 rO/I/H4IPNVqV5x/osEeaCR03syTgfIADt2MRHekR8L8jzGMkTUAT6oC4On3bUi7YzsYc27QDlQ
 a8uq7RIuhoKHC2/QD4PpMU8dG7seKs/fIHKMitUig8ZmoK3YN5mQZdJTNh+SC61fml06oqUdhMN
 Nl9fFyHz9lHba3TA5Z2x2NX3l987BUQVxh66ZTQ3YBaz16RefkHIPw1g0X/+1tdFumvJi2WuAJJ
 B8g6B7eYrz5WKFqgXPgCBHlf3bBp8KnVENY/u+ITkMfvmBJ6v5CA+p8RmOjsaZtdbNrNgNQmtbA
 jCU0RFJfwUskFjtj4nGoBTIJtobapZd0yDdngOXGPzcg66c+xa5aFCUcn6yiScOPuaM44imCJm1
 Er4iskyKnQhfU1alm1Q==
X-Proofpoint-GUID: PcfWKjj_okBrAu3KAp3y9HXqpAPOfY9H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_02,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050047

Some of the Qualcomm SPMI PMIC has haptics device in it, add it in the
device list.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 644c42b5e2e5..773f4cba5935 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -165,6 +165,10 @@ patternProperties:
     type: object
     $ref: /schemas/pinctrl/qcom,pmic-gpio.yaml#
 
+  "^haptics@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/input/qcom,spmi-haptics.yaml#
+
   "^led-controller@[0-9a-f]+$":
     type: object
     $ref: /schemas/leds/qcom,spmi-flash-led.yaml#

-- 
2.43.0

