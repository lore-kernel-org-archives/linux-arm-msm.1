Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4228138AC8A
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 06:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936065; cv=none; b=N2lM6jSDtLZphny6ow1fQ5gIfCtRMA0A0/q2zmOHf83lK8nSSCx0INtzOsL9XgNgFqWF99mLFmfr+VwDVzQAtWcf65nf9qtQlZujQOEZNSZuAy7Tukq1xGVpPjif5frXXn6k2m6H3rCUWijWTCEnQFrTaudDYYmnoOHNyIuVsa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936065; c=relaxed/simple;
	bh=ZDD8e5cb2nzlKkKmXRB9tCCsfoL3tM0k7wriTB9DaNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZgxIWK3QKKKLRn9Xe7OFVEo/OUC/fmK8vP5aEAysqQPStUdBMAQV8S0Yx9hlVuG7KGHTbHD7FO05WTh/5LiFcAfp/CWeSEtd7dtHm/EQFLKKUPZ/YbbvK8wu6/oSjkmW2dA47pIrGcFLXozR+WFnjbHyUOi/n72nyaSe2JLm15o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XYGJU6a4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EMQ36ep1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XYGJU6a4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EMQ36ep1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6895offY1274513
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 06:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AeSGQAPVLrlZr0hwvPp0CjvRRP0EoCSxDxy776SmHPs=; b=XYGJU6a4LAcHjz0I
	UsKnzuuYNlE62AsNSnoh0fpqtnl81d6yYFHH3jvWq2fSaarYsM42go5EUomKqhhp
	J98ALZjW7bw/ruGiwoi3eMV1vIaS0TyDiFozC9HAGtnNejcTIQJahiXL1mx+OREc
	lmXnEZcfUyTtk1mi3I+RUkj+zMkEs8cGeALMFZHRKyZNl/XFCkerVei6TEaiqB6/
	zuqD1qoWjC864K/kCRlFAmTfKppkmT5S28N+02GS8EXMwAkT9O3IAw4It6DV3COz
	b5ALU//CMtQ5hfW7MfpELYNHjuz8si75slmxEofH9KbjKR7/DDlsch9bB3xAFkXU
	1jNNfQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqdw2npy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 06:41:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc18ced1a5aso9189242a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 23:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788936063; x=1789540863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AeSGQAPVLrlZr0hwvPp0CjvRRP0EoCSxDxy776SmHPs=;
        b=EMQ36ep1GJ6fFEdU/R2qj45PDdcAfUVQD0jZi6fJCMcY+JmvY0BP4wH1cJQER/9aX+
         fdQ/wiim1Ar+jqA2S4CwAMfiXq9ypLg58ZVN3FMqlKCIgMlkCl4o6fWEOor+MPfvGl1u
         DKq52T5pcjL9zeK5oafSprovkmPRCB51Ex5J1qVujRvz8HCn0iNSTMhHduxxcLixOK5t
         ar1pd4u5T5AedRXjKOui8Ll61sWH/wJdxRr0JUmRIy57MPlIyVGQwL9pRHA3F2lXdJFR
         dkS2uBUc7mMrfRIxL8j3GVx3nwKjWrXykk2h+dK5TePzZIwWIX2936ZCWRgehvK2zTkj
         Upbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936063; x=1789540863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AeSGQAPVLrlZr0hwvPp0CjvRRP0EoCSxDxy776SmHPs=;
        b=I1Jm1gEMAlyxLzus4LheT+4mToLJwqCzF+5ZTQxhdk3dK9ms7UwKEM+x9jS7mhMOaQ
         WJ8dgtYFafnHjhXAk2CV3UXRdckHEnSZ51BBPG2mW7gq6Lx0ROEP7C3VBcSKjqMdULsu
         FO4AunMKdL6Qtpb7MUal5+t+FC1c4d6o9XALJYK2we5VP3FBrBC2cRM+cbZMqOpSW0WH
         yM/yk4w/aQuDYRtPtKNv1l8VO0MMcbzCtP2vhohW03tpnXjMed0ONpz7B64MQ8qo4C1Q
         sGc95zb44ZDVOCQqsRvSrF65NTvyD2xVYOW2eaWiX/b6jdXmIywqCtsi7Ns80miMcHb/
         KVJQ==
X-Forwarded-Encrypted: i=1; AKwUvByYenlDCnMm4tEVrCYsyGo1k0KcOGI/GQ8o1y9lcDwkW1xNEGqAxT16jOw3vC05WWCkNpYY9CGnOoFseoOk@vger.kernel.org
X-Gm-Message-State: AFuF++l+uO88/WqWK2Hwwbaxu0oBZIP78LhbFxV/SAAuocyof0dYbhFu
	opIoEBXlNidxQdWzB2QL+vXPiPj0PFmEkhGHrtr7fZEQajJH1mGgRcwiDaGq0S+yu3eAovyuqMG
	7pGB3c/cztIQpsBC5gTq71HaVA+TwJJLFld5X0ZGtuZJY5vzFZ8D5UmABtdsQUSYs1BK7
X-Gm-Gg: AYBFou1nhsVFxEMbws9/2PZm5cvV+jce+xTUkxurSVDntvhM1u/Uy+3uMT+HWjwzwGA
	btDwJeQpIuoDZxSkB3XGw/DpqP/BxeD2i7+QUaMZRH5yspprqkccKulbVV2C/kI7jX15+tFjhu7
	yPU3YfVlrObkcMqpKazKw9IsRb1UahJ6b/eOZ5zGYKVKc6KhwjwrjrrWXrsJxYWiHyDU72ZSer6
	eAnuz46gZgfvKrHELbldLVStscI8tGkSgUyhdIu/ivY+Ja3EYyETdvj6qtdBKBmGIkvKqtjzMXp
	Ei/iwBy/mnJ402MTZXI8K0iL76NXI1/VPrnxif6KtRi1NaGJ9ewRwTrHUsCaqKYUWbthS8stL/T
	WlqrxkOSFQqlWWLUgr5WdZvjxuWC2msEFtQSzAnUA5Q78wSWv5/TayUj5m6rcj88T
X-Received: by 2002:a05:6a20:5481:b0:3d3:ae50:97ce with SMTP id adf61e73a8af0-3da3a217562mr53694311637.27.1788936062849;
        Tue, 08 Sep 2026 23:41:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:5481:b0:3d3:ae50:97ce with SMTP id adf61e73a8af0-3da3a217562mr53694235637.27.1788936062401;
        Tue, 08 Sep 2026 23:41:02 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm35553014eec.4.2026.09.08.23.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:41:00 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 23:40:52 -0700
Subject: [PATCH v3 1/4] dt-bindings: arm: qcom: Add Glymur QCB
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-glymur-qcb-v3-1-c194c0219218@oss.qualcomm.com>
References: <20260908-glymur-qcb-v3-0-c194c0219218@oss.qualcomm.com>
In-Reply-To: <20260908-glymur-qcb-v3-0-c194c0219218@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788936058; l=909;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=ZDD8e5cb2nzlKkKmXRB9tCCsfoL3tM0k7wriTB9DaNI=;
 b=atVYK05J8vuorqfBqsEN/lB0KWJshPJr6XHdiNXX60caF5RIceZSuPiW+FTNhaB1rAeWVHD1C
 IQPkFPjrBf8ACu2idPqxXv3u6lqII4Jp1V9gPxzuTvBzsPVQvcrg3mF
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: PHepTP68pP-FYt-MOeqbXR1Q1F1-aISs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA3MyBTYWx0ZWRfX/WtHctlRwSAf
 k+YBmnZoVpDpN0s/50wOiOEH/TwZeBPUr1dThaM/sG0aaMnGS6nYy2Dp0+J2VYaUf2FG8pLY8mo
 UiAK7KTc+qXMYQV9FACGwDg/eIuYR44=
X-Proofpoint-GUID: PHepTP68pP-FYt-MOeqbXR1Q1F1-aISs
X-Authority-Analysis: v=2.4 cv=Bo2tB4X5 c=1 sm=1 tr=0 ts=6aa0ff7f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=iJpXY_SJv0JvkxessLMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA3MyBTYWx0ZWRfXwU1Jp6j0UHc2
 goTJ6jsTHdR226X5Q9rKV1Omdr24fLoupl4CQoNZW2S1MtAOMQkTlAdJ8N5ATc2lY+qZfmJWKtQ
 l7R9GU/liWy/6dTP71t7zny2Lx/7JmoWjvZUWwo9JPLo4PU+Z8c23RUpTip5LoQuRfhh2mkfBdF
 aBxLr+LSMkTw4U4KvisRnMitNU8NuygI6E75mfPn8DB7CQf2XRbjJVRfiaxLJxJ/I+VHHsTIJ9W
 lydoL+DQ1U0+JmOSmvB82DlrXS8LFdswdfW8tsPF0MY7i2rs6a116hc8opENCsElCHcXjzqXARS
 j8xTpfbxWF5ZtSRrV70HyEern91ZNauz+a/GdzJV5ur1LMgup5zhs1X03g8yfQHss80UXz6IN1m
 o0n7ZZrVu183cDWImwGITyhZ6wuYUTrtsJd3Xnw927DWg44jcSIcaYX3Epmkj3Rf2AvG8NWi1Ag
 uDQm3i4b1oMZlCj3exg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090073

Document the Glymur QCB (Qualcomm Compute Board) board id, an open
form-factor Glymur board intended for compute bring-up and power/signal
measurement.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5ccb571520d1..b34e4d974953 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -89,6 +89,7 @@ properties:
               - asus,zenbook-a16-ux3607oa
               - hp,elitebook-x-g2q
               - qcom,glymur-crd
+              - qcom,glymur-qcb
           - const: qcom,glymur
 
       - items:

-- 
2.34.1

