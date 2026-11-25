Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578267;
	b=gAIeYiAjfbJso7vjIE0PNUYrMjaJ4GP9J1DeQZruvFOH4xbtN0U9Pp6uf1P9Gi8FEkuV
	 RDLfJUrU3NWcLqYYvb5hNf/nHJD3yCDbbTH4Crq8d5CbNOUbfZT8cZ0Wrw1RWjTqFtRkZ
	 4ylssJ20dyuuX3W6Vj4vMWYcXdaeHX5/fb4ZxP4icQAdYOYRav0jjyMEX2MRY8GJQFFZY
	 AaNF542GzQ/UlgiVhLwzmB1GfOYIkc2tful4n6RYL+XrG49D1vk4nGcjpsVgxXv8aeMOx
	 n9fuRZjkb9+svpfHw5VZ9z26PVWli84Y7lPNi6siITLf5UmZ9LBWgNUV+8PLgEzql2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
	b=PfaAbirxd6z6G/AXzXP9OL5wesiDL0FTtN5Qv5EygK1MlWpR1YiqwWQB5onpHwU4r4Qp
	 tfhUYt2P0nTBR9KTW9CsGOVCKAbwOpTZgiHg/h0MgxYgqYd0te6PNl1zGs57yVW4DVKeN
	 JsBZFglAtH5VvVlZgfcdqObIL/3/+q5A/cF/2kdOGG2MJ1wMFi96x4hhJVv+Svqwsqkuh
	 XCJvi5/xLCApnZNbYRymXxzOSb6krYHKho7BVUFKrRKrdWPhPuIMjCYx8xrBK2GStHadW
	 XaikVQSztaML9+Tk/U1LqsTX+G8UzCyx6M/rq5OgC10veLd7D765g+r84lBAR+ndrig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SufE44Nf;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D40606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7D40606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SufE44Nf
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so41906765e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 19:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578265; x=1796183065; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
        b=SufE44Nf0iNE9uoja8l5aVwkLELQGBnnQSJnkwjjhyh+2xNjpXzsAoozPYmtygloR8
         XCTUXFjT3+t29S/3sDK7LcWZlA16n33y9wijZwHX6Ju80HJAddDGn4X7BJuoxGfZyLYj
         hkVfLXm4ntm+nwjdWfyzsw22laugJbD+VlTiUS51WFqjYW+ZG6kVM4gFIN/QsaW+Y1fC
         aAU1Ie+c77crPXv7rlxquXOEpdq5iUcbk9Bw/fQXVPCbH8V6mcT5VSFCrAHpkFwLMwqW
         r+ANRdiqb4fabO9ULg0rSB9NuToAJUGV4l4allUCaSpFyElERTRBJNdlXqDf8UMAlmtw
         OvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578265; x=1796183065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
        b=JNHB+uHr86EOQ4mutrGkQF0Mxk//+W2zL2jCkhYzi44Wxb8oe2aeO1l0kd6Ybuo5Qa
         T1x4i/THSRCOzV+OWMQJ1wwcmgveQCFd67Qa92CoP7qE7FHrmbGL+xqgsBauJVoZS7d5
         DY8I5mtZS9K58WeS4543R7iewKPHcdDQUvFj71UEtEUuVHhos/vrBZlY7J3UGBR+QEUo
         Wn2Jqqh5HT9VSp8tLGGP4dJpqaC7eyYbsevOA//uT1AFTo5b5jxKV7VvtJmIOiDu9rgv
         U7MrF4PYZBnQMfKoUjcYrFX9rG28KOaD24YPEFGMLEQKdWKFLL57ySNGvi+yvhkxDQP2
         NDjw==
X-Gm-Message-State: APuU4Z/GcM8PjV5t59ddlnEkHtFrLIWkRkVUIPObdsn6VPpGFU4oNPvp
	Mw0HlDytOhxAkESVTbdnaJSWL1TxSjzVHSZMwXW+gKsIunvWUcsBhKO9
X-Gm-Gg: AZFdTZduOhc2aCGZf0Y+h0FXxHM699d30F0XD4k/gsLE6m7DEGr5i6vuPjhL1CKfvch
	UmYB5/kRQM6Feoioocfret0JXztuDyEzOE98yNZ0eO0Hk6rR0R3+SNjdeASb7GIz44QSfl4EDXl
	PidYjOY/yVARwS4f1EUYiuqr0AHzlUQzXEKUYH/dmNk54UjF6o825I/HNfL1jRuFCbrL6qJr8Cy
	mslwzmHfhCgvLYfm0oj635QZ3isGEfl9UkbgnM6xDcJprDFChZTsbX5CYUsqHkfeMG/ekQOy82M
	+q2xKw/OOqT3kp5IxlviMXcjn5tTEMxxrkJ3dEZ9DIhldIYNbHRZXAAOyjKoDvC5/G+SKMA+BMV
	cJXn3KE28efB7qHlh580Lstl3rHBEZ/tCcW14slrRex0lRji6vkPvQH6dRIzTD2dDa+H65iNnJO
	71B+LzDP8c9KfyfU8Y3oi1jg6x5RDh7dvtmRxcjY9sX9HjorrxNGY/EXYefKezT5kbDCUp63q/M
	tol9sNibhXTyIZkvQtknXPpzKRPVgZ9dPdOiwAIKFL3HPvVrJ5dpepkw2KidTJWoGNBF1wajcEz
	EGsvyBugJWB3WTEpRODtPOrnmD7OzrNZb+hQ1bw=
X-Received: by 2002:a05:600c:670b:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb88922df3mr314413945e9.12.1795578265228;
        Tue, 24 Nov 2026 19:44:25 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:44:24 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:06 +0000
Subject: [PATCH v3 10/14] dt-bindings: firmware: qcom,scm: Document
 Halliday SCM
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
Message-Id: <20261125-halliday-dts-v3-10-5c8311c0b70b@gmail.com>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
In-Reply-To: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1106;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=OQO+LwEeY64jVYcmV4r5bBUUpcSQt6/n4JPVT4Z/sxw=;
 b=ASSSZ1iPRbCJcDXI+svsrzgQJoNbt/i5IYWaxMLqGZRF5nHWw5kJhARXjldkVDjeYGCb2JyQL
 2OZ0LHRj/DeD6xQR3UFBtL7exxUKJQpjnA5HrXZmN3rAlw9HlvDVkc9
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the SCM on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54b00..fb3da66443ed 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,scm-apq8084
           - qcom,scm-eliza
           - qcom,scm-glymur
+          - qcom,scm-halliday
           - qcom,scm-hawi
           - qcom,scm-ipq4019
           - qcom,scm-ipq5018
@@ -225,6 +226,7 @@ allOf:
             contains:
               enum:
                 - qcom,scm-eliza
+                - qcom,scm-halliday
                 - qcom,scm-hawi
                 - qcom,scm-kaanapali
                 - qcom,scm-maili

-- 
2.55.0

