Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928890;
	b=AtAgeJ9W1zv0m0mzBtSgxS6Gt4izKGaqXrgyZ37q2i5uU2EAVKO3QMGsq5D4Y07tTLAO
	 u2ZMJMtQN4W7ySHIXfV8HStLSSh8MbqyjKnLl2E9JGjcSNb9HsqXD5rNVNyG9F5S8pkM1
	 01Mb335zB6v8mijd1tj1gAvJjnXGpU3DS2fhIwjGLEMlIPfaCqOaJAbwSRsbO+m0mr3hJ
	 fv69lqFRm3ClA4Li61Js3rK0CMLIaHKT7NC+yAe42kyOl6aCsjBDWVw19nG4zJL9ywcxV
	 hwcJBayvqIrg4vvXB9EbTA1COXcjkmntKRL18hFhitI0jglX5ZmWS1sxbJZdn19lnag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=StzyxbSuvXPXmgG5QlRp9NABTSBhGgsMMch9p0nc8yQ=;
	b=3DQT6Ul8VMh+0iWvdfAIJz7N2DDHV2onCIJJeDrKNRqyn3Vuhl+tYUGpfIDTARIuSHYC
	 5ytDdfdnLUG2fk9GMilODgSsvBmDOTNsFoa/ZCaUMGrJKAcfP/SqGzhic0+3tajPwz6YZ
	 OHkq7H96aNx/eFExCzXUCg+ti8Mky6pzduUG/F1phglyRB+WL1h+VXgdO11zSvbkDyQj1
	 igaVTI3+cjiaED2Yi3CWegHy237qGe3lUC040ElwCqpPznwT6WUkqp7auDBaX+9sVFXXK
	 5Dc84j1NGYr1AujWxLGW0UEJJg6vjaJwTdDcpJXzCXM2cGe+z85r3j4PXqZpHJLMUzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pqdFJ3Uk;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB5A606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 15:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBB5A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pqdFJ3Uk
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49465892f7bso3875171f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794928888; x=1795533688; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=StzyxbSuvXPXmgG5QlRp9NABTSBhGgsMMch9p0nc8yQ=;
        b=pqdFJ3Uk1SX6oEcpPN6XKmXl23PTDknFtxHdAPh6fjtLqPhYPRz/lsl9cseFAmGWQN
         HDY/2IKNupPpk118cODK2WQRIQEbMQ/uhNgsE+GoR16dLWWF7hzsp1oGzexGJKyVtVbh
         uQST/jsPZ2l+N+uQukz1E6t05djfsTRFt21N5q+DGByneh03jZBAcpO/D2VIfzETadLy
         P/AmYNKet/S6JIbFHRR2zymfGjAhH2495PNYbSkLXVOe+licujHcZjkuI4ip6od9ijcx
         PYfI+IqHA83Dy9rhZ6Kc8pJGmnAYLrWHIk732IE3/pTgPWogaq+krtFT17NTXyisTLgj
         Haag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794928888; x=1795533688;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=StzyxbSuvXPXmgG5QlRp9NABTSBhGgsMMch9p0nc8yQ=;
        b=d0yPOuJoKAzinHGcVabbDKjBrUN/34QLyG7OcGNU3J14NQWFJ6n2duTcXvdU8lH7EY
         5XAwftnDhHMxzRa33uHzr0QwCOQ8B6b5m7Gu4mw4v05qtGXfwPRS6JHA1szWjgs406v7
         AObYShJamRdEUu9TtR6PqMb2uCZ6WGLx9d5YDgRevJVnSa/J2rz7CDkT3v4krdWMGeLA
         4RPdVffZRshoLH9O9HFdgggpM17nOgsFGkW0plbAQlErfU6/nfLQ1EM6LfW48rCDDMA6
         FVPhWge8YUX350I5x303XseQBser+IEboPMfeiM7zYhcN8DWjJmAMU6bIz0UOHl3CO5t
         SVjQ==
X-Forwarded-Encrypted: i=1; AL+hErHhoQ1NMXTgoQY/Deq6rwnOrVcF3HQ4xBzeI38GMBPmKq6uf0S+OV+OvqDmTQc8HC4RyZYcg8KcTWHP+XRz@vger.kernel.org
X-Gm-Message-State: APuU4Z85/ubpFlR4lH+PN2Q+Hcxbtp8ov0u1vXE1glXFNhI70iUVswcN
	PaI1Kefp0pAkcJ+jmsSrMrvVtr24/3le97hcn/CeO3hovMZOqS1BFI9wteAL6LBREoA=
X-Gm-Gg: AZFdTZegThzMQIHko76sL8DycPfznHC7eeDi9qp3sSxBsD2mwFBSqhKCCc40o9S2dVc
	KHU5LfnIx5IAuDuCGAWXe1Kp3Ereb6i+1iORr24dTLZopW8XPWgaY1PEx2PXQO5Zv3HV7jFZ+0a
	iMtiaE+BIBshKfj5sLzLEUvSnERhvJyQgcOI9XPoIuYRm6cH5TPB1vhpcVmt9jKfAs6w3iZfoEl
	I7a6TAbNn3awoALH13fsghsgUnoIBoQ8VdR5VBU4et4MD0idyIfe+dBqn1EUWbnRUk4DMDVGHBx
	tyG3FmdwJcfrH3m/Ium3E9eDzr8nGSeZ/HNv1oieGLvKF0+OC1+AgdzhzOTMFFzN4WzYPiWRd+L
	x9Juw9HEMmDcCVhf/u/rkL068IbWUKXcpxzvkmOpDi4yioxPZiMIXVQ2mP3ML2ji6mwOgTi46OI
	CPBv+eiNza80a+yqVR6hbL916Sp5bD4NkO5zY7ErAs/P/jOiMKLZx/tmhxNyvWJLM11TMwCeJYl
	TVXC4D1z9BEl5UDtmSvuMH5Cujl+8Z16LMnVXzN+p0e4yMSzn3rcGNTqLqNTPhQR79tsWVo2JVg
	9MUmRYlKV9iR7IoNtwqC4Mtl8YXoJVtO69jw/KG0ddqXXpOn9Jxr++Dk+WDfFZpEYq/mdj8=
X-Received: by 2002:a5d:584b:0:b0:491:f34b:49b4 with SMTP id ffacd0b85a97d-49c729bb9ffmr29483716f8f.44.1794928887864;
        Tue, 17 Nov 2026 07:21:27 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c607d12c4sm26703133f8f.41.2026.11.17.07.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:21:27 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] media: qcom: iris: gen2 encoder picture type
 subscription and operating rate fixups
Date: Tue, 17 Nov 2026 16:21:22 +0100
Message-Id: <20261117-topic-iris-encoder-fixes-v1-0-169ce990d12d@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAPJw/GoC/yXMwQrCQAyE4VcpORswFbfoq4gHzU41HnZLUkUof
 XdXPX4M/ywUcEPQsVvI8bKwWhpk05HeL+UGttxM/bZPIjLwXCdTNrdgFK0ZzqO9EXwYZacJOqR
 9ppZPjt/Q6tP573heH9D5+0fr+gG/SPSzfAAAAA==
X-Change-ID: 20261117-topic-iris-encoder-fixes-9f13c6ec765d
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1887;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=X76j2RucB9cYIefazEt219GMg4ALlbHtbzud5a9f9ug=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq/HD1FMEJkw6TckTiCSiRBUN7om6ote0WXmWZQJS+
 ytilHGiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavxw9QAKCRB33NvayMhJ0Z2FD/
 4wEUMRwSs/QnnUn5l9pDPrKiL6NmtM4GOTCzM2Kk7Iy5sfVTeu+0H1mB5NOid9pR9mSvHLxjOdVALw
 bREFPKD16S1vfORRZ3fJJaLgoao9Bcr/DHhc/QtjkS6Gya2/xkkyBZvQ6jW23K7dubJrCdYzviIBrf
 Z2KwE5fnYbBe+8/+puPnZ1JjVrefx3CBBh5SR1/wn56pSwID3vQXvJBIshsBHt9JaAyFqHVDOAHftE
 fxtkbyIiA3fqKEnNHhcfIQZ4kYM1nVLogTscEdkQFywmq7Trykvazk0JKEL6H/MG2/df4VMGLdSq18
 vT/AL7sCfYntzGVFZ3u4rb/iOx5rbvPRWowWSBlq5oxoxlcbX7LyHpqrhGH3GvLgDUnJG7DLqp2yfM
 tZf1wrCQDsbfOn4cPrPQGtTCY5efR1BMVzJ/2Hba+PT4YD/OcGEDkuTnt21kn3ELh5FbIu5nwfEIQk
 8l6K4+i9U/ag7jA7Tkzw1dewr0DvNqwJKzlJzEvZvwnK/vbEwKGz0qw5kp0GMPhWhFCQUOtYIuFj33
 ORcXs+FFkZ3TqEAuFs2xWWbLaZaYiOG7ezhCcHtpxjZC6hdz+ucwZDhR3vzea94gybeGSR6kKM93i/
 Xb/C6zO2H61yLSxKI29wbOOTnBwjMDpCoricn869+rW2cMMz6ieiGMT5abpg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Two fixups for the Qualcomm iris encoder:

- subscribe to the picture type on the encoder instance

Add encoder input and output property tables (HFI_PROP_NO_OUTPUT on the
input queue, HFI_PROP_PICTURE_TYPE on the output queue) for all gen2
firmware data tables.

- venc: drop operating rate to match spec

Per the V4L2 Stateful Encoder UAPI, the frame interval is set via S_PARAM
on the OUTPUT queue; drop the unused operating_rate so S_PARAM on OUTPUT
sets frame_rate directly, as FFmpeg and GStreamer expect.

Tested on the SM8650 platform for encode using both FFmpeg and
GStreamer, checking that the frame rate is properly applied and the
firmware reports the expected picture types.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      media: qcom: iris: gen2: subscribe to the picture type on the encoder instance
      media: qcom: iris: venc: drop operating rate to match spec

 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 23 ++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 15 ++++--
 drivers/media/platform/qcom/iris/iris_instance.h   |  2 -
 .../platform/qcom/iris/iris_platform_common.h      |  6 ++-
 .../media/platform/qcom/iris/iris_platform_milos.h |  1 -
 .../platform/qcom/iris/iris_platform_qcs8300.h     |  1 -
 .../platform/qcom/iris/iris_platform_sm8550.h      |  1 -
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  1 -
 .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  |  1 -
 drivers/media/platform/qcom/iris/iris_utils.c      |  8 ++--
 drivers/media/platform/qcom/iris/iris_venc.c       | 53 ++++++----------------
 11 files changed, 56 insertions(+), 56 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261117-topic-iris-encoder-fixes-9f13c6ec765d

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

