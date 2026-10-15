Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEAD388E7A
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075136; cv=none; b=TlKpux0SKZwgb9Fy6wj5COAWAYbB0THcYwsYmNoymMF/fg8xlTQ+jNQk3RRVaoIAO//Ko2875BsZVH5iO8VVxM3SFWvYUs0ghQzHMM7lczIM4PswnrYwZyptItI7SuGwSTb+THGkADavduzils4ljAICAiHgajRD8Ri/O4/D3Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075136; c=relaxed/simple;
	bh=0MHY/DXLJSGlvlK4hfQH5ps+wyuy3lgdtPpSeRBwJZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rv60Kn3ZlQp/0hcp/clu2DP0cpDg9vfyMNhHbLoyUcqpEeCEYVNp9fcbGfNd7Lw9MJuMqRZIBQd/DEpMlO6b0rCmy6JgpaZ2rj7AGECWujHVGm+gM1aHLV269iKJ/jtQsRVYF/FXRb0iw9gvyP8TJ2CwsiIcQVLGM139me3N9SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=aw0nctY2; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="aw0nctY2"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93e6eb77f0bso136907185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792075134; x=1792679934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FyxQZm/TWmVMDcMFzjg+LflT1D2OtrWSrFPMXdJ9T9Q=;
        b=aw0nctY2uWrNLLvxCvpBKlDeenQ/Dlbpc9B/OmDRgyQ2QaRF1AdrPKgn/i3vXsWxYx
         zmzyGTIvQrKrSY6AWc/MfQ7mj88tyN2L5N2tJoxGlH7zxMEmrQJfPvdB5f7G3BZ/VZWM
         cvtpeNYqsLpGFcy0uEI8prkkl1GS+Q0GsdeiS6N4KVcC2uD/58pRHMDgbzfbtLAuM2Z0
         nv0+xxgcrMKhJVRO7/IwOzugu+rdg2IVjkzs81kClKpp+tvERx3aAIRxYmBjGXkTA0Yc
         tmRFDNJLrIuwi9bhNWbr6urex9Xl1m35bvQoVeoOCiOdW7DMFyNcbTIotHqunYAfUDLx
         zl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075134; x=1792679934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FyxQZm/TWmVMDcMFzjg+LflT1D2OtrWSrFPMXdJ9T9Q=;
        b=qVdvJbnt0UEDVVavtXxDcifHmMG5FlH3SHjrqWwNfNq9fWrb4eCUBY3d3lvytm9GfV
         sj5KztpJMh5aJj+rVf7Zlm8IEOXyhJO96jgHuhDTDw0u2J1r9FjrskbH44gPVPBx80L2
         kK5Fgb+8R2Hdxq2eEJclKRyvKa7brlXjiA8Hjnotrq4E2xusGvYJE8mHU3rHjaoZvXEo
         lxccZkF0EoV9YTENg9uj/qtvyUhII4DQkVddZD2JbduAQ9mi+HJpO1Vb93gda1x3rlB/
         z5bRz8thjHjgXx8DeWPY6anUDb/eOlk/iFll+SXLBpItLcyrGYJJhgX2wHHDklmeF+td
         ZOAg==
X-Forwarded-Encrypted: i=1; AKwUvBxvSkAGNjjt36oxTTqia0cWoa+ROzoODsOZBLww7DBlSrf4Mc8XHOVZPeYJs6FmdoJ6EzOjxjeBEGwEJ713@vger.kernel.org
X-Gm-Message-State: AFq9FYJhc4JVCOhUljrJO3IrYPkLoVt8TCTjxpVnNxMCF+LcxFg4mYqp
	IsqkT7bB1MaDzownHsXXqYcg1tHT+Vxw//PmH5X0hm8f4AUFD4YOW92lke9mr5pxJuI=
X-Gm-Gg: AYBFou2pK3+lohZeRoOGZTBkyFj65N9ciLC4IL4gXJKT2jMiMsySPjXobWkeBXp++zu
	7Mk6ocuwzl78Vxsm0IDDwhMTwXqHtHAMMfJdH5x6sDymF/YbFsx1g7a5mpjkItC1dilSuEy4Ktm
	343UBdpncywokAEo9jpB/sZe+mCyWPTdFNqjq2K1kXnCFzO88F/7g2UhMLPfstWxb/hgDo3F09y
	Vg4U2ihO/UM/0awPOEQbnlT69gXmltvV5gZPGZVyS1Wny8FRAUQm6rSTeRWaZO4oweIPVTlWSd6
	w/mI9m36l4s2lynW/YiRiDu3LTK86VkJ5I3BcoCw2HQQ4HbMwlG7WV8X4iAHmHdUYvzz8Rpn4Ny
	BPhfsB0LKtbAmoVWIXUbLlIchaJSu2kTtNZOT62qP4mvU1VCqXUJa12Mzme46L3GIMC9JykZgjk
	/ukShQgQcmMer4rFHGw1COkJFZDnsyxMdMbRmmArMmbOsyUc0vS9SfrFO8WV4uXCx+E5AqsIXGA
	f0a9KLYBEv2xw==
X-Received: by 2002:a05:620a:3956:b0:93e:9792:fd47 with SMTP id af79cd13be357-93ebd0c2423mr2968505685a.4.1792075133775;
        Thu, 15 Oct 2026 07:38:53 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97bc6d42sm82581486d6.34.2026.10.15.07.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:38:53 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk
Cc: Daniel Thompson <daniel@riscstar.com>,
	ansuelsmth@gmail.com,
	donggeunyoo.kernel@gmail.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 1/2] dt-bindings: net: qca,qca808x: Add regulator properties
Date: Thu, 15 Oct 2026 09:38:46 -0500
Message-ID: <20261015143849.483339-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015143849.483339-1-elder@riscstar.com>
References: <20261015143849.483339-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Thompson <daniel@riscstar.com>

QCA808x has four different power rails (although in many board designs
the different rails share a regulator). Add each of these to the
corresponding DT binding as optional supplies.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Co-developed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../devicetree/bindings/net/qca,qca808x.yaml     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qca,qca808x.yaml b/Documentation/devicetree/bindings/net/qca,qca808x.yaml
index e2552655902a3..03daef1c7a4e6 100644
--- a/Documentation/devicetree/bindings/net/qca,qca808x.yaml
+++ b/Documentation/devicetree/bindings/net/qca,qca808x.yaml
@@ -17,6 +17,8 @@ description:
 
   By default this special PIN is set to LED function.
 
+  Additionally, up to four power supplies may be separately specified.
+
 allOf:
   - $ref: ethernet-phy.yaml#
 
@@ -25,6 +27,18 @@ properties:
     enum:
       - ethernet-phy-id004d.d101
 
+  avdd18-supply:
+    description: 1.8v analog power supply.
+
+  vdd-supply:
+    description: 1.05v power supply.
+
+  vdd18-supply:
+    description: 1.8v power supply.
+
+  vdd125-supply:
+    description: (1.25v to 1.98v) LDO regulator power supply.
+
 unevaluatedProperties: false
 
 examples:
@@ -39,6 +53,8 @@ examples:
             compatible = "ethernet-phy-id004d.d101";
             reg = <0>;
 
+            vdd18-supply = <&phy_vreg_1v8>;
+
             leds {
                 #address-cells = <1>;
                 #size-cells = <0>;
-- 
2.53.0

