Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD3E3E44F3
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223574; cv=none; b=QDXDC7UVi4AcsPLhgVAf8oqrYpj9Cw513XzYayhoujIczXRsldhvkBDCXH1ZNar+OUQmk/vBUcXNex9rEEdIUS5IZBVG69mTtL2kO0AAfV91L6ahWaowGROItkI9I1fGriONxDw5WaLkxBqzfN+37xHTNqW5qLlRvMa5TbBbRvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223574; c=relaxed/simple;
	bh=8RtHxJCzH4MTysddG+Rogpz9MuRBfyVhPsf2lx1M9ZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TdeDoYihDFn5mQIfj6HeMJ5mzErc8CemrHYZjEJmEsz1jKmMkg5BwjaIVbylo2Nh9s7rUwTaj6EuqGMLhHC4AUC7OxHS464faeovOPC4ji6tlQd0+wLL51yipdot10JPqLK2xh64FOZaZHxYApvPUBQmO4FX8vPswy7296NL3S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okzunnhs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEQrLpOm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okzunnhs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEQrLpOm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3aZif1714770
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tfm3D/RNAypA1Lu8c+OYYqMPKqxXH6myoRjwK+lFEXw=; b=okzunnhs0fLK61Vn
	i/63VoqYbSXaw/D4NdD/wIyh/sQfJBhOPN8UsYiUlDQLzyMA7x8EiCgANQblTrxL
	VnRiDpe/H8etjqTSa0Up5xZvK9tSdOFQq4DrPh7C4adCXQrAOlZx4ee9gp8Th0pQ
	GyFCR1/X6cjTMz8JpQIsAAJNPAoRPyC1q8n9c52r4vJ3pxAQp89+Wr44k393sQmU
	H5MSlFN6EgwdbE6pZ5xuR5PK7jnf5ajE0iCY6i7ZmboJ1ydJ2NwNMO0y9zrbnHSc
	jnusYUZnFhzGdkNbRr8m2zUS/hb/7XuLVHh4HygEpiYepozESzDu1NIaNZE4rBhB
	7YsaOw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpadkkhsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:26:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-522de3c645dso11862041cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 00:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785223571; x=1785828371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tfm3D/RNAypA1Lu8c+OYYqMPKqxXH6myoRjwK+lFEXw=;
        b=iEQrLpOm3YujxeocOJ3dscHeEZu7RssukS0br2na4MP/+CTrO2yijpN5abfKqo97lj
         OczEC57MGTZP/7Z3hs/nKKkQJgd6kgPTvFubvNgucXwECha8tZYBY/A+EoOpYT0moOP1
         FkQBn7BFKthSHXL9yNB86UmWsND8TmVLCkdtC6E5By1/8cYmXuQWqS4c7E/EsY2EB/sG
         9GsdFC/qSrIUF+cwizghOKWJOSXBC/+4CrMWwnwV+nbQMcIYNjHb2FJ37AdX2hxVdZCO
         FcyTnPbNJpoTA+GvT+HlR1S/t4z+FRlbBn8nJRYeL84rfi98CSIMwRixY0INWzcfWuLL
         pv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785223571; x=1785828371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfm3D/RNAypA1Lu8c+OYYqMPKqxXH6myoRjwK+lFEXw=;
        b=R6Vh7/vn3sFP3Wdf7Dye7NFlpjcHWvCJYF+OQsju4+gxqX8qrjfyX/01u9ngHaIIVB
         uVD6DtDzUSP/G+rHoeSW5KeTcxMc5NT3lnJXIKt02c18MH1kItOW1bUOUfMoRyPyOQP5
         Q4m8OiaZimSlrFrHzqB38xWMQZ14UFtXLtBEa1vQiV34hOP1qVBKVlVGoOBnyzItbUfZ
         mDTArRvPemqVHYyt0ZSJn+v7DcU5UcXuoR8omIAlHbNBpYghu1LfbuC9g9NPn6hUNwsE
         J+P6jqB9MvY6tNX06sxLEqb89PVHa3LcMMC1Uue2bZ2pdWxBuanTWIJvDTDJZ/UOwk00
         kFsg==
X-Gm-Message-State: AOJu0Yz5Xlk9cTiqAOruMAboijTESKksJOaI5ynCTK4PU3I+SO3X6Euy
	Gs+MiwZ+ptK08g92viJPyWzX+2nzP9Og5Pj9r/fxMluLXA2cExRpjLqu2xfR8FvPNWrv3+tYxev
	JOW8jC5NN80YmO+l39fyAMF23tMBmTh1U5Uk+qpJ63awG+9nONr5HDUvlRsTC8SJNYSJq
X-Gm-Gg: AR+sD10i3NGERDiXc8tjbJP7xSmSBp/f4e2/ONWBTVBHQTbdqoZLsbRDc/a6A4ix0xK
	9AvgpfqMoks2ro9IxcYMQRWM8OCXvBCAcygIsFTDa3V1u/TowPeublBWaYAKEdGRvn+yQb267/5
	3WNmYiDmoGEJHbQli5ZY04MtZ/tRmmcUia+r1GaKoRwd7ERAqGvd0MP+qh1s3Fju+3mbfP4bhdm
	oAGbF3J5yxBZAH98KH/f0lyfggR6F6WbSYgVHTHpuDS4KXxgs6kWKjH6Kme0TvvSN7jk0RGDEUu
	+hbmz1V+h7n51vMw+eDdzqPTmbsMTcjIzkPy5orNQk3ofd0FESHZfqQskraJBJ8Byu3TZRTYc08
	bL42hQc+w6Hd6lobsS91D9EP2
X-Received: by 2002:a05:622a:110a:b0:51c:b98a:244b with SMTP id d75a77b69052e-529d7147447mr8577781cf.62.1785223571158;
        Tue, 28 Jul 2026 00:26:11 -0700 (PDT)
X-Received: by 2002:a05:622a:110a:b0:51c:b98a:244b with SMTP id d75a77b69052e-529d7147447mr8577551cf.62.1785223570562;
        Tue, 28 Jul 2026 00:26:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4443396sm61340805e9.0.2026.07.28.00.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 00:26:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 09:25:55 +0200
Subject: [PATCH v4 3/4] dt-bindings: arm: qcom-soc: Validate nodes with
 fallbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-dt-bindings-qcom-soc-naming-v4-3-39ff32071641@oss.qualcomm.com>
References: <20260728-dt-bindings-qcom-soc-naming-v4-0-39ff32071641@oss.qualcomm.com>
In-Reply-To: <20260728-dt-bindings-qcom-soc-naming-v4-0-39ff32071641@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7084;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8RtHxJCzH4MTysddG+Rogpz9MuRBfyVhPsf2lx1M9ZY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqaFmILGVKnBcv2ty1y19WoHmxFRFPCIchWTGV1
 Pebcxiy/zOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamhZiAAKCRDBN2bmhouD
 1+zBD/97DVuB+wZw+0uzF1OV2yWNpQNPZPDOI4+tji5cqr7MrJmqKt1Zh16m4u7Edm5vAaIDZwv
 oZYAFnIK9LOC5jLEVxRUHkHL6kwD2u4prrWmj8djfyCxxPmtYegCQ/M1skoMvleUFj3R4rBXz09
 wSEwYeicFME2aoOshBxYwL5M2fBWE06Y4CTPPLgL1v7a8gRb5DVVkXSfGnPNX+mUC01hodsJ/5j
 npzp1H4fOaLiKMopvVit+QMwV5F1N9fLD+NTvmwJunA3739VyOqLVSyxUCZbGuyeE6b+EYKZTZ+
 DDnnk4OSV+1kG9mrYQ7Go/wLexEFc+EcoQ5xiyZgSZPbOMYoKEpQZrPped3bG57CBxSUzs5fqnE
 PVFgmqa6bMTGqqkc4mvisJ4gHTCu5w9VzDugbnrdCUS7UMhCZBtnz16HyzV/6MH4PKI5p4OmEnY
 j4Wi9tyu7C0pbTTUBfpgd+6Pdi1FVsoWW0UxkmTbE51oPjikaZDzjzBMQ8pX4ebxMc0MZRtaKCW
 1wdWvRr6GMNOm80evTfvw/4awtXhd6stBefmJWDSAEMAvCrXcG2YI0fv4lD4/QKnsMCm1ZV6IDH
 ZQONpcXLUoRJ77maVTVc/TQX2yJsAv4RK3qV5NVJmXA6oPY40AJ0vpwfKTnYon0FRUc2DeJ3pg5
 GKvpFTeaw7O+ikA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: y-3DOEWr17fpIkXhURemePFXYin-0Qlf
X-Proofpoint-GUID: y-3DOEWr17fpIkXhURemePFXYin-0Qlf
X-Authority-Analysis: v=2.4 cv=Ns7htcdJ c=1 sm=1 tr=0 ts=6a685994 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kCvHDawpFxJh7yUt0T8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MyBTYWx0ZWRfX6oDv96Mo2gyP
 oFC5mKWrLQR67Ejb8FnkruCONGJZ9p8hEkOHhymUSKEwdAnF3HrP+mY/gF8otkp05vunKPUKv7z
 UlUDJNhI6q9gf2ZdRKniAH5mkReFXOFDzTU7AXxTZbM9nUbVHlCbiGr7bLC5Xc2xVF9K6Tf0Pzq
 EJ4h+6ci21ugj4UrP7xYVN8s6QvfFZNiKzVRnf/U+SPD8xTY3R7OvHlXDyBrCIOL+lOEGNsEN2Q
 T+1n27QglQL0dTiINASPvkfoJTQD+VbboOpXfiRtH9S1IcgpTEPRAFI2MVbv3QsQ9POrZXz8uWb
 o8l5TSrWJnOSNqvTLAcC6nqUvaCj2mLync3w8ihDeL1Qly9NPsNGDcQipp7/2ekEheZrLBfPO0b
 3g0Tj/Bkjr5eKAnIYFs+Wgrz9zZ9bqDbDJdCBt47ddHOXyDu6tU2cJ9FmyT+Ya8igqPej4BC77c
 9cDD7Viutxzp21p3CPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MyBTYWx0ZWRfX+d2RC9IoRY9g
 0IVYN/WzUwFFhfq9ZaPjp+omHDTKhfNQF7uqmXCZ8RO5mfY7FBAMd+y4w9fabrKzGDFEzukQrUN
 pjML8s+HC0am09bt+PLlNAEdS01A4AY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280063

The schema checking for expected naming patterns for SoC IP block nodes
was really incomplete and was checking only nodes with single
compatible.

Fix this by changing "select:" to "contains:" so every
node, except root nodes, having at least one matching compatible will be
evaluated.

This however will evaluate nodes which have some generic fallbacks (e.g.
syscon), thus the schema for expected compatible should also have
"contains:" (with "anyOf:").

These two above are the only functional changes in this commit and the
rest of the diff is indentation change.  None of the patterns are
changed (neither in "Preferred naming style" group nor in "Legacy
namings"), none of the compatibles are affected.  Basically the second
part of the diff is (simplifying):

 properties:
   compatible:
-    oneOf:
-      ......
+    contains:
+      anyOf:
+        ......

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom-soc.yaml          | 98 ++++++++++++----------
 1 file changed, 52 insertions(+), 46 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 0e921633dca5..04f0e628a349 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -22,59 +22,65 @@ description: |
 
 select:
   properties:
+    # Select all nodes which have SoC-based compatibles, but not the root
+    # "/" node, because its front compatibles do not follow any SoC patterns
+    $nodename:
+      pattern: "[^/]"
     compatible:
-      oneOf:
-        - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-        - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
+      contains:
+        oneOf:
+          - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+          - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
   required:
     - compatible
 
 properties:
   compatible:
-    oneOf:
-      # Preferred naming style for compatibles of SoC components:
-      - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
-      - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
-      - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-      - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.*$"
+    contains:
+      anyOf:
+        # Preferred naming style for compatibles of SoC components:
+        - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
+        - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
+        - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
+        - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.*$"
 
-      # Legacy namings - variations of existing patterns/compatibles are OK,
-      # but do not add completely new entries to these:
-      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-      - pattern: "^qcom,apss-wdt-[a-z]+$" # Codenames variant
-      - pattern: "^qcom,kpss-gcc-(apq|ipq|mdm|msm)[0-9]+.*$"
-      - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-      - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,rpmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,rpm(cc)?-[a-z]+$" # Codenames variant
-      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sar?|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-      - pattern: "^qcom,scm-[a-z]+$" # Codenames variant
-      - pattern: "^qcom,tcsr-(apq|ipq|mdm|msm)[0-9]+.*$"
-      - pattern: "^qcom,usb-hs-phy-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-      - enum:
-          - qcom,dsi-ctrl-6g-qcm2290
-          - qcom,gpucc-sdm630
-          - qcom,gpucc-sdm660
-          - qcom,lcc-apq8064
-          - qcom,lcc-ipq8064
-          - qcom,lcc-mdm9615
-          - qcom,lcc-msm8960
-          - qcom,lpass-cpu-apq8016
-          - qcom,usb-hs-ipq4019-phy
-          - qcom,usb-hsic-phy-mdm9615
-          - qcom,usb-hsic-phy-msm8974
-          - qcom,usb-ss-ipq4019-phy
-          - qcom,vqmmc-ipq4019-regulator
+        # Legacy namings - variations of existing patterns/compatibles are OK,
+        # but do not add completely new entries to these:
+        - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+        - pattern: "^qcom,apss-wdt-[a-z]+$" # Codenames variant
+        - pattern: "^qcom,kpss-gcc-(apq|ipq|mdm|msm)[0-9]+.*$"
+        - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+        - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+        - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+        - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+        - pattern: "^qcom,rpmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+        - pattern: "^qcom,rpm(cc)?-[a-z]+$" # Codenames variant
+        - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sar?|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+        - pattern: "^qcom,scm-[a-z]+$" # Codenames variant
+        - pattern: "^qcom,tcsr-(apq|ipq|mdm|msm)[0-9]+.*$"
+        - pattern: "^qcom,usb-hs-phy-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+        - enum:
+            - qcom,dsi-ctrl-6g-qcm2290
+            - qcom,gpucc-sdm630
+            - qcom,gpucc-sdm660
+            - qcom,lcc-apq8064
+            - qcom,lcc-ipq8064
+            - qcom,lcc-mdm9615
+            - qcom,lcc-msm8960
+            - qcom,lpass-cpu-apq8016
+            - qcom,usb-hs-ipq4019-phy
+            - qcom,usb-hsic-phy-mdm9615
+            - qcom,usb-hsic-phy-msm8974
+            - qcom,usb-ss-ipq4019-phy
+            - qcom,vqmmc-ipq4019-regulator
 
-      # Legacy compatibles with wild-cards - list cannot grow with new bindings:
-      - enum:
-          - qcom,ipq806x-ahci
-          - qcom,ipq806x-gmac
-          - qcom,ipq806x-nand
-          - qcom,ipq806x-sata-phy
-          - qcom,ipq806x-usb-phy-ss
-          - qcom,ipq806x-usb-phy-hs
+        # Legacy compatibles with wild-cards - list cannot grow with new bindings:
+        - enum:
+            - qcom,ipq806x-ahci
+            - qcom,ipq806x-gmac
+            - qcom,ipq806x-nand
+            - qcom,ipq806x-sata-phy
+            - qcom,ipq806x-usb-phy-ss
+            - qcom,ipq806x-usb-phy-hs
 
 additionalProperties: true

-- 
2.53.0

