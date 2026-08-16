Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AEC450F2
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 12:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786883823; cv=none; b=HJtIybSwfMOhISJZb6r+wMyr95nd/qE6twZXXB+R6BFFospZ+5zOT3oozeramA6c7BeCEzKbUx8ctoBLFjex1LKaSK6p2QRs8XsKHcdGkvWvoVUkElGIuqWgJ14H8eBlcS9ug5uzzDFA2cbgWC1g2Yzf1NirjBE7G9h276tr0bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786883823; c=relaxed/simple;
	bh=VixbaDMJ6jKT/l9N5pd48Ss/s+gAhAoHF+1/dAgkWzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fyLFZKEhPDbCYSzMylXhCPWK4k8/JHzotbLI4Od9qEElJSFEej5mMhDzBlzG2V+DixDqGDojAHq+Ru2gRYlDv4pkegHfsisqAksXec/pmRO+jK2zBCAHkoJBPco/2y5i/SJWjXI3+hOhlhxKrdeIeVteI930BXm043f9TYWzzXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOYV6FyY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fy//SsGJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOYV6FyY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fy//SsGJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GAgoqG3255588
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 12:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YlJQ18dBsc8
	LNnJrxO0Qtel6J6WCisswQvll7QXGaeo=; b=YOYV6FyYOyASv7gxleMJzUB5mTZ
	+/HeFCdk2sFAktLkW/H4rVEQB9ARB68VBiA0oYvdL6/2i3BHufBeU8DHdx7S3i7I
	QbdERwqT0OxMeq+g3Z9/X9hek6oFHkQ+ygzNKApxbYMLuK/bVYPwpJTEVfWnMbdN
	HlS0AWdvYAeS2/vLH0pKXAL98FAnzgAh69bP9zvRq26uvziP5jeZ0XSQ4+UBEcTY
	qsF21L7eXcW5OyZTDOR0OyLbyRd8d4sRwIGW5OFVqRPVtKReBS3qQD3EqtIFyNxy
	MxJDdDPn2IM1SyJrM6Rf+v3q0NgrYEgdzSwOrbtVGavsZVPCkNju7a+7geQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghekfkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 12:37:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d52734fc41so47627625ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 05:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786883820; x=1787488620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YlJQ18dBsc8LNnJrxO0Qtel6J6WCisswQvll7QXGaeo=;
        b=fy//SsGJBb42yhPSy94kyk1Rz70lLNVDK5oB55kfg3uYRHd1bYtG7uuIoRF/kvzXNL
         Mr7oLZXtyqe/8DBWbXwZVIb0BjoHMOzGnRDVawA6dGJ8HbNCbeb168DP2zmKWGz1kpsH
         56VY/pfBINA689S+qsroSTvBhTIYG3P7veju8u8HeVW5dX8RexP7z5EH6IXJimGyoGLu
         DS5tUpgmTpH2dr54zUdZmYKa6F9vAzXcU3lpPoKE4xbJ1Es8q1FwpWU7b42suHZxqiCr
         cHF3zoqTlpefbnMtGDEOq5OwBucA850RDo3r/v96Dzk7D39omboe/Qdlz0P5TvQ9LZvV
         LmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786883820; x=1787488620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YlJQ18dBsc8LNnJrxO0Qtel6J6WCisswQvll7QXGaeo=;
        b=Xa+EWTvpmYWluoZe4BYmpB9cjFpMDyGQrEpI+TgJ2XpnV0zRSNl3K9DXZRpiK7+n/M
         efUpcnHzA+AqeE2REf5Vc9WH6CJJJSVRWjPrYivDjStQ1/C8X4S6F7BrJB6jQy6zU+pz
         g8PmRzIrQ0RdfMAG0VHhaCQBRnY7w82f2sGHwtCd2KwtWq59359Lm4fNjJNzAZnoO7l+
         tDW3lmucFpDBqri9UscA6idsEjB5fx8quDq197bUDS2O+Mj6ddLxZqS/SjtQHvIUGIhW
         32RXMg7rYYtNZpRICsMvMC+js37hfUdMwxr2e9Nya+e2HwrkKebJfhHlF+LcjZy6yrKw
         uyjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rql8B8Uu1EoF6nC3TmwqO5/H8LCf5NpEkPJedlV5PazOj7UqOWt9ahtXKomRFUVqWuRzfZofZf0RPlmNg+M@vger.kernel.org
X-Gm-Message-State: AOJu0YwCphOVWx+PmGFxZml6A79zSGnpth2OFM/VkZPyKmZUuYEaN4OU
	4YgPCRbOt/OMcWX6Xj8x/y80GcH02bVW266bDtEhUHzlTlUNXCtGDYuxhXIDTPk3GfCCUJhxyZE
	glJy1XkzjuTToCWDGcLaQD0NndGWrVYNOX1jrQKLe9pfaVlutbEVObSFA2lAsRCiHx90xS5yumC
	wQZNg=
X-Gm-Gg: AR+sD13srPA6WQs4gtEKQ2osPV5gzVIyQk4nOTmyBcI5HLtMS+XmIu4rjWQvcjjHoDD
	51iM+3evjMywUSEgikWtIbp+jvMIi7MKXCEWdjVG4MYToud983+MuIZjM2aLWbOr7hg/czrMr4y
	sl7mlUO4IFHe/u7yYrO6Mmkpbs/haimCVr5IlM9A+lnZufGYN2frKqe4mIkrhn/ToYtCxosRUQi
	PR+A5klrX+bIJ358YC4dAbyRQARd+1S7DBM7pu06xg8S2h+hqPDVMURqa+sCPmnIAh+34i6Nu9U
	+MgK9avD30puDejnYqEyWlC9gwsO1WAafzQOTv6S5BfQjh8LWw9LQliYh/gGCPBB71clgu7qoWS
	odcZX4grIXabLj3x2g1OTWwcxbELop7M+vP7f6BGMHyErdaZNvnn3gF4TybAM
X-Received: by 2002:a17:902:da8b:b0:2ce:f9db:a9e0 with SMTP id d9443c01a7336-2d3b0e99809mr185732585ad.16.1786883820384;
        Sun, 16 Aug 2026 05:37:00 -0700 (PDT)
X-Received: by 2002:a17:902:da8b:b0:2ce:f9db:a9e0 with SMTP id d9443c01a7336-2d3b0e99809mr185732125ad.16.1786883819969;
        Sun, 16 Aug 2026 05:36:59 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320e9df03f9sm26146956eec.19.2026.08.16.05.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 05:36:59 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: qcom: kodiak: Use hyphen in rpmhpd OPP node names
Date: Sun, 16 Aug 2026 20:36:47 +0800
Message-ID: <20260816123648.1632681-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816123648.1632681-1-shengchao.guo@oss.qualcomm.com>
References: <20260816123648.1632681-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EKc2FVZC c=1 sm=1 tr=0 ts=6a81aeed cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=X1hrRoCrYGTIo9OkIikA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDA5OSBTYWx0ZWRfX7e+atXeRZ40Z
 ahHLF4JLuUzRKqwf55HqrBcEiuIW/0XEqVCIjedpa1UWJpHUJgUHIOVFqCK6MfL4nD57YB1F2Gp
 9LH3NlOHqzCqisX+j/qQPg4x9OTjU/0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDA5OSBTYWx0ZWRfX4z2FAuWMTIZU
 TGWynZnVHMCyRT/gchgAScZZhNKXBp6tMCuxQRrAn9cwtO1R7j76tqaU2yKIDDXRa5anqCUiGSg
 vRUqg0CpmZEySSjavld/BVrlEnO1I7VQRlQoJm63FRoy1xtk8QyxanCzv5oK51nRlnEZQ/Zxo7v
 azrdxTQdh/hVC3bYnxsr2dkKVgy10Mp8Vzj3PPJsR6V3Ia02hemLHa9XcUcqbVt0TF1z0JqV1v5
 gz+ctYT2/LxOZozUq+bnN6wiSPzOjponoWBdqnMNto1AuChrqbJlTsXcH/9GMo2/wPa7cXaMBL8
 CfUaLZ5lb6kdyeNnhEXAMrcDH0GBXRSFXPTwTvs4URFNdJpDdT3vKXISnLFBnMekYCK5NIcX9Af
 +msAC+IVJhQBOCIP5MKSZjZKdPYZRjDud2+kAomYC3Kz8BPzU2ehh/XpdmGY0ZWvDh0zBV8Qvx8
 uF5PqGZLR40DcTRB6bA==
X-Proofpoint-GUID: Tpqepq_b7u1I4VRnVxwCHr7QKBLigw3E
X-Proofpoint-ORIG-GUID: Tpqepq_b7u1I4VRnVxwCHr7QKBLigw3E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160099

The OPP nodes in the rpmhpd OPP table are named oppN, while DTS coding
style and the rest of the qcom DTS files use the opp-N form.  Rename
them for consistency.  Change should be safe, because node names are not
considered an ABI, and all references go through labels.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index f2da3706d5c8..021e5f119949 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -7010,39 +7010,39 @@ rpmhpd: power-controller {
 				rpmhpd_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					rpmhpd_opp_ret: opp1 {
+					rpmhpd_opp_ret: opp-1 {
 						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
 					};
 
-					rpmhpd_opp_low_svs: opp2 {
+					rpmhpd_opp_low_svs: opp-2 {
 						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 					};
 
-					rpmhpd_opp_svs: opp3 {
+					rpmhpd_opp_svs: opp-3 {
 						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
 					};
 
-					rpmhpd_opp_svs_l1: opp4 {
+					rpmhpd_opp_svs_l1: opp-4 {
 						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
 					};
 
-					rpmhpd_opp_svs_l2: opp5 {
+					rpmhpd_opp_svs_l2: opp-5 {
 						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
 					};
 
-					rpmhpd_opp_nom: opp6 {
+					rpmhpd_opp_nom: opp-6 {
 						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
 					};
 
-					rpmhpd_opp_nom_l1: opp7 {
+					rpmhpd_opp_nom_l1: opp-7 {
 						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
 					};
 
-					rpmhpd_opp_turbo: opp8 {
+					rpmhpd_opp_turbo: opp-8 {
 						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
 					};
 
-					rpmhpd_opp_turbo_l1: opp9 {
+					rpmhpd_opp_turbo_l1: opp-9 {
 						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
 					};
 				};
-- 
2.43.0

