Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7C24DEC3C
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 14:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607341; cv=none; b=OQ2sDT/+fazVTpOBIkX27+Kaz/OgKky2tGfehaF808qK64qgtFbAPt0PyA+0yriRNTsp53OUk5cZizK6B8XIo1w8TkNzszc+Dmzg+nDRKCfaLZninWmf+OyQS5rL9dCa3FRsaXq6Bp8q+27z4vtVLGXaRcnNJjeGM+GB4PqRlg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607341; c=relaxed/simple;
	bh=CU0HkBGA+tWnISbdNXvlHJWhIkt/fCCiMdnnzNXvSpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KElkyJwNT9bHOVkuHsl+2K0WZqRwm8z0ePNayo3JvkGZw3mFN/3nm+sqOaQNBd0lOchby7B3Li1JzEED4S/Zwuws/6dGvVUGsO9OKTa3Pi5dzlLXxk0P/x89CMLDkjjoy9n85FtDd/0cbLnqB551dY0MUzFarVXm7tTSGTiWd/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q7xEFyGp; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q7xEFyGp"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93c64decd21so97744485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 07:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790607339; x=1791212139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3PFHQSNiI/deU+anoAMsoL0RautmW9OIvnnbT2VDLMI=;
        b=q7xEFyGpshL4IhzTKNSMB3o3Ug6y3OWMqmMiM4jB59or9plXIl+8AbbRWXQ+qGkY9K
         z3BxheaqTpIKjDFvuyoXaSbg/Y6yTlEnkjxVkwdH6fHCd3y4PZvewaTljNqFxGsG+B/f
         ktdq47HeURiHkUg3mVJHV6ao5KC6XmFMbHpS4B3N+b0o8a1V3V50/NohGWUilu1o0dUz
         QRQWfAMS6QZ8QA1/Sus39D29ZE54CaZKjgxQa5d0HtFn26KsHdXK26pHp4FykM3s1n2E
         05TXUy2HLx0FqjJADKxONdhKTVhHv0G1cbu/oC18Q4BHljEgpI+I+aTW1j7SG0j9pyMO
         OHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790607339; x=1791212139;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3PFHQSNiI/deU+anoAMsoL0RautmW9OIvnnbT2VDLMI=;
        b=yvc7zUaIBwa1arYfN0YAn2jcm/79WXO0MD/umZd8UScvm3w4B3rn3c5PIVbzuFQdX+
         FSMvhVbeVRrB9BUWqtM1rZqsKwUyKxx1kRHX30PeDDI6FXHoDkjNk411l4NzNAdrbnet
         OouH1p3kOPi6Yb8tuMgaMcYl2xuCA/NlNCGiY9ByMIjKxE7JRQzqg7AFE6Fx3uSs5E2G
         QnRxKp54e8qJ8iTeOsi/6tc+xDPEs0M6lR2ZIZXym9lVOhGY6CxQ2wg7K4t3lhLyXP8O
         n5GNwhYZIMhtwzkcPRHE0XCQcgmD6p4Ole0qMgHLz7EKKBU9sS4uJ2GKn8f9gbTc6oQi
         xvSA==
X-Forwarded-Encrypted: i=1; AKwUvBwucIAlTZXwlz8mm++CDQS8yC3fEYOaqf/76J+EPd1YYeEevBmW2nbfScbDNccTaDkS+1wnw+XE0iYz0dw0@vger.kernel.org
X-Gm-Message-State: AFuF++nqMM0P9bDpF0BwBgR6EyfxL2zOfIxlEly3dGo3QsLNVXscugaM
	qrgZjcO67W1pDT5m7Ss2yIZye2yPpavhL7MTV1pIpQ0FjCP54KEA4GjI
X-Gm-Gg: AYBFou0aI9Ehng2acmTTyq1DdHYxPPuaU73Y47wOp+Qt14gw5wATptPSzjVul6rYFLU
	WSCpQl0sPYRdiDqg7q96QlzRCLn515QZOQj5vIVtpeBgbiAwd16LINyXPk0Ng21HsAFnQWdNIJd
	MJHAaxKlzObZMuXlCzcoPXSCtnVQyTRxhbiZyZon5YpVPCPhJMqJo3E4DcrCigKYmG2/l/CFT5i
	SLPlkU9FYIK5IhIpyrZ8d7hmHhR5YgUI3nMz07Re2Pa1qYgvvTD58SncPCtK8iimpNYJqD6uhmi
	3NG0BlUOBPHqt00E4S5DxtP+TDfUJr+Y6bhX9kd2tyUWqBLb7WVEECuqyot7lxrBPYaofatUKae
	B/DZHyjq8L0IKCK79lT6H2Sw8gOyxLAptTPkWXwbtu2Lt4C8n0DxNACGqfTxnuQ3NF5R1NbqwWT
	DAi/vrNdL08ENG0h+yvI2U1a+XylDC1ofm0awzNrG/WXJdr2wwM5yvh7ZajodTE5sjfEjXglf2n
	xU=
X-Received: by 2002:a05:620a:1a1d:b0:93b:d88b:ee01 with SMTP id af79cd13be357-93c43dc1bbbmr1832913285a.34.1790607338944;
        Mon, 28 Sep 2026 07:55:38 -0700 (PDT)
Received: from localhost ([2605:8d80:6a29:8ead:1921:5a14:4db2:536b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c813cf1d6sm168115685a.19.2026.09.28.07.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:55:37 -0700 (PDT)
Date: Mon, 28 Sep 2026 10:55:34 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 05/11] remoteproc: qcom: pas: Add SDM670 ADSP support
Message-ID: <arp_5ts21rAgcr-P@rdacayan>
References: <20260922015801.32373-1-mailingradian@gmail.com>
 <20260922015801.32373-6-mailingradian@gmail.com>
 <58ced827-d6ec-49e1-9a2d-a4d5c4111721@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58ced827-d6ec-49e1-9a2d-a4d5c4111721@oss.qualcomm.com>

On Tue, Sep 22, 2026 at 12:44:36PM +0200, Konrad Dybcio wrote:
> On 9/22/26 3:57 AM, Richard Acayan wrote:
> > The ADSP is used to control audio and sensors on the SDM670 SoC. Add the
> > compatible for it, with the same data as SDM845 since the driver
> > requires the load_state.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index ca8e61254c44..5272a462fc49 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -1865,6 +1865,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
> >  	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource },
> >  	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init },
> >  	{ .compatible = "qcom,sdm660-cdsp-pas", .data = &cdsp_resource_init },
> > +	{ .compatible = "qcom,sdm670-adsp-pas", .data = &sdm845_adsp_resource_init },
> 
> Would a fallback compatible be suitable here?

I'll do this next revision to avoid adding the constraints in the
bindings, but I think SDM845 will only have one specific compatible.
MSM8998 and SM8150 use different data than SDM845.
