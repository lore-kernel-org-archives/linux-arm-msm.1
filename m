Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585904;
	b=gkdNAwaLtEqmbrwumHDO2WamHw1OKnJUYyRG5VEWfGPHYIuFQ7fW9DeJXX146Mwbtex5
	 0Tg329MgDYBBJi3XTDzlFaUPCjdaNVUmnuQ6VedDKlIV3ttwBxltXZDX2PTkG9idiyLug
	 07R0Y9HrmH41QQRMNO8o9EuuK3ZsHOVRLnteo4uF43CZCYQBDNlNjj0B8p1L2nPwH0wke
	 VSaZQ85AlY7qrFQoUuTURvN/Fs4k954GOVgQ5lgsAlPrVymKEaJy8yoYbs2RCxJx1bhBg
	 jGr5kVBd3z81fu+g04X0pVQOY399URyaaIXFkBEPAEmjTwE5hrGLo5swgln+Hb9x/dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
	b=2q8xMrkk9cIKFtUpGbBuz0XRS7foHRgxa851fsJciN61HuM8fVG8xR3g2fklGKngx33e
	 E/BiOgDcjJnx5scUS4KsRRkN7kjn5QWUHuXmYP9Ox1hW481XT03NJHDoO/QmCU34cRbFI
	 UNG56GCc1ic+w+fRdjGHrKcww+2KoUPTiIopMaPviTybrYGT++PXAkDnhvmHa7UinS8xh
	 VB9tQnpQ7/lJCtMU4Fcb/S4fmxOrhgx45+aG6qJqLPrQufVEwhAHAHNFU9jOINabnUVfY
	 z2NlK4Au78o/dWW/bTEGUepsUWAZukfMweHqM2GuVGgoj2kpsRaRHNpLjJkAVrykUDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=NXWuRo4o;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D3A607094E
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 16:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64D3A607094E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=NXWuRo4o
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so2426106a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794585902; x=1795190702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
        b=NXWuRo4onYFiw2I9QVxX5OPcgg0tUYOXHsV+WLZ1UsLq8W44JTs5HZvfoNvfPYwfqZ
         aVOf4cZpXSmdau56AKXJsV6WLFeanx3/L6Gy6RdjXG+kl/zXHoy4cJaHlVW/zPs9kBuO
         oemMwQSPJYV6h+bJqG1F2EHGrXxt0dOlLnWgwF5Ulcpq9oM3p2swIXKrikcx1BuL3LKA
         qkXPq+g8+NN0qbt24tDmj702nIBntuPk1JB/r2+AInsFcJ5NXND1Shy8zA+xJm/itwf7
         6pWUpFjQRQUasOfYu6ayS094qOl1VpxnYcWG7zeE1bwzTUM3WF9GOAAo4Y/Fbxs7+9Rr
         ydCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585902; x=1795190702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
        b=ROMXKtvUX0klPvAnVSNb58gB5fTXa+1r9zjPdB42VBv0XFbWk0kuiyzRRnGiqnNL6r
         glo3Z9Bju/+q9xXTfGNIpK1X6eAw0KamMQTBT/HvXq1JRIX+eFSG+QGd2py4Eupcm639
         qb0zGyZzvwF4kcyYVDwy3BnqyeBnvIMs9EMWrvryr8NnTHUL5l58AIwgReEnt2N58yIi
         GJxofxDlVfZDLYmuXfcI+LxbRGzkvoS+YgWy/L5M+Dsd/bSJ3K7QzfDPPgt983S75wFp
         9gjfIT8oHF8Vs/dyV2/Ss7VJYCO21fVMKPBAe/h9N5W2vFU8lTomrdeFZdy5OvI9YegV
         QuNw==
X-Forwarded-Encrypted: i=1; AL+hErFYQrgT3m/Fz/Zs2qlGY4ojxTQVuNA/OIaBuWWLuF0u6hCSUzvL2K/YFpNqmTI68RsjTVTpscrljJiihvZo@vger.kernel.org
X-Gm-Message-State: APuU4Z/0FVi1kqoxLK+9MR52r1uzYdOBWS8K0d+5qFdSGGt2V1mhGm4G
	S5ehuNam8g6lRYo1dEAhEM65wkAgbTPXVkUaRxfxddssFmE2RMEhDhsiFtH63wuH9Qo=
X-Gm-Gg: AYBFou0ff9z21h9HY86zXXEfJFAqIj98bz/AaaZQNnSWXSzSO/r8J0ylRqOWJMHRXm7
	7Jf1w/vq3smKGEx2XtkKaEwNDHu8l/WVE88+YduAX5ZsoYe5IDxS+T3FAX8iESXYKO/NMXL/+Um
	4WPoLoSIDQdrRGZ+OpR1/VbaD+yY9t7nZQkJzDmjugjJTWNU/Mw1kKJwgKk5MZ8pW0pu1oFGEM2
	BNkYLm2DGmP2ycgDHw1TwIGarHc4y9AHx+1NBpJIW6JAvG3OIwqCvM1TvzTVcyVYiFNkVYsYW/0
	tcHRj+Ag/2inw74mB68U2wWfXFx0zMbvppZlHFH7KpwYtHZUw1H5DbgInSDZ8/W58MOicYn8CjV
	ZRv2fcCpsxgVkIEK101z8n6eCfN7NW6Pwjp/FWdEKbKUaqFCfU3jRjYAvU3iL+jWXNca7oBjHBa
	24jHsP0u5rT2iQawu8UV396Hv+jgq3CjrDBMRmoBdZuMk5Nu4YszB0TTUXRiNJBdycXKfIK2HYW
	GrqWGMVKtn4MOqh46OLAY30ud17TRn3wnpT4iPgLm35Y1URz0XhmoGzGnn7qsBulJPmWYd+eeBy
	acycy01rmPUO/BsLRNYVWbhq6HL1a0ALC0Xgr7s2Z+mM1NnUyinMUR1qqY/rbR5qh2OZsz4nq6D
	m1R+R+iQ=
X-Received: by 2002:a05:6402:c6d3:10b0:6b5:8719:6d51 with SMTP id 4fb4d7f45d1cf-6b7c0c1661amr2023087a12.32.1794585900329;
        Fri, 13 Nov 2026 08:05:00 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c264d99csm1123946a12.36.2026.11.13.08.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:04:59 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 16:56:43 +0100
Subject: [PATCH v3 2/5] dt-bindings: thermal: generic-adc: Document
 #io-channel-cells
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-bat-temp-adc-v3-2-743979a8fd90@fairphone.com>
References: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
In-Reply-To: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>, Val Packett <val@packett.cool>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585895; l=1375;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=I/NJZJX7ehckBNBNEstT8hdZRvbJ5dgDjnQjjzYNTLs=;
 b=Ht22iLsedKZL83BN0JDY5PWcB8ObVo0t6BTxz26Nw19xpDmgxebf+ud/QHUeqUQWi425ecQ3+
 SxCjc8QTNEyDHbneK6kZJZLlWO3P5cfHB1Ugyxv5BwyqSTZWKUV7rxS
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the property to allow using this sensor with io-channels.

This means that the output of generic-adc-thermal can be used as an
input into a different node.

As a specific example, generic-adc-thermal takes in an ADC io-channel in
Volt, outputs temperature in degC, which can then be consumed by a fuel
gauge driver to provide the battery temperature readings to user space.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
index 12e6418dc24d..317fc39ed46a 100644
--- a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
@@ -24,6 +24,9 @@ properties:
   '#thermal-sensor-cells':
     const: 0
 
+  "#io-channel-cells":
+    const: 0
+
   io-channels:
     maxItems: 1
 
@@ -58,6 +61,7 @@ examples:
     thermal-sensor {
         compatible = "generic-adc-thermal";
         #thermal-sensor-cells = <0>;
+        #io-channel-cells = <0>;
         io-channels = <&ads1015 1>;
         io-channel-names = "sensor-channel";
         temperature-lookup-table = <

-- 
2.56.1

