Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793159019;
	b=SRbyjzgsUS9tK+0B3hHWf3ZgJVImqcduzqzm+FX+DWVH9/W2zRAfSJo8mFa+qU6MQlI2
	 l7VwjSWNUfNxX8XP4mc2d/ujgBUKYqXx4TRR1rDUHpbgdYXRIsfNGx4emUBb1YuNfRyM6
	 +HEvkR9eLq6rpM8Z5voJ9TQlcqckP0lXj7kIwASShrg9u4cgM+YBEllCw66g/CFnypVe0
	 0Cy/bYhEGt170xp2C9qfdFA8OFHDS7cwQ10JyjUAXfuSAH6js9UvHT3hUtsGV1QMdcLX/
	 pyDu0APG4VjM7qIStJ1jALdDpZXMjW+ePCcAE0jFZUyqHDbN+lZp0IRbpe4zlttqleQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793159019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r5v5jZxyWxHp2DT8k13H1hTIbLWPE/Nv75WUu874YVo=;
	b=w2Ngcw5tvmA1wQ7RNoa5B93nM3vVtljniYFZFfTPg4IfD49utVvp31uQ+jcjkw8P4A9K
	 eA6qTZI5oNucooHlKaOTfdv7Ju5OCJKqDgmkFue7A2RJmKCldzXGgiqKBfUnNL3Zf8ZhJ
	 0Kxg305G6bjXWnT7VyFLefOaZ+tcS0WVgDMJov0iBHRJdpRKGoH91liq21cPVhkyZ4NH4
	 dMYnaC3f5kDJPRHTRNBq5LOwgPeFfFscxyht7npcyE3lf3CMZ7uO9J+/UaDmx+A45P5oy
	 XsxFv4XAUyRkcwIHeFkS0I6XKIFjhQuDWLce6cKS6hYJQa0BnuC5wrCvZdy3+w2k8AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MS/OC5C8";
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC53D606A325
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 03:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC53D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MS/OC5C8
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53644ab1f7bso5942441cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 20:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793159018; x=1793763818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5v5jZxyWxHp2DT8k13H1hTIbLWPE/Nv75WUu874YVo=;
        b=MS/OC5C8OcvrB8KCupFrL2xOApQoCzr1Gln/rqtrVflwk77bvvGtxKjmfEpOuSvfZn
         EGFWZM1A2REaPAfV89a6YZTbCSlrhvqoTZW0c3oZLd+XPBjAUV8+prd3+ygchhUYikvg
         cKa5hVIE1OOqbgU0l1WEO5PInrk24GaQAvTzDw5vs2WM7nQUlXgtQXgucp/aKVd8fdtH
         o/Fh/9IR4uTxFzrPaOeqls1Xqksn7QRmY5W72fBYiAhV+Ea3r81JPghg01EpFOY8OX+d
         FwsyhJYj2l8OL486tLVrpi3eB809J3Fos0RhPpDE5iWiKCMKxbKDf7K0Cd6/I88avmOh
         sW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793159018; x=1793763818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5v5jZxyWxHp2DT8k13H1hTIbLWPE/Nv75WUu874YVo=;
        b=gvXRT10PmvlRSKt0Dg7D1TKF2I1R7Kobx3+blTrlg2BFng+yCpz1aH3CYCQo0e9hpX
         daXQVRdFTnvNskNSC2lDMg6ncx2OuYyERWdBqgVKOEzzMim5EVtARbGPutejDrq6qhWH
         QS78cCmo7E3cRAuueARxuSMEotzScdXRpOHe8X6U0dMkxMxQ1pvPuCVJy9C3pDCsKvCa
         Ybkz/sDNa4sp9NV4ZsdFA0rnvKkdWHmrrHMeYnyfPmrvhP6lIsRGRLVWTHAG2H8ANtAR
         7GPf5QfC64GSC3oPyBnF4RcmXTWe6vEG2QUCfo2qWXm8nU6XSDSnEw2xQkigOMMQ5a4O
         4rJA==
X-Forwarded-Encrypted: i=1; AKwUvBy6iPDnlWjI6MAqjqtwa5Ofeb9wjtwMJTt39ITBpvAM4zIF+2spcgKWPWapSmd462V/+QXWOJtObYVPBf0d@vger.kernel.org
X-Gm-Message-State: AFq9FYJL+fZCEB1UFmhzP19Z7FannMzwvWZX8guBVNRgVOMB4SnCfyUF
	d22NKBTGSerfLbj6yI9wTBzNeF1DqyMY9Vw96b+jxcR54y7hD+fX/P8+
X-Gm-Gg: AYBFou2Z0VE9rElBQObaCLRCNxOWGJQyFqnV7jTUr7xAcJLthd0T1ugGB6nDuCU75K6
	3NAnykogxaUkWiv3HAkG7jq/6TsGNww1BhpMB5J2Su/ULSO0RU2kOCwJu560gWwafhVpDXqn7iO
	cG/hgbvibZ6hEuHg7Q5oKSQNQ/pzHYYRVZvQA7BbcztnfboDaCE2AwD1DZdLg4Fqdaecdv3AOCg
	ZlD4rLQLlp4ZLlkpg2rAu3tDfhMxtZ0bwj05OLcqf/EnTtf3+CFs8u0Ia2W13r3eZmIwEm+4bMm
	1nSO01lYE9HeUfM92GYFCgpVhj/qTY8X4EiECPoze+IiU0KuqX9vpZqKLe2w2yzN7IQrHqUmx+l
	60w5zdr6DSGJPamjmyP+KVd/yCYhlSBnvsI6kPmOVA7vOjVqD0ohyd4v8aQ1mghYyR6Hm+xiHjl
	Rl7hIVI7Ay/boF3FKzCSzWUBCpH3JmeW2vX2CLMH4s9zOCMZbGWFkeCJB9t5sihc0IZJSgURyDD
	Qmkmnxpsof9nBkX0Z8T3Y3X2dj/0CFs0ReWkbjUGzcnZNPSr4/RXHWj3iJuJ3Wh3PBpW/cnh0hX
	0DgTPzd8ENp0yWX/quaF7fhival0D91ybW4V/E7lFaCDcZ+QZJ3OuDrv2rtuXrbWEpGVDxT+7it
	2djizAw==
X-Received: by 2002:a05:622a:608:b0:536:600e:843d with SMTP id d75a77b69052e-53fcc9c448dmr20566551cf.50.1793159017822;
        Tue, 27 Oct 2026 20:43:37 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394c565esm95604581cf.6.2026.10.27.20.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 20:43:37 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Birk Skyum <birk.skyum@pm.me>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH v2 1/4] media: iris: Don't flag an empty source change LAST buffer as an error
Date: Tue, 27 Oct 2026 22:43:32 -0500
Message-ID: <20261028034335.26075-2-ccortner@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028034335.26075-1-ccortner@gmail.com>
References: <20261028034335.26075-1-ccortner@gmail.com>
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

The firmware ends both a drain and a source change with an empty
capture buffer. Traced on glymur, it flags the first
HFI_BUF_FW_FLAG_LAST (0x10000000) and the second
HFI_BUF_FW_FLAG_PSC_LAST (0x20000000). Only LAST is exempt from the
empty buffer check, so the client gets the source change buffer as
LAST|ERROR, and ffmpeg's h264_v4l2m2m reports a decode error.

Exempt HFI_BUF_FW_FLAG_PSC_LAST as well.

Fixes: 7adc11e6abf6 ("media: iris: Send V4L2_BUF_FLAG_ERROR for capture buffers with 0 filled length")
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse smatch
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index f0782c4b1e6e..b4fe9066fcb8 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -390,8 +390,13 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
 
 	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->flags);
 
+	/*
+	 * The empty buffer that ends a drain (LAST) or a source change
+	 * (PSC_LAST) is not an error, the client just ignores it.
+	 */
 	if (!buf->data_size && inst->state == IRIS_INST_STREAMING &&
-	    !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST)) {
+	    !(hfi_buffer->flags &
+	      (HFI_BUF_FW_FLAG_LAST | HFI_BUF_FW_FLAG_PSC_LAST))) {
 		buf->flags |= V4L2_BUF_FLAG_ERROR;
 	}
 
-- 
2.56.0

