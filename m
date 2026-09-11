Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CFF46D2C9
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 09:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117725; cv=none; b=uuVEtRo3FdczCCjPijQGrvAvjuI3Z9g7YOGKVhdpOBIzuCpQSiKTCHOrYqRWRAJMdauPeQrrTbjptSmjVFlllwZXUnSiG+qoBVR4nHTpH4MwL2dtZZKhZxx/CZUTq5kZbM2/X3B4jFjXK6PGRi+dswAWWgwlgqJQKOzRcxOeioA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117725; c=relaxed/simple;
	bh=BZ+EXxMNqbRpkj09rE8LZ5ynhSE2JKECFYkwWJRgobY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SUI/6MfApEy2HLtFcTNsL7gNL50VlfcrT5DzPVkSkZrVl4hnQWg0m1WoeCMDJ0m0KtMxbg+PDE0ZGqV+XoZdyPUqSvxk/tieBuJO2UkkGYVvPmvxs5ZvJLITqzi+1sL0IVlC4Pswti/Qz/suREgDem4eARkHCIRcRcYwTQFzVXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kDZUsrlp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xqs0/p+K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kDZUsrlp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xqs0/p+K"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kfYq3366287
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 09:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6TGWZvmgQIdRN7dd3rtsDVz6PxAL2ZtejgVwr5LURWo=; b=kDZUsrlpl/FWywaI
	Q3KRHmcDN1do5LEpUSyZkmx2KDBy9NavKxof0AuNQKwYg6D01aj0Nkvq+8R2eU8H
	N84I3fjl9w9hdHg206NKv35s6VxWaLELZ9AsGPB2PRWZEwYpDwfWT8m9ByDlD2xl
	nAHmRPQ8NVZ5gbN4eaXQwiUTSuLXaO0zCE7SXpUXqiBOBsk59vyrHs3urTrDMcgj
	wV8PrMKHyhHLNuYD5lYvHxKq7wHDvYZzPscRW5I2u8eqIzfeg5sDvOCHp625f2By
	B2efV2bPaZqrBG3+/aHZbYR3mqqO/1wx+Yh6uKSPJUJkbW6HzbLZapDS2+Vp3ogT
	jg5gTQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm1k2b1ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 09:08:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so1596824a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 02:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789117722; x=1789722522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6TGWZvmgQIdRN7dd3rtsDVz6PxAL2ZtejgVwr5LURWo=;
        b=Xqs0/p+KwMPM8PXF60Bri3tzyao1shKd4LxfctBbsH0T99Qtvk+4NWOc2KTfYjm9VS
         vMAo8iz9VgWJzPGNSAcR9q4t2I/EvQq6I8WJNsRSZl+likPf9GyzZdIv61KECW9w0HjP
         h7H4TWpSnEZ3fiISh2abR8rE9d6m1A0YBb1c6icvzAuHVdXzo1ED2RIIm+mob5wHAFzu
         gmMQzX8j6n8TNZ687dIQoHxL3aczIi7cRggiaQSIxT7IxdQ8Gk+FoUVBsgmofjkD/C9I
         27Y04B/UrtYQQeHeh0laVHxZX04pXTqxE5XeqMLYHqyvr+rrbePl1HE62+m4+4fWMN9R
         fMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117722; x=1789722522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6TGWZvmgQIdRN7dd3rtsDVz6PxAL2ZtejgVwr5LURWo=;
        b=YZBTBaRYlCnGp9vRA37Ms4PbpiPxfOB4BFUTEry8A6wmk/tVjNY5TL7pAO0Io8YjGn
         5yfW8k7OvIgx5i9PWfgmSxc+8eoO5WXCFe56+n2sWdqA+xxqfb13iolpr2ohpTAE1ORU
         LDs8ZWNUWoJpesEZVAEsrt7TLjUI0DR+7z/OfFyPRAxVtc9k/X7UySWSDuyuuckpPTvd
         1ys4/lrQo6pO95bThmHHUXoWrZ+lU1UdAbJ6StQefVJxIc0SC0sGGk7vcXarptwFikIB
         8CaqcwT33WUDB0obyION1haJy0NyO2eULaO59vQuRmvykfg3Xh8iDd3S7RW8nR1/sBYC
         WKUQ==
X-Gm-Message-State: AFuF++kAirSc/9rXv4clIL63zixf5mHH7S2EJ7ms6Sj3Dut06ZSZgFDp
	lW7PamPDxaXVzwqby0nc1Qyme7bOpkKf3CGCJdq+bOSFcA4/bkk84SMQs94Ww/dLu8/YBBrpKBT
	nCpCDnITK0V9a6U0G4HFtjNbdNxn5IWR8i9tMw0edbSizzBeS3+1i6Tyazumz2sqmix4c
X-Gm-Gg: AYBFou0RvW/i8ZDqfm2V2x4VESIzinsokSzZFTCvXNpohlic3gw2eqrV0Gl6Ku52Hd5
	IoW5OvDMKEeQE7RunbmcCbdBVlAYh2/57EGrT+Uyyk6g0uafRWHq+OdTxaFG7vzd3GUvzC4DC5H
	I+sxheT7FsisnEj7OHlVoNS9KKEDtpyvVE0iIkQnBvwyVcYFm4AkTae66G/X39kipdoX75rew0v
	rFuFS/ym8ptMdyBiShXRBq+UMi9dcaTYGJSgPXYzqTfYUOsqQnYlW4bvA/oCnndLABFmOIJZ48c
	rBAMsCQh9pSwhv6CocGNaHxcDtNnPbGU8/n+HRdHdbjKYrunlSexbreboMa4i7KARycTybO1SYz
	/iJxVWAjf5VoOxm0sFZJF+lboF9Z2
X-Received: by 2002:a17:90b:586f:b0:39b:66ee:a14 with SMTP id 98e67ed59e1d1-39d9c374d49mr5009783a91.25.1789117722144;
        Fri, 11 Sep 2026 02:08:42 -0700 (PDT)
X-Received: by 2002:a17:90b:586f:b0:39b:66ee:a14 with SMTP id 98e67ed59e1d1-39d9c374d49mr5009724a91.25.1789117721571;
        Fri, 11 Sep 2026 02:08:41 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f82c69sm5040447eec.27.2026.09.11.02.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:08:39 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 14:38:14 +0530
Subject: [PATCH v2 2/2] soc: qcom: rpmh-rsc: Skip read requests on
 unsupported platforms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-rsc_read-v2-2-98675c248278@oss.qualcomm.com>
References: <20260911-rsc_read-v2-0-98675c248278@oss.qualcomm.com>
In-Reply-To: <20260911-rsc_read-v2-0-98675c248278@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789117708; l=3016;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=BZ+EXxMNqbRpkj09rE8LZ5ynhSE2JKECFYkwWJRgobY=;
 b=6dcJ4q3uVIozHxHznj+ISS0NN48Utn/0w0VNiOrwdAwjArDyop7V6W1zrGWhYb/J275m1KpoW
 MlZbUa18t+FAZwXxusm58GkjaLKEirqoon8/Q9mL4auzdJfmbtHfXpk
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=cM11IVeN c=1 sm=1 tr=0 ts=6aa3c51b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=k3WCD5QtlwoTK8Or2cMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: OcMU6zwf7ckrMtZ2SyEeI0otw5zeJHER
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyNyBTYWx0ZWRfXz+tkNJg9HN/I
 0h+fSLnan2ZCSwTBRlxJO35YpFw9nY2fVYiT0hH68gjuF7oOOlUvidYmkC/7EBzRUY+VBRxPO1Y
 6AMAbnZjMeeDCR465JtDiD8QtLWZWnQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyNyBTYWx0ZWRfX4ssZbAgi8wtO
 fTMNGPf1RmLJEzbM5WU/9xPxmWXuxTJuhHYftHGUQ2AGzoqZC0qEPBLK2Cq/cXazo4nttKYUU7L
 xZU8LKzG+V6y8+ZLafDJxXXUE3QToPV1HU4IPpQvbMkxWSLBHQEHjzQraiTv1a8cxdI52wHHwqu
 zD0n47njcpav/3/VwpLea7OFMS9SE6ow/nLDTk92Es+PvHJckmPxJE6elWEi57PlAiDaIpzootz
 tFixt5iVjVl9s58Ml47L4uBPEm/dj91Ccpi2cEElh2ANRyLASkWPEuzuld5oCmIeITfFGcTKmu+
 Cjrza/uqCrqBLi90v6SwVPvg+oJKrtbPHITS1rmf+8RU3aoqM1iWI31Sdfag52ENVG9tjCprYF2
 6PXd4nzFd2+UP2g6TU7vePj5Q8sW5XuJw4iWHNhoch/eg0OVUh9LdUUrAW8l2acQK3kYNGN5bKY
 /qCqZNkuMrrn2oUgOmw==
X-Proofpoint-ORIG-GUID: OcMU6zwf7ckrMtZ2SyEeI0otw5zeJHER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110127

On some platforms AOSS do not respond to read requests. Read request in
such cases will consume the ACTIVE TCS but forever waits for a response
blocking the subsequent write requests.

Skip issuing read commands on sm8150 and sc8180x platforms. For such
platforms return success to the caller with the resource level at zero
to avoid the caller taking any action on error code.

Fixes: edbafe65eef2 ("soc: qcom: rpmh: Add support to read back resource settings")
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/rpmh-internal.h | 2 ++
 drivers/soc/qcom/rpmh-rsc.c      | 7 +++++++
 drivers/soc/qcom/rpmh.c          | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
index 39441a25af9b..960a62f0e931 100644
--- a/drivers/soc/qcom/rpmh-internal.h
+++ b/drivers/soc/qcom/rpmh-internal.h
@@ -75,12 +75,14 @@ struct rpmh_request {
  * @cache: the list of cached requests
  * @cache_lock: synchronize access to the cache data
  * @dirty: was the cache updated since flush
+ * @no_rpmh_read: controller does not support or respond to read commands
  * @batch_cache: Cache sleep and wake requests sent as batch
  */
 struct rpmh_ctrlr {
 	struct list_head cache;
 	spinlock_t cache_lock;
 	bool dirty;
+	bool no_rpmh_read;
 	struct list_head batch_cache;
 };
 
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index c5ed9874bb67..054122ccc46c 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -987,6 +987,12 @@ static void rpmh_rsc_cpu_pm_unregister(void *data)
 	cpu_pm_unregister_notifier(data);
 }
 
+static bool rpmh_rsc_no_rpmh_read(void)
+{
+	return of_machine_is_compatible("qcom,sm8150") ||
+	       of_machine_is_compatible("qcom,sc8180x");
+}
+
 static int rpmh_probe_tcs_config(struct platform_device *pdev, struct rsc_drv *drv)
 {
 	struct tcs_type_config {
@@ -1156,6 +1162,7 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	spin_lock_init(&drv->client.cache_lock);
 	INIT_LIST_HEAD(&drv->client.cache);
 	INIT_LIST_HEAD(&drv->client.batch_cache);
+	drv->client.no_rpmh_read = rpmh_rsc_no_rpmh_read();
 
 	dev_set_drvdata(&pdev->dev, drv);
 	drv->dev = &pdev->dev;
diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index 360242a315e3..fed2ea06f490 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -240,12 +240,18 @@ int rpmh_read(const struct device *dev, struct tcs_cmd *cmd)
 {
 	DECLARE_COMPLETION_ONSTACK(compl);
 	DEFINE_RPMH_MSG_ONSTACK(dev, RPMH_ACTIVE_ONLY_STATE, &compl, rpm_msg);
+	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
 	int ret;
 
 	ret = __fill_rpmh_msg(&rpm_msg, RPMH_ACTIVE_ONLY_STATE, cmd, 1, true);
 	if (ret)
 		return ret;
 
+	if (ctrlr->no_rpmh_read) {
+		cmd[0].data = 0;
+		return 0;
+	}
+
 	ret = __rpmh_write(dev, RPMH_ACTIVE_ONLY_STATE, &rpm_msg);
 	if (ret)
 		return ret;

-- 
2.43.0

