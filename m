Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFB83CF211
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792211798; cv=none; b=lYgmAuPu0uHXo4z2DlVwNzWXVLpcQo1ml1TJjs1nPM4LdjNdgY1+LpicDQw2Lr0Hu4r3eQyjWhW6yynvFUqgfRmx6KD/W+oaHrEjLcCqzmxTs0icRpsOnAICRp73VA0uF4slXLzXXYuzIYfRmlD16B/PQ1Ih2EABBHHsuUkhpyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792211798; c=relaxed/simple;
	bh=EB+f+bzbA+W8ljsrO0cYrdZuQZpcwBnFrxKD/OlTz2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XviKJfhjeLr2P/O08Ig0C+Ytrpa/GnLdkGZMTMbaOYM9Rt/inVBITjVuCmQ0iUAuXtzzqX1BrEyIqnoFC29Zvg4japgCoxf8GLkwzwBKjNFZoxQQcLfk0iYNxjYDMQ/wn9249m4fx2H5kY8i0Zc6Bn6vAelZgCIDJw0E4SrpBW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fl59f9+E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQOHy3IU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fl59f9+E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hQOHy3IU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30TvQ2625010
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8Me6tzAesx9L/FokqodY3RMpwxljqHGfBz7
	b97exWP8=; b=fl59f9+E1dsx/rFzzRN4tJ4G28pQLIUaBgWfDjY2Az4G07QCJd6
	eB8+ZhnhRn1bUTjLdKZ6O/Toe6bhE3IcqG7cNUtQGkfaIw+5ORjJQ7h3eyOLRExx
	UZHu2xClm+wLhdlbvktUAe20WOwzay0MKRTCV96kHLkxrWi1oRQaBI20fTN8A/nH
	iGCcp+ymOhUI//7DxeSK4NENEhkMayVL+WEqATba2xtePgJra1Ug1mmYElsxL0Qc
	YMMCViaJqaS/yFB5NRVWwU0gWlL8ZQWPYc6ggC0Ztjwv2aKqrPgtW8qGenniIeRr
	nv8aUFyDukYLOL3oVTjEeyc38dh4+SdldJQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjtcq0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:36:35 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso799497eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 21:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792211795; x=1792816595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Me6tzAesx9L/FokqodY3RMpwxljqHGfBz7b97exWP8=;
        b=hQOHy3IUL0AVxN+kUbJVrdOsyJY+RfH2DfnjAHlKaUI6zI478W3Sn6b1x8YMveTtCy
         L2E78XN9idK2b3/wQ2QpoZrQnZprLRoBxM/iyvi6JZ7UU5LMm8+ZReoUNZChgQVq27Xr
         Xt/oHaEBptKLIkQ7kH4uQ8RFvOxVNnAyYHCxEvSsM/Jv8P9yTM3JzgXaEJTp5mW6Voet
         aE9ZpnZqFaDSpb1/v+AHCiUrSbZSsEvVTccvy2hFLqnUUKL266ajDya5IT+ORe318HDS
         dOe9xyH0rd07KcHK5uio8pEKX28a0gSuvKUIR9/TlB81gA/4MFekR55sJ8qTdi4/c79f
         a1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792211795; x=1792816595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Me6tzAesx9L/FokqodY3RMpwxljqHGfBz7b97exWP8=;
        b=W3h+UtnCjdqx03zC32HfRtCo7dXnnB2zUTCkJlzpPCIHqw4sbvSaJdvUDRGY0sWpG5
         7KaPKNONbSHemPHTL38FS6uiVVhqonp4oFp9eDuW6WkUC4R3w3eVkq9ngYAUK/r7VqKZ
         3dFWqf58dcxzHK+aPmBWLrMPY/0x3t9Ygd/zNMfjrAYc1ySXrzBhsLPX0pgB03hKcsz+
         XH2p7JSNQ8St56gELyxHS9L2RPMOv/LUZ+2WIpUeFgMYILAa1wEA/AiMA+cmB9DbgeSp
         3W7xDrskiBT4X/8col/IJm6KIqAKet7I1e80LJBT18us3gx+VpqcXVHISmBrR2udjKnr
         xC+g==
X-Forwarded-Encrypted: i=1; AKwUvByT27OOGcAPfW8ofOLVvyrlQBQGAbbl+nowV5uM39erYmf6cFkM+0cieTn89LVirQthnaFk+MdX3CSB7iJM@vger.kernel.org
X-Gm-Message-State: AFq9FYJMza7A2eVjALU7Y6/j4p5f7d1LJmIoh37Q0ESmE0gdQYUIlsfZ
	N2ChWJ3b9gX2FKGfZnmE9NQA27fWSG01ELcaKQPesY/d+/QCOO66L8JQEXLbi5zqSgkVBeHjbXH
	GVnRCC2us7VHwuASmYhrZTu6GxfhYiAA9ffDQaQVhlME8LklOotsPNY1K8ygaWaNdO4JF
X-Gm-Gg: AYBFou15gMwjTMR6u6AYN6/3nOhkDAwUkEbZmh+l0iV9dbd8qzaJ6ylR2ydDCz1fuXF
	FN4JQHQitCdxhnJflrKAVgsa7bLDyUxMyq9onb9wzbJfEXAGkjsA4KuH/BBXR8RN1KmbPVZGaJA
	Ltmyk6VJyuBPUvExfQ0M/jIHH4+Ioy9/tpxIp3DIgmLo+c+iJ0rO1UB/L8CIW13z+xuV/yz0X31
	mmoqZyafhoenpa3GvzQSRLXugVgYFyIxIR/0V/f2UuoAdyVXeTnsIcAKVWZJ+9EBOm9vDOSfDq6
	fEtMx26I2q+0w1faIpUByg+rYwAQfABFmOaZs4qjLmQUPC1+E4p7wXlQHtipbrcxsbeth1510jh
	l4Xc04fq/QpV4oKYkzL19oB4626fr3kMpcny6unLEtvpYLUJYsF+8J5WJO6E=
X-Received: by 2002:a05:7022:fa08:b0:150:3c69:2adb with SMTP id a92af1059eb24-1850c40d9a1mr3238746c88.2.1792211795183;
        Fri, 16 Oct 2026 21:36:35 -0700 (PDT)
X-Received: by 2002:a05:7022:fa08:b0:150:3c69:2adb with SMTP id a92af1059eb24-1850c40d9a1mr3238650c88.2.1792211793468;
        Fri, 16 Oct 2026 21:36:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm9771425c88.5.2026.10.16.21.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:36:33 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 0/4] gpio: shared-proxy: Fix line accounting
Date: Sat, 17 Oct 2026 12:36:01 +0800
Message-ID: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxOCBTYWx0ZWRfX7HW81Tu8oET1
 V9Qy8/EiBUCtwojNJXNVhm0o0bxNruX6hjYTTBLzK++nxFvjjBAAgm1Mkw89sghkOGq45fgpVHt
 R0FPnEevDx3AnhsoPg00+2LLcFzE4BaCLLk5oH13lju2mJ0E7cwFbScPr0SrFBpq/lnPSFbZhAq
 akuqDs2EzWd/PiwAMhFIkzRFSD0olxR0J5NB8Aoi0T9m0ju6c6nAUsV2bPPp4DSyYbV9eo2ON4P
 jsZND60mh32PKecp3Kg7iKLG7wJTxFMT89tWaABKGu06WdjAOFOjiSHAjulI+S2hQfjNEqzF0MB
 nx9qJ0hgeTFfhnga7X1t3tS4TwHROTNoDhu82xqsJKxXf8/bpT3s+jS968TxgziLTM7MKXQVmvN
 L7BzYUiUfEl4me45RQ8N53K+dOPv+ZOKdyaZOs/EIY8ZJeAOKcv/vkK0MipkY1XqiHLQGtlnonc
 a1PyaHWMtPEIeD59HAA==
X-Proofpoint-ORIG-GUID: tFweCuOS2-e0WpHRKeWcvM_uoH4Fh0h-
X-Proofpoint-GUID: tFweCuOS2-e0WpHRKeWcvM_uoH4Fh0h-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxOCBTYWx0ZWRfX44+cSq81wQGW
 oRJnWwzG9lQ2mvNvsRfWsBPikBNs7eruikqKfRp1n2wWlirEk0pHEhT6AQN/7jrdZmxKzSy7DIr
 JpypzdcBHTuhXZVMHFbFtlkAtUqL9/s=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad2fb53 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=m3B8FXdnuE4ZOOmS3hUA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170018

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

 drivers/gpio/gpio-shared-proxy.c | 94 ++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib-shared.h    |  1 +
 2 files changed, 83 insertions(+), 12 deletions(-)

-- 
2.43.0

