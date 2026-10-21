Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792613096;
	b=ue/EUwdBVEsisfiXThsG8TPzG8JgpyaeMOPvP4gqVqqPuId/nWLHASp/G1Ns7dWXXdAg
	 i/YJlUgD5Rwqp3BbPnycvSAtH058rYt/xXUe4H1PxmZoiLJK24m8h+D0LmiPwlZvJArBR
	 K68eyq57hpA57u/IUjImOxKWp9HTkxpmgXiqatHFS4eSHxEUf1rrPrqJdlkTCMtqynU+V
	 yUNUVWQmWz2fF7RWNbX1bN3pbrJ8/qRuEzMrN+tGvlzl4zfckw/ini2p1SLgUnRRBZj1M
	 7wdbLwjS/SAeLxoD26epGnaom8YJ4U6J6Q56tlDQUdV6pnIX+Idn+cfzWNA57KqbiSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792613096;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7CSBl7GBrRosc5SfEFBaD29IOE+r3Frq6wKHsp5DwGA=;
	b=tZu/lIdX9gUdHTaoulJubEau8fZcDfRc7oi3RLikNr26Yte+soJ27CEd2/UYgD5dtBb0
	 DtyvDH102K3e9X6QF/nX4NDHjf8hc580DG2Se6QoMihyR5Hkqzs8vJA0KWK2h+qRxaXaw
	 Xgf4RcwL1b9PdJ2pCQLB9XGDoEFTTXhtxARsLAG4tRmsgVZ+ozSKo5zUYnh1TkJzgMmxF
	 6kfFXxIsmKjnQwPocmta0hOnLWke/sNyifNUZBTowNhA6bLJGsiRMfDl8xr/zqHJzlHQJ
	 eIpBkyMwmiegrxRGiZcWX8eMq3QOskCbadkmiZ/3gzWG4ZNOPZEklInAG6LPAomP9Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=Ti6wWXhy;
	arc=none smtp.remote-ip=79.135.106.112
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BBF606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30BBF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=Ti6wWXhy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1792613091; x=1792872291;
	bh=7CSBl7GBrRosc5SfEFBaD29IOE+r3Frq6wKHsp5DwGA=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Ti6wWXhyqUya4ufLtUyzksctzGd79BIsLlXvnU+uRvs8Tu0qJCaBg20ZAQshl4Gau
	 Kclqa07zPzIWx0A6R+a0KOa9HEa/+SbQelSaN8Q+H4KOYlhL+h3Jcotu1QN4CtZbiA
	 v8QqZT40q8yVcJwMe1Dn+/YXdA21wVbwmzXYWRNjRp/6uKn2qb8wLkupkxVJwO4pN1
	 aRxw1PG+f68y2+oAyTJYZhuortrn4Y9rx0WRtR+vD8afLahSR4wwharYgH06SrF0ep
	 WjjQEmKHcX9S6W9Ml9++7mASsgIESF/9QSTQcQ7M/KxuoESvqvqEoG9HV0UqBEwtQ3
	 mrzHa1IwwaLyA==
X-Pm-Submission-Id: 4j90cd1jw7z1DDrD
From: Michael McAllister <me@michaelmcallister.org>
To: linux-bluetooth@vger.kernel.org
Cc: brgl@kernel.org,
	marcel@holtmann.org,
	luiz.dentz@gmail.com,
	lumag@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bluetooth] Bluetooth: qca: Fix the WCN3950 NVM baud rate offset
Date: Wed, 21 Oct 2026 20:51:12 +0100
Message-ID: <20261021195112.41138-1-me@michaelmcallister.org>
X-Mailer: git-send-email 2.50.1
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

WCN3950 uses the HCI transport tag layout that stores the UART baud rate
at byte 1, like WCN3991. However, QCA_WCN3950 precedes QCA_WCN3991 in
qca_btsoc_type, so qca_tlv_check_data() writes the baud rate to byte 2
instead.

On a Motorola Moto G10 with WCN3950 and cmnv12.bin, configuring a 3 Mbps
UART therefore leaves the NVM baud rate at its default 3.2 Mbps and
overwrites the following byte. Firmware download completes, but the
subsequent HCI_RESET times out and Bluetooth initialization fails.

Include WCN3950 in the byte-1 case so the NVM baud rate matches the host
UART without altering the following transport parameter.

Fixes: d5712c511cb3 ("Bluetooth: qca: add WCN3950 support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
Tested on a Motorola Moto G10 (SM4250/WCN3950) with cmnv12.bin and a
3 Mbps UART, using the same change on a local Linux 7.2.9 kernel:

  NVM tag 17 before: 95 11 0e 00 2e 00
  NVM tag 17 after:  95 0e 22 00 2e 00

Before the change, HCI_RESET after the NVM download times out (-110).
After the change, controller setup, discovery and controller power
cycling succeed. Other QCA controller variants were not hardware-tested.

Built drivers/bluetooth/btqca.o for arm64 with W=1 against the base below.
The current maintainer-tree build has not been booted on the phone.

AI assistance: Codex helped analyze the saved UART traces and kernel
source, prepare this change and commit message, and run the build and
style checks. The task was to fix the observed WCN3950 initialization
failure and prepare it for upstream submission.

 drivers/bluetooth/btqca.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 22b08ab05..002307000 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -426,7 +426,8 @@ static int qca_tlv_check_data(struct hci_dev *hdev,
 				tlv_nvm->data[0] |= 0x80;
 
 				/* UART Baud Rate */
-				if (soc_type >= QCA_WCN3991)
+				if (soc_type == QCA_WCN3950 ||
+				    soc_type >= QCA_WCN3991)
 					tlv_nvm->data[1] = nvm_baud_rate;
 				else
 					tlv_nvm->data[2] = nvm_baud_rate;

base-commit: 9b3b269829faa3a6264588cff6ef28da0ca5cee5
-- 
2.50.1 (Apple Git-155)
