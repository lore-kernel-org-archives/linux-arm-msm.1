Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFB84D956F
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405684; cv=none; b=nx5APAhTlLkNHm4YOKDL1PGxT2ILoEbaGtOsPRCLj7LLHbkQsvtV5gzYynUSByYkotBsGbCTNiDjwJWsL45CxXR6heSfaSyJXGXVgvXdbAO03XCQzwwTD+0Ayf2w92Xs5Yub6u66ftJU9cXkosiVLNJgzcYLYKG/o9KCkA0zNZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405684; c=relaxed/simple;
	bh=kh9tVQY45GrFiUF1ke5Gy15WoD3EZQssJNTVFnwj+Lo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FFd67FtfgX20rn5u1AEK/qQOa7zZkRirM6uF5WlWxwPEh6EQYSwM1DWI4j6UbanYdO3mY2TSsYAd34ZdYxMitO70Z1XQApt4ppvtB2ZCM2fOTzX3t9Qs9SHRGv/dqfpW8i1hgkpZT/tlCkZIxN+6qwuU7c1BPFjuCQTNFUXzRGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnDWjQ4k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ro7i4y2Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnDWjQ4k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ro7i4y2Z"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8PBfe2236447
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wq6D0np2UJn8vl+gR/Dp8dr5QQvgLmXdT6JzLOTCLAk=; b=JnDWjQ4kO6XUsV/v
	5kM1gqbSRdE+yDtqxpwEk5PDtcGB87T7XauBrx5qwzkB74yNaAZGtBPgWu46gaBL
	yrX9dN+EVXy2UxDFzwCmnF3BDFXaPtk1amqrbtmgAYyPvSiAQW3Ub1Jr+jXcYHzO
	Z1QAZLp/fVbMvXw4xASG98RoQ54x7QwrhZakug22CD6RHsWSESrBbwZY943E27PL
	gUno98tIJtj3x2HMM5Gl3oSmara2n3xMsPMt+vJ03LH7b8qtYfkZ7v3A0cfu93Os
	2rbUvHYxTIQZ91vejt2WFFAhezTZtXDUIdRWS9WvJc4vXZRD1geKwO7a/qMpRfv0
	QCyGNQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3x8mm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:28:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e617b5e9b3so11576545ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 03:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405682; x=1793010482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wq6D0np2UJn8vl+gR/Dp8dr5QQvgLmXdT6JzLOTCLAk=;
        b=Ro7i4y2ZrlrAcwn3N8bn1RMs/HsZW4PPj4wWRbdNrcEkmN2XiNgl8NgLxeDAe4dDAh
         TkFNkVib59W3Ku73C57FSRXrDeisEQ0XLm7NAevC+/KYGZPvXaCQpi+akksRKbyCLBfF
         QSbYTfcuq3LvbQpr7LJL4dp6rIsdqSjyV61SnG7sF3ZrdYLb/JRXqv161+bIyqr4Cm6I
         2grzP2ddYe1xnFy0J7y5gHpF32AzU1GJAqz2F6bH9Q8BBSRaxOOwrQRTslYAN5nDVGyS
         SEIIjwD/389tfI3ku8BFDnlyzMZC/NNHDfFkISaZfmtWms1h/JdxUZYCdpRCAH/3skUf
         Ym2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405682; x=1793010482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wq6D0np2UJn8vl+gR/Dp8dr5QQvgLmXdT6JzLOTCLAk=;
        b=mZnS6Ib0Wk3WmPow9TUU/Bnx4pHzH3NqRp/ORdv9/r036wldYwtl4Mko+aPJX2GokN
         4rUJeHMZCIPW/9Z1wzI/hspo1jjFJuQIs7G7WM6EUPmG+tDoTeizI5mGlJQun6G8KI95
         r7SBHPmqDmB5pAJRV45HcDFU//nnG4RHR4MWlPh1cZ3Fl+8D8cgzMt+b7qFdwoovmWbj
         cThQXLSNGSneKq1FH054sjlEpzrv/FVHf8zjC3tmkNJfH/F3AwGrsU6k426KRXKvuz7y
         gM//KVEjVlZ7FPKVX0rCffYOfMBcluY+FDaQQUoIPLzoDngKRaNmFQIED+HrT2Bs1R2N
         CeRA==
X-Gm-Message-State: AFq9FYLE3sfFGmGz+eQt8WfijiyliOqvnB2ooeXV2XaJLQieOaueUjLB
	N930Ro2U/SVK2i4MZv0WPZRBSZwrwpejSOIVdRDADXK1+o72F0XWIctzl4qkJfHOLTXJLSy9H9+
	wr0TKj8uA6B5cCH7N61KnayEWzu31F0tZfOS1vKqzlj864LvhvKxnCik4zZJgEVFLMTLBK7QXNC
	DR
X-Gm-Gg: AYBFou0lShEcuNHFsUPyDA4L82XQ1FqFZ31Dn0rViuhrd93nrwoCn//wA/orjgHjTrM
	j2nBRjnC7s8rInrApxseisKfjHdd73T2lxavxHLdmac2e/h2LySJpVih1vnze5DcnwIb6cQeMU6
	kcdTq9bB7m+Xeq1m1SSq1/ILgrLceiLx66vFQsos1G6sI4JOF7MboFCtjpohnJ30sfqGBPNVMJ9
	USdnRoPSy8wKv5hwf9BdL74ebEzrFooTI6B1GYE6SYAzslKFejpSQfrNi765xhga5mPS3TrSVOc
	0bGZSNg05okrGrhruFzQF3TNGoOxTTMioePFg6EazevYFLHKwfGaJce1YpiijLjdIVR9NwhoU8f
	57hE0BtMnqAcOVpHPKshgaIwzTnIyd6q1DyajRw==
X-Received: by 2002:a17:902:e948:b0:2e8:4f03:dbce with SMTP id d9443c01a7336-2e9a70585cfmr51669715ad.51.1792405681823;
        Mon, 19 Oct 2026 03:28:01 -0700 (PDT)
X-Received: by 2002:a17:902:e948:b0:2e8:4f03:dbce with SMTP id d9443c01a7336-2e9a70585cfmr51669195ad.51.1792405679717;
        Mon, 19 Oct 2026 03:27:59 -0700 (PDT)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5d7ef1sm36359785ad.3.2026.10.19.03.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:27:59 -0700 (PDT)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:57:32 +0530
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add LeMans Draco EVK board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-lemans-draco-final-changes-bringup-v1-1-dcabe94f1074@oss.qualcomm.com>
References: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
In-Reply-To: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792405669; l=848;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=kh9tVQY45GrFiUF1ke5Gy15WoD3EZQssJNTVFnwj+Lo=;
 b=DwTof/h1vzH5Akmys70qASYAZ6TGtPsc+jfUBRIrmZF6EmdnbAhzunQNEldstBP86IJA/fEpf
 gLV3DFxYCH/CsQkwWG/EvQXeY93qQPg0Cjxf408hyXpWlzb+KXXWg1/
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Proofpoint-ORIG-GUID: hxdRGl6jViMINLlpFLYysx_TSz5DX8bL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX92qbh/jIHEf9
 yGDgXLISTQOwivv0uTDw7iuGt5iMnJ/KIKfkT00xP1ujT7YUT64vcqD9p57i6dkyl7LV7d/TOTt
 q6VOfdCb/enPk+h/UQbUsNYN7VVihx8=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad5f0b2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ghiYM7v6OCwGtqAZdvUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: hxdRGl6jViMINLlpFLYysx_TSz5DX8bL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX6BjxlxC71HU2
 EKOVXmeiIOvb4mSxCIyMkt+8r3msm76N2vqflaqn2PmjZT5ffpnrUkxJOrK63rJ5gWXVlgwWAKo
 f+43dED5irEklEcCsItRUtmFtjQLWGEytLWSVKa85WvWMmRI+VETpZIEBDWhxlwInj5NeyiVWot
 XsyyLy0Wc1icq8OAQFYyOeoVj8bQTVIbAOD48ZXD31Fgo5IB2o90I4+GFWzZetuk0HVxFn7RCe5
 jjeVaxLkEBZRW85zsjrtS6e7PVfeXDfkucv2hRduV/z413wm+V57UvaBMjdMWSvjH4je4X9TzC4
 lrzOQs48XyjkbIEFo6+SqBTLzkztDnSyRn923/3vIhbA7CJC7MRhO5Kz8hDll9nhnsD+KB7gbUL
 l8A7iQFNGIhnIyicTk/2NNKdhBgqo6IeAl1+f3Blg1IcARAa2i1tWzSTzjkMUTSTSemcRTMu9hx
 KzwIkU+p8nIxbnWYC1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190041

Add the qcom,lemans-draco-evk compatible string for the LeMans Draco EVK
board, which pairs the LeMans Draco EVK SoM with a common carrier board.

Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 07ef7988b068..1efd6ea34c3f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -498,6 +498,7 @@ properties:
       - items:
           - enum:
               - qcom,lemans-evk
+              - qcom,lemans-draco-evk
               - qcom,qcs9100-ride
               - qcom,qcs9100-ride-r3
           - const: qcom,qcs9100

-- 
2.43.0

