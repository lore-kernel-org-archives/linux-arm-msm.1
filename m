Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627821;
	b=JWVq1KHeRqsJe7S4Qo1LcdS8FGT0WO2mq2/N5LyiUFrZ+2niiwsW4Zniun3bQGHFL4S0
	 jVZuN//vU3GjNTrWitVIZKQsDTzKyMWwUBnwvF9hXmsK5XY/dVrbuN4GT/bObcKqxv2ha
	 w4sRgFWTcDKUXZvB6hbC04Z0ucWOaDkcWfarULBuS4FUULnEGtosD4+HkBT1xYoUApAXx
	 Q12JOU0wgUqE/lwdA5P2gmGb1fMT2YdahrMTt6wOJqVG/TyQkX6AmnZwOF2QU0bcu4CVW
	 doJx3MN8Y2TDtTKb+ZAC0tiQwC24EKZrJaL0TyeE5TBK6Mre0KzmQ4dPaOTefCroGcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=uQ+hpJVqeXPZysFRWhPachckjl/zC4GUz5qUhvBymdA=;
	b=Sl5niZH+PvmhpXxoqYhCj6t2kseYVM7rNwCqk1gQ/D1KIrMseXimJ85zUasz6f54ccCh
	 VXDMPI/EqZgF/MhTb73jYLEkd0Zg0fvnbJbqF3+iVc+tRDLOTlEF1tlHz/2FzADiEAhH1
	 rJcXX0N/qM33yZGO5GNREFSmsKSt2HH0M/W63xf2Cxdh8kBx8kQTe4HrbIlqTRZdkNLQ5
	 uGc5zS4/hRZH9TSBYA05cCnyjsCm0lH1JVrqzVURcci0mUsgP7SWb1dlexLGazjycC4ex
	 qv2Y0FyP9gC+mNUyx1fhjgGMCVlZLQDdJ/cMyeV89gdqwzZP2EACifJJRDo2y0HMlCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="pJ4wlQl/";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75ED8606A335
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75ED8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pJ4wlQl/
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a208d93758so32589395e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793627818; x=1794232618; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uQ+hpJVqeXPZysFRWhPachckjl/zC4GUz5qUhvBymdA=;
        b=pJ4wlQl/Me2ATwWzF3oHtLuPfjXwBefpr5+D0KD8MT10MZw/KS64KNcBi/QWrmbIKw
         b17cqmXFDAC3Fz/Qin4pn61o8Ymmq92u40bVwYuE+hM83JioQoZov/uKamA9CnmtbnNc
         ZSSVMIgUYsUfjgP4laHZ/oQa9IYhsF2lmPBSwXjL6j0sGCzoki5c5/0lQwYMPsIsv5Bf
         ++m9wZ/AlsNTd19jVsytwulihvkiZ1LwJNjg8r3IcvYzwSmEHgr8beOxyMaYXTl7YEJU
         MClSKtbmYa++/tWGkjzln6zXQrl9klD9ibQ1XS6rfrq1HZPpFDNSeBrF9htKVT02F2q+
         TEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627818; x=1794232618;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uQ+hpJVqeXPZysFRWhPachckjl/zC4GUz5qUhvBymdA=;
        b=mS/AM00Jicxt8NhbQOFBnTZISch0eYmagtg/MVoL0s+d0fSW8MJBA+jxD3GUNWjIDB
         UYjdNSB0O/nI8lH5Q9gtBW3i2pJCzHTn5KoCHBOuGLLhju21YngRt3kzEmdOeMEMAZN/
         jUEssywo1o5kQSZzlsv6rAxM1HxAzwUWcTZ3givTp5NMzDUUz1obeP2qYzDaiN7jvZUn
         kwTUvMvenyle3zIPurWgJfJBDy/rP4uX0Jn8P4xf2ve8ehYPwxozkeRNKzNHmyn90gGx
         BqK6VQwsqi3T1CcCYjfUCP9n3uueDBNIegTbTOsv1MdeeI8aDk8yAmRmZj5+yc1ZMSsn
         GzxA==
X-Forwarded-Encrypted: i=1; AKwUvBx9F5rWMMcFb9h3Wh+UmRt7TUrgfof/TEe09Z8LvOml09jW/OHjGWtchaa041PWt6HGa6dZTZJZZ05Uxuv8@vger.kernel.org
X-Gm-Message-State: AFq9FYLwF9wHy6g9S5L8JkyWXFzKTR9Ufn359lOs0oHfGwdLEHKhWVl9
	aM0G12LS6pGht0S0984P9wzgvXcIVCVPQry5hvluqiYhfyw/hGg+YfpiuSgfAV3zrW0=
X-Gm-Gg: AYBFou1Tu86WcOXCpC1/p8DzIRXRsrP2h7DmXqLWAcNTfeFWj6z0nc3XL7x1uOAhDgL
	NLa2GTCCCyUepJSBhyRsHCqjnX32NQwuy/wEPjT85spIbq9sLmUavxWpnHgSQJp1AQva7RatNyl
	VxIPxVVjrkBs9xNqayOTtT+QNB8mHpkuaRy1ntnk2plqt4gF1MBdp0iTXRpkcnqDy7oGRNez7gm
	KDTAF8uynGBbVKzpQI98eYbJGch/6SvDRv11TxHWrBSssvdfF+eJ1vFhV9jDQ9uT9VbnJKdE1/F
	sV0v70NqK85ovDk6+npuj0CC8/AZ+UXhkvZNtSrv1mr1S2WFKP5bRIYyZsbW89jsOX1TgxYizBY
	tFW6EUdNorklXgbI6DqBgmxC+W0BfLj1gvuFyjrcA9K7uc3a4el/XZsqSos6R2EDal5Y6sa7WWr
	nPqIksiQePhPn1878st0aABO9SrkOrlQ3A+IF6TNEnjNNLl6Dlvs+pSlFST9kyOpNnophWw6wLM
	PuJnbGdJ69Bu3kkSh8j1kZ2RDIJEpBM1X0w4I2gPnwhMPpzaRIW6vkSS04IJ9cVkO6uo4UodDcK
	RhiBC1nN8Z1lETAseQ==
X-Received: by 2002:a05:600c:1990:b0:4a7:462c:6b9e with SMTP id 5b1f17b1804b1-4ac1923581cmr221885265e9.32.1793627817835;
        Mon, 02 Nov 2026 05:56:57 -0800 (PST)
Received: from [127.0.0.1] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm126145375e9.0.2026.11.02.05.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:56:57 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Subject: [PATCH v2 0/9] Add SOF sequence logic
Date: Mon, 02 Nov 2026 13:56:46 +0000
Message-Id: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0Jm7ZhSoVpX3sOwgDJAFYqZYiMhv
 buAa5cvef/9BTyxJQ/XZAGmYL0d3QrykIDpStcS2nplkEKqVEiNIeslNlwOhH52BkWtmkpnZaV
 Iwbp6MTX2sxfvxY/9u3qQmbbMZnTWTyPP+2VIN+9/PaQosD6dtZZ5rk1+uT2JHfXHkVsoYoxfT
 aIu2sEAAAA=
X-Change-ID: 20261029-v4l2-frame-sync-0d6fb94ab6e6
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4969; i=bod@kernel.org;
 h=from:subject:message-id; bh=B2LuWUADjK0BpKnOHaWJjWfv7afYZBZdacsyLUUC7vU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq6JajX9rZkB1r7mLdmBCvw6dF+pKDUnVutmRQT
 fBjK6MqEjKJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauiWowAKCRAicTuzoY3I
 Os2yD/wKaDq4dNDib29ewWY3hrTMDa5+VluTqmDooKZrbnpyawQjh0QIJM21tIerbGjJ9ctYit+
 2q55x1yHm2U81HrlAQaERT0KTmtrRu+LlQNXcoiR3AZs8utmTdtTAtdzAT6cEdR+Op9B2DYRidy
 bbn64LLZS30hLbspChgCfUZbcrwgwie556n9G6Sc82s+GhFYp9Y5nuK5dhva7BT3z83a9OE5Cvk
 RZVmG+0MapSd2uQxxwKEIzn6Njz4wfDy6mbL/GprX1QP/e8ERZ2L2UPm2JdxkmcCSKV3Blus4ac
 BhHXESOywWvjY0f+sxK8LpTAhVjEadpMsAoJa6ymIZCnBseMZV1sRR5PMLKg+PGCgfNFSw5OTmb
 uY4FC5NxAialon6ANt/177iW/slulu6Umo7xNoKep8ps8iRauyCFgNaM6Ev46GK1+4vh0KWdzc+
 ZmulbDh7OPK36nXTnB2FjMCSTnQ4TEVzWDUVXDyMDxrF2V+XB142uvbo7cpRJv+gPMJqVrm9nrA
 SCi1O8w2nrhu7C9ThqKh5HEt93hETBZU7n3AS2cPbhMLHf2/ELKjqUfCS2Cf+590jZ3anJTaQNY
 Ywj9qJoJqIg76hkEXuQUYIDKoRaf2PENRLTORTr/KVE0cdEwKNaIvUZhRU4D9b6/+4WPblUhafs
 lqtubpsXrBLBUsg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

v2:
- Amends series title to drop EOF
- Drops EOF inclusion until we actually use it for stats production seq_no - Gjorgji, bod
- Moves QoS into pm_runtime() callbacks - Loic
- Switches on vb.sequence change for every SoC the silicon enabling code
  supports - bod, Loic
- Link to v1: https://patch.msgid.link/20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org

v1:

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
Bryan O'Donoghue (9):
      media: qcom: camss: Introduce CPU latency QoS during streaming
      media: qcom: camss: Introduce SOF sequence tracking
      media: qcom: camss: Use SOF sequence tracking for vb.sequence
      media: qcom: camss: csid-gen3: Enable RDI SOF driving
      media: qcom: camss: csid-680: Enable RDI SOF tracking
      media: qcom: camss: csid-gen2: Enable RDI SOF tracking
      media: qcom: camss: Switch on frame_sync_en logic for csid-gen3.
      media: qcom: camss: Switch on frame_sync_en for x1e/x2e
      media: qcom: camss: Switch on frame_sync_en for csid-gen2

 drivers/media/platform/qcom/camss/camss-csid-680.c | 18 ++++++
 .../media/platform/qcom/camss/camss-csid-gen2.c    | 15 +++++
 .../media/platform/qcom/camss/camss-csid-gen3.c    | 27 +++++++++
 drivers/media/platform/qcom/camss/camss-csid.c     | 68 +++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-csid.h     | 21 +++++++
 drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  5 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |  9 ++-
 drivers/media/platform/qcom/camss/camss-vfe.h      |  1 +
 drivers/media/platform/qcom/camss/camss.c          | 63 +++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h          |  2 +
 10 files changed, 225 insertions(+), 4 deletions(-)
---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20261029-v4l2-frame-sync-0d6fb94ab6e6

Best regards,
--  
---
bod

