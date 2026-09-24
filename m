Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113BD472F6C
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246438; cv=none; b=CUNH9SDiKY5tiAsTpUZLqySaFPx3KZy+PuXlncCT5P5GFZ8S9OOE6D1vfJ9P0RbVeVgqPqPFzMRJfbknqNNo2SEHWALo13YT+JJ5a/XXIRIKAImiFGEse02KVhlUFmnMYpuh5ISk0E0tDPFhmw+MXXw1gMOeMhrpYLHb9p5w6+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246438; c=relaxed/simple;
	bh=w+F/L0RFFh+ECgFNEgo5q1yxXBxP0Ei+IXHNkEnJ1wg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ezlXpj18TAxu8E9AB54dklpceavJb8AuMpXyrCVHEEBpUVPj3vQgyZkMw6Nt+IS/7ouHpxsBLTMpofgUD+m4puaZVUqdHahfYe0EzE3W2JKIZMEEHWyeRwAJlhx2Zic5wFRgOHcZ+/aft7gsNuaD2T4hv/X9mmWUE1Js1LNfbAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dwkJZf62; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P1LUf6Iw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwkJZf62";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P1LUf6Iw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3cgj538762
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LG8qC4gs19FaEQbblWXYyFPfott8oSgzgeEW7h6zd8I=; b=dwkJZf62E3+hkDUN
	PO39fyd27VYTu0VVH/vFOtt/YJsyIvPjTYZVwtzwSEWtI0kcxP+ltujOZx8diGDx
	0v5na8gAI4fXztLChJjgE4KqS3bPa/L8t6mFnLBO4zF9lMy+2Z8YV7t8hmuVPAIQ
	IqBVlp02ou0eXETc3/cVW6/L446AQcVLqd2ti5leQW8D6y7Cpu0LXRn8Hk2ZAnwh
	S2PdNsZ0cVtm4qyruoTKqaesJFcQrvNnh1ksE6q5NwEGEmZyWfPJf9RyEgoAI/m5
	WYKFJikVpLVyF3bB2jiE+iKyVcp4irn77UCVin10w1aN1PtkgNhPaits1zzJ/9QX
	8eScRw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc84d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:40:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso324244485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 03:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246432; x=1790851232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LG8qC4gs19FaEQbblWXYyFPfott8oSgzgeEW7h6zd8I=;
        b=P1LUf6Iwjre3uOFbVsOBuMEIhZtMV116x0s9LdnVcg4Tz1of0gcC3iZp8k0DnWShgR
         yi7yUM0KrRS9+YZa6oCBDtRojJHqazXb+vHizkErb5X1HXhpcQRQ65BEZY4DfXYzgqI5
         bxAX0kWmh1RVPckmJjoM43pUlrIJGEE9SBkuQZ+RuT0X9BKJVdbCmnNDuj6fR5MMLVkD
         JdOYL+uLR0J8XfihhkXV7tSibBvzScayqQ/WQ50zG/Asw9AWhlAXbNvmZrwRrEFhHBVU
         rjzAJmjyQLXnyfG8Yk9LHLWXLvAJ1j0Yghgd/uVq13eOcQ3aC44RKluz7841dGmu+Pf8
         JR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246432; x=1790851232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LG8qC4gs19FaEQbblWXYyFPfott8oSgzgeEW7h6zd8I=;
        b=Do2zV4S2BeASmmzLuTP4DmlY8QZhqqj5YWCLmO9XSPgTeHSObl9zvcLc7coKv9Sve9
         QLE0X9OZUFT+l0sFTp9N8GE0/q5etjur16/hJQvrijew23ipBbXmTblRnvQup+ksRP8g
         sFBEOBxiPike+dqMYpC5b7rFbLPE7joHlX0xHs8aM8p8Kj5CXP8cxf0ycq3fSSQYMbt0
         t8pemmPNYAWir+jsr/ZrzUwe/XO7/FVP8zkNAXA5EAEoU2HUaT9foFnuYu9w8lpSA9ww
         h+0KFZ8GajscLp9PdyKIvSqDPsUlwtln2zmrWtDMFzKsvT18kpjzKLfZld4n/Ks8Ozik
         OH4g==
X-Gm-Message-State: AFuF++mqN1v7qSsCwosfE5D6jBkc6XUGHGnVQ7MOdzBrvOr9+yg6siFP
	W7fwrek1IY6G8ne2g06jnngt52rtVOLtWRCHdQYWmRxYFkfvKjcWBPGzQm7xKEzQdLovsm1U9PK
	8+iP7h7us+X1PIUd2QRN8YwZt/4+aECaXdUs/TIB4d1ylDWfm/f9KOD63U/aXEWDq0CfN
X-Gm-Gg: AYBFou11zDMbciGP/dPCiTD3yc8Efn2y5UonTzBvSdV2oFLeTwYd72J92tRCtNQNTJJ
	5KdDyPfSFR9QWh/y7Z4PTNBPYBoyIDghJVOzZIeCTw1/6HP2+z1h29x0BJ0JwFpHah7Em7EzQBK
	+qTEPD5i8FYeoCjP9eXIaDA3q7ePtb38jSsy5jTXZ8SrFeZ6+Yoow/Cap0qCD/nKg1HBFi0e6ue
	bJbEuhiT2+Cs4ckeFi22CCg8l2SbskLowRCBCrzfTICt7EsgqRbbdydY47O+Rd3wa9hXyddGRvx
	OR0haaFIAemyC4uGS1yEk9GJh/bufEucF+kNoU6AX6Les0hu5JBfI8AS1erHVN928W+dO5YkNUN
	TL5Rg585Fc3riQHdWQmc=
X-Received: by 2002:a05:620a:4543:b0:93b:d7a2:83cb with SMTP id af79cd13be357-93c36411a3emr221619185a.58.1790246431421;
        Thu, 24 Sep 2026 03:40:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4543:b0:93b:d7a2:83cb with SMTP id af79cd13be357-93c36411a3emr221613385a.58.1790246430805;
        Thu, 24 Sep 2026 03:40:30 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:24 +0300
Subject: [PATCH v5 08/42] dt-bindings: clock: qcom: sm8650-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-8-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1797;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=w+F/L0RFFh+ECgFNEgo5q1yxXBxP0Ei+IXHNkEnJ1wg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3hI/hqnXkcEGcYY08shENSfDTfjt4PMQMeE
 zH96i5RZ3CJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT94QAKCRAbX0TJAJUV
 VvISEACeiFPdEHQeGPhk5Hm3zzxleBRHKSG7ZXJvMsoYrkkGwtKOofDIc5CFQCHxhzaDI2mgT6V
 Th8GV3RXUC8LaGJxysMTP7KQd5W/gJO3qhyjPyDxwfcNdzGvKM30n865+vZ8dCMjdTBmed6wVt6
 4w7HnjTCmbNpBGK3nT5ylOBjgJYJ/Z1AL0Wu7LqdeBuEdOaXYHPDipa3OA3LvujYWwjszi8I3Tb
 mmxjexTTFjVaMjkVj7nnK5UdsrQAAzIuL0SQcHd2oLTKjtT7geXwL3Q7bSfThG/Jz9+D6Ip0P6+
 mvvZsN8HLH1vUnFv+dVKEwY6JfmmR9DN6Wd+9q0di8pFWpowJgkmFeYoceaKpBKUl0fTpG/tx4D
 qNnsDouE/kCeC8pSEgtsLRmvICYUgoX/WP7QPnnhsi0F9J2uhCLymh+qbQhkaqMWVJgrcikhpzS
 N3OSjqZCsw8qaIb62LFW7RuXmrj8l6F9/XnFRjJsCCNRVq7E5gf+Ed+iFy7ZzDOuZ1Q+zgSOkdZ
 sI6z0ovk597np7f4vEzFTgXxJ6IEDtLZ0K81Emz2iM0GGhQoeSs74Sj3yywMR0fjYO1inxxHkdW
 ljrMMWRs0CcY00g8YCWFFuG/QVcB0gq1h89qzCiCY7ffICQknTaORTmu3O88uFqjNV3Awz8lHbk
 mkDPn/AGmx4fHKA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: WThlBstLwvyVjYtMk31_HC2wt_5oAtL1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX7MReIfxaUXex
 RwizFWVv5lVilvqINo9vi5I0CTr+PJhw3fjiGTgzEYJYjO5PI6OlsYN4XaKqpFCByNwXvWo5DmC
 mJKye3jGydVTbJQtqf+zOaERLmsevjjatSaPVNHC0s/fdkcMCAw1HIQl4zfK3GG061y4oRxYHlh
 aBURU/iAGIK9NDFT2jFBkQwfYB0HIQcwoaBJxU24o27VIHegH7rx+s8VlPE9+83ezFFlD8EnQ2g
 56rxNZoNsmQ7f/sUtgklvvwqTc2CpX0F5wNCEgXrb6JC5KZBa3OAAammlpEzChV1lY9KpuYClrh
 7Pbpd1GPy+KiU3KuFseoAvtLTgGSWP7D/um1HdmagT+sj9TfSn3lhhEKt7V5Wa+P7fPvDRfMY1C
 +ZKRGYk1jTg1Ig6YaT6KCROaRlGASxOctbxZw11Z29lliJgXQQLk3JAnMKoUVNDiUTH/G39cA2C
 Tmet7eUiSlRWndxhH+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX5WJ3L7URNSNC
 IOcxOKu+xjgrvocUbWVPuaNS4GXVirIuDMXYFQBsE6le33aXTx5QO7CcnWw7cCXVWe7hzaIXbgR
 rjHbPg3yJuzJ63dkbCep0Gaep3AwKAA=
X-Proofpoint-ORIG-GUID: WThlBstLwvyVjYtMk31_HC2wt_5oAtL1
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab4fe20 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GDSCs provided by the SM8650 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
index c7143e2abc80..543105b277d5 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
@@ -32,9 +32,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -45,6 +50,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm8650-gcc";
       reg = <0x00100000 0x001f4200>;
@@ -58,6 +64,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

