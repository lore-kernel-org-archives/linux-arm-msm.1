Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794212819;
	b=UAKSr591Leox34h6JUy8qaKC76pWSpmmFKDZShWRgVOSB5oLQmXK+gBhV6HfzvCnz2NV
	 AEQ7GqLYt8FJO8F+qflTZQkgBARYRfTCMVsAeBtcix8Q1Qij3h9dwwR89JuBl2JgyC6jI
	 xBSt3SVYodXasS/xjF87LoKLJs7gHyFwWrygFaWARdhLvy/IVgFdlawfyPjXgopzbnz1d
	 /RNJBphUTd20+CZbUu5ECiC7zaXJjvLnpcDuJDiAd1DOFapkTGDJTUoFM1/iiINR6orQl
	 FVDnHe2a7l+pUH6OhoVGGnDG+HBGF7nLgCBg3jHrTdVHEh7nQ9ANqM6yJ2YvwdeBDxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794212819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=IWGbInK1jdqWzqaTB9EgR+W+5CoWAJO2TLJFxQVt21I=;
	b=4ReZERQ0Mg+5+SfNbe9I1mWU1TUgRJAX3MIRfIDCNSgrJ0NHxMZJK8loONg6/4pdVa81
	 UbXe+CI9a7MZ5b6wBEIAJ1FNA0cOwgqYJV9l/3fUlpN1OW5uO94v5PLB+QQUUybPTK4DO
	 +bh9EYVkgsOeoEul2sftkjfNo/htgsBWb9Sdmccm7gRmKPwqwvYuTuXUb/nlOx9dl60+h
	 Mmw/ggZ8Hy2Bzg3sd5tbNKtaC4xPGmK0u1u40JKT7aU3z9cPpBFpQbXD2TQrmK+uQdQNK
	 HQvVQwFhyX2b4FUu0nKRNAk9XsHI0BmftoggnU6Z6pUQghQMhWbYf/c2itvNXRbxM2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oWP+Rohp;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90C0606A337
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 08:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A90C0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oWP+Rohp
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e09aa5264so313903f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 00:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794212817; x=1794817617; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IWGbInK1jdqWzqaTB9EgR+W+5CoWAJO2TLJFxQVt21I=;
        b=oWP+Rohp/ZJqGkQ+oORUcfZmPncX/8Tq39EQaGWxPWIS52HRy425y5lFRzPPC3Chpl
         /R7Jba9ogvC+/fZs6IAAZLC3jvceX5rU0N7ivWgRMFm8SIrKMTFw+1zt0ASAEIaa5JAu
         UiwHcK/EI2ZqUTaK8ufuyQaNuPAmmgTyJ62mcVKWNy4xbc1yJKoEzMxYi1VmdnGuwMKF
         0lpR5fsyxrbB5W39WxkLI46qF1McQOggOviPNfVmhqipl5VHYpLizq1dXBzyHZIs8QOV
         7ekEv63CMreUCjyBhkEpfNMx5f2L/Yxte8iqYzHEvOv2NaGv2E2dLtPqZ4wEAyPxeMF5
         uCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794212817; x=1794817617;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IWGbInK1jdqWzqaTB9EgR+W+5CoWAJO2TLJFxQVt21I=;
        b=nYMa5wm5Qrrl36E06qJ1a1sVCh47DhUaLek1f8ZjnDFwAL/5JhkuLF3TJZgMFovmlE
         /m8pExeJPyR7Svepo6UhGvgc9AaXV4nDk8PSyKVScAb0qFGHLRWEGGahtywWiWmZINDt
         GXdChDUWk7iXoOvVPfvDgVhn9Lma+8cWgryS/plqFm8I6JS/qBSs1U4xyOXWQ3ZgF7cj
         ex360pjEs4QKZISAqHjGTeGbMLaDhJp9Yi6ISB2cbqSvMBaTGKrtTzkH5/lAURF5HLKu
         8lj4We/Blw8JHyBey+vWZdd67M/2cNNWo1uWOdaWvvO5pZhkyI6ul7cEPobi66dkVCS/
         mpnA==
X-Gm-Message-State: APuU4Z85WPOfOf4zg6qkEhgTKqxq+uKMOivpblNjDZ0zFAotvkuF4ZfW
	/2SBLKtnNkAw0enkPaL2hWjUZvzBMlJZYLF/iAG6IO83yNcn9algYmgz/p52KFb6JQQ=
X-Gm-Gg: AYBFou0T22FGsZOwcNrYqaBoplObeEHah+YzcptF/GrWULN/w6nx//OsS4vO1Pghhdb
	XzXZRNzv/J8UgHONwq956WIEnSezw3dty0pOMUcOeGipGzNkJ8Wvfub9tHYEcDx0A973bQFofw5
	11eeUIAcwxuygJeVw0Vg089mucW8trXojcgbXteAxaWp349fH37M9JuVSzePLi9XP1I3vYoh+lm
	x/hQ5F+u7tE7GYq1s7DkgpK8k/RHROS35cRIXNCcetb51/VvdfS8Owp5x1r1f/Rs0Z9LRjPRvQq
	2xNUg8G/mXJ1f7nHeY78FNwJs1kxw36iltgETYqhSZ9T9aYel9N2GBux7B5wCGejB/hSmmZrtMm
	0sjNQ4d305NRWNwd8pzxc5nCPnswev6WrbN7OMXSZeJrvm22SOoWEpuUoyLhErGtx9/U1qvZQY7
	SEpJlU2mOF6TLKpEZyXH6Kme4JDrOMg349A639HEJty05MfWCWhW7RvTvvVivl5nqq/I/S5+zlC
	ObmfcC7bmXasbzAotZxnRmkcP2kMrctqXKKBUtHTsiLIZET4bIe3yLd6Mq7F12o/CNy8Eiwe1rH
	E5d94NeoCjNtV8HWURlKd8uX8rAG7DkhCyacVlvRsw==
X-Received: by 2002:a05:6000:4b0f:b0:492:dddc:64c3 with SMTP id ffacd0b85a97d-49583deb6d6mr5829208f8f.41.1794212816806;
        Mon, 09 Nov 2026 00:26:56 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495b90701c7sm10520949f8f.10.2026.11.09.00.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:26:56 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 08:26:52 +0000
Subject: [PATCH] watchdog: gunyah_wdt: Re-enable the watchdog on resume
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
Message-Id: <20261109-gunyah-wdt-resume-v1-1-fbd84545ce92@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMuD8WoC/yXMyw6CMBBG4Vchs3YSWi8JvopxUYZfGBOr6VCEE
 N7dqstvcc5KhqQwOlcrJUxq+owFbleRDCH2YO2Kydf+5FzdcJ/jEgZ+dyMnWH6A/bEN0ogc9gF
 UulfCTeff83L923J7h4zfEW3bB7URElB1AAAA
X-Change-ID: 20261109-gunyah-wdt-resume-25bac9cc43ae
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794212814; l=3385;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=JhBHgp9sr8F6eF0LAjuuKHo+Dq8rxxMvSwyeg83jF/c=;
 b=ql8wh3203NCheD2G7gbJkVZlyVz94Lq19rmDLGGQXmLsGxxXzrNYlSbxL6ypH2s0BQ2gF1EVT
 IX7uthTFwsADMsIVAQSWkq77pwMbZ+82PV+GrQp+s6yAdIRlgcFvv2k
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

gunyah_wdt_suspend() disables an active watchdog, and
gunyah_wdt_resume() enables it again with gunyah_wdt_start(). start()
first disables the watchdog, which fails with -EINVAL when it is
already disabled. start() ignores that only while the watchdog is
inactive, but on resume it is still active for the watchdog core, so
start() returns before it enables the watchdog:

  gunyah-wdt gunyah-wdt: gunyah_wdt_start: Failed to stop gunyah wdt -22

So after every system suspend, the watchdog is left disabled.

Move setting the timeout and enabling the watchdog into
gunyah_wdt_enable(), and call it on resume, where the watchdog is
already disabled.

Tested on the Samsung Galaxy XR (Qualcomm Halliday) with s2idle and
deep suspend.

Fixes: ca316e145c35 ("watchdog: Add driver for Gunyah Watchdog")
Cc: stable@vger.kernel.org
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
gunyah_wdt binds on the Samsung Galaxy XR (Qualcomm Halliday) with this
SCM patch:
https://lore.kernel.org/r/20261109-qcom-scm-gunyah-uid-v1-1-2776343f9a3b@gmail.com

This work was made together with Claude.
Reviewed and tested on my Galaxy XR. Without this patch the watchdog
doesn't bite after a suspend. With it, it bites again after both s2idle
and deep suspend.
---
 drivers/watchdog/gunyah_wdt.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/gunyah_wdt.c b/drivers/watchdog/gunyah_wdt.c
index 557a78306d18..348c7ccddde0 100644
--- a/drivers/watchdog/gunyah_wdt.c
+++ b/drivers/watchdog/gunyah_wdt.c
@@ -62,19 +62,12 @@ static int gunyah_wdt_call(unsigned long func_id, unsigned long arg1,
 	return gunyah_error_remap(res.a0);
 }
 
-static int gunyah_wdt_start(struct watchdog_device *wdd)
+static int gunyah_wdt_enable(struct watchdog_device *wdd)
 {
-	unsigned int timeout_ms;
+	unsigned int timeout_ms = wdd->timeout * 1000;
 	struct device *dev = wdd->parent;
 	int ret;
 
-	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0);
-	if (ret && watchdog_active(wdd)) {
-		dev_err(dev, "%s: Failed to stop gunyah wdt %d\n", __func__, ret);
-		return ret;
-	}
-
-	timeout_ms = wdd->timeout * 1000;
 	ret = gunyah_wdt_call(GUNYAH_WDT_SET_TIME, timeout_ms, timeout_ms);
 	if (ret) {
 		dev_err(dev, "%s: Failed to set timeout for gunyah wdt %d\n",
@@ -89,6 +82,20 @@ static int gunyah_wdt_start(struct watchdog_device *wdd)
 	return ret;
 }
 
+static int gunyah_wdt_start(struct watchdog_device *wdd)
+{
+	struct device *dev = wdd->parent;
+	int ret;
+
+	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0);
+	if (ret && watchdog_active(wdd)) {
+		dev_err(dev, "%s: Failed to stop gunyah wdt %d\n", __func__, ret);
+		return ret;
+	}
+
+	return gunyah_wdt_enable(wdd);
+}
+
 static int gunyah_wdt_stop(struct watchdog_device *wdd)
 {
 	return gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0);
@@ -224,7 +231,7 @@ static int gunyah_wdt_resume(struct device *dev)
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
 
 	if (watchdog_active(wdd))
-		gunyah_wdt_start(wdd);
+		gunyah_wdt_enable(wdd);
 
 	return 0;
 }

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261109-gunyah-wdt-resume-25bac9cc43ae

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

