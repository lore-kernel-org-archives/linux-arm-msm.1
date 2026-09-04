Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4A14AEBCA
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 14:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531069; cv=none; b=bErxTrTjxkkVnPzf/56PdEihLBiHWlij0S18FVv1TA/32sNgY22xew8C4QRW9D9YGX7yeNh/Q3GRT5MsBBlhFPZB6BShRMY5LLUsq9MPFakJyU9iHK/7xoTA1V8zoWx7DNP6LRJ/FJ79ucq8kieXEm1FkDxfo4oabec48tdm89g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531069; c=relaxed/simple;
	bh=HLpKxIaKGd7G1q0JMJ/3LmoPDegXjEccp9RbG0O8P0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CT9AgZyUdgh7cfg9iwqL/QNAZUvDjwnUqzhu7bKVzfaf7Lg59GOiTOaCVB7hdThBBzxw73cxw4qeh2XRpgtX8wSzntLXoGiPTC1ynJ8rj+Q1VsF4AK3xncwxFqZMcaZMniakc7aGwfyOCPiUVDY9WuAOVacuVgBRpMkIpV72kL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=Nq+VBNJG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="Nq+VBNJG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4956869750eso7929415e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 07:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788531066; x=1789135866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aEqUQC0KLTMrpqR3R5TYtWC0wMSU2dt7BIPd9pMyARM=;
        b=Nq+VBNJGF3Mgkl+YXFgKDMirc4NXRm3su8RxPlJLeDyhGTTV3PSaz0qKrAD4y71RiU
         3R1EtrJcW8mrsdW3lw5sTrV6TF0oniuqHcqALv18yY1f7Jd7AcqtCxTVvEIYFBFnXze6
         v3yANxZ71qQ8NAcOPzQK1loPvIL1F0Lx/uVjJpH7AZSONjR2tJR4bbVu9NZVJW7uHi/5
         C2IuWjdXVd08fnvotHJU3x1beK+4PZOibQ8sAvbFNtpiCat7gMETkQNnhWAlaM0IfrdP
         eCtdL1o9fpSZCBqJq4u6RO1oGSxWBwmMDUAC5hAuYQNTAE34t1G9Jcvsu3QtTMSaKMAA
         9dEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531066; x=1789135866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aEqUQC0KLTMrpqR3R5TYtWC0wMSU2dt7BIPd9pMyARM=;
        b=YUlI2hDW7pnXpxSMF59kRYSBIOtbx3gRUu9K8ftr05vxfRK8mZewpsghUMkv8PZV7a
         RCVkZOz6qg0PsGiha4vY5rLq4rpGQlP1CjyDqKNaeK897Okw0O0VJeO+GMxbE7lTG1bQ
         fpDgXktOqshxFQPhEXXZ86nAzueiQ4SIQWEyALvWDlEjf4yFPyCUhECbwKFBfoT8FYIV
         +Gh3Rc21dhoxbvZcc4hCKzp2RnShZEmG9Ix9zVV1OKQjWzXwNDZjkDaIlMNwSw75SUZe
         PEoPUhJvSHaEsmiEJ5FPG3ssYwREfjlEDRuGnHhMGzvctbtd/qxn1wGeoyCoi8vtQzqF
         +Ekg==
X-Forwarded-Encrypted: i=1; AKwUvBxnshKDdKv2r3xN2PvUIYW45+V6ScrNZf741HazWP4i2KSw+JLzUvWKZbPjNqvdVa+I5/Kqvu9wGmx3Fll+@vger.kernel.org
X-Gm-Message-State: AFuF++lwxMP+gMl05VFq3rJz5muimj+rhKsuox7ffXrkheKSkKyZziVh
	4S0c/KNAjqAKYvudQxQfz4X+vluBZFrwaNA2m9KkoItlCqN2S+Ha3ySZl00LNU4DqXs=
X-Gm-Gg: AYBFou1qS4+aN3Ff525unmBpqoFTriPaYbd/w+7WSbimbLfHpJl8/VLv7nYgjzbBHb0
	QjeHw4oNVpWdPckOA3zLwa8yDREbkR2qnzDmqMCHFC4hD57kshG/W1wHB36dAWlKv/vYicay/fT
	JjXjEDR45rvK93wytX0PQCrhkubVBx7tqzICj024ttDr/lBPlM3WfRguNMODpHnsHOBNoEZzvXD
	WuGXwQxyuGaRAdha+Df0IYjD0F03X5yjVmFQSv1Nx96kSgYj8W3ElgK0avJ2tH7YQ//z9UZstIZ
	a9cCLir79OHPkicajmzjR4ZYURU59lWQu5LWVAq1hs6CkXll+Pc7EY5p199+jo6ukVhmD0SncDH
	jTJLtU2iZK+NZgcpChD4tS/wBZ8ezP0gu2i/krDdlFYnNsvwtqmBiKk/sYm90uUslS0SUX4cbav
	0T/vNtKTGSrM9ZUX9sMyrh43YdtepCm2AnU197OoaSl7kHSbqsMynA3nyljAwlrpI=
X-Received: by 2002:a05:600c:a087:b0:49c:f467:7ce0 with SMTP id 5b1f17b1804b1-49cf81dc377mr57050405e9.3.1788531047704;
        Fri, 04 Sep 2026 07:10:47 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:2568:24c4:f44a:8310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm138287045e9.0.2026.09.04.07.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:10:46 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 04 Sep 2026 15:10:41 +0100
Subject: [PATCH 2/4] dma: loongson: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi-dma-v1-2-0fcc63d65d4b@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788531042; l=1212;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=HLpKxIaKGd7G1q0JMJ/3LmoPDegXjEccp9RbG0O8P0Y=;
 b=VUi6AEMzf8WJnaEudtuz0IHlOiaxvFSP7LnEodkr0pKvhd111g4p3/8O+pPvejHm0kaaH4H8x
 WiqccCXL8MxC2XW3/g1uTW9wN47IBEzG2Ky43NlIT+FvWjMpNrO6Ilx
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which
makes the code more readable and consistent with how lists
are initialized in the rest of the kernel code base.

While we are at it - unify the list terminator to have
a single space between the brackets and no trailing
comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/dma/loongson/loongson2-apb-cmc-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
index 1c9a542edc859..70880625c6e92 100644
--- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
+++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
@@ -709,8 +709,8 @@ static const struct of_device_id loongson2_cmc_dma_of_match[] = {
 MODULE_DEVICE_TABLE(of, loongson2_cmc_dma_of_match);
 
 static const struct acpi_device_id loongson2_cmc_dma_acpi_match[] = {
-	{ "LOON0014", .driver_data = (kernel_ulong_t)&ls2k3000_cmc_dma_config },
-	{ /* sentinel */ }
+	{ .id = "LOON0014", .driver_data = (kernel_ulong_t)&ls2k3000_cmc_dma_config },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, loongson2_cmc_dma_acpi_match);
 

-- 
2.43.0

