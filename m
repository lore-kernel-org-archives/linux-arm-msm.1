Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A648531617
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072183; cv=none; b=WoyEOJpSCysqUYi4OTWEtGRd/u1orwB2iEWzywE5Cp+sy/sxpxeJBbLELLpvGviaMF3O9r5XJZsWpqhcY74rhBmHttQY7xa8HRtFPrxCtL9dSiT6Qew1d6aoV2FjcgWGVjHKgd3QUk/gnNK+ni7G1Fw28ugdyFDmRebQFqLMg6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072183; c=relaxed/simple;
	bh=Zew9DiXYlMGO7HlKp34cAJvD9oAnKwFFouDwY6ExCmc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LpuHUdQPTED89BaEUViVose3z12h9daA5px/GWI0kjDkAlpa7LFLoD1qWG6otXW9A2TfNMvIDb3GqIZcl4Q9CIw1H2p5tvEb9H+5G+q9OqqBSfCpraSDlCNOxkKq6+ojMFiyYJGw3fBLuMFJBfB5hEaP1ZNQcvuQXwEvZrS0BPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LTsnY6Ln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikMbzTQb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LTsnY6Ln";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ikMbzTQb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7kAZv3712900
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=halr08AGvM3e7+vdJKHgPMGEd8gTfjGSRjK
	ghooAsEw=; b=LTsnY6LnOyo4DLUfSMZ+678xnHJf03VFaWmvyU8KjhDxzvmrvbs
	28ZEHHwt9uJC9csT2dmXmheaa+I0MLPSiWUAgIfdgHsTwQufnvACPrH4NZDPcIq+
	r8owxhqA+79N9LzI1ip2vE5y7g1MhpdTWAFf18K8nQ3Qv7TKIoZrgnhvPE/OwVxr
	rkZZH+UDy4YUxGy+iKmB4YAZo19RYNU/HWVsWXnZS3SxxDVCdgJiutQ5P0jqoXGB
	/VkRY63H685d3QPBRq8VTofTJt/UZag1hTlY4nztmrU/kgBbQ7IzRU7pUxX+W4xJ
	kV9OJqZTLrL5cbqTnivJMts2HFByYUxg5tw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjyrnbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:16:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso4632927a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790072170; x=1790676970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=halr08AGvM3e7+vdJKHgPMGEd8gTfjGSRjKghooAsEw=;
        b=ikMbzTQbvvAN57uz2pSAi3bYp8ADIy+oVKZuaMUwe7NoivWXnkFtPrf0AtAlCTmjzC
         C6TotDm6b4Tknu7RBd4TMpzW66Rzqj28qR+i8QWO6QswM/oQls55szcmjI+pC5u1JeRa
         5Cs5jGVWO5Qnt2RcqOt0GV38yVGuaTz+lYQBU47xVFeuc6L+AHHpaqQHyotRxRxquM2N
         ZFYsTjV4S/XBSHPNfwaA2ruQQ0+NGegFm07g9hhKo3fSfF/cekI5i+HMT5e9VijVMzYE
         sOLmLNxhYUQ8VwsjC03AxTImsLP1dhUyvJdNPZUqDSB6rz/mnTROiWZ/GOpJhknuK9b+
         vgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072170; x=1790676970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=halr08AGvM3e7+vdJKHgPMGEd8gTfjGSRjKghooAsEw=;
        b=hMdOxWfKGJjcFk5wd+oupTqqH75vJ+JFP+OonRUtDMD/C7mXZAsAJB75eB+aLne/Lh
         AWyF7vOgC7zLHr56W/SphU/rrzVE4oIfUc0OmUieRO14hlJkqpr7XSgKMYVjPZj6MAUp
         37EYOdYNjT1jHxtpABrNy9On8su0FlDb8TysxTP0X6n2pWgudIss/sHA9iZ/+R3eALSw
         EH+NXHYxW0nIpDAon87qNLjFD5b+6JcEAwbTPXua1iKWRWzRAl7Sc4D20w0uKmv0TGD7
         bjXLYwwTDhf8Z5VNqp90Z97RpZ5pyp5Q7Cmv8rcXgrreW4NSvkibk9vJv3hHZSLJnueB
         Dwng==
X-Forwarded-Encrypted: i=1; AKwUvByA+w5WNZziXfTgX1cBDms9Q2IbpCuwSVdPZGJCz4Ut4MQ/eSgbtMV+KUIZbpqsOOh2fQT/8MViWQoMG89W@vger.kernel.org
X-Gm-Message-State: AFuF++mVUbjpNeQiaHPsbKpgalYXwlOOomCvr1AFaw+6+2r947pORHYL
	uueGr/Z+hUZOMqkghxuff3oGEe5jx/BCr7S77h+j51nPDfsT3q13uvRMsnuRc6GkPFhbJQJv2O9
	09MnzcLejI61KTfuq6Z1KZK1xodOITNwvTbY7ZXx0Jb47oiDfYgEh7Uo181KX21Ptrv0c
X-Gm-Gg: AYBFou2QVXaKBpAPZQXqHFO5cPQ3KES0Oexq3KQOkMq3SHVLCsxSHMPfCBpsQW57fA+
	vzWpgDXiVotcd3GJG0P2X86ag5kYANU1Y+gFBIGzGyTWC/sA2uFY9o/TfytziPV8UCa8j5Hc9Of
	qq/mng1NoxWDkDvzZRxcx6YExg1kf+htmwckdSCyIwhwpJBIyf4VsYIBNJF0GMHypjQZtDsZeNR
	Vfq9TbvqSrpGDZxb/iLhmp+kZCB3cQqZPgdnt6DVERJmT/HvpuYEBmMMcR4BxeA1LpHz1rfWUbP
	WN0UtJ3hHPEC94P31GGr3GKuNlxRbnc+KyZp9cOh6KAlZXjhcpDUmYhc1nXeE5SzLM71TgX1M56
	D7rT2ItntFYTQ84bpC3WdZ5q21V4ge1bKBU4=
X-Received: by 2002:a17:90b:4d88:b0:39d:fcbe:fdcf with SMTP id 98e67ed59e1d1-3a073098737mr780545a91.1.1790072169944;
        Tue, 22 Sep 2026 03:16:09 -0700 (PDT)
X-Received: by 2002:a17:90b:4d88:b0:39d:fcbe:fdcf with SMTP id 98e67ed59e1d1-3a073098737mr780510a91.1.1790072169331;
        Tue, 22 Sep 2026 03:16:09 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f294e4acsm4141064c88.1.2026.09.22.03.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:16:08 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: qcom: glymur-crd: Enable DMIC4 and DMIC5 on CRD
Date: Tue, 22 Sep 2026 15:45:50 +0530
Message-Id: <20260922101550.2216689-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yScqf8LArBbitVQtu1X371MrZOT4qmLZ
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab2556b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=x1nICoucR8wNQKwiGQYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE0NyBTYWx0ZWRfX0tmmcEQKjxs7
 Inq5kZF0OtiesWaL5SPlameJzGXRldKKji5YlO83v2ZBtwgpza/lQFixYrVL/KDeyQxy1mDcGXA
 XcokaC2AaSrb0ygP8Xnk6hreU67rnYqJA7o5KC1WxHpASj2CzI89IFlyEchttKc8Eip2D/CK76Z
 jF8khz/ziJQ3zcnOpmLz0bErpGe7bJd5tIbNeANyE2R70zJZ/vHKxCtgbSd1pYzgZdAAy9thhbV
 j0nhT/a2oSr/qQHKkjfe0bL7z9IbkvlbobIouAMbIPfzaY44AII4xLVn7bzuuhRoVva9bIXxL8W
 rv3Ii3OhS0jyC/+etpAqNiNfuOZa8O8wM4BksubHQNlnfHYkHX/zRe5cQwkG6j+BbfKoUABKUMj
 bdSKmq/ZpHD7cY5mqHod5QApaLk2kEJ/5Led9X4rfFkb7Jv5fZ0SfLQlrCD/VlB3wu4Fb4PM1ZM
 i7afFzJ6ZkqL7NPaxnQ==
X-Proofpoint-ORIG-GUID: yScqf8LArBbitVQtu1X371MrZOT4qmLZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE0NyBTYWx0ZWRfX8kpEgenn4gCF
 Ve/F25Vg5cIjlRS5Qww7skWKrvjKIPtfE/+pKmJ0TjFkBevLIVdbpHoBTH47cELOy3NgbjVaHgL
 rNXeefsDPf+ye/kOXYdK394771No1cE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220147

Add the LPASS LPI pinctrl state for the third DMIC clock line, which
drives DMIC4 and DMIC5.

CRD has additional digital microphones connected to this clock line, so
reference the new pinctrl state from the VA macro and route the
microphone bias supply to DMIC4 and DMIC5 to make them usable.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  6 ++++--
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 16 ++++++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index ccdc322157e0..02e342ecfe4a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -247,7 +247,9 @@ sound {
 				"VA DMIC0", "vdd-micb",
 				"VA DMIC1", "vdd-micb",
 				"VA DMIC2", "vdd-micb",
-				"VA DMIC3", "vdd-micb";
+				"VA DMIC3", "vdd-micb",
+				"VA DMIC4", "vdd-micb",
+				"VA DMIC5", "vdd-micb";
 
 		wsa-dai-link {
 			link-name = "WSA Playback";
@@ -695,7 +697,7 @@ touchscreen@38 {
 };
 
 &lpass_vamacro {
-	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>, <&dmic45_default>;
 	pinctrl-names = "default";
 	qcom,dmic-sample-rate = <4800000>;
 	vdd-micb-supply = <&vreg_l1b_e0_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index de7c395d9c35..c941b473ce25 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4768,6 +4768,22 @@ data-pins {
 				};
 			};
 
+			dmic45_default: dmic45-default-state {
+				clk-pins {
+					pins = "gpio17";
+					function = "dmic4_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio18";
+					function = "dmic4_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
 			wsa_swr_active: wsa-swr-active-state {
 				clk-pins {
 					pins = "gpio10";
-- 
2.34.1

