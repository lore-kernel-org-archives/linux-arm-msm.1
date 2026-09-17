Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA2B3845B0
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 02:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611378; cv=none; b=ZYiLj+FoLYLaLfa2AlpVKTGddltxWNaK5+08Tq/bHT7XeouqM8o/k8CmTzN7eKrrBGC7pq1ajVxOw9x/eSJIwLpS6+mGJKe/ysUOooEOFnGRAaxgkIGl9wsvE7wBch4cZ/UenxJjELnTS4mJfqwJsDl2FXToMdG6z7rQEi1ow88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611378; c=relaxed/simple;
	bh=2W5RObKszArgoD/A87TmkLDGOjvuwEXcOAx0z60Pp+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ke690WVHN4EpdTvl/u+bBqQMBgxdOxa2Te1OX8xkQGoG46Xs37b5wR5AyPL1IOCLj70D1zMb+z44+VyCD/8NHAHGDmyrEaLSmC86gYJFhJSoHELBoT1ysObiaiX7YYJik+V3I88E76Rus5H28pIK8/VNdgfooeRt4l4zYectnvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BBuWnxio; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/45cdoE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BBuWnxio";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/45cdoE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GMHeWP1855016
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 02:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U+25ut/u/ktG52cH9j/Y9VE3SglkY0dcyP6JoqO5Rao=; b=BBuWnxiotT+QOb1X
	u/orUgxKluow1+AyYeSCXRdW8zYPbgmSd/oJDkJlk6/NaNJax6PsY+hPz64e1egL
	c0OqLl9kqMEplYejF0lnn9HfUS4DKxkTsme5dxfMfYUmTxiwEwS7lNTC9y15Q5/+
	cFIUL+pzjjji4RAgHQ5G1+WSYFBq7ZiBPlROJCHr7h7JCZBrLKj6rYG+P9K/Fv9W
	T4fgNv/qfG6Lv/QhchRuADp7dAsiAoURb7lz3OiqSQD/fIdIrTRJ25wfKZAJ1chj
	rfJi0PZmWdi/tyOIqhaUmn2TPCWDhRGPIWfDWNJE6a6g6bM87to1eo8hoHdT+6TK
	HtiUtA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3v66b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 02:16:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4e496e5c3so267739a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 19:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789611375; x=1790216175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+25ut/u/ktG52cH9j/Y9VE3SglkY0dcyP6JoqO5Rao=;
        b=j/45cdoESpZSFZQPV41HW+XuJ159fAAvR8fUKAsfJIQw38bs1DmwFYuk5P2hHjLHgG
         qFyoFhkp12l/+rI6J02iOZLUW/zQOClcEpBmmQoRhsD9Gt6iLl7pHOcgtaxlXMAgObCo
         5UwI+DZGTYEa6b5ipwbJZKqEPKNOfjNXWJb50omQTir4ADTq76Nuf+vB78+5vvGdCj9R
         hTjplPY/90KU4YQXkGiIkzn3YmKZM5/NkwPMal4Yj6hbm6sVVq1EobkOWSvHPZNOzPvQ
         fLbX9EOyANT41QZxXOuXSCjfUaES7Osg3pEgHNNg5qshb8hGhJMHop9A089Wwr8zrxmY
         W7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611375; x=1790216175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+25ut/u/ktG52cH9j/Y9VE3SglkY0dcyP6JoqO5Rao=;
        b=lB1HPEmLanNP3doL1i8me6ciVAKmYOzUS9FvucADM8hufWcAmuqssR+bwYuOueGO5J
         EQ/KfY0jRnPSlYtybAK3RcTNHxdMipIi4wvK9Y+q/9CvjrJCFJxf00mX5TX06+gVBO6y
         VUXhMiJyTnwYpz5g5Nj/rxAzuLW7YfhSsqe48+Q1TUIqTz5aPaO1e5F8dIEwLQTaRJqk
         ncxfU2oKerNXzuw/CVHOxsqFtbEVV6GNYY/Sa5w72OwPAKKQ1NHtJXHDnPM4v3tZlXP5
         ca7ylEQJ//DutQDANgpCwubZ0U/PAUGQxS0hGhlwsPbB6/vDqrkzH+O0YTAQ7lyoJ62J
         kJPQ==
X-Forwarded-Encrypted: i=1; AKwUvByNv46oORBjM/sDsgb9Grd/77KkrCbcv5C6svX8wEJfUgP3gfdhuwtDfBgxdW5AYZhaZMxli9UuumjfSoxD@vger.kernel.org
X-Gm-Message-State: AFuF++njK++dMJga7h6oHA484K/+7UxNrBjt37eihQ+OnB570BFQC4Wl
	Q2ebx9n3Hio5Mjq5jKdS/DQ4elpBA/RVYk07GHVRlSFPwCItny/qjA0qpI57F1mvArxhm3sLSjz
	R1A81EZwcsaOLfxT9d0FmmXrNAPgQBSqlPvUStR5X7VguywiEK8Up+nVx8wPBYk/f3DZCzfNJYO
	ID
X-Gm-Gg: AYBFou2OCWjtjKKgBqO4r9bmxoWEPeZlTWdRFb+LogBA4G5lXf/7KcwRAfCDrTksKVd
	EzwI7n+KzLI1/0VKsyBcOfqV/pGLnl0tTyiJ85WuDeenOy5dLOJrGR9ddMU9y8Rh84WMCAQvqVl
	AB8Oq824kT9K6o0jjQSkcFIv9Rnc0AIBqcWqADiw2LAyYtzTayqovbE3Z2lm7t64ZQ5ck3VyRQU
	1pJckg+uD34WcR94idqs1q1wPZZZAkla+O7AKFVQ8cLbBZ3B9MA+eVC98V0XFl57JIfaQ4jRTSH
	wrfeLHritP5mUG/MN9m66drhyQh3KvyQLryL3Ygs7WPmv9mYhpXw3QkXJ8SRFov6kv1+ptQttPX
	nsC5ND+nen7FDNIMN+VXQ8s44U0ucmAFxHUPt
X-Received: by 2002:a05:6a21:4d0c:b0:3d3:b00a:6f03 with SMTP id adf61e73a8af0-3dd5f7dac4dmr13014921637.28.1789611375523;
        Wed, 16 Sep 2026 19:16:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d0c:b0:3d3:b00a:6f03 with SMTP id adf61e73a8af0-3dd5f7dac4dmr13014876637.28.1789611375102;
        Wed, 16 Sep 2026 19:16:15 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm14372881eec.2.2026.09.16.19.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:16:14 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 07:45:32 +0530
Subject: [PATCH v3 v3 1/5] ASoC: dt-bindings: qcom: Add Shikra RX and VA
 macro codecs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-add_shikra_support-v3-1-fc0e79c341aa@oss.qualcomm.com>
References: <20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com>
In-Reply-To: <20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789611365; l=2699;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=2W5RObKszArgoD/A87TmkLDGOjvuwEXcOAx0z60Pp+k=;
 b=wKNHIkmZJI741JO5dQr0bnQahikCmBI1jV4CAGTzQQk2lWYuHtnUCpVXmfHE6NRc6cZyyQLqs
 HL499LhxNMpCO19uK9PC8xM8oneJFmDJqplXxDfk0zTjL5Lqk4aLbCU
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfXypzB26BRWqNh
 gec+eSOVHZzW47OC87qkN5npWzfo7yha4/ImPX3TDSW0nrY4hmuFdk09FSx7J6Pfdp+WOCPStRE
 K6cmpb1X6rZ+fChHuuvgnDm86QRlmMRqE6AV8rbWI6XQof0idD9lo4pS87R3+MrJJ8r3S0iDKWz
 h2rSFx1dP7ufdqgpuZY0ZwkDq/oSOZ6cvRJkGWViF06gel8de4HlRtoX7Y1F7pRW7QpPoUAVIuH
 El3SbxvMYmz+qhWHO6kQwSCFoZGTf/Vglr3adgOw/eDArIAFTEWabzZG+AC7PacYP0eIzRI6MmQ
 UkjQe4/ZWvFYj0lUqtqerqJGZ0/mdg7m4XwzbjFNdjMmeoN5sd7TD8YqbS+vtIg9yI4zTwaACbP
 7CyfMoIp3P9GGCPwTEoRt05RTjUyIJbT4QNBf3xRsPZ/v3c44BU0ZGeQ/awvWHONuUQhHyLjOEa
 Q+GibpTRRAzgKokIhzg==
X-Proofpoint-GUID: D_L6N0UJlbXKLNxkqd7nyENh-Kt68ZxM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfX4bsmCfnsqYUd
 RkBOawt/qz5ocd32hC/Pe2jd0vOe/i7/2Aafkhi33S0lhMpLiUdT2TbbicGkLodS/kn4v9EAW+F
 G+S1WGahG23x2orqtnOrscNewPon0zo=
X-Proofpoint-ORIG-GUID: D_L6N0UJlbXKLNxkqd7nyENh-Kt68ZxM
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aab4d70 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=cvJDH5HnDjnG4tsKpogA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170029

Document compatibles for Qualcomm shikra rx and va macro codecs.
This SoC does not provide macro and dcodec clock so reflect that in
the bindings.

Shikra integrates LPASS codec version 4.1, which is not backwards
compatible with the already described compatibles.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 17 +++++++++++++++++
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 4988e7ed6..69d7b7332 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-rx-macro
+          - qcom,shikra-lpass-rx-macro
           - qcom,sm6115-lpass-rx-macro
           - qcom,sm8250-lpass-rx-macro
           - qcom,sm8450-lpass-rx-macro
@@ -138,6 +139,22 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index aea31fbda..683ebf702 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-va-macro
+          - qcom,shikra-lpass-va-macro
           - qcom,sm6115-lpass-va-macro
           - qcom,sm8250-lpass-va-macro
           - qcom,sm8450-lpass-va-macro
@@ -168,6 +169,22 @@ allOf:
             - const: macro
             - const: dcodec
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,shikra-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

