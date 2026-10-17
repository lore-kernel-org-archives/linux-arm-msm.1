Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED90E379EE4
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 02:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792205028; cv=none; b=bDd6hGMSHwGkuLhI4shMwZDLcWRFjeMEUO9uA/vJcg+qiRyDhmpYHqoPzE4Vbwv+qfOUDMyC5UEJ4y1AJCSQjLtwXWoA5eMbEsCZXcSeZ78Vuev4tdLh5AiHSmRObCCR7ePPUDjosOsV9CpSSFc+Aam1NTwBUw6abpxxyeMUDu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792205028; c=relaxed/simple;
	bh=TKeWP2gZ4ypXDdjxEZDA+RfB8dA7543LL3hNL9UwqaY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nTsj2pS6RtJ3LoHBlaXk6WCkTKVD2fQLa+k7A4Mtxrl7BugEi8nD+Ddq5GL5z0Ztf5Lte0Caqmrgwnvl+89MWk3qX4KMeTzYyOE1SY0IUZf6wSHXOPLh1ZOywfxfefnnPwBE5+Rn2iBk4PMRSo8eKwjCitjdC74o6BZ/9CfmLwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BaRx16ue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+tDqD+f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BaRx16ue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+tDqD+f"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H2Y28j3726369
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 02:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XNyBkeAKJ6ZXLDk5POYG/oemSkJr/PLVPfe
	VM1HcCDg=; b=BaRx16ueiba/Pe1aG3hn7gXuvZ5SPiV7JPNsbAudENzaFQCkdvF
	issFFq4S7ZASAMJImvoIB9CssvLDRF/m4wLs/24ygeA+w65MqIMM0Xai7Fud/qJP
	7WP8H0fkr72csFQ1eozMMdhDP69+suSnqr3gSiOeY+G3muvgSyTo3N2RO2guZxAZ
	HZyvwuDk91v3zbFZublKht+5xuhC50E12ZmmAgeuUXRbuLuTR3A/e3GxiVb8yJQO
	tSvPcNdNLqwMXF9USGqN2Awt5Y8fAcWXCb777wzqSmyqGc9tzIpHC5/2yxtrwiaS
	T1UgpjcR0Iy/AyKWx8TcXTGDHgiD6d7GJaw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0bgg0j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 02:43:45 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3592749a017so514907eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 19:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792205025; x=1792809825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XNyBkeAKJ6ZXLDk5POYG/oemSkJr/PLVPfeVM1HcCDg=;
        b=W+tDqD+fg4LIIKua3PZZJTKIT51RLi8VL1JE1/kPP8TqTVMQeyTnDup8Yx/IzJ2mjn
         KSkUcSuIqmX9Vc7kEleIY+BkFdNwHgtKvFtnduDuO0Hb7nAPLhnhldD2zRjWJzeTsTDF
         e/HukZMDXnzpI8H76KzqAf721UfpWt7QeWKlEEy0hC/mE3IUo2JnOPBQ5EEPREv5UkxC
         +qPOyBL0BlOfa3odC3LBk10J6RM5gzKpyFTZRmLwB1sL6NzbCyAgTOjn2uAh5Y6yV7kS
         7c4Md9yJec/xeIf2aLj1MQy/mwY4NuF0vBzwa8i0zFWGCy/1jXrQt1L6Pjqd1RD+0Gth
         2waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792205025; x=1792809825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNyBkeAKJ6ZXLDk5POYG/oemSkJr/PLVPfeVM1HcCDg=;
        b=imZcap2XJl9ZFdsLE31DqWEnta4NU9H8wOEIyVMLoeJvZeUdFW74Q5izb4TRprBfe8
         J1ODgW1TR9TVDxag0oex87ut7uWk/tmSiKMV4qzItc6UH7+bCYzIyj6sf6OxA4PynhgF
         uCcU1LjWdyrrtg86qe9Yolj57PE/+WWhEUOBWh1TaP+o3K5hAwO6tx/scOXY5lBHcoCF
         TLebN0rdzPi6WXvQnxHmIlgU/1VVuQG49KsSLZIs2EDvjgWKCYov3+/vLocb++TZ63ur
         L/+RkM7MdQhlefhcO/iYWkXJJz6W53C41GYRsOIWu8ocu98oyuBCzY2wTXpRrHa4Iq3C
         1YrA==
X-Forwarded-Encrypted: i=1; AKwUvByqjhrkfLcgf61rERqhR4jnulGhKN1Jc2/hnwuPmvcMuBDv9vm33rsB1v5cRGPIsRG9/v2QN5UfeD9toWeN@vger.kernel.org
X-Gm-Message-State: AFq9FYL3uRmm588+xdfSGwujoZvthua2gQnSqEKC+pSiDP7oAQfFnZyr
	f7TqMKi+7oc0Lp8X0Vb6w7PBaVUB9itJa/a65ysgUCowKF7GORqnbVoTEGM/g9AUqTUApKsSptF
	s40zXu9QxIyYRl5+khjnpEwKnJX9ccXZebVAaLEMCYuWd4qez2o30xGg64iR8RVzMoVko
X-Gm-Gg: AYBFou1h4ZxzZl42XYrBfgvenabOkL/f6l1+UKKOID4eQ20UGO6Ax8sZAYeyjzxsJ0f
	pK6L4A1y4NTULaXQX6rVL8gbOyQG+kXdKq+ti73SRlSDU621OXzgb+LaUHcHs19XN8AaW7KrmBe
	s8dZAdUFTzuqLs5a1w7//7RQrABtbF8n4GvvSfXlK+ZzbajZLvv/6OwlmtF/6kNeAPVe9C406Vm
	0QyKGEOh+ICJ6toSf9JL6cpVu7LsRNXYSHRRVe7UWRSD7u4Imyo8etudTGjFVhkLWUZNDEqoNE2
	QlO5SwQTl2syGa/kuP/XVZsJ3si043Bc3SCN6gX9KYqERrkNPkX8+u1lU9WC38pDzzp6ByDNv+Z
	NitpOS3MyGIrdRphGyF4R8GKktXuysTbypt1eZP/krzpW4zGSDeuSHJP/VP4=
X-Received: by 2002:a05:7301:2710:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-361a2053227mr2243474eec.7.1792205024586;
        Fri, 16 Oct 2026 19:43:44 -0700 (PDT)
X-Received: by 2002:a05:7301:2710:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-361a2053227mr2243446eec.7.1792205024034;
        Fri, 16 Oct 2026 19:43:44 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm13066829eec.3.2026.10.16.19.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 19:43:43 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 0/3] gpio: shared-proxy: Fix line accounting
Date: Sat, 17 Oct 2026 10:43:32 +0800
Message-ID: <20261017024335.1432020-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAwOSBTYWx0ZWRfX7WhDl6NvRecZ
 kLHTkQqMor0D7ZkEpnLyR5IRROzIMh/0DIpFZZPevH01T5ckcGCh1hSJQ/8e8srNbBhIT03QkMr
 4blKYSpVKGxFzkt6xaGWY/pluwfhCrk=
X-Authority-Analysis: v=2.4 cv=FayiV5+6 c=1 sm=1 tr=0 ts=6ad2e0e1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wt_9iJvwzTYOAWNau1kA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAwOSBTYWx0ZWRfXwXoRaMTdDrkT
 EUap/ErQHDpfITQk9PD1Kze6yHWYDM4HuY4gRI9e2Rw9C0K50G5xChRjaQTGxOYzW+JpyzbNtcE
 YD1y3MQ3plSyZ7tTMCKvMajkiWDmUNd0+SSDQoyyFwTQ4SDTpw2gBrs+HQRGuoLE3Qt62/0wkKH
 w4Qn4zW6lzBJ5fmVkwjgFhGnWLEoNNhTtR8alBuFQQS9NNqKnnJVlLGtS45tLWdg3nmsQUwenI/
 3k3BIW4kyPs8SLVQT9esy9r6zUpswjwGr7BqUuxCe9M8jgSfwOCYqSduZK1xJ2Md/w8I0SFLgop
 8osmUwu1R+l66lgNdBX0Y7Mtz02qd5NnqL4xR2/cohPWP8Y60q8N4Dek7RrjEPzoaD1UE9P7NeZ
 uyJ3JV8rl4pZRReRlqyHWAbkmGARkI54lcdOdVlsoAH8ZihcH59QoZ6aneFYTD9OdStcmpWw38O
 OU2erRDO9uhiCbwsRQA==
X-Proofpoint-ORIG-GUID: Y1UUwpAwKcIPSPAs0IzyCrRURSgiWotv
X-Proofpoint-GUID: Y1UUwpAwKcIPSPAs0IzyCrRURSgiWotv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170009

Three fixes for how the shared GPIO proxy accounts for users and
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

Shawn Guo (3):
  gpio: shared-proxy: Fix race between concurrent first users
  gpio: shared-proxy: Drop the vote of a released proxy on write failure
  gpio: shared-proxy: Drive the default value when no votes are cast

 drivers/gpio/gpio-shared-proxy.c | 91 +++++++++++++++++++++++++++-----
 drivers/gpio/gpiolib-shared.h    |  1 +
 2 files changed, 80 insertions(+), 12 deletions(-)

-- 
2.43.0

