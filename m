Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B230366049
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785478495; cv=none; b=t0Bhtfwi6LPCtXqNzBMNPN8ddUxO7lr9kiqq6nJPHgjXOLbDgbZwJD494V7H7DphdI99MvVwhYOhyOH71VqLD3Uj5ZXo3EN1haGdAEdq+OIBE34setWwUvOcypNvDvJe8VMXEPRgiLHqRfEmLmnWkaWtnR5TPInmxVXZPiy4Qe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785478495; c=relaxed/simple;
	bh=7lAnEboM05pxKLJKuQkUK/+Xj0N55Uc3icMOdr2M+eM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NylLO1jSVtD83uESHu+1oSO3RYSabKdaj6IJ6fXKAJ4fvnQxcZ627FI5t5rkk4by53WC+pp3WR6awBrwCrHJQ5RfpDLecJyUmaCUsn2ow2y1skkOUfrbFNqKsPnt5KGh/rXdeHXNAJ+e2RYKoqc79RxOEmiyzJijcH3BhbxevwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pfd7Ddor; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NMMs48dx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pfd7Ddor";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NMMs48dx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V67QDC3010466
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=; b=Pfd7DdorZWoplyqv
	WIS30HtwS+76VWExerP91QFOjnUNJjRZyG36ZY2rF+D7KQoWL1pwsx0HTCUO9Qsz
	ou7dJ/W/fJ/H/8fyIXbzxZ/UEay9VOcmeDN4N/p6woo2FVZS102FsZjRpGrgV6Xp
	ENYADZDWn7NbYCY/h0BG7mrWBIwhR+5fxkFw/oYVJSC6kEr3/QHMCeWf0rpDb0o7
	FCQ7D8ab3kOgm5SLKEI5jl/je7nSjJuoaQ6ReweFACcASHzNDL2SPTGBXfTyq4Hf
	CfPEGv8FGZO5zDuMB5+trvKnYAJyfgI0xZl47Pklm+4+DTcjWLm/pIsvhKAEwwsr
	HNI8UA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp5n80r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:14:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa4e4684bso15494395ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785478492; x=1786083292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=;
        b=NMMs48dxggzQdtOLbT0YpVlzzrMW3O3AL8pFBl/73QVrHbMdm63iBECVUme2DmVcX4
         BCFxbpncPBpnx+SymEQi94euxzW2J7U1nl7jSRRGmRPzoIgYk6Fnhhu1bd72IXhGtBWh
         h5opjJZvMUXnILQbZlxPLlS8yyVIPnpPnuvyotDrTM58v8O1ilcI2DGeRjIOKQ0vBsSF
         wtMFRa2aE3VeAnEOmjezaWBjjI2mW+Lw8wuO9GBiQRIK5/TkVg4z7uns+FxlzrlomMcq
         +C538TyCXTpzs+JqB6XRFCtsilLk2+3wnk1RxFlzW3z6i+m46YHxg5+GchxQWrfjiYWl
         Gwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785478492; x=1786083292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=;
        b=eQbdkZlQ9dMXmA8RypUvf95qLZdfMKFTe2r9x/0+dFcUqaOfe2ieuNJThmdcFJrj45
         wIPsDVOxGxLxQonz+mynd6YS6lOAoBVlmkktpJUgiCm7XbFH4jH0/4L0ufUnUm8mZoUt
         FK2z2Xz1os7ldehXVGVgQ66/sh7V0jg7Hav1CgWmOEjsxaUCVajd+BNocbWmBJfgAfUJ
         VUxS8x1Sc4caLsRJ5hijCXT+Aux9MYc9uSRPW+FSNO45n0AGBNUo3oSInMgjLKXzz6G9
         1H1Z1u7hvX0LNRsNWlYqz5vG3xQoETkEaNgF+iV0rdlKq1xwPIgZy5GkOVuz56Viz7OG
         XuFg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6Qfuhp+9FNzMWXR3BnUByLlmpJfKDq4pj3L7+bbyPwYd2VSVuBg9Irl/okKEMCRFMg2rjIG11XxqKiPJ5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Xk47bYJk+IG+eBBYEclof3i/Bx8ZzhXMehg95EeAMnthCUyG
	qSog8eaCajjxWQb5y+kv/Bw65r+fVMJYUWA1062xPQEthCbl9lrMxLRb81yHDJm4QfqHGUCwpwb
	x9uh52HYxhbNnoP3rGtnYh9vohrjR31xkWmKBw436/hLioS0FrJH9+ZACGiw1eYk0XMUe
X-Gm-Gg: AR+sD11yJDBSluqidXW5W0pB49fK1zePJXdq3W5dFrmC2x/zorR6qzZv8Cbvqh4lx7I
	GtH+BRMP/PbL9OpmGaYxYf3NRhLVUa7O+85DqpZXpnbNj8lnpMKPila4OIqkWV2EHbp7hnT9bFo
	6GE1638T+NgIXXiIwTRTGxZ+Vi2d/ImNF/+9zCVJ0IiJqy/JcuejqIJ/MDBlmA/AivlPJqGF3DE
	2LjxKaAuu62t4Zppt2IW3Elh3Ypeh+y/VUr3jcc6nAJJ6JMzCr6x+vHlKZ6AKANU/BTvW5s9eEH
	IaT5dSd9VR+6YZSk2zdyE34pDuHWj41RW+VssOcTEsbRGmGSLIgFHk6vabEiDSCu2CPkcw/bovY
	EPPWjHe1omNM/ocmTwzO7bAZHpgcm5QqWeB9GJ1Zh/1+qEZmN37uCtNcgWUZ4HEf0
X-Received: by 2002:a17:902:ec8e:b0:2ce:fa3a:45f7 with SMTP id d9443c01a7336-2d046de6e94mr8722175ad.16.1785478491803;
        Thu, 30 Jul 2026 23:14:51 -0700 (PDT)
X-Received: by 2002:a17:902:ec8e:b0:2ce:fa3a:45f7 with SMTP id d9443c01a7336-2d046de6e94mr8721935ad.16.1785478491422;
        Thu, 30 Jul 2026 23:14:51 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b15d26esm719635ad.76.2026.07.30.23.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:14:51 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 23:14:37 -0700
Subject: [PATCH v4 1/5] dt-bindings: arm: qcom: Document Kalambo SoC and
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-b4-kalambo-crd-v4-1-e458f8b08114@oss.qualcomm.com>
References: <20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com>
In-Reply-To: <20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785478489; l=1039;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=7lAnEboM05pxKLJKuQkUK/+Xj0N55Uc3icMOdr2M+eM=;
 b=vN7Rr6KWaUgIlMGb+pY88D5N04J8F5vTQxB6hGD2Vq0nZl8wGHBQHz9obpSIx03yNTGHdNB7T
 TT/CPAeQPLIBveikhhd0M+6dmT5EOePL1U0D9ItL+GtJnbngSbRH8aN
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-GUID: -_sMhmvL06-VvHdKVJ6QbTYXrwbSxGlA
X-Proofpoint-ORIG-GUID: -_sMhmvL06-VvHdKVJ6QbTYXrwbSxGlA
X-Authority-Analysis: v=2.4 cv=bKwm5v+Z c=1 sm=1 tr=0 ts=6a6c3d5c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=p3IoqaKxkAlDmzJvLqoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfX/yxyIg8ey0gu
 fceRJpZYCBNp/K603pT6ISl193IuNq+g6kAUVr3/+ZYeeZ/rDvuhzhpbhrfGp+675wPNvgSOsrl
 +c4wogFem1rUw+jDbgJrLuxgVQIv6RyDsmQlYtN0FTGx9z2aGca8p35OoQWXQx9TcglEoGbQ8mk
 t+pcS0xm9Q/kfsdM+S8YyVv8v4cfT9TrLomZRD3y/H27ndzll+EppUraxMGJphG/ZruzwgyHjgx
 6OpCxsg1BFQTL2KZ0tdiQkNPMnFvsfHbLkOjVvkJvOkhRIu75CgAoeyXpU+Nmmei80WPwWDW40W
 /2tPzFBrtWi/AXH0D+n5fGa5dpxYAMwIlaASjCRVubtFFD+68mf1WW6zXCl7wEP2UrV/c+qPw0L
 bGddhXGdMjQwTIM/nndD3tcRPmp+GcB8kBH74FLwIW22Lm4mbvWy+dS19RjTaLkIwfMtg/Dy+kp
 QplBrxNHnHv05lrcqeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfXww+EJzbaKIH7
 71h47snb7foYEzZever3ORaxChHTaRPRxH1iHItuKjdOZfRBcH27BSH/pREgsCrJgU45V4/1E37
 QxSqacvgRNLNrxID2cXlYD4zWteSILM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310040

Qualcomm Kalambo is a derivative of the Mahua SoC with CPU cluster 0
removed, leaving it with just cluster 1. Document the compatible strings
for the Kalambo SoC and the Compute Reference Device (CRD) board based
on it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a9279684..b0c07a57bda6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -174,6 +174,11 @@ properties:
               - qcom,kaanapali-qrd
           - const: qcom,kaanapali
 
+      - items:
+          - enum:
+              - qcom,kalambo-crd
+          - const: qcom,kalambo
+
       - items:
           - enum:
               - qcom,mahua-crd

-- 
2.34.1

