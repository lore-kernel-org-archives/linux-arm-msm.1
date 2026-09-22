Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D9039A4CF
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 02:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045550; cv=pass; b=mV0WybBk6/XjxwFUoExAuCvP6XMnsx/wxIqVrzGkJC/3RiZSHbaJILrU353ofg6WRvvA3JkxYkH8UM/Bv2a9TIulzIxAgddbcUvYNzcpPCC0HEjvqGo3IEiry7zViJsEXauuCXHUM7y5dNN4eVSBVR9hgSMBpWnA2lV7pgziibE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045550; c=relaxed/simple;
	bh=vZgcNyGoD2xypSKwXw/Ad5tVtETNlWG6kTClMXEsd4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LdX8xODJ/9fkkkmrYrfiHMjcczgepaNXtshvGXrDWdqjkZiEMuzK2dbbiPSE0YSNHas+yGgJV9HlbeaHEnqjfT1FiHwCwLuEhzUKZECng7T+0s3VxJ4Dm/Wpb/0TUBfnruqgD0fah445MnZMh1tbyIXDYvNMV4wyrm7iaopjIJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfeXEc5U; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfeXEc5U"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-670fee39d73so3841517d50.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 19:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790045548; cv=none;
        d=google.com; s=arc-20260327;
        b=JujCFmo0NvR9Be3OPZQzbdqGv9OQnvftZ2zjFNUPAOQt8K5o4UiTTxODAGI5Irjpc4
         NwcNp2bTKZXqjHoYjcABERA0eDT8oZj6m+Z1ag/CtfxV67V6y9T95+yCOqub5aypL1Wa
         ciKwcWvmPLSdFEmLOuokImB0H8gBIK4RZBFfsan7BCbv8iQhmvVX70ewoI4h3mKYVqQ1
         NK3fYVPn1kmPulBwyQdAC4ErI4QYj8EZ/EZqX+AVWn7kIrZhy8h8+ii003cdrDuUZkBB
         BvM02N4xqwvmXhdtXYnQut2mvZpAt9weU0Eu5SmatM+Ey4xDzo2O+lO42TUBzk4m/UIe
         mc2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ghvfyjQSQHrPZknarysRzqoTzq1YP3d2PY2Mg+SWx4E=;
        fh=QRB13dQzNWWwTp/pYBZNdwT68xDKIAYaIUgfT0MYDeg=;
        b=mkePJqJyhr5hi24vGxSVf+dEp7Nda5Ir+uRtoKZ3mGBJpHWRIBmsZRijEJmBr3sFst
         XfspKbjPetKY3w4pKPau2fYwiEKnV5PO4pBakBWabT6tKC1rbIpP+giIh3JQNTB6JTdy
         OPDdNLqofEN/CtMqtsM98xwXYazc452dSRkAXPdCp5z0vqizVFHrllBJF9rnMnWs8/wL
         IDpw2h+ZyeB9FIo9LvRBInZ85a9TH3LZpKulVyCrDjKfidpmbVsOq7fL6L+cn8qQJYas
         VehveuTgzmQ8himXYRIGgNdvrcBnPXgCmZoF0XNYDN8DuTwMBSwjxXl9FlpjuV4IRE5X
         mppQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790045548; x=1790650348; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghvfyjQSQHrPZknarysRzqoTzq1YP3d2PY2Mg+SWx4E=;
        b=UfeXEc5UOrPqn+cOPfea66JiPCJSV0pIfXRJqG1p/DeqJW+6Yjr8Z29i4Ce4gX3YZa
         WRyb3O8R3jprr1nJXYMrQiK+RM0RNj7YVcKk6yU5no34XQ/rk/MFuqGQgFwTGt6M4VQM
         U7gDEqwAUUKFgUa3Vujp5trCzbSEfGpmGvWVGQDrQX+i3hXj0MFk9xqNIBBIZzAXHKMU
         lP9hFF1Up9lcRq4oTL2QWufe5XM1SK2tJHBntx7uNDQpF1eAnpuVC9uGQW5w0Gw95VYm
         1wPJhhq/OtrBHEsWwPVD/4bYA0RAxOBTLkFedhR5AtzARXk0JairK+PEOlO7KYT+hh/v
         dOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045548; x=1790650348;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ghvfyjQSQHrPZknarysRzqoTzq1YP3d2PY2Mg+SWx4E=;
        b=kao0eBYGt8jKsO3+6grMRYIavb7GJutK9FaBNCVodu+jLqrRAp6ampw5DHCro9Fa/P
         lV8cFvISOikShK0sQavzJ5iGXXwENxt2EGiIr60n56+xdL+5fXr3rhjm06gc1bOYM29U
         Hgvossv1HLl4GkEDOpyPWYxp0GM+o3Ztq3PQmCPz1W1wTnFVLH1ty0/Qc6qidyoec7j6
         AOzbdotd/Qla7SDNWkqR27YfoBOIPqMRrwTh7AyeMTWMzZPmD5EuCx9TIum4g2Jkbti0
         2cbzlFeShLtux3kCciLuq0OP+Cnm0jVIqpAaMAeSIgkc4/3VkIhnadvW5yd+8uSrPcwU
         RNDw==
X-Forwarded-Encrypted: i=1; AKwUvByS5jTSIQQRcyoxCabaCd1zCLAZ8ON2qr5ZNth7Yl+WmBw2evour1v4jHpdg83WQUTXMAYNlTY2L8L7FgpV@vger.kernel.org
X-Gm-Message-State: AFuF++liM1K9VgGQrBC4Zrn9r4kJROCZUhi7yieexZMiHqdSVOjmIHxG
	yRkmXOvZrd0n5Y89SFoMln/n3tcIS9qayoKezU++iasVXB6WpixMmK2aVy6w+r5J6JkCFWlu/3C
	Y8fBrTDxp2vMYaCntgfAETSyA14ndWfk=
X-Gm-Gg: AYBFou2sh99OdioJdIElGchd+ITPvNjJ+1zzirsi5uL+kSa/SWOus1iAUsviwVxPJZ8
	KM2kHVbsjVEetogC9XbN0tRDa07tLfUEXqKPuULh2OBg+0awcdmi9ickC3UBgvlb2sxrFvlyrXc
	274/oNtVX8V59yNBT0hIkPABCBptacTxDhOrbafEF4T1GaT9AkrHdjiIJ3Vu5JWhOQyahqz1fwP
	ZrFLhFUMIQ3EGAvXfx5YlAOyMIdWErHW4QH3QN9iAHTI18Sz2cnibXFP/RkXg7B3t9Ot1t1B507
	55chdunDSFxptS9N8H3kFHhDtGHoxrp6xdcYmutT6v6TDv9lV9L4IkR/Sg==
X-Received: by 2002:a05:690e:138b:b0:66f:c1bc:4034 with SMTP id
 956f58d0204a3-6717fe5cb92mr4558256d50.97.1790045548157; Mon, 21 Sep 2026
 19:52:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918041321.3532355-1-lgs201920130244@gmail.com> <arFJzYqY_mdeXr4C@quoll>
In-Reply-To: <arFJzYqY_mdeXr4C@quoll>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 10:52:15 +0800
X-Gm-Features: AcwNN1WF2Sc4tKp3txE3ezqyAtiFFXx1O5SoObsCwLYSaLQtB5TSAaZylyQ3I6U
Message-ID: <CANUHTR8c+kVfVWttETsVZtWSaBS6LAEGuipWYNUiHw7==LLfzQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom: q6v5-wcss: remove all subdevices on unbind
To: krzk@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, stable@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Sivaprakash Murugesan <sivaprak@codeaurora.org>, 
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for your feedback.

On Mon, 21 Sept 2026 at 23:14, <krzk@kernel.org> wrote:
>
>
> On Fri, 18 Sep 2026 12:13:21 +0800, Guangshuo Li wrote:
> > q6v5_wcss_probe() registers GLINK, PDM and SSR remoteproc subdevices,
> > and may also register a sysmon subdevice. The probe failure path
> > removes all of these subdevices, but q6v5_wcss_remove() only removes
> > the PDM subdevice.
> >
> > As a result, GLINK, SSR and sysmon resources and registrations can
> > remain after the WCSS driver is removed.
> >
> > Call rproc_del() before tearing down the Qualcomm-specific resources,
> > matching the teardown order used by the other Qualcomm Q6 remoteproc
> > drivers, and remove the GLINK, sysmon and SSR subdevices together with
> > the existing PDM cleanup.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: 8a226e2c71bb ("remoteproc: wcss: add support for rpmsg communication")
> > Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_wcss.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
>
>
> You sent multiple independent patches, to multiple independent
> subsystems. The amount of these patches clearly suggest this was
> AI generated and most likely not tested.
>
> More importantly, you sent all this work without properly organizing
> relevant patches into patchsets. This makes reviewing difficult
> and might cause multiple reviewers to address the same issue.
> Replying to the entire set is impossible and requires handling each
> patch independently, instead of applying or discarding the set.
> Maintainers also won't see the bigger picture of your work. Quite
> worrying.
>
> This is on the verge of hostile patch: bomb us with so many
> contributions, we won't be able to handle them in efficient manner,
> like responding ONCE to ask you to slow down.  Considering all this
> is untested and LLM generated, I have even more doubts whether this
> should be considered for review.
>
> Please read kernel documentation BEFORE posting more work. It will
> explain you how to identify subsystems, how to organize your work per
> subsystem, how to document usage of LLM and how what you should not
> do if this was posted in a good faith.
>
> Best regards,
> Krzysztof
>
>
>

I would like to clarify that these patches were manually reviewed and
audited by us; they were not simply generated and submitted by an LLM.
However, I understand why the recent submission pattern may have given
that impression. We sent too many patches in a short period of time,
and we also failed to respond to some discussions in a timely manner,
which made the situation look worse.

Many of the recent patches, especially the v2 revisions, are
corrections and improvements based on previous review feedback rather
than completely new untested changes. That said, we recognize that the
way we submitted them increased the burden on maintainers and
reviewers.

We apologize for the pressure this caused to the community. We will be
more careful about organizing patches by subsystem, preparing proper
patchsets, and following the kernel contribution guidelines before
sending future work.

Thank you again for pointing this out.

Best regards,
Guangshuo
