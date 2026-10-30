Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793342668;
	b=bZEwogpEUaEVyJIgqN9F4t5CalZ8SPuRZsgzg+jUG9YkzY83pc5KIpxnASk8SZDAjQtj
	 rQErLS7Rg4dMisz485Dj5iM9oeaKlFWq8CFYfE+jTFxkKFHF0GoXa/rksSQM1nrjeZVG3
	 McHv/MN7Jb3hejKnrxtJcT0TTDNfD/vfrJ+11ANRfLCqC1Jspd8Hq5MV96zzIWBHX8864
	 /R1USBbEOXUw/dqq5ntegsIY//8zSf1HxgL+kOYUbSPhttq8bPmEFMVL+s6vm2azpF+Uc
	 K8pcA3oTm8Bsd09iBIZdRTRNSa+z/lSnOPxRc5JE9kT+ap0ce3zmDlhE5sChSu8Fogw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793342668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Tl6rc3WAxZp+WCBy7XVt8SwSQgu2t3lSHibD43bhBmU=;
	b=PflMcTkOzEt7+3Xo/GbK5+f/fGgy+ozmfXWvbtTBf7vK/+10bVjmu7u8xjhMWEnWkKI4
	 ouiSzoYwA3jBIa0IeXRh3+NbugaTaJWoaiUryqWHrDsUFDkqAdFie898FLCKf+orp9mff
	 /hHZLNHPtC/LrrHdZhw2B4/ShzSjaVbCuQ7jiW25ZEXlFxZey405FdnKPNpn6MPcPljBs
	 VsvXgpg5SwQl3ZX1bJwMXmPRXJ/03+x4qiz/B+3O6nphbB2NJ9Y8yxqh5GK6T1UqqL3fn
	 a7hz7jkj/T0mq2KFnSSz5FDCJli+p4Yu8DFazYWZ5bhBQygUc/87wlOGurCjQyCs0jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l6aOiKdf;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDBB606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DDBB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l6aOiKdf
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1846bc43c28so407702c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 23:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793342668; x=1793947468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tl6rc3WAxZp+WCBy7XVt8SwSQgu2t3lSHibD43bhBmU=;
        b=l6aOiKdfh5XFeZiPLMgQFsiWOQZaspnVbO9s3wGBilkdw6HIvPsZG4QkxbZ2Cr/4e5
         j8GuPaQGW5TjJZVGV0S+qXwvuX0495rstsLHg8WYRnWnYeW0esrhhN8u/zW/VuVyPJ+k
         ga+Eagkq1xpofUHypYwE2yKq9BHbtTMexLizcCPkHv1UVG4ROVTsaA5OAyBiNeOBqdm7
         juCLR/WG/eaW5fcTX9KS5N41SNjOU2oevXI08A+4jQuaScs9Xw0YhUSZcW9jqn0WDnI0
         2zLvX652njLJQbXbWbmu2pPjhDteHUPXUk8694nMvzK/NZrs+uLc1aFcBDl6M/qGe/cJ
         V43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793342668; x=1793947468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tl6rc3WAxZp+WCBy7XVt8SwSQgu2t3lSHibD43bhBmU=;
        b=WkqjoVh0Mxjby+3N9QqjM+1uzXm5bXb3hR3d4vj13+lWZMBJ9QEQPxtcy5gCxuq3h4
         yKzbvL+HqsdzGLzuynkfMDbSsLEEtoJdNLvdsyuncLFfSTOtigeAXLjhblgY9U9uhmMM
         nvQL8t+MGj+cvevt8HE0ZFtVNAc9bMZ+XNgBPftqG9b0iE+/H6/EZnRwFG0+QX0ns+Rj
         9M5Jc17HpmRyjqUZ3wn+YICXoFEyGJXlhaa9UoZLaE1XUE/WnTCtHRH/DYsZZNIi+50J
         dqe6pCsZ2N0uYk9cUN5PMR11mzUxUopnLMg7Qjm8JdSh0ePUPzvpeNy/e5lTdYBq1FLo
         8JXA==
X-Gm-Message-State: AFq9FYL+LuK3OVKDklmcZQ+0uzGZ8Af1gtBG7Bvtj1s7rsYiUCQbkmAg
	mOvXFfpzi4F7RI1vHopqeIB8zybiwMVW3GXG8ihEFNMnmDqNzq1gne7t
X-Gm-Gg: AYBFou1lZDmmCuyWatluG4ZIwxEgnXE42JUB0eRaaJ5TwmdCYxbspWGm5U4dCM/I1jI
	UmotSm+6sZdNscSGMeSSFv7xdoIX7wGJm1AEpSqTSh93WQlzkAmL5hR/RzV6OxnxQTgtydVbxa7
	10dPWQwcvRSPtnVPaPp+71Dcq6lVdEvxpmHqU1goeLD082GIjNKI1Izo8RO2e9HgU+bTA/PqI41
	Gyj/NjgA7WRtTNcXqCdLjVMyUcj/JoRSDwKBZ+K2hGU8+RUWhhvf8DhfpVg2BDytjl3J3S+Jvfu
	eGlMw5fxPZ5uNakz/5d5dhz3m2li7FqMGYQWKIutkaStipa8YtiTdiCg5ujjeJGSHYoVsNxcm4O
	nqpKxQrZoJ7STB5sMXVTnaj71pjV40Eve3/6AZnNGN0vBBgBxwro7bNlfJcWRBpJU5+09nv0JZu
	Q0+UftgTPbHEJlaMS97wNZheAMXgkm2VTOwTWhFDqDDNZhShF+y5BheB/xu8bwmZghdhkJ76luN
	25mz0hxIng4m9m8cqZHK3e7OlbSC9quDvNV3CpJTi96F+WF0EdKyfEgIEMIadLVE/SNMF1O4Hlq
	46aUd884X1I/bNIBtc9ld4wrVEF9oQkbY1r+
X-Received: by 2002:a05:7022:158a:b0:185:869a:8c64 with SMTP id a92af1059eb24-1ac56ca0239mr2183312c88.1.1793342667529;
        Thu, 29 Oct 2026 23:44:27 -0700 (PDT)
Received: from ada.lan (cwgw.codeweavers.com. [4.36.164.2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm4173902c88.23.2026.10.29.23.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:44:27 -0700 (PDT)
From: Kaipeng Zeng <kaipeng94@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	abelvesa@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	Kaipeng Zeng <kaipeng94@gmail.com>
Subject: [PATCH v6 3/3] firmware: qcom: scm: Allow QSEECOM on Acer Swift Go Pro AI
Date: Fri, 30 Oct 2026 14:41:49 +0800
Message-ID: <20261030064149.14736-4-kaipeng94@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030064149.14736-1-kaipeng94@gmail.com>
References: <20261030064149.14736-1-kaipeng94@gmail.com>
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

Add the Acer Swift Go Pro AI (SFA14-11) to the QSEECOM allowlist to
enable UEFI variable access through uefisecapp.

Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 43e250faea75..4552da4284ef 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2225,6 +2225,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  + any potential issues with this, only allow validated machines for now.
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
+	{ .compatible = "acer,swift-go-sfa14-11" },
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "asus,vivobook-s15-x1p4" },
 	{ .compatible = "asus,zenbook-a14-ux3407na" },
-- 
2.53.0

