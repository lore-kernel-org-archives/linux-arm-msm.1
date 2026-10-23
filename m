Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769507;
	b=Soc/IeyR79MakghN0WY8yWSjuVGCYKXAKM05CJHjCIDOvYbJl9F2Zyx6EXNyiDW4Ohde
	 M1uKvcLe190oIdM5jD8oIWffxoqZ8/AhyjCDjE/xa2e03OF9xSggIElwD38vrim/elF8T
	 zeTu/3WuCl+G18lx18doIgvp7MR3XY7NpoKwSc3aqqa3KyQjiZzy5YH9JyfkCTcIqTOoO
	 L2ZDmJgu/vdvhqWpMkSgymY0qAYson2LtYIducsejrEFtpyNmDWuNSLgW0jtvYLUmShJ8
	 /IVvFyPNdjF23vj8DkFeCjb2aTU4HLKDnMcMxcU5SmXn1nwtmxdLd/3QAWNf4XmAfUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769507;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+fZhaZ82V4/5KLW1sTiPxhoM8r1KKvfY9E07z+Fr920=;
	b=mtTOJB8RSYv4zCwhlUuS0IeMbLBejvGUFpLFxvpg6NcTrXctLL36Iw9W67fCZt3hmdab
	 JVTcC+mX9JYKOXj5Oa/b3IjjrW65lOWFpX0KTOJbAyDTx1URUq3y+4wWUk2Wt9JwFogfj
	 FR7mevEe6VICk9VTi79Gue+E+GPC0vglVk71DWfbbkSqburl5BYjS74N4pkCJWNtrXp2r
	 xlYvwqutAECNnyVYI4DScFjD/kgcy17fdbHMXZkeVQZbV9VKxzYHHaKcfeLRf0ZnT4Lr0
	 hYl5s1kv0yAFtAQDQMx1ydczvnOfzyOXvdRd2X3SXu8XIGZrh/HuWAfKn8tC8Izw0ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NJmdDXGU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OwQtMtHO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA02606A323
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EA02606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NJmdDXGU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OwQtMtHO
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE65U71954963
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+fZhaZ82V4/5KLW1sTiPxhoM8r1KKvfY9E07z+Fr920=; b=NJmdDXGU1uF7+X7w
	p5s7n4a7iG1Hyzi2ScuTHJ+cV+5G4GeL2MwD8OXZBy9U/oH6ojG875a6BaBcZHWQ
	bVOtoYvRssu18j7K5wTJHueY7UFaq1oqG6tE4h2sO5qC5voyUK1wrpMyBqcQfPCB
	lSqXpVleNBGoFoj4YzHGhv7qdEyameXjinxDaC+jEdQoUQ4j1Sg/k98wh3Vg1asF
	IvOjeUx/P28jtnSDOuCIfCT6VWfrGLLdlOkWScsXytrY7i6XrpPG4otity7/bgyp
	RXU/cVqZ8928d+V06KLFSN/A/NTQ85ZhiYAmftbNfi1H9JDpB8kMnE2HC1l+rMVA
	Z6Ptxg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbmbu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:31:46 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf08dc2fc8so276738137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769506; x=1793374306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+fZhaZ82V4/5KLW1sTiPxhoM8r1KKvfY9E07z+Fr920=;
        b=OwQtMtHO0rh1v5lhv9Dec7Vrv1LphN2Y0lKpuDKo+knf3UWQjEvfG1zzoD/kc9ji8P
         ilQiskux2KZIWGlpNhNrqamDxjAP4NklcXLhMcR4uEAupA6xPT5tdp3kM9tVGOsPxaMa
         yCE5xkAWFyRtcXV6n2l7a/oqpQSiTBe1n2BWo+UJicWiUJhUlVpSHKT5vCe9scd/hFST
         LiSpNCwD8UwjUk+PbPycw0mtvIXUXnUnyThoh9fjc2rV762UjJnQnuMVh7tB/sH1g61r
         lb78zrp7IuxBNE4ZRqrCD9mon7LygDznA0ntmJ4xVr9uUlu7xDwd5fFeOjDalyeae7pG
         /9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769506; x=1793374306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fZhaZ82V4/5KLW1sTiPxhoM8r1KKvfY9E07z+Fr920=;
        b=U+iZC3OB//CisSgFszBK6oPW4DLdXF/eXHnXf4dxEAUuxKMzRznekDtV19TDv91wWh
         eesyfOflgJArnReH8SzCAGz6pFSgXrSLnJ1wKFgG+JgxrhOmeYfFuCyePzUoU+EoStpA
         TR7AeSi75kJvwfEysvPLLnsM/DvnZvCm+hWJLIqdy8qngnSwlu8POcKi6I3j032DHURM
         5KXKwNbCRmKQg7i6BRJ1ATy7UHCvc734r3Hq/QEG09qKGiM+SYm5YwMhT5bLqQFOpm4X
         6ZiWz5wvFZm65QkJ5enLPvJzkWui1B1FKJKNo0KOMfNSGhGCyh1z6M+Hoc7FfASXa8cV
         HBfA==
X-Gm-Message-State: AFq9FYKRfB/mC4/DYtVEUDTnXiDJETp49Vk7bMEjH1z+3LsnDUZ1RIC0
	fBd8h/wJeBYExVJ9n/HrzWA16FKlIYS0uVCYqFteVWJOTudXB6OrUVnPcbhQnRmlxXBJPEwzwjh
	Kal9C+P0Oe+S7xmXh7L28k+9/d8c3dZzoLYEAAGxCSIoeZTl70PBOfGv4dz96T2U4Od4h
X-Gm-Gg: AYBFou0Ck6QM6VmLxcjkEVgYEw/PKeEPa68eGF6DPlpUfgJ7YSJJxpCTYNEmIj+7awt
	iZQfnoz6PlZegxBCwKNArSmeq5FYLeslL89nOq1K54bv1hBehtM/RYBA0VkkIC3oeaRONOmZr6W
	nUUTOegVU9IWI/Rn/rwWhIOvVsgPfPyeQdGlD6fdTXfW8UvLe53h2O2RzSpRhofN5K3jQGkqPVJ
	Nb6jo7LMSan2T3tGycv0dxTcMruoxvtoU+9mVwGVGdgkZgewlF8Imluxmbttz+JPADi1vw8ql7T
	j3wVjBECGrSQG7ZjUl6J1U45AIuTuMaAs0iPw/kRzs2s3L69B/BsQk+ihtsmOGpKz4hiL2kTd1D
	zidKqmFahhGdIh6k4lm6Y5InO820B2NtctHO0XsJGhJpsNNCaHLJbi0HS70SgnPQun+fDcyAoCP
	a2YhL1IIQ7PIpv
X-Received: by 2002:a05:6102:3e8f:b0:7c1:b55d:373c with SMTP id ada2fe7eead31-7ccc343d2cfmr938152137.31.1792769505558;
        Fri, 23 Oct 2026 08:31:45 -0700 (PDT)
X-Received: by 2002:a05:6102:3e8f:b0:7c1:b55d:373c with SMTP id ada2fe7eead31-7ccc343d2cfmr938102137.31.1792769504814;
        Fri, 23 Oct 2026 08:31:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb0288806sm478062e87.55.2026.10.23.08.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:31:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:31:16 +0300
Subject: [PATCH v2 01/14] drm/msm: fail the snapshot init when its worker
 cannot be created
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
Message-Id: <20261023-msm-kms-destroy-fixes-v2-1-83727c122de7@oss.qualcomm.com>
References: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
In-Reply-To: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1898;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WsQ21XZW4TA3F25Pv6HWJIhCOEkArUvMa6B6iciNKmk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq233POcq5+xBs5sKYiuZGBaLseVkHxghGTjRWs
 EJpo01elkGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatt9zwAKCRCLPIo+Aiko
 1bdqB/9+l6xgnzDWlFKLsrNBYSCr40rrF1HkzMr0fqS+ZB7qwxvu5mOAAVCB3RyJNGX6tcG8gqr
 99LFNtxZYSPUSdZDAhIj75zherArAa/KLO2QnbFdGZLa4XkCtFA8ZCmLEjgqQgcfT53TFK5oiFz
 P/xSvcDV/Ty6kTRPE17EbNi7Yobftdny9pl8h1Q1IoIuFekMFg0d0ipnlK6e70neOzxVqUVVjz4
 pXDWcPTm/zh0IPBzXt0Dmb3R8gd7dF0azl/JkKiKo/rG/lWf9wZbr1XuZvbpVj5a/tIXbtvPSnQ
 oA9n3ISr4MzKprzDAhy0JkZSsNpaB4oZ/uShBNC2V/CTdu4S
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXwNyh+pJ5e3jn
 DnPx3yH9ctHH+KsElTVYcdqAN2Rensif71K3UntCmwFeCy5EDTnRL2bVFYRabiHaFCjAoT/l3Z8
 aJd5Gsr3rEL2u5vjJr9s0qtTY/jPuB0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX7NwKgwB3xH57
 vabSjdFoXswJjUso2Qe2ioO/D+TWCxXiNwboq1D/9EJHDOvfjoVm0yPsaEKaWjUQXqUSI4+z8dc
 zFzGn4yydfmj1BvMR6x9CPHAWjqRumVGY+FggtdJX4p+1ftbtxPawFo/jyZuTQ399PDjazpXVuG
 GHCRmlG0EvXREMy6J+Co+D6tsTYx9P2wKvxVhOu29oO6HzFTiDd6JOe721iV/KWLwD7V7TBC3B0
 N/7YSauLdvkhQbQBtVo5W2twl5lSBDf7mdhRfiNa3pO1/aVbhLwLKyIC/ShfVKcyTgw9nmclYHE
 TEtEnpfoXXK20ocwEI5W5nNLUeJBJDpkEdQPq1izZ0cU3OaR5nUy6faL2q+r0wc6bQJ2Rn4M0ka
 VlOZZgCOK9MPQ5DMXPfc2uBwcYWgKeeUMU00fDWY5r2BFZsvW05uv3hrZMoVTr2nnRDGLqYseJk
 GKm0v/QbhdCyqT9wrKA==
X-Proofpoint-ORIG-GUID: KBPbdwqzapoR1mN4hxFQQ9UbeDGESyYZ
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb7de2 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=D-zmcGmn4BrKCB6hg70A:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: KBPbdwqzapoR1mN4hxFQQ9UbeDGESyYZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

msm_disp_snapshot_init() only logs a failure of kthread_run_worker() and
returns success, leaving the error pointer in kms->dump_worker.  Both of
its users then dereference it: msm_disp_snapshot_state() queues the dump
work on it on the first display error, and msm_disp_snapshot_destroy()
only checks the pointer for NULL before passing it to
kthread_destroy_worker().

Clear the pointer and return the error instead, so that the KMS init
fails rather than leaving a snapshot facility which crashes when used.

Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
index d99771684728..d1b10656e41a 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
@@ -98,6 +98,7 @@ int msm_disp_snapshot_init(struct drm_device *drm_dev)
 {
 	struct msm_drm_private *priv;
 	struct msm_kms *kms;
+	int ret;
 
 	if (!drm_dev) {
 		DRM_ERROR("invalid params\n");
@@ -110,12 +111,21 @@ int msm_disp_snapshot_init(struct drm_device *drm_dev)
 	mutex_init(&kms->dump_mutex);
 
 	kms->dump_worker = kthread_run_worker(0, "%s", "disp_snapshot");
-	if (IS_ERR(kms->dump_worker))
+	if (IS_ERR(kms->dump_worker)) {
+		ret = PTR_ERR(kms->dump_worker);
 		DRM_ERROR("failed to create disp state task\n");
+		goto err_destroy_mutex;
+	}
 
 	kthread_init_work(&kms->dump_work, _msm_disp_snapshot_work);
 
 	return 0;
+
+err_destroy_mutex:
+	kms->dump_worker = NULL;
+	mutex_destroy(&kms->dump_mutex);
+
+	return ret;
 }
 
 void msm_disp_snapshot_destroy(struct drm_device *drm_dev)

-- 
2.47.3

