Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687348;
	b=TLdHUCiAf0VqPjKJJHiwRfKgbNs2sWqsh2yV4YqUD6QdXWbut1iSiy2Py/QYQok0fIBU
	 Kf4u9ShNLg3B39cJfTbnQIXIPsfFToygAGB7oJTN5Y3mxD39DG0r7tnLL/Xv1m1rgIQ+A
	 3d5u2S5Vg4vCEwFEklyQ6XvO5nkObsaQmXV6dXoaXmNV6PF9VPZABX4k/Ivj8DGF75aG0
	 9qSeHPFzUpiWyxZ+CEBNn49LoaehkpqwQ0rhKp/+I+52qExs/rlPMCdE9/XdikmEbAnx/
	 sOh8vOlRhrCqBLX+afh7LY2Ya+Rw0YiqgiSArluTobkyAeXsF07AICNSxvTi0TkgtuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zblh9RJVoqtDhwxOvvPdwA42GF2EgXCszh/ysjfgfTI=;
	b=ccTwpEcyROPFJObKkvsdMgcuOAqZQ9rx+EP+RTGNjAq25W3xERYHfIZ/F/+/cEgvFabA
	 EIHZ/3egdfbe6O0osFJQehYFEZHXHQgei48p+PkDmf1+sjMSqhmQjeM9zCOct2NumfDrw
	 sjRrQGM0PdYFtgtvhoP8CVb027o7m5OP1NuXA9Sis4OH4FYP+2kC8gFqcCAODIZ7RsSP7
	 djRXw599PhDjmUyU+u9sQM/WVGoc4DZbTUIBJ7UKFlRVZTFtjESbZsMvX7NBanM0K/6L2
	 jdJkA2BCQUBOV9XYnljg6IAITQFn3elsmt2O3i4iHLq8QC1vw2kjyTOHX+9y7ROLGSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HVUIURyu;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E80D606A32F
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 16:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E80D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HVUIURyu
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e00eee27dso12720f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792687346; x=1793292146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zblh9RJVoqtDhwxOvvPdwA42GF2EgXCszh/ysjfgfTI=;
        b=HVUIURyu90T8GjQn2XXazP7dCqrkiXuYpUxCekjY7600wY09bAmNd4mE46R5Ssogk2
         CFN6+ZBuNhKlfANZH2F9nzhjn71dnyQbdos+w+SU0yfZwElm7P9o1S4gULAkrdjPI7UL
         XTodH5b6q94BoS+3Y98uhDdz7YVJrYmsHiJ7kyb3HN4vfUH8UeiU7tByzCLzy+8ADjRp
         3NZcDrkHTPmVWg7034QG1bqxqVpommIF7hvUmnY9VCBWIPRHvdgdY/cpWD7fMImCMFud
         MnRjBah85GPQEsKA2fKzvsJ9rDigodkvJHh/PImruCVzjkKI9SmsGI1C2TuEdOd/q7oS
         x9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687346; x=1793292146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zblh9RJVoqtDhwxOvvPdwA42GF2EgXCszh/ysjfgfTI=;
        b=21M00INiHNiwLio7Pt9KVCHBgo18oIu1GNtJqmE8SGZMsU+PWGB+Vs2xS2Ww3BNexJ
         y0eOAZO9QRgEjUwmx0a7dDt5s3rq8r3TYrrmk5uZVdCEfucrag9g5J12UnEOVIAaw8mD
         EbhJ7ocYj8pAIfy2fRiClb3eXWM804aPTesJQet6E5qH6zHkSCGYlq17O91QTfFFYq+C
         ZV/G/pn7qpcldbmQ2DvYSOd5HyuAaiqG+ZZVhoLMixQqwKJRGkVV8i3Je8cirDW78ryt
         rrhfuShZL6/t5JB/P3+cW/27LmTAYKMvGv/S2r6u2nY4fmpgUzoMPur4tIzGYSocvr9m
         cG5g==
X-Forwarded-Encrypted: i=1; AKwUvBxvelPAZ/n1eufeHjEbFczXbXAweSiH8+hGAZZmeVWoe/+zwCBtyn3MguY1ZGtl9K493iimQxU5w46jNjJD@vger.kernel.org
X-Gm-Message-State: AFq9FYJpSqI+fWe6wYzWZPuMxOBvv0cqe/w/DWdBTxJ9lCTDWHC2SI+P
	naRsUdjGF5lSspp7oXEC+z276CgCVIX3YEtnWLEgCd4T1GH8Xqtfswjw
X-Gm-Gg: AYBFou0tUmcu9Q+yfxzrtOK1qKbUQ1UpJr4jl9Y7PZ+FpG3Jspv4t3BbUySmyMwF4kj
	Ktl9/9al0uyBTyv24aV7MkP+p9FcVKMUunCC1vpKPr+O02p9urkeg1KKxCnGNxx53YEw+1nZBEj
	//AWTf22WCauE3Pma3MMYvjcvBjqd65PCNITR/V3egJ7YpTvEzs508KAXorjbRGksZDQQ2jdDH+
	Zgpt2Tg5j18dCx/P+fYqoVvtjFtL9rUOAzPw+6xUz2Xvc64CIR5ZKUG3DlIFegggsrh0ou9fJvK
	wDpE2SbYGKJ/xrzOqnkKGBEEcx0QKNCO8JzgpzhKR6hcrHRiWG9p77EsYcDZprnmnpl+Fasgho3
	XnkgdwFrAw77KWN2681DIQr8N6rlH58wNLUlEp37R64AJxoCQwRvq4NvfILVXaH/cjeI1U5eqLk
	tpcMpEulgAd1wsIa/CMbQgBYHIB2SuV2h+dT3jA8WaGNw6RbsGSC4sQVQn3GjjNE3kzekoQcvLt
	jdIvg1tNTPkOuI5xDhcg0URTaBwIGMMmbi4xMLGm2XhPnBfqRcNV0fwuIb6Z+Q0tlt5KZ5yQOwL
	mFEDKKsOFuvNZQg8F3gqsPIW/w4=
X-Received: by 2002:adf:fc4a:0:b0:48d:fbee:3dec with SMTP id ffacd0b85a97d-48e264c8742mr9406786f8f.29.1792687346264;
        Thu, 22 Oct 2026 09:42:26 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584c3b0sm15040175f8f.57.2026.10.22.09.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:42:26 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sre@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Joonhoe Kim <26rote@gmail.com>,
	Daniel J Blueman <daniel@quora.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Subject: [RFC PATCH 3/4] usb: typec: ucsi: glink: Wake up the system on connector changes
Date: Thu, 22 Oct 2026 19:41:50 +0300
Message-ID: <20261022164151.592-4-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261022164151.592-1-tvlad744@gmail.com>
References: <20261022164151.592-1-tvlad744@gmail.com>
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

The UCSI notifications from PMIC GLINK report connector changes, a USB
cable being plugged in or out for one, and the completion of UCSI
commands. Enable wakeup on the device, so that pmic_glink reports them
as wakeup events: a cable change brings the system out of
suspend-to-idle and aborts a suspend in progress.

The completion of a command arrives only while the command is in
flight, so it can wake up the system only when a suspend has started
in the middle of one.

The same was proposed in [1], with the wakeup event reported from the
callback. pmic_glink reports it now, also for the notifications that
it holds back over system sleep.

Link: https://lore.kernel.org/all/20260722-ucsi_glink_wakeup-v2-1-b43dee56df24@oss.qualcomm.com/ [1]
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
I used an AI assistant (Claude) for the analysis and to draft this
patch and its description; I reviewed the result. The testing is
described in the cover letter.

 drivers/usb/typec/ucsi/ucsi_glink.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 1db0c88d817e..b03320f5a6bb 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of_device.h>
+#include <linux/pm_wakeup.h>
 #include <linux/property.h>
 #include <linux/soc/qcom/pdr.h>
 #include <linux/usb/typec_mux.h>
@@ -455,6 +456,11 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
 		ucsi->port_orientation[port] = desc;
 	}
 
+	/* pmic_glink reports the notifications as wakeup events */
+	ret = devm_device_init_wakeup(dev);
+	if (ret)
+		return ret;
+
 	ucsi->client = devm_pmic_glink_client_alloc(dev, PMIC_GLINK_OWNER_USBC,
 						    pmic_glink_ucsi_callback,
 						    pmic_glink_ucsi_pdr_notify,
-- 
2.43.0

