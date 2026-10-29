Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267735;
	b=sjfrugJgs+7orJXBIWfHrOsmyoJB52twaZXUHEO0wqqBuv2h+6Xw7tn6R3/I5Hjk8KfD
	 NVELM9UCA3IiTL/r5kTaeBGl0eA0UiysP7WpPdouZw8+U1eu3na4zi0UXT8YjlQR+g4qf
	 6X3V4LsADrYWLncydTbRZuOkFRXCMDUV6kfOPnFrbnQIjaTOSv0lGkcuYG4hNc8fJiXdx
	 qLBESBZLvPd3Hi+MI8jQzvfsFlYAZhn6kddkkCwvieVs668/HA6bcOc3Z0DD0SEuSVCfs
	 S8YJbSsHnLZDiiQHce74V0ryWzD37Uf5G/q1QHl5g4dLVcQ9KSZtHLuzRmZCsFc6X6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=yprnLM8yMFRE0F3Z/EeO/BSd7mpeYOvDRbj7QvgaOTk=;
	b=kHs+RTpFrfwRUORFLbzp832V0Od1lKxr/bG+D2iBKEW+Qkk4Yj/UsBZ/4J3JSvJCb2sg
	 g9MQU9pvO8E38Y45wTmCouhZDca/h7yI/pwv1sjhll1cGl1Fsw1NkkOrCrn/IqwpEjdF/
	 Sh2VFWIuyknAVZ79scHGbfFIJtKmMXXz68T+Opwvi2CMHf0vArTwrkLzLkIccTK7iFvY7
	 tKP0oxKLsT5HaEMxPl8lEirmEdrHNh8DBKPg6BQG68/qT5LNd4f3/fG1SoTALjUpMl1GE
	 emjUVzigF9XdqqjqfKd6vA/c4658rLvBWjPgdBCiK/O0/reIm9U8px/9/hdIxLSrWuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q9YGsWcn;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35165606A33F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35165606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q9YGsWcn
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so4774195e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267734; x=1793872534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yprnLM8yMFRE0F3Z/EeO/BSd7mpeYOvDRbj7QvgaOTk=;
        b=Q9YGsWcngmPu2DzGl+Bnt6mF0+wdUetcZLIgkVnHBctmiXm0M/7IgHA5Ov/udP4Ncf
         5QphMDo7woNFxYXHp/SrjY8BlnKB5dtueReeDXYRZvtFBx792O2fME+uWTpMBK3EcWVU
         hID6bWgmzJ+uzJD44W9AWIUdzBZdEyAo2HVAousQMmZasZKxUerzhmoHHHhVGAPlq8/N
         JLoM6ZPf8xolQekV8Ed3q8a26uSi4Abo3iCYrRa6fI2Rq3AleryJcDEokMbfCYbmO94c
         qRH+tc/GnzFWGnfkoRJWzgHmhTuUERyajOu+Jns23bbEnFkBcbP252mSTuKW9hUEFBLV
         Ntfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267734; x=1793872534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yprnLM8yMFRE0F3Z/EeO/BSd7mpeYOvDRbj7QvgaOTk=;
        b=yzxPD6OUkpI9SxfqfHwuQGHgW/X1y+3n+GUtt6BoTrRTSkkSEBAj++nYwuparuy4VU
         xesrl+x7+PfUVz6Xb/8F6+8nJYryw5s4zWlqpZmanymzIjn+E3c3/+NCpTWobd2MLrF5
         ZDVv09BrO6xpp23MVPrZ/WjZPfnhaya8mN9oBo3rqRgC7SjYIh6WXQpTEQenG6YY+Zrd
         Gx/fGrlH2D+xVs1cZ6isvhtrr0uI+XC4UpY7o/CqFMW04u7RsKEnlVFSz+hvMxpu+DuA
         9NHFdf/aJsEWdfTHeBElfyP8lolqlgo35lEZgru1XK24VbOVkB+/Y3sLI0Se16HwUR6V
         1wQA==
X-Forwarded-Encrypted: i=1; AKwUvBy5ZMoNXIefQfxGzTsJDUQlJUbRcL9qQTQpzm9JE1rVxuiKQEIyhz1UuOiD7xedkW6zO1Yj4yNRWcoQUN/j@vger.kernel.org
X-Gm-Message-State: AFq9FYKA8KWsp5tvpUQvjJJs65NdwoEyhnlifFyxX/rR2P8VTHC9yB+a
	oqMalHXTF7FBxLRnDLC95PTCsQzGYTcbDaRYCH0k/MTfzi1lvjUDr69FV8ZJRDHYcBY=
X-Gm-Gg: AYBFou26XTX1mtmpZ1c50K4S/vljg6QhfW658UNnp9vudRAm5JS0Rb3ehMr463W80QO
	ndflsnyZ/otL/xhxCVRPQdhNnNLmpW+/X/pafI8WM0MCa3wkHXo7fvULoI1I7jMxZwjz2FKybuw
	7zOfIOvaeVzwf+J4AU3TSe1ZzJ7gWduz1v17Rl5mzVJtdBAXPu/OaF0HQwmRqby3/ugS2Ade/vB
	cCs9I29UxJyo9eH28iantHiR63MXA8eUbpOQlI3rXBrCUhwJE+OFDN7RJzd1WBUPHSFCzYcI/OI
	rI+kGMnnNREqXqotqlnI1hggPdiSnyh3ftviPUZTlRpdYoA9HlWAPLQEzwDnDsPJSK0ikP/CYem
	wGgL0CVeX5Tq79YC9ZoR2D+ASu4oSSwNuCiwBYcGBOr0kceWqvCUmtt+8M4UlaeZvATSZ5z4E/W
	pplu4HIyJfWjRrvB1SrOd81w0wabHIh2hjHzdkco0Ca4IyoMKTvhJrhueftlLfd9P6W1mAl/n0J
	C5TA6yzLa2uYnMrSoOGTFoqOmFdE1tJf4E6ff2JSSLCPKWjgJ3xV6u/ls6Ql5UXKo0Y/IJFtg1P
	jKQIQiByTmp/qG+9PgE=
X-Received: by 2002:a05:600d:1a:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4aa86e16223mr47807685e9.2.1793267733672;
        Thu, 29 Oct 2026 02:55:33 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:33 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:15 +0000
Subject: [PATCH 06/14] media: qcom: camss: csid-gen3: Enable RDI EOF
 tracking
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
Message-Id: <20261029-v4l2-frame-sync-v1-6-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1454; i=bod@kernel.org;
 h=from:subject:message-id; bh=kAQ7bWfn2CUyVqsLy1cTneFlv+8/L8CS5J0AQLs8eFE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgLuEdDz8et7986CyGOh8W+0i6zquatnVwBz
 PBjXI6YopqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYCwAKCRAicTuzoY3I
 Oj5yD/984HKV9jg/ruLA+pjrfG6WfRP5KWxH6URBXlHJLJaRWmgtfJ1y6Pb3xRlmZE0PnEKirC1
 wSu4jTIOrlmNhG0gJbIsUmSGQ2zwtRr5zEPW6Z7mor5KOj4DRPiDKfEz7FsI8TBb85JI5w56+kT
 QS66+a1Mr9DVWRMM4tSGHmaB4K+vLj6eezihNZiadhPUMKTNRtgSzkqPOQMgc94KdiLmJg4lGrN
 8rHnpxKv1d+KwY+OphTHlDKu1CQ3XAOmxh17P64N1D2E69yKh5mYvQUcJkYZtEzufXl4G7bdtjf
 kbs1mIRn8g+I8llPVtkNUxE+EqjGY1DGGb7WlWoYMz8zN4kmSxEqrmqFU4+SSGYa0AbaNC2GBmP
 IyS1NX8Fa2G8ALT6+R72uvoxJh89zrZw+iyW4an63UP6YMZ5/593onP81Kjsj5Pxh1xGMxcLaFd
 +x1i7/SUHM/7W4w0DKZ6q2Ttt5escGcXCd9yNMywUz3VYPbY2aC8mBfA6rWXmhVg/GQ6lvLgX4U
 Sqj7b9NxsDrv8bFgL6fYnAA/IkeCQisUA9LmAA1/jtcgFy9kE/+UEtOFai3Y4nnFM3VUmR7kgs1
 k/K8kutlEfoJ+KZKifvWAz6ojbw2WfdVa3tDg5xR4bRGcadRSBtk6tdHuVlBCzInUNpX0gQ0nzt
 ySQfBj9Cgl4l0KA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Enable the EOF interrupt and notify csid_eof_event() to drive the
vb.sequence.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-gen3.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 6a538d825f78b..5a7a328f6c0e5 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -61,6 +61,7 @@
 
 #define CSID_CSI2_RDIN_IRQ_MASK(rdi)	(0xF0 + 0x10 * (rdi))
 #define		INFO_INPUT_SOF_IRQ		BIT(12)
+#define		INFO_INPUT_EOF_IRQ		BIT(9)
 
 #define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)	(0xF4 + 0x10 * (rdi))
 #define CSID_CSI2_RDIN_IRQ_SET(rdi)	(0xF8 + 0x10 * (rdi))
@@ -228,7 +229,7 @@ static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi
 	u32 val = 0;
 
 	if (enable)
-		val = INFO_INPUT_SOF_IRQ;
+		val = INFO_INPUT_SOF_IRQ | INFO_INPUT_EOF_IRQ;
 
 	writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
 
@@ -306,6 +307,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			if (val & INFO_INPUT_SOF_IRQ)
 				csid_sof_event(csid, i);
 
+			if (val & INFO_INPUT_EOF_IRQ)
+				csid_eof_event(csid, i);
+
 			if (val & RUP_DONE_IRQ_STATUS)
 				/* clear the reg update bit */
 				csid_subdev_reg_update(csid, i, true);

-- 
2.56.0

