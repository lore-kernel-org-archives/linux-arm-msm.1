Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AA1488235
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 22:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787698657; cv=none; b=b3Z9hOj5o4BlI3f1zclhXfgnIy/fzp3RUYNFq6OTon3jfvLKsVKflpRNC21i5F0p9g8t05AhESP2H7mllDxRajDR9Uh3awh3x6Bt2DozG0UqwEtLOsImeT/KwtbAdF3a2An42vutirojfsgDktmPmgTldNjZvkK43sgYVYDs4XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787698657; c=relaxed/simple;
	bh=r7Nf0vrfC/yk95uHEvdhgd6CN9hSj98sOl1TyWYo5SY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Iom4JVVZ8PLMg2CuHgP1le6rekAbZF++znjKBcfbXpfY0pZiYiUTCUCMmImXNAIcgQG+cHzoOBzB3W5nz2UO9seWG/GDpqNZM0iV5EfJWg/uqoLR5ynXpZ9CMBPguztik3gX+4ifp1CLghQDGNqZjYtgP9r9s6J68F9X7SJ2zrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqdOD+Nd; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqdOD+Nd"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482ddbc11aaso247921f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 15:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787698654; x=1788303454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c1/cZi9z2hTKPa6J4VLugbiN9YQFIA/hLn4SQSIb6CQ=;
        b=XqdOD+NdDT1esTAg5rvcBaxCZFduhx8lAEmUUcyBPSWS6nMuU1WzSt4Jbi+cuZqCh/
         +RIq47ubEPeVHBzL9VQC5BDi1VBZD2FuyfayHpHABN3A+VGG23SDPkXwvKPcip6SjYnT
         Kk0K0lGxz3ykXfUO30tusaMiA3m3O2KVTSExHkcEYc816zxzFjafy7cHRuS889L9BfWO
         sYrfduv97D+qUJYpmOtgoj3SZpfbwJe73mIra2aOPF/wvmdahmrAbQtnXuZkAxQI63Ff
         CgHHVkGmjBu+xnsGguMHykW29ntQpDbK+OcuMoZW5S6bOgFmedjkZobTa63wQOnrUMSp
         EIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787698654; x=1788303454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1/cZi9z2hTKPa6J4VLugbiN9YQFIA/hLn4SQSIb6CQ=;
        b=C2y0B69pTDlXBxXlJnGmyFhVcWysglpvCyjgxuFUcNFUQrqqbUqGXngvhUbIzdhwQ8
         SAXwa09WR/MCyd13dt6hfOm46mZo/GD/fzKANbxREQu/JBIFV9Q6E/iQW3z8441YLKxH
         fQA6Mfhgv+DCXJOhsOI1ldCCdVqDJ0RWL2V1+dnxpsRUq1EvpUeZs1iOrxZbFyVbX5gV
         CQKUK0axfV5cLYGpf5ng5gNgnVlOEf2r4ori5tyEeepOCHMopxCs2aU8k0QUCwvfofmQ
         +VVUdzIdKFAOB63/gR6SEw+6/O0a8mQZKJnMbCsp6+9dt9qN+JxjkzLJC7423/A6Ngzn
         JwTw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+lze9Cr/+hY/8EjDV6LyrkkjdSxz+ZNepjdy0dSgHTfwx6iMsZtIWaY+pQYJ94u3PK0SEg4wUhTradNvA@vger.kernel.org
X-Gm-Message-State: AFuF++nxIy7vTmWP3qH7/VHFlJKOoxPGjROWVTrlINqX3tNcGEI5JVjZ
	DCpcTiVBLGpSPNgSSYg7Pp4TyYel1oCh0gPZaseUkhGvxGvpq33YaZJ8
X-Gm-Gg: AR+sD111CiTsxgQXVUWJ6U5UKIP/tnbv/wpKKTbg3PMPcKgUxl/8/vG3cDQlnOvJMQN
	TguojLMdL5W4arKwjMlBsF31cQivW2kMUTq5XL74o+uTVNKeOROJbiAvNyQ3wZWpg/Q0AVqeMiX
	OCl1xB2lIblh7vpTP4YUDVoKE0ceBjB7xun9am0OTHz20ryB8SQycimD2lXSVNnhYwX0NYW+NVI
	JzQJ/UykajweMmH/TVLfEXI9VhbWiU8c3f0bP4KJoj47N30FzN2yDl13BrhczKtChUfPxSydZOU
	Feu8HI8NtsHZEv8gfhFxWXJRO/cbTb2YXCiwLBUMafiF//xrCbJuVc56fLwoc0WdUjqjBRD3Hrr
	0zymYu2PqWZ4EcU6CxIihlWLrdLkXPql/cj1XUVZRbY/JEYIvMeoIxoUOPMa81SUaBeCWy1kl+C
	oPbU1NJuwy313/lF4knNw4E33kKRbeYVXZBxg/wu6Z8f0gYijMt4xnzaxjXqMWweuG3uh2Y+EXq
	laXi1JIh9yIZ5GGuO/uIfyLr9s09yAa0FgnE7rdIJ+CSSdT
X-Received: by 2002:a05:6000:40dd:b0:482:e2f2:19ca with SMTP id ffacd0b85a97d-482e2f21c8fmr1424121f8f.6.1787698654143;
        Tue, 25 Aug 2026 15:57:34 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f6917sm782658f8f.35.2026.08.25.15.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 15:57:32 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	qiang.yu@oss.qualcomm.com,
	mani@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	krishna.chundru@oss.qualcomm.com,
	linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH 1/2] phy: qcom: qmp-pcie: Select MFD_SYSCON for the multi-PHY driver
Date: Tue, 25 Aug 2026 23:57:28 +0100
Message-ID: <20260825225729.230493-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver reads the active link mode through
syscon_regmap_lookup_by_phandle_args(). Without CONFIG_MFD_SYSCON the
stub returning -ENOTSUPP is compiled in instead, so probe fails for
every device and no PHY is ever registered.

Nothing in the build catches this: the driver still compiles, and arm64
defconfig happens to enable MFD_SYSCON through an unrelated select.

Fixes: 1781be3c8a5d ("phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/phy/qualcomm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index d910a5d1a1ac..9113e1099245 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -81,6 +81,7 @@ config PHY_QCOM_QMP_PCIE_MULTIPHY
 	tristate "Qualcomm QMP PCIe Multi PHY Driver"
 	depends on PCI || COMPILE_TEST
 	select GENERIC_PHY
+	select MFD_SYSCON
 	help
 	  Enable this to support the QMP PCIe PHY transceiver that is used
 	  with PCIe controllers on Qualcomm chips. This PHY is a single
-- 
2.55.0

