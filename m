Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795164497;
	b=hFDhbjyrI0GIPeUB2Ibs9oPSIN5DGQ4gvqP/RPKePoIFT065VZlbX6b2ZD+gbFRroDSd
	 4tI4DK1po6NGY5tU2g+HSDl48OXogu7fHKycUSHgzUG1DmhGHyDT/ERjxVRU0qcJx3ORS
	 ckb8N8a8iozoT2RjDhYfMifzNRoCxtGrfp8bm+yD+2Qt1gwo/Dz2TgqbmlBgRPx7f0aQ/
	 vjgnIpx3p/fv3fNPGEPr6wMjnojqo8/3Z2HrOxCM+vH5ewJE/6SCooexN2Cj9WTbtI53h
	 F8V+8P7YAIb96/6VW+JD6TakO4u0ezgv9UTvBRRrVCbop6n54OMe9nA6lf3LA3Msx6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=nzwN7I5atRRGIeyKWGRRj5kf7A+6/JDlOIWENYlt34E=;
	b=R+lG8j2cb1iUV6t50eAcrDjCVXtaW9R+nHowlfru+aHjSldsYQ7WSFTrN+dlX/Xld2P/
	 t3cwGIrXpi2HUwbxkjnR+oteoIgQwUOIEi+M4WtFevDbCZ88MT5kAJ/lkJzKoYOI4os/v
	 snOZSpYMzW3Azi8ZM4QcFSoCuz7NaR/U2Omn3gGLXx3mRQ72aYNpcmcpOEA05N8GDTiun
	 dTvUFG2+0M/ksTZNkCsLjmVhlD0wd0G7uvNCWlgYjZClD+yVXKDp7Z/FkZOO2jvrS7pHc
	 HXFU7bjWPVrggZnTJN2A9XS/MmxN7XcJbQhmro2Z58KTjMeBdS7mrQQ1wCWBPC3QjiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CWmS09Be;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036D5606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 036D5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CWmS09Be
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67db6d4054eso890848d50.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 00:48:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795164495; cv=none;
        d=google.com; s=arc-20260327;
        b=MEXbPhASseVATPv9MjffJR4kVXQOBM9kJGPrqYHM488LmXQn8QK2eJzgi8q3MVVkBZ
         X7VN3DLOAB+GsMZQjB60pfUmE8erHo3ZpQ3LQlwvJgLC2AmnxKjiRqBLcdSK7xMku7Pj
         77r7l9azBWTFt9nhO8166pVhGFW6TsJ3ZHieUgbv8+vME35Dn+zTcgtnDBLTKbXEiH9r
         iIGUXuF1CT6eGlX+rcPW3x5AQPWYHj//9DS1bKrp+MA7CjkLQUHD7q0x7B6a3grFoVw8
         ykMTRe72xvPFSotmf+AvhDxLXvnGgqomMXyr/aGyLoIhzS6STdByeTHBKxf40sHjX5I4
         CH1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=nzwN7I5atRRGIeyKWGRRj5kf7A+6/JDlOIWENYlt34E=;
        fh=U/HGPfwxRYKyMgbAE4kibAWrPLvxcpi66c5suZvU3H4=;
        b=pxHr/i/TR6hnE8d5ka9a3WYhOPMXddbSJIhlAwCMiYL706WCmrRB7v50TlAhPntPxE
         a7Q5MV8gBBK3UH+5w9Ye+L4C6wnhfNvS2G2jh2zJg5zgZdFigrUvjLeJ3SZU0zO9XkcM
         2cmYfTrI7AxN5gXFsPLD8BB6e/Z1g7y7n+JIefh8Sbz7P5dKncmHWIRGRdeHNE2DjFNn
         u5I5zz4lRKWfwfPuCQiNxepth66gqDEDmTAjUMf9v1bOBS3Nj942VwLqdAZfoQ29NfQ6
         BtHXTBPS0fYDSHMHrK+5ZRTqMMYZeMAWahH8bIEisEPp5A2gX05gypVTVejzNa+pt6ki
         iZSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164495; x=1795769295; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nzwN7I5atRRGIeyKWGRRj5kf7A+6/JDlOIWENYlt34E=;
        b=CWmS09BeEMgCYXfV6FSNZi088ryEUO7i+CoKc8quODE6jVhEin1YTPQWY/vZ9AJGVJ
         3BTcL2ThPTZCn2lcFathF7hp6wCRTGC6CKMmdrJRcPc9ssc8q/ejs+ol25rJ73lMAopC
         kWKDB1ex6ZxH7XeCTFIf0MwyHFov97s5WIUjC4vLofTYTf6lOKdAxv0vfi4K1XSARlQq
         s03ccCpfqvlQq2E8+R+vOBwYYNinlkBvCw1lxx1P8mAxhBPSjEn2drLpjR2dpEnOSLwT
         cOZNLRWLeh6QR8h/PosdNZfH1SWeIHSFpg5vynx46ZG/pCXZFxbvZiPdHpHnaTs0UiWM
         FbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164495; x=1795769295;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nzwN7I5atRRGIeyKWGRRj5kf7A+6/JDlOIWENYlt34E=;
        b=OBVnGFOHDRf/bISP8aIt0lvGKYSixlhElIFBYEB/IlYo3Q64zjCqSVXeyJq9267LSk
         3O1bc/fECPjKexTwNN8okpipMZxjTjtBw+8kt+doVd64skuNa4PKjWEKOWNSisWsIAZL
         fHHW1aGTL7Xdg1onH3bJkNZi31KRTgQB19FiL5TzvXoCG74raC29gbpVLl4n0ZmEzacG
         VpsGHa/Q/tx43zLEMNzmReUChtJwyliuWPhTNNpCX9Av3sRi9g6HnqfUBlBBgiHlU6I6
         QuNkq9X+nq0fVEetY5qn5XMMZwzyccNmrpLt4XUQUafwu/0X9dYeIWvVmz5bz+iULe1Y
         Y+Hw==
X-Forwarded-Encrypted: i=1; AL+hErHWGaedqWXTcXqf/4wwLZF4ezkliQBJ+edS3E7XPMn8VHHeM6SfI87N9eXLXHxf5Inc8geG+Fx7gaMWu2uQ@vger.kernel.org
X-Gm-Message-State: APuU4Z9JWzM9Wus0I7QZ01kRUTBcFguCbxmFA44jthGEdonlGL3polCa
	orIL7HIfY3bt9NK+fWTn/PMoZt6yuStRsK7zMBfUrYW+YTKG2zFgAGocVWHBX7h5M+E1xo0+pyI
	junmmzpyy/LhzXXvFmzSWp/EW3mG2+Ns=
X-Gm-Gg: AZFdTZdlVmHNeL3pBT+pFJIMNJ6EXFXrYQr6J0Ws5Vm4mrxRVIEphWyCk7hQrvmcbUe
	I5vLpcHNsAyQtFNiUyHtdSvi/Zru9oNhjy4NLanQJO8oCenc0BtICFclst1VhoCyYY8gxJVEq57
	pAgiUMEhXUjZRDyyYq6Bxva4IvFsjBWRI3+ehJS16FYyq2eBIJ8hy7ST/w0S79CLvnp+7HPjOSC
	RIsIpX5px9CeQQih2LTBcRs/onuiNViz8kZ0krnORJMSn0KQ8ahGR/pQ7UOhJ8c2c9lkTSvFsoJ
	XqjH3KEcYM5qgcNT/qf/a8XyBSkvopAnWceNG0Y6nnYvq8hfRpt6Smq7UiUmUtXBMVbwOpRfRTz
	nxnmbAi9ZBGrw5MQHKo9U3IeP/LGaIpiSGAKz
X-Received: by 2002:a05:690e:134a:b0:67d:c588:e563 with SMTP id
 956f58d0204a3-67df43ce393mr1241950d50.23.1795164495031; Fri, 20 Nov 2026
 00:48:15 -0800 (PST)
Received: from 16659893159 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 20 Nov 2026 00:48:14 -0800
From: Steve Meek <stevemeek82@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 20 Nov 2026 00:48:14 -0800
X-Gm-Features: Aa3M54o4Xn00jWrzGntZB2_JEfjGjvq32pmj2DjG_uE_x2Fy5EbZhNSqDP66XzE
Message-ID: <CAPzME4aUpO4foxtL7PpaHk=7dyz-qo1vxrbw=o=qEENEVj=Zqg@mail.gmail.com>
Subject: [PATCH RESEND] bus: mhi: host: pci_generic: Disable doorbell burst
 mode for Quectel RM500Q-AE
To: Manivannan Sadhasivam <mani@kernel.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

With burst mode enabled on the IP_HW0_MBIM hardware channels, the
RM500Q-AE downlink stops under sustained multi-stream load. The MHI
state stays M0 and uplink keeps working, but the downlink event ring
stops interrupting, and after a while the MBIM control channel times
out as well. Only a reboot recovers it.

At the stall, the last doorbell the host rang on channel 101 covered a
single buffer. The host then refilled the ring without ringing again,
as db_mode had been cleared, and the device never signalled doorbell
mode again, so it never saw the new buffers. Writing the channel 101
doorbell by hand with the current ring write pointer restores the
downlink immediately.

It is load dependent: it reproduces within a 25 second 16-stream TCP
download when the wwan0 receive work runs on the same CPU as the
modem's MSI, and was not seen with that work moved to another CPU.
PCIe runtime PM is not involved, as it reproduces with PCIe port PM
disabled.

Give the RM500Q-AE its own channel table with burst mode disabled on
the two hardware channels, so the host rings the doorbell on every
transfer. Other modems sharing the em1xx table are left unchanged.

Tested on a Xunison Exigo Hub D50 5G (IPQ5018, RM500Q-AE firmware
RM500QAEAAR13A03M4G, 6.18 with this driver): with the receive work on
the modem's CPU at up to 100% load, about 200 seconds of multi-stream
downloads at up to 135 Mbps, no stall and no MHI errors, where the
unpatched driver stalled within the first 25 second run.

Fixes: f6985f512f82 ("bus: mhi: host: pci_generic: Add Quectel
RM500Q-AE support")
Assisted-by: LLM
Signed-off-by: Steve Meek <stevemeek82@gmail.com>
---
Hi Mani,

Resending as I haven't heard anything since 13 Oct. No changes, and it
still applies cleanly to mainline.

A follow-up to the RM500Q-AE support you applied on 11 Oct. Under heavy
multi-stream download the modem's downlink stalls with burst mode on,
and a manual doorbell write on channel 101 brings it straight back, so
this turns burst mode off for the RM500Q-AE's two hardware channels
only.

The stall looks like a lost doorbell-mode handshake rather than
anything board-specific, so it may affect other modems on the shared
em1xx table under the same load. I've only got the RM500Q-AE to test
on, so I've kept the change to that device. If you'd rather it were
fixed in the core, I'm happy to send the traces from the stall.
---
 drivers/bus/mhi/host/pci_generic.c | 49 +++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -470,10 +470,57 @@ static const struct mhi_pci_dev_info mhi
 	.sideband_wake = true,
 };

+/*
+ * The RM500Q-AE stalls its downlink when the host refills the hardware
+ * channel in burst mode: the last doorbell covers one buffer, the host
+ * then queues the rest without ringing, and the device never signals
+ * doorbell mode again. Ring the doorbell on every transfer instead.
+ */
+#define MHI_CHANNEL_CONFIG_HW_NOBRST(ch_num, ch_name, el_count, ev_ring, d) \
+	{						\
+		.num = ch_num,				\
+		.name = ch_name,			\
+		.num_elements = el_count,		\
+		.event_ring = ev_ring,			\
+		.dir = d,				\
+		.ee_mask = BIT(MHI_EE_AMSS),		\
+		.pollcfg = 0,				\
+		.doorbell = MHI_DB_BRST_DISABLE,	\
+		.lpm_notify = false,			\
+		.offload_channel = false,		\
+		.doorbell_mode_switch = false,		\
+	}
+
+static const struct mhi_channel_config mhi_quectel_rm500q_channels[] = {
+	MHI_CHANNEL_CONFIG_UL(0, "NMEA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(1, "NMEA", 32, 0),
+	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
+	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_HW_NOBRST(100, "IP_HW0_MBIM", 128, 2, DMA_TO_DEVICE),
+	MHI_CHANNEL_CONFIG_HW_NOBRST(101, "IP_HW0_MBIM", 128, 3, DMA_FROM_DEVICE),
+};
+
+static const struct mhi_controller_config modem_quectel_rm500q_config = {
+	.max_channels = 128,
+	.timeout_ms = 20000,
+	.num_channels = ARRAY_SIZE(mhi_quectel_rm500q_channels),
+	.ch_cfg = mhi_quectel_rm500q_channels,
+	.num_events = ARRAY_SIZE(mhi_quectel_em1xx_events),
+	.event_cfg = mhi_quectel_em1xx_events,
+};
+
 static const struct mhi_pci_dev_info mhi_quectel_rm500q_info = {
 	.name = "quectel-rm500q",
 	.edl = "qcom/sdx55m/edl.mbn",
-	.config = &modem_quectel_em1xx_config,
+	.config = &modem_quectel_rm500q_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
 	.mru_default = 32768,
