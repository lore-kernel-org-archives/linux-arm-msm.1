Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795772102;
	b=I3+1MW35ZBh38otszyGc+iYzXKQAls7kk0c+fEPrgBuagQBfgT1eFRhIkPn0b4VHEQ3L
	 PoITFGIKuFJUDQrnVR4QvcWtveqeAKj3eTDsZq1I8GRjZ5VLmBUdYrwn8ZbQtP8uPSDaz
	 240xBK5FuKIL+rkC2lPbk04vEF0iBjp2aevh3CiuTtClio/S/8g8aiHDHthLsPm1MAsCC
	 UanfxeRNZodL6RjHQ7vANjMKTgmolHl9BlNswRJwhv+XDFFveFF8TZC7ag2JAQfD8UIx8
	 f/l/AOxYwWaeQZbl3iRY4KQVtfuu7K0UHKkrJoGAkK/fDvNrGpNYyvWTOAWfZKnSvYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=xWsRCnyfIIh6p0qTAnuMX+kvCKkdDMmnnoWpEqJrMZw=;
	b=owjURFk/gL50ZmNXh09jUJzJDFpUJy7nchTw+ZwtuzoFwtI38IWBpCi2YQMGjiounxX+
	 sgPTfnKngmgnOB0BL1dKpWYaLW0fzSxJ57dwueqIcumZb2IlogFkGlbConytrP3vF0qJq
	 u0cZDxy3Jom754z0EOa4kSTYbsQtvixG6MG2OkWNorD2XF4mLzOljpyhJfdQRJ98KAhel
	 V5tHGozY5Lig4u6NbtIdg/3buu0d9xTQjVEK2uXw5UYWdSPbbBVkAWByZnSD0EitqkHjr
	 h6DHSSbEknz3NFaB6deis1r76ruyC1HtzN9oUsGgjIqelNDOO11JTYVb1bpmtn/hxIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fK1lch4e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55D6606A327
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B55D6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fK1lch4e
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6d68de53053so5769920eaf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:35:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795772101; cv=none;
        d=google.com; s=arc-20260327;
        b=GCGC6l/nOZ5aautArmPBhiUxjd6SVZwEaksYtX9znC9lY/LukYbzKPn2dRDvlA/PsW
         R212So6dzx3M4xjJr1K6OT6bhytePlQ4J0N4gWg6kt84bSUzzUnk/IKbZDnZSP9gKWWH
         FayX0/e3iJBxUE1pZrrbePXDEvloB+shklHishi/smA8X1KzHhBtyWg3vGnoCvBJXEVS
         4sEJ0cU5+PpMp505kfV/N0HFp9TeftxBGgx0vpdNiraUkOeFk8lAWdP+/cUGCuENG/q+
         Zxidr4SKEgtNY8iEufNZ4rKsndh1eW3VjzPoVNT53NNfZPGTjjpRYDxNJ1nZ51/niinf
         UX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=xWsRCnyfIIh6p0qTAnuMX+kvCKkdDMmnnoWpEqJrMZw=;
        fh=aXXvbhlRvPeF2KLcPf9Pm+TMjDcQUC12Vgg2uV8iR4I=;
        b=VNswoyBUu8LcpGuKZqqFo0js7sDlHoxwQyDP49mK6fFpzMQ8u3SHbelAyeKPmqV67I
         84eatweSlUBVz+h0SH5qsbsKs4OOnZUpvIw21O7/5cZgegb6GWmHBwHax8Gn8JIpK4Vr
         pwfWiyCLVKuait8DsNFHRYz38fKszxLWUzy+ixgJNGTjiTL/NP8+h0j0IAXX/ULWUFcI
         HVNwDoSz3DKzlfI5VQDaKch85kt9F6VtFwlYWyigUUS6Cbp6vIbUr1flEpyTWmEUld03
         B6cdznMTPUHSYcAh4kvqNR8FJtuuFi9YN82pIuUbmcXdghccKD44KGRD/NQ5MyWgzhKI
         oIxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795772100; x=1796376900; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xWsRCnyfIIh6p0qTAnuMX+kvCKkdDMmnnoWpEqJrMZw=;
        b=fK1lch4evMT7fYBb0a0Xv/I9W06+pl+girdVpojSEAhq9HO8hYFAzqtCD43rewsdlN
         ZBtdN+jgSoJEDpmQmV5HG9YS5jeIzq9fiuf9dIm7mLLqiegZvdiRnme7+7Wk5GdGJIUG
         rKwpKyR9NYCQVDpHGu/2ZmrhEzqpUmQjXWQugNy8cMgkQobsuRM2KXc9fNO3tg4AdbP9
         Kz2p8+mvLKy3EChZl4/Q86dTSmlZ1RV67qk4X3RnjXstNA7E2l3by+4oia0z7FjqK0s0
         gWJmDW3d40ET3iYFwHmQ2HPulcLd7oWZKgyxhj1WIUp6fKM2niZvxFnE1CeBi3TOOh52
         xHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772101; x=1796376901;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xWsRCnyfIIh6p0qTAnuMX+kvCKkdDMmnnoWpEqJrMZw=;
        b=GzK5Hicposswn/EY+vEjvTKNRmvEOfxpb8N9JtfXHLx+L6+u/pyeom+xdeVtFw4Hvt
         6TT5s8GFLAGCX0aGHohM3jYTeeu17CFcqLr0c/RiiZGSbo4F4yfrnm3rhVlg8sEkTFA9
         4odre0JPG43St8KZAySZiXOwQzUmKuwIywLz1v8ylGPxaES7MGDMwRAUZ7/vHj8K/9JO
         kl0ivhAygfKi/HZ3sU3cbPb/gZWcymdo+yBUNI31hZxT1ye3pFXhgY2IBkzY6Sqv3JOJ
         tob3giPKIIAiA/GMtAHzUx50bFSPv+2ZKUflSNLpwwoa7UXT8m8y1pRZjn6ECJOR2FrH
         ceGQ==
X-Forwarded-Encrypted: i=1; AL+hErFwdV3lwgV6iqmXalUlT7zZfe9Q5OQ4Ac7AWbeinTXuZKy/Or0SoY/p/Y97M011BALS9Ft3kvlxw8oIMbmb@vger.kernel.org
X-Gm-Message-State: APuU4Z+sV88iB7DOAXqHqfh1/M1HNIfHe5EerQzsq7sDQqcBMSWLiktw
	T66qDEHIHEySLpRu5C2JOjA2tq4Rzv5Re38RmUNmCGF6hENg8XAeaD+7PsYZSkhCPWQ4zIksbRk
	cJ59+PjkcJn+y6J+e1S2mZ+RKMQiySUc=
X-Gm-Gg: AZFdTZfNKqAutNqBdFYjnnGGzDILRZc0pEvg40E6nog0eIFIDKuFQXKiFw2F3lQf9rK
	RejGa1ZYO7WrWIpODrS+yXYUu4Qo/GEg+kM2SAYfUqyRCLNppMP/bInseImQdIZUf2DQagZfjyW
	Sb4i5z3NJi6QheiZ1/DS/gH+FxuesGJE2LppEi6M5VpqwtwNNADryzOMEZCFQX8XOrl+S4DaQd8
	ohpNEEvIcEzAfYYWyOtODXhMQV9eSBVmJq4KQ2jsWEIZ74XQv3ujp7k558m4lkIiihGeBPUWQtX
	+OrT9oyprohjMBoIHHi7Fe/PF7GF+/UtVmjD8g/x7VPrD38xBdZuidgr588YH/DJTg8UmQhugRx
	BY5rj2PimKJaCEFjcWtUkmQYZI73woYyzm1k8txpeHvcZlO+jqCmKIVbsJiXoWkOBBA==
X-Received: by 2002:a05:6820:1502:b0:71b:85a5:c1cf with SMTP id
 006d021491bc7-71b85a5cc2fmr4351963eaf.26.1795772100658; Fri, 27 Nov 2026
 01:35:00 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 27 Nov 2026 04:34:59 -0500
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: getfeus@gmail.com
Date: Fri, 27 Nov 2026 04:34:59 -0500
X-Gm-Features: Aa3M54pOAqrag9P8DyluBCoyp9_znpRQFot40rVo9WjESeWPqoyH3kr_Zbfl6Ks
Message-ID: <CA+m4KrCGfS46jvTdXiYorW=rFg4wOKJ=UHKDXq1a4qfN0r5x_g@mail.gmail.com>
Subject: [PATCH] interconnect: qcom: Propagate BCM vote commit errors
To: Georgi Djakov <djakov@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

qcom_icc_set() discards the return value from
qcom_icc_bcm_voter_commit(). If the commit fails, icc_set_bw() sees
success and skips its rollback of the previous bandwidth request.

Return the commit result so the interconnect core can restore the
previous request, attempt to reapply it and report the original error.

Verified with a mocked commit failure through icc_set_bw() and on a
Huawei MateBook E Go using a one-shot -ENOMEM injection in the BCM
voter. The caller received -ENOMEM, and the previous bandwidth request
was reapplied successfully. The ARM64 kernel and modules also build
successfully.

Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
---
--- a/drivers/interconnect/qcom/icc-rpmh.c
+++ b/drivers/interconnect/qcom/icc-rpmh.c
@@ -130,9 +130,7 @@

 	qp = to_qcom_provider(node->provider);

-	qcom_icc_bcm_voter_commit(qp->voter);
-
-	return 0;
+	return qcom_icc_bcm_voter_commit(qp->voter);
 }
 EXPORT_SYMBOL_GPL(qcom_icc_set);
