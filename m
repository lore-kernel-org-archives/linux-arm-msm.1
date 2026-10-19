Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792425222;
	b=ge6XYvVzG2zZXmtC9VMpAn1Dovz4x1ITPlMr0cxEzzGpHlV1QpszIUDV1cICtwG4sWMM
	 aOlvzjsFfRwOZC1Y5l2djl333Bn23HMgJF6iLqyZ7mDXHBs7ZqR3+ahsVbw5DRueaOOWe
	 WqKsjjtc3K1M6qdeyU4NDTXHNQxRWkvWgJNhpDok7fOY5TF5TQ4CyU+nBBHZdp8gTNwxl
	 Q+2dw2cMEB2pA5nKGD/xyNqiy8d1B5T0LRLdFxK4eHrKOQBWfN3jidtWnS/v/LNkI45mW
	 c/9Yc/0Ro+mW1AS9v2qh1TZyUibyPZF83oAHIYdcYB2/xKCQeH/SuV/WMJ4O8DRkKOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792425222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WkXGpXOWiBs24ppXgXlnDUbNGC4cGBni/AXZNpiz1hc=;
	b=kkfdgWRb6E4Kfi6447rlX2B1FYLWSK8ckanly78q+/YxoRXuSzIBG+XbcpWYwlOsKee2
	 N3jomg1MeqDi55ZO0A6rCG40TO1SC3b+NMVf52k7iyODaKtm+LVoFhnr3iaNVWCQ75OfL
	 ZdabMrVOOmwxFA7SdNWOPZ0TOT555DZ3MKtyrz6rBFdla20u707syFDAUhpuhfqezHxw3
	 QnlWsA/+3wN0L6bJWjAJoKZ+o48bQibpqjqGx7aaX9q46s+xlh5MYtOqE5+hXj8E1RRyM
	 JVlc/6WTOrWb5P/8X1tpuVXj+fo8YtfXIkf80JdCnwk7f84Y20A/Rp8Cg4gkZXhgtyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rd412vdY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cOrP7WIu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A8B606A335
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 15:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2A8B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rd412vdY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cOrP7WIu
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JFOukm3158931
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 15:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=WkXGpXOWiBs24ppXgXlnDUbNGC4cGBni/AXZNpiz1hc=; b=Rd
	412vdYZ6pr+FIF/LqCVeE65wVB2AaKvNCcSUOW3Ygrv2XQ1O8BxNWia0WShOYeFg
	TH5bNmIi5IQe4w/0dWJoYBxI/cnkulrBv3h/HX+thbMY+N1VEEG5tiZ2FeQF1/Rg
	6WJ8nvgBbbetfszsB9KU8lqRAw7RBWjt1ASWAsJGENN3xSqwLjTa5bb6buJA8Tgk
	EmRY2GXxOsaAUjiQp/dFxxBIzcm/IdIxcPh8K7wnAbQCl9kOIXEeT9GA7ckii7i1
	PFuHmlJi7x1qUOiGInfJQzoy0uRP5ovpfqJEpFor3F3LP8AHWXilAeTSowP0M8FW
	FIlrgi2j/xaJ7bNJUT7Q==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3xa1rp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 15:53:36 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-45e83fd0663so2641612fac.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 08:53:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792425215; cv=none;
        d=google.com; s=arc-20260327;
        b=pZwRsCBMwflw/GjIXQLdNk7i8JLLaLAPKN9vPRUBEDiOs2g7i536xnUiTWa+W6OTz4
         1gowSyj0p+xpa96bPoeDU/9cQfIHonDxC6FBBinspBc2oZ3Kb3KLeRsPA2GJCvu8LWNQ
         M1WqUIanDmltYTjnrfudI/g3IJEJdL6shvzTXJ4wICgrUgGTjHLaeVCcPjKz8HvBc7zB
         DHAVVn8pG/VSTEFF847mpcJn7Ds3OJZcJEgcIulx2dXUSoqjhuxKVR5gYAEMnmBLafej
         zd6XWB9qLI2hBFuw2Xf9m/sqqgo0vZkM6N4D44QSR7PHngLG03EPmuDG5bOIV+XGKVPT
         j/BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=WkXGpXOWiBs24ppXgXlnDUbNGC4cGBni/AXZNpiz1hc=;
        fh=qL9vOQ++o6Ptw2oZK3aWEtwKPbxbVWoxfDqZiS0ALKo=;
        b=WlSS90U5MKyh6nF0AUN7sgYByZA8u8nd1wagQlCC9SkLfkr5fKlC/qvpyKshjjFCDl
         TGm12jGghZajKUAMoyW4CaBcQ/J+oifbqSrDz5S9LlwLpMJEwKBumsg2opPfEOcZjsC+
         JMgwPiml0q8pDV8K3y4gQsu7Qvmc6eWSp+eZ1wvTcRutw9Z1gJsp2rzPtjXwEcUGNoHi
         VoVJfxr92mFsx3PwP6e3cixai5nOtKsgPpKHYm5WfH30gxGnxTziOwNLPEM0D0uNiGI/
         tOuNuGL9z8k8jEJm/yI7/I2mnc3Wm76q8fQf3Wx2D/2Rztodary0YsA45FeCXhr43643
         ZwgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792425215; x=1793030015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WkXGpXOWiBs24ppXgXlnDUbNGC4cGBni/AXZNpiz1hc=;
        b=cOrP7WIuPnYqu1jjsW1sPuxPSccLrPEQlccMvUwcENIlbmoUISqs3PCoOk3YWx6Ba9
         3xGA/eT57Lc8lpjmp/3wf56ZXfMHbdBzmnoYHgD6Rb4LuuRUumFPN+UGstcCw79BYLox
         yFYTP4BdUoYEigJ6TEjGDEwgd+wTjSQVOFT97/YxD+AbwIzD6wU7rJTyOuk3z4PX7irF
         Au9pxhtT7ciM9o3ld/eokDmS6/HCz/NbedybSeJSSyJjPqiYSNxM9iqOSpTCG4XutP7F
         of34yvj4NezuugUQUqwLS2NbrOH1XrKD9XUrbUKJMn+fWuCZDiEvSj3uiTgRWUlW1BE6
         a5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792425215; x=1793030015;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WkXGpXOWiBs24ppXgXlnDUbNGC4cGBni/AXZNpiz1hc=;
        b=XhWp0bC0CL6D5PW3Z5FN0iYWPm3qRMAZJ3QpjhAPIfz/6KQRKNYDeCsinnXIwQo9Tj
         RXTBqlBW7Qq7/H97PS9G1uOH6dTmfprs+X/aJ5DFmHalJRQqO4lNNWxmPc4DDmIDT6S2
         QBCnzuuXF82xbbA5ulf/Y+9/npIb8pX9LY3EwIUfuCZMVS4UVpeF35JNjYTni2QN+bsd
         LdiU+PwvhHhI2gSMn5+3SpBraQo0+SVs4tipLlPYFvVhZcPvhn2KoIIlpbXtXATz3CH2
         F3qi0pB9BfJJL8Bt+NAnwXVotFvJpIcrCHzhenSpZTEpoaz7xpreolPpPnsbNG6q+47L
         MauA==
X-Forwarded-Encrypted: i=1; AKwUvBxNaLI/hp2qgCRKFoGxwplIC7wUFLKQ/YTvdI6ZESvY724m06Sy1kEnnvU3mNRUR8WLEpGMiQ4MVEtsS8La@vger.kernel.org
X-Gm-Message-State: AFq9FYKee40WBl9eYNDIgoe+bjDKO9kEHgayKB29dS8AE/wsXW9AbmZU
	IVK0+diE56SKfMmA5Qjl7VsmhL4J01PRpva2ZOMcOpKoWWqF2mVM6KhHYRXI60//yq1gX/R4OjU
	K77QCJ0tzzYdVMHiriApuFHdh2A4wXSggFHJoIDnCHb1qQYOvG1zGppBzp2pL4T4oki6zLy8rUy
	KkzkT5ztjF4XzbmkSbkqIh6lnVV5Vpc6MX6oEsF1/4fEw=
X-Gm-Gg: AYBFou3pLYyowH3ptB84ANPNT22si/mdTmsrvCvFBKto9IyynUlb4Vik+9YzQ7z5yWM
	wa1fBzz/DLeYgVk/wE2ANWK40/mVLhJ6OToTDFVoOoye1zjXJBqeweMXal1BwiFnKbRCqNCco/D
	aviFGCjNgbNyZKXEZivBvTrw7x8v832XynQMYgi6WHsKU11iUhA2850cpzJg==
X-Received: by 2002:a05:6871:2ea5:b0:492:d8bd:949d with SMTP id 586e51a60fabf-4a7575b6d76mr5836599fac.2.1792425214120;
        Mon, 19 Oct 2026 08:53:34 -0700 (PDT)
X-Received: by 2002:a05:6871:2ea5:b0:492:d8bd:949d with SMTP id
 586e51a60fabf-4a7575b6d76mr5836575fac.2.1792425213472; Mon, 19 Oct 2026
 08:53:33 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <ar_AuRr1eaZzOfw9@baldur> <179096320161.1973.2852858792260211089@gmail.com>
 <c3c4d140-07ec-4402-a18b-389520df188e@leemhuis.info>
In-Reply-To: <c3c4d140-07ec-4402-a18b-389520df188e@leemhuis.info>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 08:53:21 -0700
X-Gm-Features: AclHuK8lwhBc9o-AjMwe7IooeXr_cgpIgGqUVsN4bF6VjxH_2L_fx0Hz7Wqdu8M
Message-ID: <CACSVV00x091i7BKW+bj0RUnkd4rOrHXbhZ4zF6SuTU1NAqsFTA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Oleg Keri <okerixx@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: RZFLMVdFHGPwqqH238jMDHYYOaZpKmFa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA2MyBTYWx0ZWRfX585ebkJnRoxf
 DRs6mT1HxHHBEgJLgN1YnucspWPvvxPDzkpWjC/Ekli2iseLIW0WZylAyxAUVcOY2580dPTAFn7
 G992X+knXEBZar3mk0CF4klG9hjD/Uo=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad63d00 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=lAgNKBcoAAAA:8 a=7w3WoVYdraEV06504AMA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=drE6d5tx1tjNRBs8zHOc:22
X-Proofpoint-GUID: RZFLMVdFHGPwqqH238jMDHYYOaZpKmFa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA2MyBTYWx0ZWRfX6NJrz4dEwNCW
 u2A8u0oIq5fPdAnAOHZIBjUOIgVZ5ed4SfZPI+fKa855rJhQDRYITqQ280BeQjQXWLEpGsHdT9K
 bXmOfI2JviSyrX6k1p0pPyAmpvAtsppoOcaNKDXIxzET1UfNbgVEVIEFi0p8Y9radwQU/+BOQsq
 ZE6FdwLdGMB7sAK8f4JQyXvfM5N/Y04PoamRrHmFuHS2K6E3oKJlrtELnVIAJDfIGHuSi4iZ3/0
 xqUhXpL4XKAmC6A8TEqDe5sqjSs40WTkypCxWKPCySo013PtZlySDqb/O4tfnL5HlqI7KM6ra0M
 hE/H3YGFjtkK1kV6dRDfVy65X1Fb6V+Gm2wKJX9h+MIzNaSGoeT55+dYPDoaWfulZc2xaHYPqD7
 JjReOEejq5Zja4SxaV0Gw5dy20yv36tBa0sjvp0PyyrSiaYVKqtWEpno9JwiEdcmHDk+fO3Ml7k
 QVypGfHTIR3tQzKGsZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190063

On Mon, Oct 19, 2026 at 6:47=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 10/2/26 19:47, Oleg Keri wrote:
> >> This patch landed in next-20261001 and while it works on my Glymur CRD
> >> (COB), on the Asus Zenbook A14 I see the following failure during boot=
:
> >
> > Same on a Lenovo Yoga Slim 7x Gen 11 (Glymur) with next-20261001, GMU
> > firmware v5.2.38:
> >
> > [    1.632277] platform 3d6c000.gmu: [drm:a6xx_hfi_wait_for_msg_interru=
pt] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 11 timed out waiting for=
 response
> > [    1.642345] platform 3d6c000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Tim=
eout waiting for GMU OOB set GPU_SET: 0x4
> > [    1.642360] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu=
] *ERROR* gpu hw init failed: -110
> > [    8.053367] platform 3d6c000.gmu: [drm:a6xx_gmu_resume] *ERROR* GMU =
firmware initialization timed out
> > [    8.053584] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu=
] *ERROR* Couldn't power up the GPU: -110
> >
> > Compositor fails on the first start and works on the second.
> >
> > Reverting this patch fixes it here as well.
> What's the status here? Was this fixed meanwhile? Or is this regression
> how heading towards mainline now that the merge window is open?

AFAIU this is still open.. but seems to be contained to a non-typical
config (modules + fw built-in).  It seems to be caused by trying to
initialize the GPU (and send the CLX tables to the GMU) before
_something_ else is ready.  Tracking down what that _something_ is is
still ongoing.

OTOH not having CLX could lead to problems exceeding hw current
limits, which itself is a problem.  And why I did not revert CLX.

BR,
-R
