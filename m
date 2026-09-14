Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A4048094D
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 14:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396682; cv=none; b=PS1qKfDDh8VMdIbTjV5TSl2LEc7cKN0Xrgs3fzmzadzwZlqXtJGH3+Ee3EDhsfMPkCpBVlvklyIdNbM4TtmT9ovSXd8G7sGs2v7eLN/cAZ6pRr163fCtn1iHi3Ad4s++yd1AAwV0xQoX0Spskfqj8ewZBu+qDwmFA19M2JyvUEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396682; c=relaxed/simple;
	bh=An5kVD+QUS2KRFPqoTzuP3KiyxlNWixnd0SrSGxYc80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XSH1xE/TgJU3A9FI3wMEU3etIxA1VNq61MUmXhckRrR+s5KH/Y+xpt/R/yKkETvCho4pCeRXG0ntci5y+T9JzqmbPgPjZgNfWEyshuMsBa4/TeR/H22OfaYW/IThk9h+HjtMk9cRt9VYB8FDpIxniQH4LXLu0rPj6zGtG9z+pXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tOhblX1H; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tOhblX1H"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a605844571so2581438a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789396678; x=1790001478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8LfNC9HXmpFwQ3HeSQNxdEPD6YaISqvodeZzu0yt/c=;
        b=tOhblX1HbQWKzAbGVxfCQOKLCcponVlAb5+wv3zW7icjHVLMjLY5y+zpaVX43texjG
         P4N/vm0WysYAn406Hr1A7j2tMt77H/PPcXiWtry8n2DQgknKKABgfyjOfKHtSaB6+U/a
         N4/a0Tot2sdqt3eG39Ddt+dzjD37EqeXxuvurBVH67+yHv0VVcK3ArItDkCTW5B+umGY
         lp/aidzMO/D/AuVjpqBadygLkpYR7BQq05Cp/7Vw29uecbeJB2qoWFkUl15LYrfHtlzx
         SFdDUav+oOO+BL+MFeXbWqeKv1cch89a7rg432aoIj5up85VXxkdiAd7ykOAUfhAdz4E
         gWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789396678; x=1790001478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g8LfNC9HXmpFwQ3HeSQNxdEPD6YaISqvodeZzu0yt/c=;
        b=kWp07s1TpqDr1ShJ9iNooZoabxRurDHGqUQRcEPKYD7ruzabO4mweQ6rB/lJYCC23b
         K6teOjRDLzvbT6oqNBn3jjACHYxJEwnHoQtudwM2uHDAxBulsL/H3Z3if/O6l+xkJHAu
         mf10o1pTeRS3WTG0p6IA+2aBiOWz4vQiePTEIkaIMkpWibihbv3Ep45B1jiVhx3uD/qZ
         Z0HjJbzl8msGb7GfpjEhZC2MxXqkIFb3nmPY695CPVDPD/3/zIiLsu/AFY6i0FSV8tC1
         Rr1bmDgz6AKXbWKCbreGAfDppd6PRol+pWpFZitOJAE6OjhiKmScoZPyEe7t4ksgxuGb
         pFQQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3irQeSAkmCo7Bk5WHL48Ys1XCo6+kUvw1UPGQsiXxM6es10y/4HU8+VoZHL5KZFqsE0UeLRKIs+nfCbRI@vger.kernel.org
X-Gm-Message-State: AFuF++llojWp91k3A24vbc+4WPeAstVcup+EulHb0OGco7qfmt/+QEm8
	Sucpr9BCGfafP6/y0y5GjHz636nIv0JnAhFJeq+hcrh8Qw6hOuRyGuisjmXJB56z2Pw=
X-Gm-Gg: AYBFou2VwdVzUBqY+jk6oX3LDFIxooQxHT1BBSWYw+vlbeal6EDgVGwxx7c1km3fXkI
	K1llqxKIrPqGdckjwbxeUxR5krJrnb9o1H9V9E9goduyfFGH1coO110p1aNGkJocGbsxlEA4JNJ
	V7HOmtIXvgO3ntAb6eZLrD//C2Bapn5SiWtwlTZtkQpWrHmM8OBPGk63Eq3OQ/RD4EYC+JqEW2o
	wI2/4ndEuk6ItxRBpMvyS73bLLm5O9HlZM3tZU8LyZC/rXbhKbbzH3/HoRtHZ1VC6V6e+zby9W1
	WViwM6KIn41M7ha/ijIu3xKS7Wm4ECmB1+AG+cz4XORaYzUIJTBGxYR8zz6Luz31CzVyxR4nj5v
	Rjk7WjNddH3JWBqq+XOTZ91aWyL/rMwFaaS+1PV0tD7XU0Y6wO5bm5JTNo/DogwDJQPWw8KDRVN
	oNrx0nXxPCX9J2yido3lq4nHRxIFEj6YVn4iS86kIBXVZGIZ9v6d2hfliTYr5DKOqGQyWXNPncg
	fEyxLolRF4ChD869sZCzrHgj5qTE9OAWZpaztFVN5e0tgm0bbgYnV2mNPauBLXQVicJ
X-Received: by 2002:a17:907:d19:b0:c29:5340:182e with SMTP id a640c23a62f3a-c29b84d2b89mr181142266b.2.1789396678031;
        Mon, 14 Sep 2026 07:37:58 -0700 (PDT)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660b29a7sm449634266b.43.2026.09.14.07.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:37:57 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Mon, 14 Sep 2026 16:37:49 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695
 haptics
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-aw8695_haptic_fp4_driver-v1-3-156f7549149a@fairphone.com>
References: <20260914-aw8695_haptic_fp4_driver-v1-0-156f7549149a@fairphone.com>
In-Reply-To: <20260914-aw8695_haptic_fp4_driver-v1-0-156f7549149a@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789396675; l=1538;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=fEJxwk1bbs1F94cymqRXVbWtKaMJcVnL63UV2RvymTM=;
 b=pX9xn5+XqtBfjlYTYtS6dF5s9O1svEi9nf7O+5BRvhnBYR1PYcmL023f/AwzJ4KXl32012Grz
 eiDmUOn79YVBSgQHaBsK6xqF7gFbhw75sh1WUvishlk6BeGR5fp0vUd
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

From: Luca Weiss <luca.weiss@fairphone.com>

Add a node for the haptics driver found on the phone.

Co-developed-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 26 ++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 23f950067a08b5ac4f7f9f61cbe060fa00b9f485..8a55a1d3426bce699a076e75b948b3def698fc36 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -707,7 +707,17 @@ vreg_l7p: ldo7 {
 
 	/* PX8618 @ 26 */
 	/* SMB1395 PMIC @ 34 */
-	/* awinic,aw8695 @ 5a */
+
+	haptics@5a {
+		compatible = "awinic,aw8695";
+		reg = <0x5a>;
+
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&aw8695_int_default>, <&aw8695_reset_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &ipa {
@@ -1178,6 +1188,20 @@ reset-n-pins {
 			bias-disable;
 		};
 	};
+
+	aw8695_int_default: aw8695-int-default-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	aw8695_reset_default: aw8695-reset-default-state {
+		pins = "gpio90";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &uart1 {

-- 
2.43.0

