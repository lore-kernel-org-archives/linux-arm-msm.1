Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702058;
	b=eDOojZDRwDeOhl1fQc2DP8fubJawCGYp5iKu7ipVVPPD/5vazAuV6j2uVhXSTKMw+oJ3
	 1pDZwX6Dcown6wNBNeUSkLK+YpCxPSlyIS4m/CEFHglc9VEIQO0l81BRTXcgLoiyn4W3y
	 G7FnF+XfGPv4MXVpphLe1vn+zM9YkW73IkcA+jw1KTjfHIDy712H92e1egLjojfGLldbs
	 DPeg/Jux3LAuizXtICMYdXsp8WioYW83hVopHHUA3H5aEA7jgO0hPIzDd1aaC30aOMInx
	 YdmgvulaHbegbmYUc6qliCdLi39P4bbMOR+VKFP8MjqmDjYmWSoCmK9xQ2uG6GIQXtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=pH9/sCYOcncqpCcoeB54AhMetbhpo6QSkADAh3kN1rE=;
	b=Qh+hfjWVkKaVE43JMuTuNDbFiUtvYZS9D+CeDp+to22EfZVbSuPbV7Jf/qUie/h6RbZy
	 AinMvtSw2uN8UXVTLFGdyTyN32gWp5a5asuS3moHceeGLSLlPblT4kYJ26npgYZCP6Aj5
	 Hoq7xeGkRXCOx3nRP+vDpbKXCdwvGoH0Z6ehnhYzqUZ7Dq0SKpC49HCRoLplz/TxAbJmQ
	 /A7D7Uk+LDr/VN/JIZeUgO1NPnVUj0mnIKp3jCKuhjCmgogQASNe0+hzlTn5X6X337lip
	 BmMA62UZ1TSi9Ned9nCyOcfFkMHFxCoRUaJ2Dwn4Te5itEEG6kJoxx0JTi+/+IoKPNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dVjJkjmf;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503B46072BD0
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 10:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 503B46072BD0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dVjJkjmf
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso3414016e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 02:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793702055; x=1794306855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pH9/sCYOcncqpCcoeB54AhMetbhpo6QSkADAh3kN1rE=;
        b=dVjJkjmfckn0xkYGr9D08aPnZHTdUkDJJlNwNbv2DGseYMYkUSZBk1LO6CtdWrO0s/
         csi4SHazGVyUD5wO0D05jSCqqOmaIdw2ih1q9GLjr5i3qt7fVAxlUi+LK/B54zsJgXON
         ee1gGBQDZZqSwot1JxLe/BhCO143mR4F7B0O/4JdJDnR3pUpAfAyrFrzUqXiiZp08V55
         qrNqtgz/yLLxXE5lkDQo0LCoYNYqFCHbk/VAxN8AWkI+9hDZrhXNkn4rqpqRcCkHYL9P
         g0BlW3eODpQp96QNgVAevJAfvIi8TVUBIKAE/d4rhWoOYCAv55aQMEz4Cx8jEXyb/4eX
         W+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702055; x=1794306855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pH9/sCYOcncqpCcoeB54AhMetbhpo6QSkADAh3kN1rE=;
        b=hEkdT3j36GhPNolXkLC8jPlAQ4+V8QKOm4wmIIVU+mcw7Uo/rMpifoqA52jUSZ1ZL3
         EpK9XZN2WOp7nEY9TAjvr9UtqfPAd2V/yJ5RXjBVVY00H51kfIFSneljd6mlLX0eMggL
         MiNoXu+Er1RwL0aIBPoikmOYV9kbZB15HEMOUJ94Bo1ROjfqIu82h03qvV8kXGT9w0LT
         sl2QuE0ckQ4YTNXnPCRwCZj99hAIXxNIFIHRw2/SIe/LYAYs/8Pu1DxuO2ouHdNFdDTV
         LSyysXR5nZ4ZPv1+S0nz9GEDTXvjxMYYcWlz9M+/yhfhBMwfw+BIT2eiUErXfYKz+YIC
         a/mw==
X-Gm-Message-State: APuU4Z+0HZlSPb/bG3kyt/Fxbeax/MzBu1IgxBPNi/6EWf75w8lZ7Yxg
	5BIUFDqIl7rgpZA+jLRWKKmtbk6h+3g1guY2pYj6+TAYoWF58usByg91
X-Gm-Gg: AYBFou1H6E7zYnub3amXHG7UugL1VvSqLdBpOGUcPHZbIEHeLj2FPs9T/Y8FblMy9Vp
	VctbEhMaiF/GLWD6eMd9deF6/iC8eff9XmuA/jFfxqCWXoDpfrhnldIahNjwBpXMCkzYTP8P+n2
	d3muP3xGu0KcIj33MtoEhWCyPvTmkM/Yi7aEZBTqzTiq8akFPtN1xWZVQ4vhELWbUqkUkDSlj+A
	k+he80i0nmpOTwyasCvMRxkpLTnca0XrVmTqQKczt52kcZyZLRcTjge1yYpS/mBQ8tya9qHbV10
	D/Bs8jIJ1Ci90Gzl2wdJSsiCMfxf8geYNc4cF6tKPB56477+sA29lwUAOuoaxhDOJ2APYZXmRWj
	PoRNAKmg5jg3V21wbr+jtf178oORkZjCsj5uREMeeLqCozzsuZ5+810NvGRyPdLJgKqa0Uw/xaB
	FRtC/J3li2FNmUDMnTDZtgu5ZI0Lj83BsBJTCFAoyMDUzmnen2J/fJ1WEotAuelubuYZPHClawQ
	+/AY+2j1ByXUqDyX4AYW8BQcF4KkfyQSflhQembgWsX/7KjvT10O0AX+1pvmKTlwoGgZEEqMIBA
	C35m775RXoVy33jUK6menDvADRt5kbFBvSntIsDOLDa40kf295g3LpwI4wMYs12GAnmuLVagNxr
	WTA==
X-Received: by 2002:a05:6512:15a0:b0:5bf:b93d:a75a with SMTP id 2adb3069b0e04-5bfd957985dmr4108363e87.12.1793702055494;
        Tue, 03 Nov 2026 02:34:15 -0800 (PST)
Received: from valor-verifone.verifone.com (balticom-242-238.balticom.lv. [83.99.242.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edd72sm2074917e87.1.2026.11.03.02.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:34:14 -0800 (PST)
From: Stanislavs Nilovs <valorcool@gmail.com>
To: brgl@kernel.org,
	marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: qca: Disable SoC debug logging for WCN3950
Date: Tue,  3 Nov 2026 12:34:14 +0200
Message-ID: <20261103103414.803861-1-valorcool@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Added WCN3950 module to the switch-case to disable SoC debug packets.

Fixes: 590deccf4c06 ("Bluetooth: hci_qca: Disable SoC debug logging for WCN3991")
Signed-off-by: Stanislavs Nilovs <valorcool@gmail.com>
---
 drivers/bluetooth/btqca.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 002307000d3c..60735b70d89a 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -943,6 +943,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	switch (soc_type) {
 	case QCA_QCA2066:
 	case QCA_QCA6390:
+	case QCA_WCN3950:
 	case QCA_WCN3991:
 	case QCA_WCN6750:
 	case QCA_WCN6855:
-- 
2.53.0

