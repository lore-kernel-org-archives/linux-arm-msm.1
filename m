Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793129779;
	b=QinlOU2BrYgWQhx5IEARsp/BIaJV135ov5rSWP0H/RBiGEjGvwUCxKuNL7I2O5bvTtvT
	 fe5TfFInwaa75dbg284ak7Z8mcjJmzAzkBAc+vfyq/Ev+ikbulVpfe6JiMay4IU8ljsAy
	 z5OcdtWZvFRpnJJE80jLR34zzc20XTiVQ2yYBWqJ+VNm63q5B32rPAmXLBRgWXYQf9MPC
	 xxM5XCaI9yMOLNTjEr83ZhwSA81VwKHdhCZMW2dZMULdMdau3V5bgXUiZIX77cPmh1YPS
	 TU0GW8QX8zmxtQLwp3TjcxMVlf6YdOAc3rb2kRuuJMYaQRMhS37VNvimaSAK0EIaFMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793129779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VeGAm90AgmXouwn4W32/Qv5tF0RL+dNfBc4p7xQPPeA=;
	b=KXLz/jgBxAhd3lKkLm8nlkQm+HL6yht6tUgiYU3KGGeNhXupUV8o1TXeu+rw0QUKiqeZ
	 tfTEnC/GAHn2yZUzRqA65IgE0RZovv5N7X/NbmRIpcOxWTc5KEnzmL9KzVAOyxTXWsJUH
	 iMQK0iTHWdj3tkhI8lTXTKEcLPLKX4S5McfIQ9LLNtuelNJfrxK2nTZl7wVb5bfv5/7wB
	 URGcQPBkfTOIat1PoSWQq5iuubi3jh1jXAAWtkFB45uUAzbm29E5t7xZe0tvUQlMRH2jW
	 dFM5uIR83RwNhDWqXhX8V9KFZF9OlbdQNHsQKeEJBpaZH1onVonrpc4Ud1EZAyR8yUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xN6SR6ap;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5713B606A323
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 19:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5713B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xN6SR6ap
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bfc3292d90so237167e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793129777; x=1793734577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VeGAm90AgmXouwn4W32/Qv5tF0RL+dNfBc4p7xQPPeA=;
        b=xN6SR6ap5IXfeCgA8OXe2bxckrC1vO7HqetaYx/ySe8B3Ppi/qI1AXBkkfczygyHHC
         WjYGcZJaW0VjYK79le4mWgblVX8hVEFuNnKy+rS4iyIqTctNgjYPby59jB8eMUiCEjnw
         qb87EpTATl9CEj1NEHtVvtHIObuv+iFfMAnov6qjNFoQZdp4xswiq/GHrsIE8121qLe1
         Vo99Hp0nSCEBLKvpMECK09JKe0q98zOhzpkjCIY2HBL1x3z4Ysm+TRrkZYhVI4THw+li
         bTKoJGAc2EVHNXf6Cd/SrMs/9ydn1UIKyVx/eFB2DyQYxchlfNVGt8FyKHCLLJL9exmT
         06wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793129777; x=1793734577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VeGAm90AgmXouwn4W32/Qv5tF0RL+dNfBc4p7xQPPeA=;
        b=RQS7Lo4yjYZVxmYfH2eOyrl31R+GOuqMj90P8MZg71l0UaqOczEldfiGfpYK0aB3/s
         OsoHoCYpObL4Ds4GLungknqBvb3nuq8JYJhYvnkdxwsiPgzkUfNDfqajt5yPcz8SEWLM
         INVmApR1+mQOQDxTQD9r4DxEOkFy0i+/suO9pqg/5uCyifyQxww2b+XlCixHNQcOpYrC
         f8N3I02FZZ6CdyJE2Q/z9znDAacC4nPN9CFWwAC6FZi1jAsKbNn3AYNayNiQK1kA5aYi
         sdVxzqEV/KP4adwzMGzot57Q1Bq0WPrDnfCJt+VQrGQLh3UiSVT4NO1IGasJTPWgSyZk
         6cJA==
X-Forwarded-Encrypted: i=1; AKwUvBzIFLeArwL7Kd8wWT3AVKAaMqhi3fsNcHxSzMQM6V5M7qHOENiF1PDZWvtDTLMZ09fASdfp3G0zue0Y+qQ9@vger.kernel.org
X-Gm-Message-State: AFq9FYK7FTju0BTVDwM5MjnXqICKZ1yZPgEuyyvHNBNrwdObWfc0obdG
	Fy6I7muuIecRie/58h4RpoBbjtKvFC3D3weFMh6LZj9rzRWL/dNm7PQP
X-Gm-Gg: AYBFou0OlPIAUBo3A3txuNs5tFT/z9gvze2cJSrei+dHo3X7Ax2fhKB85sP3vM1DZ+N
	hCHVywAFJml9Kc/SFYzZAv6fU3lPhsH6hsRpXgu+RRcPWHkO473gIJTHn+IvWxc+QmUgX9sOV/f
	oq7Ov7J88f//kbPgVmtxTJ6ELi+1uDaAC+TmvyEif5pJ+WPdNd6NCD15puawlc2an+FZVAGiv18
	OQ2Dwm3VrlasJaQR/Dmib690UbMAdtXAfUfyqjFLa7/mxQ3TN4I79HVSBEVXtdtrJfrtfNGrAIx
	f0kAwd+ydMOIiypeCbo/8CKKsZwcTA38H+5njEbUrINJ0iuZiRXTx2KKd9fUMFgvftjN25a/mFi
	/Zkjly6izEFCwCUFa4crv+rhHlx13wVN48d8QOPl6MdP6n45HTAkoZC3odQLkaD+98L9jlI7zvh
	NZsBpDwLEmRmrDEcIviODgWXAL1kb0gG0a4OD5wYJt2kt19OqcjW1UQJXxgHzX6ShUiCHIi/33z
	g03Xy4ncgZkzewwksBKHc+lI6Z3JMqS2cGnTbHVq03PShC8LmuhNE0X7NKApIMFKi/Nlg+X243k
	2hhIyeZ2MGgby/nKOhGljY1QoZOb
X-Received: by 2002:a05:6512:304f:b0:5bf:b963:70fa with SMTP id 2adb3069b0e04-5bfcada2450mr124586e87.48.1793129777315;
        Tue, 27 Oct 2026 12:36:17 -0700 (PDT)
Received: from valor-verifone.verifone.com (balticom-242-238.balticom.lv. [83.99.242.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca5a2a25sm158477e87.60.2026.10.27.12.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 12:36:16 -0700 (PDT)
From: Stanislavs Nilovs <valorcool@gmail.com>
To: brgl@kernel.org,
	marcel@holtmann.org,
	luiz.dentz@gmail.com,
	lumag@kernel.org
Cc: linux-bluetooth@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: hci_qca: Fix WCN3950 missing regulator release
Date: Tue, 27 Oct 2026 21:36:15 +0200
Message-ID: <20261027193615.1930624-1-valorcool@gmail.com>
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

hci_qca driver is missing release of power regulators when module is
powered off or serial device is removed. This issue is most noticeable
during system shutdown, since the regulator core is firing a warning
backtrace that regulator to be freed still has enable_count.

The issue was found with the help of Claude Opus 5 (Anthropic), which
was asked to review drivers/bluetooth/hci_qca.c for the appearing
regulator warning backtrace during system shutdown. The fix itself was
generated by the tool and reviewed by me by applying it, building the
code and verifying issue is not reproduced anymore.

Tested on real hardware, but not on Linux's master branch. Driver was
backported to Linux 5.15 for internal testing and this is when the issue
was noticed.

Fixes: d5712c511cb3 ("Bluetooth: qca: add WCN3950 support")
Signed-off-by: Stanislavs Nilovs <valorcool@gmail.com>
---
 drivers/bluetooth/hci_qca.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 7089e9b639b2..e22e2269efd7 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2247,6 +2247,7 @@ static void qca_power_off(struct hci_uart *hu)
 	power = qcadev->bt_power;
 
 	switch (soc_type) {
+	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
 	case QCA_WCN3991:
@@ -2271,6 +2272,7 @@ static void qca_power_off(struct hci_uart *hu)
         }
 
 	switch (soc_type) {
+	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
 	case QCA_WCN3991:
@@ -2582,6 +2584,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 	struct qca_power *power = qcadev->bt_power;
 
 	switch (qcadev->btsoc_type) {
+	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
 	case QCA_WCN3991:
-- 
2.53.0

