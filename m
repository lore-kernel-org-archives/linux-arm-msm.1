Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1915E1E1024
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 02:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790995145; cv=none; b=A/n1LCLyTHwgvnG/Ts1GbVD7B0MbtkVtqI1HdIb/AoU/E1slFNxsDQfk9E9pQBYgG3wOEv2nyN2g7oLFH/9rOcaj8IvXETSIjXmOAEUIhZHQOxqypzMnlP/DPNjjMPtMKBeplv+H7C358yGiVznhxflwSedgWuSYSE7JMesWUyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790995145; c=relaxed/simple;
	bh=h+OcKc12EogROb92wBDuQVA5l36/obfuRNhiHAD7+to=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nfMHBcFuI2VDg+Y/mB0StSkCLPjio9rf2ln4hVEe6v/mI2G/qtKGcnRfXcUEGT9WAKzaW8fsOtHUAS8I9Fh3JEcc+PdWMjhdsSrPLUtsJfMKq8E1/uen4Ok5g4CtLoBqSsBvQFup64s5LBh9Jp6jPEN/pREPxVxaePvfpUa1sUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D/PV9svv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fr2lhZcE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D/PV9svv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fr2lhZcE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Ne0NF2104559
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 02:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=V4R6vTFZHRxxof56ea7ZkuigJ6CJbKK/4sD
	1d+syM7Y=; b=D/PV9svvGzfEUxvJ296QVavCvtrmj6yxbxL9MZ231vs/OG1hd9k
	OvDPctZWYBhKI9hlsHD9stB76aMnOj8ZV2v27D/V2QaYG6FtGmaRyKO/mnrcC3Gn
	T6eLbJNASJv00rw0Sr5/6ANM1JU1fAscvV/bU3FwfsRv4QhmPRLihkc7Kjpk31k2
	HqCWlIyH0FPMhZi7PYORIZ05o9bwk+hF7A/FrB8GSTH+mlLIW2TdPkBl0sAOWgiR
	RqzyOfD90Ze2xVLGkslcqx9MEJh2VN29gEmoZ6VdGTV7J9D9uiqh9lW/rH5U+jkS
	f0F/LAxip+a4PdiAv+AMT73SJ0HeddRZ5WQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2dxdjkcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 02:39:03 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3282d5302ffso265667eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 19:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790995143; x=1791599943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V4R6vTFZHRxxof56ea7ZkuigJ6CJbKK/4sD1d+syM7Y=;
        b=fr2lhZcE3prig7r4RQ3tjHA53xQWt2b1loTKeDtI/NxT8dqeAVaRv3UjuXmJcMKRaP
         grMwBASKRp1eiBhOHkR6eNImuNAsmsaf6yq2RB/haQsGHVCVUcFpqMZrvFKeIeZ5LscS
         5kdoKqvF2g4Pwpg+nD1sj+LKHCjupSovX3Qd/TqyzoRG6HhixYJ3zzFha6ucJoblSqGM
         rO2gX1sUJLsp5Z1HqshVsxGa4NygcvldeVWZMRhRkxkLVTeKIxNI2HVslgZ9i5TZGjM3
         wOXF/GoIlyClNS/Jk0qqaHCgoBjJP+3FngjzWnKuwHfr/cNQR6T1c07jaktmqjqMQVuK
         2vrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790995143; x=1791599943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V4R6vTFZHRxxof56ea7ZkuigJ6CJbKK/4sD1d+syM7Y=;
        b=JJr+Zm3vTd1qo2bAxq5JBCApCb74MafiEcKcbTxEWZ3cdPglpRUH+clV4ukX5SKU31
         GJwVKeA58XAsOCX0ck0iYQ7yUI+x5OL/DtHt9VYOckTkxbRRSjEx+KUWhs1IgtXe/jBf
         16S/o3kK1Tm51OI6/rrOhs/C1ZS1yiUwtw0TAWnnOoqdwgAdZWywZ1pnrLvhl0xvcMJt
         U3iHj3jofilzUzqnxyhTwVthmbY5qEEF2zOPECj54NgefgG8oKpI7Y3YjZ1B21n9Asx3
         n9lzGi1UiF+Xs4H6gC/N7vTDMDBKOYE+pHZqAQu4VrPd13vMvGZmzfS0MgVMXISrpZ8F
         g1BQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRJMwUphTpRP//pwobpQnpBGeYDdxuvmaMKjGpC5ibkns822D43dbQvOTBSVs/pF75RtneXnsd5MZS2WXh@vger.kernel.org
X-Gm-Message-State: AFq9FYKP9n3EQXgqS27XwC5CNSre8oyUTnupLvW47QDdpVv6ih9qZXXn
	4axvDjNlr++QFt6Db9R+iaVg3fSDsrNgDPrYBPYG+fWoCNV4YxWA45eRK4dh7Dx/V7Kp9WWKI1e
	7OUPSobyKO2/i93dubekgEEPFBqMFLNl3NZqFNC+Gz0bTbZGthQnlLB4nyO6CHul3wXXgAD+1Bk
	aD
X-Gm-Gg: AYBFou1MoGELnXyhfexH5xnx2OYObPTbpB6hmWJBbrho3KsWJiI5HpRBzuPQ1jKhfR6
	J3rPT1jDzEOCVPJRb264ZK0MHOAH59/7S7nOLcE2717Xppu8Ri7Gx0i5Cj2iz2W/16/8n3VSfKm
	kOD/Jz/8gM+maVAlp4XdEq9NDjUiWvx3asmuKhPDqqnsQvQjsN7190fgZekp5EsC+zXvv2r0Oul
	0PzcnZIStU0RbKwCp3jm+ggd8ScLUP5dKAu8swrVvgX22cCy0ZvUhoZRGeR620/x67hLTmnoYFT
	PIgrps68eDDZPGnzhu8PlQNC8F0VzDX0JJ5V3Ezx2EtdwlaRZ2yoAd1PZBnEPp2heKWs61AddjT
	BUtjlqyNi0Ug1Ip4/zpSaAlVR/pZGpj4fsUFTfPZTPxAhTMlp71/ev7m5
X-Received: by 2002:a05:7301:46a6:b0:34d:7c41:cdf7 with SMTP id 5a478bee46e88-34f150db269mr4243387eec.6.1790995142363;
        Fri, 02 Oct 2026 19:39:02 -0700 (PDT)
X-Received: by 2002:a05:7301:46a6:b0:34d:7c41:cdf7 with SMTP id 5a478bee46e88-34f150db269mr4243359eec.6.1790995141678;
        Fri, 02 Oct 2026 19:39:01 -0700 (PDT)
Received: from carlv-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510752b575sm7665736eec.6.2026.10.02.19.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 19:39:01 -0700 (PDT)
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 0/6] accel/qaic: Use DRM Scheduler for submitting BO reqs
Date: Fri,  2 Oct 2026 19:38:12 -0700
Message-ID: <20261003023818.1161666-1-carl.vanderlip@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAxMCBTYWx0ZWRfX746bS38CUZOA
 Swnl7clO0g5eYNKo72+WWZBixnUQUoieZugxpSpG5i8GOTKqBhzkvnfBZ9sIrMD90Fnh8mfzsb/
 VsDTGzgX0lTdyTH1DyfZr8kTMiO83Fg=
X-Authority-Analysis: v=2.4 cv=Ko/YSmWN c=1 sm=1 tr=0 ts=6ac06ac7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=zmZmqXXhmGQ7dVXqUE4A:9
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: xCU9pV_uiQ0fsX8s5x3igSEV7AIoins0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAxMCBTYWx0ZWRfXxkp146e4NMR7
 fOStmyh3WyXLzmy2IL4ckU6lnqMpjunWvzACRBWntRjpbQK1KwYF6CaZyP+F2YKkX/yuO3B0/u4
 L5z1RM04Zb52+GobZVVkpNNGkwewkKtHlfNVX7Nn7yhlScRPbe7jpVbkuPS5Lk6h24nJCHLbf1/
 j/zh6euockLNMiM4/Mts1iE2AEU7ICem4+SUtAlXTynGv8Te53DuAm0nS9wYeQGChXsddEs0jJl
 SVMYLqAIUzSffFy+uwjlRMpKIGCrsxcN/nJbdl9Y4iqzNGJW6A8/qgZf1hYTBNbo912++TuJw/I
 2xX6hDeDT2niwkkxZVkPjapstPEu+bafFkfbLXHmK1jlVMG88SgT9muLRu3bU4vS34DqI4TPpzm
 dfLqvnwAM55TyHzhkzADkBeZJSWVsBXvAIGB/IZkc03x4wc1YDK2y4tUm/qOG9C76A/Fcu8g/TS
 5we5VOzFc6l3XueHEsQ==
X-Proofpoint-GUID: xCU9pV_uiQ0fsX8s5x3igSEV7AIoins0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030010

Hi,

This series converts QAIC_(PARTIAL_)EXECUTE_BO to use the DRM Scheduler.

The immediate user-visible change is that BOs can use DMA-BUF resv
objects to track their use. Completion fences are attached to the BOs
sent with an EXEC ioctl, allowing userspace to synchronize through
DMA-BUF polling/epoll rather than relying on WAIT_BO.

The scheduler's credit system is used to prevent oversubmission. This
removes the requirement that every request generated by a BO fit within
the device's FIFO at the time it is submitted. BOs with large request
lists, including those resulting from fragmented memory, are split into
multiple jobs and submitted as space becomes available.

Implementation Notes:

Each DBC has its own scheduler and one scheduler entity, rather than
creating a entity per execute command or BO. This is to keep as close to
the current submission ordering.

When splitting BOs into multiple jobs, a dependency fence is added to
each subsequent job. This prevents the final request, which contains the
relevant semaphore and doorbell commands, from being submitted before the
rest of the BO is sent.

Each job is assigned credits in proportion to the number of DBC request
entries it submits. Since the requested size of the submission buffer
is not known until DBC activation, and the DBCs are initialized during
driver initialization, each scheduler is created with a fixed 64K
credit. At DBC activation, a per-DBC scaling ratio is calculated from
the FIFO size. The ratio is rounted up when necessary, which can lead to
small amounts of the FIFO being unused.

The final patch uses this and the DRM Scheduler's credit limit to support
buffers smaller than those requested by the user (preventing failures
occuring due to limited DMA-coherent memory).

Each scheduler is given a WQ_PERCPU submission workqueue with one active
worker. The default ordered workqueue showed a throughput regression
when large (32+) numbers of devices submitted large (1K+) numbers of
jobs since the single workqueue provided could not dispatch fast enough.

Testing:
  - Ran checkpatch.pl
  - Built and performed functional testing against v7.3-rc3
  - Production use with kernels v6.8 through v7.0 with 96+ devices and
    16k+ in-flight jobs.

Target tree: drm-misc-next

Carl Vanderlip (6):
  accel/qaic: Centralize execution info
  accel/qaic: Replace transfer completion with dma-fence
  accel/qaic: Isolate hw submission
  accel/qaic: Use DRM_SCHED to handle FIFO submission
  accel/qaic: Split oversized BO requests into multiple jobs
  accel/qaic: Use reduced size allocation for FIFOs

 drivers/accel/qaic/Kconfig        |   1 +
 drivers/accel/qaic/Makefile       |   2 +
 drivers/accel/qaic/qaic.h         | 182 +++++++-
 drivers/accel/qaic/qaic_control.c |  36 +-
 drivers/accel/qaic/qaic_data.c    | 710 ++++++++++++++++--------------
 drivers/accel/qaic/qaic_debugfs.c |   4 +-
 drivers/accel/qaic/qaic_drv.c     |  16 +-
 drivers/accel/qaic/qaic_fence.c   | 173 ++++++++
 drivers/accel/qaic/qaic_sched.c   | 249 +++++++++++
 include/uapi/drm/qaic_accel.h     |   2 +-
 10 files changed, 1001 insertions(+), 374 deletions(-)
 create mode 100644 drivers/accel/qaic/qaic_fence.c
 create mode 100644 drivers/accel/qaic/qaic_sched.c


base-commit: 0915fb19e08f7f14a03df78c67d081bbfa8ff1fa
-- 
2.43.0

