Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8072038F255
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369198; cv=none; b=FJVgEQ6L3XYxjjtWdZtpsDtbTp3WbcbC1tZJxuEFjLV/4S8KfI+70diepdEqclRMV71rwrDAdF9zhejDMKa8L2tPFqMl5pr6/J38gxsysMejZ6N2HObQiuuD8K3XFBRQKswvifDeBdkSnUA/ps5Uxj8gYUrTWGIY5yZQ3Gfag7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369198; c=relaxed/simple;
	bh=KH7fLQLnaYk9POe7G01GMZGFE+VNkF+R/gf20gYjH/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D4lochJfa9kFfTav9NO26esIgvh0I57ZnvsQfa0qFZ2c4nNicmcCOS6aVaPzhsW0tUIAnZIDEc+AsUxqOgJ+tZ163vQ2YLe3gD/JEecC2ATzwoFNSPbqfBrhWb0JAOWY5txJQNFxBQIhRN2MwMMKdzkux0G8FySkXJ+OQl9wvVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QPve2lnr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LtdS0ozS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QPve2lnr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LtdS0ozS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ilbJ2626996
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZRa4lpAPGCwrNzuLt+g/NMiLExtdLmGO60y2MeBvu5Y=; b=QPve2lnrRVCaHuq1
	khi4lm1DE+2HxzQw2khHGnrnS927p5BCSPFqt+ZUbhA9NDhpw+fS4AgC8AMHZT1X
	0Ji9PYA/SO4BjipfCTCAgZc69g3YfGMSAsavShHlbP7WZRslBVj0IPume7xf0sV0
	FcclOWT/0YwqX7e8bUjduYAy20g0uotDO0gA6e57iHn2VSzNt4N1Ohz0oD+Aeeqp
	E9vWKPqBxSDzmbIZStSKtw1HczH2K6xakghT3BtVh0cJfhzLoz/vOKJliSrBnEls
	KqHa5NsUbCeqOw+ba7UisKj1y7T6NGwTgNCvSuOaiZ3SfgiLitv1k2M7DiPWll/w
	Oxa+Wg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh59eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:59:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so2356051a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 23:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369196; x=1789973996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZRa4lpAPGCwrNzuLt+g/NMiLExtdLmGO60y2MeBvu5Y=;
        b=LtdS0ozSdnDmgxsFnK6iq/HtNPEQ67KxqwgZkZz6UcdoM9Cuyl6xXqMp4FGmdLFSa4
         szO7ocFTwbjYjwmEtwK7Y2l+sBVujmt7pvg4N8V2D4yHZCM/yd2PbTU6RRjO4IeyryNR
         VAELPNcX1Hq0plm8rZ4PkYVKwhgrZqYZbGRf2CYcu/PqLjmTCid7FG2iGUOlSIaTdPM/
         ErQKVZMdv5ma+x+GkUDl55p+icMvbwQLSoLzAIiqAeJqHMp6bQiaz4XGGnHjsH9qufmB
         XuSkg+MGqQJ3BpBhmwPCWlPidIW8b8AmjkIDlLoYQQIrfyzeN/3y8SKwP87lWVYeGk9z
         Nhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369196; x=1789973996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZRa4lpAPGCwrNzuLt+g/NMiLExtdLmGO60y2MeBvu5Y=;
        b=E6K+u+ZGO+lQSreDMqXYjw+3C5aDelt8pNey55YEqWOwCJ+NniEQNruigg7HdgZzax
         BmMiSeiMZssPthLUKhtPkMAsRdttRr3cOJC+aqk4TUf1+8nb/XyJLqV6muBP51MgB5YL
         /xIbaUuph2b80IoNcedrK53YkPeODl3oO/eRUSJeUzWqRasVQpwHru9AcA2JTpPaFFv/
         MjcFHbIdf7E2V1XeT52L662cV8TskhX+yzB/QfWXEwQayr6mtWoLsfcqBm6751Z4QGJI
         W64QN9fOQLJa2ZAMlMikidR5l/vgoZIIdnRVk9qWfv49wdxxhkaZkWjYckzpr/A1TAYU
         t4CQ==
X-Gm-Message-State: AFuF++myFf5qHUeJT98BCcJXsg+xLoKJjWvFFYhyR0IkzpANl3yB0MS/
	3JYKuyHixPiai5FD5oxHtgh3lULcbiQVESwOBTCTbab0xFF1Gv99toroXZFJDCg4M41Ft8EMUi1
	VXvYfXvg6K1L1Bw1sq/2iQWFly2T7ofb6s/JnM+HtT+aif4e7OgD0zaY0D/Wfx30Xy3zn
X-Gm-Gg: AYBFou0Gkh/ERSc6qmdksqna6hICnNNw5lA1xkPyRLD7NR3VicC5h2D8kl6jiQTIZhF
	9YLapRB5J+AEFLEeBVlMrVO5G4HItWoQbeTwV4zgbfEVY9d7E+RGdcufYLpId4IIxP5mLWyyC3Z
	lXhkRXiLfMR+Ym0cigbWz1xCguVtUtrjEzA87eikoEulP6e7/bBPGkTAROjy0T9PtQGv/pQLj4J
	dO1jgf+vu7vDL/qu5am5HtM8Bu2hshoUCKNFRy7MpAlQOhJbvYdN+9/5iywdsRfpJOnIkggoiCV
	O1ihk7kPyagalnzeMe/pFGATyEDT4qPU33bqnsqpjhQlypdAYUYCGFpLJPH31Cdq9sBRWWjVxRB
	RZgXZfumKxls5ej8UcxBVbAI5Xpce
X-Received: by 2002:a05:6a20:7355:b0:3bf:9b3d:61bb with SMTP id adf61e73a8af0-3db405a95f9mr2349564637.16.1789369196039;
        Sun, 13 Sep 2026 23:59:56 -0700 (PDT)
X-Received: by 2002:a05:6a20:7355:b0:3bf:9b3d:61bb with SMTP id adf61e73a8af0-3db405a95f9mr2349527637.16.1789369195621;
        Sun, 13 Sep 2026 23:59:55 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.13.23.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 23:59:55 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:34 +0530
Subject: [PATCH 02/31] arm64: dts: qcom: sm8750: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-2-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1111;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=KH7fLQLnaYk9POe7G01GMZGFE+VNkF+R/gf20gYjH/Q=;
 b=vHPI8MiUZ/VS2LL0GGMeqyiG+JQejUU8ZoqnbYwfjhU5C2KwUSB5LgkZGaEbVDoFHZBEfSqQa
 VPk7/MQkK4ODda1ELNqBIG9QatCobxHByCOI7OLuLi7vFlklH0Q/iX8
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: BvO1SEXWyMWej5vG7cBXJfSRrlAMgVD5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX9VD4Z0smrKD6
 iBU528X8EIenb+8/igQa22uNeHFK57gmPB1W0zJf/pvTlKigMtVcd+cSUHxG9qWZoPc/bLZuWhQ
 DpJ3RQspngS6ypPEwLDUhdjVtgnG8IiycUS2QpwzFcAMx9kyMck0+ZjpK3ZSyQqTzojC0qmqlVd
 EIlzABg4MNsggV+yQWVzVQYO7sJd5Gchoa3UHs88Qw069YkUbP5b2cYTrLuuVzwIkFVJtb1fGJb
 PaX0iGb0NpfW9haoeNBuRI20z4goTmuD3ERMpny/kWbStW5sz1wwVg+kEverGS+Abkto2NeKQvK
 7zaCzzZedV5eeJu1szAuA0lwu+Ty0f2quuGTf3zJN//rFOGs4nHvUHJdt39VGzuM1IywS4IdcBh
 yNiT6FvVPiN8w5hyht/Kw++CdCT310fT3MMPQE6lWszyRHwnnb/KgWih7Mil/Dk2s8XxkpVO5uM
 Yarvyh0s5IeiVgiPPlQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX9gqgVJtrfkce
 UIFpMUgwvuntMnDrMKKeUut1Vy/+txWjItY7Zh23vQlVoTa0k8mBOqTZQhc5UUGVWG8Vxoa1tX4
 nCjiyNkJUuOHvl6Ku80L6c9CuYH6rac=
X-Proofpoint-ORIG-GUID: BvO1SEXWyMWej5vG7cBXJfSRrlAMgVD5
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa79b6c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=kLiTxru8Czh8OvV4UKwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 28cf22da854d..897790a3a492 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -200,6 +200,7 @@ cluster1_c4: cpu-sleep-1 {
 		domain-idle-states {
 			cluster_cl5: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cluster-cl5";
 				arm,psci-suspend-param = <0x01000054>;
 				entry-latency-us = <2150>;
 				exit-latency-us = <1983>;
@@ -208,6 +209,7 @@ cluster_cl5: cluster-sleep-0 {
 
 			domain_ss3: domain-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cluster-ss3";
 				arm,psci-suspend-param = <0x0200c354>;
 				entry-latency-us = <2800>;
 				exit-latency-us = <4400>;

-- 
2.43.0

