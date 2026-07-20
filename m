Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1D4346AD6
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537059; cv=none; b=O1KoCxkffA3oakcodVv4fHS4oF/MzMrN148/xuFLVds9mubWghCSx+uR5Eyy+ugdhXaezazafK5eX7eA344yfi8OLjGQ7s6Fv0ywniThVrHX/sXdkuaaIi0pL9SyczEvqaGdatY9Z9LA9ZdpVBDy2l+8ATgalAimWf40KW8PRM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537059; c=relaxed/simple;
	bh=/6L2ekPpAxec/7uyCjbq9UCoVdswxCOmDhBbBr2sCa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dabazVGOesGPFfJYnUt4AFFBirKO+tg84uCI2w+QtRiH/m6UAiEVac3EXVe+q7nWoOq2FRG2eIgJfqZMTVQfrxFc1CAZ7v65gumgzWpu8T2dNivO6HTu/qPOGvyclyzTjpaGdm13r0htOD5YudxmbXEqFADeFxazeTVOWlZXUg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G1Xs86Tj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a21zMEB0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G1Xs86Tj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a21zMEB0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RSP61520047
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	39qqxcbfuYiiqBLw2ZuDhkt8UPE0aaVomriT1BAsCCY=; b=G1Xs86TjnUq/HFcZ
	KyT3NY7vZxg+XCo6IFo5fBJgPIWLEXrcrZNTFBePN16omNIzsL33oIumc07jasPc
	5SsH0yJXxr8WJdeHa2o338BbGiSkFX3lpxfABFPWAmbayUbgH5S69gipIfOpV36t
	tv/rzg73S8HoaVvPb2np7gfwMdsN8qhCKDMYCcVNi7eO7z8o4zxHzfOM5FNcEO0t
	tu+APhRvKJfk1akDL2WFw0Db2P6PKt6iXoCG+rTQ/ypODgzG2s7kg/sAbEFHw1xU
	0GUOXhbjcIzKr8NOO3r+/3O5GUojZHrMgb6JX0F7GnON1vJikEGqs9KCUSBEpOUm
	zd+QZg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2chn85t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:44:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90410c668adso201135096d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 01:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784537056; x=1785141856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=39qqxcbfuYiiqBLw2ZuDhkt8UPE0aaVomriT1BAsCCY=;
        b=a21zMEB0biiEHygfws2aDoKW09TmXyCwsfZkQFUvU5vNCtu210YOYHZeFslrIzZ1ml
         l23dLgnZTTO4hywrhBoc36WvKzkgHEbza1T6D5+QhBmuzH9KPWPDieoU8XgTQ6y1Tpfk
         4TRNvjenAiiyPWbIfqqIvf0OzT0TemcvRiegfwZmhdXIpjoFtA+3yJGErX3RC2+Hv/gg
         CW14+P8ntQHty4Fn6Cvw8QLCJRF+MdRt+w+A2+mH8wgB8f+RJUzGQefqJfAsR63TBXFT
         4qqi4TOuxu4zz7/pfbnETeHCebn/t7FwX9hR4IqFGTk8wCZ31OZXQBot8HA6+7aGieon
         yuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537056; x=1785141856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=39qqxcbfuYiiqBLw2ZuDhkt8UPE0aaVomriT1BAsCCY=;
        b=mLofxq7suALa71mITKYNlL7ohRmZANtwTxyhj0Hc6G3eIqRDk2KjMb/9qtmYxKIrrX
         g0CydSwthpeKOuqrCaSazWidJHTven8HJqLk/dxBm+zQf8UvWRuijrlMJpqz+Fiuv5Wl
         CFeAXZaVbDQdjCqGyPkngYmffg7fmHZhlSOmUKEUKKZL4yccNqiNoAmD7nspkaN4VsWP
         7D/PJt7QvlF6YbprGz/qyXc/OGkkydfP6b3aZPuw+ASJgIPxlQcPGeQNafmamc4dUfqj
         EC02RhgndczuleX68/PNi/tf9HZuw/8gv6Mvb7zjR1vLM+YiGqaBlzAShekf5QG3r6R4
         W06g==
X-Gm-Message-State: AOJu0Yxmi4oLOZbrRJ02AOMpSvdhz+JQAytdBpf+Hncbk2theWEb6qRN
	yjeUPcVcqRsyXxnZV9APn3flBs90P0ybItGXrvgWYRlJgCW8JwNIW9E/rWQjdPRI7/B88Wduz5I
	Vx2UrFNyRiAcbq7A9oHHelRSISexTPLLt2u2XhjXQnbQZ6t9wdOZ2ZP1uIuJ1bYfLso44
X-Gm-Gg: AfdE7ckotOvE2/bwoMHekrJtEfC5X4fYkDpeHK8n0QjR4Wq2Eun94AHuqjncH/42GJR
	18D6qWAgg5K5FAmy2HtXvdFmsfD7MNW0Q+AwaVIedryx4cSDO9BcNgDWVOu3UBbCUp7687kIbnQ
	aBGi59s56dNwS5FKBWgdB01oE/0mzWUL0DG0PS3T8dlLhm+nIklC9FYXUZQR5tSCrtLf0DY0Xj6
	xWdCL9VctfB6SkHr0DYglCXB2pyHYch2uQ00RhBNhM/lwYadDA0O30+Y2Od28TUkL/eP83HQ/u6
	UxJa1heR8x/wD2SQak0nuppH5CxHqLlEbqLLc0/+Znih6Y6ApstVolC8axPe5NXOmxsYdL4rxbR
	y4sepTcKmTCLLRfSxYo5/NTpv9kKdzHTBWFqtBod+chfhcA2XTTxXIlOZs124mPc=
X-Received: by 2002:a05:6214:5502:b0:8ee:7c26:8bb8 with SMTP id 6a1803df08f44-907783184bdmr137248116d6.9.1784537055730;
        Mon, 20 Jul 2026 01:44:15 -0700 (PDT)
X-Received: by 2002:a05:6214:5502:b0:8ee:7c26:8bb8 with SMTP id 6a1803df08f44-907783184bdmr137247906d6.9.1784537055337;
        Mon, 20 Jul 2026 01:44:15 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9077871f650sm87061716d6.45.2026.07.20.01.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:44:14 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:43:53 +0800
Subject: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
In-Reply-To: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784537040; l=3201;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=/6L2ekPpAxec/7uyCjbq9UCoVdswxCOmDhBbBr2sCa8=;
 b=KY5Qshg6p+4uwwzypEcbJv1/JWBhvrQpn04OPdUBO5ESYEw8Zf/tkYyK8jZI9/2454dUilHaz
 khtp7I3splQAcXdU7lFyliJc/KznWeZhOgii0k3H0vNP/kgfgt/0nn9
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5NiBTYWx0ZWRfX9u+K0OPcP4qB
 KQjdTvOpLOr0pJ0JjluoV5KdZVjefdddcaKxxHh+iApux58blb3OAH0+bYTLQSfsvmR7bNXfDsv
 KuiiF+UL0xugWsJc/yJjEqGc8b2ZJY4=
X-Proofpoint-GUID: UOP7vMuHngQLgDf1CJ9bBMh9jXTyv6fQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5NiBTYWx0ZWRfXzGQJjUI4TGi0
 EwRU11SNCJo0T1zahaP/LD2tFD9c29QDoeG4Piv75dq7CVvM7oTgx1ogE7gwDmMeCk7+0risQQ9
 +rWUwTEtBzid+ayrOIavpuRLuU3ZDT3Xz+S3BMJnU9iD3XX6rdHEJBQ6DGFOA1nZfyWzfQksBrv
 YEEoQd6Zwglo5Je5bSuKt0WMFf4tGtouGJPecMS0jmNtsgDMU3FpsWI+be04KNfezvIeZ+uDy5y
 WwKTFJ5IWr/Yx451syiSKn0DAE3qWxeuwVZS6EjTh25XZNgxAdmAHuvRFEc4uY0I96pQ49WokJ7
 Wtuxfvme46vn62pR5YWoJnmIXmKwYOV3cgeXsCA9t4BjRbGIEcGYbygbkpeq3iD+zdZ/qBFYOOx
 M/oqR1QjDmRqeCK/oR20AJCnOwhSsdMV7JtiHYGDG7dCqQfNl7ToREe+tKcN4n1Bb487CbXCPd4
 lwek8k9S/Q6Hc+4+2oQ==
X-Authority-Analysis: v=2.4 cv=T5K8ifKQ c=1 sm=1 tr=0 ts=6a5ddfe0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0Rkz6-gpJEd4cPyUuX0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: UOP7vMuHngQLgDf1CJ9bBMh9jXTyv6fQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200096

Kaanapali (SM8750) and Glymur use two display power domains.
CORE_GDSC powers the main display hardware while INT2_GDSC
powers a subset of SSPP blocks.

Allow the MDSS bindings to describe both power domains and
their corresponding power-domain-names values.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/mdss-common.yaml        |  3 ++-
 .../devicetree/bindings/display/msm/qcom,glymur-mdss.yaml   | 13 ++++++++++++-
 .../bindings/display/msm/qcom,kaanapali-mdss.yaml           | 13 ++++++++++++-
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index c6305a6e0334..c0b650ffd9ef 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -31,7 +31,8 @@ properties:
     const: mdss
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   clocks:
     minItems: 2
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml
index 64dde43373ac..685bedb26a12 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml
@@ -38,6 +38,16 @@ properties:
       - const: mdp0-mem
       - const: cpu-cfg
 
+  power-domains:
+    items:
+      - description: MDSS core GDSC power domain
+      - description: MDSS INT2 GDSC power domain
+
+  power-domain-names:
+    items:
+      - const: core
+      - const: int2
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
@@ -95,7 +105,8 @@ examples:
 
             resets = <&disp_cc_mdss_core_bcr>;
 
-            power-domains = <&mdss_gdsc>;
+            power-domains = <&mdss_gdsc>, <&mdss_int2_gdsc>;
+            power-domain-names = "core", "int2";
 
             iommus = <&apps_smmu 0x1c00 0x2>;
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
index 9f935defd6b1..088010f464c3 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
@@ -40,6 +40,16 @@ properties:
       - const: mdp0-mem
       - const: cpu-cfg
 
+  power-domains:
+    items:
+      - description: MDSS core GDSC power domain
+      - description: MDSS INT2 GDSC power domain
+
+  power-domain-names:
+    items:
+      - const: core
+      - const: int2
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
@@ -89,7 +99,8 @@ examples:
                  <&disp_cc_mdss_ahb_swi_clk>;
         resets = <&disp_cc_mdss_core_bcr>;
 
-        power-domains = <&mdss_gdsc>;
+        power-domains = <&mdss_gdsc>, <&mdss_int2_gdsc>;
+        power-domain-names = "core", "int2";
 
         iommus = <&apps_smmu 0x800 0x2>;
 

-- 
2.43.0

