Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747943;
	b=IQqahVaGnbGhP0OxEDXsb4g0XXXz6grIwTVHQw4evHaIopjDqCCzRA5o2qf3ETyOrkM/
	 EFVrnfwURjid5vMoZhjooWnI1DNYW8JchFrSx4QHfuvYUuuytuQ9gRGT3Go3sgMEKKaFl
	 Xk9CIa4RsNWS9n5zdumeNv8+FDq8KqKZyXJ709ipcGyxVYRTHpJLykmmXjofxQ3aueFDZ
	 m1lZR4ru2QiLznIx28VtUnjN5KPk9KtFZd8imZw3xF/Y2xNzHM6WVbiEPqVZiPywvu/Ru
	 lGigFo0bh/IfghtPufzgAe1tkznc4cuuQhTobriYM7LeB+rGmQV6+68avmIWuhj5STg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747943;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4ZZP969Qa0dVMO0pKpNSkAF+fJQV8oUTt4d8+dXPutk=;
	b=aqW47/SXsWaJ2G0FVegKqV/zAQkz7vI9bhq0SFwWxoNoU1UHgZy45luQtuY5CB5TB2lg
	 Vm8vduJYefF+un29Qm4mmU55VxssfzwYoa9gHLrcDs8t38TdFnj4/KHVBlW/WxoPVka6f
	 OYX3vF/fl5vYpmLcUN1Phcri0HwQUrEmBInE8pAiTUqB8YHnnOzWd4LXMtBqhS/9YixRR
	 4lKS6FAUyG9Ake6tp46vif6XztEMpEF2vfdmF9y7jL+gQGy0m4y17T27HOqR51uI7hT7T
	 2Ni3cySstHPLm+zQZFpEpM99CPf+7NydLdw4PY6/YegKtI2Q3Xmx5wOpv3yu80zFW9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="olHCr/66";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DTO6oxgK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4A2606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 23:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD4A2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=olHCr/66;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DTO6oxgK
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKpaM3993774
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 23:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4ZZP969Qa0dVMO0pKpNSkAF+fJQV8oUTt4d
	8+dXPutk=; b=olHCr/66IZCC+qkXrqdBMMyHNtXAfgoDUbnApVOlUdMkYMuw56w
	/bfgzdBXW/CVS2eu3nKrplMwD0CsZFosPuyUXu4rS8fgebdH2xznb615jXiElwZW
	ZBW0aknArj7jBXtwum40l4v4t45SYnZKXQLEHZT5H+oHLw2ifLl++kU9r96BSl+t
	DKq5bBCAqY3mm62jh+6DJifkWkB1ht7o6Kewndo6rOWBQdp9kPYQjEno2vZqiAo1
	sHsUesJbA46R/FwsVFkhAwwXMvihCImYmXF/DGA3pTabFdFoNATbvMYQkW0cos2t
	RLaeb/yqgQ8RMKKggly9BAh1iu/c78WVtCQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8ngvtg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 23:18:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a03834d8ffso228658b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 15:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793747936; x=1794352736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ZZP969Qa0dVMO0pKpNSkAF+fJQV8oUTt4d8+dXPutk=;
        b=DTO6oxgK5xPoDiFzRVfErlUntjRbqNdhzsK7U1hbucE9RWGjfHgI0QGi/+YSaWISd9
         A+enbdFO0suzg3X4NVbX68Fd9wg1361Kk85lHjO4gb6eKH85jF3mJFM4joyCUBNt99/v
         u8PGvV+x5MGQ/3bD4KWojeJUVD7PUhgVLripfU+nWfH+fxQAsIVd5RaYsqyuDMiq0xgo
         /BuTpIP08OAE1ITkRDtzWBHNoRM5hpKG90dOWSpZ1quQRmEPOp8sJDLSwumZTQ0k0c7Z
         auBaq/f4a2zmJ8u25+Vhnh+vAb4GrKmIvGACI5t/MeHMtr6vwYffKRaXqqg+SH6j6b+c
         OKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793747936; x=1794352736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ZZP969Qa0dVMO0pKpNSkAF+fJQV8oUTt4d8+dXPutk=;
        b=UbPm3p+ONNa6EPpPbL6JdcU1zVCNcF1x2l16R5JHIuAJ+j7joFyHHy2PJyw4fFdtn9
         Sla27gaOjuAqsqF/OSgkOEOsbO4pEjvXguS+vcnvA1FWRY1z0SO0rEHmXiZVhRhATZ3o
         GkzJwZH9NIFnji6Y1ZSljtPxhwhhDtdDFO8o0Gz7oavY2gJiEqnzWBnCKGCdECZ4eEyg
         0B5iRWWJloMg652CNrxKD5sNva9Rl96zOQ60irDkrK+b2JroQ07nyk6FbXdvFSHf1R3Q
         J5h6n7BZUSx/Ilm4gAdW1/bqsO0Lp41cz8cV18UG7jSvKuXBuvGINzIrKcYLfrBpwyiI
         CbXQ==
X-Gm-Message-State: APuU4Z9dnOCUAru8ojl0wHNmsxZEpyUF00D052Mispeoj4wIiiKvTE8F
	Egdt7lJGzmD75A1gSo80abO2YcogtAr8J4hQlrc1JN95Fo2oEln26/MGrgMAzQbSAU+mvs9fAIt
	8dnOQSdO66SHqqzbXG+hTA0ipdZJdZvKPguzY1jeqQDEDcEa1VXxKfeWSrzjq8j3VibOp
X-Gm-Gg: AYBFou0hWKe3S0z5hAli9Ls0oHHRC8JgGXZD6S+jwdjD0+G+4j30WIiaeFuIRWLkSyS
	2rAe7zpllONLeesjcLknbJ9IYcwDb5HklyEqSi8MXn49oosAPNu5JBfQmxKIDNFht9v7q/zsqPH
	6PwWMMOlhxoS2OZ+O/eCZEHBoiYMhsDihvcAHyXjKcqpP5i+OOagq7pKTxzPM/3Z0xppcQQsfc8
	yCu68+sT0mbbLkWP6DZ4P365a9Z5mP2vF4qaG3dOHLC/0Zwa2thyTGN0QzFVPmWK8dEuiPXQfpZ
	WheXJmiEgAGhJMnM8MrIBJpekjiojYfcbNaeHUPF1kR3dIm0XsCvSkSjdw2B1KTzdk+6LK8kGhP
	VEe/nN7uFsy016cZtloBjifTwXFjDiR7NuCoCbz2rZnCbE7ZJYtC8nFYuwUk/mQ8Vh2dQGlK9/R
	733miB6ScjkPnC/dqDKuSGX3DRRASPIjDNna8ogWIVwjlKbGN+tj3erASHHj0=
X-Received: by 2002:a05:6a00:3a21:b0:881:8784:95ca with SMTP id d2e1a72fcca58-8a9bf04dfc6mr12252527b3a.33.1793747935882;
        Tue, 03 Nov 2026 15:18:55 -0800 (PST)
X-Received: by 2002:a05:6a00:3a21:b0:881:8784:95ca with SMTP id d2e1a72fcca58-8a9bf04dfc6mr12252498b3a.33.1793747935377;
        Tue, 03 Nov 2026 15:18:55 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09b667995sm142420b3a.40.2026.11.03.15.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:18:54 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v4 0/6] drm/msm: Decouple IFPC disable and sysprof
Date: Tue,  3 Nov 2026 15:18:39 -0800
Message-ID: <20261103231850.17493-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfX18cu2f/4s2x0
 iBzku3nzMSn6ktS2CZ6seZ4lRuEPM37wOp2cGJBeA9poucury0kwu0C6z0o+TuUSKwuNVqYhVfx
 0EvRSi8yd6NN5bHndlW4IvjXC6IqrwB7NJ0Jbk9ASheu4/HlQzaa4sZUcWX+ubmboYqRnCscsPI
 Sd2jYeLRPKfN7FrE/6UphASoOnStPVYYUcQKQNNTtIFnn7raCdIgMwwjR9MRKknbZqQou/v888P
 fz/9dhE2bk7tzqERSBP6A/7iFl/GAqOUQ7OF1si/NcdvkeVvxzLHCyNv/gqlqIq1keSaYzhzEQ5
 sPkcuo3TfbsFzQgu88jLuR0E4SB0tkBHbN+ej9jMHERloAuwWVOF0xb5boUa7eeGQ1d/kfAbgrx
 j3nw2tQFLqUAZDaaLW1Y/syHObsNmXaC9oFdCCpsuPvtBjiqYlKM+hqd+5kMUIzXUS+6NaSXv1Z
 iE2UWLzjiMWK8uhk/jA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfX48VTkHvWiV/B
 d4QcqYLCqlJocynOzMEG1ORrxwydcaBdAOGSZUEe6kW2Mz7trrWDfvFT3V6oKcP1nykTip/H2oe
 zxskFbW4i+jrZxAtLpEYbQx1pj4uzQg=
X-Proofpoint-GUID: 3fbKS6OYNN64yp0pqwvcVRz_7yAFQXW5
X-Proofpoint-ORIG-GUID: 3fbKS6OYNN64yp0pqwvcVRz_7yAFQXW5
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aea6be0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pAKKPEBcNh-_eZAUbWwA:9
 a=zc0IvFSfCIW2DFIPzwfm:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030092

Convert IFPC-disable into it's own refcnt so that multiple threads can
request IFPC to be disabled without stomping on each other.

Extracted out of gen8 GPU state capture series[1], as other than fixing
a missing IFPC disable in debugfs state capture path, it is unrelated.

[1] https://patchwork.freedesktop.org/series/176505/

v4:
- Don't clear GMU_STATUS_OOB_PERF_SET in suspend path.  Restore it in
  hw_init()
- Don't require gpu->lock in a6xx_gmu_ifpc_update(), but instead warn
  if needs_hw_init
- Move perfcntr resume to after hw_init()
- Link to v3: https://lore.kernel.org/all/20261103184713.29664-1-robin.clark@oss.qualcomm.com

v3:
- Rework IFPC disable harder to play nicer with hw_init().  If we
  need_hw_init, simply update gmu->status mask and let hw_init()
  restore the OOB request in a sequence that won't anger the fw.
- Link to v2: https://lore.kernel.org/all/20261102190010.720443-1-robin.clark@oss.qualcomm.com/

v2:
- Fix double acquire of gmu->lock
- Fix missing a8xx hw_init() path
- Link to v1: https://lore.kernel.org/all/20261101174631.23637-1-robin.clark@oss.qualcomm.com/

Rob Clark (6):
  drm/msm: Hold runpm ref in set_sysprof()
  drm/msm: Resume perfcntrs after hw_init
  drm/msm: Rework IFPC disable
  drm/msm: Add cleanup help for disabling IFPC
  drm/msm/debugfs: Use cleanup.h for gpu state dump
  drm/msm: Inhibit IFPC for state snapshot

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 28 ++++++++-----------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 11 ++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |  2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c      |  5 ++--
 drivers/gpu/drm/msm/adreno/adreno_device.c |  5 +---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  1 -
 drivers/gpu/drm/msm/msm_debugfs.c          | 32 +++++++++-------------
 drivers/gpu/drm/msm/msm_gpu.c              |  5 +++-
 drivers/gpu/drm/msm/msm_gpu.h              | 30 +++++++++++++++++---
 drivers/gpu/drm/msm/msm_perfcntr.c         |  7 +----
 drivers/gpu/drm/msm/msm_submitqueue.c      | 19 +++++++++----
 11 files changed, 78 insertions(+), 67 deletions(-)

-- 
2.56.0

