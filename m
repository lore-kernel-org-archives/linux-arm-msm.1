Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00233F86E0
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 10:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787566270; cv=pass; b=Z2l7cylrZiPiE0IMhv0WyBNFtuRWZJLqHbQ6Rh5wgNX1dn/Ufl1MHu8oQ3IZ7FC6kMA/pxcsGoxgOJ0txBUVSzJK8rw1P/JGARl7Jrrtv1uoURT86P9oP6xVFnfnblcvB8fh27Amw/E502T45sd60xuJV/c4FpD8HN6QI5WhyMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787566270; c=relaxed/simple;
	bh=o01YkiL2PGmOZI/FMH3AD2Qj/EckP+dFtIF5ig+V9Mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTE0SkzFGSK8omgVWgC0kM091dtGxB3BMwkATiFA34kAJzntfPm7RCg3JISq/klXlyFLcUNKg9X8EobECvUvK+C6HV3by5aWG/q3Y8TAkGD+xS3nkbk85oIXlASfbsklVBIy2DuyYnyUDuMMZ9e7MURT5mPY6OoTrRhdJC9J5OU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hrnQ8ioh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RbG20eSK; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hrnQ8ioh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RbG20eSK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O992fl1377917
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 10:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xFdPUis+b0SAqO9e1+lFVcsXPknHkq+UuXFEMP6x2vY=; b=hrnQ8iohcG6Rjk1s
	QqP/iPbBW1WPpiy6kAdH8IJ2EyXnqCUdL8XLYFHTI01BwCQPMqZ1s5CNcfPm24uO
	zv5gtNMDHKKDs7b+pNpQEfC7WAaeDn1ftcn9znPvLwQADvtGOuKyTfxzAoTR7svv
	bHRAixOHElB2RMZRxck1dHapFCnw6IyBlsIKbl0J7JtoL4WL9APJPY4TxyWZ+57v
	eqw0wVnYqEvMLLrQ/iQA4CU5wbRlAbZ15BE1CJMIhyir6GuPj3WuNsxUt2jAmX1r
	6DJlhyaD9A8Uq9Qfb80HdwSO4mSTWosEI6F6H/PKnFPqncgnBEEJuyyBv0n3uj/g
	qFA6AQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf0pmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 10:11:07 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836caf085e0so137819767b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 03:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787566267; cv=none;
        d=google.com; s=arc-20260327;
        b=q5RUWi4NOE3dHMhPCfUqdEnaoEl4CmrWS75QZ7zR2AyA8pAi+NQYKSmK7fZeBVFaTr
         ppD6Arbi2k2DxFL74lb9/BUSghjwo1DfNeZqWiskI+UiqV231qttpLncGg8tIAaZAjLG
         M7Zjmp/RgG0iahYF2BaZARZd7lhn7rtip5MygYdGZiA4foMNsgHaq/FGCp2BcTSu3fw9
         HvXZz5IfkOE55OTZ8hwxXdowoXfs8OJdC994+RNcctJz18Axq+HzMl3m/Mv63t2L/VhH
         9JJEX0jkIrZSeAs7trv8CX451HbQEu/2ZEbogBwA9Vskg7aUx/ut1uLY2OJK1d8dXIlQ
         GGyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xFdPUis+b0SAqO9e1+lFVcsXPknHkq+UuXFEMP6x2vY=;
        fh=QBMSCBn8ElSBzcpkmhFqVQ1n4uVoBUkCbeq0/G0iA10=;
        b=dSX2mEc4O0/TzvMpnB+qX251j+qfOgC5t65z9XNaKHI5LcI+JM3neboe1oST6Vx5fO
         aAoHXTf/dATcL3IGJZATZkv56RkvwXEebynyIhp3kREeKS9s2YA46hunU7Xkj+yY2WYd
         oESnvGcw0n8IJO2RtS0+5ypy9/+K3dHbNbQaXsAWy+zxQVynQkQL/1r2OkSaX/lZgSYq
         /DUSjaK6TTzg+F2VKmKYNdjVcuViw428cf6ZcoFcQ1IekaomWQAr81aQ5b+wcUmPKrJG
         gAEKFR8ZlzB767cPMIo7/U3wIBIkxvSpzkqTExy134bJ8o5yiNmWlHMTLDHxsNeiwQe9
         h1+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787566267; x=1788171067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xFdPUis+b0SAqO9e1+lFVcsXPknHkq+UuXFEMP6x2vY=;
        b=RbG20eSKP/nJjPQwKQLauiVzD8iFaECGB7C416kzcc0P88Xop7ShBtoKdTFnMqUUfY
         jeWmUQfMYJJx5qouk/RxQL4FpBEVgWneer2uxhf8jGsp4jJsT9P8DoJZKWBrdhgDfufb
         VRC4S1uA8TJ5jRYVl8lkswCiRiL0HOyvQjs2D94gv1tYAUWNLDXxer9nZbhm01twVrBk
         MvThmgR8/R4DuGQuXy2IK1OKLx2VCrTgR31oXRouEmdJgd6pdwbrKxIMAVrL+Ph+y3BS
         GKTZzrQmtGz5M71uqgsIpfgS0rKNmU17C2Sy52ni60faexi38f+y8Y/bICwtbnMcvuiM
         YEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787566267; x=1788171067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xFdPUis+b0SAqO9e1+lFVcsXPknHkq+UuXFEMP6x2vY=;
        b=o4Rbc+Aam0d/f9Aiyz4cK3ocn3e12j1G1jCVI0gOyy8M0D9fAtT+kMNjVJlDLZVpDH
         a5d9rckVa3MtpjvdxQJmroeNfJRXCLiWZtgPCnxCQImFime2l2TaLOfCH6YVf4snRzsP
         /vD2oJ7ErJ1CLf6/NjuZcjHUrZI788L+QmGpc3Ozf+MpTkn9oVMfp0PaJi1ugdvdfa2/
         QAxSvEtRcBP594V2ROlfY0VMxHnAkyr/Ussu10n0yOcDAM5a8IlENUf9VUWkc/ocEIbp
         /Xint8ZnPjiLtgT+sy2g7F823jhZuqhCEHeoX+Ltbcdnqr8T+6cah0RnpTEgbWf0FCtM
         V6WA==
X-Forwarded-Encrypted: i=1; AHgh+RroznvvsG6kA68a+1N7eT0TGmNWwNKti1RKpXpo/gnKYY0cLixZ799nKmrfq6wjOMdtDuNt/Rlk7439UQYp@vger.kernel.org
X-Gm-Message-State: AFuF++lb8+xRE1Zp6HmPUdrii7mn9UT/Io6PbuIA09tFv7r86lBrga9Y
	IkGhpIDK8v9ZvtX0n0twxp7FLVawL3wYTEkJJJFAB5lcTfU45t+EugiJegqDzxE6Apcf30ATbYz
	j81SAErHUdwORcKXtT/hMmIBtD3CqHRvcYMBd9BjXlvewC+uFVB+qVHadmxaP9kZ1VAcjK5V7tu
	nd6ffJ//agj8XXSijCkP0Eu5uYuFmUTqBXwRnU07ar7+w=
X-Gm-Gg: AR+sD12bSPnEE1uwPnECXfAVTTIh2Z6hIfpUlEQqr7IHJxP2SQzpGF2INf3M2x5preU
	Kc5nhsWWjqWHgSjFDAWp4FHDMMEC/OmZEAyJ+hG3GQMZbPMFkMbMEB5Co3CKa5UbwU31v6ekbLS
	oTw8KZgdT043exr+q/Zf41VO6CgbgaBbLHju+EkAq45nKjC3qxEYzC8+4X4hA=
X-Received: by 2002:a05:690c:e1dc:20b0:7db:ccda:a40d with SMTP id 00721157ae682-849f01479c1mr74939557b3.5.1787566267317;
        Mon, 24 Aug 2026 03:11:07 -0700 (PDT)
X-Received: by 2002:a05:690c:e1dc:20b0:7db:ccda:a40d with SMTP id
 00721157ae682-849f01479c1mr74939347b3.5.1787566266757; Mon, 24 Aug 2026
 03:11:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-7-harendra.gautam@oss.qualcomm.com> <aff28775-b27f-4440-b7e8-01bb5a8ea906@web.de>
In-Reply-To: <aff28775-b27f-4440-b7e8-01bb5a8ea906@web.de>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 15:40:55 +0530
X-Gm-Features: AcwNN1Xdai-XKJ9Ozv3HRsrFmel4SeNQCvovlso6MLPmQjGIsIp6fX_fta8kZDI
Message-ID: <CAC-tS8Cxy9b2CwBTno5fAcjeXBd4jYj7KV2NqCjOccu9i5HxmA@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] ASoC: qcom: Add QAIF PCM operations
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4NSBTYWx0ZWRfX8X2WYvIvN9rd
 PtdivOeBn8HDqOd/4o8dGBqdZm6JxmLzG6Upx2q69jPKNO3n2LJZceFP6zM3T6V4R630tmIMRAd
 rRNSFwpQ3qP5eFHqwpkUltq1rRZhy10=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c18bb cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=P-IC7800AAAA:8 a=HWrUbPwSkS5HGAVXgNUA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: RofEl-dwHFuCl-efm1Z80Pmn5K5v9E2n
X-Proofpoint-GUID: RofEl-dwHFuCl-efm1Z80Pmn5K5v9E2n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4NSBTYWx0ZWRfX7VATO/YillSo
 X4MnahqVqIElaLRi0JTZPr1GGdgroyXna5gROE/A1IreNkhfYv0+jnlaig3ul90hgfcCXdCf7Kc
 nUFGqcTgpzN18tasjFHfDn+EevSv25PuqwQMsMSuttWpH/TJ5rjil/9YizOipuow56Iapult5HI
 NNOVU8GRE4MlOBBpEtowYv0obfjuBz4IjZQ+9WOVG2naxrp9NTju0Rc3HSK5JsGqs9Bi8fv5jtr
 zFQHti27FohVXavs1j4WCHSUq2+8X2OWR7ARorMTYr3InvRaamRCXOKYDP5Q+LEkz5VD8ew7HTg
 bt7udbmLVomiQVPSJC9xXcvLWMf7cjE1mkx+3gLDE6hOTWl7M3zO7gvX8an+vQXi0PhEvoexl19
 mhd+OURm0I5NVbEdbTw5hIAa2nz94E9D6PNgtGcOo32FAvOwEqdPXOu+4iuZlgiRwbLdMEQNqHJ
 CHwgdGlJxajtja1lKwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240085

On Mon, Aug 24, 2026 at 2:55=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > +++ b/sound/soc/qcom/qaif-platform.c
> > @@ -0,0 +1,544 @@
> =E2=80=A6
> > +static int qaif_platform_pcmops_close(struct snd_soc_component *compon=
ent,
> > +                                   struct snd_pcm_substream *substream=
)
> > +{
> =E2=80=A6
> > +     mutex_lock(&drvdata->stream_lock);
> > +     if (v->free_stream_dma_idx)
> > +             v->free_stream_dma_idx(drvdata, data->stream_dma_idx, dai=
_id);
> > +     mutex_unlock(&drvdata->stream_lock);
> =E2=80=A6
>
> Under which circumstances would you become interested to apply a statemen=
t
> like =E2=80=9Cguard(mutex)(&drvdata->stream_lock);=E2=80=9D?
> https://elixir.bootlin.com/linux/v7.2/source/include/linux/mutex.h#L253
>
> Regards,
> Markus
Thanks for the pointer. I believe guard() can be used across all
stream_lock. I Will address it in the next version.
-Harendra
