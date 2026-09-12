Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F383147A0B6
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789216106; cv=none; b=nXpqziu8o78yMhybLZUK+0fE1GtCBF6gnwDZPZxamGTHQgE8U2KlfyOS44eTnbEbdPRFCy6AyR1vVwXsQf/wq/ENdP9ZCpl44EFhSRA9ZVJSOgYNA80oEljlw00AH+NARbq6jXAVQfocPr9Q4wFOB3bhVzXKHcjx5qoy4ropLiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789216106; c=relaxed/simple;
	bh=06OCCRLJZiWFmko6yn+El7auSYo4iw4lQ+pGHqY4J3s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GkvbogmAj050rk939BV9NItRGVzrwUiqmGqc9r5QGN3GxeBhFu2gi1vS9a8QTUlIPDYHiL091SoqeziujxSp+nJ6k9evUtrT4NTagv+uFkZfd/0TnPeYlB6veDqv5Tt6pd3/Bi6DqGGyoLABQhQwv0zGBHVzNp3dr+oVoo73VIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BhYPyA9I; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BhYPyA9I"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so294778a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 05:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789216104; x=1789820904; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oe7EXYlzw5spJ4MGmK2TXNFq8D9C+6xPH4nivENYcuY=;
        b=BhYPyA9IrNZBzadE/xwuZhtWgRAC8lgeIBzDTaC2GcEnwP4TqINJO4sPJcir14Ucl8
         HokL2QWEvU8n8kHYaRc2MSM83FSTSzMGyHKyXt5V9avbymkSBjzU0IBseZHfOhbRENuV
         id4CiDzkufYLl3vnIiQnErwICdxzjExoh3sF1EoXaOS8+4rlqfzqHIDcysa3fDnzd3X7
         W16OcGrgE6kwustxrpONo5mufCKfCYMI+dbkou2cE5Wz0i8bP9pYi2R6TY0y5pX/H6RV
         1RAX++MPxplV2yNaxIr39O3kDcer+vFlbk0M+Dyet50no03kDxYOWumQFPswqZVFOIzK
         yKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789216104; x=1789820904;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oe7EXYlzw5spJ4MGmK2TXNFq8D9C+6xPH4nivENYcuY=;
        b=VUjjm5bHdyrVGn0SX7yd8ONnRw4T8K3xrkibdbBbGZTpvhecMORLr7w8+W619XPO0j
         ELIInW8mT2WWcQoZwu4HgW/28OimZv1g0Uk2sMBBmYVqbU47xS8FmTZ6UYdsnw7njhi5
         KZCJuhs6vdRhmFqO6De0C82xgIG2zWdtjObFam0+rg1SQavAh/UHOx3mbgNG93B/dqsi
         MCkPZ///LmcIb+wxiYSXIghySfanqwV+BPRiGeMwXEdX1vllWmqsD4ehajaPR8xKFIQq
         d5+5H2/C84j2FzwACdboWIsN9RhJ955gyxXUhLqyN5+2U0oK7HHo1OrCXQVXD9wFIx7U
         wqFg==
X-Forwarded-Encrypted: i=1; AKwUvBzmQKB1Lm2yI5H065+euJntEv8bKK0SUN+xwiZrNqCJEKuCW2suvc6tSx8K+3mEzqksBW5AjUNs/E77d5Z1@vger.kernel.org
X-Gm-Message-State: AFuF++kKWVUw8pQRjJlSdtJfSn3yZ/b5tspaJr+2+o30FP9+ROFP7d+A
	VbBe5XPdqjvvajt6MN3ZicjW21JoY3Rq4euaQ+cIWaj3nWynIKkkQJDi
X-Gm-Gg: AYBFou3h2s9n5O4bCj1BA/TfPukQSv8pBuDM226toQACAMcJEISuCw0BLcM1iUvCA1S
	tytHAeD7rKxfU1EPq1Ue17FfO3vgaRMWNtBE81WkTdGYFNf+Ltr+fNhJzeiLuzo0aq8S8+rQwDO
	X71HV7RD9VqJxJGpfkCs/taRYeDv0HIJY3jjQjZpBIEzjxGPF2EHBeZGeUq9lOz9SYzxQmoT5nR
	xXmKT7417X/Jw3TQFM3fW+3/jsJg184gSFt5FiGvY0PfHth4yuev3hD6KQT4B34UtNlEXVdfFeR
	TaD811BVVqXJMojMTkX5C3ce7IZaIGaUT55c24em2aVGy49FCPSBkFF/DLZN0xAGahG9qL70qi3
	N/7nAqIgB/ygCNoN3Qq9ASTqEdKYKiL4S3O/mbK5X6fjSyTVn+r+C7INLfnHnBboD/qVAOxq6r9
	TjSmJFt3HfY8bKDgH2cjx3hdkI6sH9rc4PdxoGcTIUbsB1GKHU4Hhxwfig0aN7q2Q=
X-Received: by 2002:a05:6a20:b08d:b0:3da:6bdd:2308 with SMTP id adf61e73a8af0-3daed5d1814mr17126253637.18.1789216104145;
        Sat, 12 Sep 2026 05:28:24 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701d:4e35:aab7:8c01:68f1:4912])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c65b1a63sm2512427a12.31.2026.09.12.05.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:28:23 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH 0/2] Enable USB support (peripheral mode) for Xiaomi Redmi
 5A (riva)
Date: Sat, 12 Sep 2026 12:27:32 +0000
Message-Id: <20260912-riva-usb-v1-0-0acd5cf8c62a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrDWpJhVcRSwYg7Eo6SCSpndXL
 L/kfy+AkGcSaLIAni4W3lxCkWeAS+9mUjwmg9Gm1HVhlOerV6cMirCmyVisKouQ8t3TxPd31Xa
 /5RxWwuPdQ4wP6sV+cGwAAAA=
X-Change-ID: 20260912-riva-usb-ec9ef25c885c
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

The purpose of this series is to enable the device to act as a USB peripheral.
It enables USB-related DT nodes (controller and PHY) and modifies the
charger driver (BQ256XX) to expose its VBUS state through extcon.

Driver change is required since the device has its VBUS connected to the
charger IC, which means cable connection/disconnection events must be fed
from the charger IC, to the controller driver to dynamically enable/disable
the USB gadget functionality.

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
Reza Kurniawan (2):
      power: supply: bq256xx: Expose VBUS state through extcon
      arm64: dts: qcom: msm8917-xiaomi-riva: Enable USB support (peripheral mode)

 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 17 ++++-
 drivers/power/supply/bq256xx_charger.c           | 88 +++++++++++++++++++++---
 2 files changed, 96 insertions(+), 9 deletions(-)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260912-riva-usb-ec9ef25c885c

Best regards,
--  
Reza Kurniawan <imkyufie@gmail.com>

