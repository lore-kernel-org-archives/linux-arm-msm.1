Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190919;
	b=hRJNRPLQ/UpGkB0cg1DmtKXMlo2i+lKgiUv4kuKbi5QnL002/dt/nH/Vwi/LENbcCp3U
	 x7iAC4G06YKCB1snVn5WGTbNNQHXtVewStvf8f1i2JpugXgze8SuOFG+NgJFsnWHJqd/1
	 EkWY2KsA4rJhMEelFan6lZa9VQ/gCgivaZeXZmYsXhlLILhowMiVMdDONOk3G7NcFYhnX
	 3H5Gs07wdnfi5Mrb6lYH3EqH5JboWsB1WlCBIO+rKrWJTPZAJnoWNErct9YVEKKF8ERNN
	 p9e3+V4Ev2FbjZq0MBsoHGQTUUcEA9CubTSbz2pP56TyCcv6BN+cPXKGX92p2YFbRfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190919;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SaHudrnpE8XtpurMvbDQCfiS6gfRCYIhXZ/1ufgNTKQ=;
	b=eBhWIqMTdG4pnJcxr6n5ld7MnRUzEA3KVqKxJ/5O1n9naJExje0g8AMc4cmc2v66WLq6
	 VXFzlB0k9bPUnGoolqqVxXHjZKo3oKhYfRVc3ukahsW1NlCbGuKNPbh8I3AhyQEILZx0c
	 SNnR7p2VbUpuh1sssmS6Klq8f+qoKgJTds9+yVjTYOevoNZCVpAaNJ0tzmNWHg0Wi6hVa
	 WvVRmCQTyaxpKBOOU/4P5NZSno+/NWD8rmzj7JmkReJC0oUZIjjl+hIqns3v93Mgeq9n7
	 PdGOfmdLtXEIBNLIJ+0YPGj6rMX456NmluUkQ4KVZC44dONcc6AX+W3blD2quKVAliQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DifZ4nd7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EzdbG4Y6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0B9606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B0B9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DifZ4nd7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EzdbG4Y6
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdqCS137457
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SaHudrnpE8XtpurMvbDQCfiS6gfRCYIhXZ/
	1ufgNTKQ=; b=DifZ4nd7xLUYeDvzNICOmecl0hoCpcyKrkXvz81QYTBpJq+CoCX
	tad7BLQaFaRZoSuxiskGePCE3eUbHiYVZW0DuFSJxn24mekIbJVYkxT1lkflOh/x
	yVFKBpgwMERa1ygzX6TBNMMAEJ35E/46Q/Fcj5tpd54rVISmuw2MP3YAISVWelM4
	nSfr1ugJgmN8J4nIH3MFOjq/qFrmjLV/yXxcHb7RdL8KRkPkwMUpNkDY9nEqG/5z
	ELcJShxzF92aTRpfDwaZZPKRaLUnvwsUPuHQxMF6gzOQNAPS8VZICe8rNLVe5328
	dZjN5zAFVikO8sUBtgURmFfjlEmuHJcbX0Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f92dj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:35:18 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3662e7a9299so3820475eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190918; x=1793795718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SaHudrnpE8XtpurMvbDQCfiS6gfRCYIhXZ/1ufgNTKQ=;
        b=EzdbG4Y6u1xgczrXnhSBRTByv1qz9DS/xbrl9kBLndFvD5ZcfBX/Bxz8xjggrn1fMn
         VqdyzYns32YXO2R3CcmQvlR8IRKNaCkbxYMnUaz6tjjudKlO801tGXmqm7Awy+taPk0h
         yUPSkAy8Jok4RvaSpo7cpwPcgGSU2KJb1vp8rTwdetPe0jy8fFXd7DemtmVXsHFFJ4Vv
         tmtmWEGn+wKekkDUhiPFVro0CfpfuH+HJSt4+7t3brlausoGGtYM5CAZATru4c3nkmHG
         CBQqtY0TxmGidtmgBq5aeyWHIm+BQj1CkcafN8MJ7qSdqjjIBLFodlgv/9tGsXzwkFqM
         Kn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190918; x=1793795718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SaHudrnpE8XtpurMvbDQCfiS6gfRCYIhXZ/1ufgNTKQ=;
        b=YctPIrJNc3+KTL7z1egAwJLJmtEsHrilltgKGatVIwZ9vTp76vfdu/iwxV404t5Uah
         IiO6mgzQ3k/jlsKBIf96SMDec/w9RdNQ3w0GQzf9q/l8pEZ6a8LZA7RwilMT7NhA3rY1
         9tB1GwDkap8oRedNZV03ofkYWGa/gx1FFRkfsqBjOq+s9Q9+Ae6XOG/M2QYz+uBNVrmR
         /vSEgVsiXaJrL3qg5qOsKXCBsMKfXRJS3aWBetacMu48e5+syouqgqBH4mirslbo/Shg
         eDZlvrX3Ap9f6XZPFj9BJbKeYDGSHXt4a7S/iawL+tP4jVMdeyO8YEsYqHWl0QINDfl9
         ELng==
X-Forwarded-Encrypted: i=1; AKwUvBw56WT4eJ8c7/4TODINmKcMbDpxCx+8Xfg8Q8Wh9w2AKXGeoTAGW5ARVWBsSfLBtM7NLH44R9HLbWuKbYRu@vger.kernel.org
X-Gm-Message-State: AFq9FYLnv+jZ1UnR5qS3pyMzWezYDHSPunETFAGJPiSGCM0IF7S11C4E
	aCkJMwPKY93KwVTAsPVbedB2lLmRO+AQYzzH5RgPpV/cnnv+ghyM3ktIYIWQNu+Zyvp7W6kjBZ3
	Z5Me4g/rpLY2pgQb8KqbzvQoN2iVrNNOiYFN7G5z03FfNpTwbyuHdomX2oX3hHDiZtKrGFPnMqD
	Vfw34=
X-Gm-Gg: AYBFou3iqiRi2U4g0K24Sl6DZYgEE8q2+833gbPQXLgzGbDGJj4yba4xcJ+Ay5ADsqw
	btpk1dYTa2v4Y3tixwwz0+eSMgBbRAD/ibAzNlUYA50vaNKqrwjE2gIEGB4YwiOqz1iKKb1Ygz1
	fIk1qLzpAxDPcFAswTkeuC4XmTWZM2SCeSWScWOsSnoN8H7dTHIXPun9XuxPCptGC0AqcbEikwI
	TDJx6C88cXdJ6aVvROk3kdosRllCFUcVQZUl+Fz/rHupnUxJs779EbQ8y0HNnps4rYxHr12gUFd
	Awo+LXsWsW/lU6ek+DKGwaDrf/YcgwCpecpA4hK6pFsqOJ3jxH+qaBjDh/eJDRF68zsg09n5nsJ
	UgA1VaAh1X6B/vgVuApvOdWRDpB4CBq0fGIX6Tg2mVjk0sNP6Uk2urEQFJtjB2PHCrxi1rSwY5Z
	+IkMKxBpBqRVFE/HsCZlhd7M/IJ6g+TnFo
X-Received: by 2002:a05:7300:c391:b0:36a:1709:458 with SMTP id 5a478bee46e88-36a20419d8dmr3825888eec.27.1793190917542;
        Wed, 28 Oct 2026 05:35:17 -0700 (PDT)
X-Received: by 2002:a05:7300:c391:b0:36a:1709:458 with SMTP id 5a478bee46e88-36a20419d8dmr3825853eec.27.1793190916977;
        Wed, 28 Oct 2026 05:35:16 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm10015881eec.23.2026.10.28.05.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:35:16 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 0/4] gpio: shared-proxy: Fix line accounting
Date: Wed, 28 Oct 2026 20:34:44 +0800
Message-ID: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae1ec06 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=m3B8FXdnuE4ZOOmS3hUA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfXzhjHEtAWb89x
 AlQwrvjEsUL7J25LRn/BbRrQa7foQETJhwZ8hPM+/RtPaKHB4Qoc2T8afj58LkNr+jb9/k4m01O
 O+y4yUqPyGshZNQhAShSJG2iQz5w+Ro=
X-Proofpoint-GUID: 0OU1_pn1wmga5_gq6Nj3gQVD1qD3i2Qw
X-Proofpoint-ORIG-GUID: 0OU1_pn1wmga5_gq6Nj3gQVD1qD3i2Qw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX5DqK1TJX21xB
 eeCSNCkosG5qVcdIO0i1WzIOHqjfGbD3DIDMhXGsvv3Da6/AA5/joN6KBLUB7zrvaVOdtrFuP4d
 GqMaKCv5IKXpgBD7KukcNSWJ+2zsYN9YhoFtgmcgpyAT0vxxLZgaqFJZBo14vJK2QAfbgXrG0W7
 H6DSue6Esq1fxVmgKNet8vyeaMK5R/OEyeHt7eJacNXueB5H4oG9YN2I1RYhFFsJ2h6a1EY/zSl
 vg8Hu2LUhrna27e7VzpJSLk9b1WQQznRfehGYZAqLDTU1JMNlxCy+9mMPrQ65RWCy0jHPp7Svbu
 mx7o3UNGUnEC30mCx27v4Uymf6o0/ujl/WIu4JSLppWNaDGB08509hC5xxdLu3rDhaA0fYSmyJz
 R0Ld7VW51KY91hVtuZUrVkE+Br94cQlodi2hvmRZ1AmkJGhPeERXN2+bcE7V8C+8VMOOHaE4DE7
 WaEtA0QIeezy/RE3XPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280050

Four fixes for how the shared GPIO proxy accounts for users and
votes.

Patch 1 fixes a race between consumers that request a shared line
concurrently. Each of them sees usecnt > 1, assumes another user has
already configured the line, and fails with -EPERM. On Nord RRD this
intermittently leaves both DAC supply regulators without their enable
GPIO.

Patch 2 fixes a stale vote left behind when a proxy releases the line
and restoring the default value fails. The line stays at the
non-default value for the remaining users, and votecnt can underflow
when the line is requested again.

Patch 3 fixes gpiod_set_value() to the default value doing nothing on
a line that was requested with GPIOD_ASIS and left at the opposite
value, e.g. by the bootloader.

Patch 4 drops a proxy's vote when it switches the line to input, so
releasing the line no longer fails trying to write the default value
to an input

Changes in v5:
- Drop Assisted-by: LLM trailer
- Patch 1: Add lockdep_assert_held() to gpio_shared_proxy_may_init() and
  gpio_shared_proxy_mark_configured()
- Patch 3: Explain in the commit message why the default value is
  written for all lines and not only GPIOD_ASIS ones
- Link to v4: https://lore.kernel.org/all/20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com/

Changes in v4:
- Patch 4: New. Clear the vote when reinitializing the line as input.
  It predates patch 1 (Sashiko)
- Link to v3: https://lore.kernel.org/all/20261017024335.1432020-1-shengchao.guo@oss.qualcomm.com/

Changes in v3:
- Patch 3: New. Drive the default value to the hardware when no votes
  are outstanding. It predates patch 1 (Sashiko)
- Link to v2: https://lore.kernel.org/all/20261016144919.1362846-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
- Patch 1: Also use gpio_shared_proxy_may_init() instead of
  usecnt > 1 in set_config, so concurrent first users no longer skip
  the hardware config or log a spurious conflict (Sashiko)
- Patch 2: New. Fix the votecnt underflow on a failed write in free.
  It predates patch 1 (Sashiko)
- Link to v1: https://lore.kernel.org/all/20261015122740.971792-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (4):
  gpio: shared-proxy: Fix race between concurrent first users
  gpio: shared-proxy: Drop the vote of a released proxy on write failure
  gpio: shared-proxy: Drive the default value when no votes are cast
  gpio: shared-proxy: Drop the vote when switching to input

 drivers/gpio/gpio-shared-proxy.c | 98 ++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib-shared.h    |  1 +
 2 files changed, 87 insertions(+), 12 deletions(-)

-- 
2.43.0

