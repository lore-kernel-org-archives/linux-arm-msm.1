Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728620;
	b=CYKVZAallOePkUFdPNKEjUf0j53P0yF+vV5NG+1869H6k3D6duxVPZluuRwznnwPnHZp
	 lOAT0XSlzqlfRm3dhtG6mer8QiGyvFAD1g09RhfYqFB1vq9DBtu/7PETPOGc832f01CWu
	 hD9J12VfBp4HdHVjDbSwFRktNxqYqlfR0jw60+6CDjShEr3MoBPQ4lSw9cTxtNx558QYs
	 fuR5Wbwe5uMJyHG8wiQk2egBTcve8ZpQKDMfKnqAazfztUkH2xwaz3uUJxMVTLvsIu9Am
	 rMXXyRvyTeEraaXQLwuLhn3WJeHkUZWVqTKRlELx6a+ceWfgLn2gaYh/SKy4IiuWIrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pRcl9r2zjlns812ycQwgiHG9E2EYvZxAwiorxMzflcE=;
	b=E2asDHVGLPBXMMhndWJUMkuHWWPZ9SqXAWYnuhnqm6qxPfcUIE5UwmlhUjXff8fFd2vM
	 O18SLFyYIvKLNytHsPtJ4xNuLfAvB9MV2LdBqfP4adeFmGuA9owCbQhnbwRC47iDgLzUB
	 CDfbfSkT6/b17sH88Z3fTfh0cwjDX7oOOxLPvDDxdQ//P8gEyvjinAs9ndVn69SacNgfq
	 ePCV08egaWxXJdRikYJB25qcWWnNe2WK2SB6w0LoNWZZFWq0Lo1AeMsoPL2obuASzk851
	 B7wW0hl3xNamX2nXDaS3sOv51Y5iyR2eZGYNPgzfSyUFPqK/VAv7r/H7HbHa1D1+iqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RypsSdu3;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F6F606A33C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 21:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57F6F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RypsSdu3
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so8167381eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 13:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795728619; x=1796333419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRcl9r2zjlns812ycQwgiHG9E2EYvZxAwiorxMzflcE=;
        b=RypsSdu3z5zQL4cI2yjyDizrcUfZmL4pa9V4UuoaJp+Ie6ySlULN7csUSlLKtcy/nL
         Ko3zGxo8SzUzV0vMxpdWjvLvNZVd5T/fjrt1cz+9b0xF0rKTovuNqsaJKGrRYSjqUKHd
         pPjdKfxiZ/3fYg97gXUkFNvhTVK00IBPjM9MMkPHUXAPC6xnyFz5hre+fJx23sqVrso1
         a6NS5yTZ7L2DqkWtOIqHcXPH5vvsavt/amIHYe8LPgqZ0png+J8JvFDXV69mZ58AirSw
         MJHXQ7DnPSSm7ZMpr3HFbaB79PQhGD4yqRza/xQLx+EX//1NfCkknrXkzIoBjPfaCNsJ
         3ewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728619; x=1796333419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pRcl9r2zjlns812ycQwgiHG9E2EYvZxAwiorxMzflcE=;
        b=VyaARC0nfN0O0Tk4kiaO3fPptAZpoWCCI6CTp5SPYC2n4jwuzLoeOerE6dvda06AR5
         OoezlDzG4gwDgmfg+AB880EA5qOO4+Nv8+4KZhZbd/1/ya2kOXdcj9vMcMmasuxZ2v07
         AHuKrN4jBe/mLuYBDYGs5NEFV/R4oGxZXXzyqRKUXwn1xKN/Xr91lDvXW8d+4CsES9tY
         5l9UVqRjKtibwysqAUx45dPddxUVrox4FrFkbZ1o8XSTDN1FfJKNGu0ZlSOipgcmQf72
         9DpdQoj86aLZUNw3AZfpEv0gIsdz7VS5SZGeawZkrOZCUTErq9kyEz/jzXCmyOMB6+97
         QXhA==
X-Forwarded-Encrypted: i=1; AL+hErGPJ9MCvYMKxgqmNidD3efPSyZ8tbAASfjxzmRhqZmvxooQsR/3SK9aQAOq4jKLiCMfclw/AuONAAFl+tiq@vger.kernel.org
X-Gm-Message-State: APuU4Z+5tARbLxYaxmgNRGtNmAmA4ZBucWO98gsUak7kHtr1qnnboBJQ
	0IyWwjSrRa/6uq6FV6WRAv4XgD9tJSk1J60KORgqJqxRRArzlu2Je/0xvbEQoIBl2/c4cg==
X-Gm-Gg: AZFdTZdpAOwAGV9/trTlUbuQiQy6Nb8Ptm0TQEzwvss1/hsgZ5ZvXErfFsYt+UF4hNC
	HH1SBJBUxKL0JW4tSzTdJD/SXq/xpJBsBJK8uy5wUFQdtUK6+EnBQFlxjEKgggSJo1I+F+PKcPZ
	IUT56xCA+oorJofM3QPwWSFq4eb8H8krMs9L5/qy7dIqDMx/L8OiylCjMNb53/zILuwcgVUBGsu
	Psk5VtgkLJ3WnY1IKdASzQcBsCAn/EvsFGdeYzZT9PlAukbJD0HGJa/23zZN30oTnkc2Kkxd8E5
	mBrYBZrAMPJANGk0Jupwjm5azXhAdfWzoZpQ+WXvSKVlS8U63+bKPxts5Awiiq9/soTMZ78mm5f
	pItQtZ5OnKKoYm/hShD74uUxEzmf1CzRh586o1yE4qeCHUy28rrk16EmbcWFIa+lOOQe1LrpPyl
	bHsvS6ZxWuOJOHhvwur0fYYhCW/i9sAn4LahM5HVfj8uyOBLTFcq27gsimL11akmUn9bPNUvQ3q
	tSFw/OJOa0Z136xMMRiMUlUeaPnn3UzjfNose3BybVrGQZlFzsjuXEiPyI2SA4lRZw2QPjxDkyk
	vh0oyop4ezYifpKickFf7ta718MmHNbzWDPrMWqglxTeoNlJEYpFARqM4zLhx0lC9eId55CoqJ1
	PIbwpEF/hJU7NwA+7QbFku1zzqCKbePlaMDPMRC24
X-Received: by 2002:a05:7300:c00f:10b0:381:1eb7:938e with SMTP id 5a478bee46e88-3856c9a61c1mr27000372eec.4.1795728619425;
        Thu, 26 Nov 2026 13:30:19 -0800 (PST)
Received: from localhost.localdomain ([76.33.234.50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm33434219eec.9.2026.11.26.13.30.18
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
Subject: [PATCH v2 2/3] media: iris: check the packet size after reading from shared memory
Date: Thu, 26 Nov 2026 21:29:03 +0000
Message-ID: <20261126212904.27207-3-dennylin0707@gmail.com>
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

iris_hfi_queue_read() takes the size of a packet from the first word of
the packet in the shared queue and then copies that many bytes, including
that word, out of the queue. The firmware can change the word in between,
so the size field of the copy can be larger than what was copied. The
gen1 response handlers use that field as the length of the packet, for
example to walk the buffer requirements in
iris_hfi_gen1_session_property_info().

venus got the same check in commit 49befc830daa ("media: venus: Add a
check for packet size after reading from shared memory"). Compare the
size field of the copy with the size that was used for the copy and fail
the read if they differ.

Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index 12a7fd0982c5..55711f332a50 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -95,6 +95,8 @@ static int iris_hfi_queue_read(struct iris_iface_q_info *qinfo, void *packet)
 			       qinfo->kernel_vaddr, residue);
 			new_read_idx = residue;
 		}
+		if (*(u32 *)packet != packet_size)
+			return -EINVAL;
 	} else {
 		new_read_idx = write_idx;
 		ret = -EBADMSG;
-- 
2.43.0

