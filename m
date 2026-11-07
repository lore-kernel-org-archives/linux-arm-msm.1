Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010870;
	b=JgV2fMUgQtksLPjUXL8sC0cvwy0Me0pkst5WnLKJ6IncXC2MszawNxdl6qNlS1RO5++/
	 IYwJSTTW6YKMvF2vZrlOgi+4PhejM93DrQkXtfBWweEACzbnGl9HpLdRkIN5ayugzIJGW
	 7fBUxib6FafXtVKq7XTR8OIewOpYlck2QZKllQlV0I3qfoHPIFxCRRVsn1BRrncmFn83x
	 LC5UyrguQ/rSuvaYmW8uLTsBPgxxYJQ3mB3hSFGrJPVFu49W4PNkwbZ++oBNhymoC55yw
	 zIb5GRbQhy29TKdA8aQmb98q/kXyJTx0X4RqgtaXljQRw2iQ7IOZJtGtsKemdtkzBGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010870;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=rRz6YjrzL+fQJI/IVucZI56kUxLtzNDsuPJEr/aWzhw=;
	b=bIUTPCochvNUcm1N9SOhLMXdN/rrC5XHUOSBj9A1ZohPKMt4swK3dVDoRiQQiD+ZIBIT
	 l9KGNh12mD1pm9x7rOq6qIIHYUIezafVJDedp5egw5suE7kRo9oZKY26tCIViR8Yor/aX
	 2cY9E+ZiF7Is6xhILiNlsQouc3q4UGXw/IyZpCrx4bAta6wpoAv8MMON4HLR+TNwY+YSG
	 hZUdwc6xwBtJS34llbB84rjUYV+R5bmzibB7OYhTP+z7t9v8qRhIo2tef8b78smHtfH0Y
	 nQ8l1qV51AJQ5Fv+0X9BbkhWWdr0EP8yIeUJumZwoqCSMM/O4fEeRqU1uTW1kvY4kmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="O3Hr0/8b";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=TlhEYliG;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66316606A337
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 00:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66316606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O3Hr0/8b;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=TlhEYliG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rRz6YjrzL+fQJI/IVucZI56kUxLtzNDsuPJEr/aWzhw=;
	b=O3Hr0/8buDqATWvH7pUBomhtpmCS/qnp6s0aCw0sJ+3NoFG9A9v1MiAUGT6YjlVY6L6JNd
	vUME1nntNtPOwqsX7ZfOKGM1V6M+jgnKvDG0Jo6uSkpv6P/Vi2vQhwawtG1eZHoeQ1BGaN
	gfyoDkOx9WWbvxPyRtosxaohUABwxcI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-lb4srklQPiKPiHArAvTreQ-1; Fri, 06 Nov 2026 19:21:07 -0500
X-MC-Unique: lb4srklQPiKPiHArAvTreQ-1
X-Mimecast-MFC-AGG-ID: lb4srklQPiKPiHArAvTreQ_1794010867
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-536720195ebso23175761cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 16:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794010867; x=1794615667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRz6YjrzL+fQJI/IVucZI56kUxLtzNDsuPJEr/aWzhw=;
        b=TlhEYliGVbeKP+cp7MH+ItIjtZR2X3n36TPBi5pXitgqQ8L9XAHGScWOhnej5Mbf4m
         nzlc5FSbF8+zNBTnzNheFU7fbwKZJ/Y5i75a4bszXmvU+n/Z50jG4EHqg7wjaO8Nd5sh
         kuDLDC3FbjCH60JeOk2QSlVkCA6VtwPYja35LF0aOz4UjixbVnPR34uupPLJuo13SMEX
         47KXXddkVEMHaTN7XPKm1y4qL0tBcAmiwU++hqi6qCxlWn4qjeVlKDS13KUDFrq8G5K2
         oDLC2KF//jwoURVAFFLWKjGIZuRxFGOjBhKYZYu+1NYYSKtOKJEnDSDia5VnMOv46Lpi
         cHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010867; x=1794615667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rRz6YjrzL+fQJI/IVucZI56kUxLtzNDsuPJEr/aWzhw=;
        b=EMcT4cIwmRVD/GYzNFnvJ91uiTh58h6wrhU+cYxWAojZNKUDCC7E+NBx4C1b9HnfPL
         1lMvgFcVaVDbGNCxp+acHILWfsnt7QzxZoJtW+7fR8iiee6DJLfr+19PkB+vobnXvrP5
         qenkw/JTnmBMAa6zOr6x2+//2MXY4YM52OvRBGK9sbZ50rUQDtP9yE66ASbEw1lEMcSf
         fEvXVlWAQ+Bpc2bVid6nIPF9ohtMWs0r3dYtjn/6DZ2lPW17Roi/U5meqZLTv/sq1eil
         FedXaJSiXuZxYVEshEM7Z1g1OSoAXIpPOiDW42qHz5jKqwyExeq1gMUw6o0g98CMPle0
         F4Tw==
X-Gm-Message-State: APuU4Z9mmiwi6eIR9VJdZLov61wwfC+6Kdcgdo0bwa2UCG34eWtY2n6G
	WviA+M2tNKdOgLoAyZyl5xI+D3GZ0XhUDRUNu7HDqRWoeSq5llmJp75qC3N5+qR83fXY6me6Rli
	pUIzOrXtFR0hJFWuqXSO0O3JhKV6uChbK1bPHKam0ZrcH9RrRO5BtuQhSAQOl29MsqazvW9E6GS
	KKqgN3utTv5ZiajWJn9Ve1t3pADh5EZ/KlF4BDk9UpGVZo4LeT2A==
X-Gm-Gg: AYBFou36xYXwIzreyPeDCVeULCA0+sNlLOGzLc5Zd8i/MehgErR/o1vll1opqKdKdcC
	pTv8oMawA+JoSZ5BLtqmKChZ5077cAmY1jcyvZzqHBc79xBNCN11Sox4HvNaQhZnrTz2pyev2GX
	5k/DSJCIs+8IYA/uX54DmITqA12JBKz3K924zZSk1qKpL6wLQcp4X9/RZdhqn8heiP57Urc3C9t
	TscMuqUGDCfCsq561HLVdJbJm0wG/37jkJm/5rsXpOlEkWp7Avw1eFqah/tjS33T4GBuIhfRRNi
	HpLkcCs8K3vIWPaBzvhlT9yl1Aj46+ikyFh3JQWTpVDMMWm58DN9h1yfOzVHWNWIWENO+0TtyGX
	ogE0yuEZ0ZcNj6b0DgVPUORWkOJX/YSyJCgAJphz3uqDFItuWxAwtXTWOxCYHddV1u7njQ3qlY4
	coFo9Lumvm1v3sjdUH
X-Received: by 2002:a05:622a:1245:b0:535:1f5c:e489 with SMTP id d75a77b69052e-54e105045cbmr71062591cf.5.1794010866858;
        Fri, 06 Nov 2026 16:21:06 -0800 (PST)
X-Received: by 2002:a05:622a:1245:b0:535:1f5c:e489 with SMTP id d75a77b69052e-54e105045cbmr71062141cf.5.1794010866242;
        Fri, 06 Nov 2026 16:21:06 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e2683624esm32445291cf.18.2026.11.06.16.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:21:04 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:20:51 -0500
Subject: [PATCH 2/2] mfd: tps65911-comparator: convert to
 subsys_platform_driver()
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
Message-Id: <20261106-mfd-subsys-v1-2-1c3e755d37a6@redhat.com>
References: <20261106-mfd-subsys-v1-0-1c3e755d37a6@redhat.com>
In-Reply-To: <20261106-mfd-subsys-v1-0-1c3e755d37a6@redhat.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=ukJ7KafP99YfAsIJ7Y5Krw2MYdB6MwZA/beMmQx/SzY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5b2su/XsLr/Iq4VWWT9/bJvN9lqp6Lz2x8BfO5Zs6
 Vp34s/axo5SFgYxLgZZMUWWJblGBRGpq2zv3dFkgZnDygQyhIGLUwAmsleGkWHvpL060r/Uz5rP
 yyuy2DPLdJLG+mUJ6g91YxZ/3vRxZx8rw//8T429XhtsmHTNf9kc2RJ1z3ZR3medLUWiRzkP7ON
 OO8sEAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/mfd/tps65911-comparator.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/mfd/tps65911-comparator.c b/drivers/mfd/tps65911-comparator.c
index cc8545a972bc..db787a4c765a 100644
--- a/drivers/mfd/tps65911-comparator.c
+++ b/drivers/mfd/tps65911-comparator.c
@@ -157,17 +157,7 @@ static struct platform_driver tps65911_comparator_driver = {
 	.remove = tps65911_comparator_remove,
 };
 
-static int __init tps65911_comparator_init(void)
-{
-	return platform_driver_register(&tps65911_comparator_driver);
-}
-subsys_initcall(tps65911_comparator_init);
-
-static void __exit tps65911_comparator_exit(void)
-{
-	platform_driver_unregister(&tps65911_comparator_driver);
-}
-module_exit(tps65911_comparator_exit);
+subsys_platform_driver(tps65911_comparator_driver);
 
 MODULE_AUTHOR("Jorge Eduardo Candelaria <jedu@slimlogic.co.uk>");
 MODULE_DESCRIPTION("TPS65911 comparator driver");

-- 
2.56.0

