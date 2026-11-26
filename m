Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690656;
	b=da/ZgF8BCuHN1Sc+Oizr04URY3OgodGKYYaQabxdwDKmFrIJbUV9iQGDn+z690C0tQ/W
	 cXnxc+npii7Y8aCEF8L1cZHCLrP3uFZTLFUk5qO0hO73NjYWxly068xysxBFjtsYNXP+M
	 WRZ8se/jFxkbzPRWLaawqf4VyxCUFrNDhrOK/V1t8SfvwPuUr7fwJMD24+fBRz917F/aa
	 TvJmmI9CorJZNIMRMCTbKYH3201foS8XAAtnK/lgYZwitJ6ma1Brb41X8Pq2Nu3pbwNEl
	 o33djPRF7Ue2aGUXhBO5Q5TGssXblB8s5Q0YtJiFFWMWaZR7h+DasTiHMyzLk2oZnoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HwfYvEOuN+jTv/rUMPMNkv6iGYyKWL7qSbUN29b5cO0=;
	b=LDNJekizKP+IV/cLtSfXKHYFezkRjHA2ZghVZX15OFtRUbC/LuZKF8yWmH8OQKcFCyS8
	 1yAkhP/ajFHxXvigzgKSgimiLCwT1l5GF6iGPAkZVenaTsMzarh4ftIYSLaqE6XPd/LAD
	 5B+qV5zqYdH2CoKxg5cUrn5cOdhe9RZt5urQej+TgPvJMvHppLYw1yfn+7IHSR97A3rnC
	 HS3Q5nHiMX8cw9+qZ1pQGEcGyqQhztGPUibfBvlqqk8afetkMEq9lM6tQUqhaM1BzQ7WD
	 YAAElZx+2is68Y1BJlOXpBN+wlZ4jOux6rReavmQTJU+26V2bXafkFJCQZw/6xolJdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AkMjPs35;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AB2606A32A
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40AB2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AkMjPs35
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-497614c95f0so3899976f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 02:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795690654; x=1796295454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HwfYvEOuN+jTv/rUMPMNkv6iGYyKWL7qSbUN29b5cO0=;
        b=AkMjPs35dEIf9ZgxdEYE8ikTLbpsCu6+nLp9CQv538B4ElAWC4PA8/a1gA1ZPw/tkW
         SOLTdfM4AiGxeAFLvEP5TJqfweEOcEbvB3/qJXiCmrAaz8sigjH95HrgPV5r8mnMkafV
         U9m0P4Jv2V0v+CElxzIzmq4tMx5edAhM8LMWTVVj6tBCq6xTRbsCTydCSYtDW1Ea8OSG
         uFYBEeA020lBk7st0zfVycqNOqMshHF+LabTdJ0+Moq/+bXLCVa1ad5WdwoykB69f2Ek
         wCQuuX0RRx6H9avPCbC1ykXO1cnwmQ5JPHJ34FrLBR+Rq4b3TKoX43P7chpgJVuHAcTF
         hmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690654; x=1796295454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HwfYvEOuN+jTv/rUMPMNkv6iGYyKWL7qSbUN29b5cO0=;
        b=p/Oa4DXURXzYCs50XIW6LcseUGBS6DLPBZXhJEbbw3oGSEOQXQsiUF0VPuDh0DktFt
         6TmBhW2VWeRvnr0NmPO5YMuE3EAJapwWhWIPeveOyBHxnev0y7QJv3FOWwP0FW52QruO
         +QuS/rCQ3Y/5knKn+a/qNvHXCP226XGURIPgruREJqOond3HM8rGKB+xtr82AXOWd1dH
         1oKnPBahQlU1gzgQC1gFzupQJFVf61bX1sCjMR7zkneJrQ2paED0hd3Vtvi3VqpL/HpJ
         0kx1aq9MSOChmFOpcP9T50jrIIXGyQ7KmnbUBIsujk6sFLDqxCXnTesChZhipZ+TonF5
         19lQ==
X-Forwarded-Encrypted: i=1; AL+hErH4STGvlVsOsuNbathXW28/ou8IzwHB2ksa6iKLWKzFklmX8n/gIK9SAzKlr+N7t5WEzsgrD8deCpLH5AOg@vger.kernel.org
X-Gm-Message-State: APuU4Z8dYN65OTIa819su3n5l3t2dPzLUkY6Q4vXYebtKMr2HXRYydSK
	0QoOm7TbsdyLF405DuAlT81cUEl03lG0Te6H3fY1Z2DU06F5VNGArY0B
X-Gm-Gg: AZFdTZfWLmjhabbnV+WXqqVFKdUfQpfdnDqHf84FPkfzY7mgB2IpiTOt1c0ZQg8AW5F
	qH4b/9JgcMOWyjGYNbUCmBEhHqhY2lgxOZx66nEq9u9GE8J8imtjg8ckgvBX0wptVstXfOu5uxf
	b99dahOm6xVB7qlp8KUaOAor5DK4NXZwr4XNzH8Di16XjgegQFM/0KhkNhrXo+A7tPN6LgSqqVe
	Q0KQ5HNmCsRN5dnEhnF+fboP2g7Y604jeRj2Re9VThROVdz6KXlTHJHt2o/78e0jXITEvCqkhLN
	1BqeAUlYecB5tnSiYalzH7cjDGb6RF1Raz3LJDN4HaAtX79QY4bOt6VIx2MbPJirbn8wGj2O+8K
	B/IcPYzLXHt6jkzx2HDnuAFWqqkMFjKz+M/RVrc5PMWqRd9fZKdjDVj3xZIv+TwED9lTe2cuQ5f
	6a7Kg/7pOXuPxra2ZBe2lKHSSdNYlieYw9iVQDVgSWvLtNoTgiT7FLBFqq3P725FnERzpBHYkzK
	frDI9Neskh+b1OKpd44mOK8MIvmDBq7jsvbzbUGnH3ohDxayEmiad0yj4HmcdTUjRXb5l3nq0SI
	matb8k9TX2yo5YCZ4PKmgDPPM3h/PDO3pAE6YAaQgTJApyBhPiZq789NJ2odNslW7RKQWWExVuZ
	MIKaAl7DB57Wp9De715u52A5hskQ6oCeyfs8I6s1vXchJz+aErDn4ObL98/7hrugUI1JY41p2V8
	+Mx4xb80NaDzHnzxa8gA==
X-Received: by 2002:a05:6000:4382:b0:4ac:a772:6485 with SMTP id ffacd0b85a97d-4aca77265d4mr39737456f8f.31.1795690654538;
        Thu, 26 Nov 2026 02:57:34 -0800 (PST)
Received: from threadripper-fedora-workstation (d-zg1-148.globalnet.hr. [213.149.36.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm40336850f8f.44.2026.11.26.02.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:57:34 -0800 (PST)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	agross@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Ziyang Huang <hzyitc@outlook.com>,
	Robert Marko <robimarko@gmail.com>
Subject: [PATCH 2/3] soc: qcom: smp2p: kick WCSS after restart when requested
Date: Thu, 26 Nov 2026 11:56:51 +0100
Message-ID: <20261126105722.188103-2-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126105722.188103-1-robimarko@gmail.com>
References: <20261126105722.188103-1-robimarko@gmail.com>
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

From: Ziyang Huang <hzyitc@outlook.com>

IPQ8074 and IPQ6018 WCSS need another outbound kick after a remoteproc
restart. On IPQ8074, ath11k starts WCSS, stops it for coldboot
calibration, and then starts it again. The first start succeeds, but
the second times out waiting for the SMP2P ready indication.

The first start gets an outbound kick from qcom_smp2p_probe(). The
SMP2P driver remains bound across the restart, so this kick is not
repeated. WCSS waits for another kick before raising its inbound
slave-kernel ready bit.

When the SSR ACK feature is negotiated, qcom_smp2p_check_ssr()
resets last_value to zero before inbound entries are processed. If
slave-kernel is also zero, qcom_smp2p_notify_in() sees no change and
skips it. Kick the peer before the unchanged-value check when an
inbound entry is zero.

Limit this behavior to WCSS links with qcom,wcss-restart-kick. Other
SMP2P links do not need a kick for a zero inbound value.

Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
Co-developed-by: Robert Marko <robimarko@gmail.com>
Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 drivers/soc/qcom/smp2p.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index cf06a49149be..bf11b7d450a4 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -128,6 +128,7 @@ struct smp2p_entry {
  * @ssr_ack_enabled: SMP2P_FEATURE_SSR_ACK feature is supported and was enabled
  * @ssr_ack: current cached state of the local ack bit
  * @negotiation_done: whether negotiating finished
+ * @wcss_restart_kick: kick WCSS when an inbound entry returns to zero
  * @local_pid:	processor id of the inbound edge
  * @remote_pid:	processor id of the outbound edge
  * @ipc_regmap:	regmap for the outbound ipc
@@ -151,6 +152,7 @@ struct qcom_smp2p {
 	bool ssr_ack_enabled;
 	bool ssr_ack;
 	bool negotiation_done;
+	bool wcss_restart_kick;
 
 	unsigned local_pid;
 	unsigned remote_pid;
@@ -341,6 +343,10 @@ static void qcom_smp2p_notify_in(struct qcom_smp2p *smp2p)
 
 		trace_smp2p_notify_in(entry, status, val);
 
+		/* Some WCSS firmware needs a kick after restarting. */
+		if (smp2p->wcss_restart_kick && val == 0)
+			qcom_smp2p_kick(smp2p);
+
 		/* No changes of this entry? */
 		if (!status)
 			continue;
@@ -681,6 +687,8 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	smp2p->dev = &pdev->dev;
+	smp2p->wcss_restart_kick =
+		of_property_read_bool(pdev->dev.of_node, "qcom,wcss-restart-kick");
 	INIT_LIST_HEAD(&smp2p->inbound);
 	INIT_LIST_HEAD(&smp2p->outbound);
 
-- 
2.56.1

