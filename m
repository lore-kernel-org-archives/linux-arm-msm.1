Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568231;
	b=EXOVpCq1odCiVqVhP4OcEL0/xgufhPJ3p8ksAJ9Few6gMlpaG1xTtEZpZ7lZk6yfP4MJ
	 cPg91hfpx4fKOgFJO850peQMi90azMsZGlJMzx9HUzVRv0v4mk8ZsysKBP1FBGUhu6k7O
	 rkw0k1VIpnt16HOiHVScx6SxWJvn+9cbVm3Y7U4AwqkxrM1L5N1hfSO73TSribUv5mlo6
	 F/7jjBvAg/pgcfpvwLKrkKUwT55uC/Aectp/vWF8s0N9sYrDmcNFzdSPdHXPBKdOeC3iM
	 ppoYbd27kLHz79KO6N8QGjAO5FFZk4EtyLHaOCJRK7ROFG95kRM2QcGpmdictHjDAlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568231;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JIfSGlO/jG3IouXioNzaM4+ZE05BwBZCaWel7qB4uN8=;
	b=EUpZo32KWPXNyXI+Zn76t9jKjAgsUD0L3D18ulLbWRzDofX3zEPlewYHkVKqbPRbdgoJ
	 JPomOBuSiSAKDxR2rqJO1+X8eJD20dsXUHLrnsPJZ51q1Ri0NWbY4K+hh5b/NHCynMI46
	 tb9ja78ZQFOgxyjLa+9fkk+W2gYHb4ChCBx06V4qka+A4op3sE3AROPAFa2/xZqZd2SiF
	 0H3p2wYUgS/cjNSabmB4TOHf/42yZhc2JDqhnnUm3mtOEi74h8gCXyGIvVaZNBLnzJCKJ
	 soT5aGifnSlX0FHRkcrNqEqCMMBeopWUI4FV6x2XrhZqRs0XSQIWPw6zCG3dd6lzyWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eSPmCIGv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BH4mUFxn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55686606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55686606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eSPmCIGv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BH4mUFxn
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jCEe3711978
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JIfSGlO/jG3IouXioNzaM4+ZE05BwBZCaWe
	l7qB4uN8=; b=eSPmCIGv9OEppJdMHqrGPqiV8wCu9d187Eh/9VFPGW89rbPKFuk
	SgZ32OKgGqxFjqLpqcd/gXgqj8bi7EY7wNS407fhgrEJmrq1ZIrP2ZFBuHlnEuDD
	Feeaee3Y3yHhZtfhF3SNQKmmwVSaxvtlILvctvkT7j359xQqCHXKtR6BWWY7VFwY
	HdvH5MtcdwyxvFNbXP9j85wD0qRCJ0UXoixFgVhWeKrGDqTwLmksrvPJk5V3gfJi
	EVzyn+MWx1gUDBKghaj3ba98TVwapUp+xdHNLRbNYmVzGXjDnGxCCdDwCvb7muwC
	B87UgaDDYtUDncI7nxBRGfbIgf1n88fmDMA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v2mfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-366c279b454so889835eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 00:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568229; x=1793173029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JIfSGlO/jG3IouXioNzaM4+ZE05BwBZCaWel7qB4uN8=;
        b=BH4mUFxn0ULmvuyBws4GKxkoKPIQaDyFYZ2+v24z02ShETiOLe15Vb1qIa1V+hXC7m
         JP2SK3eAPhS4MbRUgZtBPgEn/olph9YZcFsioETCtVk54ITPXJOjn8s7hNsjqS117wSa
         feFv6qzdj1ZLKB0INiU0M5Os7/z8EPaTG60NQ2rpJU9CPMVVNcLf6WTTG27DAdLvD6wc
         VVm/wZK7CGfihHO39pPF1DsI7BLTtse9vVBAWKnQ9P63Sl+hdyLeanbkuVXns3zl6Lfs
         xc1k3g+zsGMJSvij+zGnASWp21VnDf9TW2lCJHcAz5fLhco3h8Q0nlCSdD9eii0ujmbz
         ioEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568229; x=1793173029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIfSGlO/jG3IouXioNzaM4+ZE05BwBZCaWel7qB4uN8=;
        b=eA6JrVbcwhwPwtaFXOe2HVsm2mGIs84fzlEZUNLbFShc9n264mTTPs8am/5AN0liiu
         4JV/TEqMeatuo/3NF70WyfBeAlyePLt0DyB8GhNbXV3tcmCkXdlfRrHVCdIpWB41k1Ar
         jL7pvh0Dt/szlgzksHjUc7DHQIIv3nhvQ2f3pahe5saMyWo33empt5A+KyZ9IgCusnFN
         zUFTLvxUrV0VFshBlHyiNPj3qIx9s3F3n5eprS23astIIm6cjkKyyQhm06vgpkWOe9rG
         TGJHDKbjS29uNFbHBE2lOYsCW1gR+q+Up5NpGL28avmHpSDwj6quDDkvWaztn5cnFgM+
         t6YQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnJ7R/9/DKAnfqFIn0n74y1SAiWA5hVSs+DQLdXgVCi0lLUr4HaLbqCYRDP7xM9ucp98U54YmpSDuRCW/L@vger.kernel.org
X-Gm-Message-State: AFq9FYKcmFgRf1aDjUR8cCKfnJ6Gw2VVy97uzLgJLb4d/9AP0NWp9ksj
	fC19qKr/DXy4VY0eZC/45oq1FkctF8QJT4bLkIEG6YJby9irB85gIokv3y4XVxL5AXSozCbeMPm
	KkZESv8yAtv8q8oiDBBP9Ae5N+kHySu3GPPlZC3ufgMcsH53iMjjkkwd7cq0DTZ/9yeLt
X-Gm-Gg: AYBFou1iavbyWrfERwdb18AxUZ6/cGyjOLBXFtzl8Aha69fMD70DQOPPCY8jXVoJqp6
	/m5790SmEk9B+/3nCp6tDaS1CEBmTr9T/aCR3Y7hsyh4v8JamJYJRR+aOS5IV3JaAPXYb2wfQzO
	ixFcsiN915U/n5M+nvdVSdnoPsm5KEFxjxqMaQ3M/b13+TcN6OvMMgpG4j9IRqPVGmWHUxDLI+9
	kryWAfdqvD/MpLokFxWip8VJPRP1dIQujPyzGH3/GikXzl82ynL28nlFAujGY1y1xOmpsLR0Itr
	QusPWLcqqaJE1VrtgeP8Oqg2t1tTjLS1hejfB2eVdyLdHSmuUCD2uuAvQvw/vGBp1yVFcpzgl07
	NkTweJAsHmY5N4qNVoohwCYMxhFnYEfElSCjgnV4Uupw9kbGdDUSdOM9HRqw=
X-Received: by 2002:a05:7022:7e84:b0:143:4450:e1e6 with SMTP id a92af1059eb24-190a7660d75mr1788375c88.35.1792568228887;
        Wed, 21 Oct 2026 00:37:08 -0700 (PDT)
X-Received: by 2002:a05:7022:7e84:b0:143:4450:e1e6 with SMTP id a92af1059eb24-190a7660d75mr1788331c88.35.1792568228241;
        Wed, 21 Oct 2026 00:37:08 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm4042471c88.14.2026.10.21.00.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:37:07 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 0/5] arm64: dts: qcom: Add audio support for Nord platform
Date: Wed, 21 Oct 2026 15:36:28 +0800
Message-ID: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfXyTvLps4ImNkJ
 emu/HII2S+vnhriXcw0zpin/0486GbU908M8xhvgOcecl1/oxP1wErV+nJrJvBVo+Kf2A/ijUZj
 4J3VE5/zdERDdyzhsIvZTIQn2uxKWF8=
X-Proofpoint-ORIG-GUID: 3O1sf2auhTLOSt2-AVhVFnojxtVC3Y_A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX8LmgGV4jySlQ
 7T4GCDd5c5Gm+mNFL0UUp2AhCpdWz5TRWtRB5Om6p/MBbsU1+6kYjXluKLP24wtsPQbg7spVOe9
 0DjU4fCv7SqiPFsCP2mk59exC9ClnU97O9mJ4fXt3TINrfY+Gt9/ubxBDwTUYWpJcedPkCYROVI
 cab6YrbPpixdUdFka4gqrytZfDL6jH3hSj0F8tRyiSJCcV2C3Sde22HoJPR1kroQzX9VKevqvjO
 TddWMmkETrUeS9QGdVSMQ/Wd1D6JifspVtSZpoeXPyhlau1gStI4t9vUf14VWIiQfB6SmBKDW0C
 uD7NnCuQ0qbmf3EeWZjFX3A2iUCvfC2Er0tF0E8FRhMsSlUvSul8I0sThoCgBWhe+Ht/Bpg4sB6
 /ho/sHdTkcS5zRuB5Lr1LkDaoMbXn6sjNnBlhBKBKERrflI7x+Imp8X8pI4bEFW9PEsPDBl4QKg
 KNES3r3y1Aj7v/TNfDw==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad86ba6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zx-u8faYscwgyrAVXPQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 3O1sf2auhTLOSt2-AVhVFnojxtVC3Y_A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030

This series enables audio playback and capture on the Nord RRD and
Nord Ride (nord-ride-embedded) boards.

Dependencies:
- [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
  https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
- Rebase on next-20261020 and drop Assisted-by: LLM
- Tag the series with RFC due to dependencies
- New patch for pd-mapper change (not a DTS one but targeting Bjorn
  as well)
- New patch for i2c18 pad drive strength change
- Support both playback and capture in TDM mode, 4/4 channels for
  playback/capture on RRD, 6/4 channels on Ride
- Use lowercase hex for iommus property in q6apmdai
- Control DAC_ENABLE and CLICK_POP_MUTE_N via regulator-fixed
  and simple-audio-amplifier
- Recreate RRD patch from scratch (mimic the new nord-ride-embedded)

Mohammad Rafi Shaik (3):
  soc: qcom: pd-mapper: Add support for Nord
  arm64: dts: qcom: nord: Add gpr node
  arm64: dts: qcom: nord-ride-embedded: Add sound support

Shawn Guo (2):
  arm64: dts: qcom: nord-embedded: Raise i2c18 pad drive strength
  arm64: dts: qcom: nord-rrd: Add sound support

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  32 +++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 166 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 153 ++++++++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi            |  40 +++++
 drivers/soc/qcom/qcom_pd_mapper.c             |  14 ++
 5 files changed, 404 insertions(+), 1 deletion(-)

-- 
2.43.0

