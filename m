Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47013C37AF
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 07:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785309177; cv=none; b=b/2p8M+lhK0yzx0AijpM0Q0PfAnp89kSv9bcM1bDHP1SSJy0Mcx25iG7iKbsVJgFFF7k1wJmmNalM5aaqu5LJKC5RGcN6/7WEadjNItws9T9h1AHoxTZagKZSJs/BEY4s+bE5YNtHfvoPmO91fQ14rzaYTsOOJtGgFB23x0LKro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785309177; c=relaxed/simple;
	bh=l0CeNX9dfErki8GBi2ziGIBC/5+r6EN7i1WjKu+b3iU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TlUfBwKZ4ss4ZSqU899ad3c7p8MLuPAkapTHHqSE+cDC4jYMAYRKxGH1oyx52l2tyxwMoAsj/vjE5/47KCCmHRUoXlRE5TEP0xegQIGCNDhBkxyabgmqRdDFN/SuG9vWAhHDiEjq/gJxtWSQ30//E07a1n/yQ88r36rPi2P2Q2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D55Wl4PI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hRj+l2hy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D55Wl4PI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRj+l2hy"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T4cKIZ897801
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 07:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SnloaealkmuKUdtscWJ56PcucYTV8n1BDo0
	/2qHaktA=; b=D55Wl4PIFfGlX6RZ5NPDYjWngH2/pfMHmd5XqSkIu+gB09vcCVH
	Uu9m2ObrXnGkYbosiZOx+39w0LhHpWUKXzWM+RROmcn+a9cb2TdJz4Alpxm0V2UG
	ec8lAcHfJP9tI1g5jZ6/eMVmhNvd8zeXIP7ll7Nv/INEu5tiwLWki2vCDhmqwKYu
	0+Xjrv86Ra1vI/9eAigntpWpncihhnZQ7piKlA6JY+xJ/Gam3IDcTZ765/VRnwQi
	FLCeK16+dI6hzZUYR6ZAOr8ARYhZFX3Pcsb5d0wPrhCi5COggWtc9wJFwEmnJT3K
	MHVELnXAsqu0X0w87HVZS9QVp02/5WnMlGQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqa330mx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 07:12:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa4e4684bso18617455ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 00:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785309173; x=1785913973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SnloaealkmuKUdtscWJ56PcucYTV8n1BDo0/2qHaktA=;
        b=hRj+l2hyFqafa2oFWfKw4xIDFetjLXoy6Vl6HQoj/hTalJQDy1i6BD89CZIPEAko4k
         QVNAr5dqxTeRT53CSP6VzBeOHG1GHdRPiV6ChVWBTHDW1a9M+17+mGmTeJYFJSDmuRWN
         TyvgPKmDT7VbSiQwUNcxZt39Z4U2MvpN3Z/bMlRR14Dn5T/HCsnhmIlhf7e9WZ8cjCLz
         WwnvDSlduy3tCLycKpEwCm6LU1DVshI7BDgozJvBAAI3AIFox1BB5etdd64/KH2/U8WR
         DM+bM1fPRXW2sblNDWhqSxiD9iDTMHc315FtDE+LQ8hLGY4Dd17xXS6uc3a6ROJSUj7a
         FXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785309173; x=1785913973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SnloaealkmuKUdtscWJ56PcucYTV8n1BDo0/2qHaktA=;
        b=aqEGCrkhdtVtvZn5mgvV2RPeaUsC4qSzJmQtQQeTs//SYh4Cd8ZxN3AQySBzdGIEVO
         QKQA5QeAeKttNxTwrQ8lHxKylxlOmEYwlsfgqltGpYH0EvPKtkG9j6ACqFGoPMVaeOaV
         DdxHWe36OMGUA4sFyZzArO/yJ1rZtSuyrkgwRkIlEndz4Jn3ziJB4aVQoUn2/VsCZPvS
         C75IuA5n/LUSU/hS3b/+Fe9/ELuq+kHWgbLxX5rU5SMtptEH2JY8VUD/DJ5KgnYzyP65
         AC5ZV/ayEie92SVVD83vJmPZPCHs7GkMuY37Di7+bBoQxma7QFuGuWVuMvTEKkf2Ul46
         6PRg==
X-Forwarded-Encrypted: i=1; AHgh+RpU/feo7+mj6B8zMoDPgi8gXElY3vHMhrz4kx0/xDLCJ8W1m10Q6Wh1mQoLyfSJFenU5KP8Dl88XD+05Tpa@vger.kernel.org
X-Gm-Message-State: AOJu0YyoyBNNimsKCbwJQ9xQ9HxBNm1ogMDlVQn9Jvh2fnug3nSW7w9N
	bIjpZxwRHvNsxTTw2X3p4kQl/OjHIBSZbAlt5GKUfTEUuK6+BwAtk+9ZFzRbcyDCtSMytLcBRsJ
	7RYf8k0vD46jJn8QIpqyXsqgZhtrAiRk5G5rgk2IgTFFcDIa85B6CGxrVeRqcywAVmcBG
X-Gm-Gg: AR+sD10Fmvaz1IOR0Yy9OAqfP1S8S/lk9Y/BfEXpUxvVKZdiRcjMTSJYpNDFBlfVirI
	XnXob45/8gGcF9OdDiv3vWPqUTJj/KZ0SuCJFhshtwQEOYixehu0RMiBp9ZaFJ9HuP3BgIK0r91
	UxGWeCfAWFCtvI8F+OU0Vlnyu6f0+ULFUHWFaCYop4hBI3T2oCQ2zQSqylpTRYIeSZ66M+3VaIT
	Qd+KbKuRSp72J8qc+osW0dXyejuYtPkuUJEGhFuPMaezPVrQ7toCkYa7XFtxaM+fAICNGy+RK8E
	3WyRW++SZ0dtrGI1++fnKk9NfmjbSbyHSzqRSAWT4IuQPvQpT1shTyCi6KfbgwUt/yzE0xHNoNK
	tU/LOSk7uUNFl4o/OtdZ/fmTpCqKWl607+PDJw+SjpYN2jIztvTMm50cS3F7l
X-Received: by 2002:a17:903:11c3:b0:2ca:b89:7bcf with SMTP id d9443c01a7336-2d015f00e62mr57224585ad.22.1785309173320;
        Wed, 29 Jul 2026 00:12:53 -0700 (PDT)
X-Received: by 2002:a17:903:11c3:b0:2ca:b89:7bcf with SMTP id d9443c01a7336-2d015f00e62mr57224315ad.22.1785309172870;
        Wed, 29 Jul 2026 00:12:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bc8400sm6719185ad.47.2026.07.29.00.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:12:52 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 RESEND] misc: fastrpc: Drop unhandled DSP PD exit notification
Date: Wed, 29 Jul 2026 15:12:35 +0800
Message-ID: <20260729071235.946502-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA1NyBTYWx0ZWRfX0RnKtwATYtVI
 ct03jzvhj6tvxp29KNGYhwZCgWgQQ0locRwayVIcwJdci5doRcS2K4abXEE1y/kp66ruvBvxv+R
 IB9jTFcHVTBPshiHfq6HNX5lSlaARO7eP+uxtFPG4eYW417Qmw+1qx8H8pXThc39JDurVLbPT3i
 WAiT1hqr1lgAAbHK8HImVhGJdjxDfPr6vOC66S2gtT+T2NHYOYJcQSUTyECSV41ZfTtW8yQdzjq
 aRRPPnkrc+NiwpkCA2vgRM3KmZAU3j+eiMUBfYUsEiILqTpbUuqfGiD/ITTDmBRtJ2kTVrjnW2a
 LKKQzcbuc49qZlW8ay/zVeqCKA+fKW3tkxFwsO2fYxkthsljmHA0D5WW5qdGem5mYqRa2Do93l1
 BJKW7Ua0Dn55LygS+ktCTGayST0aK4SiIOqcU4z3a+qIJxlrue3zxxHvv2XujtVGvdZ7UUR/GmA
 ThCYcbNDV7QfuGEZ32A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA1NyBTYWx0ZWRfX8jL9AJ3NK0aR
 Ltnpke8HILFHN6wUAtxf5n95h/RGNrsnQLKuYDv6yK6UmWriQX6fBchvv9LcPpaKJbIwFr1nj6r
 k+SgX6pw3MfhLm4XZLXDGPCr30+5CkA=
X-Proofpoint-ORIG-GUID: ViBTkjfQPwdOSVpQdN06FdF08ojavP7M
X-Authority-Analysis: v=2.4 cv=Ap/eGu9P c=1 sm=1 tr=0 ts=6a69a7f6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=G6LYrpz0uQ56CJO9uQMA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ViBTkjfQPwdOSVpQdN06FdF08ojavP7M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290057

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
Resend by rebasing on Srini's fastrpc for-next branch

Changes for v2:
- Update per Ekansh's input about PD state notification (Thanks Ekansh!)
- Link to v1: https://lore.kernel.org/all/20260727130940.577721-1-shengchao.guo@oss.qualcomm.com/

 drivers/misc/fastrpc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index a859edb75499..dd51d475a74e 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -51,6 +51,17 @@
 /* Sequence number occupies bits 63:16 of the ctxid / message context */
 #define FASTRPC_CTXID_SEQ_SHIFT	16
 #define FASTRPC_CTXID_SEQ_MASK	GENMASK_ULL(63, 16)
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
@@ -2710,6 +2721,14 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
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
 	ctxid = FIELD_GET(FASTRPC_CTXID_MASK, rsp->ctx);
 
 	spin_lock_irqsave(&cctx->lock, flags);
-- 
2.43.0

