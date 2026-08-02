Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94902AD3C
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Aug 2026 00:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785631200; cv=none; b=HAOaOb5nE/FXGOf2lDfI2hfF0AXJ21Osp62mJp4oK61MkBXAHCxAJVts3n+jnxuytZNkJ9FRdhm4AXekJ12idvhvI1BXw+U7ejNo+jsqsci/hreZ2SkRZoaA3I0kuY3qKsD02gMQqw+sob99I2sjzZZk/YOlqmSfqt65IEFZFDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785631200; c=relaxed/simple;
	bh=449lDFTYzu1UCs6iHsDTtTk7jZN1jRYhqSaglmIMgRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=png7JK9m/cQIFSxV/Wqtiyd5Ke1i8o7T+U+KpgBBBbJ0Htuka3RkE/rhHuuk2GuvPJamDg2Ubh27nbzEO4raRvb2ZVoAEqyDSn6Nx8C4rBBszGf46bXhY8oELkwhK8xtyge1d/pXUU3/BueOhETP1v7s1mG8Ar6/sGNwR12VvnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s4/G2Fg3; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s4/G2Fg3"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38101f85591so2462222a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 17:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785631198; x=1786235998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VqnWyY0IoOHm0/Ecjq9A3hxNF1K5JS+wTtKYz611nCM=;
        b=s4/G2Fg3vTcoC8VrAxLkadtZ4T0HNEgy95RoX9kb2EWIRCbRQQEajeDdCvhTmfao6E
         MpbCSCiKhRJi9C1VNN9e0hm7+IS8SKZz7leED1p/fb3knJamjZQAd15aUXuUekmYJxzD
         p8R8C0zqBrUAYS3+g40I8H+839oD1Vd5QUHqvUY0wbGhdJOHPkB63WwaBSonv6KQCGhq
         6q9AD753huIqxOMhSDpxaBa92YCmqyqPyIbFLsmNZGWAHM5GDgJhG2K3NiDLbMjOnkwm
         7oxp3Lzt5Mwj/fjRUgtEJ6nlgSK0Psmjscjsp6SEHGMp1YArXfalzk1xHFvjFMReCcby
         0Yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785631198; x=1786235998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VqnWyY0IoOHm0/Ecjq9A3hxNF1K5JS+wTtKYz611nCM=;
        b=oaYAkC8LbBMw93WLJnfEJtTS9e7sFyOHgqIxnmsip8euvME9fdOqHnRl62rJFU53+7
         eM7g76xvinY3kfsYDiPUBEOUmNteMHsgp76f47UAec6QXvkgwsz+d2PpxcHVxH91bO/T
         V60CPguOI5EiYJmoZE3zUQ1oeC4y4qLBCGBOjonYk2JEx49uXqUFfsqT4AXVAnkKgpf1
         uqxD2mZ51dRmIiGsm60eMCcBJftLrDiYJJbLMPLXar/UqOLELJYWjhvyoTTFNcEGCpdE
         wtOzZ/sANNO6p/C0H2IoYjWoFu95KK+qUoe5mqnzitlYcfuRmX1UARkDqHwOVGe/Fk9x
         eBhA==
X-Forwarded-Encrypted: i=1; AHgh+RpKH22aUN676AUetZ+c1elPYooMGuBVDMUpStNFRq/l+gVks9Kf25VBdaH9L9lbHa3bJjrGFmAnoCyV9J/y@vger.kernel.org
X-Gm-Message-State: AOJu0YznJXMDr9jBmzxzRHm2KKB++lD3K5jgMFYYUb3nb20uv3fNrn8R
	3k4EOedI94RhOhwybGe/U2ndlVhc5OLriOcWqTkzuKnSMzLng5S3QHwlNPeRspWBfcw=
X-Gm-Gg: AR+sD13E7jvMEs3B6drXZsCXhMxD9UpMsMM2/dvXT27pQfwMLeEOu07N+pxp5YuUmsB
	PVM/hifskMiTEw0vB/25Z4sDuJ6TA2T9/rOlaqf5VCMGWMGTheu+UNd/juDchSDr0cQHiI1TacJ
	jOq+R4XXv5J+BLQM7yARL2DLowkKohXxSk22bhlnAZJxP3hcsODmAXU3exIsgTfU1h6cFMRUk1Y
	x+Uv31OMDQfR9FCJQw9oVz8qmUVpINgGjghHyiE1Vg7LkNCYagWWRMoCGmvFDSfbV4HfPFuwW+l
	UaaufqmtZev9euMVnNO3hk5gs7X6RUL9WLr/9sbuf4J7cELAi8QrQoxPQm9OI0jEOZpNgfDnNfw
	2Zyc95895+scE0aUvkh8EsFwOhiCRc1J6nJXpT3d5e6JJruLWEW1PMuh7drCih7nnMgcdoRKFic
	pM6W45PCG5YYMJHXeW/AnBOmF4JB2JGbqdg5BHs5/cSn7RyWfqOB8viZzaO9tz
X-Received: by 2002:a17:90b:5823:b0:38f:1a29:7a82 with SMTP id 98e67ed59e1d1-38fbca2363emr3552882a91.6.1785631197798;
        Sat, 01 Aug 2026 17:39:57 -0700 (PDT)
Received: from kdev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2f657a1sm2318904a91.7.2026.08.01.17.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 17:39:57 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Jens Wiklander <jenswi@kernel.org>
Cc: Sumit Garg <sumit.garg@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH] tee: qcomtee: fix kernel-doc warnings
Date: Sun,  2 Aug 2026 00:39:56 +0000
Message-ID: <20260802003956.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix kernel-doc issues present since the driver was added in commit
d6e290837e50 ("tee: add Qualcomm TEE driver"):

- async_release() documents its second parameter as @msg, but the
  parameter is named async_msg (msg is a local variable);
- struct qcomtee_msg_object_invoke documents member @ctx, but the
  member is named cxt;
- enum qcomtee_arg_type leaves QCOMTEE_ARG_TYPE_NR undescribed.

The cxt spelling is part of the QTEE message format and is used
throughout the driver; struct qcomtee_msg_callback in the same header
already documents it as @cxt, so the comment is corrected rather than
the member.

No functional changes.

Assisted-by: Claude:claude-opus-5 [kernel-doc]
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 drivers/tee/qcomtee/async.c          | 4 ++--
 drivers/tee/qcomtee/qcomtee_msg.h    | 2 +-
 drivers/tee/qcomtee/qcomtee_object.h | 1 +
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/tee/qcomtee/async.c b/drivers/tee/qcomtee/async.c
index 31bff4309e672..5849e51612033 100644
--- a/drivers/tee/qcomtee/async.c
+++ b/drivers/tee/qcomtee/async.c
@@ -97,10 +97,10 @@ static void qcomtee_get_async_buffer(struct qcomtee_object_invoke_ctx *oic,
 /**
  * async_release() - Process QTEE async release requests.
  * @oic: context used for the current invocation.
- * @msg: async message for object release.
+ * @async_msg: async message for object release.
  * @size: size of the async buffer available.
  *
- * Return: Size of the outbound buffer used when processing @msg.
+ * Return: Size of the outbound buffer used when processing @async_msg.
  */
 static size_t async_release(struct qcomtee_object_invoke_ctx *oic,
 			    struct qcomtee_async_msg_hdr *async_msg,
diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/qcomtee_msg.h
index 878f70178a5b6..5d7b21fdd3688 100644
--- a/drivers/tee/qcomtee/qcomtee_msg.h
+++ b/drivers/tee/qcomtee/qcomtee_msg.h
@@ -112,7 +112,7 @@ union qcomtee_msg_arg {
 
 /**
  * struct qcomtee_msg_object_invoke - Direct object invocation message.
- * @ctx: object ID hosted in QTEE.
+ * @cxt: object ID hosted in QTEE.
  * @op: operation for the object.
  * @counts: number of different types of arguments in @args.
  * @args: array of arguments.
diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
index 8b4401ecad48c..d5de02dcef3b9 100644
--- a/drivers/tee/qcomtee/qcomtee_object.h
+++ b/drivers/tee/qcomtee/qcomtee_object.h
@@ -74,6 +74,7 @@ enum qcomtee_object_type {
  * @QCOMTEE_ARG_TYPE_OO: output object (OO).
  * @QCOMTEE_ARG_TYPE_IB: input buffer (IB).
  * @QCOMTEE_ARG_TYPE_IO: input object (IO).
+ * @QCOMTEE_ARG_TYPE_NR: number of argument types.
  *
  * Use the invalid type to specify the end of the argument array.
  */
-- 
2.43.0

