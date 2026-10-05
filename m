Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B054F3B14C4
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 08:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791189031; cv=pass; b=t9gEEMAYtxnKVzpOdkk1UjS/az06eMdmps8uTR2z3Py9vaXJDROFncxOm7b2St7oTFKO+ijNDhFXDqblz5xCukjVHfY5T+CgQc+oYl/ZC+xdMaTU8dc6t1V+0067JDyCScFucNS5k+16H62tHnyQgIVlA8Tr3Ru3EYcyS35+sog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791189031; c=relaxed/simple;
	bh=OKSP/9Loo+L4sqcvcofnJFL8eE/vtmfgviV7QLfsCbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=id3RJRDpmXFd4rcYp+TpphrDmm6cCwSCtXQ6ayCKlBGB/yql6n2rj+p1IuhpFj2XcGBh1qIuVqfq7+tgWZVigZsibPo1F3E0Mhuc1/sK735fwBy4OHXQJFxuxapSpNrIdXBk60xU6g77sXDeLICk9/T++g8EZaroC264vvKYKEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fxLhMybF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGeGTem3; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fxLhMybF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGeGTem3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69583qbP1180598
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 08:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VadTPzAKAm9tESrVQzhsSzsHSDJZpG8vVfU/2WgaFsM=; b=fxLhMybFbyytP9+H
	sBCdr2b2o4wTUlf1eLRY70n/O6tM2iA2eg6o/JUUjavirmcmGAYvDd+3Wo8ePtGL
	RAIB1tXo/OOWpOga2KUMavJy7+pw3Yk0CGHRHjuKuvlO9KaIZTluRL/ZO4Mbay/l
	Rnwp6zHKHCfn5DO7qXVy/WXXosNbWIfePk2IRXowEJAi6r+F1qLCt0xl+RX6bg8V
	g8nL51BW9RktfE31h99I4KiEMnbRXG5dl3fRdTgg8L2fg7T5ROCBfvP4auBWscSx
	/DxPo/f6zkSP5DK+ROia3swOuJBgOUCYUsldEcPOFSIBM5f9LcBM5myNh9JziYL7
	hfxs5A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xhs19gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 08:30:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e4c03d1d9so169748385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 01:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791189026; cv=none;
        d=google.com; s=arc-20260327;
        b=jg31E5HsbhlBullzGojTudFBEeeC0OvvyMGKEDZIaeFTg1U/IoLvl0gcayr3RsCT2n
         NxvXcn75bUYhMMTS/TIjTgaMcN43CLByW1b6XeBLm1UZ1RreEnQsQpyDMwMv8O4BbjIg
         MplGiGw2nQhPI+UADNfKcqUPoBSBHJlMLU33Xjdbg+hbBJn4bJxwrxSpW/JtOqtJpMaa
         1ViPjPM/7KyJanv9Vsx5mqYjcoRj00x7RHcMgxLFqE8029lfxkVAslX6fn+nAARyzJuP
         sb0NDsHDIDFQYb5JbuOcCqRnAsB2x4u1caPHeLCDXbI2un5WqhrOf/jlqffUZnfosiIZ
         7/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VadTPzAKAm9tESrVQzhsSzsHSDJZpG8vVfU/2WgaFsM=;
        fh=hpceFPobEmaLw6hVCPWSK2mIkQDEENi9b2SocXR9ECI=;
        b=Vw/uEeBItYIQ6ojDjxv4xfzQ70tTQxv9J/DQRVdX7G7UaITEtd864PvPUiVpeTcoEu
         gYF9DYblowAPa67V1uR2OBEWXJPQ5Qtcc2cEsjySc9UCA2vTCT+VXydW2qYpv8xZVV1H
         ToAg05oZUt0ykR8BazXNQRH/+Jgb/la0UdLU2HpadCzdICbXpDu2rprXWEDAdUq5+FPG
         VX+ZouRHiMuzc33nsfhiRsFfny0thinxQiUKv7amwjcCnk2raRyXq3Wa7eUkExsUE8yW
         L71560Mog/e1JTThtYyxjIoplBKwYG7GOMRsxvBAiKCaZfYFA6qTO9yfucRa7UTEh0bl
         eJTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791189026; x=1791793826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VadTPzAKAm9tESrVQzhsSzsHSDJZpG8vVfU/2WgaFsM=;
        b=cGeGTem3sdDifP0wiwcCBei3tHDKXpS2zYRZEh5IcDa/HNDfXJPYG7IFV5iVCjEEsA
         Vg/NUrNlRhe93lrxN0u45lJT+Eb1ZCXWMCA5XHEMbvA80ILyt1Qz4fsVuSsaiqd5q1/I
         MttXpMXaVRrOznBPUV6465elWDd2irqlOG0fuqNzUJfKU6n/lhqdEgnK7tpfCjx5e1ix
         f/U6osiF0obOMhVA31awMnAm1Y5O1VjkGa5mezwweGMGmbJT8T//3RlyyKX+u64Z8Q/m
         fUhDR2wNC0adDGfQ5VUsq/lWME0kcfhRiPMrixxmo/croGCHAJMPFyQDann75XqC8VgC
         asWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791189026; x=1791793826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VadTPzAKAm9tESrVQzhsSzsHSDJZpG8vVfU/2WgaFsM=;
        b=frTj6WTTK30UKf0xOM09bVI/lBvjkRvXpvg+Usa8wvo7aC6UF/hgnLkFA/ULNeUHee
         /2wQcsKSXrZMy7E2FuKH9GDHe3z+EhYjn5/iRSSUZW6/2rTOQeYh10TGR3f4DpKWCkpA
         3XjBAGZxbSILA865p3JnncCoYi2clU4odDIVvlzabgKk5LkvhIgb/KwaKbX068VrT6gN
         d+JoYnMRjhfnhjLJb3chcAojhE6GuTIXsyPUxkokXs1ByNkRAbaWAGw1+Hn5AcstQGxq
         401qaG1vZmJmSSenomVnEAoaPyUvxyUkWnNIyzhQSy1twpCkQveDpZDusFkzBXABKaAg
         kdEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDHUHRzoMromHaY20bgeFCKcdP+zxXQKXAvbXGAG6wTOnqFzy/KcHuCdbKBl4Oq83jdLNrntv9GqunYY6H@vger.kernel.org
X-Gm-Message-State: AFuF++mFLY5wyePep+P9BL3oCuMuHiWEWCniRkin8zKi4QtNOccxn9Mr
	5JllWnnG030isd/GB0FTF+u07TwnK96eRG1Hqu3/qzyLLWVHryFkk+pXdp93J1e4j9vWVFW9olr
	yZF+wV9ZUk19h77mrv5pVEYOgTiN+iMDapMMoV77IWVJRcKZVi3rFSk7W7m9gXdxPTofenEC1MS
	YLgy/edQRJvxZK4DdfBEMdkbf8bmtYDeVvQSOiR7n4FR0=
X-Gm-Gg: AYBFou0xKDH8t+3MSYooOeEzMXdF5twNO1mxnZ6tmP1SSrK9ZU5cV0FmsWKbpEioeX+
	E+XlCwQucQVIrDJio3E6NKp9zrUEQlKg4mw6XVazCj9/wHwD6HW/LFuaofpIH3ALWgLTYKa9/W9
	u1ACbefU4AfsGok63a4/PCMv3/9jyKZXfNUBkUd0p1NGZaSh+6D2e1QwKDXaNQcS5P30sPdvL+x
	LhhwlR0ueRFjN02JvTLsktYjA5kui6A/8aoFSlbSFy8SHlSbOfNUCGZ8vuDfTvgDX6Ff2DWYAE=
X-Received: by 2002:a05:620a:4149:b0:93e:6f43:b2c1 with SMTP id af79cd13be357-93e6f43b4edmr473230785a.16.1791189026105;
        Mon, 05 Oct 2026 01:30:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4149:b0:93e:6f43:b2c1 with SMTP id
 af79cd13be357-93e6f43b4edmr473223885a.16.1791189025382; Mon, 05 Oct 2026
 01:30:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914132328.976902-1-hitesh@ebytelogic.com> <20260921131954.1690578-1-hitesh@ebytelogic.com>
In-Reply-To: <20260921131954.1690578-1-hitesh@ebytelogic.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 10:30:13 +0200
X-Gm-Features: AclHuK9X1M20qTe7O-MaPpEdsy0W24zs5dbBAahH9WMWCQYvvxJKIpAifNZ6cI8
Message-ID: <CAFEp6-2r=1Jj5owc-yuk17YwvtJSrepUjeAgjUZ=QJ1FL=ejOA@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: qcom-cci: always enable SCL clock stretching
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ravi@ebytelogic.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: XMGhcuGR9dMpatwBDksZ3mD8S0ybln5b
X-Proofpoint-GUID: XMGhcuGR9dMpatwBDksZ3mD8S0ybln5b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzMyBTYWx0ZWRfX7+8Pckw3Yydd
 Lk8vHsl/iToysJaS91gKZynkVa0G4yafIMqLDLG1XFNHJrNJ5ZE+tB06/UT9Ri6rOLbHsXskbep
 LaprHdY8ckJsM7SR5huk+Onj9piwsCY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzMyBTYWx0ZWRfX2myeBwKUz5Zw
 Q2YVBo8eQQYqYWGU+HLGqeXy0/Jbnb6YzvDuvQQErRMO7rpRRz2trktQIaw+1H8twJWfgkHJW0z
 JXVPoPpLeAJeu+iB9W+EpmbCRZ211UyGrKcLq+h7HyEd7Y2ZMKRUjQM/nZkDlE8d+iLKeBvixLN
 PlKFGjdJ6De933atNWp+8h9dw/ZWKhERc6h93JVY7zv/UqBCEKA1Dh9WTWZv5irWDuW1CQuyj8L
 sNQzByXIsEPb59pVwDJniKdMmbUC92EIOYNjCwzWkENLnJzWiU4nh00CFzdZk1Sy4eZ7Us9kKy+
 yuc6mrt+leo7sPv53kLhXZgUbMQwuFoG/99RLQX0/E2eTE73ZX9jPpsAMVGQC2UyFphiULnMGZr
 vCgaNL9RmYhHyvYfNAHm05IlqT3C9s1UguKxN5K1ut/oNj9r0CsfFjlKsCY1a7ge4LhMyfTujDH
 rFy7KZ3lMYF+xP6Z63Q==
X-Authority-Analysis: v=2.4 cv=Q6tHcI2a c=1 sm=1 tr=0 ts=6ac36022 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=ZovgdgjKAAAA:8 a=EUspDBNiAAAA:8
 a=FDL_EtIiEFQlQlNcByQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050033

On Mon, Sep 21, 2026 at 3:20=E2=80=AFPM Hitesh Patel <hitesh@ebytelogic.com=
> wrote:
>
> Every CCI timing table except the msm8953 fast-plus one leaves SCL
> clock stretching disabled in MISC_CTL. A slave that holds SCL low is
> then not waited for: the master keeps its own clock timing and the
> transfer fails with a NACK or returns corrupt data.
>
> This is hit with a camera reached through a GMSL serializer/
> deserializer I2C tunnel (MAX9296A/MAX96717 on the RB3 Gen2 vision
> mezzanine, SC7280 CCI v2 at 100 kHz). The deserializer acknowledges
> the address locally, forwards the transaction over the coax link and
> stretches SCL until the remote side has completed it, which takes well
> over one clock period. Without stretching the register reads of the
> sensor behind the link intermittently return garbage and writes are
> dropped, which shows up as random sensor init failures.
>
> Clock stretching is part of the I2C specification for every speed
> mode and a device that does not stretch is unaffected by it, so there
> is no reason to make it a per-table parameter. Set the bit
> unconditionally and drop the scl_stretch_en field.
>
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>

Looks good to me. In addition to Andi's point about using
--in-reply-to, don't forget to include a short changelog when
submitting a new series/patch revision.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-q=
com-cci.c
> index 873e901..fbd5507 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -27,6 +27,7 @@
>  #define CCI_I2C_Mm_SDA_CTL_1(m)                        (0x108 + 0x100 * =
(m))
>  #define CCI_I2C_Mm_SDA_CTL_2(m)                        (0x10c + 0x100 * =
(m))
>  #define CCI_I2C_Mm_MISC_CTL(m)                 (0x110 + 0x100 * (m))
> +#define CCI_I2C_MISC_CTL_SCL_STRETCH_EN        BIT(8)
>
>  #define CCI_I2C_Mm_READ_DATA(m)                        (0x118 + 0x100 * =
(m))
>  #define CCI_I2C_Mm_READ_BUF_LEVEL(m)           (0x11c + 0x100 * (m))
> @@ -97,7 +98,6 @@ struct hw_params {
>         u16 thd_dat; /* data hold time */
>         u16 thd_sta; /* hold time (repeated) START condition */
>         u16 tbuf; /* bus free time between a STOP and START condition */
> -       u8 scl_stretch_en;
>         u16 trdhld;
>         u16 tsp; /* pulse width of spikes suppressed by the input filter =
*/
>  };
> @@ -263,7 +263,7 @@ static void cci_init(struct cci *cci)
>                 val =3D hw->tbuf;
>                 writel(val, cci->base + CCI_I2C_Mm_SDA_CTL_2(i));
>
> -               val =3D hw->scl_stretch_en << 8 | hw->trdhld << 4 | hw->t=
sp;
> +               val =3D CCI_I2C_MISC_CTL_SCL_STRETCH_EN | hw->trdhld << 4=
 | hw->tsp;
>                 writel(val, cci->base + CCI_I2C_Mm_MISC_CTL(i));
>         }
>  }
> @@ -659,7 +659,6 @@ static const struct cci_data cci_v1_data =3D {
>                 .thd_dat =3D 10,
>                 .thd_sta =3D 77,
>                 .tbuf =3D 118,
> -               .scl_stretch_en =3D 0,
>                 .trdhld =3D 6,
>                 .tsp =3D 1
>         },
> @@ -671,7 +670,6 @@ static const struct cci_data cci_v1_data =3D {
>                 .thd_dat =3D 13,
>                 .thd_sta =3D 18,
>                 .tbuf =3D 32,
> -               .scl_stretch_en =3D 0,
>                 .trdhld =3D 6,
>                 .tsp =3D 3
>         },
> @@ -692,7 +690,6 @@ static const struct cci_data cci_v1_5_data =3D {
>                 .thd_dat =3D 10,
>                 .thd_sta =3D 77,
>                 .tbuf =3D 118,
> -               .scl_stretch_en =3D 0,
>                 .trdhld =3D 6,
>                 .tsp =3D 1
>         },
> @@ -704,7 +701,6 @@ static const struct cci_data cci_v1_5_data =3D {
>                 .thd_dat =3D 13,
>                 .thd_sta =3D 18,
>                 .tbuf =3D 32,
> -               .scl_stretch_en =3D 0,
>                 .trdhld =3D 6,
>                 .tsp =3D 3
>         },
> @@ -725,7 +721,6 @@ static const struct cci_data cci_v2_data =3D {
>                 .thd_dat =3D 22,
>                 .thd_sta =3D 162,
>                 .tbuf =3D 227,
> -               .scl_stretch_en =3D 0,
>                 .trdhld =3D 6,
>                 .tsp =3D 3
>         },
> @@ -737,7 +732,6 @@ static const struct cci_data cci_v2_data =3D {
>                 .thd_dat =3D 22,
>                 .thd_sta =3D 35,
>                 .tbuf =3D 62,
> -               .scl_stretch_en =3D 0,
>                 .trdhld =3D 6,
>                 .tsp =3D 3
>         },
> @@ -749,7 +743,6 @@ static const struct cci_data cci_v2_data =3D {
>                 .thd_dat =3D 16,
>                 .thd_sta =3D 15,
>                 .tbuf =3D 24,
> -               .scl_stretch_en =3D 0,
>                 .trdhld =3D 3,
>                 .tsp =3D 3
>         },
> @@ -770,7 +763,6 @@ static const struct cci_data cci_msm8953_data =3D {
>                 .thd_dat =3D 10,
>                 .thd_sta =3D 77,
>                 .tbuf =3D 118,
> -               .scl_stretch_en =3D 0,
>                 .trdhld =3D 6,
>                 .tsp =3D 1
>         },
> @@ -782,7 +774,6 @@ static const struct cci_data cci_msm8953_data =3D {
>                 .thd_dat =3D 13,
>                 .thd_sta =3D 18,
>                 .tbuf =3D 32,
> -               .scl_stretch_en =3D 0,
>                 .trdhld =3D 6,
>                 .tsp =3D 3
>         },
> @@ -794,7 +785,6 @@ static const struct cci_data cci_msm8953_data =3D {
>                 .thd_dat =3D 16,
>                 .thd_sta =3D 15,
>                 .tbuf =3D 19,
> -               .scl_stretch_en =3D 1,
>                 .trdhld =3D 3,
>                 .tsp =3D 3
>         },
> --
> 2.43.0
>
> base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
