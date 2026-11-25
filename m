Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612180;
	b=XwZXdtT7EZCzKDNJXaqK1qJWaIBm3YMJDQ+K5qEJzt9Yaho8i5sHTrwu9Pd9sRIlQrIA
	 8ah3465o+wZtWdVeeAz6Pd34LJMb/pDbJzpNytxrGrShAS7vihR2Xc3rBY+7EG741OWLZ
	 OZA4XR0OStAmGq8eNliAaHbZpTxgtBRdLmOTt2FNGQl3QLuBdOJihnrDB6sWz+wECtT/s
	 Yc6aEiUKfoDPbPnXFO/ym0OuJdZN1prsZZRglihsDX29mBxH/hOVp/oDl4k7u+b9oNrVj
	 fZBhmEgwMAKRMn9hYcRsDhLf019w9f4OUzF4MkqKp74Qrt+5fwt0PFEYYyZgZAX3LkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7j+iyCxJKN1obNbNOrxIJ9oVQ476N5sWokxiMnxruLE=;
	b=1GWmF6Jhu8gBf4X7zddrbB4C6m90BdIul80oTS+KPaWBuL/EnDGYx1h12DS77ytyHcz3
	 RVe1U3R12Wo9ObKooCgButXwzHCwqIBf5PG378McX25JSNHRV7u98ahb5Tj0ErFj8tS+6
	 c8PhamK5RP5DKhiLyldH6dr5zscKSWhyTlvdHG/IZyLBs86ALG56kP4oS1n/QpgdoBhGw
	 I7CjnKdo7X/4IU8ayj2qBEC0I8vhs6fJ6v6SsL8Le8WsVMosDawYQ7CQ4TgTWEYinAYNp
	 cRwTNbEewI/ppXiCjc3iWrqJGm2ZklxTl04uqglL0AduI//ki7qPZ/AqSxl4wpsLd0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EhTKowDz;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F1E606A335
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1F1E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EhTKowDz
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso2634697f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795612178; x=1796216978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7j+iyCxJKN1obNbNOrxIJ9oVQ476N5sWokxiMnxruLE=;
        b=EhTKowDzx6/OG0YjNneQAMFEi+zARg4WGBIsT73NISRMszHlnLPf5l5cx5TzD2ezUb
         s2W2+f3j/Wn6uPBJrWaqKaPjDV2uyYKqWZT7uoujvPXSp9cGUPa8Vbl8epCEMRQyouX9
         4klf8CEjRg6EvSi//IMzYTQAxGSYuRMerSwMW6oUMPT5mvS5l9/2gmuHPuGJvW2tD/Ec
         vC2ol8AqF/R9Vv58JmUyHY8OzHzGe5n8uDc6Zyon8hFgs5/+woUzGbpkZKzsS6+oVaTM
         IyzW94/Ia4Y4YeqAxxorrNZDMfjd7SCgqCugaX8tBOnyJ4p4DoPB6dqXNIDPLEnobJdQ
         1fzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612178; x=1796216978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7j+iyCxJKN1obNbNOrxIJ9oVQ476N5sWokxiMnxruLE=;
        b=PPcs6I6jel3ndkcLsrOp+miOkuvbOquu9SsAQ+JkQZR846zKusXmUMe2wjZwLBlEcG
         MM7PRbzE+C+I66irzzkI6ZVhyj+gNfsMyoZeHInr3AvfJ5LdROIrXjwiMMBGV/7cEzdy
         fVDyYe6tmzVZehd90Qg5hNoUaO8rI6ryeL6pgt8ijMOXLtR4hKd9D7ClN6Xmsbb8O8lH
         XC9tUX9dOltVTsxGXh9UcQVqPQlaUACsXXjs1YFtTRbyIDUXM1rVVpbHJEM2+u0x4Tmw
         iKo/XV+3UpPoBXXIC8lLKlx4mHsuwBo7udYIo8EdDMpWp7LKY0Ec7lqVy6aLRmfz7drc
         /QmQ==
X-Forwarded-Encrypted: i=1; AL+hErFnKI8ku74+DekL9NC45EejJAJd/LHH8VJKs4pDY7/CTgH1fGY4RThbKfMU4026J1wtzY0R8kqB9VIAyDf3@vger.kernel.org
X-Gm-Message-State: APuU4Z99kEk2KeBGPkSQ7dzyBmPYNfhCDoGoT8jqJhAN8wRiIQfhwpzr
	RhYhf3FbIKI/w/QC/N7t6WcahEpIhiBpbSF8JBBu2Eu9xnP/GyZZZX0zhm5l0C/mxLk=
X-Gm-Gg: AZFdTZcwp3VFPH2WsgdEzW+TxLzBTND3iKPqsRzikurR92vow+lM4Fc2PPw/+p0gsFE
	+RGMzHliAFTc1U3yWGEEcXZqwLYBLMRYfrBa9/dKZFVRjuM0paeDYZMZ+qbA/YAopfVSWNM8wWt
	ZSHVggLlFRojN5Gf0q7eoMb4XQy5XJcVbfetPY/8Bs7QE6fo2Q+WqHPz3KEjmNhzPvVEzCAGywz
	QM1ABYSWGN3AzSZqfPq69st/R4aBSx47fGxyRHcWfmKV5YPBBBIv6E3VCfL0OpINPQrhMlTau04
	YNIYJogKgAsp1xjRJqCyfakXraUPvr6CsWYAX4ktxnxAaxyu0tjJrA/N+AqNaGM6SzLXSvlxCeP
	V+WF0C3OqrsCmjcIVbWtMS3f49xt3xpM17cONkTka8Dmu1fSQ3ZNBQ6dt4n3TM5WR/IIkFIeTDE
	VJuey4ISAoZv5cUMBMCGY5jchHKvAqLUjYXJ7X559dp6SouACwerDIZ5VqZrRtecomlL2NsgvAJ
	Klvrv4YY7iQejaSXaSEON07kDV86J74mwQa6r1Hb93WmpCg4OBxfeyMmJZauS7UlwJKb6EraxVq
	Cej0VGbnKrN8Q6duLS/U+dAlUzHjGSsg2hM1BUUa9gWUBZ0r1bbLlo1Tm0XBrrgOwihq740=
X-Received: by 2002:a05:6000:4808:b0:4a9:760f:1843 with SMTP id ffacd0b85a97d-4abb0d51e12mr34353972f8f.27.1795612178043;
        Wed, 25 Nov 2026 05:09:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm35240355f8f.2.2026.11.25.05.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:09:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 14:09:29 +0100
Subject: [PATCH 02/11] media: iris: restart the buffer sequence numbers at
 each STREAMON
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-topic-iris-decoder-drc-fixes-v1-2-58b9f6b3fe86@linaro.org>
References: <20261125-topic-iris-decoder-drc-fixes-v1-0-58b9f6b3fe86@linaro.org>
In-Reply-To: <20261125-topic-iris-decoder-drc-fixes-v1-0-58b9f6b3fe86@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Vedang Nagar <quic_vnagar@quicinc.com>, 
 Wangao Wang <wangao.wang@oss.qualcomm.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xfhCJPfj+HQzhgU+bAL70IYvzzbzMmf2vG9VFnrCgEI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBt4LYofO1WutbbJhxzJ+OJv8HgNEJH3O1B4oanNz
 fraYMzGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbeCwAKCRB33NvayMhJ0aaBD/
 9M80Ada0ARWG+VVjmaT6D6TG4wJjyYnva6RYZn/tiSxtwnQK1rhi2r1MDPYV0d8I/WP9ny/TDJvjvu
 5Dxr0M+DQ5p8KUbKdWvD5FcpmAGTNetvnuHacIggt/t2Inh5UgBbSoUaSnSQS8Lr4x0dGG8caaDxjV
 64jWkmyOYy+Bo1VP4KO1FK0iEXJutNU74sNUUExOHA5xjgvla3oejxb6UgU3nPBl9+nZ5unKfZrVji
 4bJ3Vs9TX9j0uwcxaQB8fROT8Xcx9K5udbBjMNySnSJYuP029dAdgHOaWnq7oBqG/hAouaXeELTIMd
 Qx3nBvSSKd1KiXI4JdiwqSsLqQgCdHOAAAyeXPZ2LnlFOwXYdGkV9vWrXX12I7zL7UOc8YBrsh8zuK
 H9i7b327qEvUKem1+E0Q1lVaOHgMaf8P3WfiNV+oEhe45PdqmiQyMtHPnCl3N9vC/j4qsllxPivq4k
 3nxSG6InU2hDJzdcgtq6PMrwE5BhIRGQ+rrb/CQy/tf4wHFHl5t4lgoKi2Ypgty55CyqMjOviR4rPJ
 0UwamQtYXJB6sEYK2j6Zx5p+D/DDpiZnGDKUkW3a2u6nhdW2W/LdmNs2MP/svpk0deuS/3K54/0bMG
 mHPwzElSMl/0HfJ0IWKnYl6SEZ5kG3/KSVFGhVvQN50yxWbnenaSluHVpdeA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The buffer sequence count starts at zero when a queue starts streaming.
The OUTPUT and CAPTURE counters are only zeroed when the instance is
allocated, so after a STREAMOFF/STREAMON on either queue, e.g. to complete
a source change or for a seek, v4l2-compliance warns:

  warn: v4l2-test-buffers.cpp(470): got sequence number 12, expected 0

Reset the counter of a queue when it starts streaming.

Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_vb2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 2460778c408d..426810c848a4 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -181,11 +181,13 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 		goto error;
 
 	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		inst->sequence_out = 0;
 		if (inst->domain == DECODER)
 			ret = iris_vdec_streamon_input(inst);
 		else
 			ret = iris_venc_streamon_input(inst);
 	} else if (V4L2_TYPE_IS_CAPTURE(q->type)) {
+		inst->sequence_cap = 0;
 		if (inst->domain == DECODER)
 			ret = iris_vdec_streamon_output(inst);
 		else

-- 
2.34.1

