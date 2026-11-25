Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612179;
	b=HbeFiC09SbzBWkxOWPrhzn4hiBp7ZtXngNOMXsTKeFTCYBofXVErgpgwc40y2rziqTle
	 wYIOwZLNCDnafIOH20Akctcg7VTSianfMuBl9KTsT1kYfsg/2l/WnTZAZ4Hld5/ICVE/B
	 t8X4f41KAxS6V9OxNUvC8K5/jlnrDl6t9vjXqp+1DNHqKUQX2ovP4smj5WkkjLSDcUFMy
	 PWOky3NvhZR8Tulpk+Rw4THJhGljuKlu9KfHRdLuE1v1czMEPq52YBhCxPBmelRa47nZd
	 evCIc9CUtR+KdhVUelpUCkwsAPG2kpvRQCzyLWbP6ttV1tpj64XAzEkZPpxVt2KtbjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=gm2/ObuxDVgUAne35bqkJz27tcih45Pf//RuGwaqhd0=;
	b=EowHpLJhZi2rMnU5cicCyqaR2Ff1s3yXbAI8Sz5FnnkxUcrXU2SIoLpmVREzzXrK3/Yg
	 8ybu+wZmp2s/PQ/7PPLn85UMqkTf5U83wPFHbK7YjbqbS32ZFpbp4qYiZRE/hwyeTvir1
	 g9JcBD/rHAhpOHK0msR5FXBAF4D9f4tBxUnrSQbDDegVO40k+wz2IMB45aqN2zDk7RHfx
	 ZdbX6LYefcIX0pIJPTyf3bX4t/PIQy6mMQDIMZJluqf0XsjK0gSXu4dXOSSCJAsqyAw6F
	 s7g8gKFeagXCR0ryBvUgreTOh3SbCQp2YkaGTKGCGhZH98VGjoGByUQTiYm/RsCV4lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lG6It37v;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B0A606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37B0A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lG6It37v
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dee593f18so5371007f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795612177; x=1796216977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gm2/ObuxDVgUAne35bqkJz27tcih45Pf//RuGwaqhd0=;
        b=lG6It37vJI1yamReOdJgOu4DK+G/otcskTVwxP4z2pIcqBlDCabM5BnM30nJmEsu1i
         icfnRjApC/nuwIhQP/PQiJEFGNG4NXjQi8qT4sf8e0k0gIRioJ2GgvbGIsg2ZjI5ef27
         7V2InBkbuOSqyWYlm9Q9x3BIp2/BHpJivZqr5z43RbQX5qUi0DKNLH+b4HN8VJiWxFCa
         1P7y5u08FIEpYYIkpSk6QDJs1K+u2ZnI8XJYzF1HcTeRRT/MvwP+AdVjh/6oh6G++unW
         qDMfPr1wjyiO7rqqDzUfNGQ4YMibBX2rPInuHQl/M7JEypT21/dxVmdtLquKzlHSnKyb
         rbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612177; x=1796216977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gm2/ObuxDVgUAne35bqkJz27tcih45Pf//RuGwaqhd0=;
        b=Ar6RCOK70fpLMpwLrkNykkJu6lUnvUYTu9OftaQHO6PmGKqlyyudiY5a1I9GQ9n422
         1xZdncrxXhUc1QOMA/j/3nN8Tlv+VHoC41Lqs+g+WLUfIxlWjHBgt5+a2Hx/N6nCHOkl
         iBy49UeCYeEq6Er1disQCtlvv1K6nvfWGznbNM4unUoJkjHlpvbWHrTUspbgAPkPIpmI
         V1Del+fYmZrlkBsICQfQXBUuk9zidN9EDmzDjrL13lNGX7VsFqMvw4u5+SBaxRSDsnDB
         em/NoGZCwjC9mW7JG+7EBsrT4huUbJrUOs3R6nzen8WYrWtD23Emxlcb6GCuku9v3ecM
         Q6Nw==
X-Forwarded-Encrypted: i=1; AL+hErFxHQxgV9SmyKPN1iy551kmQrCynDQSJQTs8xiEMfGZV/VYTvAd39jSEWrAa6E4+GmnKPWNvfnOX7uBCOiK@vger.kernel.org
X-Gm-Message-State: APuU4Z8eivkCbmFnBoxhaXXEe7QpxpLPKKKOdWORu4N3o44NSI84pzqE
	C1W9oIoSYimFZ1EKMTEjjuwTWg/qg/WQNn3hXohcy1q9oUGzsjQH10QDWyyrfv78v0s=
X-Gm-Gg: AZFdTZe7T/AN0qH67jsQ3WSD+TAiR/koJWyQ6qjhRi+vujH+vB0SAuNVZGkzgmaVBfA
	0Vc7a/wIOc1df2A+c4i8DXYq7IfNkbv4aWzrYIXoxZywr286TTAfKjG86eYB0YA2H6TM8urha7F
	k/Tbo2GSd3e01uWpyh4FIEWaxw6HPbjl3JC2qjgzfg2o+KE9tgY6zrqFUb6v0qU8kxUmzBtt5zC
	keQTH+qbMYEiukN/kgxuKKTRjSF8pmpblNqnr3QwNB2E61bWfYqn+gHU5rHdLNxLxeublrc7wLz
	VypO9/ANaOm97nUDO+Kw4WjQTNSZppQDw/8hzoLkGabux4hx2rzWIq4B4E9voVh7oixMykz3Qro
	Nq0MD9Orj25Ck0uL3Wlr9wTPTCRiOz3YjadSNeJayCmgpoHIHOFt1/KNgoL/oBIEAOjsxeLKHaA
	gNHH6oOVLGcNzkfr2nv6J3qG1skESNZIHS4Z/zFyRdn88YSdPaMgt2QtozGGSuxe10GW4WKToXu
	HDJu2D5seq0QNwnqEP+AxzBB2gfC5aNmQ9xPpFV0kPpEgRAPvWgf4qiG7l9v3iBLQEqCbQQonoe
	XIJbkR4UyCKDGsevyki+94vzJFJ+MQpybciFYJ6v33VGQriExg3Bkc1E5BPALT/7oFE0Gqs=
X-Received: by 2002:a5d:5f51:0:b0:48e:f10:ceb8 with SMTP id ffacd0b85a97d-4abb2168e0emr36120520f8f.11.1795612177309;
        Wed, 25 Nov 2026 05:09:37 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm35240355f8f.2.2026.11.25.05.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:09:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 14:09:28 +0100
Subject: [PATCH 01/11] media: iris: vdec: accept V4L2_DEC_CMD_START on a
 running decoder
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
Message-Id: <20261125-topic-iris-decoder-drc-fixes-v1-1-58b9f6b3fe86@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1399;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=u9wQoclOz0uA+9WaQA0dbU1U3jch7fedoVMeG3ZnpKY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBt4LQk+Q+UXmBx4UgVks0ZzBgcSVpIQ+k3gbiAfy
 xeSJArmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbeCwAKCRB33NvayMhJ0Q+AEA
 DCYIOVh40OZ30H4xA20IfLQLl2JsnIHa8iLhGa53IkzMZW2GZs8FY/GWfG2wlFSridLk6xlfIbzl+g
 iCfrgefirxxj1DCxbcNj6UbUwtbR+0VGQ0JxEukC6JkqMSxce3qeeGzCX19zGakp7asQFeRNRvqNFp
 OEBErh1Qe7pjMLWDf+UWYlzrpSEXOt9FHa9ddPI9++0tBiGR398VI78IcFI6nrMkHENiN0CyvE2Abr
 p017BwkbmqP841VUUCF3kzzpwqHuDCYabkr1IvoluitWxFZWFcZ4Do3gbuD4/XXSG9QtKOaA7riWoa
 E1F6RptUxHicK6o4NynaJ4B+5FKxHgTTBqvvEfj/3n5dob4fPs21MDmlaFSxn7cMAUWJ8ALpyJWtVP
 JbGULrl+GOwi5/nBiJDYLo8CnXy+sUNlzjh5JJQvXKzb3nMvshrLSFaI+xweGE0FNNugW1KOaWocnj
 OW2FYckeJolHmF7ZpzHxaPzIz/NF3wrikcyAm7AS+0iMrfFl6hV2uQIW+JILS9q7i5ZZxmOkvBkziq
 ic8+HmVuqE98NoL5+9TSawkWm4I+MCgFPi/CcrG4fzr0DzwaaTNfgUWSSkIYu3n1cdLNc2/luTlKH7
 c0MzE+e6wDHxpg8T8PGeibcuIaNHLVu00rGmD1hJ4ZA751+KrjN14OkyXf9A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

V4L2_DEC_CMD_START on a running decoder is not an error: the specification
only makes it fail with -EBUSY while a drain is in progress, and
v4l2_m2m_decoder_cmd() returns 0 for it.

iris_allow_cmd() only accepts START while a source change or a drain is
pending. v4l2-compliance completes a source change with
STREAMOFF/STREAMON(CAPTURE), which restarts the decoder, then sends START
and fails on the -EBUSY.

Return 0 for START when no source change or drain is pending.

Fixes: d09100763bed ("media: iris: add support for drain sequence")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 931221564a33..7b5a607f94ba 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -601,6 +601,11 @@ static int iris_dec_cmd(struct file *filp, void *fh,
 	if (inst->state == IRIS_INST_DEINIT)
 		goto unlock;
 
+	/* No source change or drain to resume */
+	if (dec->cmd == V4L2_DEC_CMD_START && inst->state != IRIS_INST_ERROR &&
+	    !(inst->sub_state & (IRIS_INST_SUB_DRC | IRIS_INST_SUB_DRAIN)))
+		goto unlock;
+
 	if (!iris_allow_cmd(inst, dec->cmd)) {
 		ret = -EBUSY;
 		goto unlock;

-- 
2.34.1

