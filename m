Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795377075;
	b=u1XO3rwym7Rq5pNYReAuAlpTXpA9tpIp6rwndIqgX2Ju7w+rEJRW+hYOvOjJs8nMRBTq
	 pawpJ2CtDE8j6nbm4TgDJPqgY8cI7jH/A3RTAg3WvAi9889SNhpCixis8fzlnlsMDUx8a
	 rljnEJEyrArWq3oraHtPHKIOqO2uZF2owOBS6PF0D7FC3UgcF/xz1/cc71BPA8IJPdd6l
	 YZvjYvfiKpa3Ih+9jlwD6ooNm2wMmJjrEx0BFdlfyxbHxt+WV3PU5uyIARCp2Ka3uAzi/
	 1lXA1p6ElbxM9kbw4pCw4dGeYUJl31hiLhr+Y66ugf+SGqlPM2uFw9BhWEUdFLRp1IQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795377075;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FfR2KZfb5vYyl5GgD/dMaDXtb5WXvXYxyg2TKNOauL0=;
	b=TY7E3t/iUC84q5wkvXUavMsg9KF4+uhZBDvqJixoUu+5EciLvOAblHjRmWBGxz+wjKxy
	 tPlDUE+GHoFb/0RJ0ej2EeLdYY/485BkSZdJoFQI37TUSrd1QVr/kypmCW0FvO5OKJiEv
	 Hq418t50XfBFfhPK4jP3OWvBYVoDFy0zsg/02HAtmzKPXB08y9q6XB776pWvRJhTiVw4p
	 SmiWmzS1PWtZOBVNhavPOwoRavGo7OJt1Gq2kqBp7yMIp+uT1qSHL06Ydk8TGfLYggJue
	 P4h0VOqyU7z2eHbZeapDd6E+87GlIxxilFq2+9lPHhLYae7ndEHCB33BV7r1MSY0Rdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Srm0FQ+0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G9aPCLiK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC59606A31E
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 19:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BC59606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Srm0FQ+0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G9aPCLiK
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGUuGx3985632
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 19:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FfR2KZfb5vYyl5GgD/dMaDXtb5WXvXYxyg2TKNOauL0=; b=Srm0FQ+0E+Nhaa0M
	JAoh3zURFwR3lGKK+ATSxpFXd7JTLC5faR//DYv1SpaUKl9r6qVGJLBC1me9N83j
	6gOEsgrV65uqaJ5khG4bkmc0fSngDi6J4wHreLdz5siSwKelDV/OcANBLQTA/m4/
	xZ3pJvF8isNJ/cLum2MkgRe+ktK2YhgMMrGHhqjQdp/3N1PIl1LXhOwH3PwbmpSj
	iys6aZnW2Pum57lMjEj8o+d4reUPZzAhSCh0ZurXTgBZMGdKRAt5n7lhuswWUPyR
	ebczyzbA/rqPugipC85qYx/THcSgDs5EKEvWnRnV26jrQKuJ73C8bh+0ystltrM4
	nukBfA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu44ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 19:51:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92104826f9bso56024026d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 11:51:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795377073; cv=none;
        d=google.com; s=arc-20260327;
        b=agRWRgW8P8IgTXnkUdIIJevCFT0S0L5E3lNyNyfDvEPrF0it65RAhB8Iob59pUzTDt
         eEE/xnC8TOh634DXuvNRJ+C0EWbHs5sFCUcMn5x0f2B/Jb75IDrSyMwnFWuR2YxHIYFA
         K9VaWcup5GemvaBuCjtQRQeMvCxj8obALdqX9wViwySrMQGfinYhhcUsqViM24MVZRYF
         kVaLcDjDM0oHxRcdP67FRA0R4re5yG1p+dfHSvl9P6JOU6HcGxz9u8eadP8EyMWbD6+L
         yeF9jKgKS1cOdfEgBPaonLz65KUGWsCdZt1plTAfbmMhIBcgbWvHp9oXwUVjZsqGFz5g
         2fVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FfR2KZfb5vYyl5GgD/dMaDXtb5WXvXYxyg2TKNOauL0=;
        fh=Pi7/PoZe+UCH2AFQXAQGRLGSUSO0Ja5tRtic51Za1Lk=;
        b=sEW4IeqzetWMvb8ceSYUvEZqSxFJu8wVjbS0e2kD219EvJLdXa/+wAskl+mvPJhjQ+
         H3k6gcNZDCxRWm7zfuWQlx5zZLJUQGgKkdkvhvWKDchyFrLvkxC17Ydns32sVYGpA6CV
         LutHejRom/UnGlc+g1W1VAjdE8iqWAel+gjU34VsHpySpVwdGR5rXPErClSj8vH72t/A
         L8OP52SO0z6TwDY7a/LMSOG/3Z/dA2Fkf7xuSMkicjoHJnhWW5BHSyvSOhzDDtblr0N4
         5Tovu4O3yZC6SQQVMOR58QboljaJXo1DRtQ65HOguAbTF/asRZitTUL8o834N9BvL1js
         lxAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795377073; x=1795981873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FfR2KZfb5vYyl5GgD/dMaDXtb5WXvXYxyg2TKNOauL0=;
        b=G9aPCLiK4n62QzbLjsEnsHi0Rv21CYYW1EGHbkKzAORwY33aWS3jEq4YCMKTgWrmJg
         w2mWgKF1LZ1Fi/zMLuHEevtYdo5gX60ZOKa+j0PjYQMcrAN6r57cKF54NNphcNEAPrv8
         1MeQHMbNws1hyvJh6Ay/IwCFIlR4Wno1/UW2nKELy5TiTtIGKTn+QJsu3HGOvfc+oosl
         b/fYu0OU8Uty2/wIJhFvKdd+bmPA9Fu4TeP97t+1UJqqelBkc2KoKwJeBoYE9mi9Id7O
         wSvRLSaPtpCbUD+7VdM7LA1PrNz2xg7HM80oWKIku/6B/DdFw9M8BP2J+l7M8SiRGOfc
         q4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795377073; x=1795981873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FfR2KZfb5vYyl5GgD/dMaDXtb5WXvXYxyg2TKNOauL0=;
        b=hd9DTdvdCwOm5ZtjonuKA8pRijUTh44SF8GWGePbYUJByXjMA2Q81Eo3aZbHIMattN
         Rd779yQ84xPjnXurblVmBSlLg6f7GazD4/oo79uzBpO4WrGZcY//r6RxTYEYO81EpnA8
         ftzJVP0ZyNTQLGSnDJApZ0LB/UcURejTIM+hHfEiugZ99Y1y7OXic7n0ZKMToCORjfqr
         3bz0uXBJlQikXpy5BH3N6RyABJMhLVOj88NMgv7QYD56aIS0CK4tBvYlJT5hUe7k1oS+
         LQJ5f12U3oJ2FcNu6RW8uW7O3b7nVGiVP515vFok+Bnx8HH+B1ISbV3POLCbrvTyIJF1
         E3Pg==
X-Forwarded-Encrypted: i=1; AL+hErETjc1yRV18p8koU/4PHno5pREhlv/wp9vqCwPbrJ+7TXCl0Jmta8mB+lfAnI4f9M8M9TAfRcLEYXJDxudW@vger.kernel.org
X-Gm-Message-State: APuU4Z9nadpIRZ4bvrCWBRxY62a+OgiY6W4di7ZYCPjJu4fN0KcuqvSy
	Yf+tM0bMVdSFzypIM1K7lzazjJTlrbBdNyZ8CaF9yKFxwdqLJtpskl0TxYpdaJdpElCYw33LVof
	+Z1kLq4XV2GUlQIDQVLUBrMdM32InvLCKxzmpIitl2f8efHVFIjfVsiXYmHXdhLTce1sIVEA0Wh
	0hEU/Qe7unAEEGO57i3VjUO7ZpcUv9sHNQ7WV5FPoa4S4=
X-Gm-Gg: AZFdTZf9uICvyx0c9gXMYeB2HicL72N6reULy2PXC0EknrOT+JxUJnQyqgurVBett6N
	/ZMY91/KxifGFAhpBCW/ek5RtYDCvudW2cceWIGVdRqKn/bdjz8Ut4YwcX6MsXqzq44m6m516F2
	dhlM0r6mTT3i4BAioXv5QplyZue8e8YxRrex4NVpX6kXiiVIPC62bdvg3XOBx91PjI2+JTqxJx5
	3IVtnTrdJdWnUN2iyLswtIZr+K+MffoLWRsx4yIL+gONVwIDLyu+GRfWn3t2bP4wSiYMBJ35PR6
X-Received: by 2002:a05:620a:45a2:b0:949:721a:184e with SMTP id af79cd13be357-949ba9cd23bmr1618396585a.36.1795377072748;
        Sun, 22 Nov 2026 11:51:12 -0800 (PST)
X-Received: by 2002:a05:620a:45a2:b0:949:721a:184e with SMTP id
 af79cd13be357-949ba9cd23bmr1618394985a.36.1795377072330; Sun, 22 Nov 2026
 11:51:12 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org> <20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 20:51:01 +0100
X-Gm-Features: Aa3M54q8DVvj5BuTbWloIlkkU2isU41K7yHCwAzHNhHp_C9LxH-6l0mb3H_XQ2Y
Message-ID: <CAFEp6-03ywJ2tow23woY4FkW2Np8r_Lja37zDH1dh3z4skYFZA@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: qcom: camss: x1e80100: Fix CSID2 routing to nowhere
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: tisxoEEOIhp3iEgas9TvNCsqY0VcZCRs
X-Proofpoint-ORIG-GUID: tisxoEEOIhp3iEgas9TvNCsqY0VcZCRs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OSBTYWx0ZWRfX88R5/X0ouIL4
 FNtA7dEoQcxgGrmX8AWFfTN6X2MdYFnLy88FeR4VvH9uu1sLuCgtv3sLK2OfgXMtRxAYyTThYTX
 yxZ/ZbJWHVC7i+S3BWmEyrmqrDJirV3c9HuSMp6ziWxdtXhcjFgNHJKITo2cu8ETOrBDypFL1RQ
 4PBBFjdbVivMdNG3vBUOV4lD9fd/Bn20mODz11g0UE6qypcNVJHrjXkYxZImLZuhSkIIvPN+Gps
 Up73/xrWY2Hs3zISUz/E36/Cp8R2o5zUav23CK5dnCtxtBzrKMFDTfRIN5lT9yQQBNp6KeHk97B
 PPJL8nfqCB/nQMwUUmIQSBeYG+f90DTCogtNDH3cckbCC65fh2c05XpmhynjI10lvaEdM2Qi0ga
 HYpzwpPDQJ/CABJ1AL2K7czkIuVdo9Zy0vRHtTL9C+2FeNKw9+pkxYSbK6i9wUt3DJcsueTQ9v6
 ZxL6DuSgxscrA45JHDA==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b0347b1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=uV7-nGl-jdedDGloHnwA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OSBTYWx0ZWRfX10vRlqjdjQsT
 xWKDJ4fX9vCp4IndnvvKPpBvLSdykMDwKVdEHE5Svjq+Di581ltN4tKuDJHg/djUHjNVeJLZHcy
 X6qXfvXGmHz8HQVg+gHf3DuotKU9kfw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220079

On Sun, Nov 22, 2026 at 3:10=E2=80=AFAM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> CSID2 doesn't actually have a corresponding VFE it can receive CSIPHY inp=
ut
> and raise an interrupt but it can't drive any VFE write-master. This is
> basically useless and not worth coding around in the upstream driver. If =
we
> find a real use for this we can turn this back on. In the meantime drop t=
he
> definition, it only confuses things.
>
> Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 21 ---------------------
>  1 file changed, 21 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 26e3f2aa3ef24..aa6d01d8fcb2a 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4515,27 +4515,6 @@ static const struct camss_subdev_resources csid_re=
s_x1e80100[] =3D {
>                         .formats =3D &csid_formats_gen2
>                 },
>         },
> -       /* CSID2 */
> -       {
> -               .regulators =3D {},
> -               .clock =3D { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
> -                          "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
> -               .clock_rate =3D { { 0 },
> -                               { 0 },
> -                               { 64000000, 80000000 },
> -                               { 80000000,  100000000, 200000000,
> -                                 300000000, 400000000 },
> -                               { 300000000, 400000000, 480000000 },
> -                               { 300000000, 400000000, 480000000 }, },
> -               .reg =3D { "csid2" },
> -               .interrupt =3D { "csid2" },
> -               .csid =3D {
> -                       .frame_sync_en =3D true,
> -                       .hw_ops =3D &csid_ops_680,
> -                       .parent_dev_ops =3D &vfe_parent_dev_ops,
> -                       .formats =3D &csid_formats_gen2
> -               },
> -       },
>         /* CSID_LITE0 */
>         {
>                 .regulators =3D {},
>
> --
> 2.56.0
>
