Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD71339390
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073631; cv=none; b=nQiwOwP8wD7jiPXvUWIfdNNJAm5vWRmy1lVveZLcD1APFr2o+7XtU9Xr/twN8ku2l5W9OK7b62vdh0UZnd3JakhGm7xyzcyEa3cD3sUSJ/oCdf1m10sM84wBY/Kg0T5w/c2lBOrDF7lNpkE7bDmpAHwowaJWudeZyQpNX/7FuPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073631; c=relaxed/simple;
	bh=slcEAdPSYH5NEOq71VTER+2lMxCdLDrKoRGVSQOSvsk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QP1mC1fV7CUHlyAJ52wg2ENVNah8SKkI7FnHv4dAz4farHMgUGuHu0WInu2PUOizNaUP2FIKHc58Jy+ss1x6x7LvMLB/GNo1GxphmbwW+QLG0BT7A2WaRsdllqggIsIzZtpzOMiEe7sntQWTCzqiS6A4eLTptSoAReBvN2luliM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O3/MacF6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h7illE9y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O3/MacF6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h7illE9y"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kGUF2999177
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YdRc6SMv2KUp5wyy0ZVr1R
	mtVcQydEq5NVgRZUUgts8=; b=O3/MacF6AKl+lBRSHEMt7BaGOn4OZqtiAfki5P
	x4FuRpluYtNipb2zRMyGMm5PEQ5JVfqUMl8lvQZPswjbZk1XX9zfxUDp5vL7+N0/
	YE4TkoC7D9xq/Y6NRLwEmycoNMKhUPlbl19Ve61cfwwlYMx6zWVk4hARU8gu80cv
	t1+Kbf4z0c6E4b7lIKcKBF13S/iCEPZEH9O5WQuGx8jS5nnYS3nl+7jTZWFOPhFR
	z2HTRK4peBc4hfsfh/sgSp/lvgSa7oy6P6ColO3ZiGnAD7pq/23mZaUvJJEmMXgY
	9XLMKpff1ghjpISk2uyUW97qnW93bu6L1V70ycoavWxcUkqQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm1bf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:13:49 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6dcde9c2063so2844076eaf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792073629; x=1792678429; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YdRc6SMv2KUp5wyy0ZVr1RmtVcQydEq5NVgRZUUgts8=;
        b=h7illE9yjmbNj2FdaJNff8bZNk5Ur1f/4kpr/OpXy5G/Bm75IJ0Oj3t1vNwALlzOdP
         /Pp3w4VNwVK3VsKS2YzT//ZPM+6n/kTomORGxtElkpdam1KAjobmYbO6XnR8mF8Bj5Md
         H02322xdYqzvqQTxv3Xzg0LcVNi1AeK3JuFOE4Pkp5i/9Ly9eiMQVAk5M2505vhiFmyv
         dvgNszoXMdXuIpAvQRILa84J/3bTzbR/BzJ8ws2ySbNnU83VR7F8Kg1f+L0pZMWtbpzy
         RpR/MRtKPw/+nbNUeayO835wRU+z5bxC6KD7ZFHV6nHvE65rgv9ARcqLi4zav24ZZeDO
         NLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073629; x=1792678429;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YdRc6SMv2KUp5wyy0ZVr1RmtVcQydEq5NVgRZUUgts8=;
        b=uoRDozu5qHdVIVpyELf9ilVmpEFnUdETaXfQ7cJWguWqgiqouT9dOMh7AHYUidjOnx
         7ey4laGZb6TcxLnypWLPaGyz99zAAh5FCuA5kz3gy9V+5h/0TI8FFEz/LIpWO6dCUi9w
         P2zIU2nhdpQlfna0TsoBOOV5k9xWLtEvf25ilSU1XMOh/OqRsOEH8+VJ3SccIsdD/ccM
         06b1L+b/hjzzSBMeXAN0ktqLmhIzcRU8sk34NwSJOwnBe9v32FbL5uXmFwglXTsaE5Di
         iPMKo/jyKVtlMwGWTxIzIqhO8Ie9GsW4PPz0sNIYs6kEKR1/IfkJRGC15pupgJR/idPQ
         GVdQ==
X-Gm-Message-State: AFq9FYKDYZyi2weOOfBXOLKHkbuLmxHxCxwnurPW34wwqyUZ3dWaDZyI
	EEWealk1JipwQGeBhjxb5I34OZPR4LB6hw1BF/AyVOaZHH8GjzxRdp8eGVZwRCfJA+O5s57qILB
	nPgznjfkGM0QnyrggZn81N1SOPWP3pEq780FXnr5I9IRyfmL9b3fU7J3exPz5DdirkuNF
X-Gm-Gg: AYBFou2nD2xbrvw284WBwhcV8Vs8f1J1WbPhrbQP+ukhgJ8ei4+o0esZqmj13+2tlZ9
	q1C4W1p/mNrQsRvsXV5g/XTljkqRmmCESQEGQciQxSmxk6xwO0P3puDTUBwIxZpmnNG2ImuEqy+
	jC/oIYnp9hvV1VJ2/+KvAG9Ilhl4A6aKETJz9YmQ7wkL0KhuHz+D/h1HHMJzoGWppW6ASoEPY/N
	Bd4GqzS16itmDT+VJf8TGjVwZly3gTUM50iIHkiInbvTqJLCHNLxYgltsYdloeEaLx+Xn7e7lbS
	99WYvXL/PhJC+lgr7foAXe0k0X6Fangp0hqQ/w7X28xf9OxDGJOigMt3eY9Ls/lZDMFZKhNpKpD
	VVSxQAxeLOWm/wqUA5Dwhzm2BaGVlX6zcDxk=
X-Received: by 2002:a05:6820:2d07:b0:6dd:cd13:43bd with SMTP id 006d021491bc7-6ef11932b44mr14345902eaf.63.1792073628755;
        Thu, 15 Oct 2026 07:13:48 -0700 (PDT)
X-Received: by 2002:a05:6820:2d07:b0:6dd:cd13:43bd with SMTP id 006d021491bc7-6ef11932b44mr14345873eaf.63.1792073628233;
        Thu, 15 Oct 2026 07:13:48 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6f47500ae30sm11366719eaf.1.2026.10.15.07.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:13:47 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH 0/4] ASoC: codecs: pm4125: Enable MBHC jack detection
Date: Thu, 15 Oct 2026 19:43:08 +0530
Message-Id: <20261015-pm4125_mbhc_support-v1-0-8bc1212db6f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHXf0GoC/yWMQQqDQAwAvyI5d8EEt4d+pRRpYqwpqMtGRRD/3
 m17nIGZA1yzqcOtOiDrZm7zVAAvFcjwnF4arCsMVNMVa4whjQ1SbEcepPU1pTkvoaGeWaQjjgi
 lTFl723/XO2wIj7/zld8qy3cH5/kBlWjL0nsAAAA=
X-Change-ID: 20261015-pm4125_mbhc_support-42fbbccd2b51
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792073622; l=1737;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=slcEAdPSYH5NEOq71VTER+2lMxCdLDrKoRGVSQOSvsk=;
 b=YmfyX28+y/bo1vnogzsbfIUZdSAR8lvzK/k7HpV4WFemBgNn/xFSar7G2ozqw6MajUPfJr+Xh
 C9mUA63lYHvDsEGBA6ye6CJytxBJ4/2AQQ3Bu/Wpx8hJUKoaFI9MiK8
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: FyZPMdFcVSEX2XxR9CDmUgOpGunImQLs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfX39TNs3/88lcA
 BfM2Dh+rTat0BFQQ2xVGHhVc2P64cgW8c5F9efZDfQ5MtKRIJM2fU4GaUYP2jscDO2rLjM19oQf
 Od9NVTn1TmkW4jEQqaDp7s6B1hSxthQSlLw95YjvIUqfZLFrdi7DIs0b4A+0pkE3Ya5E1EAA/Z+
 aRFepsv+rpAAT64D06AAw/Ws6BDAYbEstMXqaTxjBLsKGn+vL6TXiUEazgeKwJUY8oa+Vmy0Dr3
 npJKG9o0JBZCTQoHkmPcMb/Mt6DujUB8FfBQHGeHZphiILn7lEHTdgiyZhVmi1Bs2Baxy2R15Gn
 c2q1wcu85ec9SErcO61rRuJrrW+tD/AvCFvsEAzDoL1w+L7gHiwEfoZG/5vVLbwKtLfGh6oPIoL
 uTVi1QaH/2s+Zn2Qx84wvSdUZBYzi185C1Lhzv6SLvBZPpaY2cGzDQ/Y+Qbore++YAeIGbG5MSz
 5VZ5PRrv3Xr33V16IDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfX4kKMSGFIRNm3
 PIwUjigfb24ac6ZjbCd9nn/ncC52RuUt08jxZfqae7kL1X/7vub1hiAZEc8FJbXp5BBNfiBaf9a
 4gFf2kK7kXerZ/lvJR/613UY3GFr9C4=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0df9d cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=MiEwT-E21dmQKCuRkyIA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: FyZPMdFcVSEX2XxR9CDmUgOpGunImQLs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150056

The pm4125 codec registers with the WCD MBHC framework, but it only
provides the electrical bias and button threshold callbacks and leaves the
rest of struct wcd_mbhc_cb empty. The framework can fall back to driving
some of the shared register fields itself, but it has no fallback for the
ones that control hardware it cannot describe generically, so ADC based
plug type detection runs without the MBHC RCO clock, without a micbias
ramp and without the headset ground detection comparator, and never gets a
usable ADC reading. On top of that, the one threshold path that does exist
programs the register wrongly, and a reference counting bug in the micbias
code turns a jack insertion during playback into silence.

This series fixes those issues and fills in the missing callbacks so a
3.5mm jack can be detected, together with the binding needed to describe
one.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

---
Mohammad Rafi Shaik (4):
      ASoC: dt-bindings: qcom,pm4125-codec: Add the MBHC jack properties
      ASoC: codecs: pm4125: Fix MBHC button threshold programming
      ASoC: codecs: pm4125: Keep the micbias reference count balanced
      ASoC: codecs: pm4125: Add the MBHC callbacks needed for jack detection

 .../bindings/sound/qcom,pm4125-codec.yaml          |  18 ++
 sound/soc/codecs/pm4125.c                          | 206 ++++++++++++++++++++-
 sound/soc/codecs/pm4125.h                          |  13 ++
 3 files changed, 233 insertions(+), 4 deletions(-)
---
base-commit: 686b3eff603871bd500434e00ff15394a0c782bc
change-id: 20261015-pm4125_mbhc_support-42fbbccd2b51

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

