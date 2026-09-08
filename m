Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705E5599A4B
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 17:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889672; cv=none; b=HOx5YcaVCre1cKqwxkOLZHcyVbsf5ozrIwLAB5ma1Wn9jLyS239DyK2dtv3EIjjw6iW0iHiDnE3/d6Z6VFm8cSUAxh3JXscuGf38yS87w+BNTdrb8eoJkDBidRAiV5RswlY0VUoIggLxzGCqnN6bn4JK1Vx7lHUnoUp9lrW6bx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889672; c=relaxed/simple;
	bh=a7E1cAnanYVVkRWaKkPGdq4ia4gYC62syLjr8jr85LY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=byxfKLVhOlZgQ05YZW0vtfOdM3fYpEGACGoNpynIqHGMC8rBvoVrPx3dm+ZEuBpoWKF9FM+84hOAF4sPOhv3zfnLmXD2ieSEInOJSJvbTLIF7fYvrmkjMiBE9WtURVJRenT/POOTn4BErlykQOssNCWIYCfdV343Qm+158wmkMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D3YFZunP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FBdDXP0o; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D3YFZunP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FBdDXP0o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788889669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JmkVIyJpnqsnRkQ/AN9eH6zCUWkahngJ6micUwzJvZg=;
	b=D3YFZunPI3SMlTf5DcpezVwB1jkUXyKHLnYiH+y4p0GiCGFrv5xJnbPH485p452andZ1+G
	8otanSp2I5/qMmEEOCIA9leNGCSaW9UeN2fT6ETmPjNdJ5SWuczro6A6Qj4HbU9rDjylCn
	7rB9rNpdYgcR78jhFAat4O3kn6CsgSo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-Dx2n6rK5OeCM_aOgx51Nnw-1; Tue, 08 Sep 2026 13:47:48 -0400
X-MC-Unique: Dx2n6rK5OeCM_aOgx51Nnw-1
X-Mimecast-MFC-AGG-ID: Dx2n6rK5OeCM_aOgx51Nnw_1788889668
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93771aa0379so966386685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 10:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788889668; x=1789494468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JmkVIyJpnqsnRkQ/AN9eH6zCUWkahngJ6micUwzJvZg=;
        b=FBdDXP0oac1fhViJpPd3F6OxGJIqzmft0JOx+Up794HxEvlE2fLjxGqrCorgiilgvs
         Zgp7/jnLOfH0LS8RHSiWpAXN8CEzbenwRvTFIAckogksweGNfNgYsdcLvVoO/RD03Zbf
         933t8zPsSsdixTbMc1dU8ZAV14+6TyVkAztIcMvP4+2UPE0lplHaBiv3F2TKi3bxPr1F
         LI+6Mk2N38Tznvp1CQAbnkP6QBFbsnJvmGiY3r2OqMtOpAYF6Y/ZW6RLyyeXRwGaOH9J
         cRhP9l0ZbqjJY2ugyu+E1CjlDqb8ni8eRXo7jiyLwZBR1M2uG3kc7PdN8SOX+nKL/97B
         FXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889668; x=1789494468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JmkVIyJpnqsnRkQ/AN9eH6zCUWkahngJ6micUwzJvZg=;
        b=IrQPXatSgL8KZMH62zlXXTEAP9Wru4i9WYiPSwhpXbPciwrdl6nTJn2WyPxgWXlCMh
         OMwfAT6Bnp9vzTQQGgfosGX9HXBOEqYLgrhcLAD3y4PPpZob3aI/UX7CIwC5z7JJVN6W
         4h9dB1uNYGU50VaSVCc6MWuxT52uVbbrz2v8ewdXLCJ9Gv89xgBkPraCKXui3+p0hzVU
         pDy6gPTtXBs2sre7+BQdDrZonZkR0mzk6Irc/arX/By2riNz7t0BW6/EwVCKLl9hgXJk
         KDLiFw/4b3Tm2azgB0h4hJp0lBjshd5k/Jq9aNc6uoKpH8jeoCXhpZe0bnHT8JjoAJsq
         gBpw==
X-Forwarded-Encrypted: i=1; AKwUvBy35F/mt8V8gOssRe2nw0kdpt0yF68BenA2Y1/U1ZOFFq4dHWqRxc1RW7lbkTgfjBLnqGTYnNORf/625Kuu@vger.kernel.org
X-Gm-Message-State: AFuF++nX12ri5GM5U14XnAayQ8wW2O8qpFi9hb94RxBC1zHWf+N8mSOd
	sb+2gOfsMMlxjfGkCJc+LEIDpK+onYLucGd4UoNy7wMdFu7/mtLD3WWpV7ZUjFVFW/9A63BoBSf
	clek291xcuidvSeOecm9uS8ndJEf8XqKYi07NQGbS+E0lpVLSoJ6MlWFI4voKo64Hkvk=
X-Gm-Gg: AYBFou0CDChIP6TnbhnZOu+uLDR3daxUJ9WhwLSuiF5oc6gtgkc1fQO/DjyfFJ8dwLd
	g7ZX37k4T/KkJP4S1a0ICPnJ1zymkJyTEH7HaT0tSV6HaSAFYFElJyr4+m6fxPg/03jTWEwHf2u
	PLxF+tXwB7BtnH6sUB9u82/sTEpXhpmMCMumMeBJf3xtuMIJM1eqQQ0HHQ6W8cN+fiTIvCY6xQs
	I55OAG4ce01A0ClLHGLqcrA9cNpiN9fyQGc5oVVa3e4XY8VApfYoz/W73+lBx2I8o0s5f9xljHT
	H9uiAkcT2uRlnB/gq5Ol8EKr8mo5yO5VUeMPsFQnpqnwe2zKnl1NcLaow4VnrzrfGxivZeQp71l
	sH9Y45pHuOvOd2fZs3QjAQa9eUO0E9cMbdd6ggnM=
X-Received: by 2002:a05:620a:46a2:b0:939:3712:77df with SMTP id af79cd13be357-939803405c3mr3213677285a.21.1788889667316;
        Tue, 08 Sep 2026 10:47:47 -0700 (PDT)
X-Received: by 2002:a05:620a:46a2:b0:939:3712:77df with SMTP id af79cd13be357-939803405c3mr3213671985a.21.1788889666833;
        Tue, 08 Sep 2026 10:47:46 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb9bac1sm1194093685a.35.2026.09.08.10.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:47:46 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 08 Sep 2026 13:47:18 -0400
Subject: [PATCH 1/4] driver: core: add subsys_driver() macro
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
In-Reply-To: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2040; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=a7E1cAnanYVVkRWaKkPGdq4ia4gYC62syLjr8jr85LY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIWeNn2tBU1Ni1/dSggNbqg+dfChvjbuQt/uU6Q59qeu
 buBSUCwo5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIlUcTMynEjas5VdRKHyXNSp
 jwynb6XoznuXmfJN85R/9wbxuKPTTjAyzIwrYIzpUotZnHuvkkEkgW9DRFtASu7/n+a/65dJC07
 nBQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Add a new macro subsys_driver() to eliminate some boilerplate code in
drivers that need to register earlier in the boot at the subsys_initcall
level.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Assisted-by: Claude:claude-opus-4-8
---
 include/linux/device/driver.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index 768a1334c0a1..29fbc01ef06f 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -297,4 +297,35 @@ static int __init __driver##_init(void) \
 } \
 device_initcall(__driver##_init);
 
+/**
+ * subsys_driver() - Helper macro for drivers that don't do anything special
+ * in init/exit but have to register earlier, at subsys_initcall level, when
+ * built in. This eliminates a lot of boilerplate. Each driver may only use
+ * this macro once, and calling it replaces the init/exit boilerplate.
+ *
+ * @__driver: driver name
+ * @__register: register function for this driver type
+ * @__unregister: unregister function for this driver type
+ * @...: Additional arguments to be passed to __register and __unregister.
+ *
+ * This is meant to be a direct parallel of module_driver() above, but with
+ * the init call promoted to subsys_initcall() for built-in drivers so they
+ * are available earlier during boot. When built as a module subsys_initcall()
+ * collapses to module_init() and the normal module init/exit paths are used.
+ *
+ * Use this macro to construct bus specific macros for registering drivers,
+ * and do not use it on its own.
+ */
+#define subsys_driver(__driver, __register, __unregister, ...) \
+static int __init __driver##_init(void) \
+{ \
+	return __register(&(__driver), ##__VA_ARGS__); \
+} \
+subsys_initcall(__driver##_init) \
+static void __exit __driver##_exit(void) \
+{ \
+	__unregister(&(__driver), ##__VA_ARGS__); \
+} \
+module_exit(__driver##_exit)
+
 #endif	/* _DEVICE_DRIVER_H_ */

-- 
2.55.0

