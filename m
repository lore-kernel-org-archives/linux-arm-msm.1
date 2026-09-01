Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BA8488224
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 17:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283266; cv=none; b=mS8BAUcIxy6oYPQ9kdT7rx9bC5IGmeV1gRa1RwtVh6EmCfD3G6XSLBdD7GubZKcU43Jl0AWFvbrftrz0xTfh1+JurBfpPHv4+DjiqLMNoVkC9ifv+ZqAoj+0UfLCLoh1jyVAs1tM5iOIv4FHtlSkNAT9CSdbfp/Oqx24dA/UB2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283266; c=relaxed/simple;
	bh=ZQZ1l5fYm5WuqOkU5KgBnUMdFxCFcIY2eQfRbuZVmis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iCMQqFkWokcDqg+GCh7OgxS9GH10eu36mFESMuvAsx6KDW5Ms8RlMgJRfkd6cd497vWfmH7W5/ku096M/tmEP3f02PmebM8XrMCcqZ+wXdUM2Udh1YJGPXVD0iPAwWwVfXGoN4H/ionLE7x8xDOS2YlszM/CWZ+RZ1dMx4cmDJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=0Vc2V+eU; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="0Vc2V+eU"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-52d7a3defe8so319611cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 10:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788283263; x=1788888063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uv2BJxLvaZZpFr8An2zfM95tRAb7/Mj4O3Urh0xixiw=;
        b=0Vc2V+eUC9r7b8AcTlg0ogxQpAf/XF4GU5tIF4024uTSWNM997dEZS+EgpGgRDbU2+
         mujZr7SfIX5cQKWNjCsBkNN3P75naIZsNlggTrR34XYTFXqHjgfizKL2xQFZDvbVF+Vy
         UYVfg76+a+UK2UytIioxjuwcMRBymeeQVzAbm/t2+kLW8WVnM1ECmQSHlLIaMxlFt2DX
         hG9BgCWoHnGIRMm0FapQkuN4g6Nvy5B/ZEi4PhY31dUQUJEY7PQqYTRNzmMON7K3DXaq
         0yLHHy1YeXe5+1fS0uOw6tTPxJaINtRPMteUKmroi1LHXFUkZdTQV80HM1O23acvwoCn
         Vtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788283263; x=1788888063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uv2BJxLvaZZpFr8An2zfM95tRAb7/Mj4O3Urh0xixiw=;
        b=UHlag4hKjNnwYwmXQV9PDZAePfU6ZwtAxD5mAGWkOOPG7Vitgk/KQgWxqkW5RcUfXa
         dqBfzRH1lceHcoq0ht5jzCR9hwoQj7UJV2+7OIAzeNYow8fY4PsHwxXsth4URIyHyURN
         7uf7V9At/pBtw6agxRS7J+8RJ13yZO2kpmv1Lt231fFp0ZQiRxPsI3FsLvmUTA38a83+
         37tMSlnkdQ+XsKUNLr7pc44vuveMy17sHJYUspcv8l6VsYT8q6+dgySYc3nLvrQX8m6+
         z+zKjvtB6wvwlG5Zl684D8nfS8sys8g0W2TBtuqyXG+fZ3UMsDVT0aBkW5Is080FQPFZ
         T6QQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRJSPP6JEwOjU1oJdWDNKhXJ60evIjXPIkexeNWkyyEilp0ohDJlXWzVLFhVI50KIJKWcxZMPxnMma4ldm@vger.kernel.org
X-Gm-Message-State: AFuF++mCu27sLlOzA/ZziTiqu1mOdVY+GzhN0JdxvSkASe5Xc+ndWy2Z
	EAEpSeTpPfT69RRO7vdFTageu2XtQHaRYBv702S7F3h8hh08opA0YgDOrVTs9GWxFfg=
X-Gm-Gg: AR+sD13sm5NiU05QFlN4Ck4laSErBKzov+va1IyAKWHifPtpD0XZckEA/qK7+lxis4+
	ZHmUXZQMgEibu8mBPxq/BwTzr+bo/3z13qYZs2gxSFjJEgHEoMyhzOhsmXXBIwzlCQ/T1wwjCqp
	QodOIQ5kI1HXYkT/rBCgMUv8uXMThIg72DGgKbUAlZQ8jqew2mH2G19IyoJ9Gx8bLv14vIYG54r
	6Oqs/88xT59P7INjw1jp6xLbom6UH74HlHMUWiFzyvj6pxirH2/+l23CW8PtP5bYYT1eKGyQA3J
	ZRjO/7SIvhQSHloAFGjNw1p6vDa/1pdag6NWWLde7IZiq7+xwaWWegN/rs1ChyQQtHXr+7B43/s
	JOQybaXvxpn7VvLM766sYSDrmVsg5YeU3k81lhNJQO+69z5qQPHu7DCr0DRvxsH7q1wlVOJaXTD
	1Xz3oCfh3Ay7yskeicPG7jFUh/id4rSWYJNF083VQlAG9nOK73OT0om3dFEiM8Q2oHFA==
X-Received: by 2002:a05:622a:116:b0:530:d3a:26d9 with SMTP id d75a77b69052e-5300d3a40d6mr195978991cf.29.1788283263394;
        Tue, 01 Sep 2026 10:21:03 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530331d9cbcsm1423661cf.16.2026.09.01.10.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:21:03 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] arm64: dts: qcom: qcs6490-rb3gen2: use pci for device nodes
Date: Tue,  1 Sep 2026 12:20:53 -0500
Message-ID: <20260901172058.1512508-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901172058.1512508-1-elder@riscstar.com>
References: <20260901172058.1512508-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change caused the embedded PCIe endpoints on TC9564 SoCs to
be treated by the devicetree code as PCI buses, which is incorrect.

An RB3gen2 system has an "interposer board" that contains a TC9564
SoC.  The TC9564 includes a PCIe switch with one upstream port and
two downstream (external) ports, plus a third downstream port.  The
third port has an embedded PCIe endpoint with two functions, each
providing access to a 10 Gbps capable Ethernet interface.

The devicetree nodes representing these functions were previously
named "pci@" but were renamed in the interest of consistency in
commit e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@").

Unfortunately, of_node_is_pcie() causes nodes named "pcie@" to be
treated as PCI bridges, which PCI endpoints are not.  The previous
name "pci" matched such nodes as "default-flags" bus type, defined
in the of_busses[] array.

Rename the PCIe endpoint nodes "pci@" so they are not mistaken for
bridge nodes by the devicetree parsing code.  This restores the
previous behavior, and allows them to be used for PCI endpoint bus.

Fixes: e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a13315bf0fb07..99a985a177a61 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -954,7 +954,7 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pcie@0,0 {
+			pci@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
@@ -962,7 +962,7 @@ pcie@0,0 {
 				ranges;
 			};
 
-			pcie@0,1 {
+			pci@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
-- 
2.53.0

