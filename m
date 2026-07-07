Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5244041D4FF
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 13:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431380; cv=none; b=ZeKD5cOyWzKLuATScCI3qIAQyact7C5+MIAtQYPcgIpFuju8J5GUrwrwnPiaPY6BT6VEERWe6MAJTJ1kjHsJM+Hv9Nnh05TFuJgWE3FjLRJxa9ctjWPU4pmSxF3DrhuY/jrvx8o1z0K+o7QZ33G6dD6Y0GsttGzYjIPqj6Fi5Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431380; c=relaxed/simple;
	bh=Bid4n6JTOA1xgaR4BpC0MMEZzAZiU/fd95e9vAhYLbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KOUzGX5s8qAWRpOmrQ/8x0hV4zB08cYW5PDKdn9zbkyr/yDkCfPxT800YXMnXtinqRD8R1mZ+Fn6nW1OD6KlaKueY9c09M4fjQN5GhP4Vnk2JhJZ34HQvDKWlrGwsunE0w5pP8ldtrOnh+Uyb27+vV54jDf85LIp1+kirDtnq+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DEnFDe0Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kvrj/tv9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DEnFDe0Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kvrj/tv9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8xFm3719155
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 13:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RG56V4Z+Vn0H34SgJrg6IYyHyxjczrTMMPHe2w1Yddg=; b=DEnFDe0Qz7EOZ+3T
	bUZ8HSvP3drPRhGSlgE5424s/l9kcWvrHXUEIeP5lFxi5XZgQ/vxpJzjQoI4xRlS
	fi0xq8oWeEdvZde/rO590vPU+WoLc6rx+DBWHp1sEuEOJ/lrjeCdl17DoE1C5lqo
	8hxt8rKp21f4R7sBWoNdIZkg5oZSiFn1RtKgu8bhhuJ7P0LeDYHUnS5uPACUUhk2
	/NR34am4tZdmpnLRDKvr1iew69mQv7/FMDbC68Xurf2012XOePxD6iEqzcncLWER
	73cRm/qetGB0usIJJnhLcjzgQN11WnMTD+zEbLy0nrX0Hbd2XZgrPwJkOn57tB+n
	CQiTeg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v3t9qnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 13:36:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ea75996387so88467266d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431378; x=1784036178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RG56V4Z+Vn0H34SgJrg6IYyHyxjczrTMMPHe2w1Yddg=;
        b=Kvrj/tv9aNcB8OPpjtN2nlJw6k/DtU6Ugrvh6loLZ79AkkBkklzTfp+Gsy31jw7Axz
         T1bcTAMHrjHDdmo3MSg8cb8F2uuMCMEFbW7J6ls9A7TFCeKYH2s+S5ZgevtXRPtVgpad
         0fwz0/kL0cHMYkr4EkSCf6589U3qujoKXKbE4QILBvV2x7kiLiBFr0UQamWOoKVP4TdC
         RVdcLw783COj4nbTYKDy30XzpIqK+c1KiVjbOmRCR7oLM7DmVMBe74WvQaqVT01LU12X
         l44bjVjt50xIF3SnUvOLn9gG69Mx+vWfxuWfWx51aliIafyfZjHW06W4NBh0VyfTcQZh
         Fukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431378; x=1784036178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RG56V4Z+Vn0H34SgJrg6IYyHyxjczrTMMPHe2w1Yddg=;
        b=VCXLdhBvAkemxBAKJc0BSYfPF93EYLaCjr7Op0f6MvD09OWt9HV3SeyQGCqz3vqhM+
         FkgiTsX6rumQadLI3o6W98dd2AyzrU6UL62F1FZDJcRU31vWoGyhU4Vboew+jkE5jXhL
         jEC4bQEI57qHemqbBz/h+3XcNwNStu3Frvru0syUotkBD57ym9v+84hmudZpruIsDUrU
         M6BAPOW53FPBBKkpcTcrVkoY1+yeZrWXg1W3qIZZYfRHPpEM9+eExrm3pkWFweClAMSP
         +tbD/4iJoBf29QPEZjdpkbVPXEy6xFyR0Qze6deEtbZzWmsvmabdqvwUuitZmdEyBMmU
         ZxpQ==
X-Gm-Message-State: AOJu0YylPxmfzkocTceKu6feFfPLiDkiqFepUKuvXr33BV9OlBbJdSC8
	BnNZl0TPM6/51OrYqPVuFS9hAzbfadrmhhIHwJM1MOvYKLq/A3yxmxi9owelVQvYdVN3Vfh8JjW
	U2Xg9DPAGpO/L4wdRIqS5eE7PhmFXh5zk4Oa7U/UNaGlA4wiP27TzrJs0wAz6O6O8dh0p
X-Gm-Gg: AfdE7cnCn7qdoBwIqGIQL2fzpdsE7ZHwSASYjiuBQLJzQLIqliZuu0a5gK8kEj6FCxi
	0CEe3iqOYXXrfRbSSr9dtAMuOmJY7sLaWHTlxvDLY0mHPnT/VixNGo5ZZk7nkS1fcnUEzPZkqee
	PVQV/3yE15lJA4/JQP71SJUBKVF5FFZiKyb9x/J58uCzkWvVGNdjCAlkD6Zapc2IDkKsTFC9nHe
	nTUFbx9OxorhcSXR+9MX7cYn1OJtlY2/Iw3qyMk3RyFpIx9UGQb6vP6jkREzqTP23cNHJTfCPMY
	nUWFNHM7ES3b9th/P6RqacnaTZjrig6iDf/+SrVKs98vsk70sBFh50UD5YYlSysHTEdAzhYzDfA
	6f0UZJGtuZa+cYhThRlIdjsC7pnRnMmvAMwc=
X-Received: by 2002:ac8:5f51:0:b0:51a:8bc9:2915 with SMTP id d75a77b69052e-51c747aea11mr56133371cf.8.1783431377323;
        Tue, 07 Jul 2026 06:36:17 -0700 (PDT)
X-Received: by 2002:ac8:5f51:0:b0:51a:8bc9:2915 with SMTP id d75a77b69052e-51c747aea11mr56132561cf.8.1783431376609;
        Tue, 07 Jul 2026 06:36:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm34258187f8f.22.2026.07.07.06.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:36:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 15:35:59 +0200
Subject: [PATCH v2 1/4] dt-bindings: arm: qcom-soc: Include Eliza,
 Kaanapali and others in SoC names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-dt-bindings-qcom-soc-naming-v2-1-1b7d695be2e1@oss.qualcomm.com>
References: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
In-Reply-To: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2045;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Bid4n6JTOA1xgaR4BpC0MMEZzAZiU/fd95e9vAhYLbs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqTQDIyyfcd2SoKZd3Obd8VwogenShZHZYh1Th4
 fv66xTWJiuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak0AyAAKCRDBN2bmhouD
 10fyD/4wM3PRZPGPtv/uNCtSOW/0mfGKVAtzZ2CUCF5iFHVjTT5VTDZwmTfnr1XTt/NBtAhhrkG
 YSskW+rdEfL35chbmgshMBEfUbzD3zPrkZAELBLnigMuGVQs4LSGEkhaTPX2i2LQfBZsPaEPl+6
 Pu/SJCgzKUlXYFE5qk0abK0fVWyEOwGoyWgWKadJUFgvMxLNUozq4UPsBgOd+iapNF5lbQ3/4Hi
 IPQbJIyyml8RFlTznHOWvxzS9NfZo6Z4aMmEnzvVAVnjZok2z0rw1O3c7IWcnLUTWqPMiycoqTy
 pFStFE2o2t85I/D4i79LTUudoBXt9rr8ner9rkOe+kdP9F5UB/l25D91nk0X+0Q7vuV7F6tyFpZ
 m2df4EjAm48SK82Tnqo0I/alcdKPmKpT3E1zkoS1M2tfD/6yb4cqrwnioTNqQZYptOyTRqaFMFX
 9SetxFiXifTel5ZHiam+cdq/En2vBYIsGYiFudnAKYGiiLBybSypAys+wPwZ7aS0K3AbEAyiMKb
 xAD/cBhYcyaYH3JZSBzX5caucOEnYo/Knoaqmy+wAvjgXsmaLoTtp9bzP77NxErhr3VCS50m1dV
 nR2aUwO+En0IPXc1/mfeOMseTyjso0T0oLkPQc4KyRnRx+s4jqnmQwAVnWKtdkRPD2NBSiRIrpu
 lN2zHCw3dKY0A5g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: yB-_FcWn_vkM8SwRPzse_y6BuAzUjTTv
X-Proofpoint-ORIG-GUID: yB-_FcWn_vkM8SwRPzse_y6BuAzUjTTv
X-Authority-Analysis: v=2.4 cv=HqVG3UTS c=1 sm=1 tr=0 ts=6a4d00d2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ujLjCFpqU2tUUBGeNqAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX1plXC79brn0X
 ocNeNiLoQozYhGXNzEktEhz+7ZQwWN/HjPfjEPPETLWF+nj1tLROP4EqCFUef/r+FpQasmoK9xx
 XywDHBidjJmRjKfjDrfkd1KqCcmE4rqmTAuI9Y+T39LipLEwgUqBB+SO3AucARk3x1YdkQ2xt4p
 Dr5U5uhApiUxCyYUvob5HSgW2mGuXDWo+JC2XX4HMcPT4HVPv4qsmtjN1oXAW+aU80ju5+E3a7q
 D0moOVjs81J6x8v3Rhii7RPiJ8k+qx9hajMkvHSDQame3dxgiRxTrx1T5SjmtHnaoa+500QDD5G
 TDeok5X1J7TsEHQD18mAg7CkwFHpio8HmnHz/kOCRbtnQPS5IDlikIlFajtXpZwfvbI6Oou+99s
 x4Q2QFqTr0PywG8cQM9BiDwR/CsoOhvAKMbGKGUY/QljMNnOYPQMAkkimbyWMXchu7ITUhXdL3o
 BFIk5upRYkCI8eyjZsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX6B1CXWikuq0B
 z2tUE3rdx44uswwVqHrkNSOOMJorU6wPekGEyZUgq9oVo/Z95zTBPrh+VX2kT7v+P6OJyQYMJxT
 ZrnyjG4PSPYFklDfpMZPZE7bBMFHup4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070132

Grow the schema checking for proper SoC compatible naming style with
recently upstreamed new Qualcomm SoCs: Eliza, Kaanapali, Hawi, Mahua,
Maili, Nord and Shikra.  The list covers only SoC IP blocks, thus no
Hamoa or Talos in the names, because these are codenames but not used
for SoC IP block naming.

Since switching from model numbers to codenames, this list with explicit
codenames will have to grow and list them all in order for the schema to
work.  It feels like a churn, but the compatible naming is still mess,
for example, the schema pci/qcom,pcie-x1e80100.yaml with a legacy naming
vendor,IP-SoC (qcom,pcie-x1e80100) received a new compatible with new
style (qcom,glymur-pcie).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 37fdd5a080b7..1f9e52d9968d 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -25,7 +25,7 @@ select:
     compatible:
       oneOf:
         - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-        - pattern: "^qcom,.*(glymur|milos).*$"
+        - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
   required:
     - compatible
 
@@ -36,7 +36,7 @@ properties:
       - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
       - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
       - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-      - pattern: "^qcom,(glymur|milos)-.*$"
+      - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.*$"
 
       # Legacy namings - variations of existing patterns/compatibles are OK,
       # but do not add completely new entries to these:

-- 
2.53.0

