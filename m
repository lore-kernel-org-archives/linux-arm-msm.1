Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013324;
	b=l1DvFn5DO7Oh8N6FewwUtX69lFBGWxzs6mQCGHKpY3XhsnH9o9pQJHMqklTwXK8pCc2+
	 cG1oZmjgU+bFSCQs5k/yz7T505QZKEiKUTv4fBjJ4O8FxdUm8PIbgAGCSrZsHK+og0KYQ
	 Yp2mNW1R90NgdDu6HXp5ezftX0aPnbscXMR0Ouwoyxlw4jGj0zSffCAM0NE3aeBO4DfFO
	 23OsOFb3ieB8ubQaseurrF8nHy11Gyq5/7xj0c48lIZoA2lFmSsHGbiCVfuEE+IsPViZW
	 nFCoET/I//SdMsMZdAZO14x/aK0CyqVbZN2xqBSRyfLJWIIHH/hRgyixwP1fQB4UGqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=igziLQ/HM70M+hvHbUEphORXXG147FBpN8LuUx0t3j8=;
	b=psHOxyUB6rVf8Uk3hN2QvphpDDyDuaCy9d9m1n9uSCRH7EItzGQSLzCiTi2/q5MFe/DB
	 1PJQTTGBGaafY8G8eGmzTrrYPpSLQZdFONplqdjVnO4p2iVEDGCQqv9Jjw3dwsLSM94oz
	 vdtKF7IbPD47xQYloPV5fpiiNeROj3ujoyo3XDsknUxpA7q5u1BfVhEeafbDqJP7Z8bza
	 IhXw8WS0r7H5pYGEny3L1rm2EsY1hSSbezfzVzA5s0NlINuQzFwcpyI4bRC/i1hfZnNvT
	 Vs36QwpgqTRkRR/lMlY1AZ57Uh978NjupELNUByvxdmkJoMpfbuSn++v5eZXyZZy0tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aPDXlVaC;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F16606EEA5
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 01:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61F16606EEA5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aPDXlVaC
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so11543755e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 17:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794013323; x=1794618123; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=igziLQ/HM70M+hvHbUEphORXXG147FBpN8LuUx0t3j8=;
        b=aPDXlVaCNEUc6uxCvkeKZhkrOqvXji8JiVK+MTcii4xA1lsViUhXJKiwz9idVdzii4
         FmFsDXjuyQv5qq6ZPOPnWwIVNxhVug8THi7w7nEyKT36sBD2PLIC/UMcKl3bA9jQU7MU
         FuReQhsSKuiYKwwUfNWphfvHmDr6gzf+7O/Wre9GQfNntFT89N9APq/hMXCUKfJtc+bd
         2fb2MAK9K7sBbVmsucVf2hRI0kLapJ5de1A0VKrnLwbljDJRb/81N7yaptVUyF++F8Wn
         9HfiTot6Y7RfoqYUvE0Ef8Hlj7pohNn8CpMWBxzhGSvLxYUBdiKF9c/M70ha671+x7CL
         mxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013323; x=1794618123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=igziLQ/HM70M+hvHbUEphORXXG147FBpN8LuUx0t3j8=;
        b=H//Yi3Lv96CZXzbCr10hAcKby74Gfx2M51uGEHaCMA5XlHJKRJoAvgN2sZVO68t5rS
         f41bT2Ne4ko9domFUJxOGSnzp2evBMUTsvsZ9HMJ4DTZNvMvLIUWK6KoQriQGrIFv06u
         25jH+ZesyQtOXF86tM/EqiC5kkOTRCNDlfd5X3hTV64UvvGUG1QEVXgRxd8GV3L66NrU
         E5yU/p9ehnQ61R+qKyiSpM2ed5qRS9L6bXrGIKJT93+TNghEhmC7TSW+qmwBSD01ZztP
         N9ULiLtlQewQ8sMZkdoUjHOkBx55fEf9abKK9oo3At++97ELS0NiIxMuKXmQZvfkcFsK
         wS8w==
X-Forwarded-Encrypted: i=1; AKwUvBw3KrDTp6t2KH/bgKa6C9S5dQuTg16ki4HLzOlqca9EhWT7CArIvuwPFKs7Mx/72xOQCR3jCpG3TVp/uP7a@vger.kernel.org
X-Gm-Message-State: APuU4Z+MwjDHHK2MiyNqBSfeaN/qpaVGrJYE0GnVOOlYgvpSilfjOJme
	fqMyCtxrXhlEKmeOEgPU75X4OgDCOznNz3ALYG5Sr8BvMONQV8agsqEA4/LDr35BMRU=
X-Gm-Gg: AYBFou2D2FvBk/pfAYwju8kMNRvOw+wJ5a3VNg8r5iw18qZf/J9jaMH5FWSexKR3K5M
	Ls9N8Q8mv/8kVSXKrfyI+clrIFlst2heO4n0MFr51Ko3TK80Pih6rMj4kYt2NfqftqHQgMzIDBz
	AWaGjGZBXD2NA0VlC6ni+BRf71l25FORisG2a9s+FLJnX9idWyStyapINB+9NjwcRoVug8jNb4J
	5aq39nZ16+bgyyEtbmPnyQQj7Gxk30fP0EbSezAvDuVtTVeJ1WGzv6VBWE5lttD47pEcwXMFMpt
	PVjHbt7IGS1Kgx81gr0epMo3JLnls2d5fxJQjYLSVldt9PEF6MeiGbFVdeSfWJgZIcHGUOL/C4M
	uQMXW3ayKmOH5On7WTumDp1EVZn2AZsi9DkKmkuwn6LgHDY8b7nACKlxq0m38rCDcHzx8Wez/FH
	l+DJo7DD2b+ySiOY/fDDqWkPq+ffAfiPXySatSExDoG4RNvHg08EhJiFdqMNpfEjvvSqiGXzo3B
	J71wX7Gial8Cfu1t8BvqnkCemKvy99jLXwpGAgOQ4TtJ3aKisbxZgFpru3kEcHKk8S4Yem5NqIv
	0k0C/qiGermnqHX1J0hFaw==
X-Received: by 2002:a05:600c:3f06:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4b6dc6ded37mr61083345e9.1.1794013322848;
        Fri, 06 Nov 2026 17:02:02 -0800 (PST)
Received: from [127.0.0.1] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm24526375e9.15.2026.11.06.17.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:02:02 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sat, 07 Nov 2026 01:01:50 +0000
Subject: [PATCH v3 07/11] media: qcom: camss: csid-340: Enable RDI SOF
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
Message-Id: <20261107-v4l2-frame-sync-v3-7-e5bf7073a35d@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3599; i=bod@kernel.org;
 h=from:subject:message-id; bh=MncIzD59S3oLf/Z9yXfphHr3qsEuFxgg2/+h3fLe7Lc=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7nh+jGIB1G6UR5OM7KPgemRPLu8vO8aWpo4g3
 cj9T47I5yaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau54fgAKCRAicTuzoY3I
 OuRBD/9p4lnbbTAgWUSKToTJeWc4OdQuyWp9sIy9XKtiS4Hmq/Z2hkrkqksCGOYqxdml9OF6qfw
 VUIIS1gyv2+nJxGDaK7NFz5h9jabvZ4Vyn3MstZ6dNM0DJB6WowU8nif9M96nGgyk40vFhP5qVq
 Wzl4H6JvXZkl793BDy8HLCeZNSkUbvoPzPsSO1oCv452upV/rhO1PzdVCSwSz4kAE26OsAkxndr
 mpu3T8uyzuycFKMJPaFNQwymUV0gnswWHxpIHyxnkX7q+HYZ2cfud8kUfj+vaqO6k9aCTN+h1SZ
 fFDRCOs9O6AEVmzTznKDtrjXdOH585wlwlFNXiTAyWyIbydP0T4Z5jvxlkhEvfg2xA2KlS/agMg
 slJSfqxTzhe43U2uFGdckij86kNy9hAo4bhqJI4kQFhzZeR4em7SspIKwQUMuc7GTWy9y9d5f2o
 Vp1DWXo6F37nq5l8RhlJb/DX7SADXbqT/TxMqc7vSyqvKGzlDoJ285uTSSlhrC+n2jRbIdBeELK
 Romwkx08btHGeR/CZQa6U86IeqFzchin+bMn+sCJ3LN1hrzt1vp2wX4SMeBBLWIJx1YXY9+rOKS
 GYXyPrqqgWaWmoXl3+KL8jp4wI5epPDI85GCIb7gw0MwkdoLeTzIEn0+6Emz2jkG8XAhHHGU2Jz
 ARr7A6IrnPs59KQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Loic Poulain <loic.poulain@oss.qualcomm.com>

Add silicon specific changes to get SOF triggering V4L2_EVENT_FRAME_SYNC on
the '340' CSID. Covers QCM2290.

Unlike gen2 the 340 CSID has a per-interface IRQ block at
0x030 + 0x10 * iface, so the SOF mask and status have to be handled per
interface rather than globally. Run the existing csid_port_iface_map[]
through it so that PIX and RDI0-2 are all covered.

The spurious interrupt warning needs to account for the new per-interface
status too, otherwise every SOF would be reported as spurious.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-csid-340.c | 39 +++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index eca3f07b8a8a2..42ff629ce410d 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -22,6 +22,12 @@
 #define		CSID_RST_PHY_CLK			BIT(3)
 #define		CSID_RST_CSID_CLK			BIT(4)
 
+/* Per-interface IRQ block, indexed by enum csid_iface */
+#define CSID_IFACE_IRQ_STATUS(iface)				(0x030 + 0x10 * (iface))
+#define CSID_IFACE_IRQ_MASK(iface)				(0x034 + 0x10 * (iface))
+#define		CSID_IFACE_IRQ_INFO_INPUT_SOF		BIT(12)
+#define CSID_IFACE_IRQ_CLEAR(iface)				(0x038 + 0x10 * (iface))
+
 #define CSID_IRQ_STATUS						(0x070)
 #define CSID_IRQ_MASK						(0x074)
 #define		CSID_IRQ_MASK_RST_DONE			BIT(0)
@@ -83,6 +89,17 @@ static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
 }
 
+static void __csid_configure_iface_irq(struct csid_device *csid, u8 enable,
+				       enum csid_iface iface)
+{
+	u32 val = 0;
+
+	if (enable)
+		val = CSID_IFACE_IRQ_INFO_INPUT_SOF;
+
+	writel_relaxed(val, csid->base + CSID_IFACE_IRQ_MASK(iface));
+}
+
 static void __csid_configure_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
 {
 	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
@@ -125,6 +142,7 @@ static void __csid_configure_stream(struct csid_device *csid, u8 enable, u8 port
 		format->decode_format, port, vc);
 
 	writel_relaxed(val, csid->base + CSID_CFG0(iface));
+	__csid_configure_iface_irq(csid, enable, iface);
 	writel_relaxed(enable, csid->base + CSID_CTRL(iface));
 }
 
@@ -169,15 +187,34 @@ static int csid_reset(struct csid_device *csid)
 static irqreturn_t csid_isr(int irq, void *dev)
 {
 	struct csid_device *csid = dev;
+	u32 iface_val = 0;
 	u32 val;
+	int i;
 
 	val = readl_relaxed(csid->base + CSID_IRQ_STATUS);
 	writel_relaxed(val, csid->base + CSID_IRQ_CLEAR);
+
+	/* Read and clear the IRQ status of each enabled interface */
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
+		enum csid_iface iface = csid_port_iface_map[i];
+		u32 status;
+
+		if (!(csid->phy.en_vc & BIT(i)))
+			continue;
+
+		status = readl_relaxed(csid->base + CSID_IFACE_IRQ_STATUS(iface));
+		writel_relaxed(status, csid->base + CSID_IFACE_IRQ_CLEAR(iface));
+		iface_val |= status;
+
+		if (status & CSID_IFACE_IRQ_INFO_INPUT_SOF)
+			csid_sof_event(csid, i);
+	}
+
 	writel_relaxed(CSID_IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
 
 	if (val & CSID_IRQ_MASK_RST_DONE)
 		complete(&csid->reset_complete);
-	else
+	else if (!iface_val)
 		dev_warn_ratelimited(csid->camss->dev, "Spurious CSID interrupt\n");
 
 	return IRQ_HANDLED;

-- 
2.56.0

