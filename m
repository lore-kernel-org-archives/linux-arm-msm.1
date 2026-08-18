Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A3941B8F9
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040522; cv=none; b=uk5pATb1aPzUYk7J00VCy1QBBHATtMqqYDHPujQbsOZn+WJI4T5lQXVgmwoNFECofGjLrNCto+uyzl/9DnmooJSwqhj7d4YZoFE1105P6mMsX96gcC6SxXBoYY/YYaoqYk4oDAAJs46zCA7SDiKARuNYXYG410Ik0hveprFJIfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040522; c=relaxed/simple;
	bh=St8ucU3ojSXInIoaRiplnocZp7Q2Y7UGXGTdomltuLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MpgRmafGmhSgGic3YnHVcCpVDkiQZTdFc9ZnUAiYU+I7rOmHlV9DJ6KytRkYEdBHKkpEkkId1XpPIm5qFK+9ipqE/bUbRUNFZCauGsXGWMFDiPJuJ2HXsD2SPoEZvl7e53BdyTrEZV18q27iy7qT8IbpPK9OxvlXZlNPn/oEaSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bI6XYGs/; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bI6XYGs/"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d049069377so44802245ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 01:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040520; x=1787645320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/HU2YPUNtFosepQ51+dsKsorbBYkh3zE8nDrxs9nac=;
        b=bI6XYGs/BsTbQPfQw1cFnhLWv7COTDPyZ5g/Pw68p6BAToDUUV/gE6z3R2zuIkwSmX
         PzhEaxzm1omhRunR2Z4KS8nwLmlkqMXOmq5EjAVUeqGRlwSqvLuLsBy8igmNnHLPrAK6
         CqIeJj3iB7/427Z+viTXFzDUlFRGNI2Y0eKbpOrNcxx5OK3f1X3ZKhermACkBXkunqs8
         W2Ecnr1u4L1BBOb8VSLHZRQ6y2Hfe5uMrrhwCr0uzPFYX6+Tz0XfhgYskuD/rp/IPZXk
         TRf5Re2k0RsSxaFZhDp55aWvQVDEw1ndq1zVEgaYxGuIEuL2GsVxyylnCKTDdhie6IjN
         sANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040520; x=1787645320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S/HU2YPUNtFosepQ51+dsKsorbBYkh3zE8nDrxs9nac=;
        b=LomnYRxS+FO8sifcrASOkM5GExe7NMGf0MTgToNwUArxik5ce3F4Kz+p5nXmuTKB+1
         lafd+P3JolfELImGtVOxsQdjLAdJl21WuLiGno6NGiDAKj1VvW82bR+9ZLxLHwtF5Cqg
         +0SfuExti/Ghzy6vZn7iP2+KniTs9af/Ng4kS4K/zI+FVcYuu32q2jYHNMu1oifEally
         oth40VLpkq5P4bHRDuH7wy8Nxlbi/eprjTGL29W/REANXSH5YEJMb7zP/kb/F+aPlcfs
         UuntEn2aZ4pdgv7UuV8l51r/oidpgrOyx2vIRefCAzz91lER9XWH1PbZvQfHfi2HV4Of
         /Wfg==
X-Forwarded-Encrypted: i=1; AHgh+Rp0ICo83riCo4vrPZiwKvyFfFC+tD5B9tHjWfHY+Wr9rlRWUADl5Dvug5S6VnrYMcGcvU5YtOkeC6PpBX4N@vger.kernel.org
X-Gm-Message-State: AOJu0YynLRq46X/qZglXj3+BOkdbGtHRLHgFQYKH6wExRDq1Z1IZFHcS
	tBvoqE5f3y+rGvfNeZPFNJdFYZA12CWhAQav7Mqd4XGcsSRGeQGSDzf7
X-Gm-Gg: AR+sD10x40uQlyS7NQ/TNw1OOudlXO1o/SmBHr/nVo5q8zkHRYe1kyg130uMW5oDBpe
	+JMswE0S9j0M+lfBjplCRb2kpMiADUbzAFGQDPcs329tF9w0jhJ1TUCgHF65Rz5tJiGHUwv7s1Q
	720HlbdyeDiuHis8Al6iXfMjoifpbDYIHMAtFxe5J5Zfp3ovn4MDJhb/bWD/5jf8QC7KUhgF+xA
	gSr6LCx2OasbmQBJJP21sm/MuU8oHsrVkI3bX0ljroG3QZU3Be32odEdchZ7CtTVVI/5zsFCi5x
	w58lUodQ4Qb6Oa3w4whJdR4I6fSHdFyCzBvkX6J2CQNBPvY8gYoIxUnbSeJse3ynFqGZ51FBi77
	WAjrEnczWbUOgRzxrMTasB6kD4kyC9SvNMkBKN6kJjCptz3f+nKgEtDTMZRjhthrcp/2Un/mdZb
	AnsCq6zKbJUm0kS3ENGVxQ8taMeeAu7a+F2yoHYUr894h+4VCZmpVIn0qCgTQfnSzUyS14xnMM9
	Hzn92zi5bE=
X-Received: by 2002:a17:902:d592:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2d3b0d5cec9mr386376235ad.14.1787040520521;
        Tue, 18 Aug 2026 01:08:40 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:08:39 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 02/12] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Tue, 18 Aug 2026 08:07:44 +0000
Message-ID: <20260818080754.4362-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818080754.4362-1-sreeshankar0910@gmail.com>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC ID for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index af418adad..54b1f8e1b 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -449,6 +449,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ8172) },
 	{ qcom_board_id(IPQ8173) },
 	{ qcom_board_id(IPQ8174) },
+	{ qcom_board_id(SM7250) },
 	{ qcom_board_id(IPQ6018) },
 	{ qcom_board_id(IPQ6028) },
 	{ qcom_board_id(SDM429W) },
-- 
2.43.0

