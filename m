Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB3951D512
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 15:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572490; cv=none; b=rXCoinTJWlUmyd88hAIRHI25WlUhw1cMSjlguhUjba3cpD497ORqy3nOPd3WP1WgDLsI8+6rEXNeqgamSCgN7zKg7IhhXolv5kxtwyZXUacNmcXKBk6lzXHHHf3eZm87+Oapkjbcw2tP0faaY8/LZVIHgHlIEs0bu0EfPu2CeKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572490; c=relaxed/simple;
	bh=BNXdpYcV6rP8Kzo2tOByWtdS1/BlwS7HT763SKS2iMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u8XQtc+0E5caFEdhzPEMYZfrBFkl9IB29mxh9BensUDcuAx3enj6kQKDy1L1ZQ2WTUu1P6ycw/mzt8JU4IHIXd+QkefQ/T1QPJS/SqNzWTzndyHEyT86BcbKaZ773cEcf1TaaXM9Qv8WoUcXmQpuDmZdn9Si4da8RlEjeyUGVp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=W9gjuXhB; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="W9gjuXhB"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874aso791970f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 08:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789572484; x=1790177284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkAqAr7Z12LCHxwZegG/ZILA0Oydr34Y894kuKUR6C0=;
        b=W9gjuXhB/nuDHOWVpMdIBp4J6v9pOMGvpTv6C+68C3+LguBZOL96AWTXGOBxvTCFpH
         eY0PL2n6ovqLP+InAFXz3cgB5LDwBhSpj/PTUEK/dk9MW6nQwz5UaA4rHqEPVifxqPfj
         vgzc/Cv2kP6LdGoWmizj0e7CwGewfzr4BwojDKWxTRBoEpc1PBMGPzTVJbG9mjRGQZ9F
         yj1wYf5hkPWLKjMzd6hoc/UVwFJhhJixuOzvSjIirxenT5k13hnFxbrfSF6PSk88fQ8v
         py8JTF7shY8gliRRzghYQLqOrymlVuvHIxJi94wh2YVsHjzxGPr5pnM5TmCHK9fqyESr
         Y/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572484; x=1790177284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VkAqAr7Z12LCHxwZegG/ZILA0Oydr34Y894kuKUR6C0=;
        b=RxLxdVUlXbzFBnBeFnNe5iwwHhTMgo0+pvqpR7D/qy5pUP77hvolzc7L/EEUwyFxsu
         ljagmL9XLqzHV3A0OzBRJYQbM9yJ/cWhWGxkVaVN0lrgP0lNjz/14XBOq/Kp6pt4GVKH
         Jaa/F6C0/E7mrhdJTaX7a8c9+dgD5Ore7Su5gdOsdAz/ghJlkQlGBuUMJXpKUuy1/UaU
         1+V77j94GRnX92M0HdTjI1Wo6WY4TeZczpn3Y3d0Q5L9d9V1fxxQEyqmoJI71ssiu2lQ
         a8PRO1fcpmkXG9tBCNs6Nd2hbMU9svChTwhvffdp8M+zIeDHdQUD2XXdqiB+8KVHyXsl
         wBxg==
X-Forwarded-Encrypted: i=1; AKwUvBxTXbcXUqQ1bJW4C/Vnr69b6Fo20bcv/j5aw9yMn3//3X/pRwS8QTA/Y/XipSQNngA0TlNNzMq4KdVakgVO@vger.kernel.org
X-Gm-Message-State: AFuF++lkqRelzMkelrFfruH2A3GTQHIKbvt8DxPeaJdKQipY0fhziiMI
	EXwnm/0SpWSG7UWT3FHZeecPYLgOqieTA9WB/4KTUfZNCzvmDioMAebJU9dy14WHP10=
X-Gm-Gg: AYBFou22YvaoEDL1nXaVZE/5+POro9O+oVr5TwYMQmuNcX3CeYSvkEOfaV9/FwG/Tn8
	LvIP0Z00ut4FjS1t/Sqav6YJwByq6xL8iQW7jhtHxWMkkw4OCRUxX7LmdH9RiJYXRoZ6HF68t1Q
	dLbMcHCyRNi4KDfKN4XoVZmA9q+AeffYQg1LGVZoOvQ0rUl8Qb15ZLPZKbkU/XhUqd7mxvnLVIS
	KpXZhUpPeqdX2mQWMr9A0LZMBQOcDDUmw8J/8iQm2ggjwtu8RGxkRlDb5Idc5JRNHpXAVN+he1Q
	BxXXjz/dd37oPMmiqqOpoHZ66DebgrEzZARQ+xvrVcWQ5r9eV8Ggn8wwvvuQw+laIfTw2R6vqeS
	isyGrtqdj7kApAV22p5woTRr2eQGmfTkbRNQAInZpL4JO05/HzO+5JjFDWt/YMOQWSANtUJTrpu
	fCzyw/P/6KCcjul/TUdyKjAuRt7j3A+uIRXUS3eL6WAoNZI8FX38hfS8Kk3nc0tfE6VZFsinxOU
	HAPkHyYllkAy5HYHwYXSEbNug==
X-Received: by 2002:a05:6000:4543:b0:487:62d:37d6 with SMTP id ffacd0b85a97d-4870d062278mr6043828f8f.23.1789572484275;
        Wed, 16 Sep 2026 08:28:04 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f89:61fa:af44:9a4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf37e69sm7886646f8f.29.2026.09.16.08.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:28:03 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 16 Sep 2026 16:27:57 +0100
Subject: [PATCH v3 4/4] dmaengine: xgene-dma: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-acpi-dma-v3-4-0dac05654967@thegoodpenguin.co.uk>
References: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
In-Reply-To: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789572477; l=1050;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=BNXdpYcV6rP8Kzo2tOByWtdS1/BlwS7HT763SKS2iMA=;
 b=AClNkxjacCjqu2lCKsZx+DsWrRbiQu6gec5tz+hmBFOqGuNzaQ14tthza4xwpktAZM7gOUuZa
 Yhu36sTa6osA945ATkMT1gSapeUJJUG5HK9qcNADI/uNELqdvAyplxP
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/xgene-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index fa1173e49900..8d1c58ca0d48 100644
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -1800,8 +1800,8 @@ static void xgene_dma_remove(struct platform_device *pdev)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_dma_acpi_match_ptr[] = {
-	{"APMC0D43", 0},
-	{},
+	{ .id = "APMC0D43" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, xgene_dma_acpi_match_ptr);
 #endif

-- 
2.43.0

