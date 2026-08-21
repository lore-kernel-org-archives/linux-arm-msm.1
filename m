Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBEE389472
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 04:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787287960; cv=none; b=kD3A8pNG1/t3MrR2QUWiaXrmfRehSJa/KbLT0jsulp2lQcUH1P3meTT/hiUGxwR7pDvWvZAPWQn7GisUkRqI4rDMNAxwjQjvhVGD2QZaCfSx6S2DmZo5j1TiTi15o58RGv2J8aR+WE0QlSoD1DRB93Dy3Sv0M4EMNGwCM8pFRmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787287960; c=relaxed/simple;
	bh=LDMRgyeDtFlrbMHasi/VNNmOqMLQhwi5wQZwMJNOPBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WkDOWa7sMOVVKk4+4fuOf/Et2S7bGUQYdh2q3vXVlzyrsvWUKg5KnAoFHE7vtQ2v22oLySFfr+jrNL3hg6rQ4JRHb8x+2x9cPNCI18ED30qew+7B4SueOaFKt99iyQAFWWSCHyCNbM+eDCc9rY0wyWtP2AssnosLxOyofFaDafo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENB0mekJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+e92FrP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENB0mekJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+e92FrP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L21hjI1024259
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 04:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0c6XRKXv+9+yiPODmIiVTnIpp1lCrqspvfX
	E+471CL0=; b=ENB0mekJ92CY1dM/09e41k8ZojtjCMXM50fwzbS00J1h1t/NeMz
	hXP8ibVp/JzT6CX7YtX/tAtdDno3JJLKiC4zhj62eV198ZY2kIrUk1dlA4w3PZkl
	rb8GqiLt5UK3RtqRhqt+fRysHMkqooskWaR+DJFB8r6HqEbmx5EQTpPdJO6uAhyn
	Xa3eztsVP3+nkYS6FZyklvyPTgL32IiSlELOm2ZrbXuavgimYkRAYIG8tNV0ajBA
	opvzBJfTv0oWVdlUWclNGSUqI47N//Gd6QjlfC+eNPm+LBzITjw53XJ03qniihr4
	RZr/w1DGVc6b0wg/0/EXSH7bvaV2EyeU0mQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg1ca62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 04:52:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so884305a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 21:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787287955; x=1787892755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0c6XRKXv+9+yiPODmIiVTnIpp1lCrqspvfXE+471CL0=;
        b=C+e92FrPpGJPMpTyhD+yo1HJwZI/+D+DpbKsmM1z5yvYmyY7WOWUaEQxS0CYgXZNx+
         sJ1on9Fba1v9zWmamyod/epeYTess9lNSSYB9PC3u1pvgIH71FVn+MTB47FVDkNhYD2u
         bJsEwEVrWq5zxH05X4Zr19cff7ziZfqA/yC29C4egkD9WssM9+VOY/WoBNkrZu1MbK4X
         lhFhrqhd9J4Csdk/tbsstDbssb0tjDhFLZleTEwgiRUR+xVqFL7CcboSOcIVJ7Cz9d/H
         u6TpV1/cqbBeHZKVrVpkCnF/FO7v+ABZxOpg/7K3LjXx9a/mcfld28M4Z7JPMBdzmF6l
         sB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787287955; x=1787892755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0c6XRKXv+9+yiPODmIiVTnIpp1lCrqspvfXE+471CL0=;
        b=hchYgZoHRdLn0CLoYSt7sQkcgVNp+Ea/BGetcz8HB5LNc/P5lHWlFCajlZQnUris9c
         wnRrK/CNs2pBwrhlqCljmoH+CITxsjtZz+8MUQ0CCtAh2E7fqPXMnNba6RsYoB08lkgz
         UhleNSC9yMJ3pcDgoQXBO6Q0PN0Nr/On1hI82eORJAorNbNAwxS+IKZbxNwONK63it5R
         s7HW+b0dXdyulkp1L9PK4FXHQccx51oF7Xo1nNNYEuNhpYAWWvzpw8vNHoL68smpXIll
         rd5HnLRdgnD47yAmtC2KCGgvROP3GMRuiP9/owvg6uO/XX8Kb9JSh3COQSOyNHwp7Xlt
         KhpQ==
X-Gm-Message-State: AFuF++nleyFrxaREZlm04q09NzQp7v9E0ucCfN7vVFztcJceVA5GcuVo
	ua3bi4jYuHN9VO04q4YQY0RjBB8xlVET1Re3Ui+cG4SDNtg+ikipZbm27ct4C9BUMy9WRlyddiM
	V7jM1zAkOTn5m8+ZRCNSeHPyTOzzDGpvQ4JPXljKBYT1wwc1nTJ4w0Ri+B31qdvSTzL4N
X-Gm-Gg: AR+sD117vgW2R3UpjIPaY5LxkMrB6QhKXJ7fwJcc3+CMj0uz0r38OXZqiBeartrq9oO
	NEAaS1Ym1lo4iKALPgFmroXER67WDrUJBNBTAdmkcCe9yuS7sJYArqdvf329yXRWdBMjMf4dF1b
	T8lH4/ZfPKeGjXVndFqyY7uEeryn1HZPKUIxMYxyPSDhdkFNcJ0tJkzVBDPTQLYOJehNnfi7R1N
	pRnlsS9TWdLGSHGtUzDvW7jbUjQYgxFrYTeRrSwXlyg84k96ZPIRsgkSNCLFlGmBcndhzQY94gW
	29zGAIgHUo0s+quJdMyWWgQybR3dAZDL8UUyQgUCZaeSjib8Qqrab6hiEit09DzNlnVw4iRc+kC
	/nPvtnhU1PQGE/3JRYIH/9ZL/PLucbZVSmvpUWRspnquqGnkwTAejwAF2BhqH8xY7xXSNwFS0oI
	nKgDSrxfeUM0OhXERLISyhrw==
X-Received: by 2002:a17:90b:57ec:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-395c354e8e1mr6945660a91.7.1787287955263;
        Thu, 20 Aug 2026 21:52:35 -0700 (PDT)
X-Received: by 2002:a17:90b:57ec:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-395c354e8e1mr6945616a91.7.1787287954846;
        Thu, 20 Aug 2026 21:52:34 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4b47ae8sm1516867a91.13.2026.08.20.21.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:52:34 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: Fix CLK_GLYMUR_GPUCC default and CLK_GLYMUR_EVACC duplicate
Date: Fri, 21 Aug 2026 10:22:15 +0530
Message-ID: <20260821045214.2623299-2-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gKcriw5cKtAvg2kCU_4b59u34XoYCfgy
X-Authority-Analysis: v=2.4 cv=G7Is1dk5 c=1 sm=1 tr=0 ts=6a87d994 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=FPN9wVbhs-vOQks8sBUA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: gKcriw5cKtAvg2kCU_4b59u34XoYCfgy
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDAzMSBTYWx0ZWRfX3JUXVZElRb28
 VyEMwV0h90pdAK4vMytgkNwwK99mhXy4cL1yqW1mO9KlMNXruWx06ZNiYNyOORrM3ORtYMWBAUg
 wdQGpxMogKXUjfW2TNO644566n2PMLY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDAzMSBTYWx0ZWRfX2qYnbZUssB0L
 H8wGzAYVXqagEcLMSdsJHkVecSqx1lzTvOawJdhddygM06NLfLMkY76pviDb6X2f7Mgy/LxypEw
 xkrq/K17wg1zxk3pmI8U4uupFLX1UiY5mdNNMVwoAS6q/18xSw+t/ZPI+Yrgmppg7bU95VvAZYb
 uzCMavoanH2ZpDDZxZZnYCYRvi43ghj1y6WuetDqM4dkz9K9EArfg15plz95KtVF6086FBpxrP8
 7rgiNx3+ma2rKeSxISZVmxY8c5W5IhintujWTVnyf4XZFPjeZNv5rQsKO7dCx1TguUBFmwE3hUb
 j1e2jb2I9a0HwOz8L+1o3ecaIegAZTy730nx2kVdHh5HMaBJcakG7xEtaNkeYhKhP/EQZYueExn
 HF20NXpdlsKF1FeaRa7UwqeyxMjnhCRCSJiAKc0Mr5Dh3six7oyy4hFiI6mG04tn/bW9/WZLWQT
 zV839/midZz1F4fszxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1011 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210031

Commit 6b150572bb76 ("clk: qcom: Add defaults for desired arm64 drivers")
missed adding a defaults for CLK_GLYMUR_GPUCC and created a duplicated
for CLK_GLYMUR_EVACC instead. The original patch series did't have this
problem and was introduced during the merge. Fix this by removing the
duplicate and adding a default for CLK_GLYMUR_GPUCC.

Fixes: 6b150572bb76 ("clk: qcom: Add defaults for desired arm64 drivers")

Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index e609a7819e07..7cd3ab277d37 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -104,7 +104,6 @@ config CLK_GLYMUR_DISPCC
 config CLK_GLYMUR_EVACC
 	tristate "Glymur EVA Clock Controller"
 	depends on ARM64 || COMPILE_TEST
-	default m if ARCH_QCOM
 	select CLK_GLYMUR_GCC
 	default m if ARCH_QCOM
 	help
@@ -127,6 +126,7 @@ config CLK_GLYMUR_GPUCC
 	tristate "Glymur Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_GLYMUR_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on Glymur devices.
 	  Say Y if you want to support graphics controller devices and
-- 
2.43.0

