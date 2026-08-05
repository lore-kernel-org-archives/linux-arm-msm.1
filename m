Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743373D669B
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 10:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785925864; cv=none; b=dXyl0assi1wUBvrD+nfc05/Ko45UYtqSDKS0JXbNHFWtaOINe01TPnpyOjhgKoKhWEo7R/H+fe25GvnW5IFTxXRKGBRURzl5ySIfODzN8V3gOZg/z8Uk4cnjNRVYy0hUSh14KICX4IJJX5ZXJD3LpqL3dDnQ1YXDuk39nJxxg/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785925864; c=relaxed/simple;
	bh=5/jK8+6Y/KJQyp1HdxKaUrQHBnEwVDmOmlkOaPRXWHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jI33HdmL8Oz/hSfEZ2cKq8qakolh8YWYcKxEU3A5HyQndGCxy3m4kVbDSkhKT9mYgjKOZJPcQtNYcxYZ5MqUyySRB/1scrpW3Scdfan5wHxfWyLVL0qXwY1kc7FP5OB/qmzCiV/2cIHGl1/sj8atpacDUYLMnsHAhmlFcxJ4oI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2vCyUm5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3mgdukj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2vCyUm5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3mgdukj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dlC61713433
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 10:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vmGovCITzXUqx6mi6ytutH+obVjyf8rBjQG5D0izrtc=; b=Q2vCyUm5QEZRcWXm
	h8eVUvyxh0TzeQV4+o/sLS0ZLW22kDvNF/HLkMHlSwXKzgstovk0h4U3voxic5aL
	ic46T5gw6vzQnTK5Mtzd4b+eIwceN/zEGuBdUbukPxeLSWT0vbhcR1W3EeMc+tno
	NYmUzW+DfMt0TI/CJZQJgPx3FoQrGA6Y7aOiK7HyqteaQX+ft6NsRIkVG3qN6cNd
	WRL5SGR7T22Qn8yzP++Gq1I/ZaGuKZr4X7MFGh2r7P9/9TM9kipCfXrVqznyI6u6
	Wfz7OsYyOkzAazXDNdwf6NQ6My55AYs/eVLIkLzSNVLM+LxKzQxbbgF7BPdnLa5f
	azg6Vw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuwbqsnsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 10:31:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8efad04d884so16312786d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 03:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785925862; x=1786530662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vmGovCITzXUqx6mi6ytutH+obVjyf8rBjQG5D0izrtc=;
        b=L3mgdukjeiOvokJmrelc9k93CoTsMYREmO9+AA8IYaRtwn2LHVf9KyOsed1v2mDR32
         wdH6n8RLNxae43S8oftzHSbLh4iiryMYWAgpsT8N3S1v6mpPWIMX6Kn3IDePbw4Xbe3+
         IG3qYc+CJGJoBF7HPPrnN9JrsR44zTBQnyy5ozOM9aqMYa/DB7tuzYdnaQbRMPXaBSB2
         5Qv6xgkc8DOybnkkNgMRNYxwhG/2hcf9sslP3Pww9S8MyH07QqlB4AbWNhiRYAs7uMnS
         AiRjxOZ461czoJJNESxrnQEIcdpJSNnBurwqJgdg5a11wlUK9Fp66YnbeU5SeosIegu5
         ko3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785925862; x=1786530662;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vmGovCITzXUqx6mi6ytutH+obVjyf8rBjQG5D0izrtc=;
        b=kEKKxei4yWNiDueoSNz13XJRnE+tYeVlWg2VnECZ6AegJAnIqnZLljNhfinMUfXjO8
         B4XF2sp9KINcm3jt4eofa4UJkDdoMUlm5t+aiLrnxJsw+J0HIYcC+bu+krE9rto5Rh0M
         8k92qiSodgkfKKiIpm09L8LrXBW+GpxhNncYlPensii2BdFbQDWJDwOV+kxkwLBG9UoD
         Js7r2jZCx9hOht9C8/0WH0pCO+Oxjp3gxVFS9JI8PnQjSVCx5YWXu6xFj+x69um07v5H
         n+rTK+zsRgjRZTLa0YrmFXUP6ccds9GMQ2IZbQLyEshk9acK71IdFH/SMtQIKnVJP+U/
         aPRQ==
X-Gm-Message-State: AOJu0YzeLM53Jpc1Qdt7T48YHWUreL6XEbjO3sT5nbv6AZWbMSWPmqYW
	gku9+nujd0H9OV3mKDHEDTs5cJMGFJwb/MiH+OR7mBwa95YGqHsNn0ofKoVmqkeACUD/JES128V
	wlrGOyMi7Tqw2/M6/vymScKC7tRWakGOpD0svYE4BUfHBSWrlvQeeKBEUKAVGOOG85U2X
X-Gm-Gg: AR+sD13W8biOgWi3zkdMjuL5kRDuDo3cjPJd8JjTuZVtJIkFlNI1VjeY0+gc09D5m64
	lIVIB2EHHfPuz3kunTIlxrLK2V/T/t+eeroHAGzdjmGBJvuAhuQoNlqnWgkUhoTuG293G2mza4J
	6hEfH3sQ2dOgTF8/b+lRHqfiDiQs+HpoDN/2j1Q7M+24B/6P1EdgDaHgxEhkUoeCkvPLM446lag
	6fn00qiCzD0J1p0IRz2q9A6KuIEhCT4dNaS6dtM74334DO8mB3SVNI8qOA+t8yXDBUooFYeB4eb
	v6dzBqAp1OFxWoQi/Z9DhcFzCR4WKpROwlwLTqWprtqQTcVNI0QALVrzB3rPKKwtV2TXKH3AfPR
	kPrj/PILiHkVoh0rF5LHKflYBJlRCdxa7vlFhiJsPsBw4VKvAlhIlnIRC/uE=
X-Received: by 2002:a05:6214:5505:b0:8f1:e1ba:cdfc with SMTP id 6a1803df08f44-9088125edaemr63922086d6.16.1785925861712;
        Wed, 05 Aug 2026 03:31:01 -0700 (PDT)
X-Received: by 2002:a05:6214:5505:b0:8f1:e1ba:cdfc with SMTP id 6a1803df08f44-9088125edaemr63921466d6.16.1785925861223;
        Wed, 05 Aug 2026 03:31:01 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9087ff9d814sm22259706d6.10.2026.08.05.03.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 03:31:00 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, yijie.yang@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com
Subject: [PATCH v3 1/4] dt-bindings: arm: qcom: fix PURWA/HAMOA IOT SOM compatibles
Date: Wed,  5 Aug 2026 18:30:00 +0800
Message-ID: <20260805-hamoa-come-v3-v3-1-20463c43eae1@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com>
References: <20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qCdgZBB8Eng1L70BBdWdYQUbVX8yoFV7
X-Authority-Analysis: v=2.4 cv=B+uJFutM c=1 sm=1 tr=0 ts=6a7310e6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=eje8EFBO8bwqvhVDLvsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: qCdgZBB8Eng1L70BBdWdYQUbVX8yoFV7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA4MyBTYWx0ZWRfX9qp4QHeCV4FM
 ykZkvZTWOalhoylG0FBVA1KjMlmAb+/O27c3+ULXR0ZKwC5+JnHpie9PMsgaaEywxoX+mLA1qwC
 /vwKuGqKtJr6W1VW8CehFpMVz7txjCA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA4MyBTYWx0ZWRfX/FUNLinPpHre
 /ZqhP1ITzGCeW/ICGF3Op7CjB4gO/30R+5L0gv5MxbelAQXR5L0VZBpDOr8xJafTI+ryehv+8aO
 4uoCpy15pXxrU8BGU+57NU1R7M3+CilBBFcXtbj+OLcPIcNmAG70kauTiiJ4vqrVGBHsBL/fW3v
 qd7EDfPOngluM/aITQkIYHcM218nrNe/NSkX3MdaTviUn5Mg/rCcduEFn018MHFAFvcdZkZQBGT
 UhB8i5F2xznHKct+Z0W0brsYvwb/lhlMmb8BJRvVZasPXvi3BM4b7TmX6R4HG6eSMGUhgsA23ja
 oNGDwDfr1fB5pGAMyZ1QlRjeMxHSsipcWunTLANFEt1Bqiw10GZKaKqa2rmiTcPdzthW+MHIzAN
 h4ITnZJhbdtM3b5kdOIFva5a8JoS5nf/bm3ouhnHCH5ZpDxSKCM0b4Xs1kU4mT1rfL03zIwAvYo
 bW+ujFPawPgaUifmAGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050083

The compatible strings for the Hamoa and Purwa IoT SOM platforms do not
match the naming used in the official hardware documentation.

The documentation identifies these SOMs using their IQ product names
rather than hamoa-iot-som or purwa-iot-som style names. In particular,
there are no SOM products documented with the names:

  - hamoa-iot-som
  - purwa-iot-som

Update the compatible strings to use the correct SOM names as described
in the hardware documentation:

  - hamoa-iot-som -> iq-x7181-evk-som
  - purwa-iot-som -> iq-x5121-evk-som

This aligns the DT compatible strings with the official product naming
and documentation.

Fixes: 06a4db5d8d0e ("dt-bindings: arm: qcom: Document PURWA-IOT-EVK board")
Fixes: 458bb855f274 ("dt-bindings: arm: qcom: Document HAMOA-IOT-EVK board")
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..f244f547d511 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1220,7 +1220,7 @@ properties:
       - items:
           - enum:
               - qcom,hamoa-iot-evk
-          - const: qcom,hamoa-iot-som
+          - const: qcom,iq-x7181-evk-som
           - const: qcom,x1e80100
 
       - items:
@@ -1235,7 +1235,7 @@ properties:
       - items:
           - enum:
               - qcom,purwa-iot-evk
-          - const: qcom,purwa-iot-som
+          - const: qcom,iq-x5121-evk-som
           - const: qcom,x1p42100
 
       - items:

-- 
2.43.0
