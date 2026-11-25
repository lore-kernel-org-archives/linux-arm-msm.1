Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601587;
	b=yce/I6w4nqu6UMYN190J7USECDkSfOBaOBqwCRyaNQm1Deg5R7Sa7DCSeZo6WS7V2cDS
	 koXjKSeyQgLo0yrzTvT7ECQ2F+Gqq/fBKhjg26QSSUrRDHex/1wDH/TvPHAFl7siKIeKM
	 aVpr34yHFWep1cpfX+Gmx2m4DmGyZkYocRT4b5XbwW8XdtC6HFI4feLnU5+dY9YMZmYHf
	 ndNpDSW1TmN3Kvf7Lio/Y/98zP44iy5O3L5nEIWv2KWZgsZ6cpr6S+k4EAvE67IIc5clp
	 DVXD4m5HCFrKUXIsl3qwmmZN8VHSY2phsljmXZ8SH5/D1k9UNfP3UuD69l0y+6ldtHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bpxsMEzQShqs/OoZ3bJC6L7ApSx4vfpGRnQ+ugNkeyg=;
	b=UMXLqGvj3GxUB+7+uuJHlFO/moTxaST4JFSbzn5HOOvnWsFTW7jUvi9KsP8q9HNKdGU4
	 4bl0qXp7SGVIuhreuqTs8hBVH9XFjJzdMemHOX5B2MWmuaaqe2XcoLL6/R9Uz1spXDizD
	 jAGsAdalfsDdkyOCAarbR2pXJON5GnEWc8Amksf0xUkyi91TpAT97ONVtkAjJGwgEbd7Q
	 Wvl74VPYgZTGMkiDYbOjkh+jckvUbyM3R0lzIU13Hvr5Bpkp8EcWlai7hzv4erQ+tAyqB
	 qRY1+ero8KakeqyoTxVpAOJj9E1nBEQuLg9rjQmvZHNZQm0clyPcQ5lFBpMST0Ebieg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u4SDCgOJ;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34985606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34985606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u4SDCgOJ
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so3475105f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795601585; x=1796206385; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bpxsMEzQShqs/OoZ3bJC6L7ApSx4vfpGRnQ+ugNkeyg=;
        b=u4SDCgOJcau7hjh4j9f0aBx8YVW55aRs9h2pu91B41vNDRDRgb0KSlvsDQxUVDk7FV
         kydHD6YOABEAN5cmvFHHIojLOLgsxZjubHOnJVUeWKo25GzbY69NucmqCUpKTTfXCl61
         M7SSkedajAAaqITBoSma9oHQLcI3mb3EdOD3wHLkJvy1Gq0UkStkOyF13ZPkrRXE73s3
         c0ZgNvbg6uzWBlZxasCHwDrP1579YfWQH8ZCxCVnOduMX9HE6OlHfME6IrbglVDTegSj
         nrzOtCWIdr8x92vbCM8aq4FQDweTxQwDPLV0iwgz52cezkmIn25VHMZdJJcB/j+fYC4z
         m29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601585; x=1796206385;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bpxsMEzQShqs/OoZ3bJC6L7ApSx4vfpGRnQ+ugNkeyg=;
        b=j7CeMY1Ja4Mq3Q4pWZKY7GnLF/DvgcV8eM7kc4WjYV7qMPRhVl1oPHGH0X/5puFoyL
         xUWnSosQKYkLRd1my0WuHx6aKHZIHhsR1oTmVlBp8T7N+rpJDJ9Lygbc2HABl+h2+fa8
         DBVka6epqteF9L91SahRjZSUzv6guCV5GSdDi2/47ylljWGU9BNuT1HTDwD7q3liuNh0
         DRASOXr1xH0SvhMiXusoZddxnTu9ZfmpiBnSXoCg0+G0Gp0nnJF7GbuhKiVq8nsFxmhv
         9j3LXBRDT9Jmbaz77RzWqomgXTHGrqAh+2k+IRV3sCTlzZKTFzfS0N3T4e7yNNAmCBbX
         vH8Q==
X-Forwarded-Encrypted: i=1; AL+hErH2n455uOaTElK8Fo24YnlaNGdq4gn0PBV6vV1uQAddloodiG3aAOyKY9q3fiigogNGAqZNs4YrdwOig7do@vger.kernel.org
X-Gm-Message-State: APuU4Z8+MR8WDXMUg4Idq4hUipSo9Hlj4ODLbSzM0ZJYv1tnTqlwhhUr
	SP4lQy2z975n3M5EpD93fvPUb/t3XnSlK+ZmgGgwXImvehOpSwSWyIT9rc/TqbqiH4g=
X-Gm-Gg: AZFdTZeci/d2UChaAPHPv0fX3Tju/a7ek0hbrEFAIe4KTJNLcivPMGZDMursVVEHZiZ
	49UWDXIrO5iqWvEUDrA7AGFArXBOJn9tXhdG022hdhR5sVLNfVJYvhDVwyXe/HV45QykOTZtAon
	w6BN62o1j3TX2BJLbObZV9XugEbTyrdr1OBGWLi60uMt1tOWmXnSTtP97IcQJmh3JoqlMq5r9+p
	u3qdjXVHLPewLLnoWV9DTKq/8UlRTB/J/JanDeDJ3Asrw3f3WAuoKOIjfosjBeZuRWYaBOXyevA
	kDzY6aZaJvpqWqbwhXwoTSxleg5cmNp/mH6XGNrID4QZSYK3VbpOpV43HUdDE9W5SAUDrWTbLJR
	cP6mr2qHfV/GlLZgAJjyahLNLWPpKYkLoMfExkx8HQ4fiq3Ath4hEGdXV3S4Ip3aj6/LphZ/sO4
	YAEa6O6mJhJri1KR89f4hLlN8mw/bmAbnguMGwMZzI3i+apOLaF0EHrK1MQRnz+k5GnS3kyJJFh
	XeF9ANg8/LAQMpOb6pXQIvI9Z1OB+4t4d7QaOmlXM/sv3wWL+OKUtsJNLKLTl68zrqLo5g6zqgG
	uHxyJ/hpH7Xzh4ui0mHCgWHuoCLnGcgK7uu/9VU/0WHb4biHCA==
X-Received: by 2002:a05:6000:111:b0:490:71a7:6f51 with SMTP id ffacd0b85a97d-4abb4c7aab0mr25911997f8f.45.1795601585408;
        Wed, 25 Nov 2026 02:13:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm31713382f8f.18.2026.11.25.02.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:13:05 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/2] media: qcom: iris: gen2 encoder picture type
 subscription and operating rate fixups
Date: Wed, 25 Nov 2026 11:12:59 +0100
Message-Id: <20261125-topic-iris-encoder-fixes-v2-0-fe6af9761f83@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAKu0BmsC/42NQQ6CMBBFr0K6dgxTY0ldeQ/DAtsBxpiWTCvRE
 O5uwQu4fPn//b+oRMKU1KValNDMiWMooA+VcmMXBgL2hZWutUHEBnKc2AELJ6DgoieBnt+UwPZ
 4coZcY85eFX0S2oNi39ofp9f9QS5ve1tj5JSjfPbvGbfeHzczQg1orCNra4/aX58cOonHKINq1
 3X9AniYQdrTAAAA
X-Change-ID: 20261117-topic-iris-encoder-fixes-9f13c6ec765d
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2473;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Pf4j53aIKZ8+z0XTljEQ/c9VMxY37xvCoE1SNBL9f9c=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBrSv0C9QCmMMutsvZFksAZdmyew85JVEm3DIXpBK
 EyxVGDaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawa0rwAKCRB33NvayMhJ0ZFHD/
 4x9YzPDVm3i9ZnNJx06Dj/95/zJPUka050DHJEsiFBUzuhrhBGsciEPd3lwDBZbwg0q1IbhkK7FEh/
 m5Bgfsv4N5G4K22TvMtpF1apTAN1Pir//z/edJXcH2ewp7N3RUlg95xD7GKYQwPqn6fnwaGJ4bR+v9
 f3zdXKRxmgd9rscClpvXgoIJAxZd/XN968qtkPgPJgbI2/iP+UsEs1y9X6iOyHhMZ04zELFEwHA+lD
 zGwg7H43CU63BK6JI10DLuc0x6ilOL3TFw+QCapdVZKdIpT/Tn8qxhfValI8YzTLOkdnrdCe3i5zhF
 sp7XXlLNxUyVzUV8ElfAoqbUbBDZbN6Zew/LKObAPkV0ea+az9xdcltmMKpG10joBvGclD2+i5gqnj
 /B3NGktwlzNNneu8H4a8jICyUayryviz/Y+YaE4AQ4T4mV/atKCgnqYdfANDxO7Q+2DtH41QfnCYms
 EMFHiq/ZqJb+LS7fKIZtRoNqBwjBqPKxABaUuSaWD96LkSKOJIyRKddpk0EUdRydD3byTb5UPSyWc9
 pwKkSu8IjswoYN1/1oxWBm3FFJzM7dExl45Go4D2JTec+pqjVLcYqlmhbcCl9+rl7hcwVn0s0B444Y
 0yv1Tu5yDXlcfkL34ocaHhAhwK1LZYtU5jLtpY3ESn92vKq66GkHw6Mc1oSA==
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
Changes in v2:
- Add Fixes tags
- Drop V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL
- Return -EINVAL on CAPTURE in G_PARM
- Link to v1: https://patch.msgid.link/20261117-topic-iris-encoder-fixes-v1-0-169ce990d12d@linaro.org

To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Bryan O'Donoghue <bod@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Neil Armstrong (2):
      media: qcom: iris: gen2: subscribe to the picture type on the encoder instance
      media: qcom: iris: venc: drop operating rate to match spec

 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 23 +++++++++
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 15 ++++--
 drivers/media/platform/qcom/iris/iris_instance.h   |  2 -
 .../platform/qcom/iris/iris_platform_common.h      |  6 ++-
 .../media/platform/qcom/iris/iris_platform_milos.h |  1 -
 .../platform/qcom/iris/iris_platform_qcs8300.h     |  1 -
 .../platform/qcom/iris/iris_platform_sm8550.h      |  1 -
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  1 -
 .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  |  1 -
 drivers/media/platform/qcom/iris/iris_utils.c      |  8 ++-
 drivers/media/platform/qcom/iris/iris_venc.c       | 58 +++++++---------------
 11 files changed, 60 insertions(+), 57 deletions(-)
---
base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
change-id: 20261117-topic-iris-encoder-fixes-9f13c6ec765d

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

