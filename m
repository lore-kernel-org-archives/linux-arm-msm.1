Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E614746C0
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398118; cv=none; b=OLtT6esGWq6Geu0cTDhdwK0didmQR1JFC4ASxUaFGHntaF/RljThxHmCAC/J9a7aQKlPphS1wzr3BL2HCAJ+PeiogmzVLfvHnzTUNCle+2wjrMqcfSsEdKt55bAzadII5e1PhSUKliG5w3LXpRU/TQk2qfqXKxsNggzCU2I9aD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398118; c=relaxed/simple;
	bh=JKak+JaKk3S3w4T0/p9bAcJj4HFqUapZ2lWaUp3Wlqs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nk2tyYZJvA0YxsQy5r9LSQRMGvB0AI1A+2syWIq5B1GoaxAUBbsEK/ezUGUh0RUv84BVdlt2ILWXOVwXMp55AGNlYpDeThUNZEIvVqSliqReyRsHsPSSDn6e6Z1360ftlzdvX3UX3Ng2QZ9ibGQt1PUg8U/k0zz/AAR3UdiJ9HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A7EQUVmN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZtlUGqA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A7EQUVmN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JZtlUGqA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Usr1514397
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=w3I7ZHwa2TWLK0R1xsdo5aKYS9oayr/enWu
	2u1S/sog=; b=A7EQUVmNUSQvO7c9kHhQ32lTJyM+OhrsNh9fuDz8vWDQSfbQL9F
	WYkAZLJ8ezjtoROOdRJjI3PSM8yZzaD/YyvGZkzY6zdBAFRTbbryCFDlEzAy6mtE
	plSU5XQ+r8THL7ls8+yD+sJXVZLH2tqX5oqR0/FwSCIBX7y9bBo/MX0IPVj1SyCu
	fyrHopAk01RNQqiYWQH/rxxj3JrX1sdXMQrGI5fLoC3BbMVn95t/7vNFEUNhldV4
	nirmBVS8PtzKXoJ1g0bTEqTPVdgDqSIKPHiCLX+ZHMobDr7BLfn3POqT+Ca3JHZQ
	UOkrIxjO18qkMkns/A3mdz0eIrUxX0dqz6w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0b46h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:01:55 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-790376c9f8cso809370137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398114; x=1790002914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w3I7ZHwa2TWLK0R1xsdo5aKYS9oayr/enWu2u1S/sog=;
        b=JZtlUGqA8Ld21hXxc66EZ8wFH5UeSfEudAOrD4fSw0qIKUHCG75ykbeYnLGmqYkk0E
         ILxPmb2AyM+qN/od7d/GTBH58UiQr/pGKX4c1acwGOTdV9f7nQwf+ywFvTg2nYGxaZr9
         T+W1WGauybDYkE5yCTPLR7npr9i0C4HBvnnIexppiEqBXubsh69gNCqivOjIP7v0JwQV
         9SHVs9kkkjoiCzooaqlrZAsSotzmbxU5x+k4Sprc9bTLsLZz1/piI5X98nP27jbl1q7Q
         ktGSFYdF011XA1w4aQxT4NCuKneczGhAAlJhjrmgas4fgaoAc3fQ7HDaD9oSpS0BanFD
         hUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398114; x=1790002914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w3I7ZHwa2TWLK0R1xsdo5aKYS9oayr/enWu2u1S/sog=;
        b=B1NF4cTAPprEuI2wlilE4zWp2FCJdtgjErsMbHBkfJDT7ZRWsXG54Gucnpm2TKPCwp
         Y0HhVAaDzD5RTdVgVlWaKdIulAocEDuIwV44zagXJDrRoW8bzkuyd+1LTOBLRcJEoyn2
         vLOcLTzNRJeXjyzW7LDJTMpjyBp0IMDVPQMlmPaLaWJ4JY1DTW/+U0QlEnqMzT5RNyUH
         DgufOtNvjJmhlJGd9/IZApJxEmztUmTsj+t/mVt9BIBum4nAdxUm034q+weGNWGiB09i
         5sIqFrMCfZX8fNPXvs9EBJN0ZtdWR+kKSSvx//3FtLFtM2YpdLKzUWqAQvPpZ3G/0Lzj
         ViEw==
X-Forwarded-Encrypted: i=1; AKwUvBynJ0pt1Mq/LwrlQ5Aa7FGTYXlx4ybGv9qZDVvkblai/M8KEa5ZmtfvZgebwb4m+NwCccLR/h6PiUtLdtE7@vger.kernel.org
X-Gm-Message-State: AFuF++lFM+wjUs/jjp3UIlvA0luEaXVfN2ds6qXch6kpU/U5tkUkhjFF
	iYoAf+PW3XVmalm1xbHaw+O8hOL1GdZOaOH9je6rMKS2amDfWXbMgPaUmlLAKu+szSCZsi6EnU0
	nbq2FYLwrikWJ6l6W42O6GO48a1UTN+OTFzAev/3tyhiUrI9x7/oS9Q3Ow6HL+P0xKfvO
X-Gm-Gg: AYBFou0/Cn8sc/CstYoweizxQ3RNIal56r2g66sw4yocSLlpflLe4wBpeVLRvXreE8h
	J31mQt945nGwdS2+h95ZCZsAkoLsbqBH1ANL86RVAbhKD0fTZulHlnboamz1xmIdjv8tJcRKTWF
	q559nmbV6hJcEoCIMIork23DVE5RyrNmFngfpuOIgqcau8pzYrnMIic3D0T5rzASY9x9qR5kHdk
	Sq+QqEvQaYoaUDivwuM5hrYVoMiJ2WCpgtXQix2kaY31Wyd40aALkQ1gmsfnrN+eKbVS6zCxNVV
	6HxL5ESJZJ0s/D4P/LNnWZWZtRzuTTMUN1DEq89ED9R3B2NoQl/iJ4u/WgfZSG5TCcu3GjzNroN
	ocDiKqWJIvAc5+3c2hrxvWHwLKqK+SNc1LWRmXEuEnucoGIj560wDHIeRGQ==
X-Received: by 2002:a05:6102:149c:b0:791:8f69:b802 with SMTP id ada2fe7eead31-79b5992c78dmr2828419137.7.1789398114068;
        Mon, 14 Sep 2026 08:01:54 -0700 (PDT)
X-Received: by 2002:a05:6102:149c:b0:791:8f69:b802 with SMTP id ada2fe7eead31-79b5992c78dmr2828234137.7.1789398113208;
        Mon, 14 Sep 2026 08:01:53 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608480esm468632666b.36.2026.09.14.08.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:01:52 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Dhruva Gole <goledhruva@gmail.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>
Subject: [PATCH v4 0/5] pmdomain/cpuidle-psci: Fix behaviours for CPU PM domains
Date: Mon, 14 Sep 2026 17:01:36 +0200
Message-ID: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX6CUnrAX3u/q1
 vGcwP5qR1zVaRykX9rySDcFJRWww1okivh7SsPRnAENYL6Ey/JyK2JdeyIw6jAb4PkcNZv5e+3v
 XK7Y3r+Rci+rbzyq43IZfMuGBxRIo7Q=
X-Proofpoint-GUID: PFrcrwhK2TU-incEDXmyGMZCYda-t7pr
X-Proofpoint-ORIG-GUID: PFrcrwhK2TU-incEDXmyGMZCYda-t7pr
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa80c63 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=yh3ps83G6N8KMOvRL6AA:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX7Xm1WCweUBLO
 UzTKx78zPvtXBzFwCYJQeF4c+48fC2jCX3HirfOmxeGIzWbFiCf6XCQHxDd6egZ0rfR3aHOhWgL
 nt8fDawd1ZK2fwui4L+UYLTAwZNK6ManIAeA5Ed0ge3G+HjPtBqSOaYa1iW2K7k/vNAJGe2Atqk
 zXwxQGe5vegyOHcNxvsr+afCbvYqNPvNSg/jhlUiMFuvLuhuCYXngefqgTzy/fviCcAd6rO6HCs
 s9vWeYELNO1U+O3h03R+MYmOVD6I6a4TQFVM8BXiJJK0FAsbPadOf79w9+pKoqF38yL0YJ/w+vD
 utDXnW4p5K+nYDXCAnSDJO/YAbiEl/KK76jOZSkxuoYGHcMBRTp8HCmMcIDxI7Y+W4KnmoPpm9q
 x/aIXqoEdhpu9zerNPHivzPuapCTv4chUo699RW3pf01EEHhQkNLSYrLL5TAn3AS2SmkX96kyJw
 TC5zcx/YJHh3gz5IfQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140215

From: Ulf Hansson <ulfh@kernel.org>

This series fixes a couple of different, but highly related problems, when
dealing with CPU PM domains. More details are available in the commit messages
for each patch.

Note that, this series is a follow up to fix problems that have been pointed
out in a series [1] from Yuanfang Zhang (Qcom), to add support for new
components for the arm coresight subsystem.

Changes in v4:
	- Updates to patch2 and patch4.
	- Added tested/reviewed-by tags.

Changes in v3:
	- Minor updates to patch1 and patch2.
	- Added tested/reviewed-by tags.

Changes in v2:
	- Dropped the RFC.
	- See updates in the changelog for each patch.

Kind regards
Uffe

[1]
[PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc support
https://lore.kernel.org/all/20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com/#r

Ulf Hansson (5):
  pmdomain: core: Rename genpd_status_on()
  pmdomain: core: Allow a non-CPU device in a CPU PM domain to do power
    on
  pmdomain: core: Add a genpd config to support unknown initial status
  cpuidle: psci: Initialize the PM domains in powered off state for OSI
  cpuidle: psci: Move initialization a bit earlier in the boot sequence

 drivers/cpuidle/cpuidle-psci-domain.c |   7 +-
 drivers/cpuidle/cpuidle-psci.c        |   2 +-
 drivers/pmdomain/core.c               | 112 +++++++++++++++++++++-----
 include/linux/pm_domain.h             |   9 +++
 4 files changed, 106 insertions(+), 24 deletions(-)

-- 
2.43.0

