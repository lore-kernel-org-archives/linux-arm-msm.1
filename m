Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C0C4AB3CC
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966091; cv=none; b=IQIVJggq2kDUsXHNG1TggkqFH1EIZzVMQ68ZZ5zBcRXqFfwLW8BMmjzAqPEYORPN3Iw2i3y9Vx3M7gSpyp2eLpBJjFn+RnU3NrG6IaRS7hbfw1c+m7Ff9Hd4OIse2RWWtyHdIQdOID41bYjntA8QmeWJSv9PxHvJcfnXphWlFsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966091; c=relaxed/simple;
	bh=ZF13MrI063aqe++Q9B1kh+9t6IG7M6JUt1+4zyXr1qU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KgJdpLw8x6JA8ZpqdcFP8uLQJgmrnO0LawjRU5a9O2eLiDh35fg3cqHAzy9ypsaWzH42BNAYOfXlpv4p9DEmExmg7JwZM8DfLFRLeh6LSvASwZmsX7n9QHGgOhRFWtWNPf5ys5ZDnwONtXjgNzGHE/x5KJP+iTlVF9WH3275y7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JH9ohM9p; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JH9ohM9p"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38759bcd877so2362395a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 01:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791966089; x=1792570889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yVCZM5zURPRE62cvJS0zNIsVrphYetwj1gaMWhP5efk=;
        b=JH9ohM9pRIMs8BoAzBS8VHFh4Ag+Z559WXBeXBLHzsWJRO2O6jQoeu5eRW8EHHOwdX
         dD87NZNos1D6IThM+o6kwm6k2hLuvWSadl8nzruHOxTLnUWIcp6PBR/7tKtufGYlCRqF
         HGH100h5cZJl0QRf3iFyc8l7WBPypGrJfama0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966089; x=1792570889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yVCZM5zURPRE62cvJS0zNIsVrphYetwj1gaMWhP5efk=;
        b=zyEJMC3EKIKrID3kl7S/i9sId9k81PGpoMOdbKG6dJV7Gc623HpN5jfWz8y8lewyc+
         IyRG9rlt/JiPBUj03k5KBiHP4rCn7vcZVK66Z6mCWGpGq6jNK5yk5XuLZDyJQrTju70H
         9/wBUyF6wkvThaMKiOrKu+TmGZkVTWfEYZAetmJeqIVimfWKLX8h3XZ7SlLjegbynfH0
         u/VdxhZsID+dEFuxSQbJKEPFsOMK4RGbh1l/5vp5q3QgeFVIm3LkT2Wa1U+2u3rs98wi
         1PXBlKAzhYuYan59tll9pMS7jqiTPZeESjcrS7+Ojg/tD0RMqkMxZczjvHNw0nM5wgdc
         telg==
X-Forwarded-Encrypted: i=1; AKwUvByu6QcbP4c3U9JVaSpxKuaZm39OL8YXvewk3aJzrQ1ALNEKG5ilLB92Lx6/5FSbkHvsfwVeq0bR08oITin+@vger.kernel.org
X-Gm-Message-State: AFq9FYK2Tr2SQWJud65FLDo1GBCm4b63UOl2m9sXgsg8oUg6M2rtJ2C/
	zA586z3fsytPjUS1xGWRcndeHmYtg55W5t5GzqpRI3eq2IRv7gxq9JiGe93YkrWAKA==
X-Gm-Gg: AYBFou16e4fJct/AEHNQ0QUfWFgkOYbYds+Mm5r8O8t5oV0A6sW1LoC0IlbGjdAa/HT
	xkl+UAExjmYw8UNLqo2/43pbUhm5ENYSOL8p5gk5Myr90FS+ae5h4bmqrSRnTI1fr9a7QoT2xws
	qSIIMkntNfMeEGYB8TMUzBi9gVMjc4RHuF6bf9mpusgz/pKfTZ/I+dPhvABMpjGaEK1fqQS6Oo5
	oyT6foy7TarjanMKAi2kzBnB3mb1DxpDKsDM3y5UsWT9PzIG/kB0+ZxZrj4jjHmjxESIavojHwB
	k3ukB7KVEAnBXH4QgPflIr6OO9eYdCprdybDcM6lEPDqlwtLvuIQz0H9FQ+HtNvJOoj9dGzSNJe
	5rScJEfV9eJHR8ngTY0a6YdODR/teB5WDQt06v6l+f6BqVTyyLOzsuRzX69NjvLtURnLaVW0hjj
	noRu9B1b1X01dYfoWBuZxNsZIobjSPPSbcZ6CQTmZb6/MpllTbDrfOLiydRT9IxAtq8MuO3i04Y
	cWoIKC75gXgTC/B3et7ZpatFdpYXvdoZOGtLpCfpLa9rYPiDfGb/SPLwA==
X-Received: by 2002:a17:90b:2b44:b0:3ac:7842:bd50 with SMTP id 98e67ed59e1d1-3ac7842c19bmr520798a91.15.1791966089278;
        Wed, 14 Oct 2026 01:21:29 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:373a:9eb7:c5ba:7b5c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f04e324sm3682141a91.2.2026.10.14.01.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:21:28 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Michal Simek <michal.simek@amd.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Wei Yang <yangwei1@eswincomputing.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Hang Cao <caohang@eswincomputing.com>,
	Li Jun <jun.li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Roy Luo <royluo@google.com>,
	Yang Xiwen <forbidden405@foxmail.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Xu Yang <xu.yang_2@nxp.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Stanley Chang <stanley_chang@realtek.com>,
	Ze Huang <huang.ze@linux.dev>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 1/2] dt-bindings: usb: hcd: Add downstream USB ports
Date: Wed, 14 Oct 2026 16:20:35 +0800
Message-ID: <20261014082037.1774672-2-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261014082037.1774672-1-wenst@chromium.org>
References: <20261014082037.1774672-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Besides hard-wired downstream USB devices, a USB HCD's downstream ports
can also connect to USB connector nodes via OF graph, just like with a
USB hub.

Allow a "ports" child node and describe the possible downstream port
nodes. USB downstream port numbers start at 1.

Also fix up the address portion of hard-wired downstream USB devices to
match.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/usb/usb-hcd.yaml | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
index 45a19d4928af..24df99dfb243 100644
--- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
@@ -29,8 +29,16 @@ properties:
   "#size-cells":
     const: 0
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: The downstream facing USB ports
+
+    patternProperties:
+      "^port@[1-9a-f][0-9a-f]?$":
+        $ref: /schemas/graph.yaml#/properties/port
+
 patternProperties:
-  "^.*@[0-9a-f]{1,2}$":
+  "^.*@[1-9a-f][0-9a-f]?$":
     description: The hard wired USB devices
     type: object
     $ref: /schemas/usb/usb-device.yaml
-- 
2.56.0.212.g129ede20d9-goog

