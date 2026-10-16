Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF6645EF5D
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 21:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792187323; cv=none; b=cYOTnsoZdCQKv/rDX5AT9JEtwktTPb6UywBcR0z1NmEiKvXb2UQASKHhoVPCBLUJc5uQK2PcgBRbRZZqIrM0uvcQTxj+ZLOKBvhlFpjTEU1bmUE7fFfuhTViltFlDBBET8/IAg8+5nD401IKDa43aUDJrhq6QDZnm6TFeTJmqHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792187323; c=relaxed/simple;
	bh=vHDTCK2dGVe+D3aHp5cDy0Nnns8/vCBii2fB6P4rL9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W2tMlnnJAQbP5L6A/HDTyiMMR2CgiGO/jTCxj5JrOS2/fbZo0St8llKXNnXe3pRExHrshQJRZdBnwHHOC41OjYocoXqyUba31dF/sDesw9nS+ZTnj5nJbpE7NxigD9E7rnH/1cbEm+rdeGDrnG6dkkWuTJpPI33mga7G6HSbX/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0/vIQuh; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0/vIQuh"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso217318f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792187318; x=1792792118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHDTCK2dGVe+D3aHp5cDy0Nnns8/vCBii2fB6P4rL9k=;
        b=K0/vIQuhbLaq/49N3SaAx359tDZUVwG7Ptb/KMX5EZjncgZXchJ+TbW/HBZtTbQyMf
         5gBvrFDtfcKGmccaF20POCr9l0uRoju/inwvt4Lwdm6pXJSVJpRBLQcVVhJaIa4lOTuI
         05JlPBzCZZXc25PsMzo6yPsUt5ZzDPFWYHioutSLP8T/AuBo0VyAAh1kA+sFM4UGfmzU
         MxfqTRm8N/Bxlwkw3CCJDSWTAFrjXzCGO2J85xwcjx240SLc/JE9guH3dR9XfqELT1R3
         yRz/bnV8JTXAhGtECvLS4M8IRQ0Trdi4eNOKVFmgvW6RhhXQYohGJZdIbeTWNsdIrcTe
         8qtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792187318; x=1792792118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vHDTCK2dGVe+D3aHp5cDy0Nnns8/vCBii2fB6P4rL9k=;
        b=SWIOHoHxILkavQeuq+cHTBtZZ1HjoTp1PI22+NCQZzCdNZR77tBgE+BCd9bCQHRA2j
         Ei5Gb7ctamdaVlzjzvqIfwbpvbcqsb6BIk1CuCj48quCrznsyjITzeJ9yaoDUjt0a8dE
         8WFWKbz8gJNfa/G3WgSuwyHc3tBwga9FzAtvLXHo/I8luCppSDva/MD573RyvX4rfTY+
         6mVSP8Gzw5ZTW6y+seE2xU6cel5ugQ1knW+NF0bySvI39N16qOFjGbSlOpuo7kPUNQWh
         iRFYMOrIA0yVHf+mpDPcw153778Bjjp3qVZ5onpvneGDvmDUtFlOGr7iUFRz98NoKMbz
         m48A==
X-Forwarded-Encrypted: i=1; AKwUvBxxD5DBnnCljt2h9mq5NL7EH56tDgHU92Te17p05FaScCBF1rNKhqZDpj6MKnLOFQSYVlCVEB2F1a5nRQr5@vger.kernel.org
X-Gm-Message-State: AFq9FYJC7aEQQVJYQiVcRTKXNDsJ1xxghkmm/lK8CgadxTi/lHA9UNDs
	wFG3UguOkoAVNDmeiH9z5MOMshB2KzEv19SCcKTJcAAGQ7KBvB5TDJMW
X-Gm-Gg: AYBFou3UnYmtkfJcJg2WC/81iA9mRzq6JdwUuPm6fRfySxzn9qb+9RpNuHKSsWW7co8
	VwT08cFxLBqkFQ5u/kdv8xLvIkWSbZE7KRFR7yVsEzbNyADuaPt0uy467PRuS2P0c2XHmMObjab
	b/1OZIE7vbWn9eSSte/5BzKFGFLtYeI41OJKpv4ikQTlNuv2NDE6KePk8JTQqNg8+Csl4KmMHHq
	rlOkIszbHOW3l0rEvfh/vdDIo1a3TzDCM6hBj+XBeWm9PoYnlNun8NZU5HRPF5GIhysKiWBN2iG
	pNUApOpao5vAIIFjYDry+CKrVt4n8Xl1TdB4tV0vv1sAhcapDFRktsNunCgOp7GZawBDun+Q4t2
	dSZEtaTMxhyHNkwWLlAFoGFXcg72OPhXZ2yylfbsECz9EAAgfQiPgpC/CweoQRDc/19rAywTpHR
	AFUCOeYof6HHbzXLt/lPfEuqJEWLCjEBzwKhm6pbKjb6sP8A6ySMeOQ5g9Rfy9tivO/qAnipcAl
	1l4kTdKFe1ua3Xg+9lI4ips6kEs+ij+G1N+I1d1eHZ/kieJQsfKZklUtAQq8SRF2Qc6mdbO
X-Received: by 2002:a05:6000:3c4:b0:486:fb08:2353 with SMTP id ffacd0b85a97d-48e07bc3e93mr1724560f8f.31.1792187317851;
        Fri, 16 Oct 2026 14:48:37 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a24sm7557302f8f.49.2026.10.16.14.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 14:48:36 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>,
	Bryan O'Donoghue <bod@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	Simon Kruse <simon0x+git@proton.me>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: ov13858: Add device tree support
Date: Fri, 16 Oct 2026 22:48:33 +0100
Message-ID: <20261016214833.967344-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016210802.60605-1-lsa.uz@pm.me>
References: <20261015-ov13858-x1e-v1-0-acdd918f4fb6@gmail.com> <20261015-ov13858-x1e-v1-2-acdd918f4fb6@gmail.com> <19662dcc-4a25-4d18-a3bc-6b277bd676a6@kernel.org> <20261016161618.209290-1-geocausa@gmail.com> <711e8518-5054-49ab-8432-346049a86cd1@kernel.org> <20261016210802.60605-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sergey,

On 16/10/2026 22:08, Sergey Lebedev wrote:
> Please make that v4:
> https://lore.kernel.org/all/20261016210246.58562-1-lsa.uz@pm.me/

Thank you for running the suspend test, and for tracking down and
fixing the stall. The next version will declare v4 as its dependency
through b4, as Bryan suggested, and will not describe system sleep
handling for the sensor.

Bryan, on 1/2: the next version also makes the clocks, supplies and
reset optional in the binding, as you asked.

Before sending it I will rebase on v4 and run runtime PM cycles on the
Surface Pro 11.

Thanks,
George
