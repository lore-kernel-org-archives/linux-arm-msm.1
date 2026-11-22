Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361963;
	b=wpsCME06wUT/2Y9IliUikEyZD5lJ78DbISLhG7c8AxGBZLQUuB+hah1q0b+h4N53bXdR
	 +ckxc4IUicDr6nBh9BCdQEUzHE6EUsV890IepglMIOXqVty8zIVarOE7IIuUHpQaanO7u
	 4zE2aEOFtcv+rgbSb/2E+001xSr6g9Txe5CqIJxi+5PFhsfsZLIFo3fG7qbEoCk20KotS
	 Gwk+qEBfeuaziuZnYv+WCwGgINsNOjdb1yV3X72SAJt/HOWahuI4M4eHVPXwDdjLUYmgh
	 wqy8pYW9enO8COnlrCJ3b5V4B1G47XCt7nA5oLd/jn0J7Brmf+OI0itsbf1rxmZCtQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361963;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MhWnJ4+yNVf79wR6D1VGPPl7WznIwx6HJxt/TazmJ4M=;
	b=Jbnne1hna3Emcjo34jijluYnmnSdV/b35f0QwVvnuOb7THIL0w1Z7upklUFJ7eqd+SmG
	 pa2LrKq/reHIAf+/EBfpY5lWlnbr0srBZRSg5U/DyoGUqjl/QvN+i/frkiW06DLtAWX0q
	 gXbDMlY5jdOK9vHd1ulLpSUW9Kmtx94yh9BEXGCzBgj3HTKb2LB+HJjEqGVsrzYhUdP1U
	 KhoH9/ZfRnaSYZFcs+QlyZiGEBcmejWfscNKOyOipID4FSAhz6JF1SBQUGyhQDITB+s8E
	 AUR5o6DZBL9GCDjbXrd8HyCUFdCsfGgn3eSXtAaRLZVrHFS3lDdgBGDOePQb/td+I7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jCleHAtn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jTkaFyaf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39B5606A320
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 15:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C39B5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jCleHAtn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jTkaFyaf
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQYZ52111400
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 15:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MhWnJ4+yNVf79wR6D1VGPP
	l7WznIwx6HJxt/TazmJ4M=; b=jCleHAtnRT+F+7BtLeC/6TjgIWvzHFkJnpS5Vb
	ihXisJVwLRLGXsJw6r7G9FvmwW951pgN+vRrj6DUeAlvhngscJgAdHUdIHKw7q2v
	LQ/KoOu3LWZ+JD8SlMGArBJjnTRrzp2M+uYRWzYToIcm8LYM4VIi7W5+vzQrl16E
	Q1x/OFjA+TdUP/f8m+ZPtx5sj7u4l0+4fLGZa9KORzkwtvOcNCDVJktvSfvpugoQ
	XNcbOKW2/i7pw998rgjZpMRkkJ1L69VwzPThqDicjm8UtWtyFKZSWS9yyuWXIrwe
	cVVaMvFpQzb6rs/sE1ENZBxczWpkOxd9OqkZAleErGLhe7Lg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk3gth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 15:39:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso3693536eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 07:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795361961; x=1795966761; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MhWnJ4+yNVf79wR6D1VGPPl7WznIwx6HJxt/TazmJ4M=;
        b=jTkaFyaflGEA9p5n7+vaQy2NsBNY3g7PPxub5LZz2dvSvDapWpoXGmuHzhO9iCQ6Is
         uYGQfXDx4GrZg+VD/RUEn00Usz+Vk97aCFLMFbkd0+ZI09WmBYV/TU163ZOc/MFUQIRs
         GOsPSvsqhmxFefw2TtqSITx1MTo1k9IlNa65ydFcnya8eN4DkC47+y16Ica3lxwTUxbC
         dK3y0ajxzUWh0jhfDsuxo6oj70SRxA/qB1mwee1WbUwqwyAwdCbAts0fGS4UxmYMI8td
         JgS4/JwvmIfwWqbJJO5+l6nsbaIPQbdkHErSR8j+nENNtnrZw2THSmqxlmkmJQjvzW5Z
         zNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361961; x=1795966761;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MhWnJ4+yNVf79wR6D1VGPPl7WznIwx6HJxt/TazmJ4M=;
        b=GTMVQbzj8svJmQfy5jj+B2cUH+FTEfNdWZb2fbIy0D17ZgjF+g4wr3Kl7jnvWzHwCC
         c5DK8X7PSV/XzrgCHrptaOZNUecT6gtSLpCWew0LE5BxPk0Bhw9ti9kWpfu8s29z5jOg
         yrAmQyKwK9D+zhiGTBY0v9k/niNd7qWmAjgUxgTXPfUIeysWBD4fw5vJN0sQ9Chjl6An
         m3SMyeiGaM6Bx2kNz1M4TXHNa9ChkzZO5gcKHSKfOvaPyv3QHaOgW44up1K0PHWpaGV6
         KZyb1VkT+Lfo1Zu3aw9iEWxmSmFYbRPFJo1v7KrTVk2603QlfGwlzHckj6BT5EpWUS2k
         Yq2A==
X-Gm-Message-State: APuU4Z/SVjZwA7F0QNuxBdDUlG2SaOBHOTi7TvNPfxflXwcSALmn+agB
	KkjnBmxVNhyRZ8pjA2+bTVPxy/EdearxBf2R+eR45fDmwzxgwjD7nxhRSG+IiSeBCssSqIVZA1i
	W9TYKFMMltCfmbxwhNh7/9n9+d7HlBGTLwFLypch5booYbjb9NxCsatNR0ton85SLk3k06WtW6n
	23
X-Gm-Gg: AZFdTZfnSkEVI+nsg/tOMhvE4/sde0JKfk339d2f/aNrBm484VqFSt9HNF4HBI409dV
	satggQfKtJdzPJ9zzAeIKmcEnMlz8Nny7S96th12hVQ1h2VRNmWs9vGW8L0F/9lt6Mi8y+Y116Y
	WY88nTytwvv6u+1+JUq4v72fd+qA6ED25Sc/2MLxZG13MAOfxPNZWuFej3yI9DiyznU1+FgCmTA
	PmMvIXscf2Mn5j2+uJBufTUX2zu0ALMkxDm2T1zCRIWFJ67BVbQ4r7Lwa7vsnFU+Azr6oiTR5N+
	F92g6p3B2THOpG0TqfDL8SikvuuyT9eLEhqyJI5EhYRlUpTPp5bGskJuf3wNMqkkH9LX9QeX4d/
	xGlgQ9eCAs6v0JXydYCd6YO0+/uoxo2vO/KTOWvCPd2A2Kejikq+gSHtPjOSuyD8EoubwZkMy0C
	2Tas+kgCgwJQ==
X-Received: by 2002:a05:693c:408b:b0:377:82e:2d79 with SMTP id 5a478bee46e88-384b39896edmr11417695eec.9.1795361960952;
        Sun, 22 Nov 2026 07:39:20 -0800 (PST)
X-Received: by 2002:a05:693c:408b:b0:377:82e:2d79 with SMTP id 5a478bee46e88-384b39896edmr11417676eec.9.1795361960347;
        Sun, 22 Nov 2026 07:39:20 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm30354900eec.14.2026.11.22.07.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:39:19 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 21:09:13 +0530
Subject: [PATCH] rpmsg: glink: Don't reuse a channel that is still closing
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
Message-Id: <20261122-rpmsg-glink-dont-reuse-closing-channel-v1-1-363d90d7e481@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKAMA2sC/x2NQQoCMQwAv7LkbMAGuge/Ih5Km+0Ga7okKsKyf
 7d6nMPM7OBswg6XaQfjt7h0HRBOE+Q1aWWUMhjoTHMIRGjbwyvWJnrH0vWJxi9nzK27aMWfpNy
 wUEpLpJgjJxixzXiRz390vR3HF+EtSPh4AAAA
X-Change-ID: 20261122-rpmsg-glink-dont-reuse-closing-channel-d2aaf525c5ea
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795361957; l=3880;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=bzjkglRWWIZIs5pK+2OezJTD1Sz6g4JZ9UMkqb6Z4gw=;
 b=zY2qGpnxXY08rKg4Hk/zXN19cJHiCfGrhAH7Dvyohdfw3hLrJijf4p/DUMj1miYmBqGHKE8S8
 ICzGXTTlx+hCOJqTvz3yonvqP3/gqys/YmYbT4ieDdL2D7PybNsUes0
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-ORIG-GUID: 2HNA_dKj5f1SYUmvfDDg-GPRTxXpoj2F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2MiBTYWx0ZWRfX/Ip+TZggAwkm
 3c3QHHf/Zmq88RWm8SJZRwhRwTLtEV00lsLQR4v3x+w3k54LHEM2xSMQKDH6tF5lHUFj6KnEO4N
 rrTsXIXapvM+itBiPR2jz1tOIBhYsMGsjIv9S8huVcuC9IlemFXk+L8t4QmNW+bQfL1lWjwj07b
 pY7ntKv4IZ5CvZHLCH52cLoIBzeEVMYKGaTB7gwiQhpMu5ETeULWg/XvQ+qOKs9hOXZg+R+uXtV
 D4GOgvDoz4d9lW3HIGYSwt11L7CgWnnMOVskF+vHXF0FLfbMwIpmfX6Ob2/tqUX9LzScCeylwrp
 vl9QNTQ82zYbco4v49Fs6uk4EOisEtq+hdt22QAt7ZnjA9Gzu+BJkbeI9Sw5W1tYr0b6+jWPl2C
 isbZQ8wMIGz3RBbYexCD2EXjZQDmACokg8vFT1u6iDJF5wFF1DmYoBLF2I95comTmIfDJkuJM2k
 IvmfDqceXcaSHRUJfyA==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b030ca9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2YlJufyw7Tv86nj3aO4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2MiBTYWx0ZWRfXwg6/VArxcVt3
 EY9yQXHxq5l1NtFlP9Ks/4SNifTmpera8xOG+sPzpkmL4nwEi1ErT/rwEcPPCBQfpOOfJARfBXA
 xSYfs1jxa7M0wH0gta4Sgv6UvkswQas=
X-Proofpoint-GUID: 2HNA_dKj5f1SYUmvfDDg-GPRTxXpoj2F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220062

qcom_glink_destroy_ept() sends CLOSE, but the channel stays in rcids
until the remote's CLOSE arrives. If the same name is opened again in
that window, qcom_glink_create_ept() finds the old channel and joins it
a second time, sending another OPEN_ACK for the old rcid. open_ack is
already completed from the previous session, so the open returns at once,
but the old remote intents are still marked in use and every
non-blocking send fails with -EBUSY.

When the remote then closes the old rcid and opens a new one,
qcom_glink_rx_open() finds the reused channel in lcids and adds it to
rcids without taking a reference, relying on the allocation reference
that qcom_glink_rx_close() has already dropped. Closing the endpoint
drops the last reference on CLOSE_ACK and frees the channel while it is
still in rcids. The remote's CLOSE then works on the freed channel, and
the next open walks the stale rcids entry:

  refcount_t: underflow; use-after-free.
  WARNING: lib/refcount.c:28 at refcount_warn_saturate+0xf4/0x148
  Call trace:
   refcount_warn_saturate+0xf4/0x148 (P)
   qcom_glink_work+0x318/0x10b8
  ...
  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
  pc : __pi_strcmp+0x24/0x140
  lr : qcom_glink_create_ept+0x78/0x2a8
  Call trace:
   __pi_strcmp+0x24/0x140 (P)
   rpmsg_create_ept+0x40/0x60
   rpmsg_eptdev_open+0xcc/0x128 [rpmsg_char]

This is seen on Qualcomm Shikra SoC with an rpmsg_char client that
closes a channel on the LPAICP edge and opens it again right away.

open_ack and open_req are never reinitialized, so a completed one
marks a channel from a previous session. Fix this by skipping such
channels in both lookups. A new local channel gets allocated instead,
and the old one is released as before when the remote CLOSE and
CLOSE_ACK arrive.

Fixes: b4f8e52b89f6 ("rpmsg: Introduce Qualcomm RPM glink driver")
Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_native.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index f848ab46161d170ac82d906782ff473d3e63f490..b23db2b90fcdbf3592bd73aa24486f592f7189aa 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1331,9 +1331,14 @@ static struct rpmsg_endpoint *qcom_glink_create_ept(struct rpmsg_device *rpdev,
 	int ret;
 	unsigned long flags;
 
+	/*
+	 * open_ack is never reinitialized, so a completed open_ack means a
+	 * previous local endpoint used this channel. Don't reuse it.
+	 */
 	spin_lock_irqsave(&glink->idr_lock, flags);
 	idr_for_each_entry(&glink->rcids, channel, cid) {
-		if (!strcmp(channel->name, name))
+		if (!strcmp(channel->name, name) &&
+		    !completion_done(&channel->open_ack))
 			break;
 	}
 	spin_unlock_irqrestore(&glink->idr_lock, flags);
@@ -1637,9 +1642,14 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
 	int ret;
 	unsigned long flags;
 
+	/*
+	 * open_req is never reinitialized, so a completed open_req means this
+	 * channel was already paired with a remote open. Don't reuse it.
+	 */
 	spin_lock_irqsave(&glink->idr_lock, flags);
 	idr_for_each_entry(&glink->lcids, channel, lcid) {
-		if (!strcmp(channel->name, name))
+		if (!strcmp(channel->name, name) &&
+		    !completion_done(&channel->open_req))
 			break;
 	}
 	spin_unlock_irqrestore(&glink->idr_lock, flags);

---
base-commit: 4843f6873f7c4835e62f2c73ba0fd538e57a2f22
change-id: 20261122-rpmsg-glink-dont-reuse-closing-channel-d2aaf525c5ea

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

