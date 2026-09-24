Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C142847CA71
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 13:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255225; cv=none; b=c6fVh7p6pFH1DyKRx2wX6+CBPchHWL8OrWY4iPBRmwBnrNbd6EBRNijd/X40DkYK3SxQcREXTMgg0cqnha9IMfb1iCax/GwkqC9uemxOa6bZBBN458k3BwLI16g4cjFQf56m/fNF1c44+Q1mRup3N2dy++iqoMv7B6mTRi9MAJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255225; c=relaxed/simple;
	bh=OtGLY2tYgsurW/oEJaL4CmfsoEtpjy2+b4rFpkbEHFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CKkIidg36cZCTVhpkFzqzznvcDzo7YRbZqUu7KL5rhD7uRq/pML0/aknCrHO2niLN/m89phW6EAVxhHKk97McobZNRp3aOZusj1cR6P0WgyvPhVtSYq7IbMrLKYt6N/8/vyVraq936oBrwA4S8WTXRcaS2snJuT9ju3kUJ1bGIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xnr7yV6A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMjAVL5L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xnr7yV6A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AMjAVL5L"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC5MbW3135553
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 13:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hfStSerMXzGJ/RtDmKQbNO/HgEnZMcbi6PY
	ROxvB9FE=; b=Xnr7yV6AD1phOC0SnsxCeiGxyz0unlkMvwxG4RiRbpoJI3Srphj
	JFH4eWURz/rok6f00Ds97FW07vDZ0yW8NaAfEllk6un0KXc5iaec+wiRFuk4gGTr
	nh+1GPb5/D7+wcLHUnCuh/kLgxU3RoKOykYC2AcNeBFgQEDUIqIb7VfKPRrSr6wg
	ybYGezoKTxjWSw+f0w7OjF88NLa/h8OVv7v0My3BqunoCCDGdLI5Vl3oaK6UVqQc
	WNoLQ8f8NyiaaKGutuxaoeuFpOXn0xgn8PDitlWy7iP4NxGnJevk19SRFrTQxbHj
	+Jp6nDXrqVmQYCo7mq+mURvqZmgtsL0aKEw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1ragr8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 13:07:02 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78fb9f59781so1849416137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 06:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790255222; x=1790860022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hfStSerMXzGJ/RtDmKQbNO/HgEnZMcbi6PYROxvB9FE=;
        b=AMjAVL5LKCyLaG2zBJWe67htBggNZJlNFY8oSeuRQlChHDTssIDb+bXrWM3MpsOUfn
         AbPuHdz1QJTwO13yQq7ouWTHf2u0s/WLg/wOIlV8iKN1xI8ER8JQidIjyk5kwgeHISDW
         5xGsMD2akiwHY22f+H5O4TlsjrWe8VOms0EhV48jtO/H3LqEQ2VF2Yg/szkt1+xo01IT
         969TUXVT9qTgmJCMZcX3SpfYOlqp9oQ4qn8ZpYZWG3athpUAo/MMFL7ZSBf+6BexRE3b
         16Jldcl1hqy0ofgNBjOJ2AObF8QnBgT/Oxovonwyld+ea7u9Wzbl344HXAIRzJWm+Pbr
         TIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790255222; x=1790860022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hfStSerMXzGJ/RtDmKQbNO/HgEnZMcbi6PYROxvB9FE=;
        b=edG05X0VwoPvMudNJzTvQNggO4N7Gg9xKqOwls1o8KF3TaGZHJnHZFKfJtCWEbVtK/
         yhyrA5kLxx2BEGkcFMyp/zQwe730OW9DjYhIlSDqkeRg8MQ0c0rskjwUy3r7sK/FgIT/
         eVJcHwnKNljSuiGilDtTN62q8DOKgxkimwpR8Hkr+qH2vBWadRjiq4kGnipUjktilIln
         K2Pibn3z2Ht0DRdaNKja9KeMBdfaNZuD+LaSVtU+ffaw5CrxZSbwTI7VY+KOCIPIjATK
         WHf9z4Z46lii/OJ31ucN32XCULZJQD4YGSY3gbDy4II0A+BO6uvBgIf5nJHZWsDy2mG+
         xovQ==
X-Forwarded-Encrypted: i=1; AKwUvByHdDzWbTQr1irZmYhjL1mstH/GKUsHwpqJo8OuE0y/JmBmNjrbqCIeyxWrOWxPbzupsz0HnaXPuHf7nwHU@vger.kernel.org
X-Gm-Message-State: AFuF++lqhX8/LmkB/owUpA462n3in3zzNThLoEoQQVlpUVdJuDZcL/F3
	cjY9UXpvNNuRadeykcDz8hha6kw4bmu5SKLkd3C+ELZTmoP3Rsj+uagjhJXEQmmDKk78QP/5haH
	3wPa3A+VcZBTZT3VBiSn0dBF7o8P4f/rMStNbsAITSYlWtHmp9PAX7HTNhW8l/o+eY+ws
X-Gm-Gg: AYBFou0NY7GmuMu8Kynn8yz9hlQHb7rxR0pO4DNP0aw9q39pE8Rdsrgd2/qxQW3z7oL
	nfp59iOsKfr/6HORn2bpmDE7bVQNC+aVFEs9+Zs1bP9ttCoDCFQ3lqmzUlKsNvOPnwn0JM0rwSe
	iVjn7DpKH6I2muNqUi+RgsBm6wDG3LQ/Ta+Gv3PaY2csY45iO4ejB7+uxcN18sOAi1MIH37/nTn
	qK/WZ63UayR1k31C4e5Gfgv9xeFy9lmkrkqJCZPEi0fzF403MfM4b0HQ6+P7JOxhsgPzMDPYA4t
	48/pUQthQg8rQkVzBRbZ6btgKzVSTDKRs850eYAvBse+1ESmJyzx4x6vWot7YAxccR2tZtDxxqH
	O/EZeyx7cwAH/52/B7RxDaWwwAEGFyIRM2yezb10Gefw7PQeaM4FFZT+7cXpaj8koXyxDjFXP84
	pda7mxZZcjFV2c3iDKCQD4qf/iJG2zl9W9OZYE
X-Received: by 2002:a05:6102:3f87:b0:7a2:6b90:3d7b with SMTP id ada2fe7eead31-7af1c691fddmr1410262137.8.1790255221883;
        Thu, 24 Sep 2026 06:07:01 -0700 (PDT)
X-Received: by 2002:a05:6102:3f87:b0:7a2:6b90:3d7b with SMTP id ada2fe7eead31-7af1c691fddmr1410256137.8.1790255221451;
        Thu, 24 Sep 2026 06:07:01 -0700 (PDT)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38bc04esm3665913a12.29.2026.09.24.06.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:07:00 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Subject: [PATCH] arm64: defconfig: Enable Qualcomm SPMI PMIC Thermal Monitor ADC5 Gen
Date: Thu, 24 Sep 2026 15:06:59 +0200
Message-ID: <20260924130659.8841-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1NCBTYWx0ZWRfX6y5N/MVHbI6I
 UzdY/QU4n8TBGyOf4DOYPDvbpvvbm4oRKg/3Clqzxpng3aNABb2Y9mRAfyN5ve6vQxieKmqd3hX
 9veGJuKQnpAqBrxnwzinTmWh1YJJYhElv/xrOAypGGbaR7ct4oi4kOwUqef4Qo6JjwGQWQd2FzV
 AsoVLjxwp/ymXSmfk19lg7CmvY1ybtdiQKEFC/kmF16VmFL3kp2EeN8/j+gl1HAhrCa0w3h1HHt
 dPzSw4/BYZLo4C2y3L7oOXGL42+h48n1YKHABYoHpxuhWo/mLD1kc8wMClQOVP4eZQ7avoxy8cO
 GguquuJS7ZvjUp1FGEPpQMlsDJ2y/lsD4C0LIjKcxHSNKsV7zDDGKOyEtiiVHbVxdpisktAoRed
 jBW/hd/5kYcjcITg2Af3mnl0rFcV66YNcpfYk/V8bIzlqEfZLgFGKwBJjCej2249gBwhd5BeN+L
 wwXezEUX6P8CJIIti0A==
X-Proofpoint-ORIG-GUID: TeTDCyJdFtIF88F_Tbz_6vWWtco51wxs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1NCBTYWx0ZWRfX+Hy6Mi0wIhoE
 IFBMU/FTYCBuoKP9VLpD1jh1s095jUSkuM9EGhwTPG7JRGh6t/vg5x8deTS7jrytOpyVm+2Us1o
 Bvc9DjjRA30LQEbbJhLhgeKC6DCUQ3U=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab52076 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=kHo-VL0827TqqIXx3KMA:9
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: TeTDCyJdFtIF88F_Tbz_6vWWtco51wxs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240054

Enable Qualcomm SPMI PMIC Thermal Monitor ADC5 Gen driver, this is
necessary for thermal management on Hamoa laptops.

Suggested-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1c42ac043aee..37a0f4702e71 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -800,6 +800,7 @@ CONFIG_TEGRA_BPMP_THERMAL=m
 CONFIG_GENERIC_ADC_THERMAL=m
 CONFIG_QCOM_TSENS=y
 CONFIG_QCOM_SPMI_ADC_TM5=m
+CONFIG_QCOM_SPMI_ADC_TM5_GEN3=m
 CONFIG_QCOM_SPMI_TEMP_ALARM=m
 CONFIG_QCOM_LMH=m
 CONFIG_UNIPHIER_THERMAL=y
-- 
2.55.0

