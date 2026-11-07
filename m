Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010869;
	b=BDFhuqFk+fO2GiEWP5GQFZsipYEB/eHDVQ+7bY41jKbNHl32mGIIPel1s/6KpHfQ55g3
	 TFxVykUCiko5CT1xEWykWBv46FNeCto0GqbuYHnxAN5FZX84SoNN/KJdSVIcSRmdg9t3P
	 4omJ+ty865E0TNKaGw/NWA0yDrDdVeffIEccbyktoGxPFC6jQLP2Ah/qxzIa6KSlCUB1l
	 qZDF8tgg297l588KZzBYQEgCGzpv0vO78SNTZHo1tepi7CA1K0eI94KORRdQeRXVMEMkr
	 UmEOhFj/CeR3RMEYutgWtAevtKoa2cWwEczZMFgZ0qSVALo4Wdg69c/b5PvL99CpoFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010869;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=N0zqBIsHWdrllFaVe3QkpbKqwXWxPxoapbaF5n2Cuj4=;
	b=LmWc8ep+09YOmJLObuNKAYmoP5se+ACq7P0WtiGdP+N571IIDgLrJjma9vxijLMFcN6f
	 BAzq+7Z76NJZ6ni+kGchohIzCcO/mfPeMcVzn9khNF5/lLOmXMTPf4oY1U54fmNdui5Rz
	 b390uNXzP2cPGTXs+8OozaKDKum/TOMISvJoASY++/GvtNBlKFNowZ8aOHKZdl0IdX9Uu
	 2iSj3My5gc0bK4Pcq6PdcdHUMr0XdARZIYpjQczC5TKaOhw5wfKsjtv4K8MVWiVhTiK3r
	 ob0um5FzCmYp9RXg2Wq1srYmcW3TqIKMMbv+AbeP6WHx3NxjHy7CoAFQ7suyBCskWDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tkiu5bk0;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=MnDusvBC;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252B2606A326
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 00:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 252B2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tkiu5bk0;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=MnDusvBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N0zqBIsHWdrllFaVe3QkpbKqwXWxPxoapbaF5n2Cuj4=;
	b=Tkiu5bk09yUHR1uaxZwik0Ai84WIe1t6DsgAKuMvQFYBECWQbk27DVJhBRzk2wFctvTJiM
	q2t4tNO526VcKsUI0/mxhfVSHWb6MXA/MzKo0iqH9jlhYDRCnAl7hlXZl5zyZokmMEkKsW
	OebQ4NvRyV+TN7EV3pyontATDAby1no=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-Ba3s0cqQOy2GzfpVxofeAg-1; Fri, 06 Nov 2026 19:21:05 -0500
X-MC-Unique: Ba3s0cqQOy2GzfpVxofeAg-1
X-Mimecast-MFC-AGG-ID: Ba3s0cqQOy2GzfpVxofeAg_1794010865
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-54e98c9e752so22414871cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 16:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794010865; x=1794615665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0zqBIsHWdrllFaVe3QkpbKqwXWxPxoapbaF5n2Cuj4=;
        b=MnDusvBC/Y2jouH9+SmLPWi2YJ0nHgXTKZp3gQjFPxqMwZ+CZKkOYAtycYmx23rOZ7
         S94Pe3BveuN/IvIjg/5SJqpw8UtjV8yJ53h0CwzVSrlEvfDG5ZQ+WlqFh3rgbn1css7B
         hnZIcgZ6NMXGEQ90CC7fa0lnELzr/rbHB+oFvGJ6DCjoS6Lr8gjVQkCpuGtwFGmQvyFW
         IOrK+alaU6RnvcuD5YzujB7lSlGZpjms1GjWuxImNaR3ddgKjQn1UdiU7sOlspA2jQiD
         b6h7AbiGKCoo4o3hYVEEzVJFqkN6/VvzZU9uq+NVxw5OLQI27QtxRoqRz7cI0eHHeumO
         W1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010865; x=1794615665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0zqBIsHWdrllFaVe3QkpbKqwXWxPxoapbaF5n2Cuj4=;
        b=2YBjffyjXE5oj3nsY/cl2yd7jwVS7AzOPn/6qx5NY4+MvOrHQf+Wb8gUA0RuxS+TGY
         +LMP2rQatIWYAPSGqEgb2AlvXdXc3bYRhr/W6dQ4MR5RRZkzrXX9PY3PsHB7UiHfrmlv
         7k7rG2nrpLSEMUQP9n0F68etqdvuPIS13GkOqfG7aad6sr5czuVwvomrHFyFu5PCRruZ
         /v1k39+uUBze7MdybrRUB5Gok0nE2PqTU4H/NmciR5m4MWmfvxZ8vdtUZCduCARxpN5M
         33oCzOe1BEAea2tNa6PjgGfffC2Sr7l45Cvse8gHs4o62BDjTxJ4sGbv+t1dO6If2ZrQ
         fYYg==
X-Gm-Message-State: APuU4Z+qHi4mJmzDrjIIRKN7dwsItSqeeuLq/kuqLjGvmlwkjulwIHxk
	0mWDxErLQ+ZCmXtSRbWYtuiZT/8AFxyItTExYkiFAVghFsPR+uaAWf8oy3ewoPIj03T5vkBH+2E
	rrGq1TojvrmRoXqyxfkFj0SPr/cGKu8ExPmPm5cIoB0vjQWCLvsahUttWb3aQ6CKtiOwGs4xITO
	Ghw0BaMZhKY6hedzSN1OfIg6jxlc+m1bj30zrm0mUjcUZD46ElHQ==
X-Gm-Gg: AYBFou0X7WLzZ/DjEeEZHyeDeVwXCfDYD9+p3BIqoN841JsBpxV5p98KN4h53++Xk2i
	0uUTU/iBRvdDXgGaxdUpCc1nsI3IkSKlpzcK9YwwZkR6KE5yIDRmS7DTqMpPve4exFb3tebFu8F
	cAAmKPCvD2MNMgJ5RrhE4oekigW72uD8WMGOh3UhQrdFupQIcECpHPbWYwZHvHpR+ZUnR6qo4bL
	aMAm9SPhUFIxnLFOMHJpv1wSh8yDbZ16fhsPu5ViVYIgINe11qI8Kp8SSdZpr2AxDJQ+wi2tokV
	daE153vUkABnMvk9PYqt21qV1wyO3uiDFokYBobSJFmw68W9kGYTtu1nTDE5DajGnC64Y+Vv5qR
	oBxKQglkaDLSORgNyPyUdSk7dQzsP6Z38Mu8yYnFclci9G/6ZQjz+dPfoJ6ME/WcMFzNqwCITUA
	x8HmimscwrA5xZYxRV
X-Received: by 2002:a05:622a:4d09:b0:532:c057:9564 with SMTP id d75a77b69052e-54e130945e6mr65066331cf.23.1794010865070;
        Fri, 06 Nov 2026 16:21:05 -0800 (PST)
X-Received: by 2002:a05:622a:4d09:b0:532:c057:9564 with SMTP id d75a77b69052e-54e130945e6mr65065991cf.23.1794010864646;
        Fri, 06 Nov 2026 16:21:04 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e2683624esm32445291cf.18.2026.11.06.16.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:21:04 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:20:50 -0500
Subject: [PATCH 1/2] mfd: qcom-pm8xxx: convert to subsys_platform_driver()
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
Message-Id: <20261106-mfd-subsys-v1-1-1c3e755d37a6@redhat.com>
References: <20261106-mfd-subsys-v1-0-1c3e755d37a6@redhat.com>
In-Reply-To: <20261106-mfd-subsys-v1-0-1c3e755d37a6@redhat.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=907; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=An9xVkNlvQgpiky47BGz2nZjV45FIb4wx87M5kPdjww=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5b2Ie/hoyhftY5G71X/E3jU/4PFa80pGmnTM6tiGZ
 Usl+J+s7yhlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiSdYM/zOfxlm6/Wg63azm
 GsGrP3vL11pV1si4FQtYLEWE/75j1Gb4KzA9V7TwrmzEufkBRek2vo86YroOxtkESbzOUr7zz6u
 QCwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/mfd/qcom-pm8xxx.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
index 0cf374c015ce..14de2a5e6ba6 100644
--- a/drivers/mfd/qcom-pm8xxx.c
+++ b/drivers/mfd/qcom-pm8xxx.c
@@ -594,17 +594,7 @@ static struct platform_driver pm8xxx_driver = {
 	},
 };
 
-static int __init pm8xxx_init(void)
-{
-	return platform_driver_register(&pm8xxx_driver);
-}
-subsys_initcall(pm8xxx_init);
-
-static void __exit pm8xxx_exit(void)
-{
-	platform_driver_unregister(&pm8xxx_driver);
-}
-module_exit(pm8xxx_exit);
+subsys_platform_driver(pm8xxx_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("PMIC 8xxx core driver");

-- 
2.56.0

