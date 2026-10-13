Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EB13EA977
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886635; cv=none; b=gbiLDUjj4/LCk6uXgzohISqq39FZz4tJvzFBWbI2+n7d5WAsLh6VnfqJqisLRmodsK5eNm/xi5tyv8LB9LNo08LPmPPCTywPHg0IH+oZAvoc4XHvNiQpBsVkIdEjoOkqmnbeeTryPqP7JKZUG1U/myuiEQqCUDN3p7tWskNOR1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886635; c=relaxed/simple;
	bh=HS/qHG1ys4GAFjcZw/lOrmC9aaejOkm0n6MjuWUf29o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WaZHLOapqb7IC3uiJCEfrUNHlpbOMi/R8kBeiLs0CZ3BK6UXRnB46iqvnwjbxoBeBhAea3q7zIsfs1UUv8HozgeIglCkA+NFZCdXFAWaJp+NCqRyUYsPSG4UElU12N54MmREhtaCnxDiBjyxvUrfyODMK7Hyfs1p/Lf/0G3BVKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QdNU+glv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJrFzNZ8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QdNU+glv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jJrFzNZ8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8RILj923086
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y0VtVTcJUFOCOxMQYqvfCfN50bwMzVe/VZPBcATXvjo=; b=QdNU+glvOPWrDDKx
	+HBbn2L6k8rhNlLZ0fDLzBJm/fa7i442UXidbGoa4KU1NY0pge15mGAJREC/XpYD
	KcdeNPtVYdqtsNjx4ff5OenbITDLqSj9EJSy4EaQl9S3XO/iiKhXv/hT6CBr0SqI
	8FLM5asPh6dDewCE8Kv8SNDUrWTxWHy/AXljjyhl61rWklemn8SzfDFk0Q2q1JxR
	LiZbWr4COXaWu77dJl8oswCT1eRQJn7Mdfcum/iVspd19SbspP73G7Y2Ig06HYg6
	/ARVNozs5eLefKzV7yWC4wzZoxb6lW2Fp/GxfaVWpbLSuN6mX3L0YmDNm+W2by7P
	JM1Nyw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1td9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:17:13 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb92868263so2010812a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886632; x=1792491432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y0VtVTcJUFOCOxMQYqvfCfN50bwMzVe/VZPBcATXvjo=;
        b=jJrFzNZ8jcSmi1DQTV86X2Vof6CZGjMus2ga8fSAyojBqc1InOBEgtvaIAh6IrquIo
         kBMoFluvk4EhY9xX/IYLuIskn4RIiWNI/bS4dWFYpy27P7VFGvruFa0xUAll8Vy5HBsy
         1TpGEZg+zRbqiLXCibs6s6QT3hOnW1AmI8niPvNqKc/q6QVPLBKpQQiFR8KFpv/PMjf3
         Uy8LL/Kyn60wlqhzWliG5Ekh2YRJOGWBSjiEcK/xiIwwdan5C4vKIZydbb5FRE/mQfvO
         tLkgeszktPWWXKV3+f1KR7aLMfCETyx0sW1E5aflVPYCyWNC+UhcCxdUHtT19gabe6zN
         12bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886632; x=1792491432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y0VtVTcJUFOCOxMQYqvfCfN50bwMzVe/VZPBcATXvjo=;
        b=1Iz8b7eibECYcDa3b9UO+qk6M8ylIbfEktOJzZNdj9cMrVNf7qwq3haIh7MUC+0NmH
         dMQnTwVJQa/gKVaFyi/4krEjxyrSK3H8nMF+JpZoiBqGb4vkXcNilTh6gIhYq9pAk1SL
         ZfiIGde0XTutD++pwDSNABw4bvfRDhnJCm8tqU9yrQE6s8H1Cl3qLaGbAm/AoR2tigu+
         NjpvO+Z2MYjzxlfWzghkf3Mo7YiIKel+s7FL018K1t9dKpn2lLhxrpYzWFY8gw/hf9gu
         XJ/iYzIe3Gp7WLK+T12ryUV7xqEBJn44zkveZJ8W4Wq2Y7RnBR4/3ovyxz4N+gB6Ud0g
         UzYQ==
X-Gm-Message-State: AFq9FYKa9JR5qqPFeISoIy6ftkVAYyG2XOzAgBvQQuuHzv+vNd9IYIWh
	NSTUxmB4SCTAhTSWHYpbjv0K0+aUwonrulnUcOy0PBfiNSdaNbcoW+UnVVCRbUfkN6Dhui7ypFH
	0Qba2z3dxB7cATWp3LdvRJaRktjywJYmpRaZwNvAVZfgCSYeQ52yxcapJkk0g8Qg5Qvh3RysdIS
	jp
X-Gm-Gg: AYBFou0TIrstAxTHZSTg6ELZanBO/s0k5TwrZnFKtlvPKP8bvzjtSXAtq17+kBVhls9
	EBPdupYwi8JU/Yu0UOYkrYxbYgIvJcgfYoQSpgMpYndgKM22KguYG2GVlwHoboLMW4H6JpZszXy
	y1qi0yiyiOf02RHWbYCv6f8fSFkiUqSa5v4JTfpo/zXdaZ94upAwXSfhTbecT5Zvy2S5Fo6awhy
	bXJnPH6ttvg/NrfqgR5d1on5Bukah5IZZmfLJmvHauYqTyC7d7SzefLdcv5RnN7hDOV/sqWWNx4
	O2obKLuhlVRGPwiO372O/OpWAsXQs1qiLr39TEQqJIl5XbUoeVbdahyJgoM2hcVocd9osUOjVSn
	kjxrDlPDDv/xtVzmA5eXTOwZWtdnyARJh3lXOUqaNfyrs5mE=
X-Received: by 2002:a05:6300:6bc8:10b0:3e1:9071:acb1 with SMTP id adf61e73a8af0-3e19071d79emr3697988637.89.1791886632417;
        Tue, 13 Oct 2026 03:17:12 -0700 (PDT)
X-Received: by 2002:a05:6300:6bc8:10b0:3e1:9071:acb1 with SMTP id adf61e73a8af0-3e19071d79emr3697953637.89.1791886631811;
        Tue, 13 Oct 2026 03:17:11 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd5dadd0986sm4186777a12.18.2026.10.13.03.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:17:11 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 03:16:45 -0700
Subject: [PATCH v3 1/3] dt-bindings: phy: sc8280xp-qmp-pcie: Add
 vdda-refgen supply for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-phy_refgen_1012-v3-1-f28305289499@oss.qualcomm.com>
References: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
In-Reply-To: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886628; l=1740;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=HS/qHG1ys4GAFjcZw/lOrmC9aaejOkm0n6MjuWUf29o=;
 b=cE/+x1bGz78TWOTImO0Py5TvqJyvE5p3icxE1EKEELmdUHGE26npzg5tBX7iGwXP3/k+o+0ub
 Y2in/SCUkknAQ/TurPuaKYyNcHWmMWRvFtaPaSPcnf0QYxrp9RXQStE
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6ace0529 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=neprlRFrkYi1VxbfstQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: SpUuFkvaDSVukbO5vQXZaVjKIiotfpVL
X-Proofpoint-ORIG-GUID: SpUuFkvaDSVukbO5vQXZaVjKIiotfpVL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX4NVYyGn7hr15
 9EmnrqXBPYR7dSmKPA0Ms7Q4gwXKRfWQlhuqDkZsgZ87K4f9yvjuBQz6+nnuODwXd0OcA3cCPfg
 jfRAdjfk2MNJwpCGNneXt6kKiSjsyT4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX4j5U/G1CpSeK
 az41oG/SEkrD07nwa7bEvq/kfX4COtqBeEfP+03msl5KcvATen4lKC5MqNOl3mCR0W2s3b1hIro
 +AEouGBZuDMKCletemzppIjfw0L7hZ4UANHwTw7dyhdvYcUID+L+I+Ylt8xa/nWUwQ0PmYkarxp
 gaztQXDqLrgpl/nDFStlQ0Eh6Q/hcXXHIoFw8UIcGQTzU0EmMACfx6nBrLx6j1Q/S8W/IsDW0eS
 hBKC12X3S+sIoNEh5G7cTZx39D+5ftjgxfdW8FeMAkFeu3pULreTfzAAtpjkR0mx5WLglRHhyXV
 vbM87bv8E4hyAFN0ZDRl9tkR1DNuD23k99O/5QCb4iffXBZp5rYCJhhfOyUw5WKiOVwoSNafcWf
 mIXd2oDzQ7k+EhMlq5/lt8JqAQLyaXKgq4br8s5TmihViZIffS8YswxuZfVmyo3uNLHm7dRuWvU
 hRPQSG/3/uWpUUNMNZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130040

The PCIe QMP PHYs require a stable reference voltage provided by REFGEN,
which in turn requires two separate LDOs to operate. Without these
supplies, the PCIe PHY cannot work properly.

Add vdda-refgen0p9-supply and vdda-refgen1p2-supply properties. Mark them
as required for the Glymur PCIe QMP PHYs for now, even though it breaks
ABI; other platforms having the same requirement can be added later.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

