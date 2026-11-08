Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794172602;
	b=s6pTCWBsUn78CM4+HadOzvElH8tttuq5LoBd2DEl35uax9mbtJ4a2sCkokDTvMZtPfCG
	 BtL7tF/mBFupMSiC18n6r/xUySy6KKcTYqgce1RyiufwHu1Xiff0rKJwDRwHlVXrUYkJi
	 7KjIUncIAGvCghkiqZbpwhHDLG1f1OcMF/grALQ2zuTjaH5Z4bt6tiHCGxIdDTwFgN11w
	 Sr9qV5iUs+qCrsFTaHj6N/3QdqkyGvuyC8ZrvieteNBt6lbk+Vcp6Or1VbP4C1dkQzIZ4
	 q66QwAKO6wAUu3tsN1/rnrBvHEajA4Kbb8t0UG70QgL8q6Yg0pSEUms2Z7msV7jNKBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=YqppGydY2lVpcg6U6RxDeq0X7ii+knKFWwlrA7dV7j4=;
	b=vFLqpbSv39qMQNpmSM1oXTlJ6PM6fGTIb2ugOEUvMlDhmziQWAQXuUPVGmwoCyn6oI8D
	 fsUp+DqWGTwd4NpIBMttSWh/8kgj80+qUxQGgWZrGieCFzjGlNLoThTXW+h8MTXE9I0e8
	 b672C9JvHn4j8NB/1XnYxvCbES+9Hf5dFgsRDVCgLNLFk64HQdFcKlgaZhDNca7rUldja
	 xiPAnI9ysCywpd4o6Jynb2pmPU/JO6KnkRlciN/KXi9SEOttzZ3ek2Z0kuX9pZpRJf8I/
	 Z+Xcb37S41GUtaIrbG76IHCP3edl/pRXzlrlQroVBKabxGvd0wwhi0LBbKjBNIgm2Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h8AWoA0O;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDE0606A321
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 21:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEDE0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h8AWoA0O
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-705cb6ceebaso190235eaf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 13:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172601; x=1794777401; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YqppGydY2lVpcg6U6RxDeq0X7ii+knKFWwlrA7dV7j4=;
        b=h8AWoA0OWxbqjyWSNiYXEzTizNbayTb0xZvvXcqCgkbk2w6HrwjoDDPGXFLH/fsHDO
         BDyEC1UwljkkYsQwQnpdWzQFEYIVN99b+HFiVsQrgGCKlGMGz9PcaP57xeV17t6Nz/S/
         gHkBA4kiJt3gn1lxJxuScSF382vlSUtXxg9JA1pmbjpkCc9oovDuzn1bws859QUX2aek
         w7pIy4d9VWt4Iaey/v74OrK9GqNo+Hz5qSlJ7kVutNNBYDHUjGLjz+Mc6L/qdDMDKG01
         AS8nZFrBadASG1JTaDpel7dwavlnGnsHdS3p7XxN3CGMpp71D9eDK9fDgFncwCT6XS2e
         CHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172601; x=1794777401;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YqppGydY2lVpcg6U6RxDeq0X7ii+knKFWwlrA7dV7j4=;
        b=vmiMAbi6wz/lc4t1+z5JkTcWaSRAoAmfGIHPaJF3ebE2bA0u1dN43tB5OyjJTBCc5C
         R7GFlgdleEJkFx0Lnvx6VDt8xc0PiRFh8DlGkpuMLGurRmZsYHFBiSJT3A4sTRzi+B0W
         /xbHCQjg2OkjOnEOJVBCVs+KCOTcKVMz4k+aPB3iaLPvJEXw6g0hOdViaFNLLPVMtaD1
         PrxqVMG4bxtqFBUS+LtVNMZCm/BjhG2Rx1ji5xIYB7aGWn1fXIu3dg5udwrsWsouFNyQ
         GV+pSzMZJyC16J01jQdapZrdY1NtQOcoYDBL/WzH3S6EzSbyMKlpF/NX3ixttUJ6AcAG
         IrWA==
X-Forwarded-Encrypted: i=1; AL+hErFubZ291dH3QA/EwWW/YAF4Xlf8I+zVCg9Yz5pk/e/S0nbYOpSHGRzdjt06ZIkEz8V1993f8ECHV5npyH3m@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZqxKVEQw5uYCheLkCgWhhePp2QIVD/SXd2+Pb63nwKojLgJlQ
	4mEcP4e+9RNH39O1IsuqUaDcFDEL2WEmdhyZiKFnBDDutVFsWT/rv4/0
X-Gm-Gg: AYBFou2W+PVlBp9Ad//rkLi1G2TYAhMgewkFmXz7NgibvSkcfK0a2zl/IHuUrSn9Yrw
	bVznf92RLwKjXdCyRtGJfCFGiRjJOKHwJ+tWcUd0QjUxkrFmVY0poMzhgUf6JO4UfZNTM4l37Rn
	qCj0YGjOIGkp7YEYY4T8hufZRC+UdsKONzlKuiHFNQyh2fyewnTRvty4bk9EtgFIQu4xdCDpP5E
	ludPqs2S1WNJi8l7N9TNkyjb9P6OGKrn8CGokiFyQ/JMEq4Ts+tVVC4Xld3BQBiLXvpEhxn5woA
	T4BV6kxnJxiIrr/ZuaEt6JqORNgLFrfijY3Y6EbcWt2fmBEU+NJoPfCK/So/R9foonTCjaqoYBL
	ikKMNLQVsgJk1sPRfdRdhSdOR0h/4TrSsjobyDf+QF/7iA59Iy4LhKINbsyYbhIeeJUpT9wcISP
	DVHebxCFJhKva4lvTE6kuNx+faJJ7iNZvJulZULngXFYqNBTE3WMb7HEQbtl4WG8NqSy5MHnoVf
	Aa1iF6zgaTc9tCkWjeJT+T3ZwTqV6Vwp9nZFuv4cgg4jV0veBjzTCRSx/Y6Yvs+6ULiR8+yXyVr
	73i9Ldyn4fWPhwFSqI/rZGkdoFbuRKCJVj0Mnm+vvrV9mAygQ6LLSk4FIJYjZWzsFhmAh3TxFw2
	N8qoOYY3/QWjF4Oe8RMl+AmNgyvvnlWTddATR/dTFLEaShmoi19gYs55AB0ECJiGw5pCUERx0Wf
	GJc91Z6zJ8jvVPinhLJpr7F7L4ex2JirVQAEgE/aZPKYbmDGSmb9A=
X-Received: by 2002:a05:6820:1381:b0:70a:df8e:8f64 with SMTP id 006d021491bc7-7170f259c8bmr1073868eaf.22.1794172600816;
        Sun, 08 Nov 2026 13:16:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8fbc55sm1896378eaf.12.2026.11.08.13.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:16:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/3] mtd: rawnand: qcom: unwind failed child initialization
Date: Sun, 08 Nov 2026 14:16:34 -0700
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-0-509f30a9e14d@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN3Q6CMAyG4VshPbaBzSCJt2I82E+RGtmwm4SEc
 O9uevh+aZ7ukEiYElybHYRWThxDCXVqwE0mPAjZlwbd6YtS3YDpY2fO+HZxxmCCRzfxy+Mi0RK
 SSJSEq8KxJz10Z6MG00PBFqGRt9+j2/3fRXqSy1WvF9YkQismuKlOc/Zt9dtAW4bj+AKcTNgMq
 gAAAA==
X-Change-ID: 20261107-submit-qcom-nand-child-probe-errors-v1-f5e2703a17a5
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Sricharan R <quic_srichara@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

Keep the shared BAM transaction usable when resizing it fails, validate
the boot-partition layout before publishing a chip, and propagate child
probe failures after unregistering any previously published chips.

The layout and allocation fixes make cleanup safe before the final patch
adds the missing controller-wide probe unwind.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
James Hilliard (3):
      mtd: rawnand: qcom: parse boot partitions before registering MTD
      mtd: rawnand: qcom: retain the BAM transaction if replacement fails
      mtd: rawnand: qcom: unwind registered chips on child probe failure

 drivers/mtd/nand/raw/qcom_nandc.c | 56 ++++++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 24 deletions(-)
---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261107-submit-qcom-nand-child-probe-errors-v1-f5e2703a17a5

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

