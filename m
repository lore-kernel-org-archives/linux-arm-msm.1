Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459EC3F074A
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167273; cv=none; b=Eibvxo8e2f0akmtSAVu9cDO+KCl96npaw+w3gmwSscETNypxLoRqJM97l75cJeRJUlKqfd++r44NlEpchz2kggfqJJu5TfqdiTkQeFDICAHV2x09u2EomakvfoI93iOFnPKPfcUvQD/BpoketDjL5ccPNuSFunkWgEbtUnEMTIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167273; c=relaxed/simple;
	bh=+u+VmD0vZTIx1Kr5BhGWHw1xeq6O5ai23jpVosZ81Mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t91E2v5sV9KAn7BtJHCqdYFo4MFkKJOSLp48xP3FlAvA4Ym1bcpa2XDiAqKPg9Q/D9tvOvKve8WX58CXZYxTEYsrTLcJKfreDby/5PyQcRMqkpgEe640m8nPVEAp0QYFgY9cz7ETOc4Z7QcX62V9PFoeblGIs2OdBIaa6Ju222Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GzCxw8I2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gxiM9e+5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GzCxw8I2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gxiM9e+5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlimx4061146
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N9IFRoN94PW3/DVUtfpMdzCmJQUOxfj9fFXBbki/jb4=; b=GzCxw8I2xBIciyvU
	CgBS15gRGDb53a+NyApeAF0VzrzbWPxOD106p3WKJ7SHOYecVSwH+2E5RHYtB8hR
	zMoIm+4dd6dDxJtcnC6QRJ3lQ3FFxG5OqRwwbAqUA9ZpMJyWPkuPphWuL4rXS8d7
	U4NFNzdYQJt1aD9PoafL4tyW3+90gsTG4TMDiCjZ4XRIHPEV1iMxLysBXknETv/n
	0d5yY0cCrkiRVZ+QJCu9qf78Rjcl5aTbkSTciXTXpPM42Q+r+Lno1uXwlFuvm4o1
	8gynB1oGkAUqJdEJiX3LWKbslkqBu87XXnL7AQcQOGf5f/BK48wjeg3BrKj5CA71
	h5RAmg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq1hhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:47:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so6942650a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 08:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785167269; x=1785772069; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N9IFRoN94PW3/DVUtfpMdzCmJQUOxfj9fFXBbki/jb4=;
        b=gxiM9e+5J4zZJsyn1Q6qFYLgmKqbW3D2Csx1QRjBYLoaAvlGM5NDpOEp97lNnovWq4
         eVUu/Wkli6HTUfxwzeSk+IzMxPzuBFyULG8X91JtfeTjLlC9U9+1/PZk44NPLJmRJW5U
         46N9tDRE2hccWU8zQYCJ7bdWETSFqOqm0piOfCo+/zTxriVFp4QCjP+uhAOJGNZXh8Xf
         9Qiyz2lwn/8ihTc2gjursFnCDUAJBIGq5t8E+ng7eJkLlAl1R+o1Er9LR450AzCYwqP1
         mafAGFp8ZYyamIfCPMdqCucJfNxSGfj8+4IRjFGrkoGDZ4z3D+6SfVnXydf+eCy0TLY9
         DK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167269; x=1785772069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N9IFRoN94PW3/DVUtfpMdzCmJQUOxfj9fFXBbki/jb4=;
        b=V7uhlbl2t2U+Nyt8C2lEDUDO9z5XEq5+WaoVJYOGQ729eXIwFst7IJAqi2FlVx+Ban
         zPt1GcAA33NVx2NOx/rSg+AQjHahMky6p+0Mg12lCOz0OYbD8ZSH+kaZ6gb1h3yFS6zf
         aq4YKMAH7p6kWMaCE+QWhbLHL84+2hhygh37aEsqNejGmkDKFZf8NUVRyySPiuhvzA5r
         s+eF61j30ZKBXG/odgwez/qtttdCvm/J2noyaASmTzy0T4zkn7jQcrV0kjhNhhMzuzdY
         QLbGb4hvQfFUzpme/DwF8O1S5490Rhap1T6OWOQRf51EEejRTEYYJGyMsufiWgRPN3dk
         J2kA==
X-Gm-Message-State: AOJu0Ywh4a4uPN3VkfWvzHa2NbJe9h/9tQUz2uYSID6NqN68HbcSWr7u
	skqA3wa3ou9Dx6GfMQ0feFov38fEYUYUvQCGNSimbynEF+nkCeuXxX6dS7Qr34cwTOu0f1BfhB3
	3O17vTgCmUpQ9hbPIebRsc9KJGUffLh5avvTx2ezEO+ocjpm2RmxfXxfF9nLUZOqSog4D
X-Gm-Gg: AR+sD12q+86Vu49pWxhkUOmzhK59pKT7aiDLiSnNBorwqdxF6eA2B4YY9lxOkww9f+p
	GjFh4neLqTIQxUjEtLkXgYscDKpgSLNxsyR26yG7+q05wDI6MbD08cUNRpXN5IYke8IUzRPwO9j
	/27NNq+xIpsZnc9Pcv+Pj0WRQMGrE/2QdbakuSCsN2/EoQy2UvqqdgQGqv2mg1dg6PbDSE2fXlq
	0G3pDY9h2CRaD0oXMSK2fM+byC2rriVQJdOS9p/z9PUU5kXQlJq+MW2ej77rbYi6asccMVsqh/I
	vrUS2hFqR6yJGOn4oQe/hbGEquds3OX0zFEWTJdtsI73XO3Nd4xwkA1o8caYfhj1HWbkXV+Tiq+
	zVbuc0jzA2ruHUJInlMbIPPcbbiB49gC605gOWvzQLkaZeidmFrkY5zc0yBO4I6ZljZlgm8F7kM
	g1eBgSTkJQeHvmZw2SkWrEFnBgMykeI0eJHmE=
X-Received: by 2002:a17:90b:5405:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-38f294ea28dmr8392948a91.12.1785167268775;
        Mon, 27 Jul 2026 08:47:48 -0700 (PDT)
X-Received: by 2002:a17:90b:5405:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-38f294ea28dmr8392918a91.12.1785167268356;
        Mon, 27 Jul 2026 08:47:48 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc4164ddsm32845204eec.9.2026.07.27.08.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:47:47 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 21:17:35 +0530
Subject: [PATCH v11 1/3] dt-bindings: sram: describe the IPQ5424 IMEM as
 mmio-sram
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-wdt_reset_reason-v11-1-eeedb22beefe@oss.qualcomm.com>
References: <20260727-wdt_reset_reason-v11-0-eeedb22beefe@oss.qualcomm.com>
In-Reply-To: <20260727-wdt_reset_reason-v11-0-eeedb22beefe@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfX3kDXIOJQ6lzz
 J6saOCnHYIoddg3ZXUA/btIMLO1XRqGmWP/ITdER3TYwvgKADwVFQDobUqKeTtZQHGdelbr/unp
 haxKK1q76ZulO8s2iZF0fPvMvN0v2fQ=
X-Proofpoint-ORIG-GUID: z2lxzl-tbpq6nCbZkkEKzfJm-NLlpIpO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfX/pHUyITyw1fw
 oaYuKIyfpJZanbuBjFr/LhD92IS9RgGAUaEX0OzNzDjPuP4Hc+o8/qcv6kuv4hp0BkUxRA4Z21m
 az54kuDoH1J9OBmL8jVcBIfZZI2YBQNCL87Avq3of5xfLg1fRyukV2PWdUJ83NWJNIxT+85PFm7
 imz8XOUc5bPR0XYo0D6KpZsVPNf3P0ZtreoL3vVBDXxCGAPMpFIRpLoY5L+EMP0DSGkJ0DxQLWF
 xjS3QTRTPVwLkHfAxUMU6qNRJZkYdead/+pp5j7Z29+iWL/USkUz8tLI8yMpYtNUW8BmEIAp3KK
 noXgthfwfWiF+UY2B8df9/D6EbpD+z05MKLMwPBG9LeBagZM9BCKdvjpQq6/ZtTjPXWHplSywpr
 EYq1YRtCFUN4u6lS/BR5pAI5I6bX5+Yc9/wvu1IQlBEHy105pvGMny2CbEZrO2IX+BWGyriAe1m
 d2od4+WI9w1Ilu1gnig==
X-Proofpoint-GUID: z2lxzl-tbpq6nCbZkkEKzfJm-NLlpIpO
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a677da6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=O_M3gYDVzo3QzbZqNbQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270148

IMEM shouldn’t be treated as a syscon or simple-mfd because it’s really
just on‑chip SRAM, not a block of control registers or a device with
multiple hardware functions.

Describing it as generic mmio‑sram keeps the model simple and closer to
what the hardware actually is.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 -
 Documentation/devicetree/bindings/sram/sram.yaml      | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index eaa8ef367ff4..95630871d957 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -18,7 +18,6 @@ properties:
     items:
       - enum:
           - qcom,apq8064-imem
-          - qcom,ipq5424-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem
diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index b83fc6831947..0acb7593045c 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -37,6 +37,7 @@ properties:
         - qcom,eliza-imem
         - qcom,glymur-imem
         - qcom,hawi-imem
+        - qcom,ipq5424-imem
         - qcom,kaanapali-imem
         - qcom,maili-imem
         - qcom,milos-imem

-- 
2.34.1

