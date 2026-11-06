Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990605;
	b=4vYhlAooqqc2J2v4+3o2E0UNBmW7kvh9cMPA6COVZmYHZUT4KuUshMgGePYX959kKiq9
	 9fZbzDZrSvG3xdy05Qe0aOXaLmA2oUU5TAMlT1Pela/Qsiq+3tiDWcy3l8L/Jle2t57Aj
	 iwoWFGRl+LHlFO/kok/qMUvMWVMW/IR5XthBfDe8whLfEeMqBSKJm9Vxp38iEqs3QBUDs
	 UJtsEXIL7O83ihbnVQPRUsi3Drm60DVoHAvaKk8pxwn46yuHUG7v3jAADlxJmmOFwgnni
	 Sg2mn5cGFsz7TFXL1UWBzpoi/PEYnB0jmEFwUJgwuHD+7g/nOY69scgFv3QACzuRpgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fj9qCzoz3f+xnhhJ4C/ud2J0v2Gz6A5yTqsQ9J2hXWk=;
	b=3hFbIKc6kf4VgMSRYQ2mXznsNvoiW7QmGo+oqVK4R7f7wQO9o3BRJkKUHT/eHp5OpEkq
	 bxcV8kHJoboHKk3qA88nnt3YSxebCuxLHpdqCO9+c5W9u+8cV8YGos8V+OpzD3w+e+sSo
	 BnvegBhGaty5TvcXo0xy7znU8Nll6cllIiux2JR7efbwrZ3tTYy6/1Mvm5ga/yxKQooYq
	 l2vxBywlNx9hp+S1w4RzaoiZPH0deEWo5vCMcOLxrN1x+nLNJEe1B8d5eMBf63w8mK8Kj
	 5WM4pcGV38kfY3ksiYBDzy+JgHIFqEkUmKBcV5Ue+AgJm2jFn7MhgK4pOAL838ITuPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ALdpfCJN;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E658D606A32C
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 18:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E658D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ALdpfCJN
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so1278877eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 10:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990604; x=1794595404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fj9qCzoz3f+xnhhJ4C/ud2J0v2Gz6A5yTqsQ9J2hXWk=;
        b=ALdpfCJNPx/mXbaQBrqXDAxCA4aSS1RIH+Wy1UveDNxBxcB+3TKfupyaGDOHtHYtCB
         guVedBf11daK1VGrd4ZnKQxX27CGa+GzihR4LywB2BB2dMQXNXtXgMj4iVVrnJOSIbgK
         SSEI8TiOfuRC37kjSo9Ru/gvxhNPLVg8jGx+TWKB8wyBABRh0vTfL0SB7K1yV0IUyzd/
         GRBmAO2FfAxZM8Uq2b6A6TfLHn5/h4wC6+e9PktoUr2V6NDzLe+J2rdx1+LiqUMX+QU9
         7LdTHD+T5Zln4TlvFpZ7dRKOqlOjqRVR0bd7y8kDe7UB39yFqRYBGx4VA1RH+QQbPa6A
         HhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990604; x=1794595404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fj9qCzoz3f+xnhhJ4C/ud2J0v2Gz6A5yTqsQ9J2hXWk=;
        b=qyGjYP7999rdEqJIsOfOWuZ6GKnIj2kRMeTQDMNIvR586OJe2uHGJVh9GsUcbkP37V
         fBr0QWe4AvABS/fZCzPqFcqglPkAUu27TEimSMPevPjqGjeN08taprwpxeJNxjpLd7xG
         UcGOCAE8ZBoNW62mgg6hU45MsqSgMRfmLQ6HuFI5KM+TzL6hIfE4g4qZtDKBw+i88jap
         U8GBuQHmsNQSUTaa7evb4yoJJd2bWF7rFmez4rb8LS86lX87Hi7w9/uj8C4dYd3eVJOw
         q3e/MjqqSFKy0jGCXSq1grez9Uti6zMBc0plPLOQzH5l715cwtsUjlvHNGeY42h7phWB
         jzcQ==
X-Forwarded-Encrypted: i=1; AL+hErG0bfrzvU2lXeKzXada9WjJGbhz1BOoj35f+gr80ZoNvBOj83pngcZHciVeGusu85b0H5r2jakbIihZNHCm@vger.kernel.org
X-Gm-Message-State: APuU4Z/QSNVx0Ze5P0Vf7U8oAjMHtZ+4iJmEFEMLwkZpU7z10S4EHGy/
	sNGiEbEP2GDPDeY4IPeo5Q8cdGGuC8ci/U6J+QnDpMMhyQAOXldm3HHL
X-Gm-Gg: AYBFou3DK1F0mNiDHOQu5S+mjRtqNU5Ol8GLfSehYk0syaCEKZM/xOMou/4JLAknkim
	a4nCl4SlAzx60ARZnHmIG71gTLasbSUr5eREFeU41Pyu+pv7qkGe5Mxi0mtGL1G5mqqxuHzmryK
	NF1KOapz2qy7x+SoF30tvVyNNRKWd0vKZpjkUeWdxhWpdnh4Qo3erwmYhOZbhCDJTEJwApMK/fq
	o/CyHEBL10dsavhC3jsUuC4VzuPHjzLN8B6J6DXGdpHA8x2dJbnLpP/yesOKHaJGlIq7NkxdhkH
	urk9GK1AIHmlktK4c+Dh+FaOEjdUX1ghqDb/kj0mBFGs0st/9jgOPMQFr+t9fCaxBkTZUgxZSTe
	XCsd8pCeUmhPkjxRTNtIaZlstQl9vT6A4lMov/b1POvi6vTPEIGqJES7snCsqHUVspkGWOHJowu
	2qrvJdQTz03eSr2eMxenwAeHnlkkRx9nraM8TqtrSRd8YNKXM53n4Cl0iSkZHpPhtbLZ5KdULn4
	0EpzBvpPeIvdxhShM55jFpzRRFqV2nymfzJRv8FWzdU2EXqOTMcZnC3rFN20f41ACq29Q4TKNp+
	lXOu43UcxD6yer1whFJzbpTguep4eQ==
X-Received: by 2002:a05:7300:10d:b0:36c:c434:b6b5 with SMTP id 5a478bee46e88-36f76621095mr5197718eec.17.1793990603771;
        Fri, 06 Nov 2026 10:43:23 -0800 (PST)
Received: from JMD ([2405:201:d028:10ff:eceb:5028:6b10:da7c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea414sm8278073eec.16.2026.11.06.10.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:43:23 -0800 (PST)
From: Atul Akella <atul.akella@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	sibi.sankar@oss.qualcomm.com,
	quic_srichara@quicinc.com
Cc: linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Atul Akella <atul.akella@gmail.com>
Subject: [PATCH 0/4] remoteproc: qcom: Fix DA-to-VA bounds checks
Date: Sat,  7 Nov 2026 00:13:07 +0530
Message-ID: <20261106184312.100-1-atul.akella@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
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

This series fixes the same bounds check bug in da_to_va() across four
Qualcomm remoteproc PIL drivers: qcom_q6v5_adsp, qcom_q6v5_pas,
qcom_q6v5_wcss, and qcom_wcnss.

In each driver, offset is a signed 32bit integer assigned from
the 64 bit difference da - <base>, where both operands are u64.
If da is smaller than <base>, the subtraction underflows before
the result is truncated on assignment. This can produce a small
positive offset and bypass the existing underflow check.
Separately, the offset + len bounds check can overflow.

da and len originate from firmware ELF program headers
(p_paddr and p_memsz) via rproc_da_to_va(). The returned
address is used by the ELF loader to write firmware segments, so a
malformed firmware image can cause writes outside the carveout.

Each patch keeps offset in u64, rejects addresses below the
relocation base before subtraction, and uses a subtraction based
bounds check to avoid overflow.

Atul Akella (4):
  remoteproc: qcom: Fix bounds check in adsp_da_to_va()
  remoteproc: qcom: Fix bounds check in qcom_pas_da_to_va()
  remoteproc: qcom: Fix bounds check in q6v5_wcss_da_to_va()
  remoteproc: qcom: Fix bounds check in wcnss_da_to_va()

 drivers/remoteproc/qcom_q6v5_adsp.c | 6 ++++--
 drivers/remoteproc/qcom_q6v5_pas.c  | 6 ++++--
 drivers/remoteproc/qcom_q6v5_wcss.c | 6 ++++--
 drivers/remoteproc/qcom_wcnss.c     | 6 ++++--
 4 files changed, 16 insertions(+), 8 deletions(-)

-- 
2.43.0

