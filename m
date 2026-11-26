Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795661428;
	b=D39OzXatuIVnsSd+aP0brOn7DDalh/ouBSaSdQ0JdYXn0LCSo33CLi6tLB1E3datx8ks
	 tuK9iNRGgTgpp0w3cG7q1px92mKN2S9/W2i4zbP9mTeJmUyxOjrbCR7Ru54YDpESSZlBI
	 BBxpJ8+UjczBKBewUTPtCLbgzliw5agTwMhVHscPTCA+e94hqhTwHW3bnuMejRgflLfxy
	 PI06ZxWdeieW0IxuDLKcJzdVbXTYXHVbnerSdmULh2kGXcqsHEiTG5zhtvGrjTgar76M6
	 9TixLd3p2Yo2F1Ru7o8wto4pl+L5iZQLX0OduSjW8KJrLerBlRsgA811uS6UIrDet3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661428;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=drpZa+uEdwJxfzKGf24OsKowM5rsFqQ++EwQIBk9YJo=;
	b=h89IpUkYz8uuZTPfaly2qvGlPiqI1YznGlgaNW6IYdyR7n9FiszIhptsb5OCxnTt3750
	 +9ASJZpIrWSyVXiJ0TrFFC5r9DcxkfijQdx3Bnmvms/KTmC6e189bHQXTD3Nv/lHZpFpJ
	 bHK0xBHZxanVUQrsYkm3nv8eCUHuM+XhiDK2cIgPzTSFTXM8JtceAzHTHPeDESDSLonwk
	 mtv6ByhHE6Ea+32Rp0+uMqgEkm/uFxAf6EQSinRh+2llFTN62OmAHDctfOMROjk68aX1i
	 R3b4Hb1L82UOu8BeuTD8tN/5Sy389KFdZvNWKvfXIHih6copvEo6RMZ42+D3TZHXobQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="d0Sj/8Bp";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5907E606A31E;
	Thu, 26 Nov 2026 02:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d0Sj/8Bp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795661427;
	b=1FSqXk5MIry72RenxhbWpColfQg5PWJeJvotyXgiMXGfPYNbrpi4+2Fqwgc9laPmU2gy
	 rWGR6ul4nE++9CsORhR9rCc8ExTB8OD2JZcrtHrWFfu9OYIf5Q3Kwf2cVgdDo3Bdk6Bng
	 ahTpRBctSlDFcXDPwgVgUD+FNIkmWPItjUOGfsS/Z9aKWQXgd7skytWZjm461EguqC9T+
	 Ss8BblGkhSujHqFif9irP3O30FvAHAHk2KxrBNWIxYiqqIrWfDSsC/uws0YS4/1dW2gJX
	 M6KgvFCV042Pbd0Afl88pXXwVCpo9OUW2hZX1iH6etzjs8efiG/Y0p1YED+3cvqF4Ug==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795661427;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=drpZa+uEdwJxfzKGf24OsKowM5rsFqQ++EwQIBk9YJo=;
	b=Wt7ewBsCtpobIv38PeSnl5NIKNTXAQcU9aL+jbbQNkNuX2MeBbAmqUvyEpMRb/cDy8al
	 m5wvbISvqYn2oPJxQMZ6w+wGw0d1duVE0n/hOWe7JgVgDjWF/JgXcYrw8OvW4CxX4ArlR
	 t9A+OmvNsIRpVNQeGPPqF0xanTPKsf09g3cs3ln28vyJv1wS7lk7CIGqdw0//nBeeP14F
	 4fVeNKFz0MOIipH6PL2NhjVJDmyUNKv5pmAuxUzszrNq7E/7WEKp70XoltUFvS3UIZBS7
	 gAiq1SlMGwRf5Sh4qIBwhXb57ISxWmfusoRoWVYqkGmgF4pBOiSimZhIRAwi8Bwga2w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C6B801F000C4;
	Thu, 26 Nov 2026 02:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795661427;
	bh=drpZa+uEdwJxfzKGf24OsKowM5rsFqQ++EwQIBk9YJo=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=d0Sj/8BpB2MxQUbZGW0q3VEuozb+SraNWcSQ+Jy+Jz3dzB2794xVahnnrT0kHj31u
	 2kSnTgakWwfY5a61xYUUoL7ZeKy1c12brHDv6SRi++SVdncK9VkdF7cs1jI8O0QJE/
	 1u40aDN7wxg43q61Kyu4Mc2kUNZWJZ/TvBMei2ZaaftGWjdE9ln8Ud8W8NfyiFHzAa
	 TknkQqZQB4cHNum5yFYArN37qpbcMUSTXHJxfU3K6hDzXtLnxv0rummt1OtMbWkwvx
	 DHt21vqww2sMBK/sypvPHcxfYiI8Lk9DRHz5gJdgXziEc1EUKEVDoHtlqdqQhcPJYx
	 9bF/pNTiFjBcw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2D8394D1B0;
	Thu, 26 Nov 2026 02:50:24 +0000 (UTC)
From: Fabricio Akio via B4 Relay <devnull+fabricioakio.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 23:50:23 -0300
Subject: [PATCH] soc: qcom: smp2p: Reset the last values only when the
 remote restarted
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
Message-Id: <20261125-smp2p-ssr-reset-v1-1-ed442ed77950@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QqCQBBG4VeRuW7AHXKRXiW6cPW3RsiWGYtAf
 HfXuvwuzlnJYQqnS7WS4aOur7kgnCrqH918B+tQTFJLDEEa9meWzO7GBsfCsYnn1NUtUhAqVTa
 M+v0dr7e//Z0m9MuxoW3bAZY5wDRzAAAA
X-Change-ID: 20261125-smp2p-ssr-reset-6564ba08eb12
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, 
 Chris Lew <chris.lew@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fabricio Akio <fabricioakio@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795661423; l=2678;
 i=fabricioakio@gmail.com; s=20260928; h=from:subject:message-id;
 bh=Q1U2Pn/P1zafs/QofbW7Fr6+lX5ctVwV3JDZo//cqlw=;
 b=fvQpswV/HFL8fUj6KP2gcsjHea7zGyKS1Mz8UbNpHenHk50qWSa9BJc/b7Q/mIkTGo/QR93Yz
 sfdHHbhs5EgA9MGXbnRBqUwdathOTYkjwdQVBGLvoqvwdH6nJ2uD2tI
X-Developer-Key: i=fabricioakio@gmail.com; a=ed25519;
 pk=TlMUT8bPI/ZQzp2q24BIQTb2qSx/jdUTBlGEXIRCm54=
X-Endpoint-Received: by B4 Relay for fabricioakio@gmail.com/20260928 with
 auth_id=1076
X-Original-From: Fabricio Akio <fabricioakio@gmail.com>
Reply-To: fabricioakio@gmail.com
Content-Transfer-Encoding: 7bit

From: Fabricio Akio <fabricioakio@gmail.com>

Once the SSR ack feature is negotiated, qcom_smp2p_check_ssr() clears
last_value of every inbound entry on each interrupt. Every bit that is
set is then reported as a new rising edge whenever the remote signals
anything: on the SDM630 ADSP, stopping the DSP raises its ready and
handover interrupts again.

Clear the values only when a restart of the remote is detected.

Fixes: 42c4cf5d4828 ("soc: qcom: smp2p: Add support for smp2p v2")
Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
---
In v1 and v2 of the series that added the reset it ran only when a
restart was detected and the remote's version was above 1; v3 dropped
both conditions:
https://lore.kernel.org/r/20250923-smp2p-v1-2-2c045af73dac@oss.qualcomm.com
https://lore.kernel.org/r/20251103152929.2434911-3-deepak.singh@oss.qualcomm.com
https://lore.kernel.org/r/20260127-smp2pv2-v3-2-4060b859b1e2@oss.qualcomm.com

Tested on a Motorola Moto X4 (SDM630), whose board file is not in
mainline yet, on sdm660-mainline's 7.2 kernel, the same build with and
without this patch. Stopping the ADSP:

  without: smp2p_notify_in: smp2p-adsp: slave-kernel: status:0x86 val:0x86
  with:    smp2p_notify_in: smp2p-adsp: slave-kernel: status:0x80 val:0x86

Without it the ready and handover interrupts are counted again, and that
kernel, which predates bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make
handover IRQ one-shot"), logs "Handover signaled, but it already
happened". With it, every start of the ADSP after a stop or a crash
still traces "SSR detected" and raises ready.

The ADSP's smp2p item reports version 1. No version 2 remote was tested:
that such a remote's restart is still detected, so that the reset still
runs for it, is taken from the description of 42c4cf5d4828.
---
 drivers/soc/qcom/smp2p.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index cf06a49149be..d7f7345104e0 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -194,13 +194,16 @@ static bool qcom_smp2p_check_ssr(struct qcom_smp2p *smp2p)
 
 	restart_done = in->flags & BIT(SMP2P_FLAGS_RESTART_DONE_BIT);
 	restart = restart_done != smp2p->ssr_ack;
+	if (!restart)
+		return false;
+
 	list_for_each_entry(entry, &smp2p->inbound, node) {
 		if (!entry->value)
 			continue;
 		entry->last_value = 0;
 	}
 
-	return restart;
+	return true;
 }
 
 static void qcom_smp2p_do_ssr_ack(struct qcom_smp2p *smp2p)

---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261125-smp2p-ssr-reset-6564ba08eb12

Best regards,
--  
Fabricio Akio <fabricioakio@gmail.com>


