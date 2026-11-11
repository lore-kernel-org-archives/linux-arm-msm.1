Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398011;
	b=VF0Dt9Tyfe98RMd1/0TsWvBysklpG8SRWGQv5tByoNJt8fes+pEeSee68eKju00tyn3J
	 gop/4Q9PBHaHMJ7/nuuj8IznIYP9e13xVqixWrVVm1NJ5MPOM39mZsnHlR4HmiLPmlYnf
	 YsIa07Ba34XiNJTFprybW6nSqAqpBAxOfK/JHCl4azZshjFh4KjqId5ceyWk0tuglqMsB
	 oMGcRWU/BPdN7rsuZrgufprnYzadbX+G6OieQxLMnnsagJtJZFC4E6gwSAFmBa0lREqOQ
	 /6eXc31AraNU/drkG3Ee2CRL2G0r3JntfYDVQ0qOhePkJKHENvT0TeRGyAZwZDauibQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=SsTSYB3rsKvMWE7p57CQCiR1JUfH7D/jcQTe8wg93kY=;
	b=HCnIq8hPnxa8vtQ2QJ3nHCMVmax/l/RDyI3Aa/hIoCgm0WOrpLW+BH5OEmsvammGcKZD
	 9il5yVPC49uzNEozG4ZeZlRUC0SXqfhm5M+CvfVqT6Tiu4oOU4cu8YhBVdvmGAPL5OA+V
	 WINv4hlWqnPFKd/5GUI0WsH3kXM+KV93P5WkOI2LqxkFdyqjXstxic1YctYllv07bwskp
	 NjOfp33svTsg4nTG3HgTpbhcaWidpUeYc1p4BEuhJbNEU3ifvhKe6Rk/lA5Uyw6SRvxU9
	 ERG/fUMHIiFlZR9osd0ZyDAqTI6G4cgKX2x3o5mNAmn1t/d5iTgvkg/dJiI+BpbUJ0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z2YSVneb;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E2E606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 11:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62E2E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z2YSVneb
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4ba078abd70so8584085e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 03:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794398010; x=1795002810; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SsTSYB3rsKvMWE7p57CQCiR1JUfH7D/jcQTe8wg93kY=;
        b=Z2YSVnebA+kZMi2C5uaH7Wfe7vLBREPzHPxb1IklWbmcyS6CoFkiGrUtaxNmiVaMJt
         uadv+KWSZjKCCzrR0JbNXmJUh+BGYOuODE5WIxaF9Im3cuC9j+leZsOQCMZpVp6QxMEG
         vWc1go7UTazR1jctiJiqmyMUZnDoAIiJkoV377S9OuR2+sCwfVsXe88x33U5rqQ1y/OP
         8ZHsdolulbDP+VBy8mutTpa0P+1nRFbFd8skHiBHIc73kH3uqM57NXN75/U0mv6xVRtC
         Bk6JfubVhdUxz1wLmNWZDjKH1klio8F5rWu5UbA5SAPP/a3AharkgeNNRbTx04EawvHo
         cupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398010; x=1795002810;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SsTSYB3rsKvMWE7p57CQCiR1JUfH7D/jcQTe8wg93kY=;
        b=N/mMR77NtiM5GVv/qA+UyTMB/xWd5ke2jQe55pAqB9ZtW0t7I9uclcaqHjsv4ORCu9
         G9YY3wZ1I77kWQO8/8+q0vbOPp+7KGFf8wDdmAEvkTEhDXRVlUpli4k7ugsDyJmiL83t
         iZW4tsL19ngxf0rsqVCkzp/cJmVQHvnp/7tu0p1KTsC9HyCWsX3XOU94XducUA5x0O20
         lDpdKOfWpAB4eJKq1RDb5HLBNfzXPM1fFWcwGa669WyK9QT+zVUERYgKEuMep0AAvBG2
         840Zabhmw5rJ1gYbM4Lpf6yBq6sriUzMqHpSDsSGF5ihj+5sc12r+ZYIL8wiSLBqXZt+
         wsYA==
X-Forwarded-Encrypted: i=1; AL+hErGaaXVI6cz3AkkQJjlMqDO90wrO6OWkJmWQSi49DUTUvpqltEBHMrI+SkXC6HT6CgBY1H4I7za77RcemF8j@vger.kernel.org
X-Gm-Message-State: APuU4Z+dUuLf0GQO1HsIO91qRlhvExEySVa7nFS2oNZrumx5ru9fcLHg
	POK4ir5CvauFpuVSbZn5R5bed9kDyjz4t5OTANT6y2n+Msm/duccndGrbYRHlabdxhEwX2AIVg=
	=
X-Received: from wmbz24.prod.google.com ([2002:a05:600c:c098:b0:4a1:d0e3:1e1c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4ecb:b0:4a2:150f:1601
 with SMTP id 5b1f17b1804b1-4ba093811b2mr37381255e9.12.1794398009585; Wed, 11
 Nov 2026 03:53:29 -0800 (PST)
Date: Wed, 11 Nov 2026 12:53:06 +0100
In-Reply-To: <20261111115303.3749380-9-ardb+git@google.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111115303.3749380-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2269; i=ardb@kernel.org;
 h=from:subject; bh=JUc6v0P1teNo8OlbdRyY2etIOH20xoIr68pdPx7aM1A=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIetLuBK718xmx/ypLhO8b639fiw/YoMK26dtJRWz97G1P
 e3qm9vfUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACaSkcnI8PLL3UxDlVkHL3VV
 eYfd1ty9yDx39+JDbeVdgWsM/GT4LjMytE98yxv86sDjaf+WxKw843a1NVN31j8lu8f3s+fL8wj +5gAA
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261111115303.3749380-11-ardb+git@google.com>
Subject: [PATCH 2/7] arm64: dts: qcom: c630: Use LN_BB_CLK2 as the eDP bridge
 reference clock
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The SN65DSI86 eDP bridge on the Yoga C630 is described as being clocked by
an always-on fixed 19.2 MHz reference clock. However, as on the SDM845
reference design (Cheza), its REFCLK appears to be fed by the LN_BB_CLK2
output of the PMIC, which also serves as the master clock of the WCD9340
audio codec.

As nothing tells Linux that the bridge depends on LN_BB_CLK2, the clock
only runs when the codec happens to have it enabled, and the WCD934x
driver only enables it on demand. If the bridge is brought up while
LN_BB_CLK2 is off or being toggled, e.g., when the display stack probes
before the codec, or while the codec is being initialized, all AUX
transfers fail and the DP PLL does not lock, leaving the panel dark:

  ti_sn65dsi86 10-002c: Can't read lane count (-110); assuming 4
  ti_sn65dsi86 10-002c: Can't read eDP rev (-110), assuming 1.1
  ti_sn65dsi86 10-002c: Can't read max rate (-110); assuming 5.4 GHz
  ti_sn65dsi86 10-002c: DP_PLL_LOCK polling failed (-110)

So describe the actual clock instead, so that the bridge driver keeps it
enabled for as long as the bridge is powered up.

Fixes: 956e9c85f47b ("arm64: dts: qcom: c630: Define eDP bridge and panel")
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 9d38ae83c979..a4a573ea7e4a 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -97,13 +97,6 @@ sw_edp_1p2: edp-1p2-regulator {
 		vin-supply = <&vreg_l2a_1p2>;
 	};
 
-	sn65dsi86_refclk: sn65dsi86-refclk {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-
-		clock-frequency = <19200000>;
-	};
-
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -528,7 +521,7 @@ sn65dsi86: bridge@2c {
 		vpll-supply = <&vreg_l14a_1p88>;
 		vccio-supply = <&vreg_l14a_1p88>;
 
-		clocks = <&sn65dsi86_refclk>;
+		clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
 		clock-names = "refclk";
 
 		no-hpd;
-- 
2.56.0.611.g1030f0b940-goog

