Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56C24219F2
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 22:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786488683; cv=none; b=TuSl/ypY4hCc0RviVorc+iefxaevvF/FlLvFvSYa5ySYCUkq/YzEkW6eo6ES7GweJuG1zrfLO9zUIdLYyvUW3os87OGbNDzQadxtTZ4IOfsA8jgc8mRIPjCdB5QbzUJX6PUczErtLZH+toYmiR8qlBzotHcQSDV+Nz5QCD1PCUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786488683; c=relaxed/simple;
	bh=vYfhyC4OO8mWaELc8/W/kMF7s3rYjL4xxMKBsGrsZMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mWkiwYleeMx+LNmb/EgdNZxgE9lquHyovRUSEGNCUF+GKBQP/gLoAMzN21dlvS7B4RKw6aks6DEL3vuiJ5ZJAZ7c5jdjlsT7QEcbvORpxyDBC6d8mlMoygt6CHrt8X2keDXMSlnqpaav1QCqlkxi20ArAmJhsPfalEemft+Vuug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSGbXB3j; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSGbXB3j"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6ae9b721927so268440eaf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786488681; x=1787093481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULj5VW1UWlM8YYUcQzLWByRAMMT/RaKzn22tl/DU+7o=;
        b=aSGbXB3jdc0hfOzRQW2JKWnAn2r3E2YeT2xVKjtynHyTwMnx1ncVfQWe5CA8kdAU0Z
         n7xELf3/N+S2OJPgur9UUMli818gtRECX5XadD61i8qmikds0UVDZPvdgxS1P5jbPlem
         FFcNRmJtrW7FcqYXaZZ++pss7l+Kf/I+gPUQ7Ug5bF5D/m4KQZ2EDp2iQgW6ea+1jpbr
         fNsqNmpunhGYmbxHM0ljtxWGCfo1Gk4pDCcJrLMakWmkmJ8LOx5Q/i4rgOYECV7ZjbDB
         CSpdBsabKm898Ephs6Uy2MIJmrE11cP0UvJ69ygyES7r7Z8KvzbV++voiJgMu/O1FIdX
         uiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786488681; x=1787093481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ULj5VW1UWlM8YYUcQzLWByRAMMT/RaKzn22tl/DU+7o=;
        b=o1bmkc0RUOQnpFdIxWcKrs6Zchcjm+7IbBjN1Ef1M19o9h5L+XDEHDFMf6W+m36alZ
         H8nB+etkJkIE78T6Njn9o6kmw6gj6k8GCAIfoVg6TSMP3dzkfVO/3j3AdDUEHgkzVnIx
         B2BtvD6a0WXmadHbG9l0MIJB4FhdQ1iF9qr3y7wG6RRmNpuP/gKqsGLpvQwPFTfwBO0s
         TBbzH+8/l6ZAYHvMVSBet8WVQNRaoIqkmi4IKovSTkVlGisQ/fWi0mtunyk9KpokVS+W
         63SO4F6a+XMBRx9VZdzc6GFKxG3G7xfgpiiZ/Y8gvFzpz/FkQujdueMbRvA3HPPbpG1P
         SKFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3Ee5ZRU8HFInQzt93WtmWn6dVSX3oHqGYgTJ/3bP/HmszJk9txQkzj66KvZdOzL7kYnIaqk8LuXM2/DCf@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkc3sXmS41BX58wzKlMVYm3/mtDbM4YsZ0BRexpMvUjX8ASPrV
	bstyQcCgE8E50c1UOdnGZQuuz7Ic0jVvr3iDFjjYZN1V0S1Kd35TLZRr
X-Gm-Gg: AR+sD10DcsOckno23kjoXalS1TgeA0bDLQ4yLYqivfuOJtWNmTFlS9M5J7CrHctOymS
	7aLdH/kMomIrHc3MJ+paLZ93AN2Y3iLCchDT+akJ5YBljsRQ8GHnuYviJV6vmSDl0rhSacID/La
	jmkJg3Eg0XdlEyT+0OHsqxRRjvlfDwiahneh8F1zZ25fGpsbq72HEDF41e5V3QBJyXRyZJKjbcf
	o3oCxT7tunJPUGyJUqU3nUtJu6Li7OO0lB+nkwWGHLunOx/GBbXvFto2rCvXmJehmApiVogm2jL
	W5e5FvosBHRV/EKNtETY2w22sTK4FfDg3o4vwwCho0HuovuHZpoZykuJAlVKqeAle1iW+KcDQ9l
	Q9wi2d8x9CJf87PGd3AYDtmRIVBWFtcFusrPyUZm2j4nKwdyg0cONyHAydj/wZEbhgRl7DXAkhR
	1K1PBbfbKHcSVhPwPSFSOPiTiRUBmbHlMYjUXf91AjMQ+r57LFypSZIHa15l3dyRelCrCxbtO2F
	lna69AjWs/7RF1Ob0c0tduE+KIITQiBlnTmNPABuWI=
X-Received: by 2002:a05:6820:3088:b0:6ac:a8ef:9a86 with SMTP id 006d021491bc7-6b0b2673790mr405371eaf.15.1786488680805;
        Tue, 11 Aug 2026 15:51:20 -0700 (PDT)
Received: from LAPTOP-DPAKMOI4.it.purdue.edu (pal-210-106-74.itap.purdue.edu. [128.210.106.74])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3b3475bf1sm1019766a34.26.2026.08.11.15.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 15:51:20 -0700 (PDT)
From: Yifei Gao <gyf161023@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Abel Vesa <abelvesa@kernel.org>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Yifei Gao <gyf161023@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] misc: fastrpc: fix double-free in fastrpc_map_attach() error path
Date: Tue, 11 Aug 2026 22:51:01 +0000
Message-ID: <20260811225102.1077841-1-gyf161023@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806235056.456341-1-gyf161023@gmail.com>
References: <20260806235056.456341-1-gyf161023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

map->table is assigned right after dma_buf_map_attachment_unlocked()
succeeds. The two failure checks that follow, the len > map->size test
and, where subsystem VMIDs are configured, a failed qcom_scm_assign_mem(),
jump to map_err with map->table already set.

map_err manually calls dma_buf_detach() and dma_buf_put() and then falls
through to fastrpc_map_put(). Since that change the error path tail is
fastrpc_map_put() -> fastrpc_free_map(), and fastrpc_free_map() already
unmaps, detaches and puts the dma-buf whenever map->table is set.
The two operations therefore run twice: the second dma_buf_put() drops an
extra reference on map->buf, and dma_buf_unmap_attachment_unlocked()
dereferences the map->attach already freed by the manual dma_buf_detach().
kref_init() sets the refcount to 1 with no intervening get, so the final
fastrpc_map_put() frees the map synchronously and the redundant cleanup is
deterministic.

The len > map->size branch is reachable by an unprivileged process via
FASTRPC_IOCTL_MEM_MAP with an fd whose dma-buf is smaller than the
requested length, before any DSP invocation.

Route both map->table-is-set failure branches to get_err instead of
map_err, so fastrpc_free_map() is the single owner of the
unmap/detach/put sequence. map_err is retained for the
dma_buf_map_attachment_unlocked() failure, which is reached with
map->table still NULL and an attachment that fastrpc_free_map() will not
clean up, so its dma_buf_detach()/dma_buf_put() must still run manually.

Fixes: 334f1a1cbe03 ("misc: fastrpc: Use fastrpc_map_put in fastrpc_map_create on fail")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Yifei Gao <gyf161023@gmail.com>
---
v2:
 - Instead of clearing map->table, route the map->table-is-set failure
   paths (len > map->size and the qcom_scm_assign_mem() failure) to
   get_err so fastrpc_free_map() is the single owner of the
   unmap/detach/put sequence. The map_err label is kept for the
   dma_buf_map_attachment_unlocked() failure, where map->table is still
   NULL. Suggested by Dmitry Baryshkov.

 drivers/misc/fastrpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index eb6c2a78d3c7..d480a87752a7 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -881,7 +881,7 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 		dev_dbg(sess->dev, "Bad size passed len 0x%llx map size 0x%llx\n",
 				len, map->size);
 		err = -EINVAL;
-		goto map_err;
+		goto get_err;
 	}
 	map->va = sg_virt(map->table->sgl);
 	map->len = len;
@@ -904,7 +904,7 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 			dev_err(sess->dev,
 				"Failed to assign memory with dma_addr %pad size 0x%llx err %d\n",
 				&map->dma_addr, map->len, err);
-			goto map_err;
+			goto get_err;
 		}
 	}
 	spin_lock(&fl->lock);
-- 
2.43.0

