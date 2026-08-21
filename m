Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D626236195C
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 03:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787282748; cv=none; b=SQ0hNB5GjgxALcnc/qiGZqyD4aG/I2xHii+/bmpM1aaT2t4VcPzP4bOHpGIZ66haoJ+5A98e7SUHQUICNpCkcgbUbuTorO78YyQqL9k0wBXm5OWc8auT/b1sufZ5/XL6+X3WIWhocVJJrncdatCl2yx1cuFVYxIDZGeYSrl10vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787282748; c=relaxed/simple;
	bh=rTKRF6vf9ERjKXH2kWeSUEnOuoEvK9n2OVJj1+dwk5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MMPB1HVmms1ELJxeO1Np8Nb20ECCCMAXEVj/RwEX/cJxIaz3evGwcBuVcQ/RWczsH+8tTpZYMrZ0WVv0DGiESsoOjxu2z1ft8sMOvIgUoKslLmaI5BnHPc6MfZx4rF5Ot5ZSLTv/TwuRqeGJBHvakc6p/LbWaYJjFF5+xf17OUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mswin.me; spf=none smtp.mailfrom=mswin.me; dkim=pass (2048-bit key) header.d=mswin-me.20251104.gappssmtp.com header.i=@mswin-me.20251104.gappssmtp.com header.b=OJ/0mm8N; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mswin.me
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mswin.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mswin-me.20251104.gappssmtp.com header.i=@mswin-me.20251104.gappssmtp.com header.b="OJ/0mm8N"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so1245984a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 20:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mswin-me.20251104.gappssmtp.com; s=20251104; t=1787282745; x=1787887545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xBrYAs25F1BMwhNxYWXrzzIRZUTRoKOsBihavlqCIAc=;
        b=OJ/0mm8N7QawBJb3JhgM6HN7n6j3q19dTqoKGXWHe/Za4dJOaZCdrJM5Q1cBKPKakL
         Wls2lFcEfgraXHCPSPGFI3xuKrrlsGigWgdvavmsaKIszRCojTjtsbCVg5lJ5O+IrekL
         I8sWgIirubW83HuMVgQjbZB0upcFjYiQfhavZolTTAtGQ6Nxsdl8ObUinNzTtq4CgJ5G
         I1ZkwCHL4yAY41G97Sgms+NkXDXlEr3SRU2wcCHQ0gDdv/gi3kIrqTHNQGrVOqm3m9fg
         KxFMUtXKHRIrbKYs75RW4ilHzu4OjPyTDGIAXFe8zxrb1EzUNEJUqPNX3hSgXLzYirgy
         /0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787282745; x=1787887545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBrYAs25F1BMwhNxYWXrzzIRZUTRoKOsBihavlqCIAc=;
        b=GLqMmkaXK06t+4HXCKjJtG4C4sKwLcM22XyckcHLAcoHZXyP8PmdCWJGD81Oflk9qB
         vQIjuKdzSjUz2mooV4vJBSybY4v2/akTNMdei+Zq1SYtEBm0iMyTbgnGvh15sMLrGDsv
         32Jn9cKf21wqnVWvnEgNglDe07b6LnrNHYOQfZ8o2H/wm4XFs8FWhzjuPMc61hMdk9KX
         ogIXz4cGL75qx5heZtpXMotCdPb18dgnC4k0IGjNplPo4049rgqy7h8qV+nSC8kaqBiB
         yx086Oq5C+z8ev/muXMc9qJyKMJuPpFMQIZLYJPh/CNs+GM4OAlKA8ckUVIR2V+Z4U1Y
         +QYQ==
X-Forwarded-Encrypted: i=1; AHgh+RoepC52K4SGGYKw+tUJ/kXZLhGXJE1JXAeQ/bdjR9bxAHBJiYe/66kcxjfeqpwN8bNN1J+59ihd4ljlgqTx@vger.kernel.org
X-Gm-Message-State: AFuF++nQXImRYsW1VfkKgqKUTcL+/A/MjbfyS0rEBzpkiogO3hsZwciE
	eu/jgrOTCmUfrYOYR2yhBvKbwp7kXsJhQDRHqyGvszzOhoWSC7Io50Um4k9MvIBU9ao=
X-Gm-Gg: AR+sD13VGskc7SaHO1DmmLwo2wfAc/LcF+5Dtbjf/elpnV6gMKq1j6N4mUyZGA62geC
	dHiuVivnZk5Y/08sSWrZMrKFHyTnwDRI2UUoMuo0qLLO8pyx5PxQrMY7vgoy06AJSJNjLQ0JHZC
	/OyA99paFCDcP06WIFpagaGKMmsavg3jZurhVCTqszK1fSCiaghrvZObk/1aHZvplOIv+sRwn92
	zjkDVQ8lTIyNEsSgaqJPmZuZMDOB6vjCL8kOuNSV2pqx9CJF7nhrGyi73cDRVVPdy+f6DXhYD9d
	CkUWI+HNtiw6gFTBnPHdi8NjdAsiBwz6a0ilM/dawH5s1pHHP8fq5v2PejbmRVoFAeQ3d+OFLLY
	lsf9hM0ceBegAz7ERz7nhmIV2TdMyEQeCwo0m76xa24fhQ2JqAaNmtZ5LSeksEFvl7SzUAyH8ul
	/pLqdhoFhL6kkDDm8rLeHOMVXrJfAe6UpH/WpknA97ZFX0bv4VHPDcaYTT3ia8YwekaMJbKl1M0
	kuL
X-Received: by 2002:a05:6402:1ecb:b0:6a1:f95b:8ced with SMTP id 4fb4d7f45d1cf-6a42f153920mr3334475a12.4.1787282744913;
        Thu, 20 Aug 2026 20:25:44 -0700 (PDT)
Received: from zephyr.int.serkovo.ru ([85.17.200.167])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff177b1esm4217194a12.29.2026.08.20.20.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 20:25:43 -0700 (PDT)
From: Roman Linev <admin@mswin.me>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Roman Linev <admin@mswin.me>
Subject: [PATCH] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: reserve firmware-owned DRAM
Date: Fri, 21 Aug 2026 06:25:41 +0300
Message-ID: <20260821032541.1856299-1-admin@mswin.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sm6125.dtsi sizes reserved_mem1@46200000 at 0x2d00000 (45 MiB), so it ends
at 0x48f00000. On laurel-sprout the firmware owns 0x4900000 (73 MiB) at
that base: the downstream device tree overrides the SoC region with

	removed_region@46200000 { reg = <0 0x46200000 0 0x4900000>; };

which ends exactly at 0x4ab00000, where mainline places camera_mem. The
28 MiB between 0x48f00000 and 0x4ab00000 is therefore firmware-owned on
this board while mainline leaves it as free System RAM and hands it to the
page allocator.

On Qualcomm a "removed_region" is XPU-protected, so this is not a matter of
reading stale data: the region is not the kernel's to allocate.

The observed symptom is hard lockups under sustained buffered reads, where
page-cache pressure eventually reaches the disputed range. Before this
change the device wedged at a rate of roughly one lockup per 59 MiB of
buffered reads from the SD card, reproducibly enough to fire on demand.
With the region reserved, the same workload has run 691 GiB of buffered
reads with zero lockups.

Reserve the delta as a board-level region abutting camera_mem rather than
resizing the SoC-level reserved_mem1, since other SM6125 boards may
legitimately have a different split; sm6125-xiaomi-ginkgo, for instance,
has its own corrected reserved-memory layout.

Signed-off-by: Roman Linev <admin@mswin.me>
---
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
index 139f2b401..a6ee6ee80 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
@@ -37,6 +37,20 @@ framebuffer0: framebuffer@5c000000 {
 	};
 
 	reserved-memory {
+		/*
+		 * The SoC dtsi sizes reserved_mem1 at 0x2d00000 (45 MiB), ending
+		 * at 0x48f00000. This device's firmware owns 0x4900000 (73 MiB)
+		 * there -- downstream laurel_sprout carves out
+		 * removed_region@46200000 with that size, ending exactly at
+		 * camera_mem's 0x4ab00000. The 28 MiB in between is XPU-owned
+		 * on this board and mainline currently hands it to the buddy
+		 * allocator.
+		 */
+		reserved_mem1_laurel: memory@48f00000 {
+			reg = <0x0 0x48f00000 0x0 0x1c00000>;
+			no-map;
+		};
+
 		debug_mem: debug@ffb00000 {
 			reg = <0x0 0xffb00000 0x0 0xc0000>;
 			no-map;
-- 
2.55.0

