Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36C8165F16
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 13:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791034337; cv=none; b=nPj6a91J3ZjAKSPVlWjKU0p9/Xmlo51LBsruYWLjxwDvJLM7u9vJDXuWISToHwjKOJKJyDIEjCeTu0dZ/Ct66cTbrvfopNiugYt403/gbodffax7fnXF92igQpd6jKUVK34U096NGJ73bTft6D9tXJs0KnZDmriJFrgdYSqty98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791034337; c=relaxed/simple;
	bh=bXT5Bpu/UQqit1EMA1lQNU6M3clEhu9s7X3IN35dD0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fn4WNBk16voYwGecBEhCXPBwkOgUvCnnViRhjE3LdBN8RJzkzdLrQ2KwEtuboCZldWYD5BMOQgXIUigsMUTr3B+H5F6TDUrMCBGRQ8Tjt4bOOb3sRdQ16sR3H869O0klf1GUBvBxSBF4Pqxtv5IspD/WIJpkqOa+Ql+9SFHpN08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Of7VYr6z; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Of7VYr6z"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso6113705e9.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 06:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791034334; x=1791639134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ttHnG57BRgsiGkoj5Ilgi8vQqjiysL7viWax6XrSOfU=;
        b=Of7VYr6zxZJMRlPN2f5LX82wvXce3mNyPHpzCcu5sxoEIoOnf9Ni/qjd9+BARn0mm8
         T7PXX1u8mpSvlJHaXe45oY0EpUcr+fga4hFIzore50PAoHe7UF+YTSGCJun4fh0UrtTZ
         6F8X+oGWQg8ZwGLGAcMc8hJA35JJKL1CyRX0yzG4WPJxIN0qmNePiDjiFFabgPa4Nh3R
         HL1DcohjFskZsI6V6vMsk4akr3KPPb28wbPVteGCOZIU0fUuoTLitPJUrsbN/OYKucru
         Tp7GozhTaqWEnxcWIu5qXd8cQWo/COitFqnDJ9gGigdr3nwP+ixrV6OdWHnGoR6X+YjF
         ViMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791034334; x=1791639134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ttHnG57BRgsiGkoj5Ilgi8vQqjiysL7viWax6XrSOfU=;
        b=dw/tZ12L8Uz5XlIDvWgMs+PDxpH+IJxLI5paULSJrdePSwD0xJYKUlO0pBa+wZN/PM
         +hug7LQV1Rb/EIMxfGO5ylDm7WgBoghQkl+V3AwHoBo2KoX4Zgm0wTQiaV4jJeBFhI4T
         uXqVyOZ5BBK+JD50F5CEJlMTj4hnvn8140NH5d9+J5eM0eluUQYWDU0yqWk13x5ljEdH
         2hUkcFvtJit0Y6E6TpaNGn8kFQHZkVLgJJkZ/Rpe4JDN2ifcNE30Snko/GnLxYUYzShw
         58tuTFW4IXOMHN8JIoGeQiizdqih0CrHNG4d72zRpJPalraz3yqmGGP5vxmvjSAQ+s8C
         00ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlLt6G7wpN/X/LL577DFYdvdV5NJ+EegNX7Py/FIcJmzTPcdSK03CA32QXw+XWaX4tpObB9Qix2AsMSvio@vger.kernel.org
X-Gm-Message-State: AFuF++k8tuViEjSHF6VTi9xVKzC4oBq/aM3HJsRkVmKz3M4zPReLQ5BV
	1Q/LnKHO6tNYvz1i9kV0vap9jMOAWernu7UnqejPD+7fx2H5qniSj8LiUQs36w==
X-Gm-Gg: AYBFou15w6PAkWwteM706CGsvYXD3bcUixasgGqsXXl7ByapHRfUh94hPqejiAanNAV
	/3qvNGlc4thPoHdHIrmNq/gm+lksIW6DFf9G/9hmgBlYpQzsTCPgc+WitQFJjlP3gghVn3K1gjv
	mH24xW/BbMB/coGCMPpT/gBY9QVxERvyCZcZeIxlBQlHyKaHF+SvypKuFxejGbnjcTrLyUSW2Z4
	FWGasD41ltQR6RYEa7YVzHJZaogFCfaVxfSyfCgCdhktZ7wAC9dpNxBIBAa2MwUkRNLVYV556H6
	1zSiIrxNjuY6f+faaxTXhJO/ZoSxZ8vHaw4mFGjABNrmm28CQeXBpltabkRKwetwR97h3ACBcOy
	GwVoOXWYL0vna1JIWzMT+ulpAZhW4bY6+fskMnphRPnchBgRxYPj+VMMl8UQxgQ9ocwm+gCM/57
	aVCba6SpviiGB8XI/10fXCBWvqt8fQqKaiC+SPCi8/EHZKBcOWLXAY/QDY8uMxRe1be3oD2oW2f
	YvtBqKo+oAAhQxortXhsKzRa8FAo75NvZRfZooY9UoCB2miNfiqe/RCwVcDV02SXKk04CsiuSnY
	IDlvH59Wlf6x/ThBYmtYNe2SwstJFr4rcfAjx4JSmkFvC4AEZ5HeHk+G+nuD8uSOatu8UAL4jRP
	7yROXa9JyhTJQ0TT/kgp09Ptj/hDCsp0RxCPp/g6tCAEF9FUtajc6OpylzKmrYg66+6Ci+g==
X-Received: by 2002:a05:600c:3ca4:b0:4a1:624d:c12c with SMTP id 5b1f17b1804b1-4a16810002fmr36266255e9.26.1791034333683;
        Sat, 03 Oct 2026 06:32:13 -0700 (PDT)
Received: from cypher.home.roving-it.com (1.e.2.e.9.4.4.d.0.e.6.8.9.8.8.3.0.0.0.0.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a027f2a4c4sm183625385e9.2.2026.10.03.06.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 06:32:13 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Harshal Dev <harshal.dev@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] firmware: qcom: Add arch dependency for PAS services
Date: Sat,  3 Oct 2026 14:32:06 +0100
Message-ID: <20261003133210.730428-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The QCOM_PAS/QCOM_PAS_TEE are QCom specific hardware/firmware
interfaces so add appropriate dependencies, but allow test builds,
so that the drivers don't get pulled in for other unrelated builds.

Fixes: 08314e7c2c38b ("firmware: qcom: Add a generic PAS service")
Fixes: b6f7978da0c4d ("firmware: qcom: Add a PAS TEE service")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/firmware/qcom/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index c7f8413ab996c..aeb5acbdfe897 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -8,6 +8,7 @@ menu "Qualcomm firmware drivers"
 
 config QCOM_PAS
 	tristate "Qualcomm generic PAS interface driver"
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Enable the generic Peripheral Authentication Service (PAS) provided
 	  by the firmware. It acts as the common layer with different TZ
@@ -17,7 +18,7 @@ config QCOM_PAS
 config QCOM_PAS_TEE
 	tristate "Qualcomm PAS TEE interface driver"
 	select QCOM_PAS
-	depends on TEE
+	depends on TEE && (ARCH_QCOM || COMPILE_TEST)
 	depends on !CPU_BIG_ENDIAN
 	default m if ARCH_QCOM
 	help
-- 
2.55.0

