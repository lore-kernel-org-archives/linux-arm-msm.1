Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168759;
	b=VcghT5Foof/B0rh6rEuOhzSw508hQE50eKBf01RJZxpfzjNgnB+wAnkWMlQLEcwC7cxH
	 8poa62eZrwUEhP70oT/GPGr3/dNGL9dLTwWi9O5S/x5FMhaA+PJZvyNjUYf9H0tUEEXzB
	 QkB792BM3Q7vEn1YlcW3OQP1O5TI6Iw90FnU9Qv8ftZQkETx3n3GVlIsnlyMDUsljAzUr
	 y4vAtCf99tE1BnSYF2PnXAWOsXUVKYWMDT02Sfnm1UdaEs2l2uqnWQ89nKtDPmig1me9q
	 0kRKxgjQVuKmWgplxIlADQGnHQYy90HxOjpfrWKAlwHSfMNlgPIqjQkYLZITooZwFKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=YQsJq/FSSWJsWIKtYTnvrioHFCDV5M+DcY30TZhnpn8=;
	b=NYFeFsF3ijFBFKjw9VZPoPgnbyq9e1EBvNXjDqE8fhsWCida9s51L4g4JaD/iaxgwCQB
	 lk/pG6buMkefaCgpzm2Ad4DT/+nwgDXjp2KEE9ZjbYnGfZEmQZ8VQwt8ffoD73i48BUoc
	 5pLhRB3EXMJIHN43GlemC6D00VibgGo+X2ttbV0VuAosTWjJN1MDsk/6hDUuoecIAjCno
	 ikJhlweaYOmZ1ns2PKoecmVFSsFfO5gJJXp42JCL7ekW+0hj65G/Awmo2Zfg9v7UNEyWb
	 8ANcIOdfSVnjbPwR0yx62PJF8ia3ZRpGs1sg1COmArlBj98vVxJQPo+io3vRcUMLyrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=P0qAZivq;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666CF606A33B
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 666CF606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=P0qAZivq
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so7630235e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 01:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795168758; x=1795773558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQsJq/FSSWJsWIKtYTnvrioHFCDV5M+DcY30TZhnpn8=;
        b=P0qAZivqb3WPPvy8tkzNnrzvUKJJ5bDSrPjMqJn8iM8HeAKOtniZJT4qgeDp5RXgEg
         1UCOkzaXGT995cfyXt6LHOn3T07sjM2vAzlrVYCDWPkP/4eT9KiTZyMr9tMHVaeEWwK1
         tC4yqbrBbN/Qh2LYkR9NgZjps32gBLIqYkASnKkqjAJ2VDss5V8Dt4iBPCeK0fYOrMrl
         EztivwmDFH/rLTcz26jbQ1l4s+HjnFWB+mSMntGmO8QGCw+Z4AS5Aa2gRPhH7adqSgPL
         MCCR8sAQgBHFsFifzf7mTgMHwV176FsE7cCB4fHNOYXCekgHQVv1oDy8VVXIo36GGfSf
         Y5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168758; x=1795773558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQsJq/FSSWJsWIKtYTnvrioHFCDV5M+DcY30TZhnpn8=;
        b=ZAVsATnUNZjoQf6oT0G/1cOlO5ZgFi+Ka+BDeSI9bBkxBasqSO/f4d7bf5IlYmGepQ
         LHBta8+pH2VaAGZrNWUMAoS+h7MHtsILkaCdTCzTECFArF+hdSAx6b47WyHVNTw9FyW4
         IiqNLVkVQ+lfvc6FXa0o5ODcq5aZCAwr2la14V0sFrDDbQYIkCNb47F3bYEe9x1TQF9B
         AsN7coH+SuLaaLozYv6WapV71RgaiPK1pIYDheBrIZ8Sa78oBKqj3pCfqoNe2uZ+9+tf
         4rszDXSFgFzwhqshJYiev/Eoxnuii+9zbn63pD2eYkoqrjRCNW7dNlhuLImR5OJJUu+p
         PYVQ==
X-Gm-Message-State: APuU4Z9OPEpkPkkM7wjoBEASzo8jj0ZM+Zcdpkod1198xMrLz5e6eags
	sgiJmCP5CRPka8tdIGtsy2BDy6tYqT+UoOgYM0lCmgRc76hnM2FcxSnmc+t+QTTl7H8=
X-Gm-Gg: AYBFou3ZO2ptlvIGAllgGWFvh3HLoF8P3Bld8GSxnvW2VCSgq7t3dxjyV9DK/nAs6cG
	oKsONUSEH0g12sj9TlfEhrx0IE6NQSSy96iospnjHdSB655hgT+wq4q9UPUzsIyCIbUDjrCV1sZ
	HTpqvKl/HKuVXAPticm6MFuOvr249oONDtqfouSUmQCHvYk2q4zRu7VwsPnHXmVSmscU3frObtB
	g7Z2wxjvHWNAWWS7+QB8L3N5Gjj0OZ+lD653q5AvFB+ro442KZM1XTpZhQDCjt+kcv+TPYe2zxJ
	aaKINePsC82OvXPpuVzREWHZBj/L/pbQt57K6IhilL5ZLS8jpVg9nLR8BU8uJHIv2GDSPKQP3vs
	u1mEog6x4ffcFml5CvuNvMwpIFEgC6qG/rZg+jIcvadKk4I36L6frOKvKYkm3qevlu5fzQHn2Tq
	XjXabV4hKzIAVmn+DOs6irwegNseaEDAbK7QwWdkyHvNWtx8L2HEOuhOH251pdSxD0e4XYpOra/
	e2KhImQeNZI9kJ2psZ3N24NynV7/HZ5lEcr9dVdj1op8+xbit9azoanERfr2yBLKkCnh/Ir/vai
	dMaAl13xalrW7Tkc7Lc4WdS17/UM+5S1KJRnK24YZGNIYmSzMtbd
X-Received: by 2002:a05:600c:848a:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb887fb678mr52171355e9.4.1795168757359;
        Fri, 20 Nov 2026 01:59:17 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm70741515e9.5.2026.11.20.01.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:59:17 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Nov 2026 10:59:13 +0100
Subject: [PATCH 1/2] usb: typec: qcom-pmic-typec: pdphy: disable the PD PHY
 on stop
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
Message-Id: <20261120-topic-tcpm-qcom-fixes-v1-1-9a152f906fba@linaro.org>
References: <20261120-topic-tcpm-qcom-fixes-v1-0-9a152f906fba@linaro.org>
In-Reply-To: <20261120-topic-tcpm-qcom-fixes-v1-0-9a152f906fba@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=r4F3ViWmH1EQsOWd90pSS0X8y6pla3zxcN3gi7HiY/o=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrABnzlAPZ75cpFfKXAOz8Uw6uMsZ6N0swaaL0wsIs
 RzFOTjqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawAZ8wAKCRB33NvayMhJ0S6REA
 C4WhhEmr3xHhyIOliQPOLAwE/TeaAid0t0+8tc92gW+29PQLsihtPcWdpsF5VRJdM8sQPlsme3V7Ia
 NBYvhZTzsmfBL7Q+EP6FVhPVn+r87OJbcCnpxqwG8KF9PGYyIcZ+sTvrAcYbN9l2/mxSPx5T1hwl0f
 Ox3IUO9+r9bp7okUFMEctjlYEJoVvT+1SlB2GvlqaLRPJJ88Mm8r3FID5YVMx+lKXg1S/3IwCN7+Yw
 W5JL3sn06DOrGd/FHu0M4mvDU+B8HcWyZHsac826LKrfdfwlujWkQiMQFYcY50IvRq3IMFCCuM/xRc
 a1nFDrmCarGNJdLuzXO3VFKdPaT0UeacWcN3bMy2HDD/slzdPDmcUkRr6FwVCrYpyQwvbx5u5mCM3F
 YufD8ldgjmwxcw58iY6V5dM7ol839k594riQX4J0mFf4u8mLHX0PeXpycCwGVqZn+T0IRK2YORiQMq
 seejwxhlBh8VnazDvRjq9NYFdO85/md4JOePlOMEKyEC++Bm/SArRbpBcLbn3ftcs4rVnsEwVKuWu4
 SyuEYscH7YT0rCtu6orUpTWDTJCiGs2m0RKoiJc8Vm6WiPdzCeOkutrcvcveNDr4kcLx6hDNizt7qU
 S8B8mRsi6Fj4YOr5GXWTTlSx1kC01xUScEGZSJtnwIo7IJPHeQ0VFZjmWL2w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

qcom_pmic_typec_pdphy_stop() only terminates the ongoing transmission and
clears the RX frame filter, the PD PHY itself stays enabled.

Use qcom_pmic_typec_pdphy_disable() so the PD PHY is also turned off
before its supply is released, leaving it in the same state as before
qcom_pmic_typec_pdphy_start().

Assisted-by: LLM
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
index 435e07659d65..08cf65951796 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
@@ -545,7 +545,7 @@ static void qcom_pmic_typec_pdphy_stop(struct pmic_typec *tcpm)
 
 	cancel_work_sync(&pmic_typec_pdphy->reset_work);
 
-	qcom_pmic_typec_pdphy_reset_on(pmic_typec_pdphy);
+	qcom_pmic_typec_pdphy_disable(pmic_typec_pdphy);
 
 	regulator_disable(pmic_typec_pdphy->vdd_pdphy);
 }

-- 
2.34.1

