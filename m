Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319900;
	b=Ikjy3ZDO+2TqMbB+b7kbns20+944RdXM+uekMvHkH9+CHSGQBo4udTvkJ9XvsCYiouXd
	 MDdpdbkx0UoITEIwiyTUByNPp3ubAoPpp92rnTXvjWkFlJDM4uyI92iMnkwGoqGB6GEM+
	 fr9LLRXdFt51C1T27442w2nqJ/zIw9ms8GyvuAIFyG5RmVX+4bgFE9m1APqb39VhpGdKF
	 jUc5dvYxRtoEKWudp3jCyR2dCsAhzfSIngunLPDmMBycSoHj7uVXH9bSpDZJT2h2UNzK5
	 Rv09JSQEYPFsrbKHQ1Il/LhZmS32OJtR/D167iE9JPmU3+laEklWJp+deGbWetjL03A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lTHRqypbrm/tFdpsjozktQBusecaZUlVHszYpXh8lYk=;
	b=pWZBAW7TvSRFG44HaTzlaMt0W1Wj8+CR7M4VHxaKLQ9wfVfDpjCoe+6jQ+D6xgL2qbhI
	 pfKb7XZJpHVF8bussbSFY22k8EZ8M6NGf6gbdA8wf7BqA/8JMZZegYARueA4AKyUxB2Ay
	 5X2Qccbye8WUvFVZJEPbf5OklmcYlcoSfZaiTRkrIbDlwOYi91o7eBPXx3+hlZEvBnCyb
	 onRYPjrPxUXDn6Qs8jlxNKe8gBBMpqCRSg8/rrjGIpS2+zqcTh/q0iY4HkS3F+vO1pl8g
	 ObQThdqlqT35kYpEnFoNLd+TEJD3Ul9nEKVLb2qrShOdmwC3GHTYUXpRrX3sCVCPJGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FKubfPa0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DCuSKQ5z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0D0606A332
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 14:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA0D0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FKubfPa0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DCuSKQ5z
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAArA2124846
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 14:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lTHRqypbrm/tFdpsjozktQ
	BusecaZUlVHszYpXh8lYk=; b=FKubfPa0MKUphGJzWNKnpaPwS7kahB8Zq2+ILV
	VK/zQRqO2NbC2HEmbuSwS/4+rQ+1Nmg9rMvGYRuPnXRvXG5AHc0HYi3vG8lQlF4u
	TXvYyHVvghql8YRHpibxo+N65VMenstOUl+zrl+etsYWZyzGTOksEuaOwCilcApT
	K2bf6go5+4KTFooOGB88UbdomSjfFeeSK/zOrnB/lbVtmfcDHtjAyERc3DfGgiHP
	veRerr1v9yUnU1mGKbkVH07HE0+8nXk9Y6dKRABa15dD1IjoaBct9IQ3nUYhiFNj
	f2iF2DF9ptr4HYI8P+LBKwd01+yBueSELZZvrrtQQyliuUUA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkkf7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 14:11:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36de26cb4b3so2737772eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 06:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794319897; x=1794924697; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lTHRqypbrm/tFdpsjozktQBusecaZUlVHszYpXh8lYk=;
        b=DCuSKQ5zGs1MkFpDCbxksYkicxFdFaR1La5z0928G6vBjb7osjBmgtBxFf08QP+97J
         /pNTZ7GzljUXBQ/nzWner4sPKub4nbbSp3g/FpeTkCz7rmBPtChcNzboISBy/CR5D2Z4
         2PI5UY3zc6u4PYBy3MrFexlDK/jK7/G/AnarKSVssL7PWDIcY1mH21toETzbkuAUmgkK
         rE5rXviMFX2I6IKwsh++u3g2jzBbrsfrZP7vHKcqZs4zqlyI34AZRLk2u2A5QlQL7Ks5
         IPun8zIh9j879FBXIMjOgLFEQR1BpFRIKUONd7764tpLDdh1KIC/Hs/Yh8xCu+zIYvub
         2/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319897; x=1794924697;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lTHRqypbrm/tFdpsjozktQBusecaZUlVHszYpXh8lYk=;
        b=Ec0ZstK4ZIKz2pJ6DPzFBovJ2yLYs0Gfmn+9UuvqiZf8gGiJ4tMZV0YSKTLJOXA83J
         In+3mCjJNa8hCWBT6peDwUbGtDE9/5RXT5q8fI67SwHnpdpPIF1AV7ZSHysrIUEUdHAE
         ZGpfbRw/dtrV92SL2O8ULXRzWPj6gogRVDWO9IpqyIPMiLTXpzdKwbAockajEh/+g+96
         JbS9gbflXrD4HUErHLt/GKq795MHrhwLfFafOLoVKfWAWKdjri4+TkZY4wYuKaZAjSLl
         mWuroYEitKvBmwOk9SkEqsZPhmGCtegARyArdwCWmoDQLjSZsTXGmAFHYiwtzB8jrlhZ
         H+nw==
X-Forwarded-Encrypted: i=1; AL+hErFmvuMVSxZYhWx2avi9xMdSnBWpMOXXqKkfugUZrVbweGwGjiDInk2gn200sGU1sQWUsK442cEQDe4mDY6Z@vger.kernel.org
X-Gm-Message-State: APuU4Z/eSiDzMPzG+i8Gr8yPPovqith0kdjOtuikR2kDe5BlNv3Nrkwf
	rPDEBWkj0AjWUcpnt3i8JQOgbnVqW+rQktPOmnCpIMHPmxJumD7/zrcQuQak06bBLDmBRL+ITDV
	pNrEt5dTagFfMinVHjp0AsAK2hKmNfrmweyhhMkAcCIkOcH7eMfuBnTqin4E73Iti0DOw
X-Gm-Gg: AYBFou3bm9QAVoKm1Ntqj2OVwN0XXUNWUMEB7jsghEiqCGee6C2anM5xKqbTtutjxRS
	sNuR0/ZZ3GDBLWPnhJat+OvkYjUFfeDrZE6Ku58cxf0KpSUGJA8oINDhN13AVViiWGGctsyWSXS
	sOpKsm+7nlZgSohgjqF6ACMOdzcKi0zWDuFy/onrgefdxHGKbvDQmiUWt35AiW3cfkDyy9rjeqm
	AqfbH/2Vh4HhmantI31hVKCYpks5ADr2YPlnRJO9cmkx8Jz5iXvLXGIq15s0u8rfRgQ6UG/P16S
	16+4Rrd1XFtlhWWKCH5ks4aK5rO+emF0B3Zg3e5KZIys9gXcOQjjY6OPmcbq6nFSDE1Gt8gm23n
	mQZTnVzuSNtrLR7K+Ql1ZsxJA9qoCUZk0bCbc87gXn8/wUaStYRP9ThG6b+21NMMk2zmGFNyx/y
	yHH4aqUgc=
X-Received: by 2002:a05:7300:da01:b0:351:29c8:643 with SMTP id 5a478bee46e88-3751f46823emr3330535eec.18.1794319896530;
        Tue, 10 Nov 2026 06:11:36 -0800 (PST)
X-Received: by 2002:a05:7300:da01:b0:351:29c8:643 with SMTP id 5a478bee46e88-3751f46823emr3330483eec.18.1794319895810;
        Tue, 10 Nov 2026 06:11:35 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm8059128eec.27.2026.11.10.06.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:11:35 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH v2 0/5] media: iris: Fix issues in the driver unbind path
Date: Tue, 10 Nov 2026 19:39:48 +0530
Message-Id: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKwl82oC/yXMUQqDMBCE4avIPnchprA0XkX6UM3YbpFYsiqCe
 Pem9vFjmH8nQ1YYNdVOGauaTqnAXyrqX4/0BGssJu+81K6+smY1LkscwUvqNEUe4ILcAkSCUDl
 +Mgbdzmh7/9uW7o1+/pXoOL6KhYKvdgAAAA==
X-Change-ID: 20261013-iris-handle-unbind-fe09689e6696
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org,
        sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794319890; l=2243;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=BHbZn2I9kD+85QtPHjzm5ApKiJ90gtvlI/wqKpdWelQ=;
 b=MfyFw0HT8WKTM/5L249dWjJYgLTlji7av6UUC4FQZIENoLGer1bam/LLUy4fle4zoHHBr/34x
 Yp/fOqARIuKCBP5Fkxl1ZOlw1NWJ4Z0NPdHRnAoqO41d2EErhNcRGUH
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: CbSq_CecenWmt9xPsrHkm33cczO4CX4a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfX4yUOsixhBr0M
 upMgAX32T8owVEO8zpto1W86tKo/J1AlrDg984rZc2u3pnx35XJN1kkLl7HkFcZpBnNT36w3/Zh
 poktStrlmj76wapIQiLMBO5J6NEppTM=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af32619 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6I88XT8292Qb7oD-W5sA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: CbSq_CecenWmt9xPsrHkm33cczO4CX4a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfX24SOHLlsyer1
 LaNcRf3lej4a/D6b8/OLXFoRYi7Vp8KnsoVwb8MRMn/nryIqvchg7e0DKy3locetPG41R2IJxyI
 91EgGsWtUKlRyobE5ESuF5uW5eycBQkHWllRG7oRzisTuEK0LIqT4biVR29/ATjFyGdwEwPpBiN
 FV77SYi2P4sldzzD2Xjx1DrEHckAKET2dvP8gVyjxtMpX8woU2YMmh4Pu6enKc98biVXtZxMSjw
 JAqi0DijxWSn1I6oe6s6j3OEfYhkqGc2qeyi6LEkR8f1zbAMuiCpTTI9NWMl/6MhuPEKUbkQxZq
 26dXqGCYzqPJ1nNvIxxLWp9sYsm/3dvKDuc8lfFznuzJlBsz9QjsjVrQNnlMTd43wHq1U/a35LF
 dWamMWY85C15VM+40nTimmrwBU+1XaF/DynzzUvyHkWk0JcOdchzEELlIVFH2YS1vjO9ZXc7pUi
 dSnCVhohqEt6Gj6WGtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100056

The driver unbind can be triggered through sysfs while a client has a
video session running. The devm resources are freed when the unbind
completes. That leads to use after free for the running sessions.

The core and its device are now kept allocated until the last file
descriptor is closed. New sessions are stopped as soon as the removal
starts. The interrupt is freed before the core, so the interrupt thread
cannot run on freed memory.

The system error work was only cancelled during the removal. An
interrupt could still arrive afterwards and queue the work again. The
work is now disabled.

The runtime PM usage count was dropped twice when a resume failed. This
happens for a command written after runtime PM is disabled. The count
underflowed. The reference is no longer dropped a second time.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v2:
- Updated the commit description of patch 3 (Bryan)
- Split the interrupt freeing into a separate patch (Bryan)
- Added a new patch to wake up clients blocked on open sessions at removal.
- Link to v1: https://lore.kernel.org/r/20261017-iris-handle-unbind-v1-0-7809148eb90f@oss.qualcomm.com

---
Vishnu Reddy (5):
      media: iris: Fix runtime PM reference imbalance on failed resume
      media: iris: Disable the system error work on removal
      media: iris: Fix use-after-free on unbind with open sessions
      media: iris: Wake up blocked clients when the driver is removed
      media: iris: Free the interrupt in iris_remove()

 drivers/media/platform/qcom/iris/iris_core.c      | 10 +++-
 drivers/media/platform/qcom/iris/iris_core.h      |  2 +
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 17 +++++-
 drivers/media/platform/qcom/iris/iris_instance.h  |  2 +
 drivers/media/platform/qcom/iris/iris_power.c     | 13 +++++
 drivers/media/platform/qcom/iris/iris_probe.c     | 64 +++++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_vidc.c      |  8 +++
 7 files changed, 103 insertions(+), 13 deletions(-)
---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261013-iris-handle-unbind-fe09689e6696

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

