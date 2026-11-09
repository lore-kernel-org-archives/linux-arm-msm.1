Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794213436;
	b=u37ce0/ojOVfnxryCQm7dGhzUD96iRmjdEsn92qw+o8CTO//OkmAo1v9thoS/cG9kKKX
	 p87OKNzb8lHldpHYqKd08/qJ1bMx4pjJVw6NvmsO1K2LMN4fkUizc5/ppoGEUY6z8FOJj
	 ThC49l+o7sXo4VLUsEmDQvjk58tclp6fz9kYBc92oHLZqEfbKVZ0MEnO1JpcQFLZRvEv1
	 BhIpW9WI6mzRj1+55h7u73h0V0n7VAfQEngjc72XTs54lPnnV6aAdTBHQ4PzKglzCAvqS
	 lZd8z0RwPxYsRGO8H2FhiTED/OGFk68HfoP5maTyp8UC6neQBOULZZMacG2XZ5psWSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213436;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=CImfgfvrGxTGXdBijpfKFHsWibRgSElYzGxJDK8LVgI=;
	b=PMJNrG0P2Af4SG4jGLK82i+TXn8IYrP4nb8RGteDqZbeK7o7YAPyA5ngEMg6jQAw4CDg
	 k88pqreLln1XHTi7i6JZ/LGljCjgoM+aKCOMNz0Ts2Xc6QiXkh2Od8WYdK2CVebdYkBz7
	 ysikVin1b3RtGyH+j9TZbAXTXJjy29F3HXEsgBapHfTtS7Jgrfbhx5UpyAr+MqpPJ6+u1
	 Ly9BncnWZpt+8ZhhYHodmuJnYwnLO9Uo5pGHxm0zFRMw7YNop2yDc26OnMlAgE/2qBy7n
	 EHOAjpMWSKzXHa7mBVOE88NvusgnxqebeHASADHg4uvDTzqeQCILrg6RpLEwwrtqA1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iwxMxPGt;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NJQvvlzO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE17606D802
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 08:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACE17606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iwxMxPGt;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NJQvvlzO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794213434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CImfgfvrGxTGXdBijpfKFHsWibRgSElYzGxJDK8LVgI=;
	b=iwxMxPGtiRya2B4bd4KMJAtPkQdiqaA9K7L6vR6cBJUCwG2NZlnhHHcreHnR325wq++8tq
	ysyhab0pFlfUdfcUH6z++BEjF8gURXRmjB73UcolFFpWnxyrBzwxbVYHcXgzqPVjXbBMyD
	/QlCfCEyAe0vzEiCVwuTeyFio95v++o=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-AQly1c8HNruVGVhtVJqPzA-1; Mon, 09 Nov 2026 03:37:13 -0500
X-MC-Unique: AQly1c8HNruVGVhtVJqPzA-1
X-Mimecast-MFC-AGG-ID: AQly1c8HNruVGVhtVJqPzA_1794213433
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b320a98b7eso10809477b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 00:37:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794213433; cv=none;
        d=google.com; s=arc-20260327;
        b=j6V5304bWx6qNlrOk7BPpZDUblfkgX0shYJT9BUpHuOIQq0zu+Aso3M6Xfb6K1RDUK
         JMKeidOu1ZefWObulZzVsSnnY9TmXCpGzGZzLK1K+kDf+1eFKUBeYKvlKKCuhCi2SYrP
         odSxbCGkstPCxjb0EwF/6GKXBvW0X9qdL6Zd07CdUy06u7bOLqGKE7nsDKrDOB9WWHMt
         s1g4o91zSXVGsUApJCHgOi24GPShwmX/f03etzGSeSk4DSXgaTRAlsy7ro+x7zczgfGZ
         vLkRy01bRfdiXlBlvXdLjtzmEntbHhFprINX6DUVbPnkDaaQp2NgO8FUL3EP6BVGhfiB
         uqTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CImfgfvrGxTGXdBijpfKFHsWibRgSElYzGxJDK8LVgI=;
        fh=ZogfrSMoUPROCUz1wiuyn/xb0OIw2LOp7mL3YYL8K5M=;
        b=JVWk8u+MBit8eCSgW6qOMsSaf6e//AhBMA1xLfWXW48G634jLB2xIrUC6jF0LWrKTq
         H4oCRZirjIe+hIVflMjIXvymebXSFRz2NgL/YqoyDJOrAPmyK+4OaWiu8K97hSwH/dcJ
         2FXjppSTc9SWgnbUFyrqkkSoQgIXfabuGWX1l/bGhZ32OVeUSJJVVamAi49yUO9Xb3Z1
         TZ8aOTSK8RVW8uMYIUmRnMDCXdZy8+dDIjYqVh62fA3Knaqsb9shqBwwN7s4NByQY5c6
         YnjC6Li/IEbJI8/uuIyzD8UObuEWLUA3VHuTMB+548o/dEfQmr7Gd5oXw435feNSG/tk
         c+rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794213433; x=1794818233; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CImfgfvrGxTGXdBijpfKFHsWibRgSElYzGxJDK8LVgI=;
        b=NJQvvlzOK4RkO258sxT6Q6sPc7AL8wgWMAWvEyNMb5EhCISyqBmEmGbBzxWkRKn05O
         d4kPhtzNx6P9N1E0+h/4KlmBNz252E4YU+CMPKR5aoErte+7UT3lNre6ZP8mcf9spAqX
         pBW4botNNlF1kWWjhIhR4RFz5t9lsg2c/Zy7/OOtbRv+7QjwRjVBARPFTpS3ckdwHpmO
         p1b04EMhPKbQnEslk0tckU9bd8ItuXO0F9kmn0nX7eVQx6d9LOZ7xB8eXU6Rp86r0Daq
         E4PN8D0iirC4rWsoLlQrokx5KC8cSZNGNMp204OmNchZEHRC/P93bOq4rhHIsmuJnmx/
         aCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213433; x=1794818233;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CImfgfvrGxTGXdBijpfKFHsWibRgSElYzGxJDK8LVgI=;
        b=U0z1tFwrY7E2ioNlGcYYz5v490WqEecmrhafhRT3zTSBcDhHUR/bTfqxlwsOnv6vSr
         8NljfRQqCLMU1+UP9m/4f6ejWcpFctwnbhWNnbMRsNfx7iicjiD1odzEmp9jZLScYOmA
         JOY3Q22rrRhzD3S9PQypVST3fYit0Db4yHv8OaJMA/pm3rpvscz+bDh/yRhxm2S9ZhKz
         1V0+eOFt6c7EKTtZgeDrRopRrow0nQwoakT5cTuYsA0yNPC/uqqzIi9mM4ZA6XF8zM/d
         G1/hocatUyflKzlk/htSpakTrPTes1AhG4ZC95wye6aJhrdZxnNUKrwlMVLGEFhpo9Vb
         aWQw==
X-Forwarded-Encrypted: i=1; AL+hErHDm3jyTMzZmAB+YnjHneIVyOXE3dMv+39/ZKtCMG6PyqgBcVDGNciIKRLmnbuMpAHAE5Gg6/FKvGj6WAx3@vger.kernel.org
X-Gm-Message-State: APuU4Z/lMvMS4zls3tMfiMit5shruEe3SeP4TgUGKtKehdcLlMhfHSnX
	n5CPcRwfaGx+nWEvCXRzEHCgu8N6MVkrzMD2bq75Ir2Tg5FHpmWRXulfP/A2rSJWa4I7foyNt/7
	VZsBtr0Wi5CE8omC0iLwQFrfRSnv3yaFZVu3gotcbpXd87mTFA62PtUEbPqbta2HD+NYAoCsTuW
	0OOiA07BWoCucAQ0FHMognOJVPh4eZQr8ZQL0v6xHq+Q==
X-Gm-Gg: AYBFou0306uj4wPZVmlC6ft66SUvL6GbwIj2KuJoVJ5YNcErL+cgfP3Zzk2k1u0SeG+
	RgF1wUvVRXGQpXn4YZ23SRwBLI3bxnfxV026jpTw64Uv6iaHTxCg58vOHBWFPi5n6d66RqLrEZE
	ROjTukRJ/yNe+R3cs/aM+6+WQgF7rF/wQ2tArCGjOXtsiCaT3R9LI0gywD
X-Received: by 2002:a05:690c:e211:10b0:8b0:d027:c4f0 with SMTP id 00721157ae682-8b36c8dd4ddmr14885937b3.1.1794213432680;
        Mon, 09 Nov 2026 00:37:12 -0800 (PST)
X-Received: by 2002:a05:690c:e211:10b0:8b0:d027:c4f0 with SMTP id
 00721157ae682-8b36c8dd4ddmr14885757b3.1.1794213432260; Mon, 09 Nov 2026
 00:37:12 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001-port-scm-patches-v3-0-17520fa3c541@redhat.com>
 <20261001-port-scm-patches-v3-1-17520fa3c541@redhat.com> <66ad2051-193c-4990-ab4f-efce0000c00f@quicinc.com>
 <20261008190304.rz2kbniwviinls36@hu-mojha-hyd.qualcomm.com> <CADSE00JEH8A8rTwBa030QJmJiiPC51fCdcbv=y0Z6qkg69kNbw@mail.gmail.com>
In-Reply-To: <CADSE00JEH8A8rTwBa030QJmJiiPC51fCdcbv=y0Z6qkg69kNbw@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 9 Nov 2026 09:37:01 +0100
X-Gm-Features: AclHuK-3XHL2magG-d45lby-7DLyXWPMdnCs08_ywvxiu_bfyD4ALAh1Tjfef_Q
Message-ID: <CADSE00Kv-YHCy+ezXYt3DUcCRRyv2aToUX=npa7cdgUrVBD2YQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] firmware: qcom: scm: Introduce new locking
 mechanism for SCM driver
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ninad Naik <quic_ninanaik@quicinc.com>, 
	Murali Nalajala <quic_mnalajal@quicinc.com>, Venkatakrishnaiah Pari <quic_vpari@quicinc.com>, 
	Jian Shu <quic_jianshu@quicinc.com>, Guru Das Srinagesh <linux@gurudas.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 3:01=E2=80=AFPM Albert Esteve <aesteve@redhat.com> =
wrote:
>
> On Thu, Oct 8, 2026 at 9:03=E2=80=AFPM Mukesh Ojha <mukesh.ojha@oss.qualc=
omm.com> wrote:
> >
> > On Tue, Oct 06, 2026 at 02:57:45PM +0530, Pavan Kondeti wrote:
> > > On Thu, Oct 01, 2026 at 06:16:48PM +0200, Albert Esteve wrote:
> > > > From: Ninad Naik <quic_ninanaik@quicinc.com>
> > > >
> > > > qcom_scm holds its global mutex across WAITQ_SLEEP and
> > > > wait_for_completion(). Firmware waitqs allow multiple SMCs in
> > > > flight (wq_cnt). If one call is parked on a waitq while holding
> > > > the mutex, a second call (e.g., SMCInvoke) cannot enter firmware
> > > > and both stall on the waitq.
> > > >
> > > > Replace the global mutex with a counting semaphore sized from wq_cn=
t,
> > > > with at least 1 wait queue.
> > > >
> > > > Fixes: ccd207ec848e ("firmware: qcom_scm: Support multiple waitq co=
ntexts")
> > > > Signed-off-by: Murali Nalajala <quic_mnalajal@quicinc.com>
> > > > Co-developed-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> > > > Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> > > > Signed-off-by: Venkatakrishnaiah Pari <quic_vpari@quicinc.com>
> > > > Signed-off-by: Jian Shu <quic_jianshu@quicinc.com>
> > > > Signed-off-by: Ninad Naik <quic_ninanaik@quicinc.com>
> > > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > > > ---
> > > >  drivers/firmware/qcom/qcom_scm-legacy.c | 8 ++------
> > > >  drivers/firmware/qcom/qcom_scm-smc.c    | 7 ++-----
> > > >  drivers/firmware/qcom/qcom_scm.c        | 6 +++++-
> > > >  drivers/firmware/qcom/qcom_scm.h        | 3 +++
> > > >  4 files changed, 12 insertions(+), 12 deletions(-)
> > > >
> > > I don't know all the history, but in downstream [1] selective calls o=
nly
> > > allowed to sleep w/o mutex.
> > >
> > > Mukesh, do you know if it is safe to allow all slow calls w/o mutex?
> >
> > In the downstream implementation, there can be calls that occupy waitq
> > contexts and sleep waiting for events from other VMs.  However, there c=
an
> > be multiple such calls and we may run out of waitq contexts. Normally,
> > these calls are SMCinvoke calls or qcom_scm_qtee_invoke_smc() users. In
> > those scenarios, even normal slow SMC calls will wait for a context and=
 may
> > wait forever for one. For this reason, one waitq context is always rese=
rved
> > for slow calls to ensure forward progression. So, slow calls
> > still need mutex for such cases.. However, I doubt if we have
> > sleeping SMCinvoke in upstream ..
>
> Thanks for the context. That's correct, SMCInvoke isn't upstream, so
> the starvation scenario described in the commit message cannot happen
> today. The semaphore here just replaces the mutex that was
> unnecessarily serializing all calls. I can rephrase the commit message
> to avoid mentioning SMCInvoke as motivation (that mention comes from
> the downstream commit). And if SMCInvoke eventually lands upstream, a
> reservation could be added.

Hi,

To ensure I take the right direction, should I keep this patch with a
rephrased commit message, or drop it until SMCInvoke is upstream and
needed?

Either way, the next patch adding freezable to the waitq does not
depend on it. Regardless, the check that treats =3D=3D 0 as invalid can
remain independently.

BR,
Albert

>
> BR,
> Albert.
>
> >
> > --
> > -Mukesh Ojha
> >

