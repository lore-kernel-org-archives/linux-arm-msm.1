Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90EB379ECD
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 03:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565629; cv=none; b=uEHundloNvXu1cWdAh3xGw7ffT2maFoPL/694C5d3bALAhzqOld2V68hXBiETzIzr3DTSwumsNpKVhgf3oBKiNo21u0lCuqifldgIvdWbjcPgQmrsI8DwjT/c74t4QMLc+RbyvIHItmXWHPHtd+IvxEdNhIBSb+gDFhdTkoy0YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565629; c=relaxed/simple;
	bh=hhD/PLf1WNyf7Oqd7ppYYXw4cRp7PicoV7/GrXVlDSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jbf7NawqEGdA7hlzZ/ZHLyQPkrW+UzVVQOB6Xy+q1B+ljDKb+rIifPaLcdxZPijPO6Mb/gVPYHQiYGcUJcbxs0ZBBl+Szdaqwhr1+tDOTZZjd1Q9M93BmNxFmWEAOUdd7zaASOtef9JVD4I7Hd4aylLCArbB/MTCho5HMfFMUao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lUwUuVpo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i1SFbRB0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lUwUuVpo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i1SFbRB0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RMmQIv1300376
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 03:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4wGkX0ICnaMs4uJdvDonWd+721HAcvQUBVA36Y5520=; b=lUwUuVpoOvHJacgV
	rw/84A7U0jRHlBE9G30Mb9vROFTaFC58BsBnTzamA+nIywjyMBHV2/yae+WqBQDs
	NnrN36EiWKAZVUgww5mHrat7+ix8UFViQjAEQFpUawcp8DTCAecn5f3kmteJvB89
	S14sjahEhMif13nId1ldCl4pWxVJEtI7X4GeuntS1VH1IVwEeChdTea2boslCBFA
	axnfDWLgyk2wwlf7gGhEmvkOToFC73EljlHBx3KjnHYxK8UC74ERoOa7XTEufpul
	Vk6YttkFzMWS7YubA+o9rJgzNnhGTudzVvU1OkIX8orxf5+5J2MASiud8gvNF9uV
	3kcMbg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx5mwcas4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 03:20:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso4447792eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 20:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790565626; x=1791170426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c4wGkX0ICnaMs4uJdvDonWd+721HAcvQUBVA36Y5520=;
        b=i1SFbRB05wERmITlADd6kKFzuiO46GtzRTf8g/SCf/v9t9gtgT7BkWaU93s6h7uKdR
         4oP6cfC1bbL628ldKmVhoMdcU9yuUJyXY5VoDD4gMq0eZ4yjDmuxRBznHoAUoioJ4nye
         zhE9FMstVIDHWgkO7RiBQ40HF4gkTBHAcZEXv9fGJNYpK67KGDvdD6SHgC6qIpyksD6X
         r9jFChwGF/KDOnhP6rp4u/ndxYwFTzuvR01J9QE79fzyiBMZaTwJWE5srMA6NdBg2AVJ
         KqWCRQYmqfigbBPwKu5691GdOWd1pd0KD5VWtSbvv2rPQgyYouNp7u2toe/Mosvnooxd
         aG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790565626; x=1791170426;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c4wGkX0ICnaMs4uJdvDonWd+721HAcvQUBVA36Y5520=;
        b=EX7ssjzzFZPHUvCADDeY69RrtQfTmVve7oDTHqY2sNB4m1WpMPPc06Me7usQczJxV6
         cWovxI6xuKQ8vr+VLt/DeeG4/zqXRh0PJNtkWAbtL+VQ0JxlQtcT8bbTgmawLmQjvW7d
         AIm2uBMSNiJ79e/OFbzY/veW4APYn6flu4zXzFTEytzZUlKOtbRHA/Wa1nIVjcK2pfVA
         yT7wOk+w4aTxU5vxAzExI/33QW6xQuW7b8MYmFEOzW5X2cvTBNBFsCPXGlXBz5zq1zYE
         2XepXOprb42jLodXwAcK69zwVaw5H6O4mMAUCSjPbg8bJ7DdaBP8ghty0S2X/5mD4YhB
         pH6A==
X-Gm-Message-State: AFq9FYL8oyZ9mc96bdRp9QGla5B2QPNVtVO0sGwqyRk+208LEIReIWkn
	iPwiwRZr8+r1SGi5xxLmFhiHJkRNCB5zu6FVQ/T1DvAriHToTiI1y1YYI8O2KgKX/lEkpwWzX6q
	ViXkCMOjMkZSkvsArHNCS91k2lENdZUY7u4kg/7wBRM2jMDTtbeKr/8nNPkm/rOedqr7Q
X-Gm-Gg: AYBFou1B1gDrOlU92NVzicjAk5M5Dt2u6ANeotIiKVhM80AwFtrDzNuymAcr2WHRxUb
	ts00gosHZXOITXl/TzLwOincun8XpB8W1IEY6D3fb0zAB5+Y+DHOGoVPzJE8ohkUFH+6K+YH3k9
	pus2/IGC0oQ6m6u7hLtzrCGpEWj2xmcKwFcmCI2CQ/XiklU/kNSpIEeoLPT2C5CGR2jlW+jxbg/
	I1U/tK9Ct/EdPb4yOGz3Ny0IaZ5TOGSid1gk8siOBYc77wsqs7VEqdbbah4E0gHgAxbmzoJ3HaE
	ndFQrCnCDQkrjkLySaa6+PDmHPMgalJ6ML3Wcn8V27XOaPACGFLDO5oNToEwbgVtp5TOZKMtWMX
	kO5wKkwykeqolzoCKY+F5kV/gvOUoy3QJKMrUI/lAqLQI/3cwyaw5
X-Received: by 2002:a05:7022:7f19:b0:147:cd15:3e2 with SMTP id a92af1059eb24-147cd150a91mr6364658c88.4.1790565624740;
        Sun, 27 Sep 2026 20:20:24 -0700 (PDT)
X-Received: by 2002:a05:7022:7f19:b0:147:cd15:3e2 with SMTP id a92af1059eb24-147cd150a91mr6364636c88.4.1790565624179;
        Sun, 27 Sep 2026 20:20:24 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c0ccsm21235372c88.4.2026.09.27.20.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 20:20:23 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/2] dt-bindings: arm: qcom: Add Advantech SOM-DB5830
Date: Mon, 28 Sep 2026 11:18:48 +0800
Message-ID: <20260928-b4-hamoa-come-v5-v5-1-05940cdca85b@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928-b4-hamoa-come-v5-v5-0-05940cdca85b@oss.qualcomm.com>
References: <20260928-b4-hamoa-come-v5-v5-0-05940cdca85b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: B1WjeK1AGKqsdX4zH84KDnLvHIzaR3fM
X-Authority-Analysis: v=2.4 cv=QvPLTlyd c=1 sm=1 tr=0 ts=6ab9dcfa cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JItYRnRW4wSoxD4qVAwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: B1WjeK1AGKqsdX4zH84KDnLvHIzaR3fM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX1WDtr/QjvBxK
 QctmCoB4q0k92hcmoyYjM7dK08LQ8edk6mChHcsPT7BcKgEoPgbucFvgLtbGbp8x3joQU7zRTly
 hnvwvIk62zIO/YJZbApbc2Mbwwh418O8BZ+VV1tUlUKei+HeYYu508iGyRC7K7W/cl3dFZeticT
 /WkW/osGG7njVzwXKELxLOlGjtX1so1Uc6SkpfZGhJaFQc0YW7LncdIJwzTn8aZaMu0nxDvaGtf
 q2rEnjh1bLYPGc0bBME5UtMhLJ749l63BnnQvu5klpBAsUnuby28JloNcldo+t4KtoDM7lh08Uc
 YmJjKWceUYO4/3QeGjNK8eA7cGGvByXQTmxcg1yee5d/NSmCvjf+Yx35aZCHznfD2bKwLGZQ1R+
 H5VdQheeFOAzDJewzW9BsWtKLKAe9bCwRNXBTP5eF62WfjskBjmafi8IurbjBJA0EWtNWcJqJWa
 n/VtVQzI5RbQ/8d9MJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX3A7CDHrnlO07
 IgnAStsqAhH1AelT703M94Pm6BRXxFcjCGiPzv3lk57zu6fAgbgNEaf52P1enHZukAV8/E+E6cl
 jXkovf5Dg19BoOSakuc5fLvaDHXUP0Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280013

Document the device tree binding for the Advantech SOM-DB5830 board based
on the Qualcomm X1E80100 SoC.

The platform consists of an Advantech SOM-6820 system-on-module (SoM)
mounted on an Advantech SOM-DB5830 carrier board. The SOM integrates an
IQ X7181 EVK SiP containing the Qualcomm X1E80100 SoC and its supporting
components.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index e6b123ad58c7..3ede967f23ea 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1239,6 +1239,13 @@ properties:
           - const: qcom,hamoa-iot-som
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - advantech,som-db5830
+          - const: advantech,som-6820
+          - const: qcom,iq-x7181-evk-som
+          - const: qcom,x1e80100
+
       - items:
           - const: microsoft,denali-oled
           - const: microsoft,denali

-- 
2.43.0
