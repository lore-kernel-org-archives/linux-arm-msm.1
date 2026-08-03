Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DED43848C
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 19:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785336; cv=none; b=Wdi8u2Z6z+wjXQ0BIhj2/heJevnTXL84ygjhYUCqXLUxsKZcDcrCWjSTS4RYE1FJFuPQHEiUJNiZ8eLKUGLqBMjMYGqdsGEfo8t8b0tXnSYURLlcsyK8mjBAzHC+OBVCAdVCq9bRvOvbFCg4r73VMbqxyXJ80Vz5w/bupQzw1oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785336; c=relaxed/simple;
	bh=3WguNkZGm4iSMHuebuPta2BUTd4TMeN5FuTqjX/mPxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BKng2AdOPyNvNt1IfNaeBzdnXHLkEzFQBmwE5PAiL0sPon7eMiy94k/0whbEAGcGzVMy4xl03zgbZbSrMJD4nRaqBma8FXOsBEynyFVbjcoAgJ7IXA1g4+ULxkgTtXogZFevXoggMYCrXBx9vG5k/HY52TVIAW1Qx0a2k7v40x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hFnYLUZY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVHm2utN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hFnYLUZY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVHm2utN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673H6jEe1053491
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 19:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NFVdhUyls+AE0wnf4/MLIsuWl8dV3/GGq6FvvGoNI8M=; b=hFnYLUZYesDyjyHQ
	7qkitT1AoWrHEtMnoWpDrhvCpgxCtwkzTcz55lSfGlavhmWG0WLxOaO/Na0gK8aW
	xW0p45E9IgswKt7qiKmmiO/pq5RHGh48HZoD5ahVEAKpfxE4Clz/AzRHmDya1lRl
	ho4gJXJzKGjHmk/pNn3DMyHos9JCl3ahV9mNrulK7Q3XR0urSa8lRfUdnmkUqUWH
	7nBNCud2iF9Hn32OZfgfy8E/d8En8ofbFOxF2ppYZr6wzlSW/r549m3FgulCKQfl
	mVZ8PfqTw+1nkD/96PylkcmThBJdq925UQgmiOZOsXYLScFjbMecUnPDlkkE38Ue
	XrxpCQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3qgn19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 19:28:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso3985617a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 12:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785785334; x=1786390134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NFVdhUyls+AE0wnf4/MLIsuWl8dV3/GGq6FvvGoNI8M=;
        b=ZVHm2utNTMJIku20IRk8aQni7I2ZqDp+56FGrsl3x8mNQ3J75NWckfv+WV/BYs04YJ
         3CeNFQUZH0LWkhKOm2hJjXklA1uU4BPI4bljJ7VhgQER+d9XEF9Cp7NJ0DrxA3NOdmMA
         1D/1CkQ9eECkVga/qIoDF9M7j6d/QBzp5gJz7mC7k37dOwMWB3UndkLyYhgmrYAvUIvB
         q7BP9eCpelnG9qB9s5al7B+Dy+DHDrZNyr2Fw18wI/jcMfnRMcnXCjYqzJg121KYoV3G
         uMwDyiKHJhD2Bc9TXWaVOWDkJ7CJKtafjEZMVHi1Famab83pdK935UddnP5DVpeX4+cF
         /60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785785334; x=1786390134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFVdhUyls+AE0wnf4/MLIsuWl8dV3/GGq6FvvGoNI8M=;
        b=qQLVPEYc6APYdLlWl9V0XSMVO+5CwUeX343nZ3U4CkriGSJOd0JhOvlRzJx9P96g4D
         hxYaRAIMibyRBxgnA0VtapisjxdGq/5MfO1m2kAorVAW98TSSM/Yc3IdzeEyVxkAdRoL
         Wt8xeVFbH951k4PTBc3vbQ55QzWhxdn8/+yXbx71aqUB2l813zOHo4Q4xpKyLXj05cm+
         VIYRpA2C5asURTmtkvtJL6hO96LuZvzMorMectueWAYl8DesbdeCW7pWlm0iklXLGpVz
         1TWGVn70c7JonST91VlQB8y8i7U84D2RtmL1bHDZfq9q1JkdV/8YGAmbCEsEka/X6LMF
         UTJA==
X-Forwarded-Encrypted: i=1; AHgh+RoMvvKLopT/e91D6l+A7rARWreqFN+Z2BEDW532QHP45rKtdoN6N4+87jutqnJWDQvHrz5dUbi8GiyarQKe@vger.kernel.org
X-Gm-Message-State: AOJu0YyinyMoEyDtePTKmT4RisGG1N9hwhLOqkSku3JoCSWdO4lH4ksM
	PTd9KhtUZC2doDycALoCE8PxSMZGHN+Kfl5TNLHKtaMjJGva12XF/Yd3CRr4NUaaM6w/g7vTYkh
	J5IV8ym2OsXbso3w06XnxRdFBT/UFK6gkYWoChJQWd31N1FBQDtWhQ7IZxSvnNWXUbyNA
X-Gm-Gg: AR+sD13jOTcMLZ8MQpfw8/65fqMQ43VnidYUom9/WugrzQ1yqbnvgFv8IKgFpxHuW6X
	PYAE9OGZi4JE3oHGJnQgVkAbm8FIwXmBv+ElgKcgQqfnKE26WvwVqPShEpjYk6z3W5sgohWPHsW
	bts8bap7QtE2m9S4NLMMqCoNZ8cCHoYYzdEfaCoRdDlF3ShZLm+pIVOgPvfzCpva9fpcoUUYoPd
	FXOM3Fw8JOkg5onsmykZsT473Zbqn4POXhM0NwBAuUTG5geh7/x3vNdmoZKCJ4WzWB54/THufcB
	yL2ZEu4K/gltVaOfMZyTpNAQMvs7iwMYmsinAepFDqCtyJgDXxtauGGp1FQJoV0B885tYabNJ/+
	NjPGcnRukChFArfFQVJehRwsaXHIJzQ==
X-Received: by 2002:a17:90b:53c5:b0:38e:85fb:71b9 with SMTP id 98e67ed59e1d1-38fbc3f9aa9mr10635772a91.4.1785785334152;
        Mon, 03 Aug 2026 12:28:54 -0700 (PDT)
X-Received: by 2002:a17:90b:53c5:b0:38e:85fb:71b9 with SMTP id 98e67ed59e1d1-38fbc3f9aa9mr10635738a91.4.1785785333740;
        Mon, 03 Aug 2026 12:28:53 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm38622738eec.1.2026.08.03.12.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:28:53 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 00:58:01 +0530
Subject: [PATCH v2 5/6] arm64: dts: qcom: monaco-evk: fix SerDes PHY
 regulator supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-b4-sgmiieth_serdes_regulator-v2-5-c4bc688177dd@oss.qualcomm.com>
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785785297; l=1063;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=3WguNkZGm4iSMHuebuPta2BUTd4TMeN5FuTqjX/mPxw=;
 b=d433YrJuwmbS9QQ4N+lBBfppRD+KL5aUeBTOD/pkCGHvd5VbqXp/bJWQNrrrF36YuIMt6PWEl
 Q6jVWYRXj3gDSTgtXKmAboNx7Ml5wJeKXiCu+g653Dk1E/nuMxjrz52
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: yE17JqPcEKzCCIeJlPxw7zMwXqKeTPuW
X-Proofpoint-ORIG-GUID: yE17JqPcEKzCCIeJlPxw7zMwXqKeTPuW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfX2cgLAi1BLDlM
 PAieUEYt/asE6UY3CBz8agF9bls/IpSI7NE6u797JpIsvX/1fly5ll71b34VF5dW9BdZpboh1VQ
 wOdeVUIueCKcUAIkYCxNgkgP6YzF4Y7ZBXp1LctI+w5faaWTC2sYirZbYEtxK79G/F9EW2WrzXH
 i14FTCmdVgiqQh+csKJji2zaX+ND3MItycPMIeLVRMExqIkStrH3wHXnXFlE+ECaNtsAzSfqOq7
 2Fr/ws+wxlaX8jww6zQrQ/yx4jzfZFFkeEQo7WnZp7ZaLLzgcGh2TPxtNEESvQ8iTlnegpvIjg1
 B2oqkqunLuQvbMacXjuy/8fGKqNr/O03Zam5laUVLjNcEuc5pO+WUEWOxxeHff4Tq8JbYWpWC6a
 ps1zPRBngNUUqDlwUDCFJT98oNG9YlaC+IeutvWMTSx6ZlGwSRs2d5z5cETNkgoIUMVOm2ap0bp
 y4g8ygaBEEABdV1Fx5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfX3R9NYhi/3ZfU
 20+PwVdmi+Eui2qcZfI6i6xGkSYwD7lNU1dwHEECheUrIkPmFaxN7cRVRVx1UAzIZMeIbbMFz/B
 bWPKJK/k0DyHBd6LKpYGCBHX5heHFb4=
X-Authority-Analysis: v=2.4 cv=ONEXGyaB c=1 sm=1 tr=0 ts=6a70ebf6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=C72GEnTMbTZ0pNA8GBMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030172

The SerDes PHY node was configured with 'phy-supply = <&vreg_l4a>',
which only described one of the two supplies the hardware requires.
While vreg_l4a is the correct 0.9V rail, the 1.2V rail (vreg_l5a)
was missing entirely.

Replace phy-supply with the two named properties vdda-0p9-supply
(vreg_l4a) and vdda-1p2-supply (vreg_l5a).

Fixes: 117d6bc9326b ("arm64: dts: qcom: qcs8300: Add Monaco EVK board")
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf130564efc2d0159ac0de39126e80..f787e78b35ce48d7544116e4383561b81def8ec7 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -706,7 +706,8 @@ &sdhc_1 {
 };
 
 &serdes0 {
-	phy-supply = <&vreg_l4a>;
+	vdda-0p9-supply = <&vreg_l4a>;
+	vdda-1p2-supply = <&vreg_l5a>;
 
 	status = "okay";
 };

-- 
2.34.1

