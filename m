Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016574;
	b=g2pW8eybGXNialmQmLnUozDmKEdJKFd4kycl0T3XAoyPCz7AfecD4bxruXZarfvj91xD
	 j3JfAfivJiu3lTPQD8TQf0W5E5x6xeml96eo8YMsMvi4F6dbre/dMU1qL4C3yI9miwPOv
	 zTfVwd3TraQFBHr8wS3IjAA5TPO7FHJIulr7/58u3UJajWqFmswTUsua46ZtJKHLuI8iI
	 k1DiG/NwcmY4BON1Rhyp+BU1yQeaSsnAsP+bcxwNyObb9r9Zs2tWahgsiVYLGn6sK9TKk
	 q5WbrROwiseCXl8FsFbmzSpX4avf8OYVhUevrYBA2KyqNyE0tm9/4r20YicFvIyLPNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VV14yapuLeyJsZV0KRxSW+/Y2gb4EQh5OYXL6BU/+0I=;
	b=ITL2MIvz7y9gHdnQC8umjW6fgbcU1sfoaFbGzFRcK7dV0GYhUOg3J/Pz70qxUJedKDz3
	 IbMuwCYL9EqIqMWJbJbToXTu8K6ri6D8E7VVHX63YgIvoToQH6RJ/ydxv3DpJinUUfN1t
	 cMYBB6bkN4caQDYf0vsI8vbmxGcvrK8xrHNhMDUqiGWeUf8HlT3tQt46NnosFaqOKD7Tp
	 G0xlVm5dTvWxdLU+Fq5PUEieNnMlb/JJNWzD+CpkZrVo1JguzJsL1V3Es+aBj8KwiiNoZ
	 pVBx3H6yT2aexWLG0cZwRvzZQsMX3A1P6nYCiH62ST5plKe2/8gIHr2ckDdL4mAFozg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VZ6APpqb;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76965606A326
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76965606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VZ6APpqb
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4956869750eso19188625e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793016573; x=1793621373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VV14yapuLeyJsZV0KRxSW+/Y2gb4EQh5OYXL6BU/+0I=;
        b=VZ6APpqbtbmtTfKFu7n9KE6Svnl7o5+7gdDW2eofGKywyb9cCi+w3wraqOH6jKRHc6
         fGH0wnw93Dd59K1w2V6c191KMj/pv7vhjM3COFjZW85+BkhqCh4rofAspC4c9os7jCJL
         Oe9182Ht099MIMhZ7FGbKrQ4IQ5qFf8hzc1r0iKnv3LQadJGvqfgQ0KC494dAenmMw0P
         mUAVPfkkdIwJ4DoSmYCGnWybC635Vv7zO9hpalpnwJpEoovHBQdnFj74cOZkLAzsfsmh
         sLn1aDWp9uge8Drm78MOyaO7qwOkreYJcFuWPIUieceKUnCgD0SEZTLCe/Bb6uiVLjXY
         saRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016573; x=1793621373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VV14yapuLeyJsZV0KRxSW+/Y2gb4EQh5OYXL6BU/+0I=;
        b=OO/BJsZLgB8kneGGI98PHVgYu1Nobe/XyjHT3pjkPemZFZJ/eBSDCb9urwqapd2uyc
         L/7LbjtkP9N+EI9BmuVhuXR8T8jZDIeysTj2GOPPwqZSI032fD6bxcR8ZyjvIxhhgeMs
         J51Q2K6uzui7pLskQVIQ+Hsy+PdAmYvjSJE0wpBXy6F++0DO6fHFL5mAalxk5nTP7ojF
         k+O+ah7/JevS927NpAwDoZciVSBSw+UubEsZ8ZDgjns13cTWSZVs2OEfl/nKXE0XAM7p
         4C1OEsLBWwssd8I8EsrGxSnncLjVTA2XaZpD8vqkMfec/dLa8gzPDs5lpC51NJ6mY9gD
         fkEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIhYFKS0p95LTcIU5CAuARMpiecu3Fd65Sdr4rtSlvb19u7/rQtBoz3HXMvkkPtK7kFDV662dDaUl1WpMt@vger.kernel.org
X-Gm-Message-State: AFq9FYLHPygagGFFgL4EeFvDJ3nXDxlI27SwW6+UqeWrSXWXbc6gJvgG
	CtBpVKNwt7RYJbSVc15wfIMw1lEv0cvt0HEiCifS4HRQWFsl5Oaf79aH
X-Gm-Gg: AYBFou1nPDB5u2cveNxvDZ/Bjjs0YsVfn5E7wvfvq2KwQxgpxusdwjPjs/+aPO+KCt8
	yaSUbAGQIF/DuJ1Cg/h/LCCJ/T5VF3KsGS9qKGrVhtuMsj/N1DdfQwLmQkG8Kh8ZJCEJ/sj3HqT
	dMIFc4guhEAm+ZP0ac7TRVol/+CnSP2cgFSQ4J8fZ6KCDLe1eyT6q42nFFipJ1+vn6ft1IwB8WM
	47aznBJS4E0mF0W+x7g32ssgRlN1fUSG+wiU9wjZ1W7NotDwpQAxaAvT2Nn3iG0DYYH9v4IJ6WE
	MZ0tqAz+DQuy6tysx7HlqVIOhdZ4K/V5JX8XkUNdvRQA6rkXvGXsEJ/M8vYISM6eFVLd/HNwxLM
	LEhPYRPPZpXlS0BGrFICVV53DmyJxTLjB2CDwGYGjUB8qITrwG6JUAfV2i20jchtpf+05gpbkMR
	pA89eRnpZzBjefmNjmozvAfdy/duWGOdCAhdWydXB/UiXhqnHOmL/8Xh65xgeO2quKKFX4FwgU+
	Rg+AnU4QcbnS+hQjE5+D7IN8VxQWK+IpyrlTSIPdV6gNlt7iURj+vB+CsiSsDhePB8IZdZuEP5O
	drhjzvKES9j60zwVKp+FAL0PHZuonzm/fMHINr6NbgqOX2IdtaEsbbhQpRd7UTG1At1sgoDY6er
	SIEem
X-Received: by 2002:a05:600c:a06:b0:4a2:40:7f35 with SMTP id 5b1f17b1804b1-4a35acaaacfmr122280585e9.31.1793016572849;
        Mon, 26 Oct 2026 05:09:32 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-14-234.xnet.hr. [88.207.14.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a00e1b0sm152200695e9.3.2026.10.26.05.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:09:32 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	ansuelsmth@gmail.com,
	john@phrozen.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH v2 2/4] dt-bindings: clocks: qcom,gcc-ipq8074: Allow CMN PLL bias clocks
Date: Mon, 26 Oct 2026 13:08:13 +0100
Message-ID: <20261026120920.1667982-2-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026120920.1667982-1-robimarko@gmail.com>
References: <20261026120920.1667982-1-robimarko@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CMN PLL in IPQ8074 provides 2 fixed clocks to the GCC clock controller.
In order to describe this in DTS, allow passing them as the inputs to GCC.

This has a benefit that it avoids doing a global matching by name.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
Changes in v2:
- Keep the existing four-clock form valid with minItems: 4.
- Drop the _clk suffix from the new GCC input names.
- Correct the NSS NoC bias clock description to 461.5 MHz.

 .../devicetree/bindings/clock/qcom,gcc-ipq8074.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
index 00d7df75b3d6..1c9854a5c572 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
@@ -24,18 +24,24 @@ properties:
     const: qcom,gcc-ipq8074
 
   clocks:
+    minItems: 4
     items:
       - description: board XO clock
       - description: sleep clock
       - description: Gen3 QMP PCIe PHY PIPE clock
       - description: Gen2 QMP PCIe PHY PIPE clock
+      - description: 300 MHz bias clock from CMN PLL
+      - description: 461.5 MHz NSS NoC bias clock from CMN PLL
 
   clock-names:
+    minItems: 4
     items:
       - const: xo
       - const: sleep_clk
       - const: pcie0_pipe
       - const: pcie1_pipe
+      - const: bias_pll_cc
+      - const: bias_pll_nss_noc
 
 required:
   - compatible
-- 
2.56.0

