Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EAA3D9046
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785224366; cv=none; b=ZguEwQrUiSs/aHGdafQ3mTTuWWZzcTA1wHLrJovOzVsxhUOICdS5HpWqfem4RXqU41k5VU+C8wWq/oUI5GXa0oGIbEaJUIDbpHMo3drnNxQsoBBG6cRAXNzhy9sls9BHmCUBqRE/lZdvj2jIIFYMymX3TYfwrP8ELg2YYYiU2Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785224366; c=relaxed/simple;
	bh=eeHFwRASpCUwevZrA8b/W5GuX5KTOGvgRwsas0V8Uwg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UziFVzj88TmH5HOWVSS8iXANRnkB2HvkWFfTSHskJf1JHQ+ko7k+OVhXBucoqdwUxE8VprByAz0OGKrAtw0bg2thbSVEHfml+2+S/yrudrdSlHU9GhtrpmRbIm3Zsl3KTIA7GMA3X3sQjdDCpmt4iEnSz/QsjQ+usc6e2S2M7J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O8SPRHGS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gf4ftxsN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O8SPRHGS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gf4ftxsN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3akms2693071
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=b7ykTAQzF/9shSFaKwSl1cQA3MvJJh+AbxX
	2Guk3G5o=; b=O8SPRHGS8fZhRHZRQF+sszQr1uo6PWwmAd+qEYvwkZyqWMrmXPk
	T8k0w7TS/y+4jYvgpTl7HeHAF+hRH5n4MHZXtFsdVcAj2d+urdgZ0vF7zyuLI1O4
	oSxt5DSnF1/bHs4mWtKmT4TgUrRcNkQp+itID9MDYAmUfu19r81QP3/9YHIOoxUc
	11Q0gW3tndvn+gaPJoURGpkFflKP7vb4DRN9VA75zSaVGtH/rpJ2ynLNi6PuSvH/
	nDL9jZXzWexZFK2lEy344dWpQenA0PaJkl9iMSBjMUIndowtdgVU4dHMSjEl1/3d
	3tXZIfu9Hblgi/gBdkxfAzawCk7xsNHiq4Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp5k3tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:39:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8484b9fb055so7901169b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 00:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785224363; x=1785829163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b7ykTAQzF/9shSFaKwSl1cQA3MvJJh+AbxX2Guk3G5o=;
        b=gf4ftxsNPZlg3qwVTHVKmtDxMEAj/T+LycuMfOUtC1hm4kDRkYVrpSzsx5pKl6e4Cs
         LQYvbb1BYMbwwRN69+U0aCZptvsVDDqk888R9Rc3Jy+BoIK+Un9n2dqmxyZGYMO8Pghb
         tcaipgYLVlcJE/xz68jDsGfTXlMY3QHEHCTjFZdSCWQsSFDcpGaz0MSEgEQc7v5rEYbG
         o4sJJi8l6/2JzW+1wu/S5/ioL1qmxOvKCDzgNDotGS2KYOy12N3N9MIvoU/qn35N/xu7
         nxW7bTkV2XV6JV61nk1t4SueRA6WbfgXqkQw97epNq8wefW9r2CbwfLn6Q40l95BF1kq
         ayQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785224363; x=1785829163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b7ykTAQzF/9shSFaKwSl1cQA3MvJJh+AbxX2Guk3G5o=;
        b=KxnmQgHtU4Ku3LF/Yi1mT30b0UWlxjy1d/965SoOz4LsUNPaO3C4sQKp03n9dMQcwL
         UYYNAgepOewfsUFSZ8ylmmY0IKijXQ5mxu1tVWIMQbC9sDqnZFdGMlwH0N/uw8BYssTi
         jzPaf0vuUZu9OuyLjylx08LCXI+OEw/cA07/skOl1QX1TSBQDa/XbBznyf+l7O5HSWKj
         p2KYh/FO5ZnbsA6SNR7DrCeZENzdxv5TZIXEnwK/Q/3omZxQjtW/tE3xd1be669B4ey6
         LPg6wNyrXBzxUkA/7WX4YrsLpUGo1oEqEDBLTkVhPcjAnU56/JAy1rgsQAbzc5f+dWJu
         aBIg==
X-Forwarded-Encrypted: i=1; AHgh+Rq66wqMbl06LZCZTdm/XX8ze2RUP25Ulxqxn3C9M4MKIpvFZHQAhW0LdiplihecytsYitLylDcObLjDKZeD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6o/jOXiVkepE8OSWk+qtjAMs/1/8a4nxi3DYVbVjGmd8NzYup
	H+ehYGrXYRdYedKEvFPtl4BhGaZUGkyUmyTKnUoOQb0slf6sm5Wks58rtxJmgPhdq4+EwXpT4kb
	Y6uLDyB6dAUJK/vBTxp0XkwHJNjiHtu79UZvSPZF2io9JuYrQbXghvmRsvMU6z05yqQYw
X-Gm-Gg: AR+sD12XKfC4dZhViC9A2dv3PqWfnf18B+277A+Bdb/0ghFIbiNpcWQi96286x8l6i7
	azFnyI8H2FLBZYTumMPBvTd/rRnuK9Djf4yApdhvaTd2hGO7JbAi8FBNNbeh9esBGAuVKo9V7hz
	bVEBK26AgErWm82vUhxXm4ZQ1SsWr52TVE11i9CAbpmoy8b/TbErHe0yZNJadUcz0qS4LW/vdDI
	uDo14hfLxl/MzaK4co3MSyu/vrUWZNC1gO5yRrPLvK8RcIYehTMc8y2KK+1nmadeqo5Mq7UDjKr
	HfPggMoHuQC5WWPaB8QnYKiz34khbIwb8ao21wGqubEiRUZ5zZSZ9LJHIRfnT2lZlKJ/RbAWQdX
	QXO9xSFsbC/1ATcWk413+keO1fGcLaSs9MQCN22B6AQdXLwUbW8i1MQfgmr7N
X-Received: by 2002:a05:6a00:9093:b0:848:56d4:3288 with SMTP id d2e1a72fcca58-84e931b4f60mr1440138b3a.4.1785224363496;
        Tue, 28 Jul 2026 00:39:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:9093:b0:848:56d4:3288 with SMTP id d2e1a72fcca58-84e931b4f60mr1440111b3a.4.1785224363029;
        Tue, 28 Jul 2026 00:39:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53425989sm4024164b3a.48.2026.07.28.00.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 00:39:22 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] misc: fastrpc: Drop unhandled DSP PD exit notification
Date: Tue, 28 Jul 2026 15:38:51 +0800
Message-ID: <20260728073851.682023-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2NCBTYWx0ZWRfXx+2V7vUF9h20
 aoTVvXz3MExtYZvlONlUPVNm4sOXZQpDDQPjXesYvgNygZTIzhJ0IZonOi2JeWR6i/FoXqJlCYd
 JrfOfApByiRpa8qitfcFApEXlmTMtGU=
X-Authority-Analysis: v=2.4 cv=XuDK/1F9 c=1 sm=1 tr=0 ts=6a685cac cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=G6LYrpz0uQ56CJO9uQMA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2NCBTYWx0ZWRfX+Mkrn74luc9h
 dugjvlbmp+rTVGWdUXnCcw+/JkYBxWQN3cWnHoQcEv2BekO+eXuP4DGyxGg6hZ2WwlVqXN8rOB9
 I3wl+MDQvIaAf3ht1N9YihivA9Qreg5UG6Wincl4vzilhfDW4Be5vXK+qpY2FjDWXBvmrVkIXL3
 z3ic7tCFdHYilQfHCPVPjpkdWvTKxTChE4Fd17zStUGMpG7Z5Ao4e4Ud157Dw09mPZJmJKYPip3
 J1w4o+L3m7Da1OEmqhJNg9uOL82/2L53/kgy9M9RZdwOWmq8PK4PBZmmLT8riBnSdq8+ox24JAD
 SHvf0wUTGf9t/W044f4BrCkfaLCLGuYxbeebSNcq7wwuD9FuZJSggzYCQQXSHTbNbtlNJ8FaAgJ
 /mYdWdNobtppwkjzDswfSDCHVm6Qd7pYA/0w4mq3QnOcWDvlfiyP49OpMRhE5NMIpOhRibcT0s0
 SbQv20KvG2Yg/WWrDzA==
X-Proofpoint-ORIG-GUID: HkHF0R-rsiFzcG-xGJ-1maf6gJjqLU-S
X-Proofpoint-GUID: HkHF0R-rsiFzcG-xGJ-1maf6gJjqLU-S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280064

Newer DSP firmware implements a PD (Protection Domain) notification
framework that sends PD state notifications upon request. The PD exit
notification is unconditionally sent by the DSP with a fixed sentinel
0xABCDABCD in the context field.

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
into that unrelated in-flight invocation and it is completed early.

Since neither the fastrpc library nor the driver supports the DSP PD
notification framework, it is safe to drop the PD exit notification
before it is ever turned into a context lookup. This removes both the
log spam and the mis-completion race. A genuine response can never be
masked: a real context is (idr_index << 4) | pd (at most 0xFF3) and
can never equal the sentinel.

Assisted-by: Claude:claude-opus-4-8
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v2:
- Update per Ekansh's input about PD state notification (Thanks Ekansh!)
- Link to v1: https://lore.kernel.org/all/20260727130940.577721-1-shengchao.guo@oss.qualcomm.com/

 drivers/misc/fastrpc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d86e79134c68..97c60271f94a 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -38,6 +38,17 @@
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
 #define FASTRPC_CTXID_MASK (0xFF0)
+
+/*
+ * Newer DSP firmware implements a PD (Protection Domain) notification
+ * framework that sends PD state notifications upon request. The PD exit
+ * notification is unconditionally sent by the DSP with this fixed sentinel
+ * in the context field rather than the context of an outstanding invocation.
+ * Since the fastrpc driver does not support the DSP PD notification framework,
+ * this message must be dropped rather than matched against the context idr.
+ */
+#define FASTRPC_DSP_PD_NOTIFY_CTX	0xABCDABCD
+
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
@@ -2552,6 +2563,14 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	if (!cctx)
 		return -ENODEV;
 
+	/*
+	 * A PD exit notification from the DSP PD notification framework carries
+	 * this sentinel rather than a real context. Drop it: a real context is
+	 * (idr_index << 4) | pd and can never collide with this value.
+	 */
+	if (rsp->ctx == FASTRPC_DSP_PD_NOTIFY_CTX)
+		return 0;
+
 	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
 
 	spin_lock_irqsave(&cctx->lock, flags);
-- 
2.43.0

