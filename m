Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C37448F85B
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 12:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524519; cv=none; b=NhZbJVIr5HDbSy3mDDCbrlxSqmBciC1VnX3Vhglv5CCPriHO2oSUOuTGLHRwVvInB+8XJC5+1jnvOEgIG1Z6QOs4hjhTm1ixG+kX8D0mHmLTgoxPhKw9hUhgeXaAJzJRKI4ks1HhlfzWVGEh80p/74/bv6pg3e7g0GvSB2iWrIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524519; c=relaxed/simple;
	bh=YRzvAVRkZbWBIqG50cR4+R6msLR10iB8DJJthyfOr8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ee+gE950Ftww7MRWx6xPgg4CDFz0x+PULZhu1BoZDAeGGgShNWx3SPRwUwLHS5GFKpz+2BLtBpBe/X6/KapFXOUHB8HcXmm0jMnHGe4PxKw5qzLBAzGGUAOzkjWOx/TzEyBR9GW+aNFF7YLX183Z7abEFQN6Uaur6ml59VtAxt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXRFhNQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NPBLO9ms; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXRFhNQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NPBLO9ms"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AIQ2v3168626
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 12:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRsP4wIlhmTURuqn3eYM1ANLpIvruoM/cCuAt5SZxkQ=; b=NXRFhNQTrt1PX6k9
	AmaZVvdhvkTskOhx5hNvbDTxSzv4zgz/E99KNZIl6HeDzz9/HIt8vBts5124tFYm
	XqtOUDUWedKyR9FKSIPSdOntGtd5HBcclno3TXECgiAdwkmpTbG3IhcZiSUQIDI8
	iPIGqvD9OkxCPGqdDfHCqV4J7bAxZ20KCHsCYy5vcsi+1evYrJvgLCIgTuz818dM
	myHTKS4emBJFwZuveRgNzeFxn8NxNQLN5NVXVkkNy74Fju2rnUj+AZjHWgcmKFqw
	TJqGjczOgcYy4JuVGPSZdF8bwWYPmn8tHlZ2ItSMZxZzCk6PTLYyNV7WdrNjPiIA
	v5TcZQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqtsa4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 12:21:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e98e74535so15569766d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 05:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788524516; x=1789129316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRsP4wIlhmTURuqn3eYM1ANLpIvruoM/cCuAt5SZxkQ=;
        b=NPBLO9ms1WK20Ta0cG8u/XnLk1juCBs6q/zCerqruEf5FU+UNnCfji+E5Z5HtegY7S
         Z0OZQBpVY+ZcuZgLcfWy6lKakLvdCOz260eLOy7muZZuAi1fbZW+WkLnP4ARqY9d8qJo
         zxURVPFqYzc+9uqu/49kmwqqAvZtTM+q6Y8IdZXURhRRp4fhzETi8Ucakr9DSkbzKWU6
         2u6eQNICS5eFkB9nLBEydY5Tq2j/S3Ms8QtcSmo/0Ha81rTuJfDVJ8oLKrN+jiTtz+sk
         2KqNqxdpdmjDK4pFh3VbVYEHpLTSLXHOj+WDW6q0YTJu1ovmOrowkduLxusjxVQ4SQZY
         ab2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524516; x=1789129316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRsP4wIlhmTURuqn3eYM1ANLpIvruoM/cCuAt5SZxkQ=;
        b=aKQqfIp/CqdyVaFy3wXuv8HxdiVjQ/C1Z6Cky0dilM9ID1r8jjuEAj439UTOZnN3F2
         hjWIYyhVWGu/ivYGbBNlBAa1e4fIwn/n9kHBIIGgS7HtRBJlqZQwfMyPKaPz0/CvTgYi
         3mjYfOtHKohtICrgD7ERZZst+goeTQ80HWgMBD/U58JfZL7kJGo+waTHESDMMGLzdTzs
         KNGe7fEV/vbS2oz3r5r0f4i/YBfRqOVoi5KsD1qZBQElv9yw5Myvko1xsu+RuY8E2JWV
         1EqyTrehfTMqgA92k0IpInjpboOfT+Qg1HepVNU2/dEGsPcHRdjIWrVd1pTe2RWO7t7Y
         uCpw==
X-Gm-Message-State: AFuF++nXAALsa57ohs1mHSGHKaUyJQg7nSmAIncJV2B+2FXlvj7ykccI
	ihsGQL2tABdA0uVl647gwlo25PzV2k9bSLo2Z/OkZee9NPaRAaU7HRZDz4MoI0GwyOrktCemjje
	BIWuBwTNCXKllwmH3AkgSz0/M443DLQqqg7flsQr1dKtNUPU8aue2yOQEO9XoJ2usDjihS4tQww
	gB
X-Gm-Gg: AYBFou3BTZw9O7pKXBfdOhHEz9/niaYcng2E4lEozzM+2voUGsjcupPU5l7jVBUchzu
	+HfIjzVZ1C0TBzfsAKXMGaIy+NOwaLNsGS2sr4+z/RiiGLLbNJzGEYKnrbleU9TEWa6b/h2xs9v
	/q64hWiccVQpo4Tx2Q/F2D2WXbb0dTmldA6PyUvHQEPLnEQQouRRgKyNg22ZtSsImj01sbT7fAI
	nXvUe/JX1OSpBh7DXt7RrgZl4I3FdLnfZ47BEAefbTatEJ9ZCtG3ZGw55qGnTxkFQDrintfQ7D2
	gy4IAg45Hf4IXu132blSD3dDODEnXlDBofCRx15y5lrn2QzLWQlCa5pLvNNDhyI7CnJ1d3Qr18C
	c0AFwWg==
X-Received: by 2002:a05:620a:4484:b0:939:6de9:d52c with SMTP id af79cd13be357-93980502f47mr482090385a.49.1788524515400;
        Fri, 04 Sep 2026 05:21:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4484:b0:939:6de9:d52c with SMTP id af79cd13be357-93980502f47mr482079785a.49.1788524514468;
        Fri, 04 Sep 2026 05:21:54 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm195686665e9.1.2026.09.04.05.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:21:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 15:21:42 +0300
Subject: [PATCH v6 3/3] arm64: dts: qcom: eliza-cqs-som: Enable CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-dts-qcom-eliza-add-cdsp-v6-3-d4f38936902e@oss.qualcomm.com>
References: <20260904-dts-qcom-eliza-add-cdsp-v6-0-d4f38936902e@oss.qualcomm.com>
In-Reply-To: <20260904-dts-qcom-eliza-add-cdsp-v6-0-d4f38936902e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=YRzvAVRkZbWBIqG50cR4+R6msLR10iB8DJJthyfOr8U=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqmrfZq7frxFIaffCzDsLIydxrjeqPaqmxisfWz
 vAJavffgHqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapq32QAKCRAbX0TJAJUV
 VhzED/9DZAbPBjiY4HjbvYJbueMinZFwHeIpWUXvgyX+feOuDpwY5OD9cIPOXnbg6ChcO8oSqKR
 YspPZeM3lk9w26/RcUaj+4C8bju4bAqBSL9ff9+WzrHg4caLZPuvVPFuE/7Er07EmX5JwbkU9UF
 QstnTzan/s1OYPU5Tf3qIO2/GD+tEoqmpUCHbyUfOcQrzN1N6hzbz9wVOYhLSjoDBfbFVZNFy1D
 lc0uGrZFYu4D+z8V0j59cqUuHD7qq+SxXpCNvAH0PfFtm6vkl0sKyM1+xSWV1J1j2FC3wDiKQEn
 kphjd6vKK7JS/dQBFxMc9caKDWDkONNuV9g2ZTMqEzWIAT2elAwRl84+Mwy57cLMor3MiGKgCVW
 DXcqS06WuqBtLxF16K+WzMA5kAZ9y2zkoJReltZSea941qL0j/N5owyiuO4Quf5foJhO4i7EY3L
 OxIi4EZ0vqtQ38szhtmxpWil7lfI2I5Li2/dm2I9dVamJNOdK0g8z5QjtayA3DjcxvoQdRLqb+f
 PyarX2SuaJtdrbDguIlOzB+VYFuZ8MDq2i6+aIZNwQX079EXNtTFmHtAgMfyxml3qYFx5Odb5s8
 1DFnJZ04adHE/fN2+ongNu/V+qP7+tUqTcX2/fyOHy6OGaz7glUojqEqUdvkbCiaq2qrOvh2jQ/
 /3N3tMV92nvBh2g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=YtA/gYYX c=1 sm=1 tr=0 ts=6a9ab7e4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gskBRPyYVKVSocykC0cA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: SzohokyxiafxnfVCmYc3xi5y049XTtYS
X-Proofpoint-GUID: SzohokyxiafxnfVCmYc3xi5y049XTtYS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExMSBTYWx0ZWRfXzoygxqgKHPY2
 fSQJAI7Cp3o6rqB76JJwuNBQxy6Viu0wVjIBV7IyH7ao+xuGNtSCnxFxzSfu1aDNbQvzWjstlUd
 JWBFZX58KNVcJ7G3HP8jk7ClUJSkkZA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExMSBTYWx0ZWRfX9B1R5aft5CoZ
 /GDIJFnasxQlmNuT74cC6qTWF3Ld9WWwePNxqs6FRKGgHQyRILe6G7MYAKEL+4HGcqzAUOAhZUU
 wRJlkbgcpnBtdOCDDtqSlSKxCyfxmn3UjrsyVKKF//AYUL4EzRaytBjaWv0ba4NQqHC0l+IgND9
 hcPDhYo77KgIo/BY16E/yUiPTmqicEcTmMlgw/alxLnD6M4z1vaQjN08nIj1yBJrHU2hE03NUAY
 3JkSGALf01HFoHmWbp0rCLElEEZk7AmVob4LDzemiLrVvZoha2JDoL7sbEEAtz7aGRhSgIDT6nx
 2QMhg6GQIlEwGuPH4QmnIHZLwwBz0NTRp76/j44XhDXk+A0iidl3ZWdLfsUA13S2WrHZRuFKCFG
 GKX6mlcq0Axp1ow+nN0r4vf0jNg0DBrO11HsKHsknxSyks7z3DVuFr2xbZmadUQpqqe6PGqEyQT
 m7gCEGhXoUoyOc4o66A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040111

Enable the CDSP remoteproc node on the Eliza CQS SoM by providing the
firmware names and marking the node as available.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 5ef6c51618bf..c55947f52123 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -381,6 +381,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/eliza/cdsp.mbn",
+			"qcom/eliza/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&vreg_l12b>;
 	vqmmc-supply = <&vreg_l1d>;

-- 
2.54.0

