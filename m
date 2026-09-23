Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6C738F25C
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 23:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790207676; cv=none; b=nklSTqhrvMr3SJ1rF8/S0DTzOKSNdZTVmhNZ2m4jz0+9OKzC7USkYIXwzt6Sothbyw/fIr55fQ6Tovv8Kur5092y50taKQxHmalRlAnIjtg+cg/sK2WrbWfdLFjic0PYmG5L+duB0m92MC4/fCPOdAHeSji+bWlSZ2YLR6my/OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790207676; c=relaxed/simple;
	bh=xSwgtNXTlPhev8I96YN0byX+CJhMkcrtEIVhpD2ZkgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sCeiHcUDMEcpVueAdW6McBTCtVT+iqJ/lkN3l3BVWBn9zb+ET9mXmaX8noP0bM61q4HSL9cYpYL16Z5QCSYTILQJtVsH6cVLDS7S7lIEv7cmDxBrCWjGDK433V9XSZKBMgV0+JnPMyWx96I0w7ZUWhxIKEUv4Vy6Q9SwFkQ1tms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZI0mWjpD; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZI0mWjpD"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530e2f50d01so14053661cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 16:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790207673; x=1790812473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+YWsyN2G9LWwioqrNVsniXHUK5Ay6GmJ3BIrxT0YNvA=;
        b=ZI0mWjpDhgCfW0rbsUA2IN9TM0hifSzOS5lp7uWf7am5eYjNY0gkFtrWIZ6ouK1/TS
         GF20vpeUf4gMgC+xVwNJg00+7RmgTQkDD522SuhHMqZCZeYZFKfe2/L1GHZ+8QtzhNVK
         F4HeF6K1XigGs90MlMWxcBvW5l15sgCOSpcmN6uKO/UYvonq9pkMgj+dh4T+IayoQeD3
         kNxG9Gc07OyS+n85ggwtNX8IH/85Navn953Ko9YtETES3EDAZG13STkpPA6hdE36aBvV
         s9ZOj6PkEi1tDUHE43tcVH7QyLAQXawPzr/H82KkLP7wPVgtEx/K+bxKtUOXPUgChUU0
         XQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790207673; x=1790812473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+YWsyN2G9LWwioqrNVsniXHUK5Ay6GmJ3BIrxT0YNvA=;
        b=Sbl8PXQ8PpuuuTRCwK9nmw8q7J/RyyJ8uyz/Z5EGJXdDq81yieKY8X0Vlaru/pqPTm
         z9mlv6h5SNlbqStBhxpyMX13nbOjKmg2xCHoYgnNIoIpepMKUw3x7SkpkGH8Yz336+gp
         Z3+0SVDGxwv4TMcYYM6VEz31qufiVnFmPdwh/f3pRac/NGvSvxBEPx17TTnsYd4Jv9RB
         5kHnLk6A2nnf6iBH6wdmJc8erN4Dlx7PGZ2SHfPRkwmatN1xv395MZhT8AiZSDzo1Cyc
         MZSHv77c1aRqn2pzeJG8dMw7Vm0Eq0Nw1Y7T02pP2CqwVknuS2FK9BnQtcEM8CItrOao
         6CAA==
X-Forwarded-Encrypted: i=1; AKwUvBz3rdq3JN19mpKNraQoVXC9WxDT1C1niVilIHYftPwJGPy/Qh7T2q7qm+dI9lHAk06xpnt1ewxpXsf0aUYJ@vger.kernel.org
X-Gm-Message-State: AFuF++mvP3KPWCqADfRJz+Q8461HR6u526M4U/Q+XmXK1RfJ8Q+d+/9N
	AnKjZKRUeOGnOBv/EWe734KZaFBADMxiMVHMTVUw6OGt5hzPEtsZawZE
X-Gm-Gg: AYBFou317sieKR/d3DiUef1Wn5f4Vt2Wf9m1/mmyLVH0s+l5+U9Zt7tfHCic/+0E5x3
	cxYhKdPo1YEtMRULAsk7Bji1iB6Em9dESRrvS0o4c5orQS+XDwi2zU3BeDglrSTCCpd19n1ID7U
	rTTUCxnYkMGi8l1aJ2OmC0lkxgSUX1GaUtrYIZPLam9grRjJIUv4ySXp9B8LWdhpFvPHKJfTlkW
	DvypJmt8dkPj1BE3g7f3I6cyhnAHK7TxgdXk9PfBLexr6OR+qrhj5evXfUrEGU75ZqDf+hpbKT5
	Bnt6Gzey+ZdSq1/9h92x6ceLTUDiXlwpfHj6Rv+HNreSULJmrm5XhFyED+jOkG/JQglDsyJumfH
	+TCNRk2pQ5VbnVLbPtb8IlyDq1S+wfQtUIP5rTiKDzTWwrcWxn9NUVTLJWY8cRd0HueW3mQJ8nL
	5XXm51qQebphIBXyRUw6sstbX1fMnPrEelfiG1XAPIBJX8XvQUOUmqw0qETEoCP+v6T/hkLeTQG
	TVG8HmFrbmZtB2e0HiwFaQ=
X-Received: by 2002:a05:622a:1b24:b0:532:ca19:afc1 with SMTP id d75a77b69052e-532fb640a29mr12355801cf.29.1790207673650;
        Wed, 23 Sep 2026 16:54:33 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9142183c40asm281206d6.4.2026.09.23.16.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 16:54:33 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] bus: mhi: ep: Use IRQF_NO_AUTOEN flag in request_irq()
Date: Wed, 23 Sep 2026 19:54:21 -0400
Message-ID: <20260923235430.703236-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mhi_ep_register_controller() sets IRQ_NOAUTOEN on the doorbell IRQ
descriptor before request_irq(), and the flag is never cleared on the
error paths or in mhi_ep_unregister_controller(), so it stays on the
descriptor after the IRQ is freed.

Pass IRQF_NO_AUTOEN to request_irq() instead. It keeps the IRQ disabled
until mhi_ep_power_up() enables it, without leaving state behind on the
descriptor.

Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Compile-tested only (x86_64 and arm64 defconfig + CONFIG_MHI_BUS_EP=m, W=1).

 drivers/bus/mhi/ep/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index db7ee6547eef..da498570113a 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1534,8 +1534,8 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 
 	mhi_cntrl->index = ret;
 
-	irq_set_status_flags(mhi_cntrl->irq, IRQ_NOAUTOEN);
-	ret = request_irq(mhi_cntrl->irq, mhi_ep_irq, IRQF_TRIGGER_HIGH,
+	ret = request_irq(mhi_cntrl->irq, mhi_ep_irq,
+			  IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
 			  "doorbell_irq", mhi_cntrl);
 	if (ret) {
 		dev_err(mhi_cntrl->cntrl_dev, "Failed to request Doorbell IRQ\n");

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.43.0

