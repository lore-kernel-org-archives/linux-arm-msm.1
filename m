Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38737501F30
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 15:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794293; cv=none; b=CxSTUlhfgugVq3t9HBIX5Vo+QVh+S58E/z/iFl8RGhku6xjMsjT/pvG8pJb9ZBd7DuxjUC5Iu7Z6x/Hwm37CeAoPR7foNpI5nrPck2xlhd1uSv/P99DDENfrkPZGsXU4C91gVLimsSvI2M846wpw3yue+705yfbMnkgwl4OAGzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794293; c=relaxed/simple;
	bh=mcQe2swm15Nmq8Y4i0Yhh/Z95MEtTy60FNwFlQB0qyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PXCwaHHECjBAW+lelreWq2oKln6lWyY8ZlyrOpW4WR87Mf52ILH2R1FvW6QoI8YfoFAHukw7HQVpS45Wa76y2pAJ2dEJI33vwq3db8NIO18zeUJz7hvp6wTajhei5+igfS2+jPf0kpQzoFo1XM/d6xNcOKkKkL4MaqAXG3SGlGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=RfLUiM8S; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="RfLUiM8S"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f18c0e03e3so1801594a34.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 08:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788794290; x=1789399090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/+QTxJeld428JJetLUQ3w0n69IV3ON69coAVWlYDS8=;
        b=RfLUiM8SVOO3/6fpi3aEeLT5ZrI3Df5mvd5Ss68J3++h2IUWFOo5f+fgDN4PT8L9I8
         V4yPA3kwnKegOJcmnUiQQgUjZryvee5/0iLJExwQqvyg5Zz0wrygl4PR0ee6rUY+M4ov
         DkdAniAZ79ojkQH3qD3UPPUpjhzHz09Dqs5P9piuU6UH2+rTUXWSIp0xvCRcUKHZrhAb
         C/afoA+Np44SzDjE9GcPwvdTjOwxZeWT/XhGFroXTYX53eLo6bJkxh6OimTvYEj/EBUN
         F8+6daWQ9Pp6ejp/rMzTgBEfgC5vkEnxNL6K69emsmnAd08pYqOuBNRLa9Zmk215EHZp
         k8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794290; x=1789399090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/+QTxJeld428JJetLUQ3w0n69IV3ON69coAVWlYDS8=;
        b=hzP906mq4sTwxj2rjSm9EnprV4/vr9FFhH8XPbc/7ZVvTLwp115ha3zevto4dP0t/b
         Lpg+AcsnKcXmZ2XEUfSaKAN1XFo6x4QEOMpeq7oDPUBMW/oZuXe9PqaLEW2oCMZ5e/WB
         yjMJ6azce3fE2QfhmIrGN6UPfAjPGO75Wae8vu8dfNaAA0LbUrggEGCtvDJU9o06CO39
         Vr2SBeX4CzYyTLd1P1idK0O4Z64J/9gcpgus89EQxP2qvmFmE9o0eqSNn8BXqyNU0JaR
         dR81Gf603R2hNRyrYXUlpBymuZKV4MQBxOggAcQZE5nhvBfxPBMQx5cxDuVDZx9vOPwl
         MD4g==
X-Forwarded-Encrypted: i=1; AKwUvBwMRb8U6HStZrcP58+YDBypcYkrYOkfv8ixPCBeTf+3I5pmoPw/sX7jxovGPz6JfDI2NcHADCMX49UawAKf@vger.kernel.org
X-Gm-Message-State: AFuF++n/nmoxJJ0/BuwCxIAGLjvU32cAIGoMGGyBXNPBKfkMoQySGDWQ
	QzVWRCVMu4QJAN0Ca6JZllAkO/DBvEylEIF9YrIZPLMC0Ozuu12Gz3/LnHcJu2CpSWo=
X-Gm-Gg: AYBFou2r4Iz+jqk4/Of9lXCoj3wd8R0FGDuCVVUOSBT2iejpRKEkLBhTwLNzKdTHOQ5
	SSA8Ng2PTjkV1S6jrp/qolvxqwtCs5hqUScozaE0TTLMEr5Nuctgn3z8eDQKsuKQrPByXjSD/xr
	mW+n661aV49FEcmD/NUhy0CaHLiS8lxarR/If2uaCMO+QolVZjWx1NPWYt+Kwpa38d4ZhiTyZ0R
	+TJAOQIWSq8pmiV4wGnb80YRQu/Wla0lkOdfa7g/sHv0QCnMqeHjLUnfmlJuF9/ZUwUITFSAcWM
	ebdCEBUoeQIt7mWtC78Umy1MBfbLIJLr8npmTJY4rzsLX8/dOeqkWrEnxG+RcY9zd89qX4G00ba
	gxHqnxul/RbvhJvNe5rij2bag/4FWy8NkB9LG1benN9jG80Bm0n1arSs31KCABOakNrCCI9E7Vp
	KEt3MemE6InSaYoSdeSO7Ya2GuttV1DDLy/j8yHTWqrsroenZI2vmzTNmx5bDznuO1zzlza4p2r
	r4iYg==
X-Received: by 2002:a05:6820:2d0a:b0:6b7:46e9:970d with SMTP id 006d021491bc7-6b746e9a2cemr11233302eaf.61.1788794290114;
        Mon, 07 Sep 2026 08:18:10 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:9f74:2a4b:1c38:e2d8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm33474770c88.5.2026.09.07.08.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:18:09 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 07 Sep 2026 16:17:44 +0100
Subject: [PATCH v2 2/4] dma: loongson: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-acpi-dma-v2-2-0ffe4a007992@thegoodpenguin.co.uk>
References: <20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk>
In-Reply-To: <20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788794281; l=1307;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=mcQe2swm15Nmq8Y4i0Yhh/Z95MEtTy60FNwFlQB0qyY=;
 b=pszIBdV0kK1FUCRktbAdGOChrW7kK7Mrhm9RZ+xiLFOk6gHbzZ0byKwiP/SEuuQTnubZrHIKI
 wm5fKOJhDzlDjf8gv7eIzW7XEibz2iIYboaTNCrbKOe1r2p7eKDdhSY
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which makes the code
more readable and consistent with how lists are initialized in the rest of
the kernel code base.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Reviewed-by: Binbin Zhou <zhoubinbin@loongson.cn>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

