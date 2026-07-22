Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAFB33D6F0
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784712440; cv=none; b=OBVgMs3ULuthzhkjiLR6QtKnSBNl3BWI0IqhsLrAM6EGKvFyYlcj4Kffv+fAzVZa/lRi4J4Q5HT5aytrMzFwLIc/oXbyVKeKmc4YGmuEdRlRqo3H3veaKI+307R1Jwd//bdtCHbIl520LBnJRkOHdvA/anTzlpmAW0r4izQel04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784712440; c=relaxed/simple;
	bh=fa2aG4LS+9chhSCsFbGu/wjgtsk1e/yb206cFj8AyGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cw5g6s5jOag/CWfy9EvgcNsnQp5Y/FsrKcnqixPN7/h9/OmByaIRRpHt98azmIbv+gHRuV43WJ/UfPTX7HHLSmk2Qk/62Vb9Lh+1VCk+6GmUPu1Rk2G5OF37wz49cvQK54+bmL7GMuRzK3zHsFlDpJu8AtTTu5ck5y1P1kCRhj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TT4qpn7F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N2IcCtVW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TT4qpn7F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N2IcCtVW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M9DkIV049574
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gkxmfdLNOJUpwYPfIJkn4kXdiPR1BCGkIFMX7SQ4GxQ=; b=TT4qpn7Fxu9pKbr3
	Mh7Ou/DhMBpBfC4/LXy3JrQxrNgjrYNaQAm2shLYW+/rj4qsaUaCrgS9m1vi243e
	omUSOftuCWXdS30l2fDTiurZ5GDf3/jJTTNEyw47E3eoX9eOV6eXghOR9Eypa3AW
	FkeqnX/a65Kxd6Xexu0QoSPOfCr2aZDK0j81bDu7HO9O9onufiIJMzU6UvCMuliH
	73NbQfxTVLaxukx4yonMdVnwzXc8nGIUAlljNzzV7q46LFbwdOf2htLBRSoYKcrc
	MRdxnTXGdOSRkvDsuM28VvP7Yh85eRpoc/00Pq9DrytZzmSlcPDp8tB3HTAFGtg5
	DjBGNQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju2281n8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:27:18 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb835525b10so3400986a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 02:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784712437; x=1785317237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gkxmfdLNOJUpwYPfIJkn4kXdiPR1BCGkIFMX7SQ4GxQ=;
        b=N2IcCtVWxum7+QQwVzTZEoIhItOawd/jO3rtYY5HKnarKx8hJF6dKcsB5CaCtPMzEF
         2Dhl61bhrFOOVDKMiMj4fwOj0g+YCUOMhOD9YnWeNYLGANndcUEU+qI19x/DIZ5slBzp
         UfKMMdKlNUBSjthd5legcw/lubBjzmpL4FIBAE8vgGY1tEEcKMDYOb7r6YGOCvD18tY1
         6hnpFZast2g1Sk1Y/0Cx5P8LxpH+ftm3vHxiEwWCP1Q2H70jmX5H5olGqjvvymeeoiQO
         6q08ajKzv7ft4WZvPK3nxvouId44AgQRK5TLZd4Cwdn0ygxtE0/6Y/Zpl09Oy7+IFXGv
         OObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784712437; x=1785317237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gkxmfdLNOJUpwYPfIJkn4kXdiPR1BCGkIFMX7SQ4GxQ=;
        b=NlOePuFpvYQg9VmGzmDI/iNFAg/HxR6vKFIFlayChK4HZ99h97vb0LsYLmudnnq3jO
         3ps4cUgrgUesI8SgCFW2IUsXMi1zP3yo8UfUuNygNPiqP0fTHRNfaTKyWD7pqKoREATf
         rHOpm1HeLCNd3B5kRPImbDL8QopAYX/tF2DUoWIyoG+kGh4Gis66gDAs2dTTcV82MutA
         SRgw432pFfL4fEyvj+nYm9QZ736EYQFwOtReSYv6+U8J3tQMnuhsRLs4ReuqLKQ06kap
         5f+hMwz0u4GTNHE4b8ac+4Ywq/Uqtbask9bkUHZDNodYD/HRbg7OGEDJx285sJv0TkCp
         w4GA==
X-Gm-Message-State: AOJu0YxfPsBLcgRP1p7BkWd1KJlUgzzoqWkijlcp8gIQC9HL1ntsdIcj
	qviHmAdn8GH0YSq8FUKtjJF2YfysKoas/X/sbesIT4HMQwWOuGaFMse9CoPTKxzQWNjqdnmCpuh
	heIlwP95A1tzs5sk6oMtgrM0l/JDMGVO7raoFL/fBytI5V7SdxkHfjLnvoiZ9lWa8dV/W
X-Gm-Gg: AR+sD10sHe7BiQl4YUR5gS0stGD/HRAhgF913ovw+7L5G1jTH1g7hn57Q5PuEAbTtTj
	rTWxf6ji+AZ/zx0H3zGj0mGZybmiaRfdYuCNkcV8KqvcvRKdZQc8x5W9GGCpjvtPi/d7EQcYnBW
	MYRhFV/AOwVQfuhSNaMHCdWzOkHgDY0re0HjbSHjq6XzvctFAMebh59KZRx4CbRGMDYm2XOGCby
	bjxcjeVS9w9kugLVnQUcQW2zGTaAbDWQy5ughcUZOjvO/4M7+MlgKAC7+3kTnyyF6eQAq1n5cB9
	RA6YPjnTvq5X5ipMlBzSGOmoq2yfPe6D7/6dWOR3eIHFmGrTaOJPKhNIUEJfHIsWuRj0go3c0TV
	3bGpaxpJIfI0Ps9z1WskzjoRBpzvfwV0HLk2xAlH+TC+2wRdlQe8m0gRCdepp0Nv3LM41HemtXw
	==
X-Received: by 2002:a05:6a21:a8b:b0:3c3:83e6:c6e6 with SMTP id adf61e73a8af0-3c3ad9bb9dcmr25135435637.55.1784712436475;
        Wed, 22 Jul 2026 02:27:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:a8b:b0:3c3:83e6:c6e6 with SMTP id adf61e73a8af0-3c3ad9bb9dcmr25135406637.55.1784712436026;
        Wed, 22 Jul 2026 02:27:16 -0700 (PDT)
Received: from cse-cd04-lnx.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f18f08asm850677a12.21.2026.07.22.02.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:27:15 -0700 (PDT)
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 17:26:28 +0800
Subject: [PATCH v2 1/2] dt-bindings: crypto: qcom,inline-crypto-engine: Add
 x1e80100 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-devtool-v2-1-d7e609ef7388@oss.qualcomm.com>
References: <20260722-devtool-v2-0-d7e609ef7388@oss.qualcomm.com>
In-Reply-To: <20260722-devtool-v2-0-d7e609ef7388@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>, kernel@quicinc.com
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a608cf6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=94x6OeD_fArCBOibklkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: ykmBuvv8XmyS33dYfJQDA3JoUHSa_ATx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA4OCBTYWx0ZWRfX0WSYwFp9NFVh
 pdWId+wnODEHTxkNEINUmIIRCLkZ1D0tSvqcClzD0agydcGVvS1Cajg3xgv/NH3+5jrjawOfH2t
 hh8WIJ/AKIjqjuA7wmotDWkqUb2T0o4=
X-Proofpoint-ORIG-GUID: ykmBuvv8XmyS33dYfJQDA3JoUHSa_ATx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA4OCBTYWx0ZWRfXz5dknDlacak4
 t2DRSh/9q8ItIxHHQ3zhd+fvczEDA2kzcvtwGAWyHQrtH+kLXDu8TQmsr/ks4lTh+kcLEkcjJ5A
 nSuA704EZYrvJzBKGes0Es1MxAdHzNh40V07pZ3Z5JJ0xuyuYnwYHKtkWotwCz9pgV58YxvrEKN
 DCYhy56oiWFxbbSMp3NebAHc81d/LZ7R/RK7DZSKHswxkFiUFJF0C478yhpN7U3tMQC20ZxIqCn
 Ep8F/EiXxLJS44lwdcRm0Li8GNGduxqSe0gCd2kJxf6Dfp8A9UVMYf/RCQA3WANEaiDT78Em4/s
 IXnTceuH8SasnPTGcR6BXxZ+o/Ta41U1ACb4EjtvNEABiZwWcZsc9zTKIhqUMairWgy5asc9mU4
 5rNIYJrbevvaNpKyPh/9XCOy8atd3vuqLabNlKuIcC6CH+P9AfQgaRK/G3CG9ho8Ks/3E8lGPmA
 c6J6kOAk3HJNTfIdKSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220088

Document the compatible string for inline crypto engine found
on the Qualcomm X1E80100 SoC, used by the Hamoa IoT EVK board.

Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 92c3ba6eae13dbd8a6a448057e942a08cc3a3ea7..07d6778a287631262282d75c0d233919f4241edd 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,sm8550-inline-crypto-engine
           - qcom,sm8650-inline-crypto-engine
           - qcom,sm8750-inline-crypto-engine
+          - qcom,x1e80100-inline-crypto-engine
       - const: qcom,inline-crypto-engine
 
   reg:

-- 
2.43.0

