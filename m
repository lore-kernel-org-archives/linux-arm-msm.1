Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB695371D01
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 06:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761869; cv=none; b=n7dFd8sbh9maCcaNDim5RXkZ13SuNU8mRJ+11+qxiWHiQItm65aO+oK8o8GLz2AsFMShrkwcF1tsvqPIUMzo5kEaJ4CJ7ycU3epP5KLIcg2C7xGFN620Y8Lt9N4LdCNFFq2za9cYEZoOdOglvbMkf6UZAKJj+g70s9pBIpsjWZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761869; c=relaxed/simple;
	bh=jOjM7SBGhUNBW0tMiEXI5jzBZE09hCfhMS/vfI3fl/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lfk5IfN3Srtq3xCyv2t29d6l3Y0vpBJ7jRVw8YLiQV1Nq2vrnzPiGd/Pm1W3UFpCJY+4CGl/0DjQPTGuv2XOkvXz6ut/itNyek8BS0FYntFKOTEtuq8rwgYfo7aAHw1LjQntEjj/yux5lgyrr2cojfZw+eSlK9XOtaM/FUNmDys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FndKQ5jG; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FndKQ5jG"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc1cc1b42b5so3273681a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 23:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788761867; x=1789366667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WseEz/20TSbBX1bII7j60WtDDLvX3G7YJZ8cHNXpxjs=;
        b=FndKQ5jGi4SkeaW1Gn0NxCydgYVttxgEHRTQvPiRghyzHzUtafCr20k+KOQRUnYPFO
         hvCMJ5tIekH9S72pF6+7Q8LCHTbXK2AntxdF4DcNwLPBzQdN5i5tRmJ5XChszovpSXS1
         DJ4b0oojWPd7vvUDeLiExfNkbEezz2zgF4cZ8G2MqpsJJlGDB6RvThrZ8CiPTvdFSjwd
         b8/BS5cbjWs5U5wzl4JfdhyFHCJieK8L1wIcesjtAbsLL+4UHvCStWslQBiy3LieXaPe
         Bkkf7bXl4xJ591qcSMuSRqu2BaIVbfBM7JDUI43pkcvgGhaZqlihBtY7xYw+CVeXmn3p
         8G6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761867; x=1789366667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WseEz/20TSbBX1bII7j60WtDDLvX3G7YJZ8cHNXpxjs=;
        b=iq3oqIIeGbaVt1uJwZVOlNnsLDt9qB++xBGELYGoUg1zjALP/muv8p0klzE2Ura4f8
         1/eG4scfTwmHOtE4eGpEmvPXlFCIMcK9MhGJVbvLYlb8JIofM0mq30bTmKOHudAo7IXB
         SR5mxYS0BLrCAIAuwf5HIuaqiOY4vFQJIMqo5UU/QTVTOfF1NL2TpahEjwkd4pDosNVA
         6MXZV+REjO6s6S/liilguMFUnwsdbevHLIPYHP3PvJQLiAaUQ6P2ETeM7b5T4LKDC+mX
         ngv1xwWAWpqENU4c6W588oWM/tI9/wXfseRdddqkvfblimTVbI9dQ73pIpRRb7POPHe8
         65/g==
X-Gm-Message-State: AFuF++mUi9mc4g/Nrf3TWY6c/3TCxXdObdVnoxn5bIkiTAT7PgoENwBd
	czXP9qLOdL+D97qR+lBKBUpK9I8hfOpYfgJWfVRqnYaMqkBdxbMeVdmH
X-Gm-Gg: AYBFou14KrUeXPZeGBf9e+v/Ht98r8gqoYkENbEvMU6jGMaAH0wlkPho8c8z7i5J9gp
	jSeEGgp5svXtqcsohd1DeV9ICwwg6gnbLkdwv/pAFTRlDYQpv3L8zAtz5XFshh7m30l0zr60vj/
	65nk98Ow0FJdkxwgE5576E8Cf274IyaTQPb3XNiJRIJcV5y/BZMIHsoGiqIe/rihubqtpmM3DH9
	Nkl/vuS5cqRnOLo9Wgk5yWnucKtF8SNjveTurLElxkV2lBlfqXRJytpS4VWJYnaipMf4QMRtXIO
	pMpIQWLs+lNMu3exNCAyTXji48a4O2HyL0BHkis55SAa1x6rY35Pmxqrne0XMLsWFPmx4+/erpc
	roaRfESbsAlzBxVj3lJTPEidgmIBhSRGugDXU0FqY/HxyNeiQZaU3Zze7WitK3KCXQdTFBoLyJl
	gug7SsBx383c6B3/Abqz01LBxImmtYyyQFBq/R3l5QigMIUFOcy3fiH9XsDoz8YWr7nCty/oVB+
	V2Ic36z+FFgAQ==
X-Received: by 2002:a05:6300:2211:b0:3d0:ba81:79b9 with SMTP id adf61e73a8af0-3da39d1879cmr36321921637.12.1788761866864;
        Sun, 06 Sep 2026 23:17:46 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm24275961eec.22.2026.09.06.23.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:17:46 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] firmware: fix typos in comments
Date: Mon,  7 Sep 2026 11:47:40 +0530
Message-ID: <20260907061742.10954-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings in comments.  Each is a separate patch so
that any one of them can be dropped without touching the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (2):
  firmware: qcom: fix typo "uninterruptable" in comment
  soc: qcom: fix typo "upto" in comment

 drivers/firmware/qcom/qcom_scm-legacy.c | 2 +-
 drivers/soc/qcom/qcom-geni-se.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.48.1

