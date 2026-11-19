Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108139;
	b=a2kXX+HXc8Q+37o6ild/3BCuH4f9b1DtnRcWGpgAIpALLRThrNaDkUv8B+cDt731RYWr
	 hRlPkW8ROiItjf9BCnBCWQEXSulZjuxyUX8ePI7dFkNCVAZ3Y3Wfm24pE+nQNtrn0KYpA
	 ETFRzBMWesXXYTIno4E5oL3lOODDKstGKrmHsJji8eoJGDJTlZnUH+UqsSlEa2PdYgXPn
	 kstPCICJ4Y9DXzlVwgeeSACsXyU/LcLV3Z7PTy9LGCo2NOmPRo2lK/rmH1jzkL+oP18LI
	 rDR8zQhLXM9fJCL+AkM6cIDNu9udKklDcm9fsDWs4gXOF491QtfjgbUQg7Y4qMe5FiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=/BeMwuZ5xgQDXIgYlBcolpETHlDVDX0QAKZ3gBy9Xss=;
	b=rUerBRiEw4uNRLc4YoadXKpyplZR+/yftrMzAdqfWV5j7XE8r2tWGUN5P+VnnGmfsiSV
	 e22oqlyQie2DLITK7eRfG853+F5Ze0BjXzvbhrdPoqhnLH60xMr2f8KYU+d64pIwSbfGI
	 P+oitMYCm2MvQD6K5p1s7/SN3mrwnwaAjd8t/o00BDNIF86Cg0JOftlc6Ti8knD+TkZSy
	 6oq3V4uRW7v6yG89v+albijygt4ku9vGpJnG5tRY2ZZQK0ZM+b7tFh5PA4RBtj//ol2rq
	 QwR+i1Deeifq3UF5O2+/h89AXEaCeIrq2DC1BnhRsBLtZlv2TH131fKMSAWBPbSda8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gX2CAPFe;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51AD606A33F
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 17:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A51AD606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gX2CAPFe
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383ec96a7deso1420576eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108138; x=1795712938; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/BeMwuZ5xgQDXIgYlBcolpETHlDVDX0QAKZ3gBy9Xss=;
        b=gX2CAPFeYUAK79FymZ9jeijW0m0x4R/ythURkmn9dDtfcQWtnX7w7SgSn0VY7MAAea
         z8QQoMlcYCuUnTF6mstqzMIcS/mHLAJrOH5n2DXIioKc/FEe9t+fuje/LIzZs1RSAJgh
         Kb8e9+qtKH+xKYB/yCDe9X0YLkqdu4GQmnv6wD6Qx+CzxpkDmh+J6/vFmivMhFmR0UW2
         HkGzhV8zZ6QUbAHuV62DAtp0xIlO0GGWur4GN5Q9YdO9Xo0H3QYza16u33+E/tECrmw1
         rCzH3UmM/3hHnGQNR5+ALnmAPxU5jxIQpRoYkFxqiJcBNozFHX/IdnDwBu/uzsNSyxVX
         jp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108138; x=1795712938;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/BeMwuZ5xgQDXIgYlBcolpETHlDVDX0QAKZ3gBy9Xss=;
        b=XSW9HHnAlRVCZIBXWNxIxWCpyLui57M04Jhqnj75HlIrJ53O/8Fax/Ae2eKUuNblql
         wXC2Ykh58OQTw5q9Lw6qKBB6ryuhRsVlzgGsVNg3AaNgCHAPx3yCWVeS6ZDZVMR9Qn2d
         ITmlMds6n5kZE5mzoP3/IeFuMOcEtSKRXzwtufNqXmF76XEAIb1e4Bozf40F9qxf2fL1
         +fmz6G/uxJ7cTrM+whmzwoPsh/ONdClNkaloej0lDUdcMfCdWFavpDRs1TwBVP8+3FmC
         kGNIqXTXKMvgt2L/OjTfiVDPRWZWq9HxYW7Ow1JeWAnk9/GwQfdeH2h4BixgkN196PtW
         tL8A==
X-Gm-Message-State: APuU4Z+uAwF2udqalKxF1FdivM1uUvjK1a4oSItg3sa4CtQUSUjMtF1s
	ajWec8EfOstMfvq6PITFKi1FzJmULYlfiDp4lZMuZ7+Zl/9TzyG8ShLxbyFnTPI7DVIdM5MSFcO
	64HhGPaqGGw==
X-Received: from dldyr22-n2.prod.google.com ([2002:a05:701b:4516:20b0:1a7:58c6:c957])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:290:b0:1b5:25e:958d
 with SMTP id a92af1059eb24-1b5567bb581mr257768c88.5.1795108137553; Thu, 19
 Nov 2026 09:08:57 -0800 (PST)
Date: Thu, 19 Nov 2026 09:08:53 -0800
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170853.1529676-1-irogers@google.com>
Subject: [PATCH] usb: typec: qcom-pmic-typec: Avoid reading uninitialized
 state on error paths
From: Ian Rogers <irogers@google.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In qcom_pmic_typec_port_set_cc(), error paths from regmap_read() and the
default switch branch jump to 'done:', which logs 'currsrc', 'mode', and
'misc' via dev_dbg() and passes uninitialized 'currsrc' into
rp_sel_to_name(), indexing rp_sel_name[] out-of-bounds when dynamic debug
is enabled. Similarly, early error paths in qcom_pmic_typec_port_get_cc()
jump to 'done:' before 'misc', 'attached', '*cc1', and '*cc2' are
initialized.

Return early on error paths in both functions instead of jumping to the
post-success dev_dbg() trace.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not tested on Qualcomm PMIC Type-C hardware.

Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../typec/tcpm/qcom/qcom_pmic_typec_port.c    | 25 +++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index b2ad31e85b5e..a1595b8b53e7 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -372,14 +372,12 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_dev *tcpc,
 	ret = regmap_read(pmic_typec_port->regmap,
 			  pmic_typec_port->base + TYPEC_MISC_STATUS_REG, &misc);
 	if (ret)
-		goto done;
+		return ret;
 
 	attached = !!(misc & CC_ATTACHED);
 
-	if (pmic_typec_port->debouncing_cc) {
-		ret = -EBUSY;
-		goto done;
-	}
+	if (pmic_typec_port->debouncing_cc)
+		return -EBUSY;
 
 	*cc1 = TYPEC_CC_OPEN;
 	*cc2 = TYPEC_CC_OPEN;
@@ -392,7 +390,7 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_dev *tcpc,
 				  pmic_typec_port->base + TYPEC_SRC_STATUS_REG,
 				  &val);
 		if (ret)
-			goto done;
+			return ret;
 		switch (val & DETECTED_SRC_TYPE_MASK) {
 		case AUDIO_ACCESS_RA_RA:
 			val = TYPEC_CC_RA;
@@ -417,7 +415,7 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_dev *tcpc,
 				  pmic_typec_port->base + TYPEC_SNK_STATUS_REG,
 				  &val);
 		if (ret)
-			goto done;
+			return ret;
 		switch (val & DETECTED_SNK_TYPE_MASK) {
 		case SNK_RP_STD:
 			val = TYPEC_CC_RP_DEF;
@@ -472,7 +470,7 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
 			  pmic_typec_port->base + TYPEC_MISC_STATUS_REG,
 			  &misc);
 	if (ret)
-		goto done;
+		goto err_unlock;
 
 	mode = EN_SRC_ONLY;
 
@@ -496,7 +494,7 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
 	default:
 		dev_warn(dev, "unexpected set_cc %d\n", cc);
 		ret = -EINVAL;
-		goto done;
+		goto err_unlock;
 	}
 
 	if (mode == EN_SRC_ONLY) {
@@ -504,14 +502,11 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
 				   pmic_typec_port->base + TYPEC_CURRSRC_CFG_REG,
 				   currsrc);
 		if (ret)
-			goto done;
+			goto err_unlock;
 	}
 
 	pmic_typec_port->cc = cc;
 	qcom_pmic_set_cc_debounce(pmic_typec_port);
-	ret = 0;
-
-done:
 	spin_unlock_irqrestore(&pmic_typec_port->lock, flags);
 
 	dev_dbg(dev, "set_cc: currsrc=%x %s mode %s debounce %d attached %d cc=%s\n",
@@ -520,6 +515,10 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
 		pmic_typec_port->debouncing_cc, !!(misc & CC_ATTACHED),
 		misc_to_cc(misc));
 
+	return 0;
+
+err_unlock:
+	spin_unlock_irqrestore(&pmic_typec_port->lock, flags);
 	return ret;
 }
 
-- 
2.56.1.708.g77570a6a1d-goog

