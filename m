Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267730;
	b=11/PmO1gGQHBicPPeGI0bDztN++y84HZPqCms/LJ3d/hbedI6EH8CmEf/nPVGGeeVSO5
	 LHjXYlDZ4cg1FOUeUfL+eSV8/BuPfw4OmZh0ctSEKLnJzuqgRneGWTNpIi/Z4fRY3raFh
	 r2BhqTTlYN607P4JMKZtAbO9n1I4wOqSpcx+1os/iJcIj1TD4YUrFXJXZZrGhDRY7fN/S
	 8JLLffe9isZCS0sSjI0EqBV0b95sYJ+PcnJzOB14AJrXTCVxt23tucXokPJffcXtZXd5E
	 sbUVnWHORengkikguw0FXKc5vKKpcAelu6YWqr98vo3HygL4LRMjBQ96nYhPW4Tb07Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=naLAUZdz6s6FNp3zuqC/8ffp+u+vsG77MVvqVcrjHjc=;
	b=ZuERdajizZh8hjDNW8ccZ7g+C9Y+3A5vT0TqmUeBJCFhdPjNFNAOX6975O21Ej7yAU1q
	 mlcyiaPJDIiIsdAKJbItQ/JiigCqgSgtMRi3gOaPfd/dncZHQXnwU+dXtmei3pbmMmmtc
	 17kSp563Iv6Z07Xa97FrceAPfQzgEYY2p3JJHSl2uKfEoHCv2RVjZrToBRxh2OWv3AUfZ
	 KUsAyUK28u8b4nfsI+wFrRsrGoviKjk7q/T2DIOseNxlxkMuh8lXvI+wcdTtSrxoOCWR+
	 yeHJ/60w0CMKeoP2tz3uxZgGnNZHBOLNeFMEZgzSekMVNqgELvOf+BoWmaJaV0jjnEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Xz7wHT0S;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4517606A33B
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4517606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Xz7wHT0S
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so6945555e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267728; x=1793872528; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=naLAUZdz6s6FNp3zuqC/8ffp+u+vsG77MVvqVcrjHjc=;
        b=Xz7wHT0SGii8DazmZR+je2sKds7h1ZfGX5NWILbzHQGDD0eCHT9oCxUET9EkWMu1kP
         t9aCni+F7WnELj8vypoHIYxFBmBuntkFYc8B+4n5snSfJxvUE8ueQq0iAz/JvG6aEqB2
         R771CrHz++C75ArY1cx997Tq5GhwAL7wnS2xjQ25iikWt5J1l4mr7Q1kfmTV1MI5O5iI
         EjerPsYl7gz6NPMBvPnw8MsZbok/j35dFifT5uJGio2YNGiS8fAK5qSt1d/ZMlW5UkYC
         fekL8YkWdAvgOwAVx3P6uCBl4DB+TcqHX/3UEn3HYe/1vbq4sVcx6OfIuyQdUHWBYzDH
         efLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267728; x=1793872528;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=naLAUZdz6s6FNp3zuqC/8ffp+u+vsG77MVvqVcrjHjc=;
        b=HN15w2KktdS5pGvCyBGdPve845ma8uhDnVolAgat7CisLG6wKBBB/OPYrscC3aHk+L
         YF7GuhhAv405vT6Vg9wIxn4f9SHbA3bTF2Tu9SLx2p1fUeUKcPkX0eTkuf3qNe4kz/GE
         R8N0QC+52MW63t8PQ5rC+SIW36mTyaidVS0WJtsowGNX+Ft5JcknOAAik4PZDP3vwGNq
         X6WGyCELoGkAj0aRUSreDfWfUBfVJEnFIE+kI+F0aI2ARFbLvU4F301zBZr4hrR9VfoC
         AZnecqwIhUUlPKVLYJCDaygqIqXv08zHY4BFKbyrMEJZmaXLguSUqJEmVslbfsM//C26
         80sw==
X-Forwarded-Encrypted: i=1; AKwUvBzisiHDJlnwNE5gz55N7matF4NQYW9DeIVss9PDQaV1C7llVal8/132pqT9SgsiHJRKHY7pSyVisWvLe1lm@vger.kernel.org
X-Gm-Message-State: AFq9FYLN4x8OXIuVWVMZtEcJqbF/i23PCIzUFltNtSt8F/UZyQkt65cS
	3kYbVOXLhxEbc41ry2Wl500Fd/NJTte8Nu7x0t3+OGoKyHHP+Iz8wr/O0+vxW7F+vX8=
X-Gm-Gg: AYBFou0bX3EAf5jTCgQmUPVEZCPF+C6FQ6stxCSAvtg+f5xLggtkrOTv22wPt2uz2Oi
	92nlyaQJWhXgV192+suj+ALJuQlDPthUw/N/2SbE9zLJepw8UzpsEgbh+ix+MVwyxukRz+Qxxkk
	Rc9t5raFwGBvtx1nOLGHDRvxWl8KpeNL0FuakvTUFGjTfk7QvurG9Ts+jhYZQ1o9RlbnFcoZTg1
	4I3PWZdhCYR76teCtT8DdXWtxaC4pYNzW0hz9kIFtzIpelMKTd/6L1e5Vopm4fuKY4/Jk+XTx5s
	1H4a8mZyMpVgzrvO8QK0o7yg1YjiohiQSXNyhfSQI3vU7LiXPaVavfTergjtQ/QW6+UIqQ3WXaP
	hUskh33Y7xMKm+GdIaUb7JccnLXoGH7Qmtef31T1wNuL0+gUmrLZ77KIRgQhzo/ImUkHXBffa6M
	AopkETtO/s0DuZaPS/Ccly1/RhQLeNEzOpP3ADiQNVC7UBQZaXghfpyBVtJN5yfeDpbWAJt3Fo/
	E4QkYXe0IvcanFkh0b7F3HmDvG9zI6FStfib4/Q1yBGHcahzSu+DBhDLCnEZ3pohbOtYvFH1Aub
	dmiZk4jPG6wOwkiVIpc=
X-Received: by 2002:a05:600c:3e15:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4aa871e8bc9mr57343495e9.6.1793267728239;
        Thu, 29 Oct 2026 02:55:28 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:27 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Subject: [PATCH 00/14] Add SOF/EOF sequence logic
Date: Thu, 29 Oct 2026 09:55:09 +0000
Message-Id: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB2IQQJ6FekiiZM6orFkNLSId
 29al2/x/wlCiUmgr05IlFl4iwVNXYGfbHwS8lgMWmnTKN1hbheNIdmVUD7RoxpNcF1rnSEDpXo
 lCvz+H4fHbTncTH7/beC6vsgSxBpzAAAA
X-Change-ID: 20261029-v4l2-frame-sync-0d6fb94ab6e6
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4934; i=bod@kernel.org;
 h=from:subject:message-id; bh=ERAGHeKcKTbTc2nwUmjgdvPde825r6Ru7VRRGqkmXO4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgIzz77L3p8baLvrMnKymCo4QfC63skCfKD8
 pkmEH+pq4GJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYCAAKCRAicTuzoY3I
 OjJYD/sEilC8/4jXKn5ElhLkge4dpZ7nLmEw907+3qCbaJIhTrW95WY17fXhdSiYQ9Ks+42kHXo
 TeXoCFkw7k+DBkqeCI1GjAt3ramOyt+L5h46GXxAPvJd7CQaGMf1pbFbKjAXxUAW+NkrrpICQNk
 v29wXolkP1vyrFK8y7i9uzOSrh/pwpEZ5CnZCcN0RnVmZ72ttWks+vhfolKixV5x02yN6xWZyLR
 G7Oh+g6y22xiffez/sJguj60PXDyr+RWYRsMr0FUVUj6ToE7TkgznOnYa2UZzXSiamCJn8ZTFWg
 JxmbyRVep2ViXkpr/9eoTl8b43U7D94o8KYSIw7mNm9bxpz9xykd3bFDKku4vVrCZ0tFNuxN1N5
 fkrW2qnWmJO1xVKYL1U/STWBUlpHD88nfw8dnZChhNpTd5RgI6yGroAA2wr/7r2sVPwGJFBnPsl
 Hj2DNNvjKR13jc8T1pVQ9i3Wlw5b5fpsy/yRCXPoKOSz3t2GKQzz+GX2fPDm/jHSijfzRTSzlqc
 KY5ujp7Cf2bUapNYSmY4RXk/YxuNkxg2Fz/9FF3EXUP3fX5SmYWhzdp2lmT4FwcnNCHXjXSCkRu
 BPL3p5BldvXPL5jyfietJ95yIFoBDLyjAmTN/dvENO7s3TDJ8jJde665RzG5lxk/o8WMtqLk6hk
 DeNJ5/vFx6aKUNg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

This series enables SOF AND EOF event tracking making use of both events.
Whilst the code is actually very simple the functionality we want to build
off of that simple code is not.

- SOF
  Serves two functions. Firstly. Informing user-space of CSID SOF events.
  Standard Linux V4L2_EVENT_FRAME_SYNC is trigger from this event.
  User-space wants to capture this trigger because it allows user-space to
  better align the time a frame begins to events elsewhere such as IMU
  event timestamps.

  That functionality is directly applicable in this series.

  However we will also build on the SOF event in later patches to allow us
  to begin programming of shadow-registers for the next camera frame.

  When the EOF event happens, we switch from one shadow bank to the next.
  This is only possible if you have the SOF event.

  So SOF serves the immediate purpose of timestamp alignment in user-space
  as well as the 'evil plan' to trigger off of it programming camera
  parameters for the next frame.

- EOF
  EOF even on its own is useful because it allows us to increment
  vb.sequence for each frame as per the spec not just when we have
  buffer-data.

There is another purpose to having an SOF and EOF event with sequence
numbers and that is.

User-space submits a parameters buffer. Kernel accepts that parameters
buffer but can make no guarantee about _when_ the entire buffer will be
applied.

So when kernel finishes application of the entire params sequence the
returned buffer contains the sequence number - from the EOF tracking which
informs user-space _which_ frame vb.sequence its given params buffer was
applied.

Similarly when kernel produces a statistics buffer that buffer will have a
sequence number - and that sequence number will align to the frame sequence
number that the statistics describe.

Thus SOF/EOF tracking is fundamental to passing parameters, returning
statistics to user-space and for the IPA algorithm in user-space to
understand which stats, params and frames are related.

The first patch in the series addresses a corner-case when a quiescent
system can take quite a while to wake from idle, too long in fact such that
the SOF event is effectively missed.

On 'normal' systems doing lots of things, this is not a problem we would
see however on my test X1-CRD system running from ramdisk - there's
basically nothing else happening and the wake-time becomes apparent.

This is not strictly speaking a bugfix since right now nothing in CAMSS
cares about SOF or EOF so if we take an additional 2.5 ms to process a
data-buffer on a fully quiescent system, that's not the end of the world.

OTOH as soon as you start to care about SOF/EOF then missing those events
is no bueno.

The CPU latency value chosen is 100% stolen from IPU7 which seems like a
good starting point - the stealing obviously - and happens to also work.

This series is really an enabling series for more work to come but even on
its own is an improvement on the current situation.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
Bryan O'Donoghue (14):
      media: qcom: camss: Introduce CPU latency QoS during streaming
      media: qcom: camss: vfe: Add eof_seq to vfe_line
      media: qcom: camss: Introduce SOF sequence tracking
      media: qcom: camss: Introduce EOF sequence tracking
      media: qcom: camss: csid-gen3: Enable RDI SOF driving
      media: qcom: camss: csid-gen3: Enable RDI EOF tracking
      media: qcom: camss: csid-680: Enable RDI SOF tracking
      media: qcom: camss: csid-680: Enable RDI EOF tracking
      media: qcom: camss: csid-gen2: Enable RDI SOF tracking
      media: qcom: camss: csid-gen2: Enable RDI EOF tracking
      media: qcom: camss: Switch on frame_sync_en logic for sm8650
      media: qcom: camss: Switch on frame_sync_en for x1e/x2e
      media: qcom: camss: Switch on frame_sync_en for sm8250
      media: qcom: camss: Switch on frame_sync_en for sdm845

 drivers/media/platform/qcom/camss/camss-csid-680.c | 21 ++++++
 .../media/platform/qcom/camss/camss-csid-gen2.c    | 19 ++++++
 .../media/platform/qcom/camss/camss-csid-gen3.c    | 31 +++++++++
 drivers/media/platform/qcom/camss/camss-csid.c     | 74 +++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-csid.h     | 31 +++++++++
 drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  5 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |  9 ++-
 drivers/media/platform/qcom/camss/camss-vfe.h      |  1 +
 drivers/media/platform/qcom/camss/camss-video.c    |  4 ++
 drivers/media/platform/qcom/camss/camss.c          | 44 +++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |  7 ++
 11 files changed, 243 insertions(+), 3 deletions(-)
---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20261029-v4l2-frame-sync-0d6fb94ab6e6

Best regards,
--  
---
bod

