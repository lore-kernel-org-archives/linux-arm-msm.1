Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919193;
	b=EBn2h37HeBqRvmBR4dojD/Kg3AgC4gc9FSbTmIO3kdzkPMdMfICFIdaAPztmHm2O8nS9
	 ywJ5/dIsbJY8rrD0dUUwLIOwPtbnxBBrG54gjIbYNFe668boci9G7LWFkkdjUlcJRuxWt
	 r2LyBGgSvtt8xU1MLeJM9XOeP2eUaV+qOJkOIxou9qW58hjxDsYZh2m9Eek7v2H0xu4bh
	 Mf/1eHZeV5iuPyJ9Zrlg8gTlJ0XtRPuh/0W9Jm55KaRWZlQBbpy9Trnoy+whcrxrcjOOe
	 34t8biAbGZJHasK0QraoTbU7FEgagYjD0q0dtXqwWF2cvX9mYVdnLadYLt6omSbEg/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nJ5hpYg4Cc8VUEITkJRPygPQ3lscK1+CbDfUcnWlRxY=;
	b=D7pCstjb05qVveUP6Nlx5vl3b8Hj+RqmZ4FU2g4Du15/aI6Kjd6tP+rjir/MSufXbhHx
	 4q45LvlHN9ZKYFKpsVjFnQUxiL30te0b3+ZQMqE7Y0BBZd8Xo69zRU9k1/Kj38csfHn48
	 SYg7VvcSZ78Nwrdcr9/hNGRndiLQg+MqAI3tYXRWOv1QELHP1RV+m66WZ6gjuhuhFzC2w
	 8yhqJOBHlnBQHR7OVzwOkjBVg3PwiWVa9LsmhQKjaXA2/GqnojxLXTCOWqiaDcCugLp4z
	 6Kf22EglZtMtHaFAmPHhWV43Tw0WoIFvN1geWJTuIqvfXbOUeOd6woUN5dyWCPQebug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAPvjrZd;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BB6606A8BA
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 12:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86BB6606A8BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAPvjrZd
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso30523485e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 04:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919192; x=1795523992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJ5hpYg4Cc8VUEITkJRPygPQ3lscK1+CbDfUcnWlRxY=;
        b=ZAPvjrZdH1ynZ+1SyLLA7fkPQLbJu+W5/CYb3xFMiRsX+eCwe9ddKdOWDabHt+iY4G
         +HtXRZ3spDtEKFbhce0su6DIkz+zJr9mH34jwRBqKZQifrzqKUpzUZzK4Qsjrlpew9hY
         S8ScAM0TZ8pxv7mh5O6GQ3z/zgbVXbsvheONAFloIyexMycUscFo7jH/7Id7mwhDjU7W
         Zr0w8TuBRtt9GzmZv+OJGIsWNnnxbwXeUlzZ/NeGcA4n2o5BOehtlgNnTwJZrprPz0Tc
         sufr04gVrm/JQxjMKdq4B4ovdOQGZak/ePM9smlMh7Z9/FVSI3UQPxJVTVdcZQMMlCCf
         Ja3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919192; x=1795523992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJ5hpYg4Cc8VUEITkJRPygPQ3lscK1+CbDfUcnWlRxY=;
        b=YkMxTD5OQL2Xh63Fc/LUJ338RGJ2nkOB5r+Aeqvmz/6N9YevOOiMH+B3SbJnAZz3Z/
         TLOh/Z018RRis3kkB8P3VTjkT2TDayEfunY03O+Wm/MrNLeunDpOH2dNNZPvGjEu93On
         OfO2KcG3cSaG17CUCq+U2e6pSdopQ2rEu2F3hPL8mj4l7YiUuV+S204bEw8XCIXH1pb4
         cDXWslYNQMI1uAH/MHnVVubF42EIY7RqoMMaZ8DuH9JqVto/shBwj0x+ZG3PhznMeasY
         dcSaQgkSveN3Kta5/q44iPGl67sqPdxYv5el+SzoLWwr1lBgKkNDZNinJ9e29OWzPQ0J
         fWYw==
X-Gm-Message-State: APuU4Z+RHKyWioMVIjKw2HSTJ4DDsixiEa3yrDjt7uVuICEyUEt5fwgX
	9oJErdxIYu56azQX0Gw+DGGBIymI/5N9I/JPi8Tmfv9UtWoW2KBTRdd2QHhGcsU7XNMm6g==
X-Gm-Gg: AYBFou3xuU8E6DYgL5yjGIqoqEkw7vSgpMXW4fCQ998OYoockPhX9a04YvRRlAqZHad
	mFrT9VXkCJz+zDa18gxon9WNZd2kjtYPMcfZ/nUyW3fppF3QsBUiU3dpM58zKMDGQDBVN1k8ZOS
	RUgPpVr+WTkZUG2W0C1wn1cjJYp+3sPXV0m4u91YurWaIXo1Dmwx7QA+0ixnDsOUwsdnQ9MEntx
	7iKV3JQY5t70ANB6JJCSbY2Euz+eIyn2v4zN9j1eA24ZSFdxYydjr9Ll5t8casghzrIV/7/CMZa
	FAHEddWjDDpzqz+b0LddA8ouwxgl4IkLrFY0cjfPme2PxmUOlmlDmoAEJGX+x+TSM/IVr9VWwKm
	nHgmiWFN71Z0WwwAusME2XGnORtI1nfLasRHV/dribQQ3ewnjLngKeMaLooqEp+1EwKzcFlWnin
	91RjXXVBC9H22yC44JcTD4cLf46UF5SJ6KtgMC80JCFtDQbWEqKbXvjsJRucYb2Vo+ilEYZWegG
	1rEdQX2KitXD0JCpwsHzsEe243x7fxgn3hqY+cZBcBRDJ+0s6FP4qf2MhFv9bWGQK26zD4IAHc1
	PMOOhdLrOsuTx4gOnBC0NN/cTa8ilwbOMIX/Ty6IPWSrQ3LkYfFahrXXvz4NvtJvuteAPA==
X-Received: by 2002:a05:600c:6096:b0:4bb:5de1:e923 with SMTP id 5b1f17b1804b1-4bb5de1f26dmr222829735e9.4.1794919191912;
        Tue, 17 Nov 2026 04:39:51 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:51 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 03/11] arm64: dts: qcom: sm8250-lge-timelm: add reserved memory regions
Date: Tue, 17 Nov 2026 13:39:38 +0100
Message-Id: <20261117123946.668557-4-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117123946.668557-1-rofikcoga@gmail.com>
References: <20261117123946.668557-1-rofikcoga@gmail.com>
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

Reserve the XBL/UEFI log and DFPS data regions used by the firmware.
Keep these regions protected from kernel reuse.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
index 74b673ebbeb9d..ecbff27976fc2 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
@@ -103,6 +103,12 @@ ramoops: ramoops@b0000000 {
 			console-size = <0x40000>;
 			ftrace-size = <0x40000>;
 			pmsg-size = <0x200000>;
+			no-map;
+		};
+
+		res_xbl_uefi_log_region: memory@80880000 {
+			reg = <0x0 0x80880000 0x0 0x14000>;
+			no-map;
 		};
 
 		adsp_mem: memory@8a100000 {
@@ -119,6 +125,16 @@ cdsp_secure_heap: memory@8c700000 {
 			reg = <0x0 0x8c700000 0x0 0x4600000>;
 			no-map;
 		};
+
+		cont_splash_mem: memory@9c000000 {
+			reg = <0x0 0x9c000000 0x0 0x1200000>;
+			no-map;
+		};
+
+		dfps_data_mem: memory@9e300000 {
+			reg = <0x0 0x9e300000 0x0 0x100000>;
+			no-map;
+		};
 	};
 
 	vph_pwr: vph-pwr-regulator {
-- 
2.39.5

