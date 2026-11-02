Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627824;
	b=KLJ2hqvxkln/EGsgkirzixRe8ECc91LLI+KTE1DA38Oork1v26GIjtrQGC8YmAQhiWIl
	 9xrYFbUS2xLNafwBRx4eIfGhJHs2ogOKzM1+C2z1O1Ns9uVAjldtNkDr9P5DD+rGwplnX
	 prAirgrc+zJgwh6RB2eVdaqxgp9O3Pvb1d3eDZ/Q8j/oTSGvLmKCPdk860yuJTCLyV4mH
	 6hTskXNtomx4XU92aXb437WSO7WhYP2gWqoIA3uE53mJthP6s3kjiAQUzQYhNvXODDquJ
	 cFCyfGZXP3ETTYUzwe8RBMH2ic9kXTdmjxuDj26Niad26HDc1wpnTJK5CcTZuA8vsdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=tsHJAqJzVJK5StZwQ/IGYfPmYXMlz4wWAMnosjbM5LM=;
	b=1FEGKgUvuwnkN3gvBDzy8N6fT1gI6/XYzGSY6baPaIjlb+iTOAoQauToBjL2U+9g/ewi
	 D2hG/wldeDUWcuhrw3QUNlnl6FZ1tJxLuO2B9EbGRLyE2LSuTXxI6xEwgSz0B/4i+9ZXD
	 DDGcddGLSK/kFcsF6Wsjm48jn6VifeC9THlVs1vucNk3GN50Mg4WY4M2Q9nrHxj9e1eMl
	 4PRxWINEx0yflrdMWpe8kAh91BB80w2Loe1H5sQmW/G3Z8M6Ev6Jf5HhO57pEXhlPLIoG
	 wpDc8/TlAVR7LzxMSBT0K2IbStJ21Uk0SQC3ERKzAUnPYLFpztQnZAeo8J+1U4gu/6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QgToMraP;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C2360A3811
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30C2360A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QgToMraP
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so19495305e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793627823; x=1794232623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsHJAqJzVJK5StZwQ/IGYfPmYXMlz4wWAMnosjbM5LM=;
        b=QgToMraPIYAZ6E9QJv56CW8TA5NeDihIdL+2HBv8SzLY3Cb1I4doWGGWqegVV045oe
         MZh5aLyCLD2lPb+kGeoouhiEpWLJHv5VWJ8pJdcHh1MPkRmjf74B2AsjnsO/S7vr4tuO
         16V9492Vy0I113SbekVflXtO9ZGIGq/96CPiuWUoT/HoAu+fdKBmll65GFNiJJgRaLoL
         n61P3B98QU2kUUQ0G9mVDLLXVyMNrajtnBMsf36FMCEdUsHQ8f69gTiNzcaOncLgoJ8O
         x5y8mwy2fOaTYBQrvyYuuFcBP5GSuweKYHN6Y+jRySjJ6erIZ2ateNG3+vvvP1+HL5Br
         GG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627823; x=1794232623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsHJAqJzVJK5StZwQ/IGYfPmYXMlz4wWAMnosjbM5LM=;
        b=pxK6htbKQBU8ZejhK0YkCQPI/9MstqC+zrQZeSvDAPaHYygQUzIbTkeG0Q5Azz03bh
         SS6WJaLOt/RRONiIKbzET2cnMxHQwDiBHPUZqA55trY3dVYJy6QAp37nuWmLNKq6Vnb4
         GhcKfxLl5dL9Dta2ZVySWGt4MszpvNvBYqmIDNMBgh5eN4A9kgtxEVdXYVPRImyhF7Gt
         Y8WO9F4QawYv2ECrhmeZ1yKgIAc/De7zGzhP6VNWPnWbZ4U2Ba0EFK0k21CuZz4JRnuR
         NyCWa9NW3nwO1LLZFo8vhefWxdL9IiDzc32oW30o9AM1+muzYPLCeFEPFbOW6PCXD8iZ
         r5wQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwf/QLoJIMSKaQ32z9gtDVjrkt0o4TwQResKSy+ASHaCz6+d0RSI215MNMRNlqls9rccjz0goOa71S5cR2@vger.kernel.org
X-Gm-Message-State: AFq9FYLnFTdl3Jjo6IhyX5RJ5ylalezTmjp8wQY625ZQktPCElMBqhwx
	7wqzgbyhDeB9RpLnsConEOz8eZFLZjFhhh182OKRFCi4TcV/0PDe652j6pLFcPMK4ZA=
X-Gm-Gg: AYBFou2aID9eq+7uWt8PoEu5d2YDvEGm1JLW3Ur7pZcecTW2By1AfHKqU8x4rSpzKUk
	awP+egjVcPYodvMbm0d0oOVDpa8Q2VbU4XDORY7WY5Lob/Jenv0XGtYIe2VXNHxlnI5WmxYGjAJ
	zgFE3nPUhr64YVG6YZyKoHsQ/J+pFunDyjf3HT3jb16ByHEmHoqnkKc9mnwrLH8ELi4nn57eZTY
	6+UJLgxUocXANT5HwgtW80ZWztJNmzLqRzltCxi0UJJDnOnWBupqvtVpkU7FbdSgCuN4F5+ecSo
	u5jOxC752bi5LCCUsdf1xkBCw7HEdOPUpaRUh+OVyAdE+CZTnfKRNSTNjOb8hgCKXuNQEfleDz6
	Qx+PmMnlwCRI8kHi8UesmbzfVw7lNklbSmMNbWC+lyzYai04zpUQWTzJsDLmbeXsz+2mMbUvoUt
	N8IoDh/SRH0jVTHD0ZyjJyxz4TLDL3cOrBWEVyBhLrDBZD4+KuHzY8GOyvcsYCpSUi/ZxEhhaXo
	qTumI5JMJIFTqBKw6suNthZMcdg3Ixe/nu+PKp6wsdwOo6yFYM0wFa8Oi3zKp0EDuKZFMZnCpLF
	pwBiJxTvn+kyB+epBG4=
X-Received: by 2002:a05:600d:c:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4af83ad8fa7mr100728245e9.35.1793627822770;
        Mon, 02 Nov 2026 05:57:02 -0800 (PST)
Received: from [127.0.0.1] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm126145375e9.0.2026.11.02.05.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:57:02 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Mon, 02 Nov 2026 13:56:51 +0000
Subject: [PATCH v2 5/9] media: qcom: camss: csid-680: Enable RDI SOF
 tracking
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
Message-Id: <20261102-v4l2-frame-sync-v2-5-25cbed7a772f@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1813; i=bod@kernel.org;
 h=from:subject:message-id; bh=akubu0rGSbK8Bi55Bu6Z8+I5lQw1Ol8/ItTGES6zVpo=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq6Jam7cLZPbufwEM11MFsdo3+kxSVOvLw0q7oq
 AntyC1Svt2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauiWpgAKCRAicTuzoY3I
 OoVtD/48bicxJOCV5Y1Ypx9uQx54IImLPeJ/mYHiXKG3YUCVtwomU65GFhh74QgT9XqdoxqF8AI
 v/MgidmB8d50mD2/tBojdIokLZ77XClo4e/jrG1Cae03b63H5SBW+cuK6dVX2gVxr+yxW2gbO85
 qfQaLaIbqQKalU3OZNf9a/VgrVv0ATH5Mz0u3Viguu/a0RIFw/iTRdBGCRDmqtCdJOQMUbIOAVR
 ZHlxndf1/gCB+FDqMsnsT6RG1tvKaxRnyTzZqKd6Wrz0z88Yc6DFoJ6T4NMxOtR/Y+F7NSZGEq9
 IqHBW6EZKKbm7MatZUdE4luxsEZwxPhpB426RMAULXmfJ0orpabG7WAJVZ6y6ox96aYnb6j0sqg
 INO1lBRjohhBdf/XbqAAfN+nEosoSB10J5pFU525rvMDXYEdAFag9qZZH5YjOLwpp31oO2i8vei
 S+KJKWVNHK6SwecO5hTZOUzHM9zMj42/iePAq+Mh6V/0Rbcv+EEUhm9geBCSU4f4vOZI2FtCsS7
 LvCMOAJTOCGOYNr2Ef2yUoNxO33HkP7L2QBmkDZOWCixf9zJSL8JcIii+a7AeYccTMPnWP7DkzP
 lXeBHBJwpKAGzI0DJdH5UdGCwACvyGp3JX5cE7A9n2sNokD54HVvYoBNhVHrZ0E3xhOP9M+aaYX
 EgmzzzDv4zxSPeQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Similarly to the sm8650 we can quite easily switch on V4L2_EVENT_FRAME_SYNC
for x1e/x2e which uses csid-680.

Do so now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-680.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 345a67c8fb947..452640e72f6d5 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -296,6 +296,20 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	writel(val, csid->base + CSID_RDI_CFG0(port));
 }
 
+static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi)
+{
+	u32 val;
+
+	val = readl(csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
+
+	if (enable)
+		val |= CSID_CSI2_RDIN_INFO_INPUT_SOF;
+	else
+		val &= ~CSID_CSI2_RDIN_INFO_INPUT_SOF;
+
+	writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
+}
+
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	int i;
@@ -307,6 +321,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		if (csid->phy.en_vc & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
+			__csid_configure_rdi_irq(csid, enable, i);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 	}
@@ -395,6 +410,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
 		if (val)
 			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 
+		if (val & CSID_CSI2_RDIN_INFO_INPUT_SOF)
+			csid_sof_event(csid, i);
+
 		if (val & CSID_CSI2_RDIN_RUP_DONE)
 			csid_rup_complete(csid, i);
 

-- 
2.56.0

