Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEE13CCFB0
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223572; cv=none; b=J1kEVDP1qHyw+nZ/ypZoVVEsA3r2JvF/RvMVZP6TaedIo9mdysjXwYzlFjzJyQYbhUdBU/J9EYupzWGfjUU/PfUOG35hAkXuULs5OcImZSTusLpObAYiDqBERDPDTbW9lV33RuXr71mDuY1yE5JzAVOpZySCBjS6UPa6n8lmB8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223572; c=relaxed/simple;
	bh=Pm06IB3S3ZqIeBqgyvmudkbwk6bnZwwOq4nmv1Bp2tA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ORGZ0pwEBkRGw1d40Ui+QX0aCek/WSDboJKqqwvdfl/K9P/+VisPkKx9pnJpqAsCZV16edOMz89sRSnDf1woxYRqiM/7kswk7qe3grTYMmfoM1MJjBUu+SU3j1iMpvop+F83IZaP4QcgwUHwvqmlqiqsMaGk+lwWuUCpM8CNAoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dr9zs4Uo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZvkHqOoP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dr9zs4Uo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZvkHqOoP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3b1Sa1701740
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+v62N7JBH1aDp0r/0uYnn05XtwD8U2L+HWTx3mhO7rc=; b=Dr9zs4UoDHBU76Hg
	4dRP7XyEQnyEkK8E0ue2LSOffVFoh5E33NPu40jD7O9iWksfYko7DVnl5d9AEwuo
	n7Xbm8ugBo604KmEy/uX+K+ZwIctYg9P54ASeBwlrZoPk3/Gian87SZxKc2DrTc0
	AJv8HXyJar0R/zxvxcaLMOvybGYPzu+8PXvFQ3hqAKEUrBm+lMqySI2GOZbLgl1S
	qFh/bwYpDoeUHgYihGOdJj2kL0zH/AD+RM+9nSHPKuxcfXrqGz6G2W4ga3nfadr9
	/d12wGU382NTugjbqZCMwRyt/Bo6dWNnMtfet3B0ALbcM8t4GOg5TQc9ofhKZ9ef
	Ab/gSw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7hh8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:26:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-522de3c645dso11861111cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 00:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785223569; x=1785828369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+v62N7JBH1aDp0r/0uYnn05XtwD8U2L+HWTx3mhO7rc=;
        b=ZvkHqOoPgGjofXdDKlCQySTvvvJoCwqiZ2nLpFKozFg8X+Vc0MOspI9Ts9sJrayWdA
         tqPmUprzZ9eqVG5/YH6vydndzbbVT4SNc9+XrUvcoy8HzDahrqh1Tz6Ho1LRWDi/O3IT
         C3NcJ9Tsh7h4K6hf4NQUMx7K8qPRtS/5boIy3xifNnybkFz2P4OwNpFm7iwndrshl5Si
         HUrslLi7m9koCo8AvljLNrhY1PijmgIOjHtcFdfyeeltNU+zMKtCMDi8bB8XbIPIbWUA
         57wQFyZ9B5pLI+FwwhT4JQMX/PBTmzXfFCMay9JJI/qe78Ij1+ehIJ/vMfAkVDxyQ0aQ
         MYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785223569; x=1785828369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+v62N7JBH1aDp0r/0uYnn05XtwD8U2L+HWTx3mhO7rc=;
        b=Ge2YOrbJqUC8jTbwe9bhjlPvKnT6kSGC3M8H0uWox3nHj5BsXtXSa7j9zEqRybl2F7
         3zt8p0Bv8WIIfEsqe8Nd6xFICj9fWbISmUR3u+jnUUlT8qQ3+23MDZXqg3g5I42fIdGP
         Goy3DDDOlCaokKEKqE1612PPBrvYJvpBgtR9GzTTf5oSz2XrzNrK7F/d2MN95TnRdEw+
         3rDyepr0WmXOKg/E71+jrT4fdbkMUk0jMCWhEESuDuRD78w2UvhaMbQAYyt29mKCA1/d
         yj23l3B1M8vBNCNqlBEqfPav2g+993IK5R2QuRMLBdSUlvjuOSyLrve6RgUTyPTLdFE/
         vEUA==
X-Gm-Message-State: AOJu0YxqUPnpa5bAqk2TT61+Z5EoSeFxvocnrqxrQxE8yaZQCw5inK39
	itHvwOaFdz70PB/L8jX3uovPcD2TjDdQql8kj5wWbKUMyEG9w4dMtIIoryowF+hJ8kdIWyfdL1w
	r1yAl4oRmFmIrzry/pE/e3AdZUwO2liZd1WF8KShQO1PuZqnjbPDcPyiQCfkiRV8UIhCA
X-Gm-Gg: AR+sD11W1MiM+Nd0jht3/3knb5kbsk8z7L4h4NXT7pNK5CRMpfXy5xigxLfyCDra9IS
	uqOE4BTiEbwqBSREnaq5kOU9vfUQNryKT9zwi3tEybFF81NSuEgkomeRHxzt4lAk3Iyhgcz5uCE
	rbEENmsqj2hXhlFpNUoykJFr4Zl0eZ1Mq53dRu3pLxFhO5TbnczFBFBn3w5MJXlNAXKGm/ZZgDH
	Om9XbjqvxCPgL4pMGDIaIRdX580zRELGZF1F8OrvsqxoKOBM7An7Xts+t54Ga96l+RUcPl2FCJd
	LUVuHpAeI2o4vQknC5rvijQQPsRpVC4x6QMIZrRju9qnc/f+V8jiARgXwHi6+iySDvIvvl6h/dG
	rVqoYbEErV2OmVnuaRZmrFsfL
X-Received: by 2002:a05:622a:1f0c:b0:51c:7b12:5fd5 with SMTP id d75a77b69052e-529d719049emr10753501cf.81.1785223569293;
        Tue, 28 Jul 2026 00:26:09 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0c:b0:51c:7b12:5fd5 with SMTP id d75a77b69052e-529d719049emr10753221cf.81.1785223568664;
        Tue, 28 Jul 2026 00:26:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4443396sm61340805e9.0.2026.07.28.00.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 00:26:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 09:25:54 +0200
Subject: [PATCH v4 2/4] dt-bindings: arm: qcom-soc: Document more of
 existing legacy style compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-dt-bindings-qcom-soc-naming-v4-2-39ff32071641@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3304;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Pm06IB3S3ZqIeBqgyvmudkbwk6bnZwwOq4nmv1Bp2tA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqaFmHliQ5NSC7/+QuwAspfqrG0Is0XVKM0nhnt
 6YPNIApXfaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamhZhwAKCRDBN2bmhouD
 12EnD/9WjZ8WhyP3jXQzGp36Znm/Nl5THE1pCFsN/ctWvjExy+NSMRPBymr8vv/A6r4vqL835LF
 P2ZnIjLdVyU27btvA5LHc22XDphN+6EWLriD0joFQg8KV04PqJHJMldSYEiSQJUaQ9d7XDonStN
 3zIO3TVP17hA/meGuKkzreKgaWbAsK87bm+6XC77uzMToBgxgs8yBIYzGlIJt88KiXbXAYkqfu5
 UnCfPqeOcJfp46UwGcQ3JDcCcjQ65uojvwvGGDep+MzrimzzkfHHv/LzLb9QjmfF8SP1DzKrkAr
 D8fGkZF77osIeptti6iFrHxlWq+2C9cEy47NzX82zVWE/z6whrNAmClORWDodZWuXaHW2turNYy
 qHqABYZKo2vwd9sXm33QPVjVPi0sVX9uDyUK/hixIMj27Ub6JSpraHONnC2WZPjBtKAo8QS9T4u
 +b0CKedDytMN8e31t9h8UomFMQwSE13NzoMlHSEB/Fr9pk56YHPMoTTzLMbsqjHSMXtGhriODjn
 WLBGm1NKqcWcFtj0Ahwp3JFI6n8/dXXeobQnlnANqaiixY0/+ncLRxgo05B6NUN3Y0Nwz3N6Mzw
 Nb1oKc3MWgVw+ZDPeEhzKJ2g4+xgOWPqW/3y85czPl4BC+3GBimMCNE4bzde8qgzeUWpsb/+Vv9
 aWzruOlJPgCwWCA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MyBTYWx0ZWRfXyPw8XZwNrzbq
 dWHVr0mfI5W4BmbEMi0+zn18vtHLBjhUDbS9ymH16jafw3IS/k2H98XvEckY9nwG1aNJlzQKyOV
 wX7t4su5VyG1fQ1/VhZGlOF1SfL9GcjNTowTLrGSdJSfCsAziQQhl+FDrDzqodfMhi36gGq6z5S
 NPLslPolg+WFqR0vgNEmDumYWS+RQ39N7XmQgecrKpXaNucEBI49RugK/+nYij/HSb52n+6ijRp
 KGlVUe0E7zCsundcCKrwsNOr1d7WSXs/SKXJ3Vs/k6kqZ8LVjyioZLu0vziIhM9N7HWPxG1lc+r
 pqxzy/1KSxNJLbFA+Nqf3czMlv5oWq70J+N6QpHIprOB1TYmYFcbRUADN/rQ4ScA3ljMDxMD6pw
 ho99A+pukyQB8kQEvb5pM7yrWT13xJr6k4XefzT6IIgVf1QJLg3Sp1g//qpzrjA2a2EGh0NjHih
 kPy7RDH4Y7ILE/l5DwQ==
X-Proofpoint-ORIG-GUID: fGIXJ0lVzOtcC0AQN31M8jKc2Q1nk553
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MyBTYWx0ZWRfX5hOy+LzPAbVx
 KfZccwv5G2eznfNl8CkfrkaFAFTnD2zIELsYGXCfhtBCKOXWZ6M0Shx4QJhpXoE00+YCpw4zs4I
 aLomF5YDWxpXyUiVbGQeoPu28Vy11Jg=
X-Proofpoint-GUID: fGIXJ0lVzOtcC0AQN31M8jKc2Q1nk553
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a685991 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zJ_s7DmfhzOieU7mWMIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280063

The schema misses several old style compatibles with SoC component
trailing in the compatible (qcom,IP-SoC):
 - qcom,apss-wdt-x1e80100
 - qcom,apss-wdt-xxx, qcom,rpm-xxx and qcom,scm-xxx for SoC with code
   names (like qcom,rpm-shikra)
 - qcom,kpss-gcc-xxx
 - qcom,rpmcc-xxx
 - qcom,tcsr-xxx
 - qcom,usb-hs-phy-xxx

It also missed qcom,ipq806x-ahci.

None of these were flagged by schema, because they were used with
fallbacks and the schema checks only for single compatibles.
Nevertheless document them for complete picture and for future change,
which will apply the schema to fallbacks as well.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 1f9e52d9968d..0e921633dca5 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -40,12 +40,19 @@ properties:
 
       # Legacy namings - variations of existing patterns/compatibles are OK,
       # but do not add completely new entries to these:
-      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+      - pattern: "^qcom,apss-wdt-[a-z]+$" # Codenames variant
+      - pattern: "^qcom,kpss-gcc-(apq|ipq|mdm|msm)[0-9]+.*$"
       - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
       - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
       - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
       - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+      - pattern: "^qcom,rpmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+      - pattern: "^qcom,rpm(cc)?-[a-z]+$" # Codenames variant
+      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sar?|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+      - pattern: "^qcom,scm-[a-z]+$" # Codenames variant
+      - pattern: "^qcom,tcsr-(apq|ipq|mdm|msm)[0-9]+.*$"
+      - pattern: "^qcom,usb-hs-phy-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
           - qcom,gpucc-sdm630
@@ -55,12 +62,15 @@ properties:
           - qcom,lcc-mdm9615
           - qcom,lcc-msm8960
           - qcom,lpass-cpu-apq8016
-          - qcom,usb-ss-ipq4019-phy
           - qcom,usb-hs-ipq4019-phy
+          - qcom,usb-hsic-phy-mdm9615
+          - qcom,usb-hsic-phy-msm8974
+          - qcom,usb-ss-ipq4019-phy
           - qcom,vqmmc-ipq4019-regulator
 
       # Legacy compatibles with wild-cards - list cannot grow with new bindings:
       - enum:
+          - qcom,ipq806x-ahci
           - qcom,ipq806x-gmac
           - qcom,ipq806x-nand
           - qcom,ipq806x-sata-phy

-- 
2.53.0

