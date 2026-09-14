Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAB6394470
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369232; cv=none; b=eEzXMqxxkf3wpfv7fkSr5NIDDY3V+Y69a3NleMS6yfvU71coLn1g0lX/oifMqbmkA/kH8K2OQFgqE+IPz5aqOeTD7D7AQoLsmerVzTt5fKR1AKF3jooiTs515LC7Rgv5Y0tIpcCpB3X7ZCIkPKip+zZtki8HJB1uw8nliASkDBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369232; c=relaxed/simple;
	bh=aRET539dL0rqYcGNqpnzg4yTxyOWRk1aKJYTXaJZOIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qBlJTDcNljTO7e8M8ySVQXBsiO2J7zPSYqZSGmSdiQf+6WQEV/DOZq4VCTwIhvrCz92Ixy8RCIekZlyLol28oxJGO72d3+34pssIsxrHLb9vgC8NvhHKlkvMc7d7io9XVrDVuuiht8zdBIIdDk9SpFU5CLWlXAb8tidtxMRvIYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SOJAJfwI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UHYY8QzQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SOJAJfwI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UHYY8QzQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ifhE3368748
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iKn9y5yQRMX5a5ivFo2PteBO5Kh8IjK8KqnTKWZ9lSU=; b=SOJAJfwIqF1liTOh
	QcrLc8dDTCnHrG6jnWIQ3FbP8+VoDB6Jlg9ETnzGwXD4gGytD6HPlg0XIXlrkTde
	3wSerAv9Q6RLfDr+FAKcVme/o/+U7DXxLPBubmTk2/AGYD7ZcNDTZmLKFeRTu9jM
	ThCjaKpWsvTUG2r0YfdpP4CLFSe6OX1uoxZ+JNFK+fV45SLtcpR2fmpi+9N/Rzbi
	8eGWSiZyQYNaiLNCbWJ65F8wOxn+ucjtniKNpKijUIswJUTYc7gTMboz5J6qvQii
	SFFzOAymJwDDn79ImpytZlnTkvZY4+anViWsgYftbp509eLTq0gUigUaQYQpaVDj
	DfYzQw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5e88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:00:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de1ee0073so850510a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369221; x=1789974021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iKn9y5yQRMX5a5ivFo2PteBO5Kh8IjK8KqnTKWZ9lSU=;
        b=UHYY8QzQVEA6NnBqMuH1SmRJq+kUbewhIrPZGU2dkqdRzcym1PDL74mDeVNFiNCZ59
         oVel/Yi0Vn4tNnKXyE6ukhaRqj4D/6DXJMrmk+6uJAfp/w6Q5SqkM1+y2+3fY53Mz4ex
         nQjMeZ7dGRAMQBvfhKSUGMTNAyvgh4a+j1FEwSmDHEZB0mNpp2tnw926SAWhvZo/Qf0Z
         Uo1JUp7aMYbRlXdvO2Xg7xAlDiYsSu+GyEk60qAFOaKFjn27qjljKmxQRj7BarpVcQWh
         AiAHGevtfyURhnrACFY6ecM0yR9TVG1Pa4OS2a/0rLi0AEWbp825fIh/NMV1hs36FM6B
         e9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369221; x=1789974021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iKn9y5yQRMX5a5ivFo2PteBO5Kh8IjK8KqnTKWZ9lSU=;
        b=d1dsS3Y4C4cryDBFSnw3Esn3Fxjl93WbsqmKsakgLPNUmLO0KC6q+rP+bMHyJZtvsL
         G7kJEtFVCajeiTcsHTeyQD04O2MkTQ+KkZM5AQrcdQ6axesmX0ZnPL5/v+IEQFiXV1Gl
         Yoch7g3Ej9i4EzR9RH8GXi4TB5rfucsS5Ce3/aXORrftiNZGuJSsYAjNkN7JKj0xJcDO
         yutUELSK1eixPYIlnGJDbFQVN/8K+6v+t2xS4ag/hja2yaFhMkk7QltYjiVxb7PRxWWx
         o4gnUprAFCK4jIocV9wV47kcbndeyeJ8JYvCBQQBTnCLS8heuyQO6Id3bjzF/UV/K2Gf
         WOvw==
X-Gm-Message-State: AFuF++nKvNuxc8C7EAbS/YQEAG7Slq09q3/ScN1RIS7NuAM2CKUiV8jf
	xIHlmt5Y0KgOoNlZ8PXk6nBK61L4L0Whg1aDYcZ9vS9vsRavDjpI4b4kODupgVtpjbo588TDHAM
	GlB0cOk6a/XE0fIlppCN8L85wTuSTd/S4PbQDvNTUPesQEWpDFurKbgjGXEUz7fzGTThc
X-Gm-Gg: AYBFou2AWZKXyXammTIRoFMznnkBCeFyZzLhn+IMt0ToC8Sklty7VPrzdX6YFytQqzo
	B3hwr817Z6rryFgk/BqDvC0oAWtPsh6Bhkz3WEu7WIq3rikFFcb25lBoL4tq7GxXj5ULY0wtHMf
	v250AlHFnQgGcWzIXyTt9lQw4NzwMqIChhr8rZ0AnLIwE994qxIk84ElG9ceXq+Ecdwye7R78ds
	S1sDMBJuQRj0ua4q0ItBirSeHOX/8xzS6j9WnFk97Yntwj3J+UfY3pptWEhtrmC5O1ZjIhDuCj2
	5U1jNkkeBc7WnN8PuI60iGnNQShY+2ldPpV3f3JwkyPycRUldUNRb00FeRdjV2YacmUQdMtFDA3
	0p+Aeeze1/wfsjAUhbISiyVEhM2Hb
X-Received: by 2002:a17:90a:d603:b0:396:7c01:553f with SMTP id 98e67ed59e1d1-39dd5665888mr6466064a91.21.1789369221165;
        Mon, 14 Sep 2026 00:00:21 -0700 (PDT)
X-Received: by 2002:a17:90a:d603:b0:396:7c01:553f with SMTP id 98e67ed59e1d1-39dd5665888mr6466001a91.21.1789369220525;
        Mon, 14 Sep 2026 00:00:20 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:00:20 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:39 +0530
Subject: [PATCH 07/31] arm64: dts: qcom: sc8180x: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-7-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1702;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=aRET539dL0rqYcGNqpnzg4yTxyOWRk1aKJYTXaJZOIk=;
 b=6Hq5HgVrykHDYtu6kyFVxi+R7Gm/imP9XY00D2BUv0d154Bf4k/hxduwO7s5/Jx6824WDakXN
 nvPk/90WtPMCPwz/RDuj4eH2tiRVpE7/w3Y6ePA6jQe6hhbxYUmXd28
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa79b85 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8fg_tvuPYJi1a8Ph9hQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX72gIRGl19bb0
 P0OXMTj5mENL8Yxbs+/pYN/0XC+dVGk0qPKpZOR+FoeKjhB4QzwexgBSS1WnxYKRXsncp0K0beF
 oFrr9f+WGtkHAspbcO0adWZKwEliVvPqpIHW9KmXbGTqwzLlcExtD8Z1QnCD6i32v5QvoQEZoQh
 bOWDnv1FGbLYO2NHEGPfpPcN8jBG8ZnwZtk3fbD5chNrKy8MaQMPu4X6FVZWzDxzNAITnyXfkXL
 N08Ua3Xb8fE/0zhmubRTadXmhNPOM4OB8YBtkekY38cRFj5lQLTBcvEczduW/6RpyHHXqx+wF/x
 6bMrFnfkBdUbP0YJkPBR+JXSBJYGo0TyoWsQshOqE0qERlL1M5wTElK1PlBYLs+3ScNvHrtk5qQ
 dEQdgz/bcIAoIuPNtE3nlEwyhXudQPoC7mooB3Z7n1hdNsDeXhEqyszIOdiT4VtscEIPt6flGdM
 VW8X7Wk2bwu2D+1xMYg==
X-Proofpoint-ORIG-GUID: BbJIDBhuN8LAlB_AVlwV9NgtyT-TI6Us
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX0iiwOwLAD/Nc
 hc3C2jnTThcr9SMtJd1S8TERq2K7Dm6ePyCZQ18GeJiJLy+rHQdi0MK8WhDGB1kSyTxKba52cWk
 PEfx9E2MIFNw2+xkrk4mbOaohPLu1hM=
X-Proofpoint-GUID: BbJIDBhuN8LAlB_AVlwV9NgtyT-TI6Us
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index de1b72b64d96..e7af7e36ea1b 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -284,6 +284,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <355>;
 				exit-latency-us = <909>;
@@ -293,6 +294,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
+				idle-state-name = "gold-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <2411>;
 				exit-latency-us = <1461>;
@@ -304,6 +306,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			cluster_sleep_apss_off: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <3300>;
 				exit-latency-us = <3300>;
@@ -312,6 +315,7 @@ cluster_sleep_apss_off: cluster-sleep-0 {
 
 			cluster_sleep_aoss_sleep: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100a344>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;

-- 
2.43.0

