Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C009D4570FF
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 10:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122609; cv=none; b=bTkQLBJ30BjIaA/u4SQyAoT97e2stOXM/J+UxlATU2G87pN5RwZ21OO2EU9CIqc9f00R/u4ISMpIz251sruO5DLpl0M+k1xzzGELELsqlQpUHH5pE40HqvSCgeMWovhyYjZzTiFWaByOnkiIb4t6G+qg4PjnCNgbpV3fE2knQ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122609; c=relaxed/simple;
	bh=OkF3pqNY5sBAsIguyZS7ydBERaknMe6JM23521127sE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p71N5JOEvdi6Org46H1BPKawdgRB2jMN1uTiooEAULOqyc2lbxxFBO2tOV3VxccFEjX2rBvF0vAhzecHAZuTgd95iPlRZv/x606gH0NQZSKSmkcHBEbxVBqxR/Ps8NATwRku7tYBAC3ZAJ445+Uk/Q2ZVBlg0CuCz2fYLM7wnkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3ZhNICD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HT7uK/zY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3ZhNICD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HT7uK/zY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kvoq2832840
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 10:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t5bFar5H27cJqwd2WNphcoVppq++/ChGc+WspNucP9M=; b=K3ZhNICDVGGt3Ja4
	3PifMTjl3NR1UemPKIR1cwfgJ28JuWrRTLjE7qBPv2d/vZPTtvJI0zXX1MA7gfAR
	HaEXXKvOrNBp/XSKVEiiM0LkNubr2u2YwyZ2kaHDfX9hNvLIR4eij++P2f2e4t4A
	0kWvZ2PAzmO3ipSVHWMZVUGP5zqg9RKNLasi4KIrHCqhdenLcrGX309HBczozJaO
	bROvySyf7VMj9wPFOnbgKgVDKd2Cxtq56PoJbUwdOONC4msWlZpKJct3H9iTBJ6b
	H5Z2wnzqRTnEyIW1BOYuHLRSuggbNjqQI0+yyx4lmpmVgYfmPpYUA008iIGnn/nS
	2AD6uQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfgwtd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 10:30:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93918756165so129912685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 03:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789122605; x=1789727405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5bFar5H27cJqwd2WNphcoVppq++/ChGc+WspNucP9M=;
        b=HT7uK/zYsh+8N6Ikh4wSNx6TQR+v9znuOLezXPPmn1tsqLFyk8QgpbXMflAkrLcDgk
         oYscAW9yve30sazdQtSYOrtFJU+33OAw7H6io90O/sHQCKLuWuzwACi6sad6ud7JBKhG
         Zw1H9r8Zo25c+kJjeabkKC6j4mhRBB9VKC36PkazWJM48Nemy1afrzwnCOtco1yZIC5f
         5ha2CT0xCbMzvgknkLQdIZWrIyaID1T5KkyawnfwvOi27T6FoRRwBa0JgTsGDusGzWpM
         TR2SMRES152zALf2N5gO/CxuXMjsD5kA/hP/HoLBHElbmc/PfNX8HPa9B7bz9WP0Yap9
         9/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789122605; x=1789727405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5bFar5H27cJqwd2WNphcoVppq++/ChGc+WspNucP9M=;
        b=YFkJhSoDgzFMXKoBceTiHkvki6mvxMOqLd9LCwC8rkkyoNy4eo1uUrCvgxuQTcuQ+z
         OAZSSMtw3J4aNb7X+xlxToIPHzoKAf1LYA7/NR2WHle0YCr5Y96Cv2duNHKBIRQf0bfk
         6IfzaaQwwfWOa5sUPf3drwuhSe65rRKGsPjEejzNGER6z9FIHDE1K95WDa2zBk6tg5k2
         CPjkqgQ+1s1uQjjUFb32Fnrmbl+foA7vKi8PIZb1gLK2qyz0jEIervZPauNLdt/cZGZz
         NuQIw9IKQOPT9IOSgcfHY380gsS0IkHwTTOaTBgag1rttq0+N3NdSTWypf+h3CG9lGzA
         EAcw==
X-Gm-Message-State: AFuF++kG/Gn5TWpKqy2DxZLiOocuSvoIfDaUOsaSVP+XosGeGbhcmSLU
	ulWcI+TErqyoMS+cSTfjd6rl+5PliqbegfxX973TuabiYzqiXTrU4TPL+dfM8pzxAiTRFnTGuCM
	1dVYFNnenpFSA+rnHta7DBt8+WYIa+ipgX7DPyjsZWTb8nTtk9V9dd/x5fHQjVaHJ0inM
X-Gm-Gg: AYBFou1zuf6yNrO8zRbjgqA4+hfMzWjfePhtzeG3aKKAyy5JBmoB3Zo1STG7ITPULMI
	XOWMVvHGeUUBM0cz//ccRKTus3uOk6Nzx0BAoDatBS5HPV+XDGUMw7AupaBeI2MSdxkXXO/9Fzv
	1UcjWMxM43kMQW8iL4BwgUGMq7fDZ5NsqGi32nu2mfkJVgwOS7W13zgE9chby42VKcUzgX3CXtK
	0K5tp3MwDQ8eLrxFwy7ZLTgOy5itz2DSuz+9Uy+4vuNgRln6k42Lg59jlUVe7jas5fvFYE8qeh/
	hZ2dv53gxZx2IJR1s7HmT0V4gpmI3JOq/0kZFW22Q9Uld5YBSHlP3fgH2fALNFu+ypLUMlU22M7
	qKi06XYW1xX1KxUnk2LW805w=
X-Received: by 2002:a05:620a:288b:b0:939:6de6:9517 with SMTP id af79cd13be357-939ea2bf754mr384622885a.46.1789122604975;
        Fri, 11 Sep 2026 03:30:04 -0700 (PDT)
X-Received: by 2002:a05:620a:288b:b0:939:6de6:9517 with SMTP id af79cd13be357-939ea2bf754mr384617385a.46.1789122604515;
        Fri, 11 Sep 2026 03:30:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm38651965e9.1.2026.09.11.03.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:30:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:29:40 +0200
Subject: [PATCH v4 7/7] dt-bindings: display/msm: hdmi: Correct name of
 disallowed supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-7-87bdb9f1987f@oss.qualcomm.com>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1237;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OkF3pqNY5sBAsIguyZS7ydBERaknMe6JM23521127sE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9gVrcZu/TMDuP1i7PORWJEkHVwIonipCvxhL
 qXzj3ig7OWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPYFQAKCRDBN2bmhouD
 15DsD/oC+uEKgZ7M5J4X4LpAk/JlszlMZ2civ+kPChZIYdG2ZJ9RYC5bHey27wDiMIrv7YSLK38
 u4C9MfRPd9xqE6nuH5qayj/jAjOfUVqttQkyzZFqAVtU0vXFY8DatvN/oYC1OiIga0wRc3yzw8c
 KeypBp3vOhR7QiSQDpqCnEZJE8T/G01setUm1hmNMZoVahF++feF233o4tKWGPqppFdC7vufVEh
 a78a4ytiNRAh3h9FkC7Io3M1FM7gqZfIWykCIW0RrKHkAAZ/+OnsmCGgW+9701J99atgPBwuxPf
 dBEjN8cvEnVghDl5nLpoR+4s9GGS8jYF4BVPpJEBxYRN2F8xAtA4NmwxONUahJLMO2Qggb0d5Ah
 ZZxCRoQ4Oi3uH0FbcViqkHJ7nbLOMPmlvKhgQE5YclDTV4rCfPkpOh7ej3V6LhU0iWtUpGPU57z
 Wh/i3zYgt6HAFC13buF5fu2bK1IeUXsQeX0klMXEbCrYlOQBKmU/r0cQhVDFWmd7r+npJmKii9V
 wcgpfBjCtWr6x2GrRE66WTujzwBUBSnBfxv++aJqeWB81Amu955ZP3lWdkYwRnzLIrmRMGqZBlO
 ljhkeeX+ggqnEyAl7gcZMa+JRgjZJIaJOqb1y6yIZiHHegNp7pYYp9Rp1Pbsd/98Yb24Vo7Ckeh
 NVptqF+TywOqi3w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfXwqBEHiVP6Q4g
 eaUSae1PTcBJwj7xKxiEyYg+MsJSL8nh0XG4QLsc5ZSgeE4hVYxiI7EV0byKOOjJESJ579y4D8o
 EPmLeHkXc/tCArIyZzcxVf60+EDVY/NWlBbauyl+rvwCnCxUR7NxjISiE+4i/YKGiubOmQ/7ysg
 xtGmfmroDqapiQeVwbNwZm5WbovN3tp+aDvNBYpe5p3BT9lMGAc6/raBVh5XM53C2I/5EAidFz5
 nRp/pgDuOKzm/iloo4JOAYBlH5gairoOwr/hQisKX7Hy1jHpZgSpcIPfz/ebUKDMTq1PyZqUxa3
 HjF17IfUKawpaV2ZQHhiII1U7H9bMeR3JG8rX4K2gkJWy0KphVaTIRLFK7euWPvauEbkUokZPgX
 gOLaaLqPbsxgaC+aP8A5PIxm8buH6jY7sauN26KOuMrFylCPga03PQjBdZrmGoWK1JHyM+/zTTo
 ZrAEU+JpTb774hxkKzQ==
X-Proofpoint-GUID: nR8_MbzdnpZVLzSib30Qc_LrWbtGGjAR
X-Proofpoint-ORIG-GUID: nR8_MbzdnpZVLzSib30Qc_LrWbtGGjAR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfXwn84uQps7b7b
 B4kdBrBhPitifk8qq++2ID5RnkIEODSmtJcZ3FDek6vg6uhZtMNRWuJwqyCj/lVZFAlYdhwisVS
 zeYj4MB92AvTa8EnxXEpeXZmnZq8H1Y=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa3d82d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=XYAwZIGsAAAA:8 a=EUspDBNiAAAA:8 a=LSMMCDwwRte7x3nqQVUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110146

There are no properties in DTS or Linux drivers called
"core-vcc-supplies" or "hdmi-mux-supplies", so the binding probably
wanted "-supply" properties instead (which are defined in the top-level
properties of the binding).

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index dfec6c3480f3..02d27ccad024 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -113,7 +113,7 @@ allOf:
             - const: core
             - const: master_iface
             - const: slave_iface
-        core-vcc-supplies: false
+        core-vcc-supply: false
 
   - if:
       properties:
@@ -136,7 +136,7 @@ allOf:
             - const: core
             - const: alt_iface
             - const: extp
-        hdmi-mux-supplies: false
+        hdmi-mux-supply: false
 
   - if:
       properties:

-- 
2.53.0

