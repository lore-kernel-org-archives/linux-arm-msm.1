Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074444A6CE4
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963914; cv=none; b=IQZmRJCaEe73Wjt5fW1ExkjIrBjqaYGBYewl1YOLcsliVtx+ZV0BqXNljCmyPEbaEMjTRMTiJ6RIZAyeR5lFVkKltsAM/OJpKp8QzUowPYCXBQC9t/PfwHjm0WWd2FPvzRbxWM3Bq28UUq1qatXYFQVTpzPv2w+rsAlyWRjtcD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963914; c=relaxed/simple;
	bh=yH4Zggq2oGoczhEp+7Pp/j+vp9ozH7I5ATvLSfmd1KQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HMSSkezDC2nGVhwBwalAwlbozy+p+adlKvh9WPBANDSA0HHfC/mc3oRXge/r4ObNDD1KQ52JRW3mwGLrdZVGTNPqBNQ0mNwd0KITKdwrfel3ns0ZUQACx166blZLNBMDSMROyUhASkZFeJ2dCk1WXJGZceYYD8Uz0d61PL2KwIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QytN/SoJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QytN/SoJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C6F1F000FF
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791963905;
	bh=SLDp3hWogqjb3qZq22Ld+5SS7BDzgDGjWiwwFaCv8/c=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=QytN/SoJxSd+yLuzAdnYYHc07hQtrXtmpHA7ygDBxZCYWe54xqr43/SZMGsPxUIEi
	 JVHvdfRLJyGqmbLOiD1Vj24Hi6y3oRobP6sfXF8bo2iwZcQR+TafLdPTnAHBwZYOUU
	 Gqp9YBKhSpnA7X0BoZCLAPQrIsz9umkWjuqSDooTMJbXnAiXV187MfmrsMA930uEOc
	 5OvFicxncZzP89+0DtLFW4nQWligyFIhv6inN8tvtdUue0YCe/To+tCt2+LFKlmAeY
	 FJBLRgeRGvfwujR+SHTbyKGDkDXWSAcpUeC1kWjMbWJxvPP8ILOMboMt9MU6EhdQg0
	 xQDBNQyY0sB8w==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bcd17f3a93so3295210e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 00:45:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzt1cQzTAqH/4D6JNxAQepTxZryxtFRK/NOpUINN9M19MSVbTBL9K9yajR5mrJqmj6tz+w2R61jFIPnNpie@vger.kernel.org
X-Gm-Message-State: AFq9FYKz55Yp06KK61Ktz7IKzLqEw2hKTRMC4Q4jRmDCMU00Dc5Kb1s4
	tPBSEnXfNsOiWAAXO4BbKXsq2NNqQFJvoCllLVN42eHrW4pW3TWtDNen1cHXxuwFKANyZe3k7Uz
	QDGvDcFn/+C/ev1FcHQO2hqwJTmETBuY40fAVQUB5xg==
X-Received: by 2002:a05:6512:3d8d:b0:5b6:172a:c36e with SMTP id
 2adb3069b0e04-5bcde3582bfmr4975363e87.8.1791963904387; Wed, 14 Oct 2026
 00:45:04 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 00:45:03 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 00:45:03 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261014070038.564879-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014070038.564879-1-shengchao.guo@oss.qualcomm.com> <20261014070038.564879-2-shengchao.guo@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 00:45:03 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me0fg8O89hGNiujfHJ6VCfuAH3qCLw0=mSzGwpCLbHqGA@mail.gmail.com>
X-Gm-Features: AclHuK-oF4DAG_2ER7_i8V0ESAVNM0Qrx0BzoF1DjybBafdaN6pT8HnoO-FKNWs
Message-ID: <CAMRc=Me0fg8O89hGNiujfHJ6VCfuAH3qCLw0=mSzGwpCLbHqGA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] remoteproc: qcom: pas: Decide early_boot attach at
 probe time
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 09:00:37 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> For early_boot subsystems, probe unconditionally marks the rproc
> RPROC_DETACHED and qcom_pas_attach() discovers from SMP2P whether the
> bootloader actually started the remote. If it did not, attach sets the
> state back to RPROC_OFFLINE and fails, expecting the core to boot the
> firmware instead. The core does not do that: rproc_boot() treats the
> attach failure as fatal and the remote is never started.
>
> This is hit on Nord with firmware where XBL no longer brings ADSP out
> of reset. The remote never publishes its inbound SMP2P entries, so the
> very first state read fails (debug print below) and the ADSP stays down:
>
>   qcom_q6v5_pas 4c00000.remoteproc: Failed to get fatal_irq state: -19
>   remoteproc remoteproc0: can't attach to rproc adsp: -19
>
> The ready, stop-ack and sysmon shutdown-ack signals cannot change while
> Linux has not yet interacted with the remote, so there is no reason to
> defer the decision to attach time. Check them in probe and only mark
> the rproc RPROC_DETACHED when the remote is up and has not been asked
> to stop; otherwise leave it RPROC_OFFLINE so the regular firmware boot
> path is taken. The ready state is read first so that a missing SMP2P
> entry -ENODEV is treated as "not running" before sysmon is queried.
>
> qcom_pas_attach() keeps only the fatal check, since that is the one
> signal that has to be acted upon once the rproc is attached.
>
> Assisted-by: LLM
> Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
