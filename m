Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B3F4D9F7A
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 18:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361721; cv=pass; b=QivVEE4J8PTIjuaMIn6l2P65MLAfeI11ocdVUc4OjsBAS/ZQxTT0wC4Bj6WQ3gTA/1mi5apBb4M1iuH7xpmnCY59Qxx37BohxTY0u910Lplz0+lxmklUJnLcEsdD3Iw533rHjpH5VNYf0mw1aONUyccKdjOcXyjoKX//o+fPd4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361721; c=relaxed/simple;
	bh=jS49fELDwpiqild1Uoy3Hgh8ZGEHWDa35yUd9f04Zzg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=DpjqgYengVOVHURqjYnmTxqg3JDsAVbtT3JTdMdJzqaNhEakqcdgHbZ/DAz2+CWZlBPiQ9wJt3bbB/KCUzIh0i5Gjufq2+yvDl4ln9iRRszUyIfWjfx1nsHWUP8GF1PG+5ZA5ciHblc0rgHgaOQs7uviDbJgoFu24A3mXzfAckM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3MAypkI; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3MAypkI"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2b4138d3deso40839866b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 11:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790361719; cv=none;
        d=google.com; s=arc-20260327;
        b=T2VdvYoj0VzSySb1a8dTagapLF2OTV5nwVaJ+4x8bZMLQfU6XlRzbdo3/nghawSo2/
         qDIQg1oA4EZrAF+85mAY2c7rY8rtM0SFvsl2UFs8LJoYXJzAdYJMrQCzSbR0MPxDZVo3
         lxCyzBlrAy6deyWrIh/7+CEjiNlkyw8HrV8lr6JgRRslX8B+t3ZPpNyfFCvL6NRov4jp
         QilrRlIyXqAEX18ZmMLagWZXPVyMNgQBRm/3zghd/TZ6fta1bjI9Livdm7XzXTGDhm3B
         kopqVJL5QEqf38eQlrEUGr2813M54RCdpL0PibO7QvI/zue/SYICRyH+fBbtIoiGyxu8
         WMtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=qx7cDPY6jPK/c9DkQQCGcdifcKvknVKBtab/nVKa8aQ=;
        fh=zd7yudumxUvGPk6jw0Dd/F6RzXVP9Wo2ISMbSYh5ogA=;
        b=ikss30t3J/pKw1fDPR4eo3t7Ra89433XTKMyM2YtECoZcLmy/+Zxg7H2nrFgxcNkLc
         LPTKUqCPJ+l941WxjcYmUiZRk9Ve98TXGhog51JCQo47uFqYgLXUPxoZCTl7Wca0vsmF
         +dGlavo4KbrLRQzF3/SKVQiZQJR8a8g8NgXuGmQs5P4glMdvi3a7MXqhA8NQwGAEbk+S
         qA95jX9s3T2b23GERhuQa+PRGTECAuQiFynUwCl6NbvKFFqwda/dCioWTTTISkRIc+xW
         SMgVaQQ9+B/GK2t7937CeRdyP/T6P/J1gJeWTr9w47oR62ZuCjv5Wp4XhzjR9jvvm9Hf
         E+Ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361719; x=1790966519; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qx7cDPY6jPK/c9DkQQCGcdifcKvknVKBtab/nVKa8aQ=;
        b=f3MAypkIeORLrA/NGmAnODOdbdy4xBiWY/idwSv8/FIPJLj2jjGHOmG4CfQaDizbdi
         qM3LJ/dWB2FalFhpFSguZVI+4zVaqPDSprhBmNA8XNLE9xxCxXEhmlFDlve1rdF4oRqU
         Ltl6DJqXBXi7KvmNQJYsG3YjtFEl1SIqTY6iXv3sPRh4tUtETHmnTJJ1ES/VANvUgQ0v
         WXvapdGJwxv5NpZaqMevMSCWcq865p5q5qIW0xH8pSLrRcT/obarz43s4rph//74rqIV
         /0BsEOvlaqpJNMBxzV6EWNu2LfTpauRw8ValL8mZJdRqaQLtFPx3IUFHj3YFcdsuX2tF
         W19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361719; x=1790966519;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qx7cDPY6jPK/c9DkQQCGcdifcKvknVKBtab/nVKa8aQ=;
        b=a081tp0r3MQAXxxMSvYnOPw4LXPAXwhrJixEPTAfB38QtOd3QFM3Wouj2Ga60oTn6N
         LJUjV7/D3TeJ4fUYcLTd1t8OVMUZWFcsGiW/d1XN4sEk0WyndTvK7STDwuaxtjQuE1PF
         fdW0FzQ+ddkBSlKiPmatQ9E1guEsioG7PrDwRlpTwmecMBSSkpDp5nTx0GzBHz8Xd1Uy
         29XeSHDRW5eIV8nrgxYuErlIBpzXWN8hz3A+MbB0Dy1AM3tDvw2NQo27QNiEAcqURcBT
         koyIIm8hYtBAxDfiC+ZftA0aXfdJwz3TY4dmAd62gwyr6Ad3XP0B8oDR36gXA7GcGdzu
         Ow1w==
X-Forwarded-Encrypted: i=1; AKwUvBw7aTJRgikJV8VnUYNmv59OuU/7DhrQqH9TXaGN5eVluvpQZSW2ZKnEunn0nISVMeHdcdyasbVdzgncSbaT@vger.kernel.org
X-Gm-Message-State: AFuF++nPdEEKTutPLCbqCtblCRAIV2IOBvry1xpugb1rxrOGI4XpjQyi
	iYYLloEhX7vJkFe3XzbywsnetwEc3p4EaUyAbGhTi4QzAg1Ff8uaFP+DvyoJwhOCXCR1nWcKL8c
	PS9u39dbsehqB+kt4eXGwPGwB0NcYQg==
X-Gm-Gg: AYBFou0V2hb9DfgrnucX+J99zXhLlsXu99leRg4LD+HmWT0HU2hfmEgWA6HdjVjkmfp
	iatt34EYARkR1uPr6rLvdcMbRB6kng2P8IG7Y6YTZhV5pKQp6G4GYvREvIBnqIy+lPdKdPnvNsn
	Ap3uSdZaYbI9IrIQ3z1DlJPi5qIb/A+qxtZsLxouczN+ihstLY2ZN/idTH6jxxO2VGgauO7RQia
	3DRw+n3hCbcTR5jdyRLI8UxheCbXX1J+I590xb0O6FIRwPVhh/OvOHwjEsIF0xA2migtYrAAXlR
	VsJ0UA4MDDAGs8lFRNkLTnvvtXtZdOG2lAgZhqwaOuCaiOLx6mUGzn+Bz0Y36cOEJoQ6YpUmq79
	u/BzUM8Rb0ppgFfsTwbLWSpHtgyDEtwY9QEmLDwKVQNJpkbDFoSmCVCsFoJUSMpnA
X-Received: by 2002:a17:907:6091:b0:c16:4df6:176b with SMTP id
 a640c23a62f3a-c2ac23d6040mr610229666b.20.1790361718505; Fri, 25 Sep 2026
 11:41:58 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 18:41:56 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 13:41:37 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
Date: Fri, 25 Sep 2026 18:41:56 +0000
X-Gm-Features: AclHuK-WuMP610jmp01dFKCpj0Udiol-MQxcrP9tYdnANDZk5EBVQKfElIsBHyg
Message-ID: <CAGEsz8HtRE-sAM2YfC0_Vzcq9OeuMiRVc0cMTpWogt0Uwc4-1g@mail.gmail.com>
Subject: [PATCH v2 0/2] media: venus: fix HFI teardown races
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

As part of our ongoing static-analysis research, we reviewed the Venus
teardown path and confirmed the race reported by Sashiko.

This series fixes two HFI lifetime races during teardown. The first patch
waits for the hard and threaded IRQ handlers before releasing HFI state.
The second disables and drains recovery work so it cannot be requeued
while HFI state is being torn down.

The later Sashiko report also identifies a separate resource leak when IRQ
registration fails during probe. That issue is outside this series.

Changes in v2:
- Resend the same changes using git format-patch and git send-email so each
  diff --git header stays on one line. The v1 mail transport wrapped those
  headers and prevented git am from parsing the patches.

Myeonghun Pak (2):
  media: venus: hfi: disable IRQ before freeing HFI device
  media: venus: disable recovery work before HFI teardown

 drivers/media/platform/qcom/venus/core.c      | 2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)


base-commit: 4efa625593e1e9c76346232413997556dea1d89f
-- 
2.53.0
