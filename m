Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3E821ABBB
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 02:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791684082; cv=none; b=bYFl3kePhMHDdRGWHyAIqagj/NC9kWfD5zQHwkJKore/cCawYZXuN5NUF299EuzKk5rR7FqBbWEIGhDa2HO/O753Yc/9W8rIWvcC06LV1y5KFlu0vZK1Hww8TWQauaSNi0AULG1kn4ZUliExB/R3M2ABjFAt8PQ1h8d4eJqJsEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791684082; c=relaxed/simple;
	bh=UD71A0qOkEaKp36ksgqi2k3XzO1+0Q5TsgJYsNPi/3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mraDk5E9qImfz4eGL3KtWMtRkmdIU+HrmZ7V1UTV6ykDIm2t2s/M23J2PLUZaYo/+GQq21oKQMgLD/HVEXG5qIUpUnz0Gq8GE47WQg/Npy+NEEh/edXvUJv59wkbA+kJKMCuEYw3K2ft+ssQ1E18xVmhB0N7LCsF3fU3A4sOtEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcZz5aLl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8EuDquN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcZz5aLl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K8EuDquN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B1qGQT2626922
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 02:01:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rz1OS5kFrXmC0lPX/csl8x0BPgSnSFBP6Ac0hEOz3mE=; b=mcZz5aLlEDLS6W1r
	oqIGWAJX/NkzDk7nfPaKwyy0x5czTuUAI31XXam0Amtrgbwlc2UnjIki938ddRlO
	teutc4Ke49MMBPS0uybJpOh5PKSi/Wya7yGXmDpP91VqBUMSdkff13zGn4JUNdLk
	iA25W7ZjB2HfoHR6GSvYbMjH3i93wDTozdJNG9Xc18Baoh26EDNBncXGlTbflkSY
	JSYvWOtK8olVebd5iqEIIBaVTMii/yu0YyY7o2zRFjohr4Sz5LbZQvMiMCfXa3Gf
	GBjvbsRU22VYpQDVSaypd3W1gSgJoAHmHWZL4hPD+rcePZBQgkRt5jK/oK6HC7uT
	jy3pWA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cc6aa9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 02:01:17 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-359b81ad4e8so218648eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 19:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791684077; x=1792288877; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rz1OS5kFrXmC0lPX/csl8x0BPgSnSFBP6Ac0hEOz3mE=;
        b=K8EuDquNvJN7869VxGtgQDm4Iwm0ZLhbopnokwWtAi2XsmOCiPz8DKwYDikHfBfVqR
         DW39/6hMDRGbLx4++7ppIX+WiQXxQU+mkd88SXCVXPOv+BlCd6OpMRVSrRN/Mj98kMSv
         98wyC/I59ZvE84A9R6o3VZFjSJMGNLOCMDv4Hbe6QfjFRwixI4lvT2frdT4J6Xc9Jgcw
         98xoAuI7iRZBFxMKOwf4daT/OT89YAVsi3+HmQxhrgZX1YcXRCkGm7jkMe/KxfAd99hU
         14oKpKEx67RfTqUxYZH8RQc/BYWu0+Yerjx8Ad7bT0w3J3uVfCzNvSS3xrMBEITh/Sde
         criA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791684077; x=1792288877;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rz1OS5kFrXmC0lPX/csl8x0BPgSnSFBP6Ac0hEOz3mE=;
        b=I2bOwsUg3QDR3VAOYJ6HWxje0jewUhBKbkvA/cTJFBepOZPHWCb4W8LpujpgPnqzVE
         eO1vZqvriooVyeJJC7w1Ufg8wqgtM3Hm65dOv9naofMKoetY2kp71ony+KTF0DXR1O7+
         t/rSU7HjL1FxadHNGTpodgMa+nqIsSJhDZEIStUIWqSP+rmiGv3h0zAV1loKEOB5p0dG
         D9BqD3TMkbn3lGIYm2QD5D9f3mQQkzrd+Y5eIilsUXQ4x8zoMb4o4qglEkiB0hNzfM+W
         6gT76gW09sxRJvYAfP0sEdadhum+ca1aHn6wBFHtsZaovxn5rXVVmvzoF8Ew22aE4o19
         DO4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzwyJK4ce/HIR26XEZbZJz+SoomIK2+5BT77nbECfa0hmCtpikRW3Bo89JfZ6e39sZsWf2N0Zfhty3DZlB+@vger.kernel.org
X-Gm-Message-State: AFq9FYKpxBf2oM0Ro2JBDgJ834zZ7YcwG9ChYa678uHfJDOTU09atsD2
	Dy21B+E3P12DQeyIfDdiNqR6H2PxIVrhr6Qdnp5vLN2qADSdOLItX2hAnoWlsM9a5TBD0/exJZl
	R/wBE8WihsdLvZrTv8WwXb2NzHCFQJ4d6Akjxs6PCLu8zUI1dAySRKK8Bnmi4uvj86rgYBmJTmu
	3z
X-Gm-Gg: AYBFou1rbOW2VQm6ULRwPoBUnaP55znlPbTqdbSNk6Kv1EM7UOB8RjuW4P55Np+VFSr
	0nuZeQBIyXQkI3CVz40wt8cg6XxSbeJgQFSPfyw5+4vW2AQYEF9GxC5ydyVPW49jW9/KfT5bvvq
	8wvC6SJBR024DeV8CMyfT+7Zf2QdkfYZacO2b6vtDR7hE7RTPUUtljVssAGMt7Cfqy+QFhpBWKT
	64jGJiUcbdsaLp58gaYAgy9lxjPtilHf977f20HoLc3/gbk6SK5EQK1yoV3GEL5tRI2zTwiVqnN
	DkJquNO91fc6HzAV9BzOC2aXnxpzsOCYNaDnjfcmJWypm3ELyRZuYvPj1kosIeJjrFb+qz0ljDd
	wZ92XtKA/dzW6XitZQdpHT6E9Xsn/gKiTJYqjq06CcA==
X-Received: by 2002:a05:7300:87:b0:354:76f8:300f with SMTP id 5a478bee46e88-35476f831efmr7669663eec.27.1791684076527;
        Sat, 10 Oct 2026 19:01:16 -0700 (PDT)
X-Received: by 2002:a05:7300:87:b0:354:76f8:300f with SMTP id 5a478bee46e88-35476f831efmr7669608eec.27.1791684075530;
        Sat, 10 Oct 2026 19:01:15 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3593b8b2ec7sm4014102eec.4.2026.10.10.19.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 19:01:15 -0700 (PDT)
Date: Sun, 11 Oct 2026 10:01:10 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: qcom: pas: Decide early_boot attach at
 probe time
Message-ID: <asrt5u2v53E1h-Vk@QCOM-aGQu4IUr3Y>
References: <20261006033550.2726451-1-shengchao.guo@oss.qualcomm.com>
 <20261006033550.2726451-2-shengchao.guo@oss.qualcomm.com>
 <asj4Sgsjw5xNXNLb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <asj4Sgsjw5xNXNLb@linaro.org>
X-Proofpoint-GUID: WbWfHMOYyCW7zk6Kcw7yTuAKarq__Umo
X-Authority-Analysis: v=2.4 cv=XdQcX455 c=1 sm=1 tr=0 ts=6acaedee cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ziUAhxxM_TC6nQI1M-sA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDAwNyBTYWx0ZWRfX80OPNYYPsxZV
 PYO3QX0KR2TU0rnzRX1QBuOVE14g7OYdJKtsHHn8ZYvBbEtS/E96HySoV0XqJSrUx0wj2R8NRvN
 PqK+Vu76N1qd4IMpw0qDDfrho+RyN7T7/E9dpWHZEptKd/Yus/dWJw/RudMD/el53LZ+JTYQS1X
 ha9j9N5Ms01K36uNXGfkarH2PAhDjV5vpg2spO8yjWYK7CvLU3Hwf/UO4uv+vngA6TefNH0tI9K
 YmvlqW1yibSaw/QG1/4BV3Jkpod/w3eD0i5SYkbiFGTsPOv6AhNEBevuj1TnsZG/oJH9uTc15rA
 GNtitLLKI8Bc1UzBTCv45PbbPGjYF+xoIFXV0mG389q8Sffkhjg2igwJ0g3cdtSvQfqOH1aV/6m
 fUMFHwFWr0Kz4Nmg7MAkbzfsb623QwUWczmtPpR3UYNouFgcNwy8fvSMbfnnyCmXt3W37k+FdWU
 nZJyDi39UiQsZA5JQOw==
X-Proofpoint-ORIG-GUID: WbWfHMOYyCW7zk6Kcw7yTuAKarq__Umo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDAwNyBTYWx0ZWRfX7yi1UkuLfyO9
 Wo+sSoZH8uMxQXwwfS8yiQdEeNm6nmZRYZhP5DsNI+TjGREYKRQBHy5yM09REJvk5hYKIggvJRG
 mmIewNshbAUzNSlfXhLfo4/aAL09MVs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610110007

On Fri, Oct 09, 2026 at 04:20:58PM +0200, Stephan Gerhold wrote:
> On Tue, Oct 06, 2026 at 11:35:49AM +0800, Shawn Guo wrote:
> > For early_boot subsystems, probe unconditionally marks the rproc
> > RPROC_DETACHED and qcom_pas_attach() discovers from SMP2P whether the
> > bootloader actually started the remote. If it did not, attach sets the
> > state back to RPROC_OFFLINE and fails, expecting the core to boot the
> > firmware instead. The core does not do that: rproc_boot() treats the
> > attach failure as fatal and the remote is never started.
> > 
> > This is hit on Nord with firmware where XBL no longer brings ADSP out
> > of reset. The remote never publishes its inbound SMP2P entries, so the
> > very first state read fails (debug print below) and the ADSP stays down:
> > 
> >   qcom_q6v5_pas 4c00000.remoteproc: Failed to get fatal_irq state: -19
> >   remoteproc remoteproc0: can't attach to rproc adsp: -19
> > 
> > The ready, stop-ack and sysmon shutdown-ack signals cannot change while
> > Linux has not yet interacted with the remote, so there is no reason to
> > defer the decision to attach time. Check them in probe and only mark
> > the rproc RPROC_DETACHED when the remote is up and has not been asked
> > to stop; otherwise leave it RPROC_OFFLINE so the regular firmware boot
> > path is taken. The ready state is read first so that a missing SMP2P
> > entry -ENODEV is treated as "not running" before sysmon is queried.
> > 
> > qcom_pas_attach() keeps only the fatal check, since that is the one
> > signal that has to be acted upon once the rproc is attached.
> > 
> > Assisted-by: LLM
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 64 +++++++++++++++---------------
> >  1 file changed, 33 insertions(+), 31 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index 2e1e39826ffa..8f3d45c604c9 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -550,9 +550,7 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
> >  static int qcom_pas_attach(struct rproc *rproc)
> >  {
> >  	struct qcom_pas *pas = rproc->priv;
> > -	bool ready_state;
> >  	bool crash_state;
> > -	bool stop_state;
> >  	int ret;
> >  
> >  	pas->q6v5.handover_issued = true;
> > @@ -570,42 +568,46 @@ static int qcom_pas_attach(struct rproc *rproc)
> >  		goto disable_running;
> >  	}
> >  
> > -	ret = irq_get_irqchip_state(pas->q6v5.stop_irq,
> > -				    IRQCHIP_STATE_LINE_LEVEL, &stop_state);
> > -	if (ret)
> > -		goto disable_running;
> > -
> > -	if (stop_state || qcom_sysmon_shutdown_irq_state(pas->sysmon)) {
> > -		dev_info(pas->dev, "Subsystem found stop state set. Falling back to start.\n");
> > -		goto unroll_attach;
> > -	}
> > -
> > -	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
> > -				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
> > -	if (ret)
> > -		goto disable_running;
> > -
> > -	if (unlikely(!ready_state)) {
> > -		/*
> > -		 * The bootloader may not support early boot, mark the state as
> > -		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
> > -		 * start the remoteproc.
> > -		 */
> > -		dev_err(pas->dev, "Failed to get subsystem ready interrupt\n");
> > -		goto unroll_attach;
> > -	}
> > -
> >  	return 0;
> >  
> > -unroll_attach:
> > -	pas->rproc->state = RPROC_OFFLINE;
> > -	ret = -EINVAL;
> >  disable_running:
> >  	pas->q6v5.running = false;
> >  
> >  	return ret;
> >  }
> >  
> > +/*
> > + * The bootloader may or may not have started the subsystem. Inspect the
> > + * SMP2P state, which is static until Linux interacts with the remote, to
> > + * decide whether to attach or to load and start the firmware.
> > + */
> > +static bool qcom_pas_is_running(struct qcom_pas *pas)
> > +{
> > +	bool ready_state;
> > +	bool stop_state;
> > +	int ret;
> > +
> > +	/*
> > +	 * Check ready first: if the remote never published its SMP2P
> > +	 * entries the state read fails with -ENODEV.
> > +	 */
> > +	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
> > +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
> > +	if (ret || !ready_state) {
> > +		dev_info(pas->dev, "Subsystem not running. Falling back to start.\n");
> > +		return false;
> > +	}
> > +
> > +	ret = irq_get_irqchip_state(pas->q6v5.stop_irq,
> > +				    IRQCHIP_STATE_LINE_LEVEL, &stop_state);
> > +	if (ret || stop_state || qcom_sysmon_shutdown_irq_state(pas->sysmon)) {
> > +		dev_info(pas->dev, "Subsystem found stop state set. Falling back to start.\n");
> > +		return false;
> > +	}
> 
> Nitpick: Both of these messages are a bit imprecise. desc->early_boot
> does not necessarily imply desc->auto_boot, so they may just be marked
> as offline and not automatically started.
> 
> But you just moved this code and I don't think it's worth resending just
> to polish these messages a bit more. :-)

Since I need to send v2 to address your comments on patch 2/2, I will
change both messages to "…, not attaching".

> 
> In any case:
> 
> Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Thank you, Stephan!

Shawn
