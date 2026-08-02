Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341EB3B47DC
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Aug 2026 13:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785677349; cv=none; b=aiWq71QqipDh8MQI23atJorSN3p9yr9BF5Gjhg6turUCkiUJuG3BAcwOtY5f7QZzBNHfmCnCffT7uaouGv3oAskKMuVDH8pMHrcOwXwBHLi4pNfTj3fXGrf8w/lw0EFZecvdP6Learh5y4mimzZ2MnRXMrOCOS+KLNHXdra5Hd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785677349; c=relaxed/simple;
	bh=+CYnCwojlSBcKoiP35Bjbd59g2f9lZL6rBYcAz4xraY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q4WM14MVD5ICXudCgvGn49sRSF6PcFXuOuQX3A0dnTCyNWdsrWE+B4IhAy9XinObLXvH8F9z8G4ddoFF7zvam9Kmtw02XF9w32iuBKm2QOwVm3D1wHXYa9fs3zmNyhYkz00JyxofB212Q0Xjh05z0dwQTEz50+LOrgIl90mSCqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LLIqpcdw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QK74ioAR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LLIqpcdw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QK74ioAR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B6sxs2679234
	for <linux-arm-msm@vger.kernel.org>; Sun, 2 Aug 2026 13:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3pbo5cYJ9CVWp9LjGEV/wAfvm2Rp5OTXI1X+QDSrEUw=; b=LLIqpcdwUVlrvjQ5
	ydRMsy6TzgG3LnZEmlP/PQV+m8cLgfByv25DshuHcB2fjQW3RzQsp3iFxUyNXhCt
	c1sKqWbcn7ojOZ7Uy32gzlrAGa769JA+SkLn/H8pEfdIJ8ZFm1xjcYpvA4A5rk48
	KhRwVbSXYjisP46OxeDxCeTyQ8sCNhmYJxRc67GGxGan+eYPCJTUegFjnGtfBg0k
	SbQpXDtqiw802tzgOQTfz7s746htgX1wyE1jprFShZghEjHJiXybTc5yeKkgrWX7
	od60ow8A6KUR+JbFFzomYhTIIlpKAU90np1lDKkyhqowQ2F2Nz19DHWVhSsP0Bbt
	lNyS7A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8pg2usg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 13:29:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso3227481a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 06:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785677347; x=1786282147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3pbo5cYJ9CVWp9LjGEV/wAfvm2Rp5OTXI1X+QDSrEUw=;
        b=QK74ioAR/JgkKhB0TwkERzx1TIQXxRPUfgCwRNBeD/I6C/3dN85zJdiT+dEx9fcJIi
         1SfooBzg+O7myzPLeBd819JoksLi8wSP1lWH6haLMeQC6d42e7VPNt8DHhs/IqCFQIuJ
         +2b1R5xTZ4bLqt9ojIgzeXF+kVNKMFTexWeQ3rTnG+j8u9c0ZchQidtB6TVIpIkw5a8B
         i+ez0xI+RAft7Y42ng6e6wwjqP9jmUcm1k54DiO3gNFcQEkJ4+pSTL90y+wXz14wsCXd
         XJvMypygMhFQ5FAgQUWBNz7vlwF2YpucXGPlP7Cfxxqa7O5aJuIYCHB0ilg93zH7qx22
         Z7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785677347; x=1786282147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pbo5cYJ9CVWp9LjGEV/wAfvm2Rp5OTXI1X+QDSrEUw=;
        b=Lv67ULk3Rx3/1PbTQbim2eHl1dR9USP/Fdge8f3BCi+P58TjJTC/dMRubLs2/B2sQ/
         Tkd2NiwCYnO6geaISa0sX5wQijuOT6qXYbk1GG+dpO7YJxdulLNKQlkU2EoT+0Yno5aq
         05yEg+3tgDhZav0HJzzYyiDqp+/niu/ApUDo+texurZOxVfuKZWuYOkwGX+ThFCh55Aj
         nfC+iMV1WCq3J3Tvj5ZRmPyHjlExcEWOZ94UWxn+1hDW+4y8Wtb1EM5pwDUrw6siiZ3d
         lCTEj4W7M0tFJejf34+l6hYx1fc/x/jLDkNLRG/FqOIrGzOuu3WUGya3PXsz/y8e1RbI
         sihg==
X-Gm-Message-State: AOJu0YxXfU0eAWVG4q1MpLTo0LZpojCJGnqF8xpsy30Yw4A7sptfRhQ6
	NY/gXWPTIt7+NbRuII3Ltm8G4kM1HaEgZzAthQxcbjaSSY1J8Pj8Oi2JJMY6A0pVQodKVOno1Pd
	c2G33R7371oaUi+fb2morUKfMBYqCTVPsw/oapZwhFCzws9etBG2s17r0ITQMw5zQA44g
X-Gm-Gg: AR+sD100JY5Y/r5z2EmwE/Pi7gBNRRulgWi0gOQTiHHrqCNFl5kTE5ZdDIJOa5twWW8
	6qrNXdET6HU1mHYfbhctzGzmTaJ/gvWDgLtUHKt1s87dBIXv311NVxsmWrE4Pn9QKyxYynu0hPz
	WyKZEYyRntUMuPBUx2TP0rKo4inFbZ7QwsYT59GsC00bLkFOZha8rGicTqddaF+uCd9LZtxjpDu
	gvQzftjE1TL5aaqLXeCUT8v7vs11cSwlbUOu9KERaKUtV3Bv15QC8IAOVTwB6PVkN9nqDIvoaT7
	1bYtfpp4jfN/m/aU7ahZpYReyVdAfIzHENxJlxNxwCpvlznzQkL+zzgr3kGdqmqIlVgxCZprFJp
	XG+ukHshohpQLghtiNUAR9cHqundB
X-Received: by 2002:a05:6a21:3511:b0:3c8:f98f:475b with SMTP id adf61e73a8af0-3c92a74a14cmr7481485637.19.1785677346508;
        Sun, 02 Aug 2026 06:29:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:3511:b0:3c8:f98f:475b with SMTP id adf61e73a8af0-3c92a74a14cmr7481464637.19.1785677346049;
        Sun, 02 Aug 2026 06:29:06 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153db2f911sm30582951eec.0.2026.08.02.06.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 06:29:05 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Sun, 02 Aug 2026 18:58:54 +0530
Subject: [PATCH 2/3] soc: qcom: rpmh: fix kernel-doc issues in rpmh.c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-b4b4-rpmh-kdoc-v1-2-0f5026293d9a@oss.qualcomm.com>
References: <20260802-b4b4-rpmh-kdoc-v1-0-0f5026293d9a@oss.qualcomm.com>
In-Reply-To: <20260802-b4b4-rpmh-kdoc-v1-0-0f5026293d9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785677338; l=6489;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=+CYnCwojlSBcKoiP35Bjbd59g2f9lZL6rBYcAz4xraY=;
 b=09cHSX2v4klLzQ9P7iJNawmlGMi789WCQF7Dn6H8+LL6kumsaAE7LIF+JP0dSyaJ6xtNV6xZ4
 c7v1zAyITLdD16C3BOz0rWJ+UDPYZGu9acqqN4BepXmrZxoTYfe+u8+
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: 9-C4Sj4ebNvhLyU0rIApVLSBqzWyJIvj
X-Proofpoint-ORIG-GUID: 9-C4Sj4ebNvhLyU0rIApVLSBqzWyJIvj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDExOCBTYWx0ZWRfX4roAwf4IxsJE
 VCsM5zq6fq1v/lU6jJvu3hGUMnE5XrmeYgdALWT3scdkqp/EMyQZwLc7wCxc2n0u+uQUlfgYj35
 NxYGgDr/mdieJmooa1w2cKf5Hlcm/TY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDExOCBTYWx0ZWRfXxyIEXQonelPm
 AtU2ByCSyNIjXnw1XR7V1lb3IwRSz6EA/unXi9JvXNfWjNgtMfWaYiiNtNyMcjf4g+FNLPU1xjz
 7jwEwr/+hbQhBq3EKeL7QV+DcOq/5uCv7J+Utiuv7mRgmEPoquXbfdywoqiNqFBAQpI233auH2n
 ZNZ3iawEROAcCLxliTzXu5Dka7kDtPnixpHEjW+VeXdIrqJzY8exSb1V2W9cVY24kWTPzYr6hoo
 SKGbvH6NZKiGiPCwJ4AHjq/03tL46HywvUzPVrUJQKdxBaVv9gJd382K08+7BzQkP99liuUZTyP
 dLRbpnyHuNu9rwL0bcIUrywsia1U+jCYVN2Cb4aF02WqOZJbV9/yAdjmiZx8iG7sqqntTkaqn8M
 0Elw+Lez83nlidY7Tl3LM5fOtUXRC9jIEaHVuZnJnLlc8wsMPQF4kLPwJBu9iG1EYqCZfarSUKs
 sb55+NHywa17xGlPNUg==
X-Authority-Analysis: v=2.4 cv=U4Oiy+ru c=1 sm=1 tr=0 ts=6a6f4623 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_NtIa0pIVb_aOCDbWhEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020118

Six documentation issues in rpmh.c:

- struct batch_cache_req has a typo in its title: 'batch catch'
  should be 'batch cache'. Fix it.

- __rpmh_write(), rpmh_write_async(), rpmh_write(), rpmh_write_batch()
  and rpmh_invalidate() use 'name: title' format instead of the
  'name() - title' format documented in
  Documentation/doc-guide/kernel-doc.rst. Fix all of them.

- rpmh_tx_done() has no kernel-doc comment. Add one describing its
  purpose as the RSC driver callback for active-only transfer
  completion.

- __rpmh_write(), rpmh_write_async(), rpmh_write() and
  rpmh_write_batch() are missing Return: tags. Add them.

- struct cache_req uses 'struct name:' format instead of the
  'struct name -' format documented in
  Documentation/doc-guide/kernel-doc.rst. Fix it.

- rpmh_write_batch() has an inaccurate description: it says requests
  are sent 'without caching' and that SLEEP/WAKE_ONLY requests are
  sent as fire-and-forget. In reality, SLEEP/WAKE_ONLY requests are
  cached in batch_cache and returned immediately; they are only sent
  to the controller later by rpmh_flush(). Fix the description.

No functional impact.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/rpmh.c | 40 ++++++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index ca37da3dc2b1..f725b1135388 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -41,7 +41,7 @@
 #define ctrlr_to_drv(ctrlr) container_of(ctrlr, struct rsc_drv, client)
 
 /**
- * struct cache_req: the request object for caching
+ * struct cache_req - the request object for caching
  *
  * @addr: the address of the resource
  * @sleep_val: the sleep vote
@@ -56,7 +56,7 @@ struct cache_req {
 };
 
 /**
- * struct batch_cache_req - An entry in our batch catch
+ * struct batch_cache_req - An entry in our batch cache
  *
  * @list: linked list obj
  * @count: number of messages
@@ -76,6 +76,14 @@ static struct rpmh_ctrlr *get_rpmh_ctrlr(const struct device *dev)
 	return &drv->client;
 }
 
+/**
+ * rpmh_tx_done() - Signal the completion of a RPMH transfer.
+ * @msg: The request that was previously sent.
+ *
+ * Called by the RSC driver when an active-only transfer is complete.
+ * Signals any blocking waiter and frees the message if it was dynamically
+ * allocated.
+ */
 void rpmh_tx_done(const struct tcs_request *msg)
 {
 	struct rpmh_request *rpm_msg = container_of(msg, struct rpmh_request,
@@ -157,7 +165,7 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
 }
 
 /**
- * __rpmh_write: Cache and send the RPMH request
+ * __rpmh_write() - Cache and send the RPMH request.
  *
  * @dev: The device making the request
  * @state: Active/Sleep request type
@@ -166,6 +174,8 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
  * Cache the RPMH request and send if the state is ACTIVE_ONLY.
  * SLEEP/WAKE_ONLY requests are not sent to the controller at
  * this time. Use rpmh_flush() to send them to the controller.
+ *
+ * Return: 0 on success, negative error code on failure.
  */
 static int __rpmh_write(const struct device *dev, enum rpmh_state state,
 			struct rpmh_request *rpm_msg)
@@ -209,7 +219,7 @@ static int __fill_rpmh_msg(struct rpmh_request *req, enum rpmh_state state,
 }
 
 /**
- * rpmh_write_async: Write a set of RPMH commands
+ * rpmh_write_async() - Write a set of RPMH commands.
  *
  * @dev: The device making the request
  * @state: Active/sleep set
@@ -218,6 +228,8 @@ static int __fill_rpmh_msg(struct rpmh_request *req, enum rpmh_state state,
  *
  * Write a set of RPMH commands, the order of commands is maintained
  * and will be sent as a single shot.
+ *
+ * Return: 0 on success, negative error code on failure.
  */
 int rpmh_write_async(const struct device *dev, enum rpmh_state state,
 		     const struct tcs_cmd *cmd, u32 n)
@@ -241,7 +253,7 @@ int rpmh_write_async(const struct device *dev, enum rpmh_state state,
 EXPORT_SYMBOL_GPL(rpmh_write_async);
 
 /**
- * rpmh_write: Write a set of RPMH commands and block until response
+ * rpmh_write() - Write a set of RPMH commands and block until response
  *
  * @dev: The device making the request
  * @state: Active/sleep set
@@ -249,6 +261,8 @@ EXPORT_SYMBOL_GPL(rpmh_write_async);
  * @n: The number of elements in @cmd
  *
  * May sleep. Do not call from atomic contexts.
+ *
+ * Return: 0 on success, negative error code on failure.
  */
 int rpmh_write(const struct device *dev, enum rpmh_state state,
 	       const struct tcs_cmd *cmd, u32 n)
@@ -303,7 +317,7 @@ static int flush_batch(struct rpmh_ctrlr *ctrlr)
 }
 
 /**
- * rpmh_write_batch: Write multiple sets of RPMH commands and wait for the
+ * rpmh_write_batch() - Write multiple sets of RPMH commands and wait for the
  * batch to finish.
  *
  * @dev: the device making the request
@@ -311,13 +325,15 @@ static int flush_batch(struct rpmh_ctrlr *ctrlr)
  * @cmd: The payload data
  * @n: The array of count of elements in each batch, 0 terminated.
  *
- * Write a request to the RSC controller without caching. If the request
- * state is ACTIVE, then the requests are treated as completion request
- * and sent to the controller immediately. The function waits until all the
- * commands are complete. If the request was to SLEEP or WAKE_ONLY, then the
- * request is sent as fire-n-forget and no ack is expected.
+ * If the request state is ACTIVE_ONLY, the requests are sent to the
+ * controller immediately and the function waits until all commands are
+ * complete. If the state is SLEEP or WAKE_ONLY, the requests are cached
+ * and the function returns immediately; they are sent to the controller
+ * later by rpmh_flush().
  *
  * May sleep. Do not call from atomic contexts for ACTIVE_ONLY requests.
+ *
+ * Return: 0 on success, negative error code on failure.
  */
 int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
 		     const struct tcs_cmd *cmd, u32 *n)
@@ -480,7 +496,7 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
 }
 
 /**
- * rpmh_invalidate: Invalidate sleep and wake sets in batch_cache
+ * rpmh_invalidate() - Invalidate sleep and wake sets in batch_cache
  *
  * @dev: The device making the request
  *

-- 
2.43.0

