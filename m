Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793001611;
	b=zwyOz8d46XCZa7/XKKFfPWU+6m2Kzb/UZk602VeBG9NAqfb8g/B3zUgf2zrPU0H5y4RR
	 wK9NLJyEFua2Xx9YyrD+1QeZRgxbgkcoOsw+2Pfrx5lW56q8jsjq4bmfGn1uejW8YxsW2
	 E6MdHWj3Doo2ToNiGOu7hgfE4TKXN40BxlUp26gm60lAzWBSsNRaIZcsOtjLjH+XSKq2Z
	 MOS7syyBa/Nt3LxaCWjleuUgTDpXkJGqqN5WqW3mayhppTNQIsPCE5qVGQxWYUL/LtWQF
	 OECXOX6ibgxTPEX9K3Pj9bAIKmTZ0519pH3I4UORR5Cc6wb06mPev1KDLtD66qZwgbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001611;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=au0nJJfTAenaS/cmlQ5XpkmAU0bmNiL8uh1/Qn6Cv6A=;
	b=kZQAU/udmfULEMoTVjhAb70mraGVCl9auFtWbLQ/XrXJMAREVPmxW2tH/tyPUJBCLIGC
	 ve5MbUWv57ZkEud6xhII4XhnfUMDoz5/dHOsAFm9SjHWf703yYWhL7xSLapzcarRZW8C4
	 S4uDFI8s+632EWI0LnJEu/CO/30Y88RYf02qTOaGcoD7Emez68j9T1biXjAAY5/Z3j1EW
	 XE1nAmTB0ea4D9oIwM9ualgviCRpzOPCmJ4+SGpKAnMZug0SRicQ/Fiu9SNQhAHYW6Q3U
	 dp09f/GmjTXC+WgzGr4D1+tYhNIistBDpqM/0/7AARnhjoyFunKyRRlogekbNgb06Og==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FZNNPCyc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUgYoZLj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31732606A320
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31732606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FZNNPCyc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUgYoZLj
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b7BY1907871
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	au0nJJfTAenaS/cmlQ5XpkmAU0bmNiL8uh1/Qn6Cv6A=; b=FZNNPCyc84uvbmU2
	vLsuCZW7hbFubv78YAxU64lJocnrpHdoL9Uwlk3a5sKT+x2V0MpzVOlBQlz1wV8m
	AmyXiOR2d21OeNNBzEHBFcNQuoBn3mYmDbEZ3AOSXcn5H3M8l7ToB1fax0nKrg/l
	8PyyJUYNXqoOGUcqSNuEse0Af3VTl0moMF+I0LyCczV1KwhnsdrGXcuYEmAMCCNS
	IKe7Iw+AzMDdHKE45s+g5FVoKDCUQtNOq7dQXxVdZQ1IxMg/x9852a+L2bmEQWNg
	S/QCAURezUc8uz3Xc5s0x5qXQ+5CFkxwqEpipt3YJLUWpP6avPzy3cfDYlEuiL40
	Ye0FVw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gnert-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:00:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab926c236aso2540364a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 01:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793001609; cv=none;
        d=google.com; s=arc-20260327;
        b=MYtKtOnK8GTXLlEy7fQhsoY+QssxGjrjgkQG2NgPVcpEggLNnmhukCc+UICvTi08do
         gFURSKjGuMxpwuL6la1nY50n4kXZXBQ+guD69JY4LTzXOPJo142dWpZ7g39wT6VB1sPT
         9zZm7j0K+o4r74bCOx9o6Fh58A1vm6RDWV2zRpsKtz+14+rtHIHXIxHrgozHVQEMDQMm
         zSlVb11r5CCvHNba4rLhE9MzmV3QhE3vgL7P/1r/1/lvvkTKTkfVPP1D0dCl7PZ5oQmr
         TBDxR0aSF/J90fbVL+3RZnz18NXQxEESr2ZC2++JowpEGBoA4M1x8glI/KSLLjRfMLq/
         I7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=au0nJJfTAenaS/cmlQ5XpkmAU0bmNiL8uh1/Qn6Cv6A=;
        fh=iuLFvIwJzdo2fzJyJrGfNZykAwxOvQ5TiBpURzXEK7A=;
        b=WIjkJffGuWFufC0N/0Tg/1o8gYAbwKh6drr/fmmZWIlpAsm8tdBND6ZTeh/A3mo87i
         VxkyoZ8EjlXdjw4Nm/DKZBgNPMmlM4ThvDfHXKMBx3yZIPA9KqYVGpYQWywZTiayDUz+
         xV4NJhrtMl8nsRPmXy/PhH2zCvYQmpZ/2eLuqmPIqTQhQIATdUTrVIfaZTgQlCovwljs
         t5COfRVk/UugmQMmwr6F9YWhKqSOry9IgmAFGdwegFDrKP7qRtjPvNPvKCXTysYHsDn5
         iKtwevEo/bBFjLI08NLgtOtvMrBPXarXMiF4fByVVzBSgvIoA+9onEiMJe67+5Kq3Zvu
         2y4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793001609; x=1793606409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=au0nJJfTAenaS/cmlQ5XpkmAU0bmNiL8uh1/Qn6Cv6A=;
        b=VUgYoZLj2Ul3mH9AcX6oFoU764ymNdteIlZhSQ5OZP8YdLtxN5AzMI7hT3xvDZ7UVq
         K4DGYKT+dMR15vrtDJ5Q+euaWHV9wChoPhWJqgV3WDkjEqSURiYyrWy/ogu5GGgj2mKq
         h+V9oQm22fUZWc2jdugm2IurYsI7pa9WGZpxdsYIO6alpvK7s40ysH4rcvD9SJ1sPLZc
         LltzTdb1uWUUZErSxdmXsP591D0IpHxvqTirlwMVWTMXtLl4TJplD/oYvyX1rt6S6jSS
         JPush5E6rY2TPM2+iQ3sMxmmR83YWSgGlLq9XlSbhIrDnGOJzB52qSunL8f3u/vqOHdZ
         9q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793001609; x=1793606409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=au0nJJfTAenaS/cmlQ5XpkmAU0bmNiL8uh1/Qn6Cv6A=;
        b=tCakpiI5ZmGvwze5OO3kiDL2EbhQDimZzM0Ss8VHhQnE4KXXfAfLc2h0ieWY+8uCjW
         G4GalCSxuQ/RIH6w66k8mHPFdYaNpSkNjT2wBSyb1PKXjC5dq4+WSi5MIuUAnYIUIQOy
         C+3KeWm5JX3AZxbTUKKUVbYGtYWAXOqHmreisl6RX4MUsnmLXUk9rq92CYzDh+h1WQBU
         6/v6RTbaPvPwXymuAQzRxtQj2vtzP2M1rnhGbHQh+MP4vjRcyTgwjmLTkNnY1fbHhevP
         H/fS2AZnwaii9AUQqyI98iW43BPoRKBqb4bBInxJw5N6n9KqGQb/495Sq6f7Lamq8F/h
         PTBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwEqJnad6gvs+J3om6oEYELwfIIspHT+X7MsWqcRpoE8lnHwAOcbLGHvxF/1WDIW7kbW8GSG+CJDJAPz0y@vger.kernel.org
X-Gm-Message-State: AFq9FYK+E0X405YielKvbHGkmQapqoycYzBTct7olWRvW3zsBVsUtYad
	LHGX+jWZUFTOudf/YGYt3wm+Z0rjEGx+Bzoiq8A1yv6FkUv3DX0VVAubOIEQZT3lxRewAi8OeGZ
	q0XdKuVAp/meM+cDnk1Ibicv/OiUjw1EbdFyzGHSs3H2UTMQ/WEPYoJDbVBdUqZGfSPCiVmGeQ4
	QweMwFqDMBqQSGSWm9L2LWjqFtKv3CAwwd+vx4GOLU9zA=
X-Gm-Gg: AYBFou2OovyBHI3CAODGDUAcimeHbl3Z/H63/7iujKcyUOxnlSZJdP1iGGKSMJyfYf9
	1YE/twJ122SbEO68FEbAE/bF0XXi2nOYMxjmf78F9CZhvo2dtcJ06gRov5VGDHuLgS7+MQm0ROE
	A1Jeas3M1dwmZpWwdLt8TO73ghacm46Hn+IghRoOxHHuCjgurVsJJHzTmkWA==
X-Received: by 2002:a17:90b:3dcb:b0:3a8:9db2:a4f with SMTP id 98e67ed59e1d1-3adeaff8065mr5626670a91.51.1793001608594;
        Mon, 26 Oct 2026 01:00:08 -0700 (PDT)
X-Received: by 2002:a17:90b:3dcb:b0:3a8:9db2:a4f with SMTP id
 98e67ed59e1d1-3adeaff8065mr5626619a91.51.1793001607894; Mon, 26 Oct 2026
 01:00:07 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021102549.411456-1-zhangfei.gao@oss.qualcomm.com> <cfad7934-2311-4f90-84f6-1f4f0fe585ac@oss.qualcomm.com>
In-Reply-To: <cfad7934-2311-4f90-84f6-1f4f0fe585ac@oss.qualcomm.com>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:59:56 +0800
X-Gm-Features: AclHuK93uyU_SxCgBpB4-_dBDgLh4eV2_m8sdQ9jjZ4Hh87n-yd-DVVLCW3wDMQ
Message-ID: <CAFkd8hs4K+P=6oOjUc83hVKx-AWNn+kGbB3pWuXOTwgES+yRnQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: qcom: audioreach: support multichannel PCM formats
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: laa_GPdtkamkmGi0c87nzqkvItmTlZI7
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6adf088a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=ftKU7t2rRAnlxZ0-E5sA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: laa_GPdtkamkmGi0c87nzqkvItmTlZI7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzMSBTYWx0ZWRfX/sG6vF2qroF1
 ZtPl5Rie6rt/SiB13ZUMUsfehDEOt47Fn5WU7DA85PBoD+fEtwx79sAnJWdKH2FmwjoknyJyq/7
 ZTTessGsOnr/T2oxbmYgCo6MtdcEZ1z43OFROTpJJ6Y7+PZjp0XokLOEZX1PR7rNyc60eBE3mkD
 tS476WMBtZE9PK7MmJJQ9ZfZX91XjcWRk2OATl0Yi313beeKSbLTLpbKIt566DCGnnahr8U8D6N
 s1aT0jTwv6R/HcQ9FchZoL3tBUxkOzJTKoOiQCk/3VP9R48Dx/zRfaOiE+9TIHEd9iwic9bqHLh
 g61vsK/a8+2nu1g825dIUNoNCY2JOnqnjzJgvtzTpLgZ05bYtU9Sk741pjxzIvMw/KLxoIyrnxG
 UFcZpRMTXzV5qf9+Iua0OHnhtAbHA+nO8f2CxAhFUEg+qLt4znHKoDDbonClQ9MkoG4ATQAECyE
 FAAgWCNkayP4T/DEDwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzMSBTYWx0ZWRfXyaOO5Y0xGB05
 HvGDSnqYT7xylWHVMpyQhkZs4m6vGC/piEjDzRVwEweU9XsL5yyU8Ay5EdFxdzNAF/NuoUoLvpu
 GpmIA8bQCh4HANcJQv9MkfTIsvNPar8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260031

On Mon, Oct 26, 2026 at 2:19=E2=80=AFPM Prasad Kumpatla
<prasad.kumpatla@oss.qualcomm.com> wrote:
>
> >   void audioreach_set_default_channel_mapping(u8 *ch_map, int num_chann=
els)
> >   {
> > -     if (num_channels =3D=3D 1) {
> > -             ch_map[0] =3D  PCM_CHANNEL_FL;
> > -     } else if (num_channels =3D=3D 2) {
> > -             ch_map[0] =3D  PCM_CHANNEL_FL;
> > -             ch_map[1] =3D  PCM_CHANNEL_FR;
> > -     } else if (num_channels =3D=3D 4) {
> > -             ch_map[0] =3D  PCM_CHANNEL_FL;
> > -             ch_map[1] =3D  PCM_CHANNEL_FR;
> > -             ch_map[2] =3D  PCM_CHANNEL_LS;
> > -             ch_map[3] =3D  PCM_CHANNEL_RS;
> > +     memset(ch_map, 0, AR_PCM_MAX_NUM_CHANNEL);
> > +
> > +     switch (num_channels) {
> > +     case 1:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             break;
> > +     case 2:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             ch_map[1] =3D PCM_CHANNEL_FR;
> > +             break;
> > +     case 3:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             ch_map[1] =3D PCM_CHANNEL_FR;
> > +             ch_map[2] =3D PCM_CHANNEL_FC;
> > +             break;
> > +     case 4:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             ch_map[1] =3D PCM_CHANNEL_FR;
> > +             ch_map[2] =3D PCM_CHANNEL_LS;
> > +             ch_map[3] =3D PCM_CHANNEL_RS;
> > +             break;
> > +     case 5:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             ch_map[1] =3D PCM_CHANNEL_FR;
> > +             ch_map[2] =3D PCM_CHANNEL_FC;
> > +             ch_map[3] =3D PCM_CHANNEL_LS;
> > +             ch_map[4] =3D PCM_CHANNEL_RS;
> > +             break;
> > +     case 6:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             ch_map[1] =3D PCM_CHANNEL_FR;
> > +             ch_map[2] =3D PCM_CHANNEL_LFE;
> > +             ch_map[3] =3D PCM_CHANNEL_FC;
> > +             ch_map[4] =3D PCM_CHANNEL_LS;
> > +             ch_map[5] =3D PCM_CHANNEL_RS;
> > +             break;
> > +     case 7:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             ch_map[1] =3D PCM_CHANNEL_FR;
> > +             ch_map[2] =3D PCM_CHANNEL_LFE;
> > +             ch_map[3] =3D PCM_CHANNEL_FC;
> > +             ch_map[4] =3D PCM_CHANNEL_LS;
> > +             ch_map[5] =3D PCM_CHANNEL_RS;
> > +             ch_map[6] =3D PCM_CHANNEL_CS;
> > +             break;
> > +     case 8:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             ch_map[1] =3D PCM_CHANNEL_FR;
> > +             ch_map[2] =3D PCM_CHANNEL_LFE;
> > +             ch_map[3] =3D PCM_CHANNEL_FC;
> > +             ch_map[4] =3D PCM_CHANNEL_LS;
> > +             ch_map[5] =3D PCM_CHANNEL_RS;
> > +             ch_map[6] =3D PCM_CHANNEL_LB;
> > +             ch_map[7] =3D PCM_CHANNEL_RB;
> > +             break;
> >       }
> >   }
> >   EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);
>
> audioreach_set_default_channel_mapping() silently leaves an all-zero chan=
nel map for unsupported channel counts.
> Since this helper is exported and callers such as q6apm_dai_prepare/q6dma=
_hw_params/q6hdmi_hw_params() don't validate the range.
>
> would it make sense to return -EINVAL for unsupported values and have cal=
lers propagate the error?

Thanks Prasad,

Then we can directly reuse q6dsp_map_channels to make it simpler.
Will update.

Thanks
