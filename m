Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DE838DC5C
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 18:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791744701; cv=none; b=RpEmWJKzMP9XPVy5xXV1B4CCeBJhiLZ2H5f87oefoaKrGdKcFsBQVVsnjuV8zxRKgksuFc+5ydkok8w6in749p5ITtYhjLvD704/UayJmn669Fj2nduYxiHfOMwcZV3de7Tmu3ZvCRNsjzlfPNVSppJAIUFcdBUDnqT5fyOroUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791744701; c=relaxed/simple;
	bh=HAl0tw4A2/XGqRCEjWRTCUg/mbwX/UtCTd05d7oPNJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EAbk9IKb3giJv2FrAQ0W+9UARijqfxP3NTR05tpYV2T195mi5DfsU2enGej+X/n3d5874rZoltotK6lJOS3L0jHRE2LysUWHTa7YRdO0wIedbYwbF+gB8sf9TN/IOjlzKIXB9aNK6YXJrlIM+3Y+lIOnkgPCia6oPVJv9ORTqds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNfKc8Nd; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNfKc8Nd"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93e515769d3so107953185a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 11:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791744699; x=1792349499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Jf32+IQ1Xgq4isKE7x6gOmGNb27qgow4H2816v9yaU=;
        b=dNfKc8Nd9SR5ceEL+a9PIShFbAcaj6thz/VA3i8m0alwUY1slyxzlbGm5ODu9hOUWb
         +3LlKIJY1ecPFjbpnBHRDkyyHjSzv0NkweKY14QS72dvkJ+G3Wt1HB2mpRdpr1pzSvPb
         kzZN1MSBTJ+tZ/xOVirgtq3KnXbmUlnIv8tO1pAuVcW0KUQLGd7TpGY3S/7iMrdugLMO
         wCVZravSKxMln9xR1O2hq5ATEOAjhTZOM3NIM7M4BUbssrWT5TUVrc6O0kuOA6KtNe/G
         XxQVCaclcHU4jcUlE7S6QGKYlGRZWPPhmfThyoDHvy3fjB1LsC7DbbbVPfvuLCo5a5wd
         MRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791744699; x=1792349499;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Jf32+IQ1Xgq4isKE7x6gOmGNb27qgow4H2816v9yaU=;
        b=KD2IdHAdPs+yT8u/awUknCN9EuUjcz6eLjmSVZ+PO9uVBlav2X7pmz1e2+RH3gUWnm
         9a8CBWm3M/H0G9ictdAxY43I1w3q7BnGAuZ9YtVJ/rM/AfSa5ftYAcmwzLqrOBDxqDGM
         ezNAG/tOmH+Lgd2kn9tGzllhK+OIu7uO8FVDsPIGxIoVNipiEMnLXWBjMxtCG7b+QvRc
         yoDJDGEwCA3P2pv2bi1UzqrcJN4yrxlrRGQoAhoAocStdjEWoMdwJQGqg58fmXziSC69
         TNIBbpZM9N8Eqf5YfHy5bPx8k/o+AxTKi6k35PdWcw8KOAVbkH5ap7T/t9cWmtvTBKe/
         DsZA==
X-Forwarded-Encrypted: i=1; AKwUvByeOS8ObUapDtFzJrcm2WJDYxmpIaKPl0Xi62tOZbyrRDEJg25BRY0UzY8j/xD2+QUO1r/46OlnvE5L+XsB@vger.kernel.org
X-Gm-Message-State: AFq9FYISywQWE3MB6iFStp+Q0hvHPqD5zGXs7D0UkHNAjw6TZjiKr8JX
	ce1gxlr/B6xNSAid+VTSY6O25Y/mwj4MeWWl+D0HfL8u0Wsnx8TRmuM=
X-Gm-Gg: AYBFou29e2+YWhZKWlgHqF+9Q4FUBi8ycoIQ86TWRSj9bXBqO1+Em6Yttv5y00waQou
	Keq7QMAJXMXjFtOb6B7OzALI5RG98o2T/yX0+MH9ylBqKP2thvTNduE3/5Pc2h/Bi1N1jlnjz1D
	t2Z2sGp0+xtN4B6QRDDwUCFsqG294+drh4RN25bTZT9zVKCGUePgbwKSwMS7t3ztsGbFIvkpg7N
	JCs42Ftm5WBDkOs1fki3rEwmKL5N/Du3nz/pNANoaG+hzmHFh9dOKwd+e30B51TvxwqPdQOGvhP
	1ivcd1YwTBuKdcRqDS1wqi9xFTEw0YLurnAv44l88O6bIjaiY6X0vUmUD4rGn/41GR/iU0DJjDK
	8qOi5N/N+Ll43WJhegGSPVuzgtW3i9YRDSkpz/EzF+YCPLqXLxNwWV1zH/UMEuMG5YspJq1l/Ll
	zrXg+P9sv6WBel7Za9bPD+AfhJOm4ShQ/Xt9k93huBuR7Yv7L9Hlnd+1mkdcXHhtml6U6U3XN4Z
	AeHyW4dcWNYCQ68sIjgz2LtZSyDtKNAxIz/k4MX//9nbh8Iv7xXmUCp48G80h0FCni4XG+6Dm2q
	8bHAv3kt3+BFaBPCY8WL1ZDdJ+0x
X-Received: by 2002:a05:620a:c50:b0:93c:c7c6:90b5 with SMTP id af79cd13be357-93ebd0df5abmr1342671185a.9.1791744699031;
        Sun, 11 Oct 2026 11:51:39 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98bdb8fsm687707885a.33.2026.10.11.11.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 11:51:38 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] bus: mhi: host: Shut down the health check timer on removal
Date: Sun, 11 Oct 2026 14:51:34 -0400
Message-ID: <20261011185134.1759331-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recovery worker rearms health_check_timer after a successful device
recovery. Deleting the timer before cancel_work_sync() does not prevent
an already running recovery worker from adding it again while removal
waits for that worker. The timer can then run after the controller and
the managed mhi_pci_device have been released.

Use timer_shutdown_sync() before cancelling recovery_work. This waits for
the timer callback and rejects subsequent rearming, including rearming
by the worker being cancelled. Keep the reversible timer deletion used
by suspend and reset paths.

This issue was found by static analysis.

Fixes: 8562d4fe34a3 ("mhi: pci_generic: Add health-check")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC, W=1 (arm). No runtime testing.

 drivers/bus/mhi/host/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index b636e2c..f8de889 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1488,7 +1488,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	pci_disable_sriov(pdev);
 
 	if (!pdev->is_virtfn)
-		timer_delete_sync(&mhi_pdev->health_check_timer);
+		timer_shutdown_sync(&mhi_pdev->health_check_timer);
 	cancel_work_sync(&mhi_pdev->recovery_work);
 
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
