Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD533F4118
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462149; cv=none; b=UJH5Ikm3YEyfVp22GEryM5TAWD3NBDljcjQ8Y2qavaoSrM5HTNUuAy8Uq8ihJ/DCa8ZVJ2nEO5l8+pJyPBJBikg8bXypZmz8vN7L979reYmNQG2v7GIeEj1M3ai7cYoOUR2kJ7rEC/S4/niQYT6LDuWvY7bGQLZfeDixp0jdcaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462149; c=relaxed/simple;
	bh=mESwcUgnY4hSuLD5wUfdmAvrd84CKeSJFHVV5uh2x24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZtPASdIWsC8VY8Td6QFZcJ5BGMEnJt+U16BNHiN/D3gHzLlmb2YnqixqGgDQn3ku3/5E4iVSzRbCqgtMpKYgYIcfQ7zQvZyl8pfezzO33TxlLV8awa/ctUdFN/c/c7t3swDMDnPZqrI5StRujhy+XRPYhItMfMBxHUqPxwHh8P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMh+ErFI; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMh+ErFI"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7dbfso5586866b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 01:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462145; x=1790066945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=91cDWVzZq62wwmW7HgfZRk/lOzzdMa8vn0rrhB9d7TI=;
        b=WMh+ErFIOzp+ESrO6ukFMpCsIbKECAWlngncFaUtwGlETK1y73eFs57MowX75YmU/a
         wrFS+0SxHmvDuEyo54/tE5bhwmlvNkxvMglTugX/AYmwLHmzdF6Vgm2pllqaGYtQQYw9
         /9Z3NeepOfywYgBtBaCMWw6jIBvwJwxNIUnmtF7XE/8jIDvjiseTdAj1081cCrFGiezU
         16d68dOEiSEe0USvZKdxdnjG2sYqsoCRIsBsieVu3cdKb4Lrs33JB1IDh5t9xchwvMdL
         DsZuZ1I+ClR99xJrOl8UQOf8CfjSw4RPgwWZF2MiYPIz7wmoLiFGGDKhUclfBBGVKzB2
         jL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462145; x=1790066945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91cDWVzZq62wwmW7HgfZRk/lOzzdMa8vn0rrhB9d7TI=;
        b=qol8Lw6dOJ3MbtILoa3+6daZrv3ZqtQAkDBw2saxNB54qXmNYWGlRSf9irBzsxveHk
         Y559/8pCrmOxMkyiaEqwF1TrXP9dwgjkiTijKagHgbBGye897jBJGLVkMd7H/OX6SA4/
         8N9+xjQ8XN9e+pKqhuFddNL1EfSEzVAUHh3QurCYVeVNcs989E98bPnuEieGMjsnwZWR
         SoAJLQS7i/rszawpCuIA2UT3eRgA0niy598bKVQ8NbRp/iC2jdBCj3Ph7XSMg50fmN4H
         G+jJME6+yovuaUGkQXYpCkSn3rDc8rFUmgZ8JWYiac940nGr0e/W0tiI5a6xs2DtVkhV
         vJQg==
X-Gm-Message-State: AFuF++npm2kuCxOhF1lj4IylzlCcQNUZ/ZtKOwNI3gca9esAcSKwVNny
	/W3ZUuc1fFdHrfKL50RLNFyXlwNp5fybdtPkOGQSkxrJRYJlE3DX5Kq1
X-Gm-Gg: AYBFou3T/71i4mNJR19KFH2TEqwSznwWZ0h09QMg0bcNLRdMCqP5ZjONznVdHPRwm1K
	t4Y4YwH0vWB83l7eA3OwcAR4y5HsC65rgri/GBHP/tlonVwGk7FlH7BVZ2nSBRquuDQVFObpOMZ
	m/rLmDt9RGIncrrooVXH/tRJY00FHRanSMmGpIKsJP6NbO415goivbJ9vM9sP0ZVaFM3OAaQ/hw
	Wxk9jAG1zzdldkOo8RU8otjUwEXssufu9CxtDkE1byA4CVYty96ae1V0pJoxEnlpFvwMP47OswS
	OOD2pwOepRAi4arhw4lM4aD5pGmoWtKxfLzuLfWGtNowbpnqvv6T4DpFPK6GRfiPBHBNrPif645
	JDz9Xc01kPflKSbkE4XFYQc8ga7o4ADhPKh+8OWRC3W19CbLVA77p2g3GRScWU1PKcj3LT0bYN4
	Tx5ois8ILRLvtWKlR9faMD/NoLnzaSBhZOycBdkL2CuGJ+6oP3yeYdrvOEu2c1DYkeFQFS5ecWg
	LMRb6tCbRRSUi/CouuowUaznspBFne9
X-Received: by 2002:a17:907:a689:b0:c20:1c9d:8d4b with SMTP id a640c23a62f3a-c29d7717430mr16781866b.2.1789462145411;
        Tue, 15 Sep 2026 01:49:05 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966067101sm552702966b.35.2026.09.15.01.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:49:04 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v4 0/3] Add Xiaomi 12 Lite 5G (taoyao) battery support
Date: Tue, 15 Sep 2026 10:48:58 +0200
Message-ID: <20260915084901.56622-1-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xiaomi 12 Lite 5G (taoyao) has an additional property with ID 12 that
breaks the parsing in qcom_battmgr. Fix that by introducing separate
maps for lookups properties in both directions.

The other approach that I tried is manual shifting properties:

+	if (battmgr->variant == QCOM_BATTMGR_TAOYAO && prop > BATT_CHG_CTRL_LIM_MAX)
+		prop++;
...
+		if (battmgr->variant == QCOM_BATTMGR_TAOYAO && property > BATT_CHG_CTRL_LIM_MAX + 1)
+			property--;

But I found that more obscure.

Will be happy to switch if the maintainers prefer this one.

Changes in v4:
- Added Konrad's r-b (patch #2)
- Dropped RFC tag

Changes in v3:
- Fix QCOM_BATTMGR_TAOYAO enum ordering (patch #2)
- Order in qcom_battmgr_of_variants[] is already right (no change)
- Revert the qcom,sm7325-pmic-glink SoC fallback (patch #1 and #3)
- Rephrased commit message (patch #3)
- Design question from v1/v2 still open: lookup tables vs. inline shift

Changes in v2:
- Keep the qcom,sm7325-pmic-glink SoC fallback in the compatible chain
  of the taoyao pmic-glink node (review feedback, patch #1 and #3)

Stanislav Zaikin (3):
  dt-bindings: soc: qcom: add xiaomi,taoyao-pmic-glink compatible
  power: supply: qcom_battmgr: add Xiaomi taoyao support
  arm64: dts: qcom: sm7325-xiaomi-taoyao: switch to device-specific
    pmic-glink compatible

 .../bindings/soc/qcom/qcom,pmic-glink.yaml    |  1 +
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    |  2 +-
 drivers/power/supply/qcom_battmgr.c           | 86 ++++++++++++++++++-
 3 files changed, 84 insertions(+), 5 deletions(-)

-- 
2.53.0

