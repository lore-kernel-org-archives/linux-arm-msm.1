Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783291;
	b=Kt16R0gWDqhbfcQ91kvHnqW5/IgImAHAlHund7C6WSA+GNBs+6R7DywOUUOsKtrBD06c
	 3ZG/sIhcTwUTnUNixwdYiGdDnn6icJFOMl0sWiVnFJOhl/+vLrhewRM0l3UjPTqb9a4Ld
	 W98UqE5B7INWqTaMdvM/srOzFK9exD87Se+ZDcIlxkfQHgTFiwSsoR9fQUp02PnjT9By1
	 jW4IDm9vR8e6IoXwIOhPXotD1gKQhmZQ9ES6tRMohkGg+/lsfNq/DiQZ//SVv0s4IpgXy
	 4OCnET+DjKi4Ar0fhwXtXEQLJ0CeLU6xLRfSvjAW+mJH2k6L7Y0e3s5armJTGzYEdjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783291;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lLNvy67hh/zUuo17cSVaBEwBaP+1fyl5N0OjhghBW3c=;
	b=YHmoc2vm0+YPOtSxHW6rsxMFNT6/1BkQT5FbjNBYnrILvDBh1AsXzce6984PvWxTXQr3
	 xcPtxhRZareNDOxN0nIuQJIW2Rf9nrFhdR+SiQOlRg0UCN+XAdVHwOWbw1t+tnruzOjZo
	 LRIyqcb3bN/cLJidpAxfmHaHXwVbQwQLPzhNAub5JS1WGOnPHLbWX8fEpfOqx7b6j9LEB
	 JqnLFExzTjOcdGrYQ6vC8sj/TbbSP2qCGT8Qj52R4GGDk6gkX9OJ2zu98fgLKHSN/VyoG
	 289fV9tSOW4b7AWfCTRwP7dWzwQ+LjAbpX/DR39l6MOFmQBljvQggLdWX3927oWyMtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pDhZGywj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OdnmxYvz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A75606A33D
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 09:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74A75606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pDhZGywj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OdnmxYvz
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KfD01263935
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 09:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lLNvy67hh/zUuo17cSVaBEwBaP+1fyl5N0OjhghBW3c=; b=pDhZGywjgW3e1zOK
	J/lyr6z0qNgXUy395nv/t9Xt8E+cHb+ABeGYOkSGVdt2vSOAiOq2xcq5+rZ5ZaT6
	UHNnUeF0B3EKawm3aGNUfW5Q11t3YxIbGJ2N+uDRZT9r7yRL49Ixc+lA0GymSkC7
	jTx8gbczrl9ZtQvTZAPUENVwKMiPdO1cHOV5PAya2sMJ3iP/iaAhCcJOCxKPXG51
	8HdA7VKT3anjLQSuCDskXkl0QxQVaM+UQZskIsunqwPJ2qVjB1BX+Rog4EjkEiOg
	7ImssSZMdEbnNMNFNS0+/00NY/mw1XJxiYDeOIQSkGKXQhDM9gU6GQ3F1vaAwcjR
	gJMW5A==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubkthq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 09:08:10 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-85d630e451aso665315a34.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 01:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793783290; x=1794388090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lLNvy67hh/zUuo17cSVaBEwBaP+1fyl5N0OjhghBW3c=;
        b=OdnmxYvzpEH7RKSpXx46xMBxc8hmMayzUiuhINcg2t1/gTcjxo6sIjitLBEvSGOPHj
         a2UmL95PEecZkrhY3UYsfMBKnI+macbjwZ8rDNFL2XYtOvjiPqnzcnnGELXvGlTgc8/2
         cyLnimShNGXCrE2x10tsqIdWnq5fYPCTGMWr38lswHUoN5IkNe+JU4j5ilugqdNJSCl9
         tNGbQNr+VS7U8+dk46+g1auZVpQUA16dVMyklFvDFVpS+m2DDp/GUYXzizhhx4rhMqbI
         bmRr1ZBSJ0zZVHf9orp+c1MP8Y1Ze8SAM0ARt17OmWprwtCDFeWVIulntj0tkHaGX5Dw
         06pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783290; x=1794388090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lLNvy67hh/zUuo17cSVaBEwBaP+1fyl5N0OjhghBW3c=;
        b=q9MAVpiOGffs8OfOdzq1xq15GDQ3TOFiTolvlhAs/lsCVl/U2qJ0S0hvtsQtUSNcmK
         fIFKdCVRlckloWzbq4HX0cc5RNP4Mc5at1znX2SRMWKhZFzUN8sXvrBZvEk4/B/mWF31
         GcAC7RRUIOeczHGkAogWPopXTM4S9wTpqGx8hF6UwQN3ZoauOZIDB/3oTErEMd5EwzVZ
         8ba+N74LVN0QG2VbeM4/YqIvpDz1cCC5YQoYuyDyUy1LooWoAS/TtwcfH31p8iImJfeT
         Nx89/ta5/CIdHvOby7rwLQxmeBq4Dz9cu3B1dk0z8ej0mvcnzye+8+t5vrHmEM+nKeOE
         YxBQ==
X-Gm-Message-State: APuU4Z/NXD7FFltK1Ib6QAMvfvMGHZHSeRXPJgimSczi7SKmTCf1zaOt
	ub88ImeAO2NSotCuouffmPOWjdrLMo7HOkrUYfCu1l92uE28LOLvI+xZlQv/RDHNVJbZcSUBE03
	qYzsM0O1PK2W6fsfQSDl5Si+F6SchFf8y0YtU2Ld4iYWxgaUBOgp5exF//Od+ED7NFtOo
X-Gm-Gg: AYBFou02htd/uh4zVxgnDm5UhyFXc8MNtEwS5iUFNB5uR2GssQYqk6dcViItKfl64bD
	bYvgAjAwvx+shf6yTA+UbNyIv+2pj+BOwuasRgzqy96WM/ydAffTwf6su5V0QnRBKCbNc473gyp
	wt5zsmgKb8POo4taMZx+IJFUHNdNlMLqKksvNsVYdNEEY7MDZVN4txNa2Mwvr0BFEKJO7XMRxSf
	X3/aEYQBM3yMNMuqSFRfUkJOJW3RT8bKsjftlXPvVnGsKEGySKzlvQkMUm/6BrTfk1vML8wgNeZ
	GPqIv6rZIlCbU2KTb1A1FqbEy4MF/QuPl5esAy3b+gwvrTTywAE9biUPMoVbQuwmU+u61zoPe2E
	xVuLl/TzD9kkozpSO5pXsI5PT78UAu4p2zxONU3jBrfrk8kK6X3WdPHIQXGHQO4IxPjKbA/T0CZ
	ysitcY8Wa1L5PwCUmbIfQ=
X-Received: by 2002:a05:6820:83d8:10b0:6d8:1b5b:3a74 with SMTP id 006d021491bc7-714f24fa260mr6089206eaf.8.1793783289679;
        Wed, 04 Nov 2026 01:08:09 -0800 (PST)
X-Received: by 2002:a05:6820:83d8:10b0:6d8:1b5b:3a74 with SMTP id 006d021491bc7-714f24fa260mr6089177eaf.8.1793783289178;
        Wed, 04 Nov 2026 01:08:09 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3d768c8sm1519846a34.8.2026.11.04.01.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:08:08 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 01:08:00 -0800
Subject: [PATCH v4 1/3] dt-bindings: phy: sc8280xp-qmp-pcie: Add
 vdda-refgen supply for Glymur
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-phyrefgen_1104-v4-1-ba508fc6ab40@oss.qualcomm.com>
References: <20261104-phyrefgen_1104-v4-0-ba508fc6ab40@oss.qualcomm.com>
In-Reply-To: <20261104-phyrefgen_1104-v4-0-ba508fc6ab40@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793783286; l=1801;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=b92G5NczVP+u6lrMXts0b8MbJ4fUEmJ5769gnZJqg/U=;
 b=Gxv+gaan867+UwoYMh4j8LOZPhDAiDGdwJjc0Nl7Ek5ojWemHz7/FbNeO0KGJ5PqK66Twnqsy
 lE0fE8ukzNaAYc3ggC2LyVdt8uxWo3WL/2KDX7TMWIutzuQT7HxAGLl
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX7jqWsgElXTej
 IVq0lDZEbs5nH6/nERLheAZd5qLPY+L/boauhfB1+0HbtwJPMLlOCCzEVgILRVhJzQF/QgwzUin
 eXCt35Kz2CJa0o382qAMah8Pf8BIKmY=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aeaf5fa cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=neprlRFrkYi1VxbfstQA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: MP5Vw0U5rDWgiIgB7h17dsHbK0R6SW4D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfXxuLpnVmkImCS
 reN4MimUMcIJlMjHjVYFRrEvgeH8y1JHEMiAN3DayU/LMcyV/scMDMS8dPx2QNha2uMgESbvdju
 iWg+KSBZ13lrG7FhJErrpNaw0R6MggGxuFvTKYVW7i+LZjz3yidcVvWhFquO1yP6owfFOIUCCQn
 SFvb2qmWU/jHO4e1KqnerfmLmY5VtHXpun4TmrlwqSPJtiL5STFOxbxYolF/oEqDg46I75fF3Jm
 LczuQFaYFNrrfVoanbEf+1kFPkte89eo08U5bH1bYdC6BtRpMzQJFSGISyCEBwWf51oyu6ZH8e7
 swqadQyl1+ZotzVcxZYZLSRFTQ7OejrNoe3+UvtuVcKEG7ExcGZmaS0iSBq9iy1rg5Np0B83Na5
 AidKdxVYGeOin2kEkxC5C7BvKKayEsV+vsuZN91W2VchVIGn+TPmFfbZLW4gBnEFHtNfq5b/NZI
 BT0MyYeIg6mThMHeW6Q==
X-Proofpoint-ORIG-GUID: MP5Vw0U5rDWgiIgB7h17dsHbK0R6SW4D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040036

The PCIe QMP PHYs require a stable reference voltage provided by REFGEN,
which in turn requires two separate LDOs to operate. Without these
supplies, the PCIe PHY cannot work properly.

Add vdda-refgen0p9-supply and vdda-refgen1p2-supply properties. Mark them
as required for the Glymur PCIe QMP PHYs for now, even though it breaks
ABI; other platforms having the same requirement can be added later.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index c0a3e1f160ad..f827abaf22ef 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -104,6 +104,10 @@ properties:
 
   vdda-qref-supply: true
 
+  vdda-refgen0p9-supply: true
+
+  vdda-refgen1p2-supply: true
+
   qcom,4ln-config-sel:
     description: PCIe 4-lane configuration
     $ref: /schemas/types.yaml#/definitions/phandle-array
@@ -280,6 +284,18 @@ allOf:
         "#clock-cells":
           const: 0
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-qmp-gen4x2-pcie-phy
+              - qcom,glymur-qmp-gen5x4-pcie-phy
+    then:
+      required:
+        - vdda-refgen0p9-supply
+        - vdda-refgen1p2-supply
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>

-- 
2.34.1

