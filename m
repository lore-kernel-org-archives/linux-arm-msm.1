Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793696137;
	b=ygWUzgKOAR7j2QO7wNtWI+qzUlLzOvdq+LUd6xf7FRJr5FOnqppjSgRj6AYViE4PU8NC
	 tzniCGjhZ/zqpsQZK6Pk1fmZGpJN2h0MyEHMBXRzj8IifvbH5idz7N4vtZhDAxodx/4dS
	 TgcUAdUw69dFi54mavZX3xY26oWX+NSjMYGYGyMJAL5uxcxlvx4jsqt6u8rwApaSuB6Z8
	 5FxQrQTMESvqYb2Fslnx4RiLePjGmQI3Av+ekuuDX9jELmDPvBp2QN9Lf4LQdLWlFODoV
	 c3p6Oijwx+MVsL6Iiz69FEag+YISl7mDx3r9s7BlIfasEZXycVqWul/qzl9TWJZosUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696137;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=;
	b=NwIG9KXN8d2ckVomFa0aWxAJ0GqxlNEpyAKShogpU/YOzUYq97a7HlcxcZxCkKA/9aIs
	 l3H9KYTLjmKArEJ0V1/TgC3qba3wxIrv3r8kyZ1iFxb4xcF3KqBW7N3oUvNsvrE+/JWe6
	 bMkGR+sR9f79XfEknUUQV6hiqik/GhbXzbfBPSXoJuPEqN6u8WwLuiGre5IrJ5LMMqoAS
	 Yt4fltlMpNNicmFZJfPx4xWD8a/cf6APp1js4ZfWK3cq5RTqsdeLRiCVVs4jO3kQ0ysVL
	 wdnJ4biDJ/VLSvyCxLfRqeoDW3LP0UoNk36rJd98HTWUwkA8/YW34G/6EsJOrR0foBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OWmJBZ9g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HQBJlRfR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFBC606A336
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 08:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DFBC606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OWmJBZ9g;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HQBJlRfR
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A33i1jM1142191
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 08:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=; b=OWmJBZ9gc8nkZerz
	b1HG3TUo8MIzBBrnc4dE088yesRqksaRibt7o2ejR7EMPKLM7Sd+wr+prPDIZVwl
	Pv49uXdDmq2HLJMXKLwIKsL+mhOo8lJkCv4lGoLBRzEmzEeUP581zuX9q0KUlZD2
	zo+oKNv1sqaLORWJq1VbGjXIHmE0UTS4R5/AsES2rA4KftwMi6NcmdQUyurgGFaA
	2S8lf/Gz0dBh9bpxXBZbI/0Z+PTYEbDOvuEeu0QNPDDmxmfyp6lVSyXRCQd6+QMi
	cYe5cxo52UItq7Yv/2hPxg3PiCga9BvqtFeDnqs7EUGIkRbi6O9tX/WQvKQYPeS5
	CNW8/g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq7ycs4xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 08:55:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c7cb9e267so46377536d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 00:55:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793696134; cv=none;
        d=google.com; s=arc-20260327;
        b=szmgUjzWB5FbeOMsvxdaWa+YmkdC2buIMzA/SF6LooQ8tgnZqZibAO1uPnpdmJA3xO
         0drR9UTFfBgTG+nXjXHrO1ehcmOq0wl1G8Pizah0xL7oWgM7qkfpmyREm7FFR0/Nu0IP
         k4zjkgD0/EjTv4MofA5AlHyzaG3KvB6rkHF3W8mFeU0v5wONAn6o5AGu8CuqBlqENEk6
         tAkvie4D93BEONnvYqaMu9ocQjwtOIb7MI+6FUFM7eUJnMitoueZJc7qiWAQ0X/U5Qfm
         HyxmhSZi0v9ezMtT7joyc0rnhr64YgrEp3FQKnIzoFwGSuwhC9rxQhDZV0UcsK1piNax
         jybA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=;
        fh=z/ytwZFNSZMrpAeh/XuqISlKmNxa87rd3z75wwIExoM=;
        b=UeEL6e703jubdYk40SGr8ttWwfgH+mys1VR4GwLMDTXwoXQUCMMnGJ/t3vVyZQK/XI
         JULZV5c9Wjbyw8ZB9P25EGUKlBHAjCC/tzU5fuykOxK4QZ9Hfrelo3NSNHJ7eWfEE89u
         Oq//tkDaoGX8mp29phw0PaIsu5DEUpKRkMtD7p6putolXM8SKeVW/P6mJ/N1Dl0zlpyh
         RFQ5FMa1+YKnU9lg7/HoD+7SWVy7a5Y6VlacQdTSUZDuIYDjuW0cGryBnwTN04a5va5O
         Tcnwf7VK4yOQdwyh6cuooTL8xN9jmEM5V6RGBvAujHU/SGuOsI32QTK4bsURk3Pg9tyL
         LQVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793696134; x=1794300934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=;
        b=HQBJlRfRC+4iLMd73Erbza31dHAaBeBRf1r6hDddFdZ93Xri3jZ4/KbuH9SbLZ1s3W
         UfW7WYqAybK3Qqo9QJoyenFBbCIIuwApCDIrxFzJgSz1Re47+eBz6Pq9pF7QITETDOl2
         aBfCnDZHEJb9zhTJX0oqf0rgPgtjKmBtsO5gDoQ5UOsazp6m4YxEkJfRM4w8zjsdhbdm
         GnixX7m65YBH8SB9EnJbFY9KuGEeFHQg0O/MFPM1N0fvUCfXaUrDUK6+5k/BrKcRy4q6
         Ov2pHvojv2Dkr1ql77Fq034QWJL0jfnM1wlaha0m3eDrCAehkXTU6Uo8I+3NAltzPcCK
         EcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696134; x=1794300934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=;
        b=xkBU6+Fl9rYdFRhNMvUWIa54p4e/oYb/vpXL+O4zybEq2DJbd0eTJKpgXncfJMvSBp
         /YXVKkbwzVF/GIX+PqhWjQ1cH8SzfGVuI2S0Jez/1E/sQoAXX1ZJUsF1c46KlLJJhFsg
         w2X+ErjQNQnoAvENdsYFatMsdc0kC0Of0P/KxNUoAjmRnnMsvLFgIbwxMtrsvfUGST8G
         LpjaYU9/x5BV/DFkNKvI4oi80yWhV63T9casDejV39Z5TeTbaV/zUjdUJ/tSzmw2CuC+
         Pg3igio4Fl9JDn9xp3SHniwXcxGE7OUTdEI9BOdmjG3D5g9WhJ2dwrWooikMJCOzCR0F
         dtfw==
X-Forwarded-Encrypted: i=1; AKwUvBxTuic6WOLZQFQn2fl5NB8MlmjMV5L2wSRCAAyUdaK2t0x4L+70aenu8FXo/aIVcKvvvx3QvVnmOxsxwWfb@vger.kernel.org
X-Gm-Message-State: APuU4Z8nN81u3a5cciOYWllvy7m7ygkCk0Wd4TKwEHi89q3eiAPSZlJ+
	tXN1RFBjsxjfdp0D5BkBUNNL0oVn11Z7NwHpAGXl4VmCEPMdPcfKvGDQK8S4eXNLy2qX2iz3HHy
	d9Rl06L59OAYxFmAx0GBpHByKXPSaFB2KUW9fNIVG+PG/qkqlAveQyymi5LuM7QGTBAVkW4quw3
	yUNfFx34BYds85h3b1hJOqmT9WcWDFpUIr+564r58PXB8=
X-Gm-Gg: AYBFou0x75YyrBEh+25QBwLabaCfPvWmjfL2u6myRWUBFLsBDyt/fN/XoYzp6akIA9B
	OEbZcAI83/pEJFxClJW4wJsrK/SKgCJnb+S5aFZkXewbKm8MRqQPWLiRf/7YnMklMfJMDpOot6/
	0Y5O9Qpg8mEqbNRqzGutDINSGXG5zeRU3GfZIT19zX85/CKXSvdubKarLhblLUlFtXj7A+FG1/l
	meq9h4qF9ogz5jEYmPgbs+2ds8tLj8e/w+xKrqOzUBCa/7Nw+/Lgei3WQdhz2btnGFxSiZqj5k=
X-Received: by 2002:a05:620a:4044:b0:93f:3163:3e37 with SMTP id af79cd13be357-944216b1af2mr2157957985a.28.1793696134251;
        Tue, 03 Nov 2026 00:55:34 -0800 (PST)
X-Received: by 2002:a05:620a:4044:b0:93f:3163:3e37 with SMTP id
 af79cd13be357-944216b1af2mr2157954685a.28.1793696133721; Tue, 03 Nov 2026
 00:55:33 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102191922.4044912-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102191922.4044912-1-Frank.Li@oss.nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 09:55:22 +0100
X-Gm-Features: AclHuK8MJq-s56wdtunEmLoEql-aTRrOrw2wQVU5g0yE5nW0xqWZNoiPrAFZCeY
Message-ID: <CAFEp6-0CkkoT_xP+zvJ-ffVQnn2E-9AuiC0=cer-Cm1_s1dZ4A@mail.gmail.com>
Subject: Re: [PATCH] net: dma: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Michal Simek <michal.simek@amd.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>, Frank Li <Frank.Li@nxp.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Li Youhong <liyouhong@kylinos.cn>, Joe Damato <joe@dama.to>,
        Arnd Bergmann <arnd@arndb.de>, bui duc phuc <phucduc.bui@gmail.com>,
        Yicong Hui <yiconghui@gmail.com>, Simon Horman <horms@kernel.org>,
        "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        imx@lists.linux.dev, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=V7foQuni c=1 sm=1 tr=0 ts=6ae9a187 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=OV43vvX7PjCfZyRFssgA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: 2687cnJCSmL5k6H7_21rJ3nW8Gf5xuhe
X-Proofpoint-GUID: 2687cnJCSmL5k6H7_21rJ3nW8Gf5xuhe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNSBTYWx0ZWRfX0xGLZYwy/Oxd
 nvjyKD4HJMx0nbOcAvtRXaEH5CaMapbUjCchLszx0gIxKoMs0ZQRb4Xczum2LR86jcwR8vBTila
 5LiMX0X+KVCZdicPIDRTqEhB6Qz/AXJnQ1YeH22KG7sF+18OzHwbnqjsOS1T5V9WLO4eBBDsEY7
 7hNyC30R/3pWT1q3rKVsdxbiohYN+6byuEtdqdndC3oQcEVI+OMBN2AudN015L/nbv7OHH+L7ca
 jaEWVF/crEp/DS6ZNxJ4w+S2c08ZF6JWoW+PBBbNLa1fH8+4eZjdL+RomolWh2HbyVFCG+0OD68
 3v1P/amGzY8gKReaIAXdMqNMotUHYVufns0lYbTorWghFDp1QovIHVrl24XcE+LF6erErsMRHdA
 leqZbCz/mms4U7us2SC+lPFlcIDsNAm9AnrCY6SZn5Y69EfHon2yaiuznys4Lz3B89DNjK22kyw
 gUlXZ8FDOB+5CEnJt3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNSBTYWx0ZWRfX8oCdbLtQElTZ
 OagciKJIitdb4f4ISFqTvjTIhCLGj7Ku9oZ6YzmAGJ0S7UufnPJ31/9TsGBQi2XUxTwYDXuGE0h
 25wrAiq1FnIICqpowvsDO4DhNqNjSrc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030035

On Mon, Nov 2, 2026 at 8:19=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across net drivers.
>
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/ethernet/allwinner/sun4i-emac.c       |  3 +--
>  drivers/net/ethernet/micrel/ks8842.c              |  6 ++----
>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c |  6 ++----
>  drivers/net/wwan/qcom_bam_dmux.c                  | 10 ++++------
>  4 files changed, 9 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/et=
hernet/allwinner/sun4i-emac.c
> index 09b2abdfc9e84..d7ee42b2c1976 100644
> --- a/drivers/net/ethernet/allwinner/sun4i-emac.c
> +++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
> @@ -303,8 +303,7 @@ static int emac_dma_inblk_32bit(struct emac_board_inf=
o *db,
>                 goto prepare_err;
>         }
>
> -       desc->callback_param =3D req;
> -       desc->callback =3D emac_dma_done_callback;
> +       dmaengine_desc_set_callback(desc, emac_dma_done_callback, NULL, r=
eq);
>
>         cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(cookie);
> diff --git a/drivers/net/ethernet/micrel/ks8842.c b/drivers/net/ethernet/=
micrel/ks8842.c
> index f0d6bfc6025ca..c68abd4643e72 100644
> --- a/drivers/net/ethernet/micrel/ks8842.c
> +++ b/drivers/net/ethernet/micrel/ks8842.c
> @@ -453,8 +453,7 @@ static int ks8842_tx_frame_dma(struct sk_buff *skb, s=
truct net_device *netdev)
>         if (!ctl->adesc)
>                 return NETDEV_TX_BUSY;
>
> -       ctl->adesc->callback_param =3D netdev;
> -       ctl->adesc->callback =3D ks8842_dma_tx_cb;
> +       dmaengine_desc_set_callback(ctl->adesc, ks8842_dma_tx_cb, NULL, n=
etdev);
>         dmaengine_submit(ctl->adesc);
>
>         netdev->stats.tx_bytes +=3D skb->len;
> @@ -567,8 +566,7 @@ static int __ks8842_start_new_rx_dma(struct net_devic=
e *netdev)
>                         goto out;
>                 }
>
> -               ctl->adesc->callback_param =3D netdev;
> -               ctl->adesc->callback =3D ks8842_dma_rx_cb;
> +               dmaengine_desc_set_callback(ctl->adesc, ks8842_dma_rx_cb,=
 NULL, netdev);
>                 dmaengine_submit(ctl->adesc);
>         } else {
>                 err =3D -ENOMEM;
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/=
net/ethernet/xilinx/xilinx_axienet_main.c
> index 8a50cad1c104f..7e83c4b5f1931 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -1014,8 +1014,7 @@ axienet_start_xmit_dmaengine(struct sk_buff *skb, s=
truct net_device *ndev)
>
>         skbuf_dma->skb =3D skb;
>         skbuf_dma->sg_len =3D sg_len;
> -       dma_tx_desc->callback_param =3D lp;
> -       dma_tx_desc->callback_result =3D axienet_dma_tx_cb;
> +       dmaengine_desc_set_callback(dma_tx_desc, NULL, axienet_dma_tx_cb,=
 lp);
>         /* Claim the ring slot only after the steps above that can fail. =
 The
>          * completion callback can't run before dmaengine_submit().
>          */
> @@ -1565,8 +1564,7 @@ static void axienet_rx_submit_desc(struct net_devic=
e *ndev)
>         skbuf_dma->skb =3D skb;
>         skbuf_dma->dma_address =3D sg_dma_address(skbuf_dma->sgl);
>         skbuf_dma->desc =3D dma_rx_desc;
> -       dma_rx_desc->callback_param =3D lp;
> -       dma_rx_desc->callback_result =3D axienet_dma_rx_cb;
> +       dmaengine_desc_set_callback(dma_rx_desc, NULL, axienet_dma_rx_cb,=
 lp);
>         lp->rx_ring_head++;
>         dmaengine_submit(dma_rx_desc);
>
> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam=
_dmux.c
> index cc6ace8d64371..1479f8362e04e 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> @@ -195,9 +195,8 @@ static bool bam_dmux_skb_dma_submit_tx(struct bam_dmu=
x_skb_dma *skb_dma)
>                 return false;
>         }
>
> -       desc->callback =3D bam_dmux_tx_callback;
> -       desc->callback_param =3D skb_dma;
> -       desc->cookie =3D dmaengine_submit(desc);
> +       dmaengine_desc_set_callback(desc, bam_dmux_tx_callback, NULL, skb=
_dma);
> +       dmaengine_submit(desc);
>         return true;
>  }
>
> @@ -477,9 +476,8 @@ static bool bam_dmux_skb_dma_submit_rx(struct bam_dmu=
x_skb_dma *skb_dma)
>                 return false;
>         }
>
> -       desc->callback =3D bam_dmux_rx_callback;
> -       desc->callback_param =3D skb_dma;
> -       desc->cookie =3D dmaengine_submit(desc);
> +       dmaengine_desc_set_callback(desc, bam_dmux_rx_callback, NULL, skb=
_dma);
> +       dmaengine_submit(desc);
>         return true;
>  }
>
> --
> 2.43.0
>
