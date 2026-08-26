Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EB43BF672
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740685; cv=pass; b=nfxny87kUUrrM23j9RI4rxOToHxJ5Xd9pujD5vDokUrpfPYLt2JIn7F9w4mJHLWEjNyE0Nmh7cnhrYJRYD0+qtQQwZLqL9MVUjIfo2RBTyZfOnWshOPB7v4H/Kxc2am7dU/UOtkO6xMgun4phlgXJotBFDI0tAnGvqW7aMR2VFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740685; c=relaxed/simple;
	bh=e/Lr729rJWGz+ybwYNJEv1Gw8F8Cga9cb4fE+B3gek0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jJiuPKgAu//Kf9YoeBDLelDICsDv/kC60kP1S7e2Ne8tLjaafAFxcDu6vEYLcHCzftaOmzF9QAwZ3OyJCz0Es8zacBQzqx3gqg+3fQMtEerJ0vJgCBv1gHCA3uEDYaUVcpQtPlvOtOmAKLXrOLqpLWr1mEQrtSZdQXsFgfFwp/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XMIxFJEK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UTkDceyZ; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XMIxFJEK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UTkDceyZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAHjqL973691
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Mlmuxjem4aPLL7xfct0+PRJEG19R04ojiMOoV/zU4c=; b=XMIxFJEK32OQPk/z
	l1RXhzcHK9j6Ha9Hj3X4vMewANPLELNstzY4RnhxpU9nJkFenrNSul5bFOcTdWD3
	ACQ1CIo/S0FHpTbYF2ZIbKhKxHDMBnjad4rRjM0ZtOuFpQ0k3a31hcu6u1z+VpcP
	0sJkwdngSscMpLMkbk7QfgOttHNzcjasSxF4QTh8KdCY3K5RMn28loi6E9qM+94V
	DYoCwTLFis+LoNov4b2JbmeOiVJttG62Qhu88mZMqgw45sYqRKlQ6A/8ZYQztf5B
	5DvpNAQW1EhA4vwVHiU9syfNsEIifBxvfC7GMKxXSLnsjp5JUGDO2vMnPEj4cA5Z
	/hUlYg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1ghmr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:38:00 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7fe835353acso11936957b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 03:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787740680; cv=none;
        d=google.com; s=arc-20260327;
        b=HV3m5Kt5tfLTfgNTiYk88XXIU/VF3/PmVydWGQjm9tkqFJzLPTp3Glsc5mWSS6pb0a
         fCodxPeLFWciLaagWboAyI4/d/0U3B9zCr/zmRovkD7d/n9BQJpZU7WH4uBdMx18f7QU
         PHE4ocZ8HRBdro9zNjj7aBvuZIUvfXPSUmc6wcvWG5KGKCowZn+Wjb9RlRyIx3jHC2Q5
         jbNbHVrC1IF025I0NNKYiyUFTRxRRfjp5oO5cuSDCjS6KtMa0Jdq8u4n7gj5QINDp9qY
         jQE3iP3HsaXSzZBM3NpbaMp2ArDGxiPI3k+ClAZimCl00W3f0UAIimROd2GOIsJOC/88
         l1iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Mlmuxjem4aPLL7xfct0+PRJEG19R04ojiMOoV/zU4c=;
        fh=fk1MegoGoCUAtJ5KqlvAZM6fFj8yeYzcb4xQdAq4VVM=;
        b=W+SxWE7QxYuP4uawJCYB88K2Cx5oTeRGXfSlu0auJ9GVOx8wZUmgeiL8PFep8rqwt8
         efSjsaH0x3ZMVkOFt2ZY6I7Ux13JxEsjHMfpZ040Gc8ZRDLpMdsKxNhzGjPUw7xAs+aq
         wFnZZcp0JVLUGmBD3630gOPykGgsowHxGIM4EmOtQuUUyKpBnBd3J9Hv0OXFwmR6WC0G
         ETpi/UBDEtGyryCURgcKjXuo388VLS9nE/XMVNb2BG47zqRpiy4P1rFZj4ICbbaU3lYU
         V6SkUE42+JacNNlN0mcNsl2bJ8Xe9kIpK/zlFvSvxHVr9hkNjoel1/zNp6MBBslW8moC
         OY0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740680; x=1788345480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Mlmuxjem4aPLL7xfct0+PRJEG19R04ojiMOoV/zU4c=;
        b=UTkDceyZqKC7cInfxQmy1WsIMpCQyUoOA4xOZBTwJn8yZJlU9ZvIqqr2xPHHE1m8/0
         OUbgZ9pW4aFsLiVGSzz2K+vmgyGh0xGG/JQHw1nJei2z11ErzJALGVr5DuLS/1qgrOaA
         1HJVOYvRfhsruG3vqvCYLqljy6+1S4aPIRZqisuuk+Ol8rem+ZgK4PWLPmb0TenEa9Nr
         Eq+g0K6uhkk8snlARMz7O/rcQuT5aGE2zYpuuO5zNfINtlEaxqyLSqJq3fb+UYvfP809
         9mH8IZy8efQJek9tWCRYad/2d8cshHh8gOofbcnvloqx08MGDt1vrfXr8UzhuGcIjmgX
         Bnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740680; x=1788345480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Mlmuxjem4aPLL7xfct0+PRJEG19R04ojiMOoV/zU4c=;
        b=FlIsfRpnJDWCOaVWUNXZ/YmXwcPzcK6nlrwgTFlX/7vQvphC9lM+9qXJ6o2/ELeu+k
         7ff5OVNl2nrERiSTWhzhogRTuVrvNT3jyYvT9hAQDFL7NLpQt+Uxkx78lfOB9ESrfqWz
         SDuOwaXsghjJIGGgwhg9kchm8EMJlBUspaQEc3Jilk5UMN9kI/GkCdmAO2vxvrVcYDMM
         GJMClnuwTsgUb8XWrGCYgsUIj+jcR+9yDbzwaz9rNU/hsPKdlhsgIz+1Z5rnS9+4Il4c
         G7DEMaIweACBc9IxsvVclsfoXajO2GZoL82x2bfyqrhNEL0VD6YY1M1bES4jOql/Y8gc
         8Wag==
X-Forwarded-Encrypted: i=1; AHgh+Rr/RPy1L3JtoJ1ebAXrMBG7isFn+el7rz4PtVYhbx7clDdl9zaN5qZX4GWKS10r/8tkA3YMoico1zjKEAuC@vger.kernel.org
X-Gm-Message-State: AFuF++mMHT0B/yiv/o5HO/+P2HyRyt8kJ6YEh8nLcSPsKHS8wtOjESfZ
	LXOpO6VGi2qOxKMCECCZz7zuQrRgdnpjoP1VD3GkQAgdJUgD2TWMyJkEZndZ/GGHA05nXHKn9Gs
	XBTCA2UOGf+bF4i9GOPygyjclVFGxY1ukzrE+eABX4Sp97fBzLrEIJJfWIKyzuKwaxhivgzy0eJ
	wBh4eWoU6uadiNlmKtbNO3QaILnMGhYuhTY1Hi6rUhjOtRgH5AKyU=
X-Gm-Gg: AR+sD11jkTTtk+BlXczrj5OC1tWsHwuNw75EOeXqaPQxlBUp+LQdEtewrG0LRLUVivS
	YWAj0khoD50IatcnyXfXLXlttiMf+4sejmrtDeE5nDxwLUYCZQkqqnXuVp/dVKBv4r/IMcBrJpb
	qTTlXe0rhU79LTvPbgRE3j2J/ZeESopR36kJKqgMF8baIQo7L3sepQfMs4SQ==
X-Received: by 2002:a05:690c:1a:b0:845:1064:5c03 with SMTP id 00721157ae682-8573fadc903mr27120717b3.23.1787740680143;
        Wed, 26 Aug 2026 03:38:00 -0700 (PDT)
X-Received: by 2002:a05:690c:1a:b0:845:1064:5c03 with SMTP id
 00721157ae682-8573fadc903mr27120457b3.23.1787740679756; Wed, 26 Aug 2026
 03:37:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-9-harendra.gautam@oss.qualcomm.com>
 <9c1dddb8-5f1b-4b7c-b810-64cbd6f7ccac@oss.qualcomm.com> <CAC-tS8Bwgqd8_dZcG50bbFCcVPX+=KMVzx=3Q_zh9dAzQiqSbw@mail.gmail.com>
 <d03353cd-90c2-4042-b7e5-2cab5bfd484a@oss.qualcomm.com>
In-Reply-To: <d03353cd-90c2-4042-b7e5-2cab5bfd484a@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 16:07:48 +0530
X-Gm-Features: AcwNN1XBYCuPhgbUzFIDpZZP4PB_1GNeNQnN5gU4WnrdKYte1HfRJE3iB1kMShw
Message-ID: <CAC-tS8CSyrxdLJ773WA2uvXry3=Gwiks1TFG4z8N7rs2d3EHKQ@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] ASoC: qcom: Add Shikra QAIF support
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 3WAe0cinLQN9-pCVyiBm-poM09N4Omd2
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8ec208 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=ykc42Gtf8Ew0kkRZKZcA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4OCBTYWx0ZWRfX3+AIeTrdaS5I
 6HNehE9Tl+5bWh4HvHlprDD1AmHv8JNQ4mKoGTVQBlRxPjeZSktybDJvsjb+s5IBXTXHewrn8bS
 rVc9YAckp4HTMn6v/nwdKKrADoiL/gQ=
X-Proofpoint-ORIG-GUID: 3WAe0cinLQN9-pCVyiBm-poM09N4Omd2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4OCBTYWx0ZWRfX1hOEtQUBia7z
 2bsFv1jpi5iIBJG23ni55qCV2lBZ1OaxzXe5AEqj/hTAVY+5Jd3WFKX4gPwIuc9r4KzxlTPKYOS
 dBvtsBtQDITA/xiAH8qqNBH8HZEGxoAqN9soXT9Lci7wDYyhFxXONYoK+m0k8+1mWR4DhfgvIry
 Cz2PlZ2TmWUm8nh7znyaq6ctpOEDAQJBAQ5wpvGqwIWzAb+btC9WEZnTSTEoVmERe94DFd2NIky
 ZVAeLDxsIPWnZry8EN7FNd6lPcehVY8aiGfK1G94P0zvnRhy1i5fVJTMUF/QnPanjrub0X2Ag6L
 T7/3UezyTugzWGLPsnjG8/mqnJTsHwDPgrfwDke078we1ZijgyroNQd7lWxAm6WJbr79x4qPupd
 YkC55QC2nWo4vyV01V2tRVE+V42qtQmmV09XOol1iwDwAD8u6q/m2u13J503S7U9vPGsv/ReTzf
 eYqU9I/7I+Hd9lMGD+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260088

On Wed, Aug 26, 2026 at 3:43=E2=80=AFPM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
> On 8/26/26 9:58 AM, Harendra Gautam wrote:
> >>> +             .id =3D QAIF_CDC_DMA_RX0,
> >>> +             .name =3D "CDC DMA RX0",
> >>> +             .playback =3D {
> >>> +                     .stream_name =3D "WCD Playback0",
> >>> +                     .formats =3D SNDRV_PCM_FMTBIT_S16,
> >>> +                     .rates =3D SNDRV_PCM_RATE_48000,
> >>> +                     .rate_min       =3D 48000,
> >>> +                     .rate_max       =3D 48000,
> >>> +                     .channels_min   =3D 1,
> >>> +                     .channels_max   =3D 2,
> >>> +             },
> >>> +             .ops    =3D &asoc_qcom_qaif_cif_dai_ops,
> >>> +     }, {
> >>> +             .id =3D QAIF_CDC_DMA_RX1,
> >>> +             .name =3D "CDC DMA RX1",
> >>> +             .playback =3D {
> >>> +                     .stream_name =3D "WCD Playback1",
> >> No dai for WCD capture (or) it's missing in this patch.
> >>
> >>
> >> Best Regards,
> >> Rafi.
> >>
> > On Shikra, capture is always through the VA Macro, irrespective of
> > whether the source is WCD AMIC or MSM DMIC and the stream_name is only
> > a descriptive identifier.
>
> WCD naming is totally incorrect w.r.t this driver, WCD is external
> codec, which can be connected to any dai. QAIF just exposes FE dais It
> should not have any codec level information either as names or any other.
> Pl remove and use the correct naming which reflect the dai name w.r.t to
> QAIF.
>
> --srini
Thanks for the suggestion. Will have consistent and correct naming in
the next version.
-Harendra
>
> > -Harendra
>
