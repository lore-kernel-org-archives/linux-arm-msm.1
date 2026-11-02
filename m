Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793610941;
	b=Mf4L8sJlu8vHUiQhSMyPv/A/sFDki8euhBvJZD6hZYY0dzE6eJlgv7ISWZ6sQUobBgnr
	 LyCmFORu+Nq1tUXf7sQhBXZMfkwhyrT8uK1N8T7b1a5OyUpUNPPe3kRixwKANF41BL97h
	 VfL04g9asvZyrUxuEoDrDo/dPkoF5jySV8v+znEwJVqjCZ9FpYpVeeh1rsO7qeqvGpkoo
	 5DqfoA0VFNcGrxTBSss3ERoNKLQA90w3zkHEZo3hbiVmzW3JMuXJ+t27akGcpM5jYv5VR
	 TXvQ9OFF596+KyUQykZZwtN8nzENsQB5RZu2OX3k5MkDKo5ihxz9y2NvvlLDihnBtJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610941;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Tw4Il/543zMhXi+Vlw1yVPrTNlhNw08frbkre1OFtwo=;
	b=GXLgrMzqcet2calRO8disZONH1tTAqX7y0zCbmC4veD2EUlBR4S3WhlUpmPcyLJaCuJT
	 V6+1AW7qeG4KqD5gXwFDH5dZRTDimMk32et0SVHorKSY7x//fZWuPm2/ohAb25X50ECSU
	 dkxB/kXxc+KwIptw1gH1OAIZfU1Vr83VE5aldAUfcl8JTYhb6GnkFh7cNFkkNr2VUdVOL
	 P2pJAAegYMEWzztLCf7WKervl3+uk6LXbuZWdLLVS/046gnfJvogxZoaFODcCWIlblTLZ
	 mdI4lXeXCyo8IxQt6rpaKwWmrgj7V6E3+d8+xHOIdlABxjSx2BcmausMKgfnYIWy0jg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aar7RgYg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZTEQuBhl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1601606A327
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1601606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aar7RgYg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZTEQuBhl
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AOlO2880892
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tw4Il/543zMhXi+Vlw1yVPrTNlhNw08frbkre1OFtwo=; b=aar7RgYgm/5vhEdj
	Aeyu59+LXbpUVGQmFfLAiggu+wtMIpPNQVUTrqYg5iuP9kUgZfDHxWOdBGmz3h+K
	vuhuu0DSQJTz2KckgrCwIUaMgkmCdLPkh+JlWS83pBVTLuWlKjn+YwK4odeCYLZG
	fiikjVokI82lMXGA8p/2YSEaIWfD2/1m1kEJtLRi7xINpR0bVNW8pvKsCz/4beIr
	q7Gs/gZtn/8AeFxBc6nQXvu7veF2z0thrVus1uM9dBNwSdrTi6tIxE2Y3T+rF+66
	J9ZepK1SYGOOzAJYP6GO2yni4ixlqL3fGZZzy4eRD7d0AwGp7qGn+FO/un3d81HR
	FeiWjA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrg2hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:15:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2373e9b4so267438985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:15:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793610938; cv=none;
        d=google.com; s=arc-20260327;
        b=ZumLCFzDvnEOFzlT4GpfhrHaQFc+zdcytaJcieN5DD85APYq2O7drlbQJuLRp4AdIu
         UY/VLyGfs7iZPGaQIkYLrPKMCsw5rz9Yhl7bw/AyGL5BzEjpF3dLrs3eYaFE3IF6ye1A
         7HcXfRZuDDJ+/LOS3awr+T0D3DhBQHGYJr2eF57x7J4MXRRLYFhUkeHDCsjHDzRml9r7
         JmZZbeVysRmghlO3+NWlD2LG7r0MFiH89fxSPB4P13/rmYRLiWIxMbnFFmz3Z6vbzL4H
         GT6tt/7z/vxwq26+sNBO9Ge7Pr1xM2GKbrwJVYQXvsezRb0iFrPbvTNT/op1/O8Tt1Aw
         9JoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tw4Il/543zMhXi+Vlw1yVPrTNlhNw08frbkre1OFtwo=;
        fh=7EA1iMCki2tZly1bk8F+WbgPNoCea0kEzh24Dh8EB8Y=;
        b=UeDIwf93uAfZHBxDaZhEqCLoEiTDKeGVBfFwGFWtyF11qavXyh95dYZR584b+F55K8
         VcNsr7BMvvd1jPPLjGElJfumdmSDcvafoueqNt6U66Vq6U55V4WP1L6Qq2jwpiLfSt3s
         0TQacXh9c+nbQL3jss3pyRhSKiEeRbWJfI9lFG3rJVasAkbf2q76eNU3fVixj7whRuc1
         l0uogNAdjVfSC+knZ5OWlgTmBRPXtabyk9FSTB7pFkd3OP9a4dwif2p/9y5pDTkzlKNs
         xbYaEns/8GP1r7FjOHGyuQ4jVS9PAhO9ZOXSLKrOhqmdH39zITA3FXNJY+hKqQ3O4Ssm
         wjYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610938; x=1794215738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tw4Il/543zMhXi+Vlw1yVPrTNlhNw08frbkre1OFtwo=;
        b=ZTEQuBhlquxXcghAghWe41mg7QngqBllRgUlvQT9uehPiOd06nBqHXJEca/YXjfHEQ
         eIZqKvQ5MthODkagbQ0jobFFQfsMNmHtJkX6nmFKd47KGseqsN9IGfkF3y3mg5yhyqWd
         yVIOhkDbgGIL96ilx5IBh9xeBMKNVhgdhAyt1zqfHIn60krvrTaCX+HKjaTs64jJgLkG
         VbTE4b3ZkW1HzUtccdnW0VJ1bgWAqRTjYNRVf1mK528NcVcuAvJD60PjargNsljWowvj
         NyK/91lxtwwmazwTY80HeHRu8Z0X30QNOkdZi85PD1AP9KF30wPuOLvO/mrgJTUn+AdC
         hSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610938; x=1794215738;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tw4Il/543zMhXi+Vlw1yVPrTNlhNw08frbkre1OFtwo=;
        b=GOqOFb770e33maBX7cUZK88M/SdoDSOvVhQPuMt1cEGds98K6NQdAljzz8WnhJ/jW8
         xk+5BIpGGi6CsgaRSV6CbQ9Fmym2u6BvCYuYL3UuvqxXXtoAII9MIR6a7CPkvlCPjX/E
         k9IFHt7puL6qQVV/fhF0kWf93yWlJ/sfn5nCpQOKyG8ESV5NtoLPGDGbqLqq55ZZDQvr
         /mE0fkxEZ7qn1iN5LQFpObINDuwQbJlykwf4zPWydVIVu564bRukNlREWzjkZs/pOxWc
         pdgb+SS/idkqXRy6Ari3KV3lQsuFSJjvmBctj7fs1OmwQvgN15NzSKQ6ezNHdjhAFYuI
         JoGg==
X-Forwarded-Encrypted: i=1; AKwUvBwdq3dTcAiH6bxDY3QjoDfdoGFF/Lid1nWoia1SEptEk79xazHXDEhGLUv47Lbr1yvEy+jrxCk+m1Y5U/Mw@vger.kernel.org
X-Gm-Message-State: AFq9FYKA/JRm6HrQ/wzBCClfM+VOmeBNCfNHSbX3FYgW/IOz2O7Xf29Y
	eAiVsuxztplgergaqETWKTimEBrNhsxDhh0SP6buvOJxlrGzCwjVrbH2emZn/5oq9K+5+ci/DFo
	Y6Iogx8T25oG6VS+bfkUiPxOMlGWFx/XKROJKzhOjcZDWundRUX/Ibckhm77eM1T7My1rusBnei
	NKHqnRykXTbOORumYX3aIYVcoU0240Vi4RG/5nibu/poY=
X-Gm-Gg: AYBFou1WciwmJdUV3jHwOL8BQ51umE8zAya2amfCa/BJCkO1LuYwsO/7WNM6Aluf7AC
	VsPuTCMWNy+CCeJ6PvvzZiSi5YVE75w+sAQviAs3oLGk8mE1LFG0FD1MZLWR7bPPmmERBKpdBin
	RG2OEgMEpHYALtVFOxgBqPYC2Un3PWXMnUss0vNNCbVpeoQxpuDwdWumTj2Z8lJhp1p+SNAYcRJ
	x46b4PXjK+z6NvYRBcmqIrtZhO/NH8PpfJ3ROQY6VDLl4z96nJJztd/t/BXdYjbt7qP+t9/DeA=
X-Received: by 2002:a05:620a:1d06:b0:93a:2611:270f with SMTP id af79cd13be357-944216b7459mr1546914185a.13.1793610938017;
        Mon, 02 Nov 2026 01:15:38 -0800 (PST)
X-Received: by 2002:a05:620a:1d06:b0:93a:2611:270f with SMTP id
 af79cd13be357-944216b7459mr1546910185a.13.1793610937520; Mon, 02 Nov 2026
 01:15:37 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org> <20261031112203.545319-3-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261031112203.545319-3-vladimir.zapolskiy@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:15:25 +0100
X-Gm-Features: AclHuK-vXfGGpfTNdBgvUtbM93_wYn9Fa5uzM4AszJQG5UxZU_Wa-Rfb9kFn0d4
Message-ID: <CAFEp6-0ymJQN=9tu7HOYHdvRheAU76iyn3KFcVVgf0j8SDbM1Q@mail.gmail.com>
Subject: Re: [PATCH 2/6] media: qcom: camss: Skip TPG if its registers are not described
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae854bb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=HTgco5He2NIbjNvQVVcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: fVqBjt0M9u1N99mNBH9qB3c0m9tbqmLL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfXzOJiPEhHfMlS
 wsUXReS2T98i530qmRKklX85F7b2QPLKYhKzz83l4llB6GUaHsZBbCYn6L2ciNhE5KZdAihm21L
 0ze3VELUCKeXsaYiA54bajbvNQCMRo8=
X-Proofpoint-ORIG-GUID: fVqBjt0M9u1N99mNBH9qB3c0m9tbqmLL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX2oBL67KDeZEd
 ier6EulnI5kTSKnO0p188UZa6+5PBy4Vk1Ilqug3/Ovci5Cj0G8HuhP700csIeesfDGfQgx1JKO
 JQk0xhIqd3fGeAiC4NAFDYlx3Mr0Qg9gwICAxdPr3YNDhcui6CKNmWW6s47mBrTm1t7JbeHBthO
 mcYtDW6L01DWXnXkwPSVuOPpBr2EVgyo97FqN8adPcL1Uqn997jMneDVYwpIYrnopvIsQFHw6D2
 9aR0rs5mwh7fS7y+hVrbsoksNWCxzvsYHv2IleLXdbvW2IUFs4NkUaQFSGZ12V7xjpY3U66lr8D
 ONURvDXQpeceHqJcDLA8Opiyq6pdXx8i0Y8xYvkrb++5A43f5xnDTGyhwL1tZJkCl5uxKTRMszX
 W+vt1EFDp209oiEwzOiKV3myKCNd5+u3RnKn4WFfh5h3tCLh38nWtLFxc4+EB3vGrNScsU8Kc7D
 6lmHqGtUTVrEL0G3IRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020036

On Sat, Oct 31, 2026 at 12:22=E2=80=AFPM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> If TPG is supported on a platform, CAMSS probe fails on a device tree,
> which does not describe TPG I/O regions. However support for TPG can be
> added to platforms with functionally CAMSS at a later stage, thus
> registration of TPG subdevices should be skipped for sake of backward
> compatibility with old platform CAMSS device tree nodes.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

IMO, introducing a camss_has_tpg() helper would make it a bit cleaner,
but the overall approach looks good.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  drivers/media/platform/qcom/camss/camss.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c54185c93a8a..cf4687a20dba 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4965,7 +4965,7 @@ static int camss_link_entities(struct camss *camss)
>                 }
>         }
>
> -       for (i =3D 0; i < camss->res->tpg_num; i++) {
> +       for (i =3D 0; camss->tpg && i < camss->res->tpg_num; i++) {
>                 for (j =3D 0; j < camss->res->csid_num; j++) {
>                         ret =3D media_create_pad_link(&camss->tpg[i].subd=
ev.entity,
>                                                     MSM_TPG_PAD_SRC,
> @@ -5434,7 +5434,10 @@ static int camss_probe(struct platform_device *pde=
v)
>         if (!camss->csiphy)
>                 return -ENOMEM;
>
> -       if (camss->res->tpg_num > 0) {
> +       /* TPG register spaces may be not described in old device trees *=
/
> +       if (camss->res->tpg_num > 0 &&
> +           platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +                                        camss->res->tpg_res[0].reg[0])) =
{
>                 camss->tpg =3D devm_kcalloc(dev, camss->res->tpg_num,
>                                           sizeof(*camss->tpg), GFP_KERNEL=
);
>                 if (!camss->tpg)
> --
> 2.53.0
>
