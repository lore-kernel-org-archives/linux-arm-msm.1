Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701A149E5D9
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 21:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385432; cv=none; b=k634r0xyVPoM62FHydxBEJLJUPZK/fFUmbVwCU2xlXK2iqrDMKwo4EeoVjOXeh+P3R/ksrirTQ7BeTrJVkZpAxmyaN8B3HLC6mLW8KXhNGhHSqrzwcD6JVfLl7qh3UsU3Hk6+pVjaRS3LpzaqqBY8qvI/kN89zFaYt2PtyQwGdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385432; c=relaxed/simple;
	bh=fxwiglhXR4Q7nwlPsoLX9Nwlsm7lWTtUwESSQgichcc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aQtCo6Uf1VomdzpOMXYlVgHGiddSj3zmzUGHvv5XvBuCf8a8TeIi1hyzdophQ3u+sBlyNtEG5zO3zl+sXRyEr3Ouk/0/oVCB4NAg6CEfD4KYrs7cyhYr9FXcw9XzhM1krE+XVg+1738KKodgZ2V2ROVkxETLQAiHKd2Gpp6QCxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=yv9kjire; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="yv9kjire"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-52f83889a93so18811871cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 14:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788385405; x=1788990205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3/va79kaVJkT6klaF+Y5C7zSsxoUwFUdvK7VB+9fIlQ=;
        b=yv9kjirek5RSzwhv5AD4AaNCyaFZcfN0WTDutgp8ge5isysLWuX+qHYeGJ8czA07Gd
         qcih7mxE9trtmA0LHGDep/5hVgPkkj3vYptynzz3Bcme9HxcfbFsGk06xDI3mAIpL8jp
         +98JgRb2cE0s328kg+E5CKj9Ui1e9BIzTST6FM/1cMBT0Qk+qlqRYrQDdwGW/9dJ5vwZ
         r3vTpMqD64QBlcBOZxJPKUE4Lr03QXAq3K9jOevbzk2cUCjsCOoJEt33oyHeNfL+mX3z
         VAQ5Zq3ONh1HSt+Q+AeLLm7DvvAioHU859uZc5D1aRQi4uDpMw2VcZx0AiExn7/jQGkr
         QAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385405; x=1788990205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/va79kaVJkT6klaF+Y5C7zSsxoUwFUdvK7VB+9fIlQ=;
        b=YAu1ccYwJa0h0ETF85PDIa02OKwNlMDxeQTtk/9AxTOoTVX2Ztto01wernijd0LE1y
         XjIHYI5o7XWUVXoMck/j9n8cWG7FgzdMP4Hy3XJ8i2JFXY9ctxMJhXv6DDMHhWC23HMD
         OhXNNLuRahozX04kTjW8TPIpHGhjUO62wkTjfZJeAPFJv7QBnEZd59XtCED7WcWqllQV
         So+YaZ6ZC4YRnpE4ggjY1CY8Uh/fDE5lAdCHvc3mosbDUOZ0+n5VNcOa01E3tAfSEMEv
         J7YkArtAeAC3sTDmzwGBa1OiHa28vuoeHN0ZK5r+K6maZiNJFoNIFMbV84mwVz8+no9J
         zk5A==
X-Forwarded-Encrypted: i=1; AKwUvBy4WEb8O+UROvt6c+DspHe6kxf5jjAQxk8KvksNBI25TrpmYkK002W//hmxbFvRRSklK6bdCetgUyDn/59A@vger.kernel.org
X-Gm-Message-State: AFuF++lMldAz0j32FaI2HLTSepzK9gHnTptpcCidk2r2dFw3lAUD77e5
	9fiBLJES/UIWG97dVYFuWjMNyhRRgjxvC+AeB2DKCXv5ywIRZJUUouvzJ7sTMgdw+FQ=
X-Gm-Gg: AYBFou2hZOqMtPwmQAv6BqKfWViznuyxs8jhHPJh6/ZB93biyjsi8BRT6BJ4Z22juxb
	5ZyLmP9pI50cSfFrAePtqiNAAraM0qDlKDXwEE0q/YJmXQrl4QWbDq98kBOg/EWa9ypOok+6yzW
	MYIsve/dbtt6TwqILJqKY4i5pZUH8hZHEQkn7G5jejQSfLlAiF5X5Z20VPDaFwwlvFtNjtXNCKi
	aQ/OASRn7lFTeH0vxNEs4/J9MXJ+8zWPNxi4Qgo8Sz10ePgrOD5NR9J2STcqrGRXOSmWih4rNP0
	x+fXj8grxdhAyEoTaVKKrpEpchNvGL7jgJLk8iJNyFvJMJUSp6ciGNnWmaSLKeoe4RGYxxdoxuT
	kTj3WoF6W84urCITadfq5cv55+A7EQ2baHGCBXzSkKD1e5YcisAcC6Z2DlqLjZGFJTZb/nTnFBM
	qjLfmeRsIRRWk+Ytt94Ax5TRzFY0GzNVdgSWJYo9kCQgW0aUB7bEk3oC33bi9kdAc+7JRS6UOv3
	D9+Ug==
X-Received: by 2002:a05:622a:cf:b0:52e:3a38:8cb0 with SMTP id d75a77b69052e-53036bf90e3mr86729401cf.12.1788385405055;
        Wed, 02 Sep 2026 14:43:25 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee06d30sm28372546d6.6.2026.09.02.14.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:43:24 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mani@kernel.org,
	krishna.chundru@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	sushrut.trivedi@oss.qualcomm.com,
	umang.chheda@oss.qualcomm.com,
	rosh@debian.org,
	jsandom@axon.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] arm64: dts: qcom: clean up PCI function nodes
Date: Wed,  2 Sep 2026 16:43:14 -0500
Message-ID: <20260902214321.1721477-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While working on upstream support for the Toshiba TC9564 SoC I
discovered that the way its PCIe endpoint function nodes are
defined in devicetree files is incorrect.  Two issues have been
pointed out during the course of review:
  - Only PCI bridge device nodes should contain this property:
      device_type = "pci";
  - Only bridge device nodes should be named "pcie@" (or "pci@")

The second of these was previously addressed by this series:
  https://lore.kernel.org/lkml/20260901172058.1512508-1-elder@riscstar.com/
Instead, those changes are now included here.

These errors existed for the RB3gen2 platform, but five other Qualcomm
devicetree files had this same mistake (all describing a TC9564 SoC).

This series removes the device_type property where it is defined
for a PCI endpoint function, and renames such nodes "dev@".

The #address-cells, #size-cells, and ranges properties are also
removed for these nodes.  These will be restored when they are
known to be needed (to implement pci-ep-bus sub-nodes).

					-Alex

Between version 2 and version 3:
- Added Reviewed-by from Abel (and for the last patch, Mani)
- Renamed all nodes "dev@" rather than "pcie@" or "pci@"

Version 2 is available here:
  https://lore.kernel.org/lkml/20260901013654.1343537-1-elder@riscstar.com/

Between version 1 and version 2:
- Added Reviewed-by from Mani and Konrad
- Added a patch that updates "qcs8550-rb5gen2.dts" as well

Version 1 is available here:
  https://lore.kernel.org/lkml/20260807195846.456079-1-elder@riscstar.com/

Alex Elder (6):
  arm64: dts: qcom: qcs6490-rb3gen2: clean up PCI function nodes
  arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: clean up PCI
    function nodes
  arm64: dts: qcom: lemans-evk-ifp-mezzanine: clean up PCI function
    nodes
  arm64: dts: qcom: monaco-evk-ifp-mezzanine: clean up PCI function
    nodes
  arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: clean up PCI
    function nodes
  arm64: dts: qcom: qcs8550-rb5gen2: clean up PCI function nodes

 .../dts/qcom/lemans-evk-ifp-mezzanine.dtso    | 12 ++--------
 .../dts/qcom/monaco-evk-ifp-mezzanine.dtso    | 12 ++--------
 .../qcs6490-rb3gen2-industrial-mezzanine.dtso | 24 ++++---------------
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  | 12 ++--------
 .../qcom/qcs6490-thundercomm-minipc-g1iot.dts | 12 ++--------
 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts  | 12 ++--------
 6 files changed, 14 insertions(+), 70 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.53.0

