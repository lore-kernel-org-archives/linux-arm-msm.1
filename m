Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD3C3B14BE
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369266; cv=none; b=PtQCigh21RnuZpidvjNm0BDwIzXxvZSng13lADR9F8iJ+pBVLCxPOkFUqEEmwe7w3cnN5PlX+UdabKwbooZ+0Kzrq/dnAEsynAjsr+oqd0AR/d7sKbF2TGabZVljUBeEKuN6q3zYIwOLIj8oPYSC8rOfkbWxEm+Bg4OCC1kUfiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369266; c=relaxed/simple;
	bh=K5l62XdMWnRy0q5fKR/rOgkLSu12k+HELp7Xu8abHi0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jHep2Se3ACVusbadDZHkm2risr6LH1GxeAQm1R2fHqjJi1JI6xi4uXTXkRYYfQn1s2OtuExzpQrHD7KBCn52nBKnBIws0/ZGfHwIKD8ktyOXpo7HCe/dC3HOXR9OnOhbhMPvm+sZbwe804AtQ1ipDrwkHoWEq/OI0URYMxLzoBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gn3JssHi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Df7ofSXS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gn3JssHi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Df7ofSXS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j1wJ793870
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T88OVQ89MrHgKnM7cXfNL4oaePaLGF7m0GMkc+7rX6I=; b=Gn3JssHizGij43aa
	b4/x6iiks2x0WHqqHBhrasnQqQOAvWRpXs1iCavFYSku+iYx+et3LY9r0apDJf87
	8lSyc6whxA+5tfHnt18ZfZoGbss25bl4e9KQw7EtEysL2aa7JyO/kr9n6Vl/9pXo
	CIlWMAGN4244o3u3rNqlt7t1KxHsWXSj+NRJBcckDad6sm5+Op7orPv5bvf/cd0R
	suk7BGHb2GvJjlPiM2YQmN/VzeXR0LLV+Rb1W2WvnViZ+1p4LxxWKcEQisQl1mty
	9iVVANIcfjcPCgWrz169SJ7+xPcMc+1VZy4HGEDJHbrVZb3VKefChHA3H0Z8vQrx
	6IONUQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cnd0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:01:03 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7f4fa572ba2so1562959a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369263; x=1789974063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T88OVQ89MrHgKnM7cXfNL4oaePaLGF7m0GMkc+7rX6I=;
        b=Df7ofSXSiFGUIP02MKmxwnmNIKTyT84qJ5rR2e/kJsvrVdNKjzRuYjmZ+f0tXpENQo
         mJ9M5m6hsQ7Od52UPvb5ZYUv8vwFLdHbWtTHdY4LzWjZpOcpjtEwaZrYh14AF8zYXPwD
         VJO4nv8TYl5kG7m7W7W7zdrFZZqFMdt1Gb5eK7icNekeuq8HB7Xj7nB/ghpPwKgVMuei
         ZBqjTTcUZBAovGao0LCU+CaAvSWG9bU7UOvkePYQYcO7ZCWQ/uGTYswwiDMRUApA/dR6
         AyjOgqFQ5kGFAD8K/OB1h/J/e57/Vu5waFJNUYVqxfCQoUGyN5ct8bPFpYe7NatKqi4Y
         kL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369263; x=1789974063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T88OVQ89MrHgKnM7cXfNL4oaePaLGF7m0GMkc+7rX6I=;
        b=nokffHVvZRj3xtC3gFb8JYRduX0CdA4es/0aofB389h9u87RfF4fGrFYAFXw6RzHlX
         7TpW57g1NSKrJqUNV3jRC9oymMrkgmZi1QvMghf3KNY9DxNBPReG/n8CrHcrlBxIkqz+
         1+CigEqYMuL//HGIIt0//iT2tgP//uGGmwF4plSLbPnhqOPco6WKCZKm7LDefIQD8Rlv
         07brco5Xzfk3j1/1mu65gZNVEEdKLYzK58kibqEaW+5NfXP+p0Wd+lPrx4qYHBQOq9yb
         9jIEachCdnesa4reXdDy07lu1MbIEUcmHFCBb/l4xDBkSgKYbS905+1E4/ZNoskFWz0r
         ZMbA==
X-Gm-Message-State: AFuF++nM1hmRNNLKXL7IV0Hc6zzF8ySvpK3LD6dsUd4OcP6alb+4/G2y
	2wkwZ8gwOl6PlU1BMRqVUNRdUiD7IQi53mhGTh/LeEY8dSCLDxgTAdIxYWSgO+DcL8VEuWHVFDe
	s5SA6jjKznhKMY/OdlNQYFNVqzr1X/ITPXKdqJFQRQl4sYgWESq8fHCu1BN0OHUFLd5eD
X-Gm-Gg: AYBFou1J1EEwboCCCNs0Bngsqhb0U2aZfHn/e+m3z59obPe7Li8i7PZthP7qFd9X/4T
	dwM8pdmdEdakSOzSf7No7lVFT7M8m86FENjS5Igm/K7cP3XhEV8HIYsn5meYhQ+EnZt2A8kbdLH
	rlTS8G2BTQ6JBCHIyCPQsThXdATnY5asTcREaPb+V07FeNxTYPXxBUSmqsHOfZXoMM5cb4EtX5o
	v7w7gXSNPmfBfWSkmoluN/xdFWFgC6nS4Dz+Ixllm+OFegE2bpe6ivyuavq/A0fI6MPjm9vpk46
	FKtHDWPabpvvAeldPFqEi2PTVpQIjUh1G2wLWeWb4cXWu5beOV20K9u2cCYsO3FCEJ8frPYKxJN
	lkxq24GS2iaxJCFPxXzmHaunaB4OJ
X-Received: by 2002:a05:6830:438e:b0:7fa:5c68:d04e with SMTP id 46e09a7af769-80899e58bbbmr438612a34.24.1789369263060;
        Mon, 14 Sep 2026 00:01:03 -0700 (PDT)
X-Received: by 2002:a05:6830:438e:b0:7fa:5c68:d04e with SMTP id 46e09a7af769-80899e58bbbmr438541a34.24.1789369261893;
        Mon, 14 Sep 2026 00:01:01 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:01 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:47 +0530
Subject: [PATCH 15/31] arm64: dts: qcom: sm8350: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-15-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1913;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=K5l62XdMWnRy0q5fKR/rOgkLSu12k+HELp7Xu8abHi0=;
 b=9SOIRB1aAH4OtB7ANH/JKuxIxKZwx9YKwgJuiDwZdUbX+QV9m4090eqkQ+rcGn9S6djnMHN/V
 0MrI3acu+Z1BfT/MA9FDvaJyhryqhC+24SkpJZso+EoJKEVihB10A38
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXybO8Ybzb9eFj
 bQE3XiobCSfVPKnOS3dt1eSvqjCxyK6j82jagmKmg7YrmIa8WtX+wpnPZTY0tpKvGgVIXaeq1xW
 WDvefauGds7ar0FWSmbg1KElnZSwXb9yoHeM0HxfCwDZjMfCJHslLvz3OP17HCWIYaRps9BUrKI
 ciHZKOgId6yG+Yfaj6BLOZcjwCzdPczeyLf3u8uQdzeff0GXlQx4GKzhcPqhxDWeUbFRSuvWRoL
 Q2zVo8NmWLRtpRBlizjZ9MbmMmO7V/OGtpKY5b0q0s3EyOjaXUlXZ9hqAeLicVemHWcbjXph/qt
 irDxH75FR1Ar0CealNlxPAbchRUX2RN/rrlamBVnlIbyvHvG8ZKKn/bTN6ENKkxSCXHo16kQrlx
 fCLFcLxuhLaU6fTezGlop7XOTSbB3UMlEiuCskOZ930SYNd9oSg0qxoDx/yf1UWnYbjzQ3CTrbM
 z/nH1QRy4qiG9l8DJcQ==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa79baf cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=JPxaeZxcs0fqC_IBZ4gA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX/iL3wNpAF19G
 Xw0MCojjyPMo52dq8oTIkjUNXuUhI7ishnnndavQi/XuT71CcjyC8UhPawk/u1dSynmHwPDfALS
 T5PFtxnwweN2Y0hjtu2pU2UKGQQd3aY=
X-Proofpoint-GUID: Ey5LyxWrNyU-3QUSw7QyLbOQO1XR6ee4
X-Proofpoint-ORIG-GUID: Ey5LyxWrNyU-3QUSw7QyLbOQO1XR6ee4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 100faea925a3..6cb694be6fe7 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -252,7 +252,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "silver-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <360>;
 				exit-latency-us = <531>;
@@ -262,7 +262,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-rail-power-collapse";
+				idle-state-name = "gold-pll-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <702>;
 				exit-latency-us = <1061>;
@@ -274,6 +274,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			cluster_sleep_apss_off: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <2752>;
 				exit-latency-us = <3048>;
@@ -282,6 +283,7 @@ cluster_sleep_apss_off: cluster-sleep-0 {
 
 			cluster_sleep_aoss_sleep: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100c344>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;

-- 
2.43.0

