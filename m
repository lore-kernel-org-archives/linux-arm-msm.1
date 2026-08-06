Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985A9384243
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 04:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785991361; cv=none; b=NhSmCh75n+Vp//gjqqsEIf3xUEl1ePAv9k5qU/rOPEPdFpOAfTw7DDlwJ+NU0hWeQm4xJNq82JJU68+iwcPn3bn7sGJKwxEO7s6fuyHJV2QqO+cJNQK4/cdyL3zo8WXB6mQm1QmuaMpaUdEOQxqyjoSnWj7CNZpeBMqobhv/VyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785991361; c=relaxed/simple;
	bh=y60PM7shWIfnAog1HGtuhVVErq+xQPRXd3bT2mw3YH4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GmO9phxw07UdBukVkOj5Ot6eTHOj/akALUyOhg5pismiC56XgL+31EdbadZ81t8102KHuV3MkEPgG7dtD030NEJSej5uSc7k7yw25BAEPt99WfoCf0IbpbPKF6Eh9ICjy0ibmuaUFp3IL3Q5OQF4IfWXrVJ4Mhd41VpwIYqPbnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aE+SgHKc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TpjBPZZh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aE+SgHKc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TpjBPZZh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763wrUW482384
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 04:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OxkpP+B3KTOEth7pSc13tmMtbh/LvC35eqY
	3CGywja4=; b=aE+SgHKcjayy+xh1htUtdjVX0X39Q4ff4on7gVs96TtMyu7wUCG
	K4JsQOGasZuG/Hj85UlgaGk4U2NA8uT3HaBb5TqsCBjC6PaVmsDM1ZpmzprgNjIi
	xPuRUK7ZdZCCmoSI/A01RP90iw70xHFKuHu8Pc65aeOa4IGrbFhuc2uAWDPWIKbA
	cM4hXMIc0/EingqWo5g77tXhd2eLh1/BxPOPsneDE+ZeB5wHUIVbScbcHWsanKMk
	JtLb4RocNKKXzzNKfFLjON81kXSEi3IPwVvtsbzio9BzgWKSba0VOGWvi0agTTXU
	L6IFwhN6GNKVfG+MfhipIV8woIdHCzDPf7A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjueg456-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 04:42:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso2208893a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 21:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785991359; x=1786596159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OxkpP+B3KTOEth7pSc13tmMtbh/LvC35eqY3CGywja4=;
        b=TpjBPZZh+yvGSKsItJkypcfzI7qFg48Rqtv9roCl6UeS/MmU59AUFk+ugwJCA0n5Ml
         Xq17NBgoZpx22M3ZGsuxNpIKaynt6x0MZZCunxSabUvxwgo9ZLSuIYQ3m0nw5rOTasEE
         01wSA58cK4NuDVF89ZEDMp/Q1zP2uHcCmV059qV7KCyITMIfAq/WzcAq7Z8k/ZxeWaPg
         1sWbeTVR9UgnI4N4qIzqOAjlLBT2rnrjVLCmSFoML6+vjBy9s1MdEWymiwLzirh//PzK
         OjxIHC9Cu6Jf6GMn4nbAYLXhz+KVt+ErYZAY/7yFkkm+OnI64ebygduoau0euEiJgmTo
         QdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785991359; x=1786596159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OxkpP+B3KTOEth7pSc13tmMtbh/LvC35eqY3CGywja4=;
        b=OpAR/GctsFe9Mr8H1td3oxTtV8faHgCaGg9CkLrpO9+3pR1dWbputIz1KNEmg4t6ZV
         oih0yoVllEMCh2EZcnC007g7OzD5jIjXVjM6/6eP7ZSFhobmajow34i8v5Ab8W6AjL9t
         mT9QIrRdwqJwr2kjEhR0+l0RXbdas1QBvepXGFs0Le/iEKE2e/7aPAgEU6YU/CB9dsdv
         2MNndARIIh/KfuUA/sp89uQ0/lWV7BuoOG2OwGrStLFntr0Cg685LFt0ktTyXtdnyNUg
         1zN07TGUFvccmJ8V6UU0HaMBDghBKMdpuTuUWWJXf9QQjnnpkfdFHPp1z+AnZaASsnu1
         5fVA==
X-Forwarded-Encrypted: i=1; AHgh+RrKANzu54Fk6qO47BPBJ2L2tkx7qCSFLZnVoWDNzRCzWh6w/cTq9MCtajui1H4DihDBvwc/1oE4MIbIu4e+@vger.kernel.org
X-Gm-Message-State: AOJu0YwD/MKTGrfT3XWQUvwc/31OuIJ+RdPX3hAm3n1xZchBUGpMd6j4
	uubb0FsMfWJtBnPo6EUKB2EobbPb34DaiUXCvWqaVCvVK+hcmiNA02AXXs3r9HkqRdChgpkdU9k
	o8352e/yM0N1woT8A9Mh+kG9J1OCiFRQw6YLEVCNBP1Ck2MnLmH21h9cU+pPjE1H6uElyawPPiT
	iN
X-Gm-Gg: AR+sD11ju0QR7PN7CuuLWtzhQQ+x3BhA85hJzZWZPXz3l4DoPZiKB5pn4DwT5kXJhLr
	P4H+7wwcIbSgCVmIITBpJR5x9+UM7p3FWn73bNliG3F5KIVVvCT5Jk6DkijM0I8/zmSD7Dkz0jd
	uZxj92fHIIzckBJkxRnu+gm7g9gT8lExWa7BZ3RfjUzVwGjYN5teMj8YoYdHUkD1kWqjgVedwrw
	PPw44COvDO6WuKHy/dDk9HnhIKUufvwcqOX7YswXt7jA4rHAs6x8+RCddq7uwuVG8GPgH3wyXb6
	eW4Uam1sKW0uzLsTFMIxhY9CSXtwDLnhBf5lvADNEqBwdmvAjI3Da7F5U1r1/NH0dYxVG6FTiP1
	ldq26yxdoz9RSgy/XXqKkfZZEp8531NFtIChT3ih6z2JRyYnyqY1Vt/anzM2DbYchqfBJVcXK/t
	EEU1bEJvL9eqIcteE=
X-Received: by 2002:a17:90b:1c84:b0:38f:1e1a:515e with SMTP id 98e67ed59e1d1-3903c5b1688mr11080976a91.14.1785991359090;
        Wed, 05 Aug 2026 21:42:39 -0700 (PDT)
X-Received: by 2002:a17:90b:1c84:b0:38f:1e1a:515e with SMTP id 98e67ed59e1d1-3903c5b1688mr11080946a91.14.1785991358663;
        Wed, 05 Aug 2026 21:42:38 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586402e53sm32643473eec.11.2026.08.05.21.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 21:42:38 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: rafael@kernel.org, viresh.kumar@linaro.org, mingo@redhat.com,
        peterz@infradead.org, linux-arm-msm@vger.kernel.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com
Cc: linux-kernel@vger.kernel.org, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
        linux-pm@vger.kernel.org
Subject: [PATCH 0/2] sched/cpufreq: Fix schedutil's boost frequency handling
Date: Thu,  6 Aug 2026 10:12:28 +0530
Message-Id: <20260806044230.909961-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a7410bf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=u79KipZrAc_WApTfGJkA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ko-OekmOJchiLOMaMhnEKh6cEaslI7Ub
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDAzMiBTYWx0ZWRfXyaNG5/vnp737
 nfQcsqevXdB3D+fk/Qa2tNUSm+UXky30ArJZXYHnYgPcpBJK35D3Fj4vw/shHl2iRiEA/baYbQG
 JRFkD5cwcn4pnY2ji4y7OeVMem+4M3r+AthFdCptEmz1HcXC2PpWaiuuNP1yZAeKy6oC6KPWlsZ
 D2h4M0Zpj8qmHqJMYAZV+j1HzKt8PLnLccOqraGV+MguLqN6Exce7+hO25p+NERtjRYtTJvQbIp
 AdL04exFO1jp+VSQxnWhJUUaj/g/5gOCjmcmjd/xEsXvFmLrm4Fx/JH/3Ca48q4CQ/XY72bfP5S
 PuN+NTP7bLRMdeavSZKv26Mm442bmoZ7YLAlstdagCfRnv+sAdT9UJgXx/Gqmoez+107Li8BodK
 Pc1EFafgY1AUj3H6yigYdr9IBUU8JYpMEY/a3AJihrebxvPOZkCzYHVBOixFEdZgsNd3jsY+VS4
 UtaQeyLGg2GHsRJGt3g==
X-Proofpoint-ORIG-GUID: ko-OekmOJchiLOMaMhnEKh6cEaslI7Ub
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDAzMiBTYWx0ZWRfX9j6FADTBKC7U
 dxsolYE1ifj3gihZ9jWlsy8slQgZ6a3uLt+Mj3Saxz/17mPmDGdfK0Yf47EZUsbwKev62dz/SMw
 DrAYL1X6ZMCIO5WuYkDqvNbQsiOHrs4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060032

capacity_freq_ref, exposed to schedutil via get_capacity_ref_freq(),
was introduced by commit 9942cb22ea45 ("sched/topology: Add a new
arch_scale_freq_ref() method") as a fixed anchor that does not move at
runtime. However, schedutil uses that same fixed anchor as the reference
plugged into map_util_freq() which saturates exactly at capacity_freq_ref.
As a result, a system with cpufreq boost enabled effectively never runs at
boost frequencies under schedutil-governed load.

This series fixes this by plugging in policy-max into the map_util_freq
equation and allowing cpuinfo max to fallback to a non-boost value when
disabled.

Drivers that rely on the current behaviour (upward bump only) may be
affected; We should handle such cases in the driver side without
breaking core behaviour.

Logs:

# cd /sys/devices/system/cpu/cpufreq/
# ls
boost  policy0  policy12  policy6
# cat boost
0
# cat policy6/scaling_max_freq
4454400
# echo 1 > boost
# cat policy6/scaling_max_freq
4723200
# echo 0 > boost
# cat policy6/scaling_max_freq
4723200

# echo 1 > boost
# cat policy6/stats/time_in_state
355200 36958
4454400 650
4588800 0
4723200 0
#

Logs: With this series

# cd /sys/devices/system/cpu/cpufreq/
# ls
boost  policy0  policy12  policy6
# cat boost
0
# cat policy6/scaling_max_freq
4454400
# echo 1 > boost
# cat policy6/scaling_max_freq
4723200
# echo 0 > policy6/boost
# cat policy6/scaling_max_freq
4454400

# cat policy6/boost
0

# cat policy6/stats/time_in_state
355200 40147
4454400 79
4588800 0
4723200 0

# echo 1 > policy6/boost

# cat policy6/stats/time_in_state
355200 44834
4454400 93
4588800 25
4723200 569

Ananthu C V (1):
  cpufreq: allow cpuinfo max to decrease when boost is disabled

Sibi Sankar (1):
  sched/cpufreq: Update schedutil's DVFS request to reach the boost
    frequencies

 drivers/cpufreq/freq_table.c     |  7 +------
 kernel/sched/cpufreq_schedutil.c | 13 ++++++++++---
 2 files changed, 11 insertions(+), 9 deletions(-)


base-commit: 0f6da28aab51b16762ed82e8fdeaa5042da45b08
-- 
2.34.1

