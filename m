Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832B33A759C
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785392557; cv=none; b=Ayh1H8zJYrSm9lZjjhurFYtDSddiL0QCQUtbjtQEWi7hUHtyiLIu4bsSC/MLu+m2GsKpKt45SeR2Dy6h8MISLfP1QHhfbrPrMbnalTMoBAdiVDF2LjqRMP3nz0GGhDPBMhSm3cIwZDTDaaWCWsOf0A+dHtisuZfxchHncTqkWUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785392557; c=relaxed/simple;
	bh=PfjvogKB/NYHnofS01o6t7oVIvnH2r1xqmTJ590ZdOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bX+YdQL6jCrAUN8drVWJ7ZZ12r1z2LF0qd4nKYsduPGHSWBXO5XKpqHQ64P2iAdkT4OPrO2ZtP/J+hCd7CPKFXqrnGrXwz78mB9mbx3vOEKtqILgTaQGV+U7qaDGT0Y4+PcC8wO2jGG79eYUYtv4nwtQ82j808+O4ign8e3VuOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PkjEzmZ4; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PkjEzmZ4"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cacf197759so26993465ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 23:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785392552; x=1785997352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6BV+RTasTrqeP1Jp4o3Adp3Dn5TZT1GiHMHkH/KgnOc=;
        b=PkjEzmZ4x9diuilIwW+CKTCTuPpe+MN/fILS4oHFXa6n4KVJZDv5VxylgIeNTq00NF
         KgmZXWDEdj2LF1FIxJA+BB7gDCVbsZr1dyXas8rJ9lO6KSC2nRGLTXPCqV7Mfj6rKcjm
         yxk45sgPfrk57BHuRjkmxpUHmAwhVZht1razRvxsYKVLhdSuqpP+W7cjkdNwcfNJLh1c
         lwZyVbsjFUm8vaQTkz533yAe0JwkEc1PKMjDBZzvLLRi7BxrwfZscWOiI9rfHKAW/U8l
         6nNwaJS4GGVGDFksDZzQrf3LaKlUjQE+DJdP9muu4TZhVscxq/0opfheaDdYcmcuSUR/
         4zxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785392552; x=1785997352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6BV+RTasTrqeP1Jp4o3Adp3Dn5TZT1GiHMHkH/KgnOc=;
        b=LClpvDQYQq43Ks+MLrZUYMyU1Q+HLP1n8RRBl9QZTCGTNZYoJ4/f3uqs7NblqmsV1b
         3pqFJ+3KYXp+d4rY1cQ8t4ZIobUkA7Fhidc1gkl7BhA0RrfbA1zNv7i9SwoSDtf0RqST
         GUSDof5jIXD5juIxzXRrtpYW8yfFux3P5JNySanxONqhjiSvOODK89hRXHEORM/NUpAY
         gyOFHSAWxaaNB2Ukn8SQ6SkmPqNSi8405KAxTlwV2kEcqskdhMgTo1jHBmiBiOfkeJko
         DnqAeOBHQv4mxX5aQNDUDe2vUrDnsCRQNrXdktJUjQ55A7sUqQnOPBhkkAoEERB6wSZ0
         NhiQ==
X-Gm-Message-State: AOJu0Yx8mwOYsZqcNhU4962RBbHRrgFmyyDAy1FfWZV8h+WMfHh9gZWZ
	u8qbm0whAXpUPk4G9I18QBofBF7eTGFvuritQLotSi590aql0Yq4+vTx
X-Gm-Gg: AR+sD12evaAErPRS4PX0/kTJX1KeUy5+hq6VBEzCwnEFdAm+WBbZ8IUBun9oVl/eNCH
	pjhHqrteOXuzifSDw+XFj1c1OWVzuL/x01PHq1oMPtzV+31qSF4zO5dlZUWP4CKR/0nxrsYpwIg
	pxgK6CKzk2B/zZ9h7jxMPvQcf5RyQuMqBs1X40YbOaE34KWRs+/YYQBZ0i/3AkAjjd9QHTF8zyo
	R5rrK6a20uyGM3e4hVyVXM/N+fqXHBFV/MHdUfxtBat+eyhUKhQvGWijM+EnTIrIdQ+yo/js2ld
	9n7kp0N5cxDRpMyAyirkd+Zt+QnbE8X8xGQ9kpdwFY2+lwK0BimwI1aj57RFQUNIkOg1zO2TXDA
	jB9Q+yr8a6sdsSI9588HDF7eGQcBxn6hh13B/V63Lwdngxu2wlc51K2jXyGp4pAnLst/+Pilr0c
	QJY8lSUBQHyZstyVf9NP7QnplrFtJYyBiOBgjfUdk+yWtcCRIPJr+WEEvr/swNlIK4PcIzrkp6F
	vnggYCch9qjBrV910P+wc0jEK2x0MaBDvK2UNEhoSHcKa96TlUghUE0pXsbScos
X-Received: by 2002:a17:902:e946:b0:2ca:6d87:cda0 with SMTP id d9443c01a7336-2d035b9ad22mr14382925ad.6.1785392552424;
        Wed, 29 Jul 2026 23:22:32 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a151fbsm20950225ad.10.2026.07.29.23.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 23:22:31 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] tee: qcomtee: user: check the parameter count from the supplicant
Date: Thu, 30 Jul 2026 15:22:19 +0900
Message-ID: <20260730062219.2836938-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The qcomtee_cb_params_to_args() walks the argument array QTEE asked for and
indexes the parameter array the supplicant supplied, but it never looks at
num_params. A supplicant that answers TEE_IOC_SUPPL_SEND with fewer
parameters than the request needs makes that walk read past the end of the
allocation.

To fix this, reject a response that is too short, the way ureq_select()
already does for the receive direction.

Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
Assisted-by: Claude:claude-opus-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 drivers/tee/qcomtee/user_obj.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/tee/qcomtee/user_obj.c b/drivers/tee/qcomtee/user_obj.c
index 10452fcc7ccb..2a594ae299da 100644
--- a/drivers/tee/qcomtee/user_obj.c
+++ b/drivers/tee/qcomtee/user_obj.c
@@ -507,6 +507,10 @@ static int qcomtee_cb_params_to_args(struct qcomtee_arg *u,
 {
 	int i;
 
+	/* Supplicant can not send fewer parameters than requested. */
+	if (num_params < qcomtee_args_len(u))
+		return -EINVAL;
+
 	qcomtee_arg_for_each(i, u) {
 		switch (u[i].type) {
 		case QCOMTEE_ARG_TYPE_IB:
-- 
2.43.0

