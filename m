Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CC8370AC2
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162174; cv=none; b=cRAFTUZ/69CxLaV/JB/XPqQ9AXcY4k7jEKdR/WZYAB4rNtVCs9YoY3XZRp+VI0sF1H4GO6FMJoWPdMIyKeJmdXaIR7CTcR36xvSPeCAUx19QSEcv44qlNtHbl8rbKTnN396TFXZR3tSz3RU2cYQjgEOdHrdnhgTx1sS5m9ggWvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162174; c=relaxed/simple;
	bh=mt6FGyeK6jNbyz8QINMUDKHFZqEo2IFd7o4zHGRB+MU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rXhFcBglpGAcypuU7h+S1iSsKE4KkEma4fCOWac0DyeDcLRZjJ0LFvvV1oIE4yYeK+aSM/5HnB+1qR0AtS7IHSGBug/HliiFg4rZtNcgz3x+NSFwsGu6aBru9p2ARr0hGTOC0sn+6QpcNfuMOyJEU0B9FQyPx9lK/BwHCJDMy8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBnPaGm+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iU9Auhb7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBnPaGm+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iU9Auhb7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5jk71910993
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FunvRqBJexNhP4K0lBIttu/jyrOh3lBtwcx
	40Tj+jmU=; b=kBnPaGm+OpskkpHZN+gV/cEt1lamF0/R+H2DsKtc07jsMW8qBGa
	PKsRglq0VX2xT/2RlnBDcy3vRglHzoWCIF/xTXYpDR6gGm18t/RjVjaU/OG0+E/V
	fp1ftOpyEl6SgT5f98QMd/cLe04lkla30rG6mZs7Tizhwo4kmvZ9085Ac6odFhQ+
	HqmRGwIWnEXo8ukS9GcUyn7PRV0Zovi7D8+isLCHdkJbu/XZMagPEZ4S5sBQuOxh
	e3WO6OvJGEF68PU5UEsPjFurkBh+u7Bn3AyZmeY4mSmbfa5AIeYB3v8HsuD3yi6K
	GXxsDk+wgV2AQ9WrMqjz2N341AnWyQTur3Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbjmf8u55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:49:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso10405543eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 07:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792162171; x=1792766971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FunvRqBJexNhP4K0lBIttu/jyrOh3lBtwcx40Tj+jmU=;
        b=iU9Auhb7rcZtKYqPwuKZLLhjjJJV9CMWdHBrDe+HTdIgc9W4Z/9hU1vpt/uku0djVL
         njwvDNNpDJpjUVmwoRGDXQqWttShBh4kgpKrOZQJPbtaxXpHjlEPKAbfJbz3yEzmTpTh
         HCWPs7rUZmtWi1xSDsqISkAxneOUodj0EGsd9UzDbWerX/4pYm8PARceOZ0d6jDiNtPL
         NuJz46LcmOfje1ggvNddYWSU/4xydO1THvCweC42SL5huS+InIwEm1/6Jyyj3dNGIIub
         T+pHnc9SJqTAY1UAA4bKVU6inYP79c4zvLVskzyucPcR669N8lbU//wJ307FJyQSmUqS
         7m+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162171; x=1792766971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FunvRqBJexNhP4K0lBIttu/jyrOh3lBtwcx40Tj+jmU=;
        b=WxkMmCifRwYRvXgduF0sf3MFvRoIX4iF4jhjG2yUKXn3FkTAFKVfSRzDOcZRYIN0I1
         K35ZKOjYBCy47AUZ3qxC0+q26Ws7uU8ZHq7v6TrSSkv31mjIeqvcd9LJWaZTKq/7u5Cf
         5ciN6UAkkBWS0Oxk2SEuhgpihyGzuUCd1nQ3jdW6gu7K+aI4Xn7lgcs+2dWHVyKgrVO7
         TkWgNDwn0ZWtYJYrF6x01p6V0oLvmhSCYNIcTyzJpL4on4XUdKXLtonvmZkbtdmla6s4
         vC7q6x6uSTzU+hKb2vAB52cYLaZgzuNEHc6eEtMFD/8aE9OjireIM0oL/A9XQ3dAkd0p
         2FsA==
X-Forwarded-Encrypted: i=1; AKwUvBzPbH77IliqdwkEsHbMgCDy4bSflBrfnIkLL3LrAzEtmdjA3NKb1b4Xjq8MkwMBYWWCYZvfKWgSFE6jPZDK@vger.kernel.org
X-Gm-Message-State: AFq9FYKuOR8XWezx7sBovusbSaUrvoW2x61ct+hNgTWWr4eNVQ3L33d1
	EtH9GIuqnpPcOGrCH9KZ0K1xxlF2ge8xPY3b/y7A15En21mApVdx/5DVSW3yr5j9sk9Cp8kyocE
	+2w7hkUhnsO1EGHdMWeUASxSwDUTaJ82uIzXNe+MGKMyaKeYfgeolYUuXCBeaeEtyVG2P
X-Gm-Gg: AYBFou3hbmj78ydOLurch+4HqA00yWcRdGK7UXe4hqupIUjcm675IwtXmUY96hB2kOW
	U3WZDUczGJPValCwZV2Yun6qcLYAgPsm3BTL6rhsd7pKjRzNmf2R6CUzgVWdM0mXd0nDPki4bvl
	8StowhVVJiMw6es8teQ/bzkOQn+laEagxULie0dgArHOVX4QAJs0yHSODH8ImIhCZwirPAwp2ED
	UwNxTEmaK9X57V4BOSjsmzS2gZgWKpN3ocX5qupY/OrrOPZ07VkcfsdHreN4V54Vh6+c6hsz8td
	UMGs+TrAHJ7Yqc6HUAWooGU6MR7nPB4IlnF5Y/CH/jdo0pZf1FodB0HzKAc8RaJrUrMlpJRYnFh
	VhI2/s+qhxrycHWPXMzk3uzbFaFGcfYouHGfyrYcjc4nX/BI27vtgvqJruJc=
X-Received: by 2002:a05:7022:ea8b:b0:16c:6459:35b1 with SMTP id a92af1059eb24-1851310977dmr162350c88.28.1792162171265;
        Fri, 16 Oct 2026 07:49:31 -0700 (PDT)
X-Received: by 2002:a05:7022:ea8b:b0:16c:6459:35b1 with SMTP id a92af1059eb24-1851310977dmr162327c88.28.1792162170523;
        Fri, 16 Oct 2026 07:49:30 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm7765337c88.0.2026.10.16.07.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:49:30 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] gpio: shared-proxy: Fix line accounting
Date: Fri, 16 Oct 2026 22:49:17 +0800
Message-ID: <20261016144919.1362846-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oG0_J6qa4O-vKz0xz_cV0Ycc3vUUQFFY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfX89Lui2fTA31G
 L6kN+h7Mcca8C3ggRGbY6BAhLEyMYvddoUx6jvmX58O1jDCJlM06f5MuSzVVA98ml2rLnvnUU6i
 s7sSC4xjOCkrrcxBPVTO/I2IxweCnog=
X-Authority-Analysis: v=2.4 cv=SrAFe/O0 c=1 sm=1 tr=0 ts=6ad2397c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7bmC88ccGREFj9ZXeh8A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: oG0_J6qa4O-vKz0xz_cV0Ycc3vUUQFFY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfXzX110vlLSrJ4
 GyrdkTGvyQluchMcE9NRHbhgRlf5Ao7BPWllB6SGXsx+5KorgcswPXCLpoWN+j7tYy5xw+EI1/e
 TT04yhKnNrnT+Epbcr/Tv4zTmQCoGgM9i1GdFr+qBwce1KKiG9Jkz6/F8WJI55pNoZBzjZnAyf/
 ZpnNdfRDaUZYPE3E0nI0KWBVxFaRx4V/HxBfVgcej+JOfKOm3cFsHVjZomUayFt33ys/ME2BGoo
 1+yIe2mK+ctoPdAD3wleK1o4NdOdahjrhOmKKrP9/PIpmite7oaoSmmWOUxhcrf55I6MzbgnMex
 w4ztpEYB0TlnN7F6ctBNGhln7LkRCBhJ26CfHl+I1epSAzq1BWmqtgKN9tqV2p2QMZCUCYomLRq
 syBqZ49miUUqxQlC7GjS9b6lVEAeY9ShdE86Mo3naV/ICHwH3JzVcUgtc10aBQNtN3oV434/cS8
 4X6C33nOnnTIpItAsbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160058

Two fixes for the shared GPIO proxy's accounting of users and votes.

Patch 1 fixes a race between consumers that request a shared line
concurrently. Each of them sees usecnt > 1, assumes another user has
already configured the line, and fails with -EPERM. On Nord RRD this
intermittently leaves both DAC supply regulators without their enable
GPIO.

Patch 2 fixes a stale vote left behind when a proxy releases the line
and restoring the default value fails. The line stays at the
non-default value for the remaining users, and votecnt can underflow
when the line is requested again.

Changes in v2:
- Patch 1: Also use gpio_shared_proxy_may_init() instead of
  usecnt > 1 in set_config, so concurrent first users no longer skip
  the hardware config or log a spurious conflict (Sashiko)
- Patch 2: New. Fix the votecnt underflow on a failed write in free.
  It predates patch 1 (Sashiko)
- Link to v1: https://lore.kernel.org/all/20261015122740.971792-1-shengchao.guo@oss.qualcomm.com

Shawn Guo (2):
  gpio: shared-proxy: Fix race between concurrent first users
  gpio: shared-proxy: Drop the vote of a released proxy on write failure

 drivers/gpio/gpio-shared-proxy.c | 80 ++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib-shared.h    |  1 +
 2 files changed, 71 insertions(+), 10 deletions(-)

-- 
2.43.0

