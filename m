Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53E459C994
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 17:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889682; cv=none; b=LTquqSddROK4aUnoSMF26yku0vRZsQhKt4d4o9kZCnP5krUFDH84AzpiPeDtXvxOw8+Te9S0kyrexzDjN0hrHWtbCNbbjqb8FQQAValHvRxkL/yEaZcen5VFOkb0lyOcf08qH9d+qCMgIol9ZtpI+9G182xbOEBgjQMT9ib19kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889682; c=relaxed/simple;
	bh=rrY1owvxS07jbIpCbpLvTgnzot37t+bLysMBqFgi+Qo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lZyFtPwngs2e/PrfglVG4m9qOucKhzsjBb9EGIoNNTQDk2AIHuYwbnldUp6YpZ+dUWpHamP3qz0JnGhCg0PqYbYZxA6fDyOBITeL0cn93Ssm7vSm5h3Hged11exyIqz2DxPbKN97qWj60+4/ozSYLo+1Z2XW8pPn0tvHZ3kX4eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mcgo0f0k; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kyrKMfX7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mcgo0f0k";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kyrKMfX7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788889678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CS/10M/g4Wr/wq9hJUaikpGp/lR/pIXDB913LdXZJIU=;
	b=Mcgo0f0k2ekKdC1++OsuICVB46uAaQ34aHzh0c1QgWYU4zr4WWdCljG4H/xe+kXD8miHKD
	4iyl2/vBkgCDDI9ORT2k8kib0goHKSZ+CXE/+i/0pc/8BKbBUw7KUgjc34Rr6JwoY6hJaE
	2YpkJWmkmDAcTreJOfNDHPyP4nxQvB8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-X40BopgpP22uRRWmHR-aqQ-1; Tue, 08 Sep 2026 13:47:57 -0400
X-MC-Unique: X40BopgpP22uRRWmHR-aqQ-1
X-Mimecast-MFC-AGG-ID: X40BopgpP22uRRWmHR-aqQ_1788889677
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93915f50a5cso1163957785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 10:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788889677; x=1789494477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CS/10M/g4Wr/wq9hJUaikpGp/lR/pIXDB913LdXZJIU=;
        b=kyrKMfX75qHaeOvFn9p5aLnKw0A1NO5ezUFPqJhn6GcnSlAr61yQfYVLuEMh/+Gk+d
         KUdbtdFWtxmhB32x1PG9l5Air+7vylk+++e6VgBOGk1lDAkz0EyZzqEA5YQBmEXSL4xH
         F3r4uuyKkuAsLeE8Y2bBa7gYqb2gRcbqA6IsuCyNIs03StfH8/quTZSRiTSYXs1Nv4AL
         jI4avwZ973o1ps2TxFCYO1LeukSu/ZA0WJuXfMjwRDLkRIw3szCOJqHYKiwe9hdvjSW9
         7O1bjzZRJARtzCye6bXHv9W2V7N58mslb0f/oMz6cAm9kGVkkJfpo0g/MdFOzWEdfpOS
         5OGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889677; x=1789494477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CS/10M/g4Wr/wq9hJUaikpGp/lR/pIXDB913LdXZJIU=;
        b=oXu60ZLW+OgQV9n4TUhTALHz8IHNevbBJbE6eDUhg/tdcfJK5j/p0nZLbj7+ZqecNI
         RsKrFnECKjeEv0RGHUQi5MEQYeQKP0ZkEI//hFVdPWSpZ2RPHrNloykswcfXePn32tc7
         Ug0WrLORKtFHKj5QkCiiAHAKIPYgVjQyPW5qd7DmrA1T5YP5dyXsp3N8jNZ+tt1rC6tE
         hm0Grnk/v4R/5FWXbasIE+PB+8Pf9QCJhZfo7aNu01xz89qM6ykQU3R3G6A0z1aX1MFQ
         8pJkSsh+xugZNpVgBnNbFLJ1VCJ6qWqIj4360eNi4gFQvVdZHJLdEUPPGwtjX95SMG1+
         NpPw==
X-Forwarded-Encrypted: i=1; AKwUvBzJTsVkpqZLH0EZb89tZfBLm3gzT56YhMUN1LzMRPOKIhNoZPN6NlZ8QOPsoSLEtwiM2ikvkiux8clXGbBP@vger.kernel.org
X-Gm-Message-State: AFuF++lMMXmMqXDBiNYfDjFvv8U6Vnf84a9v5srMHvMeXWi2FT2bJVxG
	emDFYEVcbGDPj57CipZQ28corQ8tkv8SZnLYADyyJrGBd3tG+URtmB0pNMFdh2+zdyhcDeVkzBV
	O/J7M1yT9OJ4U66i1LN0KGO88NT6L7afSU53o6jHbatWEkqUKbjcJ98nxd4WTq9w2py4=
X-Gm-Gg: AYBFou079N2dh+5TlKr4lO+eAK1rsgOBDCRTOJButEz165yLIEvEDayfGB5SrTIVxwh
	qK0aYb1i6H5G5I1qnQBzm2L9n0nAYQZv4wWr2VONTWePA2xsaKCFK9un/PyGDo4MawKtI2cbOFh
	J6InagrhYz7T3RY7Ya0NX2T1Pr2br3USf3uBU4me1d2/qFWut6YWU8N8QSz3fBHQtJBCzSOPq92
	1ij/6Gw3z1+X4AY8Dpv9hpQbdLmoIZDGdZOlTuQgxGY9ueFi0T8x+qFp+JYVkLHe7ZJIbh4p8gH
	Dr+yxa0lieOLQgUvK2DJWiXh3nP8mDseh64HSyGZdOTsxv9FitfnLVDHjdfzxdkjux2mNiqGW6s
	q7tHeCFxV6kx2tCvng+zo1/O2R9wzKCvCOeY8J1E=
X-Received: by 2002:a05:620a:46a5:b0:939:72cb:baeb with SMTP id af79cd13be357-93972cbbcabmr2833287285a.34.1788889676731;
        Tue, 08 Sep 2026 10:47:56 -0700 (PDT)
X-Received: by 2002:a05:620a:46a5:b0:939:72cb:baeb with SMTP id af79cd13be357-93972cbbcabmr2833244485a.34.1788889671455;
        Tue, 08 Sep 2026 10:47:51 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb9bac1sm1194093685a.35.2026.09.08.10.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:47:50 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 08 Sep 2026 13:47:21 -0400
Subject: [PATCH 4/4] clk: renesas: convert drivers over to use
 subsys_platform_driver()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-subsys_initcall-v1-4-cbccf4cd4288@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2826; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=rrY1owvxS07jbIpCbpLvTgnzot37t+bLysMBqFgi+Qo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIWeNl/XMezhn1zYsGtX80ei091LkxnfKvOcIY9mvH5O
 auzVZ6eHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzkRjAjw8w1per1JTesE1OS
 lj27piPfMPvGTsNPXX8nB0r//p46/yXD/4RZf9ZskF6m2PKfMWbh093KwmY9CS78O+6I73h+enE
 TMysA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in the drivers and convert them over to use
subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
Assisted-by: Claude:claude-opus-4-8
---
 drivers/clk/renesas/r9a06g032-clocks.c | 8 +-------
 drivers/clk/renesas/renesas-cpg-mssr.c | 7 +------
 drivers/clk/renesas/rzg2l-cpg.c        | 7 +------
 drivers/clk/renesas/rzv2h-cpg.c        | 7 +------
 4 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 1da25e4fb4d7..3df3f2b2c6de 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -1419,10 +1419,4 @@ static struct platform_driver r9a06g032_clock_driver = {
 	},
 };
 
-static int __init r9a06g032_clocks_init(void)
-{
-	return platform_driver_probe(&r9a06g032_clock_driver,
-			r9a06g032_clocks_probe);
-}
-
-subsys_initcall(r9a06g032_clocks_init);
+subsys_platform_driver_probe(r9a06g032_clock_driver, r9a06g032_clocks_probe);
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 80f4403ea2ba..87b555e38980 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -1428,12 +1428,7 @@ static struct platform_driver cpg_mssr_driver = {
 	},
 };
 
-static int __init cpg_mssr_init(void)
-{
-	return platform_driver_probe(&cpg_mssr_driver, cpg_mssr_probe);
-}
-
-subsys_initcall(cpg_mssr_init);
+subsys_platform_driver_probe(cpg_mssr_driver, cpg_mssr_probe);
 
 void __init mssr_mod_nullify(struct mssr_mod_clk *mod_clks,
 			     unsigned int num_mod_clks,
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 7f8decef92fd..f6293c968bcf 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -2758,11 +2758,6 @@ static struct platform_driver rzg2l_cpg_driver = {
 	},
 };
 
-static int __init rzg2l_cpg_init(void)
-{
-	return platform_driver_probe(&rzg2l_cpg_driver, rzg2l_cpg_probe);
-}
-
-subsys_initcall(rzg2l_cpg_init);
+subsys_platform_driver_probe(rzg2l_cpg_driver, rzg2l_cpg_probe);
 
 MODULE_DESCRIPTION("Renesas RZ/G2L CPG Driver");
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 63f13fe4e4b0..7ce94680c79a 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -1643,11 +1643,6 @@ static struct platform_driver rzv2h_cpg_driver = {
 	},
 };
 
-static int __init rzv2h_cpg_init(void)
-{
-	return platform_driver_probe(&rzv2h_cpg_driver, rzv2h_cpg_probe);
-}
-
-subsys_initcall(rzv2h_cpg_init);
+subsys_platform_driver_probe(rzv2h_cpg_driver, rzv2h_cpg_probe);
 
 MODULE_DESCRIPTION("Renesas RZ/V2H CPG Driver");

-- 
2.55.0

