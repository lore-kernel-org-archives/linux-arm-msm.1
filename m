Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA8E4A9D78
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 14:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531060; cv=none; b=L0mZX1FZTYG3El1KfptrCxx0XEOHfQ8XZNE1YYCmHjGFDb3bhbw60V+H1fHZjxxpZVOqmZJlhYUGYBYl4sI5C34J1T/C5eCH+9XbOIR+dpHZEASIeoH7fEELeym8P9hwEy3KfaVT0cEhqAOUTMhf1dm85AJh1oDhTqY52NlMPRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531060; c=relaxed/simple;
	bh=aQFEA3y1X11okBv1IVhRwHPokxBF08MtJtdbM64IarA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XbusZtuDftaf3eK04efvCnoiU/oM7awrduUU8YitUyBdc8aqEGPPumnMLus5pytI8ALWCJ19M4ZZRviO8g42tuc63gt3mJtyGO+Ro3VDAc+QU4I9Ff5z8LWEa6NAq28MO6cPLakal/g2YAHvlcV+GYUv/kESn7Hs0y32O30Cbmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=ypaBJMHp; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="ypaBJMHp"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b4ab4b4179so964135e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 07:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788531057; x=1789135857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K6e/qZqWNu7/NIcUOvkEH6TkAX0V7d4LsbvVhn7euaQ=;
        b=ypaBJMHp1XDOANgmjvC4oC9qR6VUJ+ncHk0Cty0ie3gYgRFoGTh8SAa4b8nU7phhby
         QLEnRDscPNsS0TOsdPe3/ijnpkTNuYN9OquoEghkPxzVrKIh8sfF3ccLit2tPqZoE8d1
         IyFOoyDTnm0w7lyIWCRnIt7FNv19MtxWQ5N+qu0tCZJo8aWTdNfXqKuDiXNVxN3joPVE
         jil38YmTVkRra0v+zVjFcht0qluIqd0DzuRByMyVsFlsnz9VxpRmpFswBeorYbJgIY4p
         WO6H4JMelAwcYVpb5BQNW/kaV8rAFWPL35TSZou33hGtOceOivxx3NOpEb+W1J8rqc7k
         nl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531057; x=1789135857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K6e/qZqWNu7/NIcUOvkEH6TkAX0V7d4LsbvVhn7euaQ=;
        b=NmiYOXo9R70rnvuhBmy2xhIbqCLR+qjn5qc5hcECxXWOvUOY/RFc+h5oQqfE1iCVB8
         lf7O8qahqypanxXfBWIfUuj8S5xPDAo9DTT+/FIL2SGXAODff1JaekNHgCWyJMpJ2u8h
         StgVnl/XuDx5Pi2nntWSbO7hfwYdvIHrs9Mp4Z9YUvB+0iSqCyiW/j8Hrp3+DBBb8/IP
         rDopPDCCqFiDCsIftYNzlS756evy/E55rUez6ZU8K3oOelnkvqIZj+2Xyig/pz+zOgww
         ZTFyKUJeDnEl1xDNB4rxesJo9G9OwrvZHyaW0TcMuA3eUx91lo0aIdv/4tn6/YKio8ZZ
         /DZg==
X-Forwarded-Encrypted: i=1; AKwUvBwFgzoapfrPkV0TZyZHhgO9vEpqO/YbFQIj6c02/h8AzNTv3z3zCvtv+csxOB9FBQKWbKQ4d089Fl7x3MDX@vger.kernel.org
X-Gm-Message-State: AFuF++mA2rsG8859pBuf3ILWpKATLI5foeFHbBhPKnTERhwNugdXgnom
	RVmiPFJvFDtD8bQg1e9VDRGAeNczOmG9uxMIc9rIORYhqxveOytyb/CheSs0lkRMKnr/Br13KmU
	aXBHj
X-Gm-Gg: AYBFou1nmR3y2Eo3QgK86br0pWVuRs9dpgrtiWWZio+8Bff65fdcGkkR+pwKI2sjbg0
	EW7on7ithGdtBoJg7Z6C9VQvnXXMK26cDA7Hl/bOJqGCXhKuv2TecBMlZJu//JHGWy8Dv69kBUP
	FQCe79HlXJMTmQvGi3d/McPMq+ge7CZyTXdWVRjAorFn4QmuYcqlzy8Rl+pksS+EbJ3ldJC8o4J
	TM9wxWJ5+krAVKSS20/3/7nPV/Se+pJDrGWLtigBN8jz5dAzKgLD5GJg+Evq5StPSk5RexLRjc0
	EeWjkVGej4mAmufgoufLVjX7r96radgQGKKrIVg9M0eseHA5DrITuhmU4I0wF/oEWEP+HnGzb0A
	KdlWziJvYPBOGPVmW6+vtH8Y+oXscGN2PCZJlB/njQ19iiF9lFdLjlY6qTIf7ZwBkePJEGQcgBN
	Z9nLRYVIUZyLeTX5j4Mfh08wpkaU4gYmXH0zLziD6qz8siJdilkXyaLusYcYOxB5EkrIzA9bz5E
	6d8NQ==
X-Received: by 2002:a05:600c:8b11:b0:49c:edfe:d525 with SMTP id 5b1f17b1804b1-49cf82417f7mr123193155e9.10.1788531046019;
        Fri, 04 Sep 2026 07:10:46 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:2568:24c4:f44a:8310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm138287045e9.0.2026.09.04.07.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:10:45 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 04 Sep 2026 15:10:40 +0100
Subject: [PATCH 1/4] dma: dw: use designated initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi-dma-v1-1-0fcc63d65d4b@thegoodpenguin.co.uk>
References: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
In-Reply-To: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788531042; l=1528;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=aQFEA3y1X11okBv1IVhRwHPokxBF08MtJtdbM64IarA=;
 b=tyyOQHQxn3xZTIwpXhIMj6SJta67xRTd+ISo1iTYGpKgjWvUuVu1brMOnuUK8WgtSIWS8O4K8
 lKUl70Fitp4BMp1y7eYgsmIfq9Ht+bjFbiM1Jh4heAF8v9mXQ/WDsNm
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which
makes the code more readable and consistent with how lists
are initialized in the rest of the kernel code base.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/dma/dw/platform.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index c63fa52036d7f..5c1c97eb28a4a 100644
--- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -141,14 +141,14 @@ MODULE_DEVICE_TABLE(of, dw_dma_of_id_table);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id dw_dma_acpi_id_table[] = {
-	{ "INTL9C60", (kernel_ulong_t)&dw_dma_chip_pdata },
-	{ "80862286", (kernel_ulong_t)&dw_dma_chip_pdata },
-	{ "808622C0", (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ .id = "INTL9C60", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ .id = "80862286", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ .id = "808622C0", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
 
 	/* Elkhart Lake iDMA 32-bit (PSE DMA) */
-	{ "80864BB4", (kernel_ulong_t)&xbar_chip_pdata },
-	{ "80864BB5", (kernel_ulong_t)&xbar_chip_pdata },
-	{ "80864BB6", (kernel_ulong_t)&xbar_chip_pdata },
+	{ .id = "80864BB4", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
+	{ .id = "80864BB5", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
+	{ .id = "80864BB6", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
 
 	{ }
 };

-- 
2.43.0

