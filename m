Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E238372B57
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 18:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789322652; cv=none; b=TGqthaeoz6fpDPCq8OdrweUC7Emlrbm8FKJTpLOsPoO+Bx8N9D9P4u9WOPoEJzpZyYl2kKohHGkM8wmkmS1+FD96N2z/mOy48gFrkO2ISb+upZOYbKwnRwpx03oxmKgeFay7pQO1mlDqP38oMUdGtRh2L1djOy+i/Nx5kyZhXdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789322652; c=relaxed/simple;
	bh=FpXuibbgunUKWku75TCdJBzKVddhMIdiIekGxKU8ED4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qnC6Pra0Sy7QTrig0gCaKOwuGuugap59ljLTmj2+PFyk1ItqOKzm5DrJMWJuoA605wTXx+2TKC4PWLyrQ6MjJvrUZeIRtt2qlwa+oyEDbd3jGGD8s5jSzCfUPn4jCEbgO/StAMGvNNE7WiC7osjhCmANjI53iOcRUFRdp95kZLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOWRQMoG; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOWRQMoG"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964e7720afso1796524a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 11:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789322650; x=1789927450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A8Z4lHNbz+UeURqdjUe4LqKVsnHKdKejzDleunOFUKQ=;
        b=SOWRQMoG/GFtg8k5PH4k9x7bPTQZOjW9Lba7CBH9mGFy6a6/bTmnC70LbsxRFcBHmc
         Y3n9o0YyEs7KURAtLmEo8Z/dGftKqwqBxa2jVRIqIvKn6/ZUOs7d+comna7A6h14q9f1
         HNUi+VxU+wdHvKWmpyMIftHma/15Z3q2R4jlS9lr9gF7YUGWFAVTO0ovf7obirfElJI5
         4RO61gt5nKyDACzWx7JaMoBg87azmhEeCxJQ7iPSYh5149nQGyF6cICAAqk923ZuYTZj
         5+xTxF0jMnNdxuV0VDuwKFK2UDBxR21t7kH3eIbyvEIt97hDcGnHAsDTUxW08m8wzvEn
         i8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789322650; x=1789927450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8Z4lHNbz+UeURqdjUe4LqKVsnHKdKejzDleunOFUKQ=;
        b=i8qRhTC7erfs7+/zbDp7MClxJSeyDJmZgfjEG3mjdih0oVHd5Vxfse9Rxk7IyveqRD
         QCdvXPPhKUCZjsaJ/UH2akCxrW6BAY7H7WKBaqE7/sroEPodALz8jxaDM2f12UoJmNc/
         btLRjb9E0fDlsyTxo6La5Tx3WG5p7TT4NbO3sfMVqoqkJHBc6xvhdQJoRFxwWeg3SUy5
         RfjMnUWBiC5mrGTrl0A4lE5OBxcYjMUTY0bMQYRPAFyy92b7oKoHHPb0udRrWOkZWzD0
         09JtJeY72k/AR+5K97C7aYkXv/eQXSH07yaBN5FmOD6ihVbz8QWjpJfM5txCReRVZaav
         oiyw==
X-Forwarded-Encrypted: i=1; AKwUvBwwFgRXJQPPfyk7QtwUWNwJyPBdkvJDA3BVAMtxMdwBFver5UgbOSzzVIxOTqXbYciVdQtocjm/VPnl/LEC@vger.kernel.org
X-Gm-Message-State: AFuF++miFKRiPCrltwHIoUhhuujuL+2G3zOKwSmHcFvYWl85uQ2dgINJ
	wkt9msKPY8i4BmnDau2+sfFUUtzZizxm3QsiCNn58wIYOu8xt8A+K/E=
X-Gm-Gg: AYBFou35mf+UHqfTfAw4KNWv1yslTE9kbTfbL1+sgL2IanFXuVbrTQm+EZAIKo8z+J0
	q7IQxUhz/+NrvjMjqWoQL6V7/6c/BTWNEym2wC27N6EQuDPaIDNNGm4Jxo8wJj7okqeFDqFjwly
	XOxbp3Ys/SmWMIcTdiZAm8qMqrniJeE2ycmSfGctg3o5qJb5uzjMmNtsCyRbw3tmKSpQLfZ2nws
	EHqjf+xSMirjwUgi45Z5k8daJvbv3rtUCkYR3rfQN60ee1Vm153dXa5y7XltsnzJSkA1Pg/NNv1
	vAqr11LNRlmNBjZZvBcO3LsuBaU9/JL4PAXmPlRMwe2TWlRLqCizY/2jbocuMFEo9cF8SIfNv8s
	Ui6htvhIuk+PzOm2rUBf1xqsbvV/e6ajC70oYxGowpH/HgaPftxByOJwMvJ8Ze7X1ka2GNblHFB
	enjQ5a5Mx+RQrD8+RoJcp7ky0tSXi/0eDtFBag/O9tWy4R9/tnxM8s0zUw+pcnzdoxD3pvaolh7
	nWZ+r5xppcfBlY=
X-Received: by 2002:a17:90b:3ec3:b0:398:9c00:29ee with SMTP id 98e67ed59e1d1-39dbc6f44d5mr15199601a91.22.1789322649797;
        Sun, 13 Sep 2026 11:04:09 -0700 (PDT)
Received: from murali-Aspire-A515-58PT.. ([2a09:bac5:3b24:1a8c::2a5:ff])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm20636958c88.3.2026.09.13.11.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:04:09 -0700 (PDT)
From: Murali Krishna <muralikrishna2444b@gmail.com>
To: mani@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Murali Krishna <muralikrishna2444b@gmail.com>
Subject: [PATCH 0/1] net: qrtr: fix coding style issues flagged by checkpatch
Date: Sun, 13 Sep 2026 23:33:41 +0530
Message-ID: <20260913180342.8948-1-muralikrishna2444b@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This is my first patch to the kernel and I am still learning the
process, so please forgive any mistakes in formatting or etiquette.

This patch addresses a few minor coding style issues in net/qrtr/
that I found by running checkpatch --strict:

  - Fix missing space in a pointer cast (ERROR)
  - Move trailing "*/" to its own line in two block comments (WARNING)
  - Add parameter names to a function pointer declaration (WARNING)
  - Remove an unnecessary return at the end of a void function (WARNING)

After applying, both af_qrtr.c and ns.c pass checkpatch --strict
with zero errors, warnings, and checks.

I would be very grateful for any feedback or suggestions, even if
the patch is accepted as-is. I am happy to send a v2 if anything
needs to be changed.

Thank you for your time.

Kind regards,
Murali Krishna

Murali Krishna (1):
  net: qrtr: fix coding style issues flagged by checkpatch

 net/qrtr/af_qrtr.c | 12 +++++++-----
 net/qrtr/ns.c      |  2 --
 2 files changed, 7 insertions(+), 7 deletions(-)

--
2.43.0

