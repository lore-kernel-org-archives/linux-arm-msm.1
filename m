Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795700765;
	b=wTuzAWaJW9EEOD0wCsECNvLVyEejkJsySQw7gesMq4TAxrlJm6p0tJNiVL/RQQRRmbtX
	 Ck4pHj7sSI2GzZ3P01uPo4lt7y2MrBkv7WpyVasA7LaCMlLxPKzZq52SdCQriYb8UOoXN
	 4zE4uaZq7LuIz4nEWKZ4AKYO03/gdOCdEwOYuuD1vSkFCjR5g7G4sNvNED17jgLx7Lj0D
	 /sfPSbvQ+1N9l43VAMe3my5x/o2mDrHZZbiLz35eMtrnBInuRvcKYUMJpkBPzjBAhYBu0
	 SFda9S/9q/sHlaeK4IW6il+Je6wsPo2DC/7KoguvVkvxckS9Uzp+ivsEfFHhbbID8eA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700765;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=infER2AZ44/IPqMRE45Bwicyss92vpakxUMczIt+wNA=;
	b=HDQu/3hKLH/JaEJPS5NsxqrUCxe7mGSU6230tVXdvrc4WPCt46z8NYiVwg89Njpyg2r8
	 bIqEgOSTozPUfUSDNO+rIGQR0fhtjBtjeRfgvPa5X5LP8z2XQyh5wZnodZ5OZw4w5XZIj
	 15c7s2bcvj4hNHPlWjrVfwO6gnBrLGeY3tr8DpEswr9KdKWUdAOW4aVckX+lj93psOi6g
	 NOmd28t9tukJx+n8Mj+PaA9BAC2NFImra3hzvp6t9lg3AlQH0Fj41w+g1UNZ+AiN6lNjv
	 HZ9/jqs2dNEE1CdYNQH31x1oNNrwiMqKeI9mTf6X24DajKHuT0ai/BtJyZ+wg/twt3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="jp/jjEEH";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528C6606A32C;
	Thu, 26 Nov 2026 13:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jp/jjEEH
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795700765;
	b=vpF2FKEk3U9Zf1T4kYU5EoIv9ALtVZ+Vep7NIGnVD3EuCfjuB5KtBkUdjvjXwEDdwiIM
	 /5pVgOAttHyLjbi8admy9SgbOvJQ8RQXXTqiDFZ5Qwb22/CM751g+4436VolKLF3PC5TC
	 zruBdA2At91eBbAtvDAQIMj/HIJuEFnWFSYZ/QVzhXRvio0R8cpDgYha3+cR11Xx6XyIX
	 BnyEHgkrrfnTXBjQOOHB5DeYkIlnrgpVY2igkDiwpjta+gtpV5lAm0iLVjaH4+TobxePD
	 Fi7yI30QZXVLmWL9sZrIGBbZMgdh9lNfaMeMOLMzybdh1XsDhUdURrJH4IYfIslKw6w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795700765;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=infER2AZ44/IPqMRE45Bwicyss92vpakxUMczIt+wNA=;
	b=W69fKctXQuuxWEQZkXA1aj6HFa7ic+y1j/lf2jhlAF5hvWVX9590nIjN6qBROpF1XU0A
	 PRtCq9HZLqmeFfTFIClow1eiGvZ58xBVF4qRoyJP7rI7H5vP0ApY3J3JhJvMq+YkGU3zH
	 elOcXdYJ7m4pK2s7PUy4dhcjoyEjL/lY2Hxt7iiyEmqWb8zKo8lc8l79Ne8KBlqBFWhJt
	 4S4JNBpfciQBDazd59epxCJA5ZGWHXu6tk1lDxIuGTfNoQiU3Z98pHyC4FYABwkbCqH3H
	 LW8uWSquFiloR9EyoOos9IYeGuvCzzQi/vcmqQPQEpO3jYfZ7kU2whHa0xj6QM82yNQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13EF41F000C0;
	Thu, 26 Nov 2026 13:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700765;
	bh=infER2AZ44/IPqMRE45Bwicyss92vpakxUMczIt+wNA=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=jp/jjEEHWTwwmi46myrwD/r+d6Acl8/5ZYDMBwLICgaDJTl4ifyuiyihiZdSRV4LG
	 t3cHR7cmTcosdE06aHFZD1yanpF6m2Q85AmZUqIkwB/e5JRmNjmXinug6PA+7m/7pN
	 o0pqhYndXiZEmZOu1kyRXxYD01HJhks5NxUIO9m3nL1S4Sza2/9OjfaWaezFS9JrV2
	 tRjxyqEIS28vNoON/fDAQ0cpkYzVjUIzTj8ug9PCbIfp0fgPNuB32b3qsTBhxQXNTN
	 6iTFz/0dnAU0isssUdLuWURlw4Okj4KbGSBXaUl1Ahs/oHlFf4rFfqdiMZWqG3/P62
	 qFEE0YufMEfrg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 66C974D53F;
	Thu, 26 Nov 2026 13:45:57 +0000 (UTC)
From: Alexandre Rapaille via B4 Relay <devnull+arapaille.atlr-engineering.com@kernel.org>
Date: Thu, 26 Nov 2026 14:45:55 +0100
Subject: [PATCH] soc: qcom: smsm: Don't log an error for hosts without a
 mailbox
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
Message-Id: <20261126-smsm-null-mbox-v1-1-f6c6dcc2a3bf@atlr-engineering.com>
X-B4-Tracking: v=1; b=H4sIABI4CGsC/yWMQQ6CMBBFr0Jm7SS2FaJexbjolFHG0GI6YkgId
 7fF5Xv5/62gnIUVrs0Kmb+iMqUC5tBAGHx6MkpfGOzRdsbYDjVqxDSPI0aaFnSt872j8+nSMpT
 TO/NDlj14u/9ZZ3px+NRKXZBXRso+haGqvVcdbNsPovVQn44AAAA=
X-Change-ID: 20261126-smsm-null-mbox-353ad3b8495e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Rapaille <arapaille@atlr-engineering.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795700754; l=2215;
 i=arapaille@atlr-engineering.com; s=20261118; h=from:subject:message-id;
 bh=Zdp/d1BsiH+yO11n7o4Fii3aECRG4vjNTzA34WwBc40=;
 b=13BYSEIoS+XOFPsmtp77zhiYUtKmaFcpglHpR0R/3bySKvdsgiwqY/9s5Oke5937VCsfqUSE6
 MEu+bF7pM/pBD2A0oN4DnRKM1Kbmx+bifboal4M5ss2fwWOc6MvUuRR
X-Developer-Key: i=arapaille@atlr-engineering.com; a=ed25519;
 pk=xskH/sIiNU/aZCeGeBB1TK/AuiG3MXlX0m2wMlbMl08=
X-Endpoint-Received: by B4 Relay for
 arapaille@atlr-engineering.com/20261118 with auth_id=1560
X-Original-From: Alexandre Rapaille <arapaille@atlr-engineering.com>
Reply-To: arapaille@atlr-engineering.com
Content-Transfer-Encoding: 7bit

From: Alexandre Rapaille <arapaille@atlr-engineering.com>

smsm_parse_mbox() calls mbox_request_channel() for every host, so the
mailbox core logs an error for each host that has no mailbox before smsm
falls back to qcom,ipc. On msm8974 SMEM reports 5 hosts while mboxes has
4 entries, the first a null placeholder for the local host, so every
boot prints twice:

  qcom-smsm smsm: mbox_request_channel: can't parse "mboxes" property

Check the entry first and fall back quietly when it is null or missing.

Tested on a Fairphone 2: both lines are gone, hosts 1-3 still use their
mailboxes, and the modem comes back after forced restarts.

Fixes: 75287992f58a ("soc: qcom: smsm: Support using mailbox interface")
Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
---
Tested on a 6.18-based tree; smsm_parse_mbox() is identical in linux-next.
Existing DTBs keep the <0> placeholder, so this is needed even if the
binding moves to mbox-names.
---
 drivers/soc/qcom/smsm.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smsm.c b/drivers/soc/qcom/smsm.c
index f6b7266a5af0..5cc31f1abaca 100644
--- a/drivers/soc/qcom/smsm.c
+++ b/drivers/soc/qcom/smsm.c
@@ -8,6 +8,7 @@
 #include <linux/mailbox_client.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
@@ -368,7 +369,15 @@ static const struct irq_domain_ops smsm_irq_ops = {
 static int smsm_parse_mbox(struct qcom_smsm *smsm, unsigned int host_id)
 {
 	struct smsm_host *host = &smsm->hosts[host_id];
-	int ret = 0;
+	struct of_phandle_args args;
+	int ret;
+
+	/* Hosts without a mailbox have a null or no entry: fall back quietly */
+	ret = of_parse_phandle_with_args(smsm->dev->of_node, "mboxes", "#mbox-cells",
+					 host_id, &args);
+	if (ret)
+		return ret;
+	of_node_put(args.np);
 
 	host->mbox_chan = mbox_request_channel(&smsm->mbox_client, host_id);
 	if (IS_ERR(host->mbox_chan)) {

---
base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
change-id: 20261126-smsm-null-mbox-353ad3b8495e

Best regards,
--  
Alexandre Rapaille <arapaille@atlr-engineering.com>


