Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFF52EF67A
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 20:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787169636; cv=pass; b=NAg4xRLGYwI7uD/3Vjkl7j/HXkNsmJ67A5mQcnXXN3JIGnWAGVuTl/Ua1wLHY72TXYcq6KdDqzVi3Bj3DlrVbEqJB38DwZgKU6F/HAbPtT8fqhvp5jx6cGa2E+YO1HTWdyqeQihlBafcCgfeo0QVktu4b1YOKuL/P76tBO4Yrb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787169636; c=relaxed/simple;
	bh=vIDvQ1BYL5+L/acX8gVrRxrqnuz1ZgyTKSzf8gbt7No=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z/e/mFrN5mJRgxabN0XFQB3Jsy8U6g9Ma5QSbC19JLxN0AmGAFkl9BPD3JIY+W5kCvt0uujAYG0AzihI3KgNZyV/epvuN/HRdX7YLCGB719eGMHRlRkpTzghzGJ+waFrsHdWiv0DBdSi0/nfpjqmMQ9Vc/bMtIeG3u/tFzFPtPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rbJy4Lw0; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rbJy4Lw0"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ceab75934dso17080465ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:00:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787169633; cv=none;
        d=google.com; s=arc-20260327;
        b=i+EguiJlUKMV8SD4ixM2Zp6zym9gno4g6LL414EBecuwI4SNJDFa4VnTWe/Moasf90
         5A/mO2L5JtSiWCctU4cgtJt0qYc9iqiXZ+XwbQ54qmugD5D2al4kfFNFNDc8j1wJ8V/X
         2koJjhFpY9aoptR7pitk/M17F90GbLXxRde2UgYWxfLLAjMvz95F7pUv/xD/Rr+D93We
         pMlFy6b2Ew3Enn1nHrCqHjYSgWvFkQ+q/wVUd7O58HGlTMq03K32dr8B64c3XUCSkJkV
         d7oGf7liErO+zAPNbYaQIMVFCR0hag8zA8d9CB4QjPAUyr/kySgrrFFakl6587g7pBkm
         IqwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vIDvQ1BYL5+L/acX8gVrRxrqnuz1ZgyTKSzf8gbt7No=;
        fh=p+YeH/lS0H6rdkFYTGFlVScXSfC5L7qmWtGt6Y9CF4k=;
        b=Ooj0OQAJCUNxAwIEzsOCC3VA2Dub+wd1PcX7xhz+xBedH2eW5UJn30jiLN4ks46d58
         nt3lmnyMHx8qxVC1bkJf5GpyggQLJ0FePrgWyGKDE5kxaRPhicTkU1It/GaMER5X6BLW
         BWMMSA5/xSDpzFX1Qu8z2vz8pleceB/DcNkULOVdFnmgm3CpXV9FkMH0U0M3LQP6lqIS
         syysu14QoovafRBk0Zf8v3YETP5N/Dc25mw1n8dPaRtla0Gji7rjTWJkZIJ8vfr8WWRj
         BZSQ48cQrINsZ/lXFjmHc12/VHaXFR5Drvt6aGmozRO8GNoKxdAWropkVM2+s3uGlmlz
         pikg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787169633; x=1787774433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vIDvQ1BYL5+L/acX8gVrRxrqnuz1ZgyTKSzf8gbt7No=;
        b=rbJy4Lw09luyWlanWq83oUmHIwLTligubcgNkiIg5b7JBQ7pwRo2pEnpUeWNSSOZlK
         Ri8ctUAFaPYqPDnwC5ITb/zpWolF8DsZ9szway+6KcPjqxjNIamysQoxbOKm880jW5jp
         j+d/ybpp8RF8Hv7AzEA57DZ30VBRcaNx0wnnOYSKWWBIJhQXjknDZBvTtskQV/T+Fubo
         EQumn5D/+hSd/U3uw/5qJtlmGqa3nazt15u8SmiJ6gZnk609e8DmFGXWLxjYXDUU94X8
         WxU5od6WI0bdNzxxuDcmYhzZp+6f6X4KqjP5m9/V/u1BC9rH7SGy/8SnpQEJDXSk7NTU
         Kg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787169633; x=1787774433;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vIDvQ1BYL5+L/acX8gVrRxrqnuz1ZgyTKSzf8gbt7No=;
        b=DtOHvv2zXEal8QbceWfPrHklA7DH4xU6ehnTdhAuhYDx6/9RZIYbfGiIJ8BHBQ5mzM
         7owwTz0u174kjeGep5MO+Wt0zAvVDqWRU/jC5bGoWOrefIhNp4In65Xd8Kdsre1w9AS3
         XSl8bUqPPQQrzi3pgJegErLosUxUazLyEu8oSP/sFV/X2N010y/+FNJfPel0Nh9aCudu
         ClsGqjj6vKT+A1DcmaDKvTbIDMtDOnqzyNp9THoRtlc0bQPMAOtr9+khgYntS1fD/34a
         cfsgUQ/F/3zs15cTeg2dM5SPqxglZrHZDy+xif7T+7edMoHbAWiYLDoEEJLCvoVERtoh
         L/ag==
X-Forwarded-Encrypted: i=1; AHgh+Roc7PQGvvySObvZn7Yti6XR9c5PD3LtCGMRio8TSNNCgYm3Dr7DALUa7rV6bO9LtGu52KUiLtBrCGr3ZtL4@vger.kernel.org
X-Gm-Message-State: AFuF++mnZB2YBQn7rWho98MotNiN0tWAukAnk3tyiAHVT+AdsKd81NnA
	nC1J3c0mtG8kCB8Xwd6c48ArY6v/rswkCjVRbfQUCiC0LHBbtbEvrvRU485RLus0zrKREteXhg8
	+jcR3bwwkd1bCOOXdwt9SLMkfMTN08Tg=
X-Gm-Gg: AR+sD12+03IXKL6jjE5+n4feJtEc7PUo4wbghyRIMSBkLnIFoufSatPEI8gkWF++KyA
	1Ob2Rt5UaxmXajkA6vuX9horjKf7SN4+p5N9k4t4SAazKAAzdruvm4bRzX5Pgl6YqvcpWUUfvIR
	CFXOMa8HLwKS4DKTEvFSRPLk9IIThmUTqAUxoZRd6MVUXR1RuwjkvYJSQLrcOi6zMhQUg6VMMxm
	YZnKVHDyVakguk1rN9W6SN6Atie/2xmd1dVeWxmUMcyemTXNSDQj14MWY2rtKAXmwhYkL6wRRY+
	vfxcKFFDSmbK2kElO9U4B+NYQ0vDyiWMvdJKaBub/SJtH856rSpuGEqfX9fbPXHD3jkjD27991l
	41AukI7Cpbu/7GqscplhpIsZVISy6ah7lF5HBhJfOux3xFRxlW9Uy5OJUnpNIpvM=
X-Received: by 2002:a17:902:e541:b0:2ca:ecf6:910e with SMTP id
 d9443c01a7336-2d5fd38fcffmr113795575ad.0.1787169633345; Wed, 19 Aug 2026
 13:00:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808171321.133028-1-jesse.casco@gmail.com> <9fab8686-d0fa-40df-a6d0-75349861d78a@oss.qualcomm.com>
In-Reply-To: <9fab8686-d0fa-40df-a6d0-75349861d78a@oss.qualcomm.com>
From: Jesse Casco <jesse.casco@gmail.com>
Date: Wed, 19 Aug 2026 16:00:21 -0400
X-Gm-Features: AcwNN1VvGTpq-Un825CS9Bo5iwfRmFgQWXNI8QlDt_2Z2tzb9vZb1doA9jCY3Ms
Message-ID: <CAEaxeoRkYMQagxz84zNL+L4iO3s-KZFDOQ=LLU9UmPnO4o4hhQ@mail.gmail.com>
Subject: Re: glymur eDP PHY (v8): link trains only at HBR3, all lower rates fail
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@linaro.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Confirmed working. Applied patch on top of next-20260819, panel
trained natively:

DPCD 0x2201 ext MAX_LINK_RATE =3D 0x14 (HBR2, the panel's actual advertised=
 max)
live link: rate=3D540000, num_lanes=3D4, bw_code=3D0x14
2880x1800 @ 120Hz, 24bpp, pixel clock 709.633 MHz

Thank you for this! Happy to test anything else if it helps.

Jesse

On Tue, Aug 18, 2026 at 6:39=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 8/8/26 7:13 PM, Jesse Casco wrote:
> > Hi Abel,
> >
> > On an ASUS Zenbook A16 (UX3607OA, Snapdragon X2 Elite Extreme) the inte=
rnal
> > eDP panel never comes up on mainline. It is the link rate: the v8 eDP P=
HY
> > appears to bring up a usable link only at HBR3.
> >
> > Tested on linux-next next-20260713, next-20260803 and next-20260807, wh=
ere
> > phy-qcom-edp.c is byte-identical -- so not a recent regression, and the=
 May
> > 2026 series (eDP low-vdiff LDO config, unified swing/pre-emphasis table=
s,
> > eDP/DP mode switch) is present in the tree tested here. The sweep below=
 is
> > from next-20260803; the machine has since run next-20260807 as its dail=
y
> > driver, where HBR3 still trains every boot.
>
> I mentioned in my submission that this series is required on top:
>
> https://lore.kernel.org/linux-arm-msm/20260622-glymur-edp-phy-v1-0-814b45=
089ac9@oss.qualcomm.com/
>
> Konrad



--=20
Jesse Casco
