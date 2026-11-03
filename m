Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702135;
	b=vFoPAaMxiuyfzcyBYSWPAKIlW3HROtnpDimvBJF8OONVVOGS1feC8Q0093HNhUr+Zb28
	 SYxTEpHcerk/mgU9o8n0XVX1Mhr/UrBPBFQf9SvFdY2CLmy9FgEc1nH1xxp899Qv24aSo
	 I1aXChXVoZj5KtsK0Z1xUs1NxX7PTTM1iQjevKU758zPNvz31C7tmq70qZLy9nK9QLgaC
	 4THStqu9/QDABeqwZnjAyFaEw5wCyWtJlTOwQ2ho2HbrLM0vNa1ApWIYKBR31OuBVRisS
	 lZobXwT7yr179yqmVW59+ylO3JkBY0RVSSYWges+OqDc0wUQ7t8o4EhJL+SMhawp5AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eMLO9Fg6IwSw8K79EAC+WMzi7PlAaow3vS/afcDMDq8=;
	b=AuvCrs7ozaSAtavg6n1eI9ZhEJWuOuxFeJwZAkMzUy6tQM/xedfvfv2XxdCSpDVOgYsv
	 25rcu9BG4+CFzBS1pMVtHgUieY2BxO/wS80w5Gvj37gf5VKmm851AsN1VUSwMvNxmZOP1
	 EmospCv7dzA6LQ0n1Ap0kbr+Jv4xZpk/oenuORgvdReFJ4A+Y7euFKVNUrjxh4BHBPuWi
	 VOUrrmNaNb+9AIkwDQRkehKr6vr94VnrBOXBubt3vYIEKKCN8eTKwGoqYbmsvL1rON0To
	 fOZVghqkVMxneKdo56q4zm0P64SllhznWTqTZpS+YqQYwPDYH3mCbthQeqTlYNap5ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Urydaz3s;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDCD607FA38
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 10:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BDCD607FA38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Urydaz3s
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso5635781e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 02:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793702133; x=1794306933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eMLO9Fg6IwSw8K79EAC+WMzi7PlAaow3vS/afcDMDq8=;
        b=Urydaz3si8T7p/pcS4cex3Ss/KYsBOEoJ8SM1SINua9z1sPVi574cWGe17XV1QlE8g
         dJAdjNqZQlYh64XQdsfPnYb8JMrYg4Dq5hnayjKxmZzAxRv1+HiI77mRYUGM9VX4SrMV
         LAR5JQ1VaH2Rdj2BKLuDWE/aO8AbWfkYAutPcpHibc+9+aQg/qupuIjIF7vXyaZUpxvg
         V0l8nLOzuxz0Kf4LJTlsWjxPUfR26MMrPj6gntnBdWPQys9UR8aqK0Amtsw9TkpqObNF
         Ly9G4VMMlhONuEpGXq3ARvjflafB0IQYjRTJQow0GosXGbGTbKeZSt+YAqFIk2zNIYuU
         1gKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702133; x=1794306933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eMLO9Fg6IwSw8K79EAC+WMzi7PlAaow3vS/afcDMDq8=;
        b=IboogpnmQsWqFuQHUUsEgMRcebUNgevnlXN7YV+tpKQuchlhyRQv+fgFIZHsKaYTVz
         sU/jv90LgWjLR2B9OsrC/OzGFu4Xff3fMtxrOXQhvVsRZQA1/kAtVsqAxy2vwwL5bILW
         56CGK+aYtC6feW9sW5uldgo2VSsDPTRfMJP8wWGIBeyz1dllLROF7zHEukQFAfcdaW2V
         839AOrv3svBkaCZKyLGK5RzLeHRDSbq0SKXiB1ABi8B4nJzIae/4ppEso2VWFCUhhm3c
         J4wMC0uI3kamKoM/JBWFCkcC82U/rN6KiB2SFfYElfuY4MACS/FPJEhjl9s3pHHjJzYr
         vEnQ==
X-Gm-Message-State: APuU4Z+lBiPnRzYHLdSIWUICxUVyMzuYdkAkk5t+zTJ7TOqeQs1o+YO0
	Ch31C1qcLhgOTZ/qGCY8Ly+nrwrK7fdP4IoyrkZRHLHMFGqr3UdBadZn
X-Gm-Gg: AYBFou3PDMRt3Ad8ek7Jp155NR55YzXvWvljRGFHZgt0z2xuT722zKoU8ZNgR6h8GS9
	VrR8wOSDZV3bdhDDbKM2dyDgsD2lwlw3o+nNYpWnMBtt9sWOZcABoyUzQ6mSTpmyIE5XHD0cVZf
	o6IMfqHOHo2J6LJDXyjy3J+JFTN3KPV4JAoXcy0eHavtGNYwg1b0Lsty6OUkrG/8vshlRXYUdBq
	Si160ooNyJI+WOc9Bk9JEOug2BXBMTIn//y2YdJz3zSv/UNDRdCBOk4uu+WT5Srce5Zt28YPVXy
	7RjPV/KEA0IyrBbnw7Rv/3oOXsf+EvqoX/FPIV+QZv3UnYDuLXIto1N7CpNVDvV0eqAaiZBxKnB
	/FKmWmIUpnQBiH4SBAYfYpQM8/MkNtgxhjz7ADkyB/9EYbdUrzRuUFAnFiczfEnle/RKzwRYDJ7
	UiAnQ+L3xraSH02EVRQY81Z6IPRZkiuVbr97A1sxlbr8CvPOYrelL0dkKUR3ASEfSpNo79UJZz3
	Pnk41MQod5ASj4pNLoD0o3vpbTSPkZ9tRFqpekJ+Ai6FjhSJsoDTRtJ1RUGCBjuxb+kYNiLOQOH
	Hq+Z1vvF6eWWKxdZApukiMy4NmPpN09y0iAwh+rtbYf+lq9PDxq4m1zKwzszSbp8n14LZipsYxm
	Wpg==
X-Received: by 2002:a05:6512:23a5:b0:5bf:b945:2c54 with SMTP id 2adb3069b0e04-5bfd957d04fmr4385163e87.66.1793702133542;
        Tue, 03 Nov 2026 02:35:33 -0800 (PST)
Received: from valor-verifone.verifone.com (balticom-242-238.balticom.lv. [83.99.242.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074802esm2121007e87.73.2026.11.03.02.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:35:32 -0800 (PST)
From: Stanislavs Nilovs <valorcool@gmail.com>
To: brgl@kernel.org,
	marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/1] Bluetooth: qca: Clear 5th byte in TLV tag 27 for WCN3950
Date: Tue,  3 Nov 2026 12:35:29 +0200
Message-ID: <20261103103529.804025-2-valorcool@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103103529.804025-1-valorcool@gmail.com>
References: <20261103103529.804025-1-valorcool@gmail.com>
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

This fixes an incompatibility issue of TLV with 5th byte set to some
value in Tag 27 (Deep Sleep) and the QCA driver for WCN3950 SoC. If the
value is set in TLV, then 2 symptoms are observed:

1) The QCA pre-shutdown command (0xfc08) always fails with timeout.

2) SoC becomes unstable. During power cycling test it could stop
    answering to any commands and QCA driver enters into the "SoC crashed"
    loop and can never recover.

Setting the 5th byte to 0 resolves both issues - pre-shutdown never
times out (so, is always replied) and no crash loops observed.

The Claude Opus 5 (Anthropic) was used to create scripts for dumping the
tag values from TLV files and compare the differences. The fix itself
was written by me and verified on real hardware.

Signed-off-by: Stanislavs Nilovs <valorcool@gmail.com>
---
 drivers/bluetooth/btqca.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 60735b70d89a..a7302a3f9774 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -443,6 +443,15 @@ static int qca_tlv_check_data(struct hci_dev *hdev,
 				 */
 				tlv_nvm->data[0] |= 0x01;
 
+				/* The byte 5 in tag 27 (Deep Sleep) doesn't work with QCA driver.
+				 * If a value is set to anything other than 0, then module can
+				 * enter is some "endless" sleep and stops responding to our
+				 * commands, and the QCA driver enters into endless "SoC crash"
+				 * loop. Setting this byte to 0 resolves all problems.
+				 */
+				if (tag_len >= 5 && soc_type == QCA_WCN3950)
+					tlv_nvm->data[4] = 0x00;
+
 				break;
 			}
 
-- 
2.53.0

