Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4765B231C91
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157791; cv=none; b=jAyp2ZemzSZpNYAYSwL4gqyWnVn6BlrVyaDFy1psYZtrPB+IlC1MhSI477O75ty1sRzJA5gbO7cVAT49FC7JAVolbEgSFomXOpZ0AzUDYpRVyJ5meDi2iq4SdGc21PRWERU0hHkzVahjn22obqQg6Qx9e9roRlGzLUStQPK2S60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157791; c=relaxed/simple;
	bh=fFNzBwpn6Lkt6srdzze0CUC7NnE7fRIN4Z1RqEcfYRU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tVx07hUBpbcfAoMSFwH/+PsmfuKG2t4l2Eg/t7PmNLrEVQ2vGNvhgrhTo0OerdmXYxApV1sapc/WnCluJv7i7E1QeUOX6j9Zqx3VuSfmqnM8Osoy53TqUrY0FEfqnQR7lJkNfyM/I9wMWc5h53nWzFVTz2SNbc8DVNrAc0DFIto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EsYdjh0e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EcrB5SOb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EsYdjh0e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EcrB5SOb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAM8ZX3322318
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hiGV1rjiTiVgZQ+G99/XYxcVt/8kndyeA0r
	6zPeu0oo=; b=EsYdjh0eZCD0CO91knjwORNeoMCvGxHdT7FU7Lf3RUNzZeB/sb7
	0aSekxGAg4bl2B/ZgyHJiNPwz8DKkEQVpQakYW1ESy70v5ap3A7XkclHjvkeBny5
	+XZJQfUob13VvwPsMiqSR2F1+0VI7DpEBhYk9VwJjJhdtqmvrLqKeTYgg+ozqwHo
	bnpml2WIzev8qqp8JfX72MDQLSvFgCDRl1CndaS7GWwAl1lIjH4G8W5L650iJnd+
	QY6YftH3Tn+69sxhcBVECnQ3bobRL+pyPXtAQI+GkVD1FDfsoseSituumCH9fT0T
	Q5UoLmyVBYo+H6XXOsTzMp4Kl3vzzFtB5Iw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp3v2h1pd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:09:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso651321a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 06:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785157788; x=1785762588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hiGV1rjiTiVgZQ+G99/XYxcVt/8kndyeA0r6zPeu0oo=;
        b=EcrB5SObUZa/KW3EOe6GLj6L3eNW/4g0aV13dhBrKftOUcaXdoYs5dqesJ/63QAVZe
         ocnew0u2t0x4TtvJOyKijoIH2Oqd/157rcIOnX6W/5OSO/9OP3u9O2j+O0dBRngumbBl
         v6CRDMmvd9S9LLaKaZYhkcxn9qyt8szIWjB2H2oDXLAT8rzEv1Pk4Q7MRwcnIs8/BeUF
         GsyZuqo7wS96E7kvaiwCuj9rwRkAorik9lmKY5ut0DqQ+/4IaC9dK13RTr577wyphmE4
         cl8asHGBhSGcfYMIrw74ed5kPC01CzwgfQmFOnjVEXgOqVISi0zl/vveMzI7y8r1gqwN
         NHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785157788; x=1785762588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hiGV1rjiTiVgZQ+G99/XYxcVt/8kndyeA0r6zPeu0oo=;
        b=VzfLweCmATy9PrGPXrEGjg+JPQCBn5FmSQ0meFZLGNHdRZEuSjStHXGxjTgp05hgPv
         eRnuL5w0mzagAseV5LMI5mjIgOBFQc7357VPyLuI2t9/sbaWiRRHgkgznwGo3KhCjBal
         QnSCyNI1hJChHY2gUiHXvu4jA2R6ei9Hx/a3ucOR7X0hR7rQf//0bfnl/FCTUUxQdxPp
         gg+bM4yNfPtvzy2pCS0/kjyp8N/LJl3qCAw79tuIMR/5vCcDooGqrdRqAmnecOYxdOvn
         nXi34Oc76KPuLsPdvGv7LFcF14EcFbvv004T7rQcqcDKLymv0V+RR9XJUQ3UzhFplV7Y
         okHA==
X-Forwarded-Encrypted: i=1; AHgh+RqeAebCs2Ndx78nCKRGKfvx0+mPRZB0BgLQI78ZLcq808swbxYEy1nkP4IsrcaA1S5r03rVf4IHKdmyV/au@vger.kernel.org
X-Gm-Message-State: AOJu0YyCZn8HlNyI5YRqTJEGPolB960jz4UMcTjsEz3YIv5TpxUQQrIN
	aLMPy8U6w/wOlL3unxIdjWTKNmIAEYaAEW2/cKvD3LP2Do15rJY4kABLcUrz5jUcWFwpzI9eL8V
	/LCnJdANpUGt/UPkDpADyFYbv6MMgWdMTaKoxVWB038/1kaA9FWWvGkUbqGc2E09nQAre
X-Gm-Gg: AR+sD13uYSK6iS6Sy9ku5zYo2RtSTtoc0Sp+Cd9khl8V3/LXad5x/tWRkSm2OChcD4W
	Q8RcwYQmdTLxd81GwD5BC6BlSsDYUhOAyNCQqtZ7OI5TJKIpuNHffKztOFel9ADAZ/axdg/2ZfS
	m0c2ODOI/CAzuBItQvEHgP3CQrxUHnJho38eAmz3EW520uJJ/Yl4+CbePMjmnP1vbI7z+NkYU0y
	Mf0GNSC2D8vbEOFDN++BXczu8/ragmUqEmRbwnYIN7hAMmPjvQXBZQdVCktnXcW5Gy5TiPU47n3
	u6XWhPJx4TDb3aD4wKdG0WyMPBcKSw6/VfwAYMel9qGCcIZKg9Q0QVVuR1UfebhkR1WeLTSc/Ig
	x+fb87XaJVRZR8p7u0nVu3maPQLMr1JHmZP2kZ8l5h4TwUsh79NG4WyExYfz8
X-Received: by 2002:a17:90b:1cc4:b0:38e:584f:2515 with SMTP id 98e67ed59e1d1-38f29641b01mr7579812a91.37.1785157788023;
        Mon, 27 Jul 2026 06:09:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1cc4:b0:38e:584f:2515 with SMTP id 98e67ed59e1d1-38f29641b01mr7579769a91.37.1785157787468;
        Mon, 27 Jul 2026 06:09:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc549cacsm32611065eec.16.2026.07.27.06.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:09:47 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] misc: fastrpc: Ignore unsolicited DSP response sentinel
Date: Mon, 27 Jul 2026 21:09:40 +0800
Message-ID: <20260727130940.577721-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEyNyBTYWx0ZWRfX5JTrHyn9wK1V
 S29Yc+ysUD7XrcbjcY/XDQrWv3/gnlsBGNQaqYS2lt2fYr2Y+cw4rNdLzGH430Z2P0k/pLgklk8
 iDYIcWd1LHvSHX2K0eUI7lQ7FAR5gAk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEyNyBTYWx0ZWRfXweTqw53TCGzf
 VkCfAveH9a0iCedYoJuAEVdUwhofEPX+if5+TD2gzfXLXKj2Ie7RosbdEisWIZPtI9Sbr9XpA0M
 RG3WPxoSBCh4YH7X0JmuLwNU0ZHFDqwgjo8x7GhB0gswFmxj5rptpt5YQc0XisMaTUdXcftuXHW
 ZMRisuy5+zo/FoDvU5diTvsiL4vqJdzdGtwH8cxtfJRprzFGr9Gn8CBmyvi4neVtCVX9hQtvbqp
 JuGZ1XaRHvjEbQzKD/CN0EESApqooHkNAEXE9xLeD4BTGyxf+P2IVLqroObHas13+6GXrKxOtlo
 Qd5QUP80RU864k37+zgQgoRm+LCkY/ZvcD8mMXm5o38Xsp1I+tlW6w0AlPqFwFDwxrP/WXq0y2Z
 V3z7pihedv1sbe9dRPpIgjaMx/AaDACOLRW7ISEwECiAVdBPGfcKOnvInxT8fm9zs/lZkZs3eb+
 URbiNkNVBN/8ZIZAeBQ==
X-Proofpoint-GUID: CPu5rmrOYil3RqdYZN08nAB3WXHTPb1a
X-Authority-Analysis: v=2.4 cv=KJ9qylFo c=1 sm=1 tr=0 ts=6a67589d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=UoDIP2kHekHfWHzSt2QA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: CPu5rmrOYil3RqdYZN08nAB3WXHTPb1a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270127

The DSP firmware on Nord targets emits an unsolicited glink message
during process teardown whose context field holds a fixed sentinel
(0xABCDABCD) rather than the context of an outstanding invocation.
fastrpc_rpmsg_callback() treats every inbound message as an invoke
response, so the sentinel is masked and shifted like any real response
((0xABCDABCD & 0xFF0) >> 4 == 188) and looked up in the channel's
context idr.

This is not merely cosmetic. In the common case idr slot 188 is empty,
the lookup fails, and the driver only logs a spurious "No context ID
matches response" error on every teardown. But the context idr is shared
by every protection domain and the listener thread on the channel and is
filled cyclically over [1, FASTRPC_CTX_MAX]. If slot 188 holds a live
context when the sentinel arrives, the sentinel's return value is written
into that unrelated in-flight invocation and it is completed early. That
is a latent, timing-dependent bug that just does not happen to trigger in
current test runs.

Drop the sentinel before it is ever turned into a context lookup.
This removes both the log spam and the mis-completion race. A genuine
response can never be masked: a real context is (idr_index << 4) | pd
(at most 0xFF3) and can never equal the sentinel.

Lemans and other targets are unaffected: their DSP firmware does not send
this message, so the new check never fires.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d86e79134c68..be9f102690f6 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -38,6 +38,15 @@
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
 #define FASTRPC_CTXID_MASK (0xFF0)
+
+/*
+ * DSP firmware on some targets (e.g. the Nord remoteproc) sends an unsolicited
+ * message during process teardown that carries this sentinel in the context
+ * field instead of the context of an outstanding invocation. It is not a
+ * response, so it must be dropped rather than matched against the context idr.
+ */
+#define FASTRPC_RSP_CTX_SENTINEL	0xABCDABCD
+
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
@@ -2552,6 +2561,14 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	if (!cctx)
 		return -ENODEV;
 
+	/*
+	 * A sentinel context marks an unsolicited message from the DSP rather
+	 * than a response to an outstanding invocation. Drop it: a real context
+	 * is (idr_index << 4) | pd and can never collide with this value.
+	 */
+	if (rsp->ctx == FASTRPC_RSP_CTX_SENTINEL)
+		return 0;
+
 	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
 
 	spin_lock_irqsave(&cctx->lock, flags);
-- 
2.43.0

