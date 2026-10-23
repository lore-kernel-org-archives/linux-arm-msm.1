Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740738;
	b=KgTCY6JMuchTKUP5j0tmpgivzKF97D2XB0xrUt66h/E/b2352ZkLoLjdJ/P6TSaRsw95
	 Zibq/KtVcJNzfeMnl6ONFyAWOUWprvK/yCVzLPWzsPvU0PqJQ7tMvHl81ASbESh6PoQ5u
	 6BpAsm9b3OmpEG/dPHFB+6BLAQCGxkP3ZtEd0bec35PJSPhevlySdBQvLQDAZynod5ju6
	 sUdWF0s6mXI4Fb7kmHp7QNclfi2H39AdF/QsfT9PqK79VPc6nJLXa4/4UcEvyS3kOfCtt
	 jeyF5R5FlLarlNNCyHrerb/1DSZl/2GATibkFFL1tAKSHa5FKq0p/ZTMrtechSXK4Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bhnlngDTdPCRzQ3WfPeVfNn/5dfQaEbDCnTEYto+WIk=;
	b=p4kXIY1whaz+fc+PlnOlu9cPrcrGL0zmJwS1zaUpKG/mtfy8ytw0bejeDIZIusq2F4yb
	 9aIoRex/QQvgo33IHDaw0a+4iH3EPr+vna9AyPia2hssFSKHWJ50w1Khj4n5Ql8QHirNy
	 6OzGJBuDpFclJH4VfqH8qbFuoRidMOnYRyR624DKTE9O0eJR7RtFHnAoY7LpGyDjyo6fM
	 hfFMhGeimkEHxMyOlex8kDd+OGd+YywfUbt8u5G/hOxS+P4AcwKI/fC8QoQrTV7fKxd8a
	 w8aQrGBdkiDG7znVC7Z8XYgMMtY4XVCveAF0FedT0AwQqS7gb1vVWylC+40ndMWrNiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d1+eVLMY;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A58606A31B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36A58606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d1+eVLMY
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e985106c0cso4445905ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740736; x=1793345536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bhnlngDTdPCRzQ3WfPeVfNn/5dfQaEbDCnTEYto+WIk=;
        b=d1+eVLMYtXs0c/wY+D+8tqUVklOiPZV1r/PQ3RY7YaNYpOGlGBu5YWT9hIPUnww2eG
         757QD4qV6c7lJZJ5RJ5UOlExl+FgIi98uN3v8UJI7DNVTppGdY4WlABffWATu1IsP763
         RZZE941EiVPOjd9pcrvf/MTX9O3RH/XOaCq4sqAfkAMcAINYiciJw+lM2Z59dR2fnu/h
         D6FyX3YJXYYb9MvNIEpWgZaHxSGEfw8GpYWuWiwhyOgelg9KKN+ZNcTnvkMkTriGf9rj
         takfVi5mvcrHrKfp90V+ffHvQXZwdkHZWW5If72hirpLtbYLIEGlVkcG7+cl3jWNr+Ht
         kW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740736; x=1793345536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bhnlngDTdPCRzQ3WfPeVfNn/5dfQaEbDCnTEYto+WIk=;
        b=xNx4ZXFk2Cerl6CmgKo0jiiliMfCJiukcGvay2xi0J6LBmmEO5UwAHuF8jcfTZSC/R
         DgJdk9IUCVn4t3lY60O2dSEXmevZwQLsdEmkdQDzX/lyekLFrwHPP+dI18mJdSPUNTVt
         FvK7MMpb48+zfAxopbQab9SbscFrRgANqlabKN78jDRMpUJgpwcGs/6YirNBKvzD3XsQ
         dZRyNNRhoYx4mQcUHK7a015oeNnQ2Wi4gTApS/c+DXdtchE63r+FLiL+NhoKxh0ohJp0
         RPKQv0AfB8xmo4uffUQA/JciYrC5TXMqi3Th3osbcCLUVvvL93Cvyvw/VTNdxNsVnb/3
         bJjA==
X-Forwarded-Encrypted: i=1; AKwUvBxR5r4fGXd2L212d9Fc2qCa6coJg6EPhM95BakxOPFbcq8JWfVJSDzlyk1RGK2I6gD9MH/FMc4dusNYHxpw@vger.kernel.org
X-Gm-Message-State: AFq9FYL8IKdckDIFJGc53zTU3ZFDSAeNPIveSeezyleEXfpYUp/AVI7r
	0vUpyXoSizukwBH5gKvKgUiHpTV2BZYNt+wZfRknLBlFlDL0uU2ULy2F
X-Gm-Gg: AYBFou0CrAGbxNMbB/pSkKy3yUfXA8vmjXwo/1FulqxNq/J6DHtPh+wZ856rLivfKIq
	I4avF46Kam5d7iHRsgnEz5F2M1972FfdaE3D8Wyt2bFqTfI/t4iH0qER6b6u1wMbGuC1r44TVx1
	+NbUFaGwAmHdeB8W29brF7fpROATR7N43fNngo2IUtBR/W5mDjmYefyoyBkdgoRYv27iufGCAr3
	mPty20npHLw80q88rV3Y7CkCHAmEqWpBsfcse9j9pR7LscIARh6n97O9D9iVepMHtlXLtJx8/gS
	uZQtExNziFk8ytqmYt1rwH6r5Ibz7bvNn44bHTZl7ELGEpmSxZnYQuK0NatRbx0+wyGMV3/Xk30
	QdKemjQEhHATdeGmDhRbx4GgIHz1DL0p7+ny6qyckLfHy9M8h21dP9LbhYrFG7MEFO/piO5tm+z
	OddmVRvMAI/nklecR/sF9q90vBzYk+IgoXzLj9AV7bSq6qcuzBGBhFJx2fAd0hw68Vh36kgpaKK
	icPUWoqnuI/PxLs4DJQ/80LldJnnuTaONho+oRkFCAlm7uooxN4al1dCTI6i9O+YXN20SDYHOg=
X-Received: by 2002:a17:902:e547:b0:2e4:b112:14d with SMTP id d9443c01a7336-2ea7d132e9fmr13812005ad.54.1792740736475;
        Fri, 23 Oct 2026 00:32:16 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b3a8cfesm6769735ad.40.2026.10.23.00.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:32:16 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] dmaengine: qcom: hidma: fix wild pointer stored in mchan->running when active list is empty
Date: Fri, 23 Oct 2026 15:31:54 +0800
Message-Id: <20261023073154.744365-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Wang Haoran <haoranwangsec@gmail.com>

While auditing list_first_entry() users we found two call sites in the
HIDMA driver that invoke it on mchan->active without verifying the list
is non-empty. list_first_entry() never returns NULL: on an empty list
head->next == head, so container_of() produces a bogus non-NULL pointer
into the enclosing hidma_chan structure instead. That wild pointer is
stored into mchan->running, and is later dereferenced in
hidma_tx_status() where "if (mchan->running) runcookie =
mchan->running->desc.cookie" passes precisely because the pointer is
not NULL, yielding an out-of-bounds read / memory corruption.

The list can be empty at both sites on entirely normal paths. In
hidma_callback(), the completed descriptor is first moved from active
to completed; when it was the last active descriptor, the subsequent
list_first_entry() runs on the now-empty list. In
hidma_issue_pending(), a client calling dma_async_issue_pending()
without any queued descriptor leaves both queued and active empty, and
the "if (!mchan->running)" branch then fetches the "first" entry of an
empty active list.

Fix both sites by switching to list_first_entry_or_null(), which
returns NULL for an empty list. This makes the existing NULL check on
mchan->running in hidma_tx_status() effective, so the paused-channel
cookie query takes the -EINVAL path instead of dereferencing a wild
pointer. Both call sites already run under mchan->lock, so no
additional locking is needed.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/dma/qcom/hidma.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index c939635be..925c912e0 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -176,8 +176,9 @@ static void hidma_callback(void *data)
 		queued = true;
 
 		/* calculate the next running descriptor */
-		mchan->running = list_first_entry(&mchan->active,
-						  struct hidma_desc, node);
+		mchan->running = list_first_entry_or_null(&mchan->active,
+							  struct hidma_desc,
+							  node);
 	}
 	spin_unlock_irqrestore(&mchan->lock, irqflags);
 
@@ -238,9 +239,10 @@ static void hidma_issue_pending(struct dma_chan *dmach)
 	}
 
 	if (!mchan->running) {
-		struct hidma_desc *desc = list_first_entry(&mchan->active,
-							   struct hidma_desc,
-							   node);
+		struct hidma_desc *desc;
+
+		desc = list_first_entry_or_null(&mchan->active,
+						struct hidma_desc, node);
 		mchan->running = desc;
 	}
 	spin_unlock_irqrestore(&mchan->lock, flags);
-- 
2.30.2

