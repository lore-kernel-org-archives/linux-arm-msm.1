Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907977;
	b=RpbBNohvzolW1LspI4MHJVgq0Hddo+lLVegKfqioOSx1HDpF+Evtn0mIJ7ANqx99ebKu
	 hPKT4O6pIACRKeoN6YhZr7Ad9iJ7NXuKbdKFUlrZaBBNajCnIUoow7rI80r6Op11uWQdl
	 SuaZeP0LfLTGet1+irCm8IcY+1umTnRak/+5y+3f+FIIwEVV2RV5Hs1v5CcbRiiZyJXty
	 DHBeIe+CqFqf8sS5E3UupxfKHKmvwgTDsSs3OaZKRJrS/noE0hb1TSkOXUiEH/byxlTFE
	 nZ46Q8jnTYNXq3xlhZ4RMwhRG+RTQlYW2w7GMQ6F6Msd1uotBF1F66vFYNiGfV4vj7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907977;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3BFnUHcE/+pbpFcfNMGE+vFXRnYLIh629ZomjR+Ujwk=;
	b=Fs/uQqjQl0fwP1nIWZTOOtvFq7pMjUXnTlY24Dd7sYW8AVWdbdCBUhnlFTvG4tgOLazO
	 Cu3isOD2dFv+piZGwv1GViHKBmIUAP3KC79cUCwb6oykiMiO8KjirD6jjrrF3rDDLtpvR
	 R4EOBVK4Tk8E3ZCzJQRVJNIR9fyJLAs8+Na1AxblIkIa/sC5x44n2NY53lFM18UApoaKY
	 w4vPnrB9dlPkWCXLeu43Ie0TT90/WYcU4Q5vjCezogSdICDdLe8N0HuqY9srIuslII9w7
	 I7Urs/09t7wmBOL0MMFIbrWhY0I4rRcctgkpjwXn55Xh2i9tl5lxXoLa6O4Ny4qP43Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AmeU8GTg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QrZf/H5t";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2688A6071F82
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 19:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2688A6071F82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AmeU8GTg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QrZf/H5t
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeMWV1440042
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 19:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3BFnUHcE/+pbpFcfNMGE+vFXRnYLIh629Zo
	mjR+Ujwk=; b=AmeU8GTgDBwiWMN4/T6A+Dyxv8IvBJZNTHbYFRpjZ0iUxpLoTry
	iYDQJARx+xLyFlr1cMwf/1d6h/ecXd8dYo5LHQ2LUchNhlMV+uUx+6NMKK/DEGFt
	wnqY72zlKu2mJhwP1xT/LY0eJsiHvTjCCPDnaQSRmf+C0TwOLjPFI88d9RINzUA4
	NWMZRH59hbmmSddTDfX7mXK+gfs2TSbZfOONFAkVgHTGBFNRQ7exj3zsfJgDcIZj
	wJ5eimlQN3NpajwbHzly9WkySv5V5CsjDseBs2vUHow2JdkBIJta/viT/JHds02y
	tlSxSTkKZXHjGsPvhB4pVymO/j0CCCrKS8Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v3g8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 19:46:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9441113670dso510004285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 11:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793907975; x=1794512775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3BFnUHcE/+pbpFcfNMGE+vFXRnYLIh629ZomjR+Ujwk=;
        b=QrZf/H5tIzT3hY67++JUZAsJkoAiBRCSnRqvUizLKYRWaE7qvKlGBvYVCDwplreE9d
         vHmA7cLiTMIbwtWEQwjYrAJojoEKMRI6mR9sag9vN1oB3fLhUV0LHEaP/ghXXA3DCurc
         PbQPcwF6UX7ChB7eLcGyW5Ir84wZujJfV14b1LibKxNi2RAoXCN7T904K390sc6jLsxc
         HnAkuY7h2xIzkf8vLkfFEJVXzd0IQ3yeEX3gpA0p/MCnEXApO80yYqISvJj3/T4qniv2
         Uz4UuMNl1WB22zWxyTUX+pQ22ilCagFtKBzV4/2OEjh5ieSFEDnPHL6hq/YVpa4b6/IW
         IMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907975; x=1794512775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3BFnUHcE/+pbpFcfNMGE+vFXRnYLIh629ZomjR+Ujwk=;
        b=pFT6EV8x5VENcL/MouvTVPVaGYmglpf55seSPC5B/8BOZQ03EaKimVvpPN4cuDQB4f
         5vDF90SZdLU1h9jh4yjOCwdeYxoSBaqiaMI8tb09ey97BBmog6ToO2KeBnCEfgNT120k
         eUozbWfphFiEmNL/WWYCbAomB7Bw9Y1C7pkX8XG8QXBHd7x+LDnmnrC5Fv83ttT2ytZu
         KK8/wF23aDsS+EAFBNz1Xogl3uFspC+/mdGbEVKBzg9SXW3ohKpF4K8xdOhbSR68uLDd
         LrXAxxWndHEC7L/XGy+cJw+nZxPgMPib5sjvy/XnbRdiexN70IKLsI5d664pkJgJQ3UI
         7zyg==
X-Forwarded-Encrypted: i=1; AKwUvBw0qmuyj8cUP2JW92YuVZGB9kQ14CG0+8Zn8nzqdzlo4ddRI/YOMmlOsDwGdkGXXp2LsDpKYgLNcnvtzYKa@vger.kernel.org
X-Gm-Message-State: APuU4Z//6WdJvuVbH1Iv1y6HggI3L5cBQcEINWqaBDiDEeODoiH29Lao
	WUo9X2GGVITAU/JkWNr+56E1I33FNShl43L7heeED+7jUt+wDIrElIn0owF/Wz8z0oShKk/tkRz
	KOTLMBknWU79ZS50oDm9V3Jb5haZmSbYuDkh4pb6yiZArwx9ZTok6URzhejTRqnEdhxNC
X-Gm-Gg: AYBFou17lNz5vcYj+wkOjLOOFEy4/4X9LgwpS5Iup1060Em0eZ/zkiN3VvnltbR8qGI
	Gxnjgez+X6xUL3PaiHriLiz7LlnZn8xBJxr6kQu6pILVhrOvgMMFsUpDYBsMiuw/fCu3qlq3G5s
	RbsoIQcJRKL57YuoRCXJILBSmieRPAOpbXEMY2Yy0MLhP1zCro/42h5vN0gvC6KCD5tTjd6XYbR
	v9wmK1JiL4kZUaolWdY8bPWwqjmupUSwxfWpRHB1NntSu26y4AE8j2VZtVAYxhggAZx/BAxIS+E
	IHmys+e2lCRUdC7/5OlDuXpF+wlgHujiYUvc5IBKXFC4JWpQ3illZFJ8kwwvUsaDijwOe/bFF0z
	7Cz0TV3fXr51Xegl/CHvqHyvZVRGj/yqRuOpIiQVchzcN+5L4X2dKoY8jwMWRzQ==
X-Received: by 2002:a05:620a:2702:b0:944:2e2e:69cc with SMTP id af79cd13be357-945f34ce97fmr20081185a.49.1793907975270;
        Thu, 05 Nov 2026 11:46:15 -0800 (PST)
X-Received: by 2002:a05:620a:2702:b0:944:2e2e:69cc with SMTP id af79cd13be357-945f34ce97fmr20076685a.49.1793907974812;
        Thu, 05 Nov 2026 11:46:14 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcb8sm82495855e9.1.2026.11.05.11.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:46:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: cpufreq: qcom-cpufreq-nvmem: Simplify bindings
Date: Thu,  5 Nov 2026 20:46:07 +0100
Message-ID: <20261105194606.772346-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3795; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ei0/JnfNAAX2qJbDNn+6Uyh3n+06uKHSrrdp7G2A7ew=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq7Nz+q/+5a2h/Vy/JzzACmTB3XbMLDFW+T0Sk/
 hhFR3jvxXeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauzc/gAKCRDBN2bmhouD
 1wPgD/9N3au9Ru4qEGpuVNiEQ38tGsbqeiHc5J+W2pHu7VmvW66WRXXhxknNTTQeguVW1hZBea5
 ksi04j56hZ7dZXSA7q6+LP9ZvikzypImgq+GMVxm+t3nY4FlJEcOg7/95DLLbaAknbxtd6AhYld
 S7RujdhKRyul5vmnj2pxn7fKuXjl6ePoaKQWmGsyohZwMsKLEKuecfdcOTW79wN8hiFszw3OKtw
 RFR6ymuACaIK687aWKaBI+CvYLISj02Lyb6c7UZ4u/i0GJQ1YuN3aoM0b2nbpIBAZgHvCd1nYY8
 TjpZgXL0ioplBAw9xHWqT6DNwbdDvKOnpmpRWJqAF1x2r2kGtsvxtN+sb0saGZ/pyEtYg4F8OpG
 wJcu8Mhf5XGgc2BCPWPgJ+6iYVlQJPrVxiaTyrVJcD9vADPd6tInshRQYU5sHkq5jD9IalQKYWJ
 XNd1tjf/TM8cT2RKH9n8tHc87CehvG54Buf5sXF7FUX5N0YMof8MnMdeK0xy+OTiRY2An58ToC0
 me7gwJc2JQohRBHxirG4Gt6PpeiPsvVXFtX+hKQsa+4ovmNO0Vni7MgwehKbgDa4zdAvCg8khvL
 tnT4oh8HFFcQZTlYb4K/Qp/9FaBsJf5cjdsk0TTHCckcxhatEXLR9e+tL9Ymb+3JFoxDuW0yUP1 1860SmvyRqfz7Bg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX4+7R2uEIZcIN
 mqF4QO2RMwBib8DSGP+TMPMkE5fQy31nwkpO15yb5PcPdvsYyo+JXuLvSNBn1bAqUhlHLWMhspQ
 Z0229GlYFqMRpIiy4muMWYKnYhZoqCo=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aecdd08 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=hpx_vC1UKZy5HMHMfZkA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfXzNYCWEhmHqtv
 QAMKmOq+vFpxlqaal6tiIQFoOMp5PnGmUYs5QPhhQaYWB4q46DrABxHfpZFGFuAJoZAaIYAH+jT
 +NgCkWecs6qZ6lmOsRKV9Dx6ISHjP/jdF5XwMoQbxk6LqMzueq9/AtCzeMHXRDNk4GQLtrUBcsE
 GTnEYuTtWf0D9bcvLUiTV3cVsXqhtoXazkgClISZGzJpUmWdcPCDG0ZCbKjsf/Z8qpHB6N4Zu+e
 SJee4pQfrc+FP6eEeos6YFwQHGQ7MW55J8F4Tv/+j76kf3c3cx5xHzxIIcG0UhpoPt2JxHQOuAr
 9KI7d4FSiYedx5FozB37Wyij3UQilr7A5Bdi7j9QWk0F4Gcu/ix6WsiAvRepftLDqCZ+OTP0OwI
 OwPLq3ibpJkd6pdjV92oNBnARsGOT07aUfDvv/pu/kDAo6c6LNN+0IqHspVxvQDIkFUAl113MiA
 jTr1lce6zq9DM1P5kDw==
X-Proofpoint-GUID: ilLWTDCj8OA19GwmTETznohDycDtHH7l
X-Proofpoint-ORIG-GUID: ilLWTDCj8OA19GwmTETznohDycDtHH7l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050078

This binding selects a few top-level compatible machines, but since
commit 389de9c5a677 ("dt-bindings: cpufreq: qcom-cpufreq-nvmem: make cpr
bindings optional") only qcom,qcs404 is present in  "if:then:" clause
which enforces specific OPP properties.

For all other machines, this is a no-op, because there is no schema here
enforcing a specific compatible for OPP nodes or any of OPP table
properties: one can switch to standard OPP table (operating-points-v2)
and this binding will not complain.

OTOH, this binding has complicated "if:then:" blocks so is not easy to
maintain and causes false positives when regular OPP table is
encountered in matched machines.

Drop all machines except QCS404 and move the subschema to top-level.

Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/cpufreq/qcom-cpufreq-nvmem.yaml  | 78 ++++++-------------
 1 file changed, 24 insertions(+), 54 deletions(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
index 547265b8b118..dfc7a27a7bdd 100644
--- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
@@ -25,22 +25,30 @@ select:
     compatible:
       contains:
         enum:
-          - qcom,apq8064
-          - qcom,apq8096
-          - qcom,ipq5332
-          - qcom,ipq6018
-          - qcom,ipq8064
-          - qcom,ipq8074
-          - qcom,ipq9574
-          - qcom,msm8909
-          - qcom,msm8939
-          - qcom,msm8960
-          - qcom,msm8974
-          - qcom,msm8996
           - qcom,qcs404
   required:
     - compatible
 
+properties:
+  cpus:
+    type: object
+
+    patternProperties:
+      '^cpu@[0-9a-f]+$':
+        type: object
+
+        properties:
+          power-domains:
+            maxItems: 1
+
+          power-domain-names:
+            items:
+              - const: cpr
+
+        required:
+          - power-domains
+          - power-domain-names
+
 patternProperties:
   '^opp-table(-[a-z0-9]+)?$':
     allOf:
@@ -48,10 +56,13 @@ patternProperties:
           properties:
             compatible:
               enum:
-                - operating-points-v2-krait-cpu
                 - operating-points-v2-kryo-cpu
         then:
           $ref: /schemas/opp/opp-v2-kryo-cpu.yaml#
+          patternProperties:
+            '^opp-?[0-9]+$':
+              required:
+                - required-opps
 
       - if:
           properties:
@@ -62,47 +73,6 @@ patternProperties:
 
     unevaluatedProperties: false
 
-allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,qcs404
-
-    then:
-      properties:
-        cpus:
-          type: object
-
-          patternProperties:
-            '^cpu@[0-9a-f]+$':
-              type: object
-
-              properties:
-                power-domains:
-                  maxItems: 1
-
-                power-domain-names:
-                  items:
-                    - const: cpr
-
-              required:
-                - power-domains
-                - power-domain-names
-
-      patternProperties:
-        '^opp-table(-[a-z0-9]+)?$':
-          if:
-            properties:
-              compatible:
-                const: operating-points-v2-kryo-cpu
-          then:
-            patternProperties:
-              '^opp-?[0-9]+$':
-                required:
-                  - required-opps
-
 additionalProperties: true
 
 examples:
-- 
2.53.0

