Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE91046A609
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649091; cv=none; b=IyfCUbMZtnHmfOX7uP09cD+7hp9Y9cQHZs1QwRs9k7q6WDJc/jdPTQexRyHEU3SEIPHkm1/ovMr33oKbK+ikQ97TNrLQFUIe1/O6yaujvNslDNiy58bbg8UFkW2HDXPHzoeC8Zb2uOU0BM7Jb9KfNgXzbP+KVYXQKvEH4/ohRMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649091; c=relaxed/simple;
	bh=8aLaY0VbPZqafdAuyM1Caiu9HMYRLztJovu39cN+UzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ttD9HAMn6a0VJaJFHSL6HSOthVpxi7pLH/u/u/6LBXzDEAEeaqhXRGs/5aDjHcVi0mR49YtTwzsSSuJ5fUqTqJM5hmr2ZPem9sFP6AYDaOLl9Tb0V2cuua0NqPuZr9R0N2JLJ5GcfBp/IgvkMRAu2KZwobh+zgSGa6v1Qk9tvrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bqc7hSgB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d3sh4QA3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bqc7hSgB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d3sh4QA3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg2NB1841395
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7LRdCuRCryk953NTIi218jiLBuhVfjw/hfju/5Owgl4=; b=Bqc7hSgBUirm6F2L
	oX6mQYfEeuaeHID5a9coNzTstOj+zsNgZhKZe4TGXbt+6aq+rnwES4qxo1YN/2vy
	1YgHFZos4VxsjvjTSfMT9uiEI00L45zDuyNCLRq0m2/fNUAEyBEbmUVoEfotbVX3
	UCuwwGilbvXDbjToV+trqSSE68WMKwBIuqA1iIayHNL7HE6WQnX5li1dUfMOQFy0
	Bh3akHIS5oE/Tl7oXo/sRAw6cNAjr5jR5K9YUhgC28wMGdNDycK3B52Hbk+z34ND
	xcUYLVkYNMiz+z+VWxLd+q9SoNmrlZGMegHO4g0/Zl2hUnuP8MYgTZalqfpQfbgg
	U0UYWQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se34y1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:51:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-520a00c7a03so135805731cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784649088; x=1785253888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7LRdCuRCryk953NTIi218jiLBuhVfjw/hfju/5Owgl4=;
        b=d3sh4QA3B7UOcVWZhorpz1zSKBBAKWWTowv3e4h6RyiMq09xVALOrD+02WyeiY7gQd
         2ywmxx1AGk2QVSbLoXrrg3xNiEwmX+BF8Kfi6ZZEIs2ns8UWryMqMuVi7DdxIOS97yKW
         X09SQ+ENtoXkcf0D2zLzklhxPb5UggiUK+IpoOF+2W/bnmcxu4oPQZEiqgdFvdwyFBAe
         55RHMum9G9DLeektJoi7O9kNjv/RjhoFByYd/n2zT4o9/4ZXEvcjJ93XkGFndJfWGZKQ
         ozYu/vc4uQd4812G65nzJZlR4+3vJD+UjVCVlpKQEYQFq9ibcWvHnhH86Eha2cXmaRpX
         tt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784649088; x=1785253888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LRdCuRCryk953NTIi218jiLBuhVfjw/hfju/5Owgl4=;
        b=IdFR0XqNKe6SH8b5W3ayMUzIiO96gtvA3jTJ1N72WQhKZ7SxEKxdWJ0VEMVLrh5qV8
         xYqxui2w1XexAvDMsyZXi3aJDtVMS7vZWX/HB72HMxwZ1X9HLOu/yHprXw44luWbn/IR
         SRGzNfe93u6Ce9EnE2gIH0vkWaG7BrzH1KvcL8HgI/pQ+AZ+eQf5dVvQqQTT7xtU7Su3
         A4HjlWVcie7rm6lKiq+7Yda+ODQlSnGECgcs2h6GYAscWQ9ws8dQlutJtS+qOrvbWY+X
         hHqr1pNbNbCARVH2Lumu0thQlqyg+bAjzDdL+aCTbHIghKqQrq97Em3GgzARt+JYK5MO
         FuJQ==
X-Gm-Message-State: AOJu0YyRNa5hatsVKVdLHQz+tINAdQERSZfzOuPBJWV3XY9XVGoTFXPI
	Lb5DerTweGhmHgO8HFkgWqsGTByNrwPIZDfltdtxtK+3whD9AIMZhUDkgJsPaPBy6S/e34XLu/s
	8+e9vBp9fOreNrYOB8AR8v7RTTMaEhkjMamryTZ9XUlHRn+Ktkr3oyd0pwe/hPI2O43LJ54mb+3
	Wf
X-Gm-Gg: AfdE7ckPqI8qChByXzgjPOlb4bVatZPi9ClA3lIEfWZ/CIrujuwUN3UDvy9Ms50UKwO
	ELh5OstOvXKaCge4fP+W+HLBL5/LaJvL8ukiZ1d/AwLqEl8OIm1IFDFdJpTk0Rv2pB8CCRauvKN
	BzpjBkIJE3CXE2QgEo/xjEam0Ykk+CbGEmqPMq8oFTQ6UHky9GW3NTZN659zBj2yqNM1pDDELN0
	BScvXwoXlMwpYu+/iPdQz7OjDouk8h/h0wxJCDq3BPFmokYx6gWAeLrWQJVGq6bgA9SSa7cf+lo
	arJOyEdlHYfgHaw8X99nKf0XTLmCCZZDrCspYTkXEEdMbGyoDqXjLiT6vY/pbiwM8Dxhc0gW9uN
	GHmbz36ZHwCikFr1XrqE4lmgf
X-Received: by 2002:a05:622a:2c8:b0:517:9570:c1bd with SMTP id d75a77b69052e-5213cec8dd6mr181940231cf.25.1784649087584;
        Tue, 21 Jul 2026 08:51:27 -0700 (PDT)
X-Received: by 2002:a05:622a:2c8:b0:517:9570:c1bd with SMTP id d75a77b69052e-5213cec8dd6mr181939701cf.25.1784649086958;
        Tue, 21 Jul 2026 08:51:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955de8895dsm159554075e9.4.2026.07.21.08.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 08:51:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:51:05 +0200
Subject: [PATCH v3 3/4] dt-bindings: arm: qcom-soc: Validate nodes with
 fallbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dt-bindings-qcom-soc-naming-v3-3-8f275c9d3412@oss.qualcomm.com>
References: <20260721-dt-bindings-qcom-soc-naming-v3-0-8f275c9d3412@oss.qualcomm.com>
In-Reply-To: <20260721-dt-bindings-qcom-soc-naming-v3-0-8f275c9d3412@oss.qualcomm.com>
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
 bh=8aLaY0VbPZqafdAuyM1Caiu9HMYRLztJovu39cN+UzQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqX5V1Amr0Q95xopqtyKIaor6xbmjFpUYvUmwvh
 5Yl4FfrzbaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCal+VdQAKCRDBN2bmhouD
 188gD/9QugTi0OrrHK/lFlM/zcsB2PcDzPlDeD1CzFUcO5AU4I6J1wKkePqnLllc3/cRO45lccP
 aWAkdD1DkKF+HLMnp/F2raTqNaUlGnSDHAO3MXYFw6fE7A+COA27JavJ8vDleRruxYKZDEuX9IK
 cctC9sGnYjQfABerkgMrqnCVtBx6nN8LtcnH8f+gmuu+Q9BKVtg2lEpiahSXV4CNwj/spY3a8TY
 IF1PD4zJRrIeF2h7ND1UKhLtHSnaTraOk/lP0F9i3ETx/fx4gi4+FD3Qz8nBYLGzBQbr2h1pQ3X
 adhqpvU7Z1aFmnFIe5JJomkioU9vA5AdDU8mW5e2lPefbtUvX+bMNrnsSKoOOEm7NJCD9/ibLbV
 c2bHUWCtS3UEpJGzf/50FrDnRvlOBl1233tnnqwgLpdqeZVH3et+X1FRKKwD63MVHf2s+b+zNiB
 5T5bfRj4SPLB4sNbYioE4Ra2nTqh8Z0jI2G/G6L4oeGu1JYkJWacguuP945e59KqqnQvNQzoCMy
 xrGu6rJBJzh1lbwiQsxfqGqHXeZQMkGu+RLGCBO4zUON6zIrZyNW9Sq1SwsVpykTf4mZMsHRrVa
 AFaDYgGlNfjNY3TQ1Fe7L4n/4K8LeeA/fUZknbNMWzRZaCvqHDQxGyziwDfwpwzVTzGs+TdxFgK
 /CpSOOTuw7US4uA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: lPeQtmDSnli9zyajsI8Ji-p0CBZ866yJ
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f9580 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kCvHDawpFxJh7yUt0T8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2OCBTYWx0ZWRfX8WHFTql1VHPI
 QaYGWNcnLO/MDrRPFcJaoJldanXUsmzl39MRlhRmRPDHqGc6qSnb2QVFTP6aQiVXqh/xGPGtFN5
 uP8RELN/DiM1dxk63NK9132f4VoHDfk=
X-Proofpoint-GUID: lPeQtmDSnli9zyajsI8Ji-p0CBZ866yJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2OCBTYWx0ZWRfX+bIXxaDogBNa
 a5Rp+PBExQ93EQcGz0+xTqBpald9HIpP6pPcBHKs5830UMmlcwgJa4q52Tk7x2IqhJLjoQDGx+D
 ag4ATQHLQcYYt4FTgG23T+TVKu94fy9rJqCK4QrIUCNxS2BG7QR3wfZhiKoxdsFv7FD4XY95s6W
 3yhAnw2F9Ui00pDOkp3oJM/AmTpjF63XI76NapwxiLZzHUSvYqPrFUwl4cVFdEh+Wuc9T0+kN5i
 q2qFDB5SrbrU/+uVu2pfmDe4t3l0BlyroOki9Sc8aFogxPlbSvlJVVAd5vwHR/MIR14XcmtmySw
 O/xqdF6uFEanGLfpMRZEGELWpMDRtn869R+6qCslaUEc5VBUGd1T941VXzVGu7y+qOhTW9vTs6N
 PVyPgPXmZPJC6nva1ikXX7YnSrJ4qJrckwJ48hIAgMSOxcrqN7G9p19vPfxSihp8gVxIS5xwOOl
 XFKnFE+hXJU5Qlf3F2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210168

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
index 0e921633dca5..1b0f2dfb024d 100644
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
+        - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
 
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

