Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621C035CB87
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 05:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787288609; cv=none; b=tU6O5kgo1FdB3TXn/SlUk57Jhx0MAOqoxttOSPwEqc2+7EUjjK6e8s1Knh3OcUG1aV8Ye+F01opXrtnEeKioEY78+EQIa6V0WXCqztg399Ivm1MkoGPkuD8b3RnsSMPWdSeOJf+EIgGCX8sa1IHsB3lspoZdzknFCr87qS8YEq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787288609; c=relaxed/simple;
	bh=CkFcnYrJr4cU+t0pt8E/I5SSVnxKOnIqrTf+yKl113I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c41zpe3Ik0J4Wsa6afqP7diAQmShgfIuHqcftbfwJAQdLmuXUU1oWi+DYzyCfaccVQ2UsbQPdYd5rQxK3Fu4PdvAHZAiwGTvM+vp4qOijEL3gQohJuR/zaH5jOFDUMnDVbxr4IvtTqv5MsIIQfbit2ZWEUoKm4WuNCXerC3LVCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxyjvDW+; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxyjvDW+"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9e7391839cso629702a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 22:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787288606; x=1787893406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FAQIFeKdsDioxUGJtAjD1TEqdlw3Fo0BSbJ+hyxm5bA=;
        b=DxyjvDW+Ktl7vjxIA1W4M+tbQG+9bcay+ylkQBFk5so2jkmdWttnmr1LMj4M1XphNk
         m4YsBQBw7o2mWFNqhmwlHmW+sFTxGLF2/sfSfFQbC3Sim8kQwsrbVPcedmj8Q1hu5rFj
         h9yQP3jHHfdWuu8wDJI1Ceqqzfy2UNsRWVcx4BmzxLQU0B+u669IgRJu+hNnHxMsbpW/
         Su56HNohhfecj18ly3FYKKTYcwWnjHrE8RVqs3vO3Hd5JuoPJAkfxCRiRkssO+fBc6Ht
         jB8D+glBeJe9effBB2PyRGx+9z6yF+o1IM+yHjaBxLPB7BqYnQTrm8gRnR56REIuRKz5
         fDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787288606; x=1787893406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FAQIFeKdsDioxUGJtAjD1TEqdlw3Fo0BSbJ+hyxm5bA=;
        b=Y7C7y9qYPNWb3tuSMVWEMm6TuCHgRGFdoMMTQ3jMK/xqDXB9Yx53axMkIk81pjIle5
         MwJdfgWfc3Buv5UVIw/VaL/DNe5jlNEbcBqWcBEqX6+6roPgqTWZIS5koJp1L+bF0VgX
         ztz+vp6/BzsVwXGWUWVF7x3cTl3vrJgdM/ohwAjtmYmBNJE6YjJmnFWk79TMGluDbz+F
         +m5am0SKGXn+2xUMD3/FNs9/oo6Ti8iWtY1d96Ju8uxOxyBbbsBrYwrW5OtDKi6zXwbV
         6fvoNq7U8nSlNrWc7lmnGApsaXkcw4c3lNDSnqUElAid2bMQ0whIrihNPuoW/mCQxi2s
         ZKzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5ShaQ+81Vn2qVDd/1rIRjGIdvJMGSPhIQ1gXLVV365wuM6Cj0bC4JGbsDHGVCr6vdhdZ82+z08L0605HD@vger.kernel.org
X-Gm-Message-State: AFuF++mIdZS9q+70I6NAjQz1lxfKii+XWFMgl4EjeQYx2lajimBbeIJk
	E12b77jhMyTVoMP68LhvNcXocGeF8M67Ny/ID7GkT/6HS7hzwCiGHopX
X-Gm-Gg: AR+sD13oTpQvc3cZa892N+mQJAR+9mYwAWX3P4xWBQt62PEBWApmR5CewmKZ9JrLzk0
	4LShgYCXSRfqteXfPYxp0cELKhiCD7pypQlP7R7oGyVmaJS4fp49IsJGTPnV7rM+hAH8HSpDQHd
	HNdDviKb4TTZGU9NulXcYlwwWkUG8nToE7u+Q6Q1XulconoqDsF+DOt/v/Xd5DJ74PooLfKd7rr
	4ckO2x1wPTyQuaLeM9Jr/vbIBdhVW7kbkRtRWuJ/ePcn3FJth5ucv3nF2o9dvgfL+gYbwUmW42+
	CfQV65uaDmFwZjpkZYDHmVg6h4GbXt0sTuNysjfdwg8m2ZmoJdSYYGI244V/Y2V2JpPIGj5i2/2
	io9ACWN5HqX/e5WSTMhCGqoNJ5HzwxAxmEJ9P1dyGmLIA293H78zJWSwUAAK2h99Tw2EHcuYq/3
	6IL1Gb2cAMXIDXbmsE5TTjPlPrDiL1DqsqZkX/KcedViw59XDHtOv9e8jabA+Reg==
X-Received: by 2002:a17:90b:54d0:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-395c35188fcmr7567404a91.1.1787288605580;
        Thu, 20 Aug 2026 22:03:25 -0700 (PDT)
Received: from kdev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4baa594sm1511835a91.17.2026.08.20.22.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 22:03:24 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Jens Wiklander <jenswi@kernel.org>
Cc: Sumit Garg <sumit.garg@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH v2] tee: qcomtee: fix kernel-doc warnings
Date: Fri, 21 Aug 2026 05:03:23 +0000
Message-ID: <20260821050323.7-1-bbnpreetsingh@gmail.com>
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

Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-5 [kernel-doc]
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
v2:
- add the Fixes tag Jens asked for; no code changes
- pick up Amirreza's Reviewed-by

v1: https://lore.kernel.org/all/20260802003956.7-1-bbnpreetsingh@gmail.com/

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

base-commit: 2d2338c93da79b3bfe4b6099a931d9468d539952
-- 
2.43.0

