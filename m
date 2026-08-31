Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F73A3955EC
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195450; cv=none; b=EjDTmuNI2/Pduo4F1lquaBiK8wRTWQr82B98kP2LgfIHeitwJwhwto4cprG1z/1SWlcIvhTHjrMhdGr+DEM+H4BpP73ejFeOQgMqSrqUiDEZNa2fnnIhKyh2+fZE2KwMXiulVvxeicyz/IdgPRgmjBX8uLOgFijueYex/M4qO8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195450; c=relaxed/simple;
	bh=YRzvAVRkZbWBIqG50cR4+R6msLR10iB8DJJthyfOr8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iKnZKEeYRQd2hgnWvuSjx+RX+C19rVwoEN06SUKK+hfWUZIMgtP+IAJPAck+mlao3D5uHSfpVGOgQj8ECtf/qlsQBEKPGpl200IeqDQwWvo6o0sKspQrdq33BjtzhiZ09CxFXxO92S5mcBaAK/vF493q4JqoYuHYxiAzuQiA/Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5owSjKS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g2EFUCWx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5owSjKS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g2EFUCWx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFrSaB3891246
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRsP4wIlhmTURuqn3eYM1ANLpIvruoM/cCuAt5SZxkQ=; b=V5owSjKSOMKsOwwn
	OR+i2KyNt5FBm0efVJPXmKnyojK9jC0UFdbxO4w/cgmKaD2ZFZWXbxnnYRYEbnEn
	h4+YSc3lUVHvd+35ZbIfPlZwxrFeKWJEtrd3lcY66Upr0VIeDHGhZqbSfjbtZ5Tl
	mcSIhksRjl9QPGWiETlwRY505wY3H7O4Z8NjbJYDGy/HEKN/8NM0wFRJ8o50GBY4
	T2hICs4NsBYqzZcIC23vHMlveeAsvYe5voEm+lJoe621gnhc8SdBv1euLP82V+9o
	0JoqZ+aPKnc8nMPdZGcJYe1e6gxuvjBE5woNWmP4adBCqbNk6I3osAVh0Pd0wNus
	Qk63Zw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yasyun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:57:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9390e7e4c5eso465633685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788195447; x=1788800247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRsP4wIlhmTURuqn3eYM1ANLpIvruoM/cCuAt5SZxkQ=;
        b=g2EFUCWx+PuDrTZJw2/6uqXBjteCE40Vtt14vHARVmhOGSKELzVda6T1PGoBstPWmQ
         EU8/uZtrmuWzwH0rG6uRdFK31wmjQlVKQzHVoLIpoLuKxag+evZD+CrixgKRIhoFXceD
         8JQPf8+PEkIRpelunzl0SLVxksN6aY1kHT1ftVszdfvfyuaQtFnNdbUtax/kqjeAOZoV
         p0nsVrcmliTZPO1qxGhcxSqpE6Ck9tDS+kR1Kc8dY3RC8RwyJI35KR6+Z1oJLimoLsJm
         9C4n2xv+/YorHfZK6DST2GdiQbajRMye8kO6oDgcD2BHGwXJSoWN46REQn7rCkfXGa1O
         4UcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195447; x=1788800247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRsP4wIlhmTURuqn3eYM1ANLpIvruoM/cCuAt5SZxkQ=;
        b=qfpQtkEPOjI9MNUJ4njwgpmXEqjO544IRqBQ3mF34WqciVx2ZBNNduNMZYl9eT/AkS
         vzX+f7SSq/qzbl0qBrUXEUs1RFeM9HSMuYAyODiV+N+b6izrEU01TcK2e5KyrRZ7aRdK
         yRVr7SDGb76bkJ+kRQCHtxEPhGnKEjy2cb2XzX6xgxC0gPcsMLhvKa/GyvY/ZxXaYAzF
         IiBJPwHIsHt/mrKbe9BfJY7hRur+EyfHIt2UoAAfOkX+dfRVjV8BEyCRvJkmLivJfUtW
         o0mwYDK2mlSWTc90em4eqZcGy0Zal5Y41JMF5iR1N919cM/ga+wHEYi0go+DCGmovezk
         +QXw==
X-Gm-Message-State: AFuF++mRdBvLmevLVeGRkin5FM2P28kUPSPeQ8s32gWWr3Sz4ncXaRnG
	I+6SAwfNgl7AVGggIcMj5Sfcgz+A5KivBykzBUJ7wSkxi8ZvcvuiI3ndXuAoLuwF9Hpcla0cRUc
	ZCuZl5sQrNMUh2BTCL6j5Pno0OJYrY1Z2sHTtp2nHRKcKPEovXMd7GzeAVUC8tZYXCI7eN/Sw23
	DV
X-Gm-Gg: AR+sD11Q46/ND7O6kkpWqvyspc1BLoZX3HNr6rUBdKyxBhoZReFsGUJ7sKF2UI7RRgr
	+Ds2zN69RQoDo8tok/IkTZX7DBZbd3KAIWaDTCssz6PcUqidcIAPx8HhJHotvdM494fyr0QDXE7
	0Ib95sqBtW+lgA5AoR7x2HtonpXSDHR4QZO+LjqmwbkWEfDgxFB+y2b4yPR6Cbu8VeA9/ItPkyE
	VDDdFQPU2QlZfSaFb04k6duIEPX5QHf9mYLdBD3S+XxEN+H9YtVKjM0wmQJ9VNmr9mwlYjh1cHC
	j6sUq+nnRXuRRbxPTGGBGZHdUJ0LM+y2ylUaBDuObI+fkkCQaab+p5UicXypS7ntSHkFzoMJVxf
	2Qf3Ttw==
X-Received: by 2002:a05:620a:7103:b0:939:4890:98e1 with SMTP id af79cd13be357-9394890af20mr301138485a.42.1788195447161;
        Mon, 31 Aug 2026 09:57:27 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:939:4890:98e1 with SMTP id af79cd13be357-9394890af20mr301134185a.42.1788195446692;
        Mon, 31 Aug 2026 09:57:26 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b955e7906sm248426785e9.1.2026.08.31.09.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:57:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 19:57:13 +0300
Subject: [PATCH v5 3/3] arm64: dts: qcom: eliza-cqs-som: Enable CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-eliza-add-cdsp-v5-3-dda8af2d2920@oss.qualcomm.com>
References: <20260831-dts-qcom-eliza-add-cdsp-v5-0-dda8af2d2920@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-eliza-add-cdsp-v5-0-dda8af2d2920@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlbJrrIuYy3bqsq9/BlCTsdxNiAex2geih2Cf/
 m/p+D+Y50KJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapWyawAKCRAbX0TJAJUV
 Vu69D/4ngvz5eZmksE2CfPc0VKCZPfkiqi92QQ8rICa0OzLqIhGazNEjJFgzHWV4kub49jcGm0Z
 5Mb17i69tFM2NEurROCMOzJwYqrspjME3LXFSUQhQiVSru7PNKVvfsng10uuCcYpgTTkOCuW4h+
 JlmRsI3Xn0IpUX60SVu1Opy/S3GiWB/5GwjkwmqcG2T/ScgSVy3ZNLNSUFdYSltmz6xfhODyppf
 1uw2bEG4ec+vQfIJE0v91xcYqUvdFivu035mXulta/MhV/qvYqY5T/DeP5Hfsk15opEVrAvDX7i
 jv/wN3oo7Q0LY352COCQk6cnHfg6RoH9rz3MykTiMc6NpKckTmkKxkZkJVDCNN6GMSoM+tqZ9Dc
 n+qxBej8HQQduHtim3uij4mLj4Hj3Ap85FVNofjhHvpmjgrdZbyWfCkbrAZpriV/icpvQr/xqq5
 qxL2XIWluEHl88QMn8sdgRtP+MiMLI85rXsh0diVl1vzRF47FRwyVb2KB48TQsRCmDPLHtuuH1d
 Wz9t2eusbHwHAwVLY4EkoBl9JFIW/8QK4sncnpCkoo5mktGi4m9ee/kLslDza/dBtWyeiHDSiwZ
 bMvcFJUW/4oidNzYM3GVWDFhGLtNI4edxBmTOIfzzdXPvjvkx7qPMigX0Gsu4Nx8tm1o0JPu2WA
 cptrO69UW44pBug==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0NiBTYWx0ZWRfX5oAfeBuXo4PL
 lu7lN+4juR4DZAoN7ws/g1w59NP2Gm070YAfVsogzYFQUnK6Gp0VEKpgzcyOYZkW35rZ+83uitk
 3hrIF4qJQT7HlDAVFX+aI65ic65Jsd4=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a95b277 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gskBRPyYVKVSocykC0cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0NiBTYWx0ZWRfXxEX5IYkdlWQA
 0RmbBPqqY+UdoSU1gazy2bPz9/npM7MoVa8E6x5DEvE1iM14M1qmEGK9HriSun0XgUsbXALmkz3
 2yv1XHTqT/r6dFZVpjKxJ+Vomo7F3qQJLiC7hCsNRhKUf5FEEaEHp6bb9IJ3KjiTUJGwfrugAB7
 b/oxbPXGL5oyNN59RMgTAXVScEsD19aFVqMjIXVeEGYhwOmAeopwF/QRn6+D34g1PEOUcxk1pKD
 YsmKZh9B0sxkaDNrML4T4paJMLvfBt4vM/5w/VAhgGY+3xl07PEv1Eo0WfKgIjMTGPDNohEsFHW
 LKDDYNpKv/gY+H9AuUG5JIQiYQ7BAYcbHzQwDgIeLwLyA7WBJotqEhKs5T2FOy1bCYtrC34MUZj
 aZ+U3hfzucarrGBvjq4xXhIZEqWp26/hcQWm5EbCl3zAaWh1rqDZ7xtX10dHHy6AWqbF+873OES
 6WKgdXLWtE6vvYoMSIA==
X-Proofpoint-ORIG-GUID: yx8PugIgECBuWPQoMIQaWQAuWzrip3jg
X-Proofpoint-GUID: yx8PugIgECBuWPQoMIQaWQAuWzrip3jg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310146

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

