Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990625;
	b=Ae1w8nE6rCN+w2+18bAobNAUc3wnD7MYXBUJJltbSXzjav8qR4BkGwEuI7WO51n0kQEq
	 Me+mKjws0xFt7vJwHFQOe9l0zc1n5xW3kWBIUEjUIwSdUNksf7/i9rdOwSl43j1Ud7PhN
	 StoXme0UWohwHSw+I6I0UZ6WzWmMM/DCbENPwaaiq2Vt3FpEsF0MXnSEQC/SAQXwXEHO8
	 QWTQa2h0Gz7Vxtb1xXJrkNkbJCa28S8Bpl5dY1Je7piCAXKL3/y6WQ9hzoJTzignAUE02
	 N0VhEmmytixt1vAzuBCrKd+Q8ZuXfOa7v1gQ5LLngZnbrowMiYf0ekv0nwgWOJ8gCZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NbbVNlV0Ddm0y0fksEH13++wT1yMdo/rDKxFHAfvtG4=;
	b=i3egC6RM2yf3kL1CvlJfMQEosIlVYp6nQ1r5F5L2UPXV7qDoge6uzYXEx8zY+4lkMedn
	 N4D6E5VNvhImZ9cqYOYHKmxAhhFhJwOhdsr0d3KyXQBbOc60W9EQyDlTXb291TRvX97mD
	 NI3HGi9CMp2u6nuCQHiCMCYWnyxDxG3fOtak6C9ANlPqjBAlYxE+vCa1SadGPK3+Twy05
	 5BAypxDTyuOPM9ANZ7IOwHKs1rzsDpeDQ5h2CF71ax1otC5aeaEatCYfZ+GCQSyL82C/j
	 GEYcupfyyif6ZIsaEb5Bee3XlVM0ULmuGeqqzAt3/RXkq7KYQIn7LrXpxLNQQeryYow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nHkTQfou;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E25606D80B
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 18:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73E25606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nHkTQfou
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1587804eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 10:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990624; x=1794595424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbbVNlV0Ddm0y0fksEH13++wT1yMdo/rDKxFHAfvtG4=;
        b=nHkTQfouN0pMR0HzTsq3ECgLIEOgW4xZdy0/pm3K1NbeenoJMembQbTxOIUb9TBjR7
         qip0r3zi2Mwgx9CXiVYKhRPt1lmAroA5RQIx5tN3sXr3uWtH00n51KLxJPKLX/AFJ9nZ
         e8AGnWxWrmFijQf7Ttt+CRvJBUpKb6Q8PSS7G6OHAQrJ1j+5XlPBS43DvBkGpRK5obh+
         RcckWG+JFdcUlQUgVtN0GtLBrhcaJ7XG/7XGKiDCEKBu0xb9VQ3kQzlQ9bK9RyoLCRE5
         NX0//eXIAGMr87MTEz8NgrcCltGZvDOvscKiZdHITOaRBRz7HW+BdFMzBoeO8ZIPaPH2
         mCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990624; x=1794595424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NbbVNlV0Ddm0y0fksEH13++wT1yMdo/rDKxFHAfvtG4=;
        b=vOvK6pKcTavrbvUSdj48GnrmKtf14Io72wVZg2YgG0czIeF4bqeWy8Rcnzg89VKdxp
         LwCRnmDblO1cJu6PGruc5nrmQJwBFJOq3EHypyDv3oodoqaqY+zrG6u9soNA/2gqj+Ux
         0X3K8k5feJO2q4XrEGEU2iInfOG4Gn5vREFcKyUS8DmZpc6gA4WBLcJSYoi17Vb5gdvg
         Nr4wph0mlNWqlWlvtfrYPxVtMvEOqcpJoj86Nan60vYEtO7fI6H4AQgalPWCjzrPQu2X
         1QrY/PFCtWSKdG+I81FUVbnzLuH6DT5ZZX6G0gxgn6X2VDubTUoj/x+s+TV6fA4H23qi
         z6Ag==
X-Forwarded-Encrypted: i=1; AL+hErEq/X7/vHLTRy9m/7y8U6gS1EjGkR/gOPjMSn3XtXC1NOBAMRXMo/pIJJR18KpZmydBj0IFZ7miPKXmtg9o@vger.kernel.org
X-Gm-Message-State: APuU4Z/F+o+JRUfhHq6ACl7HDDcX2+BM7L/8e5B2zJyTBDKuETKBdr2t
	+vle7kZabcFeJI8krZsFRo9ZCn2ZPy65c63Y6G4ZM2WdX1hkKAK7ficl
X-Gm-Gg: AYBFou34yr9YTino0L4Ycr1VgX7pqBD+RPU3iM2E6FQObbes1eYzy/ZZ5k/9aSeCxQj
	NBCgSw2m17U65GNUuv320pt03SmSfuDEmaRiOJ7AwPRx3/kuzS4nTOnd2gq3FSd8HwnR8P7c23A
	9L5ARxw1naMzsMGHZyrsRzvvaWt0RoLSIDTwpDHgZV3E7qob3cIvE4PWY85aqW+O+BA4ylo6M8O
	NrFG7+18YpHORL9fCumoHSzIlfGT1keKyFUOyy4r9DtfmiaksdWujdyMiKfdKVqQxG9XU/4sXH1
	rcMq8YMq+fI5zECHZIzKpuyFL/0fgQG215IM6bYolJ4+qx6D5sLAu/UOJoMX15JdaBwzTnaT+Yv
	phdEzf2EI7R2IO7qExwTJ4WW2PMFCOBoJEwr/bkVWUZpdffPUWjuOcgw/m64DbSjMpt8mH+f27Z
	N28Bfm087r//JzUUfdJm2Q5lXLyfSWSNjQk5mdGhoCIa20LtF4/d2lzrd26QxrTNLByoCAt7d5C
	yI5drZNgoSM2lGw/uzpaYyW5sLq+ITgk6aFSxrO1a4Cl2Ovz0qoVauNg++nlfzD3Was80U5uxsB
	VnCXKCyOKcQG/JfC8NjlKKsL1Iu3zw==
X-Received: by 2002:a05:7301:921:b0:36c:9bc6:3ec with SMTP id 5a478bee46e88-36f72cc1d9fmr4534575eec.3.1793990624382;
        Fri, 06 Nov 2026 10:43:44 -0800 (PST)
Received: from JMD ([2405:201:d028:10ff:eceb:5028:6b10:da7c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea414sm8278073eec.16.2026.11.06.10.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:43:44 -0800 (PST)
From: Atul Akella <atul.akella@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	sibi.sankar@oss.qualcomm.com,
	quic_srichara@quicinc.com
Cc: linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Atul Akella <atul.akella@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/4] remoteproc: qcom: Fix bounds check in q6v5_wcss_da_to_va()
Date: Sat,  7 Nov 2026 00:13:10 +0530
Message-ID: <20261106184312.100-4-atul.akella@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261106184312.100-1-atul.akella@gmail.com>
References: <20261106184312.100-1-atul.akella@gmail.com>
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

offset is calculated as da - wcss->mem_reloc and stored in a
32 bit signed int, while da and wcss->mem_reloc are both u64.
For a sufficiently small da, the 64bit difference is truncated
into the 32 bit int, bypassing the offset < 0 underflow check
with a small positive value. Additionally, offset + len >
wcss->mem_size can itself overflow when offset and len are both
large, providing a second bypass.

da and len come from firmware's ELF program headers via
rproc_da_to_va(), and the result is used by the ELF loader
to write firmware segments, so a malformed firmware image can
cause writes outside the carveout.

Rewrite the bounds check entirely in u64 arithmetic. Reject
underflow before computing offset (da < wcss->mem_reloc).
Replace the addition based overflow check with a
subtraction based one (len > wcss->mem_size - offset) so no
intermediate sum can wrap.

Fixes: 3a3d4163e0bf ("remoteproc: qcom: Introduce Hexagon V5 based WCSS driver")
Cc: stable@vger.kernel.org
Signed-off-by: Atul Akella <atul.akella@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index b391724cfd08..e67dc3ff8a07 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -740,10 +740,12 @@ static int q6v5_wcss_stop(struct rproc *rproc)
 static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct q6v5_wcss *wcss = rproc->priv;
-	int offset;
+	u64 offset;
 
+	if (da < wcss->mem_reloc)
+		return NULL;
 	offset = da - wcss->mem_reloc;
-	if (offset < 0 || offset + len > wcss->mem_size)
+	if (offset > wcss->mem_size || len > wcss->mem_size - offset)
 		return NULL;
 
 	return wcss->mem_region + offset;
-- 
2.43.0

