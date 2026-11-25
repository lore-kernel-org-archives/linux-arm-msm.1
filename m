Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612183;
	b=DysTokXz+xMg4bRqITAE2gfEs3oshWGjRDS84EOB12J6zaTL7B66gWUpi8ih45y3XBgF
	 xEvrALPwe30qVx+07qudkvvR4XPBmMFr/BvvGBlqnY2IKllTUqdS7yq4UBn0shd6FqQj1
	 iMnZquauVmTH9yPg39dY6+EZP16uNf9wPms9CsNWuJVFcIENhaHjbW1CY6HfDzgdoqUmN
	 QDnaZQrfw4/mfsAp0MHJ8ys4X+4yJr3guToqxxf4iqW9aShK/iqCUtUe1v4ieQy8t0ydk
	 QZpQ7TligPSx/K3CWHvfhcJZ47DqVCNgRttzJ4Pc5R7wZUr03Egy+G/r8oHFhftNn4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=RfHhL82RSFRjqGArWKhGQj6Yg+HmOa+wEbBl0/BNQSY=;
	b=eOjuLvu0scZk4AkD0pyAGDaxJD4OL269ib077IEYdh58FzX5KRxmCq82s9RYszqx0Fw4
	 ZfoecdBWAgHreCquJHCFh5T2mOey0kJw3A9FDchdUbL1iD+UQcyqEIxhrIlfrhbrUgxhe
	 ezZjRyEMOPG7ET+GdSB2XfOGKfCvZdxgxDvUjGPWUj/3LBeAHFEni3AYdzZmL3LGjfLlJ
	 pza4XaGvbHx/E4EST1ofpoNvS+YkR7v77VAe2LspRh/ER0PXYz3ICKVEfusk5qUex9FR9
	 hXKkCGQAivxCECdyq2PMMaAtve5vnFXCa7QTdm9SpHo7c5IXbbl6vwauLyT7p+HkkYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BYQjLBys;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F4A606A69F
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0F4A606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BYQjLBys
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-49412eb1474so3723545f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795612181; x=1796216981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RfHhL82RSFRjqGArWKhGQj6Yg+HmOa+wEbBl0/BNQSY=;
        b=BYQjLByshvYup1afxoovlswzHwO7sw+gOfUhvGWnOBLiEFGatTIa+gjBj8kHWoTLwZ
         wXQWF/pguqda6tnXS+ovNwO6/s1L+fTvZubypwm28C8R4qs5VLh9QTK2zjfcQ7S9BMQr
         C4XYws3RYOreeXQMR4c+Qmydcj2WueWHlZaIRbl8gb0rtoDOHrj77Py06EcrRbWvLQgq
         6XOwY7oPUqqHgGOlpt+QtOeZgDS6xdIIneLP60gsojD39cRUwMmHWCyciOa8lSSEnK8C
         DpcBLLyuP1X9XT4seoTfPq+Hsj48v3IeI5IGcTA8xs305ru2h/W/wwCI4Cu7AzcyxNSc
         xM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612181; x=1796216981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RfHhL82RSFRjqGArWKhGQj6Yg+HmOa+wEbBl0/BNQSY=;
        b=KtLJuSla2KprO0g3bC5Nur8Kz5y6BUjhLAPw6/n5mgsGCvUe0WWw72tlldwgnHWvyT
         VNBVSYG4yHppQo7dAFBGh0FZ5YBqfocQO27qfSfnEUl0W3v7LbnnCg51hEWs/NcmwjAM
         LD6h+cA9cojPOfS1bcp6/ScOn+t3QjTg/NOLxJ8V6F0LlrZ81Y3LyYlssabOhwdOmDzR
         51vS56+I0R3XkUqp3TenMqRdkf/EqKoLjdDvyFbofYtOUOGC/wYTNvdGlJDk+AKJhCrY
         yeeI0vq1aabL3yLmuZM8jXMg6Dle57Rwv1soHEknJgtOdg3z65oyWI1NxvBlwQ0R8qHE
         TQZg==
X-Forwarded-Encrypted: i=1; AL+hErFqFqQZh5XeRahUTi4bGFSiho3kU0xd1jMkK0hLflPThrUDoVTXPbqtYOrVcRfPzsRJIAa62a0n3/stnoEr@vger.kernel.org
X-Gm-Message-State: APuU4Z8ys3+ZP81v9I/P9S1F5btS+uvse7/zXeLkmH4N0w65hc9mKFnb
	Yqepk83RbjcqnXXnZ38o1tGnSboHTVnzWHNQZnWoU4aW6leHfDPIV1ILvAgEKoNzbLc=
X-Gm-Gg: AZFdTZdPbI+q5xm6qKSdkr8993CWR4nYs0DcKjjYiHbzjdGkyiQgdL4PuRKMlWft19q
	8Nd4qBmDc0NU7KQFYs0LIyZWmYHb8tzrRNaLx47dO8kA1gObgQr/grv4kvz5OZgo7jrfeCllp/k
	jh8PQXO46Q8tJpuLvJzvn3kQ18NPm4Qw8Jf/sDlvYdBPzA5FU/txBPP0CzqYKPOzZxo5h+CHi7R
	PmWEevmKpCTJ5pmTHvg+Qtzw1jW083xhas7i5HZmCM5hko6yFeeHTC5YWhsrqS3uFYKYPSErVRW
	ia99/n8obwLifwu79nbwysqIzHVCBSxQtIoJx8/OJAPXFz/6Lj2YcPxMIDVsnnDWZV1Fbzl7vWy
	K1N964oa9JpeHUMmLAvhdv0MJ3ffOzdhGng2ce1aO8VtG9FNPqtRC/x28TvcnuwmUkb0qwXR7a8
	mYQZBuFgT/3vihPpOG3YP+U6IFpQTbVF1lH94HTrEN+sUfscSpH+nIOgeOOuJ7MWq3RVyNIwARS
	Ov6eUZBwQ8Mq8BQD46g1GMcZ+n1UIzLuRxPhHkpMPsgKyrYUqfUiVgIaglKYFTVNpzXq4Xc2yJF
	3CKXfrswN0C2JbbN/LDQ/bf3RxNO4VLJ9PY2oRZVgV2IGPbHx2l7ox+2luYCZKDziEBWopM=
X-Received: by 2002:a05:6000:299c:20b0:4a7:ed95:7ca2 with SMTP id ffacd0b85a97d-4abb7b5c76bmr25510841f8f.52.1795612181073;
        Wed, 25 Nov 2026 05:09:41 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm35240355f8f.2.2026.11.25.05.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:09:40 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 14:09:33 +0100
Subject: [PATCH 06/11] media: iris: don't return a spurious LAST buffer
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
Message-Id: <20261125-topic-iris-decoder-drc-fixes-v1-6-58b9f6b3fe86@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2834;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=IvGdaBlzk5dfXTzAfmZyUO599GL97WDoGnlQcbGakoE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBt4NrT45CsJj1ahd31s4XC+tkoLO0ByJUkmz36wd
 jxj9tAmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbeDQAKCRB33NvayMhJ0XqVD/
 4p3Krf5847lLitqU98qSwwWLE6LU3+QzmqhxNOrnQdyug8Zs9AGWtN5uqAXw6WxtY9IJVAC+5UHG17
 gI3/G3XnWpGerbO3ELtW3MryBglQhZBVg4FzoG+4I2NkPMtArLRnKVY83z4llHzg0sC4/cjf/gdVms
 lEHqH7i3IJR2BVr6jBuB8DieEpBjmdW8muwlnR1eX0HrTxiMR8s8dmkQMtj+XlT8ab2MZNrDsXvfj3
 zu+344reDAk3TbKsbYaqVQAeMHs/B/q3sdX3PTeTJ7sGHkdwt2UO9qsW9TsOn3XjxP5hyddmMXmqwz
 3icugIDwOHnOzJBMAHqzh36CKCEmhm5UGyDFZcVH6jhdj/BIPsRGoKaFJ72kYlgLzYjc1E6OYNr4mZ
 nifKynvd9UQ306dIimWWCfP0ouk+8aldSo8gXbnb2/0gT0Yi9dSdmkOXdfFv0DFfUrv829u4pk8XZW
 Ajt93WbejNTbQrHWxZQLCfFdvAljy2kKK78V7xRqqG6EfCkeQc0tYGj1PqrXIzOIMEektg7KEtVwI8
 PcIFNLbjyVSOzZ0xEXBp7PWYDEKTnfPnK7uSDMaq0fTBmZcniUTxQMpRrprTXAiWI/EFhMnkikccxW
 wcl/pgOaZgnl9qwEmyQujupbUsH5ooC1rpXlXgbGe1osXhMLVcz8kEqznb+g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

While a source change or a drain is pending and inst->last_buffer_dequeued
is not set, iris_vb2_buf_queue() returns a queued CAPTURE buffer as an
empty LAST buffer. The client then gets a LAST buffer the specification
does not expect in two cases:

- iris_process_streamon_input() clears last_buffer_dequeued on every
  STREAMON(OUTPUT). After a seek done while a source change is pending
  and its LAST buffer was dequeued, the next queued CAPTURE buffer is
  returned as a second LAST buffer;

- vb2 calls buf_queue() for the buffers queued before STREAMON(CAPTURE)
  before start_streaming(), which completes the pending source change or
  drain. One of them is returned as LAST although that STREAMON resumes
  the decoder.

Keep last_buffer_dequeued on STREAMON(OUTPUT) while a source change is
pending, and only return a LAST buffer from iris_vb2_buf_queue() once
start_streaming() has been called.

Fixes: f15cb8652b4f ("media: iris: Improve last flag handling")
Fixes: 92e007ca5ab6 ("media: iris: Add V4L2 streaming support for encoder video device")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_common.c | 4 +++-
 drivers/media/platform/qcom/iris/iris_vb2.c    | 7 ++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
index 61634df56797..c3712a29ca85 100644
--- a/drivers/media/platform/qcom/iris/iris_common.c
+++ b/drivers/media/platform/qcom/iris/iris_common.c
@@ -83,7 +83,9 @@ int iris_process_streamon_input(struct iris_inst *inst)
 	if (ret)
 		return ret;
 
-	inst->last_buffer_dequeued = false;
+	/* A seek does not complete a pending source change */
+	if (!(inst->domain == DECODER && inst->sub_state & IRIS_INST_SUB_DRC))
+		inst->last_buffer_dequeued = false;
 
 	return iris_inst_change_sub_state(inst, 0, set_sub_state);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 426810c848a4..b56c855567a6 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -335,7 +335,12 @@ void iris_vb2_buf_queue(struct vb2_buffer *vb2)
 		goto exit;
 	}
 
-	if (!inst->last_buffer_dequeued && V4L2_TYPE_IS_CAPTURE(vb2->vb2_queue->type)) {
+	/*
+	 * Buffers queued before STREAMON(CAPTURE) come here before
+	 * start_streaming(), which completes the source change or drain.
+	 */
+	if (!inst->last_buffer_dequeued && V4L2_TYPE_IS_CAPTURE(vb2->vb2_queue->type) &&
+	    vb2_start_streaming_called(vb2->vb2_queue)) {
 		if ((inst->sub_state & IRIS_INST_SUB_DRC &&
 		     inst->sub_state & IRIS_INST_SUB_DRC_LAST) ||
 		    (inst->sub_state & IRIS_INST_SUB_DRAIN &&

-- 
2.34.1

