Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BF914A619
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 13:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786886228; cv=none; b=AmuqXabmv2Hh6IjSP0ajWjFqo/NdCJ+ZCok4MeRgA7KXDpanYML0hw3Eoxpa05Rl70ySUMHkZXPszn38XtXiBFFrWAB/GSeMVyrpBj2oHvUVuO1b++D4XGT3Yn8ZCOS3Sha1QzGuN59b/NCA8FYX5l1g5aOLu4WW5+trFCwLmrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786886228; c=relaxed/simple;
	bh=HNgZBr3EeTP1wU3P8wBuPpWgexNWfQ4T9Evbyc1n0kA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BGC6FV5n1ND2xq/bEFOpJWcuU5eH9/O2XTVnTv8r/lPyKBb5F3TeTYogTzNEFEbaeFU9rTLGOYIIilL+x/DvH0TyICZB3t8aVZ2mhZT8bmGluXC0TMIqvm5faw74be6mda4FfeNM3aVYiYd7+cJvAUVUFB+550y9O9XDWgZUyEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVv9j26K; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVv9j26K"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so3340606a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 06:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786886227; x=1787491027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/58bF/vICIzPMoSzDV9ymm4CY+7nbZT+jsoNpyPGqcM=;
        b=mVv9j26KD6ekbRHCtYA2tPSDmGnHlPr2wt2HBNa6mLSz5loCt8OZ0oEDIeoBddnSmw
         oSWGzNsW1UaJecWOpmzn+tq3z2nHvundQ1dGAXDAI7m5BaVGfPye15ffziA1/hgHIYhB
         gPhROmmtyLLpNVX7yGafOBCZo4Pa81G7RSuRexdDhSiKxIkfapy/lQyUzLGoaxK2F9Bf
         moJ1DD2N3Z7lOPEPiZAUgwiA7GfRGrutDKTOKWctx6oywc4ota2vAUz6VbjA4wWClFiU
         zhaqr8YvmiVyP+UU3z/ySrRtnSfLJI/1N4emwFiQmI4kdBS83/Ybr/6wK2WSUwe1rQTd
         AzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786886227; x=1787491027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/58bF/vICIzPMoSzDV9ymm4CY+7nbZT+jsoNpyPGqcM=;
        b=m9YBjAcp/5aOdg3WtlLzWAvstctFP17jFQ1nocGj4A7LJ7ls7+u8U6j7NzSPbBvqlf
         RsDvPGqsTYpVlBD29fxigJtOSi0wPw66feUa/Z4a36p5yU1txPu/pVSAS16uJcBb/GVm
         TkWU3N3Azk4lSkdWFUTppahoXGuH+4hoXATkuhGUvxwQdjiJPX7D/5J5ZmhbJdRfJXr/
         d7aDqet0zsff+Z8vVgcEES92gdJ/4jYHTZTFN2BQKKred8MIP1kR6btUni2wZ+UMKSIu
         kB1ID9m2Bh0Wlc6omqfqn7GZBOltB8A6aNjk/fVFjSK9aqQklIVJdf7tCl0M5mN9iA+y
         J5Ig==
X-Forwarded-Encrypted: i=1; AHgh+Rq0oNeNW0TKKRCQV7p28QCdluwLRhdLrMWVoblRofcIl6wEFAUDuFGOFYJax2p0QUkPxMZKHMrEwjXfiKWY@vger.kernel.org
X-Gm-Message-State: AOJu0YybQsUY2E3Y/4ZK+Z6u1YiG49PBS+1/zsjOrKjcYU1tuM6XLJvv
	+qiAlTTE59bjQEEYn/C06fh5pLnioVxfsBrcNJKQThRSlRo+nElVf+lL
X-Gm-Gg: AR+sD10k7dOS1Ea2tiGDGfkVetRErnBUG4cBGFr9W1QCjLyjXIwwKDfVd+hOZy1G+kZ
	4g8Q+LZkvE7J2xcOYjPr2ycjTfAcxHRXPb1Lj35MEHhVQDgtM0pcrc4mVODvVi+Gvf2m/zAHpU1
	0fLoEDRMx+pqy0MdifZvczg9uQYjwwx/w0l4WosE0+s0FYh+ap28cwnptrfeViVUbp2OoYxGWX8
	TQxc8+TMi50jRm9mtFvXXvup99z4bLH3Wb0VZQPz4Wr2NsYO+AasVgtJGwD0gS88b4WbC36mij2
	czsmWPTa/PXHxuYMHd+ZcXtn0ituXUHUmSwPJVkbl3ShUxwMsiTPmeSSaoH6q6V5Jl5RhLVlqjc
	i0AJc5JkXGnNOTXWu4JHR6kpySug4Nuj+Yc5xr+hElu3YzCsMH3ZdO6rSBH8//XSW6HE6Fd0cQy
	OWDdLOY79qJDdHCTE70khVD+yIEFdJ3aHjqMQ0wmLOK9RBTX2irWiHmmGzdupGBCtepOPS8UIXA
	74Z61RRmW5YuJXO/Gra9Do=
X-Received: by 2002:a17:90b:44:b0:38e:2e16:859b with SMTP id 98e67ed59e1d1-3933bcf395amr21446963a91.20.1786886226833;
        Sun, 16 Aug 2026 06:17:06 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413887e3e7sm29235330c88.9.2026.08.16.06.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 06:17:06 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quic_tdas@quicinc.com
Cc: bmasney@redhat.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 0/2] Add SM7250 rpmh clocks
Date: Sun, 16 Aug 2026 13:16:43 +0000
Message-ID: <20260816131646.10551-1-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm SM7250 is known as lito.
Add the RPMH clocks present in SM7250 SoC.

Sreeshankar K (2):
  clk: qcom: rpmh: Add SM7250 rpmh clocks
  dt-bindings: clock: qcom,rpmhcc: Document RPMHCC bindings for SM7250

 .../bindings/clock/qcom,rpmhcc.yaml           |  1 +
 drivers/clk/qcom/clk-rpmh.c                   | 24 +++++++++++++++++++
 2 files changed, 25 insertions(+)

-- 
2.43.0

