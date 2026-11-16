Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.85
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836306;
	b=d8gfqZVwqx6J7w9FJKad/SEEvrOTCJx3R15TRtE3uOLKOA2FarJpf90VTPv7uaEUueoE
	 N5gzq2y8F6DrvlKSKdYpupOf6DkD3R2VAEU1lMxBuiuuyqaA9n72jESeZB5TGj+fNEPRd
	 9uzXz88++VChm53cNX6Qf1K1KnaXe+54t6inp9Psk6mnEBIPuAjMP0yPU02+2CsmddUF/
	 FpXU/BNlj9I2NxrbnIoBhervJqUHnyhtEdR85aRjAKDaeseztgK7m/GooTQDLYDIoZmTy
	 cR3AfaeFnj0nMR8n4pxLDU9Vs0GbXdcGsLRUNX5jJ1jnbBH8piPqueR4ZSO3rheQmKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836306;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=S8tRjcx6MMIQveLVh6RGsNJNhKoF6HIHHvARhEVIDfE=;
	b=dyzrb5Q4/Vkv8IsHABBjnQ/WBJMtWMQyUCE/VD081A5IxpKPhSgZ5Vu2/cNxqagzAZq5
	 45TSwJaAR1JjQo+MyjrsI39G77b4GAnpHJvbU0W5MhPpHIPEyZY4k8OdyG12PDkBUVD93
	 mqf2teuAow3pIWtmGWxqn9+yM1kyiz1DyoSITcFIOuiha3NQedTnHD1+DElKKICvFfPci
	 DvtbCNzbrhJS6EUKXgrMzApbqIx6f0eRiSjZh8UZU7M436Asn+GJWpplJMAZIFpnghH4z
	 gwRw0wJbs8RH8w+RJ6n6d+tFA5JLnCK+PFosK20a6fuKcwr+fPg5MrQBErTUuH6K1Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=II1lsO0R;
	arc=none smtp.remote-ip=95.215.58.85
Received: from mta1.migadu.com (out-85.mta1.migadu.com [95.215.58.85])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F33B606A329
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F33B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=II1lsO0R
X-Envelope-To: linux-arm-msm@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Mput/qpwwU0D5jZ+GjcdFua0PgyUNsFjcQTlREPZRkM=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794836303; v=1; x=1795441103;
 b=II1lsO0RmMh4c03AIrj3tbp2euKsUaI/4YrdthkpTfu0WGuDsVNVAc6ZNzzsir3FyPRP1Z8c
 8VfyauXMFJMI5L7WUUmQHGPOw5XKSH3eKv+MEAms3+tKDwHNvXdFYdI98Sw+mSdlnqEZnlt1U9+
 DACrx6eaZ+T6OiJoHPo6sAmM5dqQGujtOdPdUrkOZvep2VERWNVu37fqPydppwq71cAPuv1tMNA
 VJ6U3QToidt7w1s+d2s6ctGc/1E1J8MrTxy4iPgE3eAhHW8x/l5qaUotvWGbQs8WGeUeuFyobqk
 C7keTeP05/C6TtybSXB5L8+ce59W9g2uAzpkkDJnNG0wg==
X-Envelope-To: linux-arm-msm@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 426441b3ccde9ce5;
	Mon, 16 Nov 2026 13:38:23 +0000
X-Mizu-Trace-ID: 426441b3ccde9ce5
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Georgi Djakov <djakov@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] interconnect: qcom: sc8180x: Mark MM0 BCM keepalive
Date: Mon, 16 Nov 2026 10:29:18 -0300
Message-ID: <20261116133610.990456-2-val@packett.cool>
X-Mailer: git-send-email 2.56.0
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

The MM0 BCM needs to be up at all times, otherwise (especially after
enabling camss support) on some boot attempts AOSS can hang:

qcom_rpmh TCS=0 [ctrlr-sts:BUSY amc-mode:0x1010000 irq-sts:WAITING]
qcom_rpmh         CMD=3 [addr=0x50084(BCM/MM0) data=0x600001df resp-required sts=triggered+sent-to-aoss] (..)
qcom_rpmh HW IRQ 37 is NOT PENDING at GIC
qcom_rpmh Completion is not done
qcom_rpmh ERROR: Accelerator(s) at AOSS did not respond

SM8250, SM8350, SC7280, etc. all use keepalive on MM0 so this seems
like the right solution.

Signed-off-by: Val Packett <val@packett.cool>
---

Maybe camss is a red herring even (despite the only thing linked
to the BCM being SLAVE_MNOC_HF_MEM_NOC which is linked to camss
things.. well, also mdp0 and mdp1), I've had occasional boot
"freezes" (blank screen and not connected to WiFi) for much longer
on the Surface Pro X. Looking now at a `journalctl -b-1` after such a
freeze though I've discovered that RPMh debug output from above.

I don't have internal knowledge but I've seen that people have
added keepalive to BCMs to fix hangs, and this log implicated
BCM/MM0 directly while all the newer SoC interconnect drivers
did have keepalive on MM0...

Can't say I've had the time to *extensively* test this, that'll
take some time, but hopefully someone w/ HW knowledge can quickly
confirm or deny whether this is correct :)


Thanks,
~val

---
 drivers/interconnect/qcom/sc8180x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/interconnect/qcom/sc8180x.c b/drivers/interconnect/qcom/sc8180x.c
index fef77cd2bf69..9031e49e6564 100644
--- a/drivers/interconnect/qcom/sc8180x.c
+++ b/drivers/interconnect/qcom/sc8180x.c
@@ -1365,6 +1365,7 @@ static struct qcom_icc_bcm bcm_sh0 = {
 
 static struct qcom_icc_bcm bcm_mm0 = {
 	.name = "MM0",
+	.keepalive = true,
 	.num_nodes = 1,
 	.nodes = { &slv_qns_mem_noc_hf }
 };
-- 
2.56.0

