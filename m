Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795829095;
	b=ZtIn2AAiwW/D5bkSVfCt1DBs8+UAtT5qpSFCl6iHHu8NOaFCpifCJGLRA9BkT4qpYXuU
	 v9ZOnKJGMUAGPBKOCVkv9a9lfMmoGPcR2wBdvXMPe37O8LCE9W3AbyeFv85Z5C5uY52+e
	 fp7L0E4L5J/kN84WiHwBPIs+t0JnFxIGOCrKkjKK7fEJ00pZNh5fV5oHRbCLdKYnJXzzu
	 r3704K++9YBoC4XPbHT1X+c/JI+H8hiBM9kVzonSScAk566aFj58ZRmIA676/cQ2AXDvF
	 czix5q5kkIR5jdM6R3nKF+kiELZOltguUnAld3DiYCsvViut2FYx1BtKAHi1tiGZZQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795829095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=OWNGxbponyKfeyRlTE7MEjwwreM5am00CUo8E20vsbk=;
	b=lv2pwmMutWzmkzTqHxsrfbtnENITLRFOPdjLOCVictwWOVUUDQtUGPQcCGlrMqyPy+ta
	 +h1rSrQ1VcLG/58ElfPHj2X4N9BY1kVPNqMLf8TzIIiJkgiDKrJmYIDAVpbmIyoB/Rm6F
	 uJdh9rGenBTGcLwdMWIBHjBuqNjH2vbXyLnEEvx0JtYf6IGb1lc9F43gSAqB2xSKYfj4j
	 CoQSZmqH35HhcGnwXQEQq47B7gi+um5SCCWfBqScFhkgMkFD3o8aA7KyAJVStRVZaNMdG
	 04ZOG8IVTR7D+5wHLGL+7qOjBMPr+uXmEu8iE4q1QuYe9SZB3jopyHZTrURefV3QZQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ksQFYsod;
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC362606A31E
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 01:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC362606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ksQFYsod
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67c6a0abc2eso9086160d50.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 17:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795829094; x=1796433894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWNGxbponyKfeyRlTE7MEjwwreM5am00CUo8E20vsbk=;
        b=ksQFYsodPDGdp7EnIkIthOcdhW3Ho6POpCgmWo06HcHx7CM2uDECQE6JLgFOtFX+uS
         wwiNCleRKgX/0hRnp0SzYPzS0vEq7xewx5ThO3Nd4c+jc927eTCYOYV9i87wQ3s7QX9g
         gM4oteXd7fQNqEZ4XqviJ7RFBjejJgM9Z85Rs6YeLXmlaquJawaGoZNglCJzagobxWXL
         PNh6IzvM0AaX47sndHCfGkEGT06zcmJIk1HumtzWpSVgwl4qDlcHJpPcTfVgSiawlJCK
         8nQ3kPQdEIAr4/VK0Y/pvLGwi/31bJjkTNaNezz3wQfoUfik/dcCkg50LN670OhAON0l
         Ld3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795829094; x=1796433894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWNGxbponyKfeyRlTE7MEjwwreM5am00CUo8E20vsbk=;
        b=x03WUkHvFPQp9V3778BDZBpedVGDAjJZarNvAp0GvzlTnYPlsuKD5WpjBjkpT84Tkx
         6uD9ZJjMJ2AeJAwksuxffAHy0NYn3YnmBjN1bvUcjVA2eYoF7KUMrORkmXCSIXoKz6mA
         eegd2ulmM9xi7mVpLhKGZwJciPSGa1b48JgyEc8wUbnqas2zw2Dd5kU4KZMi88OI5dwT
         kElWLCpAJ4WBYeEyCCAZBIba1zB5dg5i/22i7T7uwycAzamW0lTQBrJacC0lV0bYEqqD
         /HdWSDcJJfAwNltPsTmAoh+bMePdpALoHzfPLw/8e7gQxKqImwMYlTHrGwka/qO+jfa1
         h0qA==
X-Gm-Message-State: APuU4Z/eEOtAXLFWlEHdUENCscmU17m7Y8RaeETCigSFc1uN96VmytQk
	JhV6TIgazG6o1lBh3ks0mtFLk90XbcDOFvZG9OBiOoosF6mrpBf7WPgh
X-Gm-Gg: AZFdTZeSwkVuGxJ6oEZZKwG0HH6NHJrCU2eUqnSEDkoCFl4wBNz1h8W8y+ReD5nv0M6
	jj7sZTl499Ev/vizyGlt/+onfuIeG2aO0dPMwhVzsSMmq87C+VS8/9Go9Z+g9iWOo+HUAmr33+r
	ubu8sgr9Mb6PuLI4Oh5UVAyAI9OHTgsrZT+raLcZ8ooEQH42RX2wLUOUd9PdUhwog2K57JcRnsi
	IUldCye0l+sVtoBUjL4eKpoqiRP/lzf+z5yxRtWE+Mo4x3WKWtEiSJ+w1q4Gt+IfOVzxedbft32
	cuz1506viwsYi8dqsLD9sN0xKLtCc5zzPuutG7Qu0DZQ/FyINWWNsJ3CfcWr6w2O2rFUffVeARp
	WBCLIPqTWzYn+xlMI8JtaJIA9Tb0jQAg1Iip3QpvYtwD/DboIkKERy9ZvswB6QoKqqb1M7b8OjD
	OYL37kxmnSl1lBSdOpixYzgNxKJRfON91jVn7XjDEFhWXolbwuS52+ZrdAqlHQNLjfpTomoUisQ
	EXx8Vs0cFVXlWObWX7CHP7nzlxZbecWgffT19QBYm02EdTx5ktlZOrWTlCGoV0NRfmD1puLanL2
	/uj34Hk+Pe0HnxDBYqEiABaD6Z2+/djPv22L5hM=
X-Received: by 2002:a05:690e:4504:10b0:67d:c165:7f0c with SMTP id 956f58d0204a3-67df44555e5mr6440765d50.54.1795829093954;
        Fri, 27 Nov 2026 17:24:53 -0800 (PST)
Received: from WillzDenali.tail339aa4.ts.net ([2600:1702:7a80:3c5e::c81])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33105fesm11921499d50.7.2026.11.27.17.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 17:24:53 -0800 (PST)
From: turbinebmw <turbine.bmw@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Brandon Williams <turbine.bmw@gmail.com>,
	Val Packett <val@packett.cool>,
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH] power: supply: qcom_battmgr: treat a start threshold of 0 as none
Date: Fri, 27 Nov 2026 20:24:49 -0500
Message-ID: <20261128012449.323479-1-turbine.bmw@gmail.com>
X-Mailer: git-send-email 2.56.1
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

From: Brandon Williams <turbine.bmw@gmail.com>

UPower turns a charge limit off by writing 0 to
charge_control_start_threshold and 100 to charge_control_end_threshold.
Since commit 8809980fdc8a ("power: supply: qcom_battmgr: clamp charge
control thresholds") the driver raises the 0 to
CHARGE_CTRL_START_THR_MIN, so the firmware is told to charge to 100%
but resume only below 50%. A battery that the limit had stopped at its
end threshold, say 80%, then stays at "Not charging" until it drains
below 50%, and turning the limit off appears to do nothing.

Disabling charge control through the request's enable bit was tried
and reverted, as the firmware did not behave as expected with it.
Instead, take a start threshold of 0 to mean that there is none: keep
the end threshold and use the smallest step, CHARGE_CTRL_DELTA_SOC, so
that charging resumes as soon as the level drops below it. The start
sent to the firmware stays within [50, 95], as the end threshold is at
least 55. The start is remembered as 0, so a following end threshold
write keeps the small step, whichever order userspace writes them in.

Tested on a Microsoft Surface Pro 11 (X1E80100) with UPower 1.91.5: with
the battery held at 80% on a 75-80 window, turning the limit off set
95-100 and the battery charged at once; turning it back on restored
75-80.

Link: https://gitlab.freedesktop.org/upower/upower/-/issues/327
Fixes: 8809980fdc8a ("power: supply: qcom_battmgr: clamp charge control thresholds")
Cc: Val Packett <val@packett.cool>
Cc: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Brandon Williams <turbine.bmw@gmail.com>
---
Based on sre/linux-power-supply for-next. Hardware-tested as a backport
to 7.3.6 (the same logic laid out with a goto, on top of a local change
that returns the request status like ffce9bb777f2); a userspace harness
running both versions' setters over 120000 random threshold writes gave
identical firmware requests and sysfs values. Compile-tested with W=1.

This keeps the 50% floor Fenglin explained in the thread on Val's series
and does not use the enable bit, whose removal is 8e8856396b54.

 drivers/power/supply/qcom_battmgr.c | 43 +++++++++++++++++++----------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index 0789303..45bd1ff 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -762,21 +762,36 @@ static int qcom_battmgr_set_charge_start_threshold(struct qcom_battmgr *battmgr,
 	u32 target_soc, delta_soc;
 	int ret;
 
-	start_soc = clamp(start_soc, CHARGE_CTRL_START_THR_MIN, CHARGE_CTRL_START_THR_MAX);
-
-	/*
-	 * If the new start threshold is larger than the old end threshold,
-	 * move the end threshold one step (DELTA_SOC) after the new start
-	 * threshold.
-	 */
-	if (start_soc > battmgr->info.charge_ctrl_end) {
-		target_soc = start_soc + CHARGE_CTRL_DELTA_SOC;
-		target_soc = min_t(u32, target_soc, CHARGE_CTRL_END_THR_MAX);
-		delta_soc = target_soc - start_soc;
-		delta_soc = min_t(u32, delta_soc, CHARGE_CTRL_DELTA_SOC);
+	if (start_soc <= 0) {
+		/*
+		 * A start threshold of 0 means there is none: charging resumes
+		 * as soon as the level drops below the end threshold. Userspace
+		 * writes it, with an end threshold of 100, to turn the limit
+		 * off. Use the smallest step below the end threshold, which
+		 * keeps the start within the firmware's range, and remember 0
+		 * so that a following end threshold write keeps that step.
+		 */
+		start_soc = 0;
+		target_soc = battmgr->info.charge_ctrl_end ?: CHARGE_CTRL_END_THR_MAX;
+		delta_soc = CHARGE_CTRL_DELTA_SOC;
 	} else {
-		target_soc =  battmgr->info.charge_ctrl_end;
-		delta_soc = battmgr->info.charge_ctrl_end - start_soc;
+		start_soc = clamp(start_soc, CHARGE_CTRL_START_THR_MIN,
+				  CHARGE_CTRL_START_THR_MAX);
+
+		/*
+		 * If the new start threshold is larger than the old end
+		 * threshold, move the end threshold one step (DELTA_SOC)
+		 * after the new start threshold.
+		 */
+		if (start_soc > battmgr->info.charge_ctrl_end) {
+			target_soc = start_soc + CHARGE_CTRL_DELTA_SOC;
+			target_soc = min_t(u32, target_soc, CHARGE_CTRL_END_THR_MAX);
+			delta_soc = target_soc - start_soc;
+			delta_soc = min_t(u32, delta_soc, CHARGE_CTRL_DELTA_SOC);
+		} else {
+			target_soc =  battmgr->info.charge_ctrl_end;
+			delta_soc = battmgr->info.charge_ctrl_end - start_soc;
+		}
 	}
 
 	mutex_lock(&battmgr->lock);
base-commit: 4f9bf356cbfb8aa6e73b1d05e182445723a4bb49
-- 
2.56.1

