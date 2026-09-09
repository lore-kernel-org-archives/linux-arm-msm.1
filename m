Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4D752ED57
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 23:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788997711; cv=none; b=cmK2ZLiBdF6DyqPKQFLDGgPMw4RVm9BKMjqJ6rH2ayyyZv+THuN7wxqIGLz0EExj+h9ZIKLGOfAWRD9EZrrRrATf7elM/lf0UABOoxocSjxBsve53CB+yUGVfz68SBqH7z/jkCCJUhKSZlLJGs2Z8rz4Y3rKxd0st4G5uIOZVuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788997711; c=relaxed/simple;
	bh=G+K6yZL86J94n5ErSMRjznPkkKACsHzlBBj5w8KooVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bD2ndmPkgKWPAdeMPPzn1jGXkWfPH9Sxy+twpesBACdtyS1gvZ1Xy8s14/Po6KUuxzUdKRqIXI3cfmMHmO5cGnawOV7oIEdLXEGeL7aPGdkvJHqCVgaUwCmLHsCgYE8/sbLLf6VW6spdD36hBJveJYJmLRMv9yayqf+O58/Ky9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tBWGWRYY; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tBWGWRYY"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b6031cbc6bso273636e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 16:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788997705; x=1789602505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P8Y4b3ddmCAFwqmVgH5ZGdYAfFuI96RtEoGFK9BOGP0=;
        b=tBWGWRYYjJrE6BZxUBY1ZqCaDY8qPibbPSdnmZO8I695Qw+OxAbU4ITco3cGxJcgbM
         w5TgdA3xXk470bY1UDsinzI2yV9PB7UboB9p5e+Yv6qpH7Dfbwii8M64M3fKe+eJl2gH
         FO/7SMdpuZWEIodXA92XrEuE9P5QPMhQzS/GXm7B/79TnPfOG2hufsprcHEmhq2QnmNs
         CwmppdIeP44grH5v5gpKMu4I8pNDRKqJfmRqru+SVYFdRWtxjEzwDoKKBsPj0MLuvnOw
         qkQH2mTgMofQ+IYZLsd2IRtXwkeUIoUeDuVBzUhXqTlLKtXZVuK9AMeCDCoumPtYmNTs
         caCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788997705; x=1789602505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P8Y4b3ddmCAFwqmVgH5ZGdYAfFuI96RtEoGFK9BOGP0=;
        b=CUyad0ayKAVLwL7q26AeL5EOduID7cGihosomlTRP7YNMnNyaIiOj+apV9RJkbqYmO
         jewm+tHKFCKLT8LpNfSlz/2BBjqs+MCH5mS6j+okehp8jMZlrXcTzMum5fQx4lw5I+lT
         fzW+61xWRzpnLb/QRZfzgIEecGQtyDEG0jwLNkrOyGjjGcDmdlJ4gPKEczNrSabCIMI3
         xqlptLolwMEwv6tZx1ELhvcSzDYEh925qnH2dp/8Ic+ZcERa7n831KaVQRShA1rNgCEn
         NC5GLsAf26Q2zuNFnRyIhmpcMZ/pnQnyq4uytLuDh7rpg6/QHc3G1P5krAlOtJ4sh5xJ
         VL6w==
X-Forwarded-Encrypted: i=1; AKwUvBwCRJZbJLGGPxZRcrYrqsN6+ktoTp4uGOizY+QyIGAV5qEtSAUsvioAnejUj6gVg5Mz2lRa4eboho4IgZpg@vger.kernel.org
X-Gm-Message-State: AFuF++l4QReMgNeJc/nmTFq3s7eNKwD1pNrhYy71eXstelA5yxOWE5iy
	AoKwxI0Aj4VjOwsUv4LkOyeNGsYe9JQswv9WJDIu/TiYSU1TseFNsNzU
X-Gm-Gg: AYBFou1KzZqWC9a6Ez+VX2duipM0kfj8iTXaABrBv+pPJ9SHsYJdhNxO5/wJ2rwlnH1
	QpEWIBhWFOKhQ5EMh/2RzWk740jTBfMffkkyHDquSFg83CMvkZZgDATpp88fgM8ysm37PIH6iAN
	CRkwKi/Ccgv+JnpUMaz7jm149TgcQwO//qwrEZ9ixgc1zsA6RTlxDi2/nxk2eRtKQZUrVl9f+Le
	ANGMZ4inhbUIqc2U+ryJOEKbPIY1Q2QBkJKHqBcORX/vG6q3OxEX2P1ysPs1SqqIYiQP4ruHgdV
	EWET9ve0pwFFNzep3Lh83wNNfacozDOM5cfl5DbuX1Ucc0vLL/ERaWk9503ccY2qVnwyOA1Zoc/
	meTjE6QxsW7DniTMCwQFZgXUhHVSohuu6/13HaNi5xrzi9O1WYIaHbefCN6Rq2XDVm/CJ9cTqD2
	A5zE8G3awIyztrkdzy7qNoKKzMTCQGOHe2PjGNC4X1BnG2a/dDZqYcgMjO6a12u9cQXAKlRTTaX
	zGurdqI89/8ZekGesEEz0Oh2q8IorUM+/m2pSXj
X-Received: by 2002:a05:6512:3b85:b0:5b6:1a7c:59cd with SMTP id 2adb3069b0e04-5b61a7c5a4fmr6010294e87.39.1788997704650;
        Wed, 09 Sep 2026 16:48:24 -0700 (PDT)
Received: from notebook ([93.189.200.242])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ed4cesm4153300e87.26.2026.09.09.16.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 16:48:23 -0700 (PDT)
From: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: David Heidelberg <david@ixit.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	"Andrew F . Davis" <afd@ti.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: power: supply: bq27xxx: add generic compatible
Date: Thu, 10 Sep 2026 02:47:42 +0300
Message-ID: <20260909234744.1177153-2-rinat.muhamedgaliev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909234744.1177153-1-rinat.muhamedgaliev@gmail.com>
References: <20260829205258.26955-1-rinat.muhamedgaliev@gmail.com>
 <20260909234744.1177153-1-rinat.muhamedgaliev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a generic compatible for I2C fuel gauges whose device type is
determined at probe time.

Signed-off-by: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
---
 Documentation/devicetree/bindings/power/supply/bq27xxx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml b/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
index bc05400..f2e0170 100644
--- a/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
+++ b/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
@@ -21,6 +21,7 @@ properties:
     enum:
       - ti,bq27200
       - ti,bq27210
+      - ti,bq27xxx
       - ti,bq27500 # deprecated, use revision specific property below
       - ti,bq27510 # deprecated, use revision specific property below
       - ti,bq27520 # deprecated, use revision specific property below
-- 
2.55.0

