Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA31E4349A0
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 11:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372481; cv=pass; b=AR777mfqvYL4E+0ouu56DB+XlxTDil9i0MrPWPu8ezgzE1w/LDVWDCP1Qy076Z9uOiRmrv5QIDDXmWU3Idd0wa601F0lAjvMBYPe+V3tsCYI1oYZ40QNfSAvb7AxAGoTH1m07NoCAtlqz0lJ6qo85UfrqV1e996eZEG0pjEfr00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372481; c=relaxed/simple;
	bh=FpzJ35zvhmqOa2+RwZnppUz698uzzC9G/FlxDAwKxyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TfFbkYeHlkxhEYICZV8VNBntS0B6ohBp5bZwwiVNQZLDvCa8YHKii8UwxSaxWXMs07OSzEacG+ok7i9J/y1QjCxB/CuiGbnyz2bEAOIZKya85Ffx2rggK1cuzi20zsldIp4gflSVBhvNg/Mj8CL7nWALfPwfsUYLqYFYCN3531E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekAsJW71; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekAsJW71"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67699afea08so1805711d50.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 04:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791372465; cv=none;
        d=google.com; s=arc-20260327;
        b=XbFBFzaGbSMICXbCZk/hyV+zV2zR6QBFvOmABPgeQfZ83ZSMxAr8M3AZHFrwh9QKBf
         25xHL8C9+kRUyvlR/GMQ9Fh4YUj9jRx4fUTQpqGKvkXZ7opbcuLRtXVSbmRl1+ns0oQy
         bqt2MTMgT2nv6Vv97Db3GqaWCq4k3Vigg+YH7MvivD0ZTJ1eSBuZ1RBbEm70N7G52I9d
         y5RUabmhaJB77Z83wUbL8z2h1xnh1TTnlNssoxPt1HGTTdmiML+QAOEPOTYLTG2kFuyq
         vY02r1+Oyfg58HCTaqE9XVmvb1VsGGPUHvYgnqzzmx3q3h6tRqyz59rFEgdx1bkxMmq9
         uroA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pavyWN5UuE9jlfBpdpJeca0fIeVjQP6tBMNr3yh5OZo=;
        fh=BikEyu30mHsYpV4GeR3gWWJ4mGuGFbUbr52bHRbsqfU=;
        b=Njl6IzgVeqsBZNvAgpluifvnIWC9ESRw0B5hW821HS0iWqRLFYu6GcST6SmQsxc9vf
         2GQCa+Ox19g2x7eIrMPEikyH2Vng8kpluiexxc7Wpxjmdv3pfBvw1XfoUtbAxGzswHcu
         CB2yB8kiTp04pLHGidxdnT+pZsJR21FOlpa/X97/+6Y1MYcovrAb53O3rUzq5mTbhvx+
         sTrf2GN1bL57k5OtzHFOzIX4fhvr8gw62G7rFjjFFutVGnZIHrQRt8FVtxm48GGPR/rB
         brYYwZzQltPG8mn7GiU9aHcCQvAH0uh8yWA4kCRc7SVwSZG2foAtSzFPqnFPAN/jI+Bu
         ahZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791372465; x=1791977265; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pavyWN5UuE9jlfBpdpJeca0fIeVjQP6tBMNr3yh5OZo=;
        b=ekAsJW71M9T9SI/egh4sshHwR7cszL3UPcuQljDyCjPu7KzXjwEDvTaRBqszr9jTbp
         o16EnFaWwL7HV3TI2cvXq7So3tpp9Vblj+zpY5YaunZJfBSjceaGGNndi6DY/10ernu6
         Cf0dY6kF02KBthwTwnnx2Cxldp+xxDfh/XYHptxyic7YhVr0tJyT1chQXp02h8jCwZEA
         j7g+h5Gu/jKROvgVOOqWTNcmakOKkgi9JkFpsY3vvlVfmNklHhnI5LApP4O6CsxEgxCK
         wk3Fpx9r2fZhJdCW3ZTZfPt9YpU4hlZ6lRJTswEUl0l79xfQdsIYIOxHiK/+3z4o3mn2
         CSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372465; x=1791977265;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pavyWN5UuE9jlfBpdpJeca0fIeVjQP6tBMNr3yh5OZo=;
        b=NAVXl3G78xBnzKW66G8H3/1kUz3vzNLtF01CP9jnyEhRKJydM1xSMx1ma4XIXYj9g9
         Tnfsf2mmUQZnh9GTMMshCXwIzgoEzLI7a6jGXh7SzEKNloyL6iWFUaGPSHkws4rcNSRi
         DvYnI0dVjchcgkJpBOOUAJvBagw13vfRgb8cMuY7tfQbPMHJdsEk8EdXU1RBprqrkwbu
         rnc9qKBxau8+CKCkDlokPcswOG5cnkDz9WSt+qqZVaPypMGeoLLHCk1eTVFXqH7pLkrJ
         D6dyc+52UgzEtsRHT2Uy9d7tv9bT/p+NfS0+lT9zZWlMisoNKcUcr1taozpshq4W2H9t
         cBlg==
X-Forwarded-Encrypted: i=1; AKwUvBzXX7bXv5bGm1UgAJanxlNPITAYul29+/wTqzHcrhgF8Hbtl5VI6LlgTOBndK/lE/PtCDHUoMs2Y8XLafsk@vger.kernel.org
X-Gm-Message-State: AFq9FYIlas8Lmq5jnN2nXwEvmP+F+V9xT3cfxq1wNjAePzMhvZnnI7TK
	8BYqL5ip/5LS6tmf8X+4WWwHalKStQk7eoU11xHR50SOao0QCdqzjqLXB+CPFp4ucjWt4iQp2gF
	ScFt5tmXvQCbokRhcdeTbjBXBsDsyn9c=
X-Gm-Gg: AYBFou1HqqAqyFjPmVrED5lLo9KDvZpK9VdeQv69/Rks17YD5MdPRLWPGIxqRcr1yHX
	fFT33cmoCZBJbGJr8w8HQA99aaMNhqEfrSrrdV/s8eIVRFo7TiGCsJ3WydT9S+dmwChXyzkoBev
	sJcAmwpxHtp1lk7QUS5UM+kIF3+WsFWAZG9H8V0iiYZmfMuWkL/eIVh0WKAgaMw2ni/2OvnLahz
	lFNVXJTort4q+IaFKls9XKbd7W3mE/BE7/SBln7S6ElOFxduBiHb3bKPInWmMe8dqV6zIVCnsep
	88j2bh+NNFiJIPU02hmbr0jHnlQBKnyD30eVJVv2DE/Wz6jDF5wOQjE0XttPPtlSMWk=
X-Received: by 2002:a05:690e:1182:b0:675:6d8c:f445 with SMTP id
 956f58d0204a3-6790a0b3142mr964922d50.10.1791372465276; Wed, 07 Oct 2026
 04:27:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808112043.2781244-1-lgs201920130244@gmail.com> <ar1yiPC1pxx8H974@lizhi-Precision-Tower-5810>
In-Reply-To: <ar1yiPC1pxx8H974@lizhi-Precision-Tower-5810>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 7 Oct 2026 19:27:34 +0800
X-Gm-Features: AclHuK9xkPJNTgSq7-x7dqK0gz-t6G-LeWcqzQTZVQ2BJAwWf9PL48vGNZtximY
Message-ID: <CANUHTR_w4cOAOoYDCDS8bwzPEuYgWp1KjZztgLx-4P1kkhwjiA@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: qcom: hidma_mgmt: fix autosuspend cleanup on
 probe failure
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Sinan Kaya <okaya@kernel.org>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

Thanks for the review.

On Thu, 1 Oct 2026 at 04:35, Frank Li <Frank.li@oss.nxp.com> wrote:
>
> On Sat, Aug 08, 2026 at 07:20:43PM +0800, Guangshuo Li wrote:
> > hidma_mgmt_probe() calls pm_runtime_use_autosuspend(), but its failure
> > path does not call the matching pm_runtime_dont_use_autosuspend()
> > before disabling runtime PM.
> >
> > If the autosuspend delay is set to a negative value while autosuspend
> > is enabled, the runtime PM core increments usage_count to prevent
> > runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> > during cleanup, this reference is not dropped and usage_count remains
> > unbalanced.
> >
> > Add the missing pm_runtime_dont_use_autosuspend() call to the probe
> > failure path before disabling runtime PM.
> >
> > This issue was found by manual code inspection.
>
> Your descripption doesn't match your patch. You change change pm_runtime_enable()
> to devm_pm_runtime_enable()
>
> Frank
>
> >
> > Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/dma/qcom/hidma_mgmt.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma/qcom/hidma_mgmt.c b/drivers/dma/qcom/hidma_mgmt.c
> > index 4805ce390ffa..470c88f36d25 100644
> > --- a/drivers/dma/qcom/hidma_mgmt.c
> > +++ b/drivers/dma/qcom/hidma_mgmt.c
> > @@ -168,7 +168,11 @@ static int hidma_mgmt_probe(struct platform_device *pdev)
> >       pm_runtime_set_autosuspend_delay(&pdev->dev, HIDMA_AUTOSUSPEND_TIMEOUT);
> >       pm_runtime_use_autosuspend(&pdev->dev);
> >       pm_runtime_set_active(&pdev->dev);
> > -     pm_runtime_enable(&pdev->dev);
> > +
> > +     rc = devm_pm_runtime_enable(&pdev->dev);
> > +     if (rc)
> > +             return rc;
> > +
> >       pm_runtime_get_sync(&pdev->dev);
> >
> >       virtaddr = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> > @@ -310,7 +314,6 @@ static int hidma_mgmt_probe(struct platform_device *pdev)
> >       return 0;
> >  out:
> >       pm_runtime_put_sync_suspend(&pdev->dev);
> > -     pm_runtime_disable(&pdev->dev);
> >       return rc;
> >  }
> >
> > --
> > 2.43.0
> >

You are right, the description of the patch does not match the actual
change. This was my mistake.

The patch tried to address the missing autosuspend cleanup, but
instead of adding the explicit pm_runtime_dont_use_autosuspend() call
in the error path, it switched to devm_pm_runtime_enable(). This made
the implementation and the commit message inconsistent.

I will prepare and send a v2 patch with the fix matching the description.

Thanks again for catching this.

Best regards,
Guangshuo
