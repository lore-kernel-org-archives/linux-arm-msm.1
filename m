Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758233B05BF
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 09:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278071; cv=none; b=SWRsa2wK+pE4HRE2DOQTHdHvYSTPzr19oS11yX4w+5obRPkkgxZ3tvJk6fzVnNgAw+teplbHq9QjFO2wPxxEoKzYwU5TFnrz2jJ2xiLczLDHmZEOSU+bX+1TTTgsh8dzHrz5GuhgSmOka+K1IpmTomHxA7NC94YWxNMJltjbV+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278071; c=relaxed/simple;
	bh=K7qcaGAtzPSjI543191e/RtZaNKrmszLgd2MWUKfiHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NMsNaH6kt/zaMWBi1QDP2ftV4rrixQDUkPZGvixamv+f7MHAaPcImd+huaEl9rrnlULva48OQu9dy3dvFt3Q/QSn7+VVd6pxXF9swTxXAvrfHq7BsuffA6m7rxH8gYvbpTz9UVM4YB+AsxOPbODBUv8LTiCafTaTxNZ8kUlPVv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RXLdauGE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gVJunhn3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RXLdauGE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gVJunhn3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966e4xs095547
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 09:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5X0XYv1j42J8veRG6G7BpqboqQUipyEf+4L1o8MCCgc=; b=RXLdauGE0w1DnNTs
	YUWuG7YKz1WclPsIb9Hsy3I+oKKixopFkw7AoxYH5/HyVdniNCyzrtlYq/sZMUf3
	NctLGu6GzWVRosg2iW+RObGn5ZtOdmRHNRZTugL1NWXsaj9uVTlJCCxMwi3mXvQi
	16jLSg825eHIsDtcvxJHMmdyW99sZjWnGcwIzuOs4G4XxSxt7QfAPWlxyiH0FXpX
	b+gMfHclEGvE8qo1ZdGRN1OZ3evJ4oIqVSbovkGeBa0iD6EYlpVXrfQVa60RI5hN
	oInrP5qT+DzIfdKubidc+L2IPwQc9ikhAzU2+8hPBwUNqL3OID16ty0lSONcZaBy
	ZnBL2g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr3jw1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 09:14:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a82c7e8fcfso1424207a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 02:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791278069; x=1791882869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5X0XYv1j42J8veRG6G7BpqboqQUipyEf+4L1o8MCCgc=;
        b=gVJunhn3euVKyTrfEdNEeyQYEz70E7TR0ZDTxIupmH2BcEkGrfYrgIYVr2BuDVO+6C
         e9ZJrVh5XUkgDVqepaSnh0K/cblE8Fqc1dBUhL8CEICB5pLn4kK7OTOkdU3wHsbF1z3g
         YKmIM95mRFoaIo6ObRx1gwzKUOwJtGR5pUB3NzjknRpY37crI5VzTyW75zPR8X4gdwa2
         c+qBweBw3pisEBeojG10v/PJzYQ2r5EHi4mDOaoyiEzI50igYTCzTghWvHApJvli/E6f
         BpzQiWYY2KjshTGUiIHxR9s2keNfjWXVrN4aZW5hNenCM8Lvt+2Th0fptGJf0/bjXN+I
         yH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791278069; x=1791882869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5X0XYv1j42J8veRG6G7BpqboqQUipyEf+4L1o8MCCgc=;
        b=XhGi8h6LbA84ucEG8wo2FyhMhntwoD+Zfs+2uZIOONZ0GnalOJ3WvX5tjmqZNKSKO/
         hZIsldBxFBYES2t74/gybX/5f/xbJElhNllujuT7E+3fAmEQ7Kd7XgSjAiGYYUR0CQjr
         uLRaCDQLI04jATT8MY3615Ke2HMYfVO4KaOIZLhYjypHVXXYhh0YW2BLnGXoWS9vkXNK
         fkyyZiWnkSHslGrrIXe0/VkK00x+l1TdeEOSf4LPp1J5GUbmLFC4jdsc35lqGt6JSqus
         6XiD9JFsfu9Dg/r+dvf5GWSfJ5pQ7tPL1BkRuHGIi4dG4+hmSubbJqGpXa+Yir76nRtx
         qN9g==
X-Forwarded-Encrypted: i=1; AKwUvByomO9V2hULS57lwWRxsLls7TDtiqAuTrTB/PhzYM0DDNne/LrI7C4gRiH07CHHIlggFEZKJhlxwZ7j9+aN@vger.kernel.org
X-Gm-Message-State: AFq9FYJ38tasFySw07QoPWEQ+JP0YT0TuhSnGituCAinE8F5ot8nt9wx
	lsM/+dyuMCRxu4TbfxKjpXL1wymwWmYUQf8JO9Y/B1hwwifpRSMw352Afwemv9y0x83o/H/d/zO
	kAyXvYG1ynQefo1hzgsC4AGiKnpE6YvzFXNwoAuiKMy0x20nmJmU2JcsBF26+/UOQx765
X-Gm-Gg: AYBFou0OZf1kUHTkt3KmaUFRBqGvPiIT8pnIVFLBrcDYW3A1mbqv3XvNs25YWe4hPUd
	pUhFmLZgrMyj+WsDxOm6y465FVJpKuBvUj972npq3O98UE42IAUykALROUdFSiNYMBOGN2/MTnu
	mtX+Z5/MrrmFS++6waTGpaAz0DXpNQ9uDTUGHEXA9/4xGZ+GwOJ4OZ5J49qGMUiDwOZdY84Dmrn
	u0COdhVt651V2qguK3kzi/+G5OrFW8KHLYj33iIpElwWPuR25KWd3oJIXqpA9CQIYFuZr8BkUWQ
	NQGLeHZz2r619Y0+FVrY+ivkGfJD1i6M6q0n2kVFi6itV1yTQ+OcAt+J24xzqOV6PsQPBetKjne
	BXsuXcYsnPclyDUDP6OsPM2rt6Z7EsFs0HBwI
X-Received: by 2002:a17:90b:2804:b0:3a7:cdf9:8fdc with SMTP id 98e67ed59e1d1-3a8726843a2mr598001a91.3.1791278068779;
        Tue, 06 Oct 2026 02:14:28 -0700 (PDT)
X-Received: by 2002:a17:90b:2804:b0:3a7:cdf9:8fdc with SMTP id 98e67ed59e1d1-3a8726843a2mr597985a91.3.1791278068286;
        Tue, 06 Oct 2026 02:14:28 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6ee4bc6d7sm10199342a91.3.2026.10.06.02.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:14:27 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 14:44:15 +0530
Subject: [PATCH 2/2] mailbox: arm_mhu_db: Remove redundant
 mbox_controller_unregister() on probe failure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-mbox_double_unregister_fix-v1-2-9011ca208d36@oss.qualcomm.com>
References: <20261006-b4-mbox_double_unregister_fix-v1-0-9011ca208d36@oss.qualcomm.com>
In-Reply-To: <20261006-b4-mbox_double_unregister_fix-v1-0-9011ca208d36@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Huang Yiwei <quic_hyiwei@quicinc.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791278058; l=1493;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=K7qcaGAtzPSjI543191e/RtZaNKrmszLgd2MWUKfiHo=;
 b=LpqEEsSK/49LVkMomOKVFr0cGEZB11jw5DSZnW9HRpj+vm/GT8a9n2jIYl1NkeUuPqRnWnEiu
 rdZv4tHV50EAF9o8SQb2kzhn1tb06cqNnrMUTbklSMkoupAgbrj9UkH
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-ORIG-GUID: 6qiOpgcbmlKliBNh0hEUr5M8ct4DmZr5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzNiBTYWx0ZWRfXyRMJX4r6oEQG
 0cvRmotj93eR7tgJrAawMl5V420SETpuGqs7kaGtjLT5rCxQtuD4RIrmxTrI9Abf7Xi7oqpuS7R
 RirzaEAdSsYgKEfmZYAK+VlPoDwr7G0=
X-Authority-Analysis: v=2.4 cv=PNWaavqC c=1 sm=1 tr=0 ts=6ac4bbf5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=U3cdxg4MlDLirErpFykA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzNiBTYWx0ZWRfX+u6qvNGE5ikk
 JhIjGOzmOkWuC0Zwx44vpUSOyOMv5A8XuBuwMoiVVt3fcd/uS/eWajdV1ENNWygzMKynCcgQc7d
 TQ8+mymlY6jPcpd0IqLjaEEqwf4AT0tgqtYKQQmilCGWOgxFf4ncQHoyIsBetNGqD0ALqnR2JpR
 2ptPHYr2E3b7U0MKtyezcMIi4deynGHkli/Jo5UnvPfxmmf6/Xqz7LsdkYXkxdC1xb91LRMsWnU
 i/v6m7aRRDA98uOGNj24c2vvitTMvCBZ4MbJxbg5a2aj2dvduXRra9EIIE9ET1IZtbX0JS3k1M0
 8ochOmiYtnE+eyBsNtw1Nq4/gRZck6zlq7Sg4P0URNH1U/pT8WCqVACOi1sjvOobGyEbzy36RZx
 f6i6AonRQ2wlIzA2nszmZxyxxp62uiOmYhpPdwF4rI4CinddtKtFgQ9qub6iKb+lTw3We9yUYN4
 uWVfhrGFXxs7dkrJwzg==
X-Proofpoint-GUID: 6qiOpgcbmlKliBNh0hEUr5M8ct4DmZr5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060036

mhu_db_probe() registers the mailbox controller via
devm_mbox_controller_register(), which automatically calls
mbox_controller_unregister() through devres when the device is removed
or probe fails. If devm_request_threaded_irq() subsequently fails in
the channel setup loop, the error path also manually calls
mbox_controller_unregister(), resulting in a double call that corrupts
the global mailbox controller list and causes a kernel panic.

Remove the redundant manual call and rely on devres for cleanup.

Fixes: 7002ca237b21 ("mailbox: arm_mhu: Add ARM MHU doorbell driver")
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/mailbox/arm_mhu_db.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/arm_mhu_db.c b/drivers/mailbox/arm_mhu_db.c
index a39239e38a47..9668dfdedc78 100644
--- a/drivers/mailbox/arm_mhu_db.c
+++ b/drivers/mailbox/arm_mhu_db.c
@@ -315,12 +315,10 @@ static int mhu_db_probe(struct amba_device *adev, const struct amba_id *id)
 		mhu->mlink[i].tx_reg = mhu->mlink[i].rx_reg + TX_REG_OFFSET;
 
 		err = devm_request_threaded_irq(dev, irq, NULL,
-						mhu_db_mbox_rx_handler,
-						IRQF_ONESHOT, "mhu_db_link", mhu);
-		if (err) {
-			mbox_controller_unregister(&mhu->mbox);
+					mhu_db_mbox_rx_handler,
+					IRQF_ONESHOT, "mhu_db_link", mhu);
+		if (err)
 			return err;
-		}
 	}
 
 	dev_info(dev, "ARM MHU Doorbell mailbox registered\n");

-- 
2.43.0

