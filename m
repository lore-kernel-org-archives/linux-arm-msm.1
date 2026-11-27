Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774802;
	b=Fk6C0e3WeSIzGS1ZaA+hlkBHQuvBxtCfUYEB68yzUQeUEmptOy6fGWGMTcPEz5uWH7nt
	 ypZL0q3rh5gf52/fpSdGk/Wm5R0lccEs0XzW35jzNCQcFwiwd5BOBppI+hQ5QOttY1tAA
	 NExrWCGXiDpKWzoJIEfUdaaYgto5v4F4laN8lo+cudW2svaoNVivrVlAkYbHDf0eBleLc
	 B8UMb+irP5EJl9Zt3PgW3O7kQQqBoSfqYtXrcOy4TEgz6iDrdKTZz2ln5ZaPruEAHMSmw
	 /WaNnlspZ6FisRaUiLG7/AepNzlufOju0aUP1NfjueNcU9rgTbtBPZoSVsut0dz5Mhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/bHweB9XpIg9EvyhzZ3UJfVy04pQWUV+S2jVq/Gs88c=;
	b=P+kyNPuqtsrDZYO8JmhjvI0FrzucYMR+2k7VkrR4xyaRsM9Y3AKDyCAddN2JE2H7htUZ
	 eqoG1E83q+c337cPp10D84ULS104c6/cX2i8A2uk1JE9HKCVFZs96mPaWVfjlJEQZbF/s
	 8e0w1SD5pkM2TQqPK1nD9A4d5zthZdejPk2AmH+mmoAUZPU8VKSmZJqlllEh830iHz5Gh
	 ma9IYC77c6kiafe/78TD7dAyrEFjvrHeBj6J5CklK2W4huXi87AeGsvDAWGRXAXAVW3kl
	 JHL1bLKrYn8VE1qSFOvBkHRw0LHyzEluef0WcAShU/4BRhAizcyR1053mQ3g2YI1F/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YhSuQFZ5;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E1C606A32C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9E1C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YhSuQFZ5
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b77e464208so734702b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 02:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774801; x=1796379601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/bHweB9XpIg9EvyhzZ3UJfVy04pQWUV+S2jVq/Gs88c=;
        b=YhSuQFZ5wL5U02luVQex6Tyq3yiRwcM2RtvzWkbV0juM+6PjzAZAaWUzUqYVxuszq5
         3859mEm8DyZgbOd8DeOxjGzRqMsyjUIWIigE61bp8+FSuw+7lJp2WuproO7gLQZNcQp7
         PjKnK32nk3F2PRPSQI1RJ+mqWJgcGYFYn//SaZhGl9k3lNvPIb2xjOO6rfxm53Ib/i1l
         iqaZGstNFh6QXQ9PqcyPhDD8NkjNEPx3IKXTJTzloh971Ic4qVWnZngk9AC1Ar/NiFc4
         88M7DB7pbqkkOdqk2YEwDZnIHGNh00SMfkQUWFeAO4u5DtmF2Cmo94CZMj8THvXkNgeS
         yx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774801; x=1796379601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/bHweB9XpIg9EvyhzZ3UJfVy04pQWUV+S2jVq/Gs88c=;
        b=2SDrje805016I+Rq7kpbtE5WkdV9S/C44dpzs4jwNa1BgQZX6jospNI7VLSUfjFr18
         vJQfCg/TSltXwXQ2X7O2CdUhPHOf5h/lQy/neAOME7H+og0x4VQ93p+enIEjvTmLyZ+X
         ulBkMs0nznuRMdaIfVXB8N5XBUDj/ESwebgdbjuwGNhn4sKFnLoZga3dqUgZ+NM0EsY3
         L/XdzYYUWFixBXZhR6Eck1s6HWiej/UEUrONly8UZhi6nIdzidUILSws6mZXTJt6cmkM
         +WHHa3EwB8xc2j5yMKenb09KPd3XZMCDy/pYASLlHMkTXrGfNuk0BAi+ryEbNxaqtshT
         JFng==
X-Forwarded-Encrypted: i=1; AL+hErHxlGbH8ZYITOinjkWNtn5sc1OnhfA3cApX/5bnFUMkuRn7+yvaAeCjR3S0vi+u8q5steJnvlr8f9oBBQRl@vger.kernel.org
X-Gm-Message-State: APuU4Z+l6E7v/bgPqLEXSu2D6w/w5a8tVQKGPN1uxlpEw6EP7b7M4Vts
	dx/V2u+0pMX/iB11wZvvXeSHRCT6ydCXGMTKiDj9FUPw47Lh8Y2n1Tc1
X-Gm-Gg: AZFdTZdDSmY0uPfNUYrzjt370dtFsup19zQ0uq7NQoUpp9pPXwCfZcWwFAFQmW7YlT7
	DyzR+Om9pDymG0AjOb8BPYrvkXt2DWViTfJP2rvO7a6mhcY2oHP3vVp2+rdDI96a3wlwgNDZ8KJ
	+3lmb9IrhQ+5EKnJPjFDtEDQ1NpUonxmXgihakxPKVo/BYptqV2mIn+ucXu3nF+wDxnjhENuiWd
	ucFBHQKOfY1P0OQBr9IwnW8uOulz2BXJ/5V1hZigSDgiZBUUuyURHjxe0+Uym0Q8IiX4rL0jizl
	Vx2JxB+Ti2UON9uTJSX/145/+lKy2d2IStveCd8UXpxnVMnRd5yxZtY8nA/otIN+ZDlRDF/cbJA
	Dmqf6KOL+KJyzmHfKutSeUW3ImWjR6akNtZIL3rRP5JpOH2gZ2vunZjmJNnYyMgzbMvrKQEQe2c
	U7CwcKj+Wu2s4OYi13u6cXfxv5xsxilASOyzbZu33CBJ+Cm4W74hiwhJEd6fidAnwFj/5fRLdmm
	Iu5Pq6qC8gGKfr/g9UWyedEvJeBMEeamfCrgoUEOI/Avl7bYOZFo6f2kEC16JA/QbLi75StFhbq
	SysZOqy0JEdzuO+9msgh/omSLdPye9qWng6jAEenA1lX3NH8dHxfOw==
X-Received: by 2002:a17:902:eccf:b0:2e9:9263:a58 with SMTP id d9443c01a7336-2f03f0c2295mr388038615ad.1.1795774801250;
        Fri, 27 Nov 2026 02:20:01 -0800 (PST)
Received: from localhost.localdomain ([240e:36d:b08:5b40::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0457fd68dsm107807105ad.39.2026.11.27.02.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:20:00 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: devicetree@vger.kernel.org
Cc: Jianhua Lu <lujianhua000@gmail.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm8250-xiaomi-elish: Distinguish display panel variants
Date: Fri, 27 Nov 2026 18:19:20 +0800
Message-ID: <20261127101942.3215633-3-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127101942.3215633-1-liujianfeng1994@gmail.com>
References: <20261127101942.3215633-1-liujianfeng1994@gmail.com>
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

The BOE and CSOT variants of the Xiaomi Mi Pad 5 Pro have separate device
trees, but both advertise the same root compatible list. Firmware using
that list to select a DTB, such as Stubble, cannot distinguish them and
may select the device tree for the wrong panel.

Prepend a panel-specific board compatible to each variant's root node.
Retain xiaomi,elish and qcom,sm8250 as fallbacks for existing users of the
generic board and SoC compatibles.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>

---

Changes in v2:
- Use sm8250-xiaomi-elish in the commit subject, as requested by
  Jianhua Lu.

 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts  | 2 +-
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts
index de6101ddebe7d..4838f3950124c 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "Xiaomi Mi Pad 5 Pro (BOE)";
-	compatible = "xiaomi,elish", "qcom,sm8250";
+	compatible = "xiaomi,elish-boe", "xiaomi,elish", "qcom,sm8250";
 };
 
 &display_panel {
diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts
index 4cffe9c703df8..0ad0a76ee9d04 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "Xiaomi Mi Pad 5 Pro (CSOT)";
-	compatible = "xiaomi,elish", "qcom,sm8250";
+	compatible = "xiaomi,elish-csot", "xiaomi,elish", "qcom,sm8250";
 };
 
 &display_panel {
-- 
2.47.3

