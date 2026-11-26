Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728619;
	b=J81JuCGUKz9EQ4+wcF1KPBywEsk6Z1Ph/gkbBNMGV3h21AhfOS4KqOoAPlC+uu3s8AeZ
	 6rtagzkpoN3VybmxIv+9zB+CZ0R1HNG1bmFiv3ztiwIA5qD4B5Pjv4CKdSXq3cq0DsqX/
	 ReM4RXewLAuH8pFelIKPrVhjmf4OiajNgtef5K3gI1i9K9xcHHDyzwUKrHUYciLvwZj6X
	 9wtUR5YH7263Tnp/OB2tUw1m8wWyyhzvthGzAINQCiSOT89rxzvNo/tqt8fc1iKHuqqUv
	 LaEsRwFvHwP+yAetbrXdjI/+npuqm1DOk6KxcHSmmych+gWQ9m0861Vq3Sg6o8vAMqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iOPO62h/bywbh8sInLBXyMX7z+WqEK1+RUSrIN2sZII=;
	b=ZUdqlF5bIQ091v8nlsk2NOdfT+Oiz6gBesSq1EHaARB9++REEpywECz/13O7e0Kf19WM
	 LBx1hNx900ybwAkq/5VyrKNpmWgvGJ9/kfJfTRlTOsL0vNrLq8Ii7eZJiD+3I1FaPPrA0
	 bBVBnGZNfHi++UbgV/UpCq2UowNz85nYuLKCKS93sj6HgItGmXN00HUdyX7mS8MC3eaY7
	 MAgZBlc46mgdPe58FLnQdlWe6gJWphOFylpBOdi8Smm+CmsJiEhTq05HTNIleJMthuEhL
	 PY8ZvCPv1DMmk2WVYcVblmcQfwVk2g/073eW0lIlBG30CogEUun/8Xb0Bx9ehGJPbqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I53YA52V;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D179606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 21:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D179606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I53YA52V
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a6ce64b95so2640622eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 13:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795728618; x=1796333418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOPO62h/bywbh8sInLBXyMX7z+WqEK1+RUSrIN2sZII=;
        b=I53YA52VS7cLPkGcXcn3YJRSmNvOvESU6KsDMe5/nmW/v1W3Yon18BsQkYZe3KPKZA
         nH8Nar0mfXk2ugXmjESGCq6Ng+oTds1uE8CtK1dYDogmtWW26KNqpLtJSKXCfBZXq+9v
         SlAVBsK2G2kovZj3YqhFHEmegv+Tknc0P7LGL8sxMjUE/63SlWzlfjmLiyG7KzGVtyP/
         a64tF+sYGjZChHj9TG0x8vUW/jb4TvB+37bbXz0IgNpuLHfmgfkuGouTe1E5Dc/fNher
         hYfXKzSQwJuqELTvNNYBeah4PA0DHLtNQ1V92xO0OYln3F4HmNJgdfgMUs9vUtbmsQYE
         dRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728618; x=1796333418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iOPO62h/bywbh8sInLBXyMX7z+WqEK1+RUSrIN2sZII=;
        b=bMR73jOgDa80UOhbbx5H/wxaG9nhBrmUKrjPT529aDGRppo+n18YzE89le6VwY6msE
         RfiKGhvFrnSfIfc6qcgfkh/VKcgkC4P/Q5dtAkgnlUQYl5bnyJ0jvXfj/ro/xh+r45ZD
         UC/AvAxXJSsrdqQ1nchjZq0k7jY5daCt2BM5kGNPv+01ybgLRfEDt/aehmfv/ARiWDqk
         ZqSt5JUaDoezDvw1KPgkjEiVUMg6A8r9Pal9/Esjcv8RW1VGMzVewqVIO9jIZjainr/N
         MeqVSoLSNg1R/VKNOSSUyCGYO01KLNuc11E/Z2wu7KFnSc6E/s/BEjmmDQiv/SE8GcA0
         u3jQ==
X-Forwarded-Encrypted: i=1; AL+hErE/yj795F/jYepYOKEp5Jik2axP2CneHGvnkmsNiHATeTnFK//leVJrlu7nIX/E31pV5h5lKLT//HutWCrr@vger.kernel.org
X-Gm-Message-State: APuU4Z+/7y7LYVDSvOWYmc8DNj7S+7/lnFKn2EjeUMhLHCbJGHex3kQz
	pFrr+Pgk91xM28C+w32eRJ1jaxkeY9HmbV3ArnRlIoCREJnUm+JTViYp
X-Gm-Gg: AZFdTZdHTXTW+0uwSrNQ7ufAn9Y0X2IPumoHqf82x0/y4yhc6G21Okjs8ZprylmlMTn
	SNN3Y/50ry9X4lfnQtWrdf8P67h+eSi+3ScDZKNT6Fj6X21unRloNr71MSxjfU0oeqmwSzDKVu1
	nAKfug4tWAanX1V2temVCExEQO6GF3dzKGbuJi+PVuRpC10pv9tKs/a7L4JsVSyuxr5zgHpCGXl
	olFlUDr8PPeTpKDIO+D3Whv9dh+CFv7TdMvt7Upc8rVujjNuh+UPRPoS4x8X0JFtAlpVmJm026k
	tOu/XOfJo7FOVjAtj3s6c407sp8Ui0USvQlCHIGbmOs6DH1hWItygHG7Ezh2RoJkbC/pW4HujFq
	vr8KpRcKeZgR+q3tm3TH6FOPDRZxppuZzs6+zoCxmuvgBNjy3atVJEb4GbzKbtK4NZWhbNQKeb/
	bC4pf6/ahS6xofuD8CFNEvZFtDU4hrIboOsA7NYKTcoBneqCtYD5oxbR99Ky5nknXNu6VWzXtyd
	jvzdWR8tXinBacFY2Lm/HTImg5i6ba/0vjRahbL766roMbebvd0FzgOI02QBezVIwtC6ObNbqfV
	1b6Exl1OF27NiKfCkiLUj90rJgGdUethXbrJdXMOJoo7vMsbdWnBEK/npk8krAm4ZnYCVSaJ1B9
	+VRzaNXpx+mPS3zce3n4CjRxaSuvXpp33ZQWwVwPDziG1JNDJGn75WI/Cz9rGroM=
X-Received: by 2002:a05:693c:638d:20b0:375:c862:31c with SMTP id 5a478bee46e88-38571816d35mr21751213eec.40.1795728618321;
        Thu, 26 Nov 2026 13:30:18 -0800 (PST)
Received: from localhost.localdomain ([76.33.234.50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm33434219eec.9.2026.11.26.13.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:30:18 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2 1/3] media: iris: reject packets that are smaller than the size field
Date: Thu, 26 Nov 2026 21:29:02 +0000
Message-ID: <20261126212904.27207-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126212904.27207-1-dennylin0707@gmail.com>
References: <20261126212904.27207-1-dennylin0707@gmail.com>
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

iris_hfi_queue_read() only rejects a packet size of zero. For a size of
1 to 3 it copies less than the size field, returns success and leaves
the read index where it was, because the index counts 32-bit words. The
gen1 response handler drops such a packet as too small and reads the
queue again, so it gets the same entry again and again and the interrupt
thread does not return.

venus_read_queue() converts the size to words before it checks it for
zero. Reject a size that is smaller than one word here as well.

Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index bf6db23b53e2..12a7fd0982c5 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -81,7 +81,7 @@ static int iris_hfi_queue_read(struct iris_iface_q_info *qinfo, void *packet)
 		return -ENODATA;
 
 	packet_size = *read_ptr;
-	if (!packet_size)
+	if (packet_size < sizeof(u32))
 		return -EINVAL;
 
 	new_read_idx = read_idx + packet_size;
-- 
2.43.0

