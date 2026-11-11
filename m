Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398012;
	b=2uxFEjtPM5wBx2p8Cwlz94XyhUbf9yjQj3dA5sMVcq0uSeYZb7IE9xB3Z6vhKiMl3DQa
	 V01kfOaVvyLbeHwwKsapu+p548630YOPUwNddoE6Hk3Plajz7LZu0m0uc8UfZ7bNBIP5T
	 Y791/VNedF27abN1iBuxmOGoir6ggg4TMVwsSGE+ugacXqfyUtbnf3wyxpxDZ+8VqGjOD
	 niJ7Q+QXsXXyctAVlUKppRcKxJ1u7lmvqQ+0welgqiC8+q4H+E6TIMKnWkDSjGToUCdqS
	 kxYuLjszJ9wfj1tqmx9cKuDjdUNT25X9fIqqO9b2i/qAF5LSEmt6hyoJN4R50HuXxGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=cFxuh1PNIKEywo18Tfv8aFf+JkQMs0pwqiuaLoQb3k8=;
	b=zltOv0FPH7+hcfPBmhjnpPHoepSqbCkVMM1QYWZ3FRIE9J/fYN1RDI8qoPFlHXRexeDb
	 d6+zr2U2TPjEO49V06Bg/pFUe8sfbXgJn2T8mCgPUBa2NLhAqRMUax2GrrqF3LC3ZfoIa
	 OjDr3ywpnsJjlBcPAcpVmo7F62SZ2fLQu6lJUZ1+h2+zM2o8wyLcHqr43Q/cwaXA8KRKl
	 k5UmH57c8L0Z0Ev4P4A2v6/kZwmwtVBYLZ4T2piFzHPHhz4gHBCutUxcHC7zGgs39/INL
	 +8ZJ/0ksvi1vOksT+1SFEfqNk0jBNjbRUf+WeePZtWo2bsHaFEdb+Ur+T4eSFkkoAsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LIsyZg6L;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C40606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 11:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73C40606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LIsyZg6L
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-49187ad6a72so2152185f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 03:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794398011; x=1795002811; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFxuh1PNIKEywo18Tfv8aFf+JkQMs0pwqiuaLoQb3k8=;
        b=LIsyZg6Lg1dAfht+IDStPGte5VWL26PTk+Yque80mU2kgOG4tp1xwazGNmM4808ZQR
         JLBWsblKxW6KThH/14zpPg9u4Fh/yoCitr6lYCdepBYUMtPBQswp38pq9Vylr5KuME2T
         eqjn651ISwEcD9tm+SC9YxJmo+UMBmG+IqcjYlqtKlilJd/gW3PM7fsEmhCJ0MPMC0of
         xDIxCgwvq7iK/4D0qKPcm6kWv/AQUikR2Mng040AitVcxOIPzeBprB0EbTOztFvNIMbg
         D/z/hK/pXM9T6opgrAPUhRdNJ1P9tZdR6X+eh7lDcb9XnWRzCHsGzEowMspc//dUm9jS
         oK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398011; x=1795002811;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cFxuh1PNIKEywo18Tfv8aFf+JkQMs0pwqiuaLoQb3k8=;
        b=dW3dfS4GuBFa9RwbX9n3SyULqOHcW2K45+OgUgdzv8DPxfPyBSr/dSy8HKEvKnDMJW
         xm+2cVnoagAkZFX7bkBnYntsy1tET7PZwYe8NigSbH8MV/Ukn1obLAmE30v1acJp6f6I
         XfYTXSbo6oneDLJj66985fN3vJGrGrzIZQR3Kwwpl9wJ/Jm1vcEoaCaHKqqO/Tiyus2+
         a4HJtjn37WD0uZKp1s7Gp4QU3o4bOZ5TlhvfGKMlF6S2LmtP7HP0nXbqRo/6QgdFs9+W
         gKpOH2BO4N4fclvBoqMBZQgH+LI2NwSn1U9vGdbEhk8ge843rxpKijhVVkGKuPkRZ4c8
         xjrg==
X-Forwarded-Encrypted: i=1; AL+hErHQmebR25ut68YhaAE1v0BtaXyb+EqFWUPOBgoLC7+hZ4bX7pjMK8E6O43dI+lmCtApope9owmP9g87teKC@vger.kernel.org
X-Gm-Message-State: APuU4Z+N9easKtnDZINaUDI1F6JNZ/hvHTF2NazKIL6hPvLZUA+7Teop
	6IMw+DNW1eoKPLuS66ss89XmN/Q16ODY6cRVx4braBNYYFgNK3nSCK51Jw7Jzs+TffqFALalbg=
	=
X-Received: from wrbs5.prod.google.com ([2002:adf:d005:0:b0:48d:f346:cfd5])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4a06:b0:492:5ef7:5d98
 with SMTP id ffacd0b85a97d-499c83c09damr3673566f8f.38.1794398010607; Wed, 11
 Nov 2026 03:53:30 -0800 (PST)
Date: Wed, 11 Nov 2026 12:53:07 +0100
In-Reply-To: <20261111115303.3749380-9-ardb+git@google.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111115303.3749380-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422; i=ardb@kernel.org;
 h=from:subject; bh=gky1cuStZY+PKkODphMTNkJfxP1zI/LkXCzNIngy2Oo=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIetLuIraBafO/3uCxL6HOTfI/Xp79PSm7ad3PTnAGGVg/
 6vvwO32jlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCR6FhGhha5aTIy8d42e3XZ
 nM/rRS3raTXYXXPq6rtEyx6pW5nqFxj+Su9f7PiSW/ZYn9mEI3NLeQ9zXdnpfm2p1qtQi5agayx NzAA=
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261111115303.3749380-12-ardb+git@google.com>
Subject: [PATCH 3/7] arm64: dts: qcom: c630: Enable DisplayPort alt mode
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The right-hand USB-C port supports DisplayPort alt mode. The EC takes care
of entering it, and ucsi_yoga_c630 already sets the orientation of the
combo PHY and passes the EC's DP hotplug events down the bridge chain. All
that is missing is the DisplayPort controller, which sdm845.dtsi already
connects to the combo PHY.

Limit it to two lanes. That is what the PHY provides alongside USB3 in its
default mode, and it matches pin assignment D, which the EC picked with
the monitor I tested. Four lanes would need the PHY to be switched to its
DP only mode, which nothing does on this platform.

Tested with a USB-C monitor: 1920x1200@60 over two lanes at HBR2, with the
monitor's USB3 hub working at the same time.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index a4a573ea7e4a..0645ab429177 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -589,6 +589,14 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp {
+	status = "okay";
+};
+
+&mdss_dp_out {
+	data-lanes = <0 1>;
+};
+
 &mdss_dsi0 {
 	status = "okay";
 	vdda-supply = <&vreg_l26a_1p2>;
-- 
2.56.0.611.g1030f0b940-goog

