Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5B546EC76
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 15:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190106; cv=none; b=b2sMB2rU5sFAhbAF4IifxdMBbjYYiHaw8J7os+MvbaBSvsvRoxDovFLsLPWaPMf5YIv/sttod/hM8xTO5VTEJeAh3LTmT5dl3P47UoT422uBR1gqfNFh9klflYQMVyMDj4hTqUBqP2VGu2lYh1hRsUBUopE5JwWNxI5UEW8fU4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190106; c=relaxed/simple;
	bh=UVaSnAntsnidTQyQIAWkdDSWDG/mfhc9FkANFMl71lU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dD9gf6MDIjfRS4Ak6sbEkHB9iVC+V3p0DFDqzCfpu972V6bxHc15u3lV77uJlE6fOUSIxjZGNuTHOsBYIdei2OstGPXBVa2uAXwk/TYqlm9+xrcCnyxK9FWJmZb1VerKSTdSeRy1ZzCvCSdJ9gXNZp2+i9DzPLwYAY+coQ5lOLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dv+VGBAV; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dv+VGBAV"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1c9879395so2831082a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788190104; x=1788794904; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LzXEuTigiTiPkrsvsB4lTws1Gv1eiCRXL/HMjZW3pgA=;
        b=Dv+VGBAV+xNPvTURXvUpAquidUdVTNnjzTCKqfdp3UJJpd65cXNMzBLMld+TUnvsvl
         3M0/jI5cJ0vlK0OvYcMcdMIhufAk84ePXu3TYpWsJznaP8cEVyf/WClCnPigPZaM5Any
         0URwA8aZgD0LzdsRTDDZY16Za0XcuJ86s2Pcq6NjV417uBgzHnSy1OuSmZ9qa5uru/xc
         B/Q+vXyk63e1558Jw8yUDgBGShTXpJKa0bXGhJx1zzL2Thn+AVwkePtfltOxY7D/+/g2
         6p1j2xjRt/20Be9q2YeElAx8j5H0+HiUJ21ImopC0ZJA5WRP1EIF4cAyxhdL5XmR7JQm
         yvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788190104; x=1788794904;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LzXEuTigiTiPkrsvsB4lTws1Gv1eiCRXL/HMjZW3pgA=;
        b=KoMNZjPug/6XzjYm5J6iYvcrL6cudqJ+801dNoFCR2uAW8bB5Eu++UxbUmjblTPj24
         niRcT7GU9jkbjxtOVoyZ+UeFz+trdfaFTl8CQYPHu+zMwf8i+OPpl/i7g9GAdrUqHipG
         va8GAEK4sTurpuzgJLiojGjprrZ8tCpsI2iCzFXSr4Q6UN/+VJuV5wYtmFRf/Rv7fQPg
         EZqnLnBpRAIs4vz8ErECIWv2GeZEsM8SsVcGT2KSqmqteph32op67/nYdZgPAR7oD0xN
         KTMdKMa1tUuXD0mJ7wWK+9DiTZvOIJ/w8JYWnR5uDl/l0i6JfM3WWwk/tfOJ2y9lhn1q
         RqQQ==
X-Gm-Message-State: AFuF++nCIX765ne4ekok79HGao6uOR+A3J5wNmqhNMdFBmef/qsrKpUP
	RZYpif5C4fRUAhlfKrfdjrJwf8Eos3Jvvdc1laXYpG6LtN8YfY75OxcA
X-Gm-Gg: AYBFou1kqs2FclCHJ9exPyApaYYzy58Wj4cZROOp6YuFHyE89SEW8tYE+1aFcci5CMM
	HNyCOFRz19yLNuM8S2pvb1BUqm62mNOkFfN9oiwU1X/4iY7QY9rehuzbTshcU7FJMY/rhzP46eA
	uQ4C70xqs+ZPRxbOaNucHyVYxcDIZhaeGJaBl/UwNjKoHKhBf47M7Es0ZdK8UDHwg8rvr/kuKfS
	fb2XPKgzjBC3NUZflrcT86oVjyt81gyao4MxNVbrzLjWvSQfrKO6SXJZhvrB/+mSdjV3J7jy4gK
	sg12mNNQlC+Kc13sRzxuv4UW6ScdF1cKUeZuvXf3ulEyz74QjMNje87MHr86Czg25VYmzRo9IbM
	nSVpnA/Bp+9p0oJBk2RshFWo2PrdJkD22Vj895mVpQoOHYHg+PZUg8hg8hLEh2qpGa+RcptyAZK
	YEQrvGuFeDR9NUqjuo8HvLAjmGC2TnwVrbIG9gs9ZUAfgVZDY/vJ4sME5xTfcksUve8ShXtx8Le
	N285UzvM6k3OXlE1NN+aa+OpzIdwQ==
X-Received: by 2002:a17:90b:2551:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-396d0fe384cmr47180926a91.9.1788190103615;
        Mon, 31 Aug 2026 08:28:23 -0700 (PDT)
Received: from urmom.urmom ([14.170.170.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bcf7ca7sm8891a91.4.2026.08.31.08.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:28:23 -0700 (PDT)
From: Lucas Sproule <lucas.sproule.42@gmail.com>
Date: Mon, 31 Aug 2026 22:28:08 +0700
Subject: [PATCH v2] remoteproc: qcom_wcnss: Fix error check after
 devm_ioremap_wc() switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-wcnss-is-err-fix-v2-1-5520fd4c6b50@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CQAyE4VchPdMEligur0I8QB21HlbTqpAQ3
 p0Vj98k8y/kMIVTVyxk+KrrM2WEsiC5D+kG1ks2hSocq1NT8yTJndUZZnzVmdsQJdZAbA9C+fY
 y5HlP9ue//TM+IO9fh9Z1AzHfXE90AAAA
X-Change-ID: 20260831-wcnss-is-err-fix-729c91ee975c
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Lucas Sproule <lucas.sproule.42@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0

Commit f9b888599418 ("remoteproc: qcom_wcnss: Fix reserved region
mapping failure") switched back from devm_ioremap_resource_wc() to
devm_ioremap_wc(), but kept the IS_ERR() check that had been added to
match the resource variant.

devm_ioremap_wc() returns NULL on failure rather than an error pointer,
so IS_ERR() never fires and wcnss_alloc_memory_region() returns success
with wcnss->mem_region left NULL.  Probe completes, and every subsequent
firmware boot then fails with a bare -EINVAL from qcom_mdt_load_no_init(),
masking the real mapping failure.

Check for NULL instead, and return -ENOMEM to match the other remoteproc
drivers.

Fixes: f9b888599418 ("remoteproc: qcom_wcnss: Fix reserved region mapping failure")
Cc: stable@vger.kernel.org # v7.0+
Signed-off-by: Lucas Sproule <lucas.sproule.42@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Collect Konrad's Reviewed-by.
- Resend using b4; v1 was whitespace-damaged in transit.
---
 drivers/remoteproc/qcom_wcnss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index c856a92af43c..90747af237f7 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -542,9 +542,9 @@ static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
 	wcnss->mem_phys = wcnss->mem_reloc = res.start;
 	wcnss->mem_size = resource_size(&res);
 	wcnss->mem_region = devm_ioremap_wc(wcnss->dev, wcnss->mem_phys, wcnss->mem_size);
-	if (IS_ERR(wcnss->mem_region)) {
+	if (!wcnss->mem_region) {
 		dev_err(wcnss->dev, "unable to map memory region: %pR\n", &res);
-		return PTR_ERR(wcnss->mem_region);
+		return -ENOMEM;
 	}
 
 	return 0;

---
base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
change-id: 20260831-wcnss-is-err-fix-729c91ee975c

Best regards,
--  
Lucas Sproule <lucas.sproule.42@gmail.com>

