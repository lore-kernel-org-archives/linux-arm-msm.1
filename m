Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC7D481234
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 12:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203135; cv=none; b=Dz0i1Pk1+lScm1Ru3zAeXSmY2XDX+TUENKU9TTXf7AGtWEnjVyAZ38bWB1fFWiDT1ES99n+Cw8h1LBIDDPAX9RCSKWMyXCdbmbK2XAPPJE1+wgLd3V0eqja2VvwnUK/ByI76FfIHaS2H38HqYxyQA/24PpjyUiiQcQeBNKA69Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203135; c=relaxed/simple;
	bh=ENXdysjh2Mnto/csfZqgo5JlcaTWVfilpzmV+pLUvWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mVG4oxNk/XIeqFoRCF7FB72blo7YYHiics83ZjfPATC/jALdhZ1bKlWjPXgF8V5x89EWq7VDb0ZAM+XaZfOFbLdhRGp/sPQlWh1wWhCPCfCWDbGmcvs2qr79dHjfN4ZpHFhaI9ZVasGPd+dcuDTkcqVQ9m3t/CvhiWKsfDHrzjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TxT3U/0Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g0n4yfTY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TxT3U/0Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g0n4yfTY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFP8x1892646
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 12:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YNyUXHC3YbB+ABg71gwplwY0ueSImHzdoQCm8+zb01s=; b=TxT3U/0YMXaDm5V4
	JsyynkSF5tATwqUTTHkPPMuCtW4A8GxbK6K1mla8LA8126NJYl28fGQ1SPhGYShl
	oxGlFtsaHgRvgMZR6QUBj6GSzvD4vZaH4rcKVMu9uypHEvCk0MYcPkCilM2LgJw8
	Yp0sZVK/zfB79X/OArEjfBo0tBD7GCk6kYY/BMmwurTxRd8+7eUy1Z6SNbEBGadR
	iFX/3ARV6lrjuVNXoBh5LkkHw1vWK39l3EFtVdJuHuxahrH0ogNCRhH5auN6RkWE
	DtO0SLRswNB1ms4eiPIBFDVrnyt0C7vezQL9YqC2rk+CTEMfktgWK2egn9EXDxpb
	ZJvEHw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssudta9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 12:25:32 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-823b717034dso2605021a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 05:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203132; x=1791807932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNyUXHC3YbB+ABg71gwplwY0ueSImHzdoQCm8+zb01s=;
        b=g0n4yfTYyKfNiXXAEL1rOP1ktBTRSzAZ8oFVKwYCdkB7m9Nzw999FQ1jh2fUxji6Dp
         7GHmCH6gk0DP1LEihv1dlEKqhU3US7eq5BPANeTYIotdxy3aTpG4MetIhLg16iAXOrMg
         2RxiNWsJN4m0i+ga2kwzn7tjP5EVwjc63oc6cCvXQHX8jEjJj6FiaIn6Uimt8BMWeVxl
         XhRNb03AjSqFdsgXTChd1PBY6/8SIfJJ3Mr7TamhgNn7KCGKsEC69fGOhzRFTufiyYX1
         q21HJiZMXj1cjIko2XvieWaoCC6JuRpO4+7IONx1zyNJQShlVSqhS41Xxtm9dluLfSQ9
         2YCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203132; x=1791807932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YNyUXHC3YbB+ABg71gwplwY0ueSImHzdoQCm8+zb01s=;
        b=neqGPf0sf7wIElD+6LllxCz4wYjsd4LgdzBRC722Q9ffgI/2Y79EGhR2mVlJkypW4z
         dd64owfJJEuhnWBIQqjOQNYJ0exCxmjbCC33LPLUX9MPwdfoqZ9r5lO5xjDfYLeDWPeG
         6M7+p37xiSF+3wjk01K5ZYIaO6M04wqu/ByFwqEFPwNUUpTTcRDn2tqPwLcQ3B/3rTdL
         bwmOQ77wHMFZ6J+okOjOtFMUT1CVNZOC8152OU/QNNOUWh9cLc/MiOJFnZ7J4mOtDHMd
         54uEVm7tYvWBwwHhxmDsqUcfbffPAyhfch0AL5IL7/GkvvJb4vsZFipKQKVVZHGdoWi9
         Jq5g==
X-Forwarded-Encrypted: i=1; AKwUvBwtBXbswNtZNQMsixwBsDeNBY7DhU0adY/fKax3xkkRuMMmoUQ01eteLA5MWkdvwESbmBJHlbaONvrtAEGp@vger.kernel.org
X-Gm-Message-State: AFuF++m1DVV97WAVVuLvUD5uqIGPS5IbW28jYf4X9gZr7vdpMEScSdvm
	nwdP7jlUzoQK09ZzaB3w6kbhWFM8PdM3weIifE559LEi6h/HC8Knpx7sjxrAPT9FC9yoZ1lot6i
	+i498X8DEQK1LIMqz7v4ILjEXOzwo3AEjH+e/7n3qRc0e7MXv2nTBLDdV6MWx0eVCUA5e
X-Gm-Gg: AYBFou3JI5/FIZCXKwF1glny4N+67MWG2P3b3YLRw9FjiRgRYPJPMiBHaGWhFyuqtDa
	p2J/HSOo6QgHUxslnPF624vrrAGXnpTJpYMLXwmhk8m+xtbfCwTaqEgyRB9XkzUuEiV2QmlcjAy
	0SbzonS33GH77mMzR7W/7jEOu1ZRWsb/qIszNbGmpReSxvPOHW4/u9GSIPD0ppUa0Lf1J0CLV+i
	xHWtOzuQRL9JhhHk04rPeZCEwX6Laeg3z3J0YpxrsfxPrmGYW7IYZHLVbyQGn5FLAWSq4aCxoIv
	PrLwp3wh2I8A5oRNw/2H2iwdpYnTBBnCPwBKXroPOPZcS46ZqLgiKpf1w2LTeKcliv2XdelEM0K
	/P5AmQmx30L6u6KV9FPS3MdCcLQ5KNXvjSw==
X-Received: by 2002:a05:6830:254b:b0:815:e63f:9b90 with SMTP id 46e09a7af769-823f72f0481mr8748887a34.0.1791203132161;
        Mon, 05 Oct 2026 05:25:32 -0700 (PDT)
X-Received: by 2002:a05:6830:254b:b0:815:e63f:9b90 with SMTP id 46e09a7af769-823f72f0481mr8748847a34.0.1791203131659;
        Mon, 05 Oct 2026 05:25:31 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:31 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:08 +0530
Subject: [PATCH v4 07/12] arm64: dts: qcom: pm8350c: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-7-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1146;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=ENXdysjh2Mnto/csfZqgo5JlcaTWVfilpzmV+pLUvWE=;
 b=dVh83er0D47CT22Vah2XvEI911zB7kxZzaoZhRgF92t4gOHQSkNTptLvOfuRwxG5BLxAULBJ8
 qoqLtbBTguRA12K+I1kiNctZi6tgLqt/jDaiic78MBatg7w+0mzy8Hf
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX2QmesUntAktV
 JExMqYJ/XLFr+V5+bKnAYxOOeOKWiC4kT28fXEA/KIQ3HR/3zZ0fWg642bpP47Q/bz8z1Vf/WL0
 wZK8PHDDO322dzKJfBv6rB0clE0fyDQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX1n8AVSmpE1Bn
 xh2kTGgmHg/8pLgux9TaJwfL/obT0DSMHbMXnQqxV16xkMdpk2xaWZ9toA6vnhgvLRzddyUBaTa
 0OzszQG27zAMkNobPHofZ+H1JhLAAptrxhfarHbyUaLpSiczW3s/h0a4HMpyHE2OKmP8AEo0uek
 Nc6ZzO2noz4beWAEu1d88jcTK1JIvBbF8q+dABs4v04c7XySt+3CfSmK4w/MMgNNPd+rVEwmI0k
 /ZgCqbVxdFmicsiOI303UhL2FZ24hGp80cpRUlOPKnnmVrNVHwgJIvLBZxMx8hooa2dJSrk75Z/
 oLTJwiILExEkKriC8LaEVQgchMLuyC3lzmoyhQeRJJ2a9SpyjgDA1+3Z7Y8MdMi30R6mzGuIRi6
 Gc6NW8OneNIC1rVd7U+bPVCYuOoFRNdoYzbsTAfsXz8sbxTgLReyGGYA1ki9ABe90SH+LC8nIQ3
 dhNlOeA0/cDdldLxF1Q==
X-Proofpoint-GUID: 2Sj3vesxtfWSiKcS0WWczbfqWaJowc8D
X-Proofpoint-ORIG-GUID: 2Sj3vesxtfWSiKcS0WWczbfqWaJowc8D
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac3973c cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=I246FzBBSJD3MQbeXTIA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index 1a24e6439e36..d9e3a1069d78 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -20,6 +20,17 @@ pm8350c_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8350c-bcl";
+			reg = <0x4700>;
+			interrupts = <0x2 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8350c_gpios: gpio@8800 {
 			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

