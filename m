Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792760033;
	b=aMPOzWWOkl6Y9njjTv7UXBDue7Mbn1XJiZnZR0hLs786Hiu0FsGnBJzySX3hOM1v1CWX
	 EIq9IXc4Sdo4Fq5CRkpsb4zRY3nBXU12flEbMomeVNuhLHFrhyaRkJrx/wYw5IUScmtvE
	 Ax8L+ADtyD5UkVVc0kNyWvNprY2fLaedABSA6O1NXIs4I8d1bMk7w4aJIK5yz3fqyYj2J
	 xjHGpRkxZBV3GD8JASsyXNzUJwwfKMw+ON7BKGwkdU3e3vF76I9H+8yEEhQ/xI3xyU7Ki
	 ZsceyCzfRHGjUNsTwqbdNX7Bn1N5bnuaH4Y/wfeEFDfBEoX6w/o31W5TJTjs+GW7B8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760033;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZL5atUgQF9xYrzrdZd3zMmp+VtVfbiUmv/5LK8lZfT4=;
	b=YGG4jkRbjdkebE3r+9vGLZ/xJSn0bR1hBMvn30lqgWcBNTgacIfFKBQbK7pP9TLOFOG7
	 /a96Hr87MlSLWprBwB5dknRzBcEFspYrgPLqi2zEvacE7s6N79alyOs94y8UIEAzxNeia
	 qT6XvGfOhinMHR2JGKZeVpCuAvVtvGF7w9fKSFCM8o4IzotJxq8rMwLb0F3SIjkNTiXOd
	 lH2tKLa+tNKpUchUxKosdl8JihLBmGyxj0KBQbWIuCv3LuyeFIbztoLvdnVSIuBmEcEO3
	 kL7ZQ58m+pe4l881PEPfUWphDWIoM2+tdQGKQNH0aM1op3tsEa0C36jmlzIAxgV3HGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k84ztsh+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXls9Rvn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC15606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BC15606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k84ztsh+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXls9Rvn
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAUbN1948367
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZL5atUgQF9xYrzrdZd3zMmp+VtVfbiUmv/5LK8lZfT4=; b=k84ztsh+ot53pSBG
	jiTg1dSaK+oMQc9D7xA+HgHuOZWpuLp3Bvqo13JWoqTssTxPnu3DiCT7aw0xyXnE
	RT6y4OMl2AuO6bb97phV2Q2m27M9GBi+txFNJy1PnbrbtbWgGuBBy1jGT2o2Glyj
	VtnyZKcroVaq5xaitlEzPXctl1jOXjsw6ATbcxQefKFGiZrgJnoA/18skPLXlTuh
	i4HYKYHjOLvMbY5rmQLJ8C4xlHxY5RgSJoXH9e8lf1AONUjVv0nvRMQ6P1Yh8p4g
	c5EmDXZp6s25pmBjf/L5xFz5xkwVWZ+6gPkBsrb/Ycyhvxa0apN/1TYNBwIMdN95
	ff14Kg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtur8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:53:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844e383so157537085a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 05:53:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792760031; cv=none;
        d=google.com; s=arc-20260327;
        b=LIk0NeZW80uB1t0La8I1Ls3Y5pMEEWSuHroZD1mKes4IFB/BO3Ha00EE0iSL3FB1Bh
         5VJQdC3j0dhCk4K7u2OFDD1hDerYTsC9vgeQ1I6y5GKzBu9slZRZ75AlWkpA9g4lU28c
         QeBCJSOyNGl4uQB5s3nTNEccKv/zk4+VJlSp6gagh2B1V2o5/aol2wwYTPdCDR5kc0jY
         VHBrS83MZKclK6bZbh3/Qe27KdFDq1HIVZinwTIkWuV+DBYk+YkHC2C2n04uCTW1uRmE
         Jrmgz57jm05QvMKVwcLLkFhJUWzDwuwgGdLX6HPEmA20YRlu0lYrSPDjKFtZFymU//ut
         6Y+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZL5atUgQF9xYrzrdZd3zMmp+VtVfbiUmv/5LK8lZfT4=;
        fh=9lkeUeg0iDL5/IwM5r9UazmY0aFw8kTdInfM88mcwB4=;
        b=V+PXU0xtNW6cEuyD1/OOD5Nv1EJWDMZ7gs/GGIHg9gFXKcNgQ+73JF1cnEelDtkJ3s
         rAv3eTh2QcAVaTTy6xwjIsKxtF2vTHo5pGX/TqO+tNQKw9frkqnGGpQvnWP4GKPGTQKl
         3GvLcQq0Q1Lo/0CulNs1VLoGKSQh8T0XN9omb5fABwPq9bbB7HJeg7VW+n+0BGtAfi8B
         dNT4n8viGZPw0xJZ0Ax5SNuHjWgJ/a6JFlsTSVcFl8/9VM6n60QxJA8PRP8rEXUQkfq6
         Kq4rwt8nzNcdA0yH/zXU0hoEKRsUyMXBKCDPD/z0DomH9CljXTWCldEVXdafpMjlphlF
         AM8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792760031; x=1793364831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZL5atUgQF9xYrzrdZd3zMmp+VtVfbiUmv/5LK8lZfT4=;
        b=gXls9RvnIYR2YK5cmUlO7e3CR8/MOnt1zZSp4Py9+smXc6q/yEf+3cA7UNdcAvtl1z
         4mTmhog5wJzLRPuL6fL79LbvMHtJxMq5jKJDzFHPN30fmTlGssKoMYe8iaSV0pqELicK
         zjiQfjKajbOkIlNR/miwiSjSr57KDQzYhYC8qEw4oiaLO4Ni7CEOJkTMrvhm8zh2FMr4
         h8u/pD7gZMQFDHJuLfRBQhQ5n++Ru+3dUKVwyjW7epYIEkUR1ZqenmYtx+bXJyLw3ytT
         zC/UbzFFWX+BFsZXhIzh73yMbKpXQnQCb9NsfYF9RK7pKqXsn+Zie9geyE0xn6Jvr5Kz
         zB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760031; x=1793364831;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZL5atUgQF9xYrzrdZd3zMmp+VtVfbiUmv/5LK8lZfT4=;
        b=OwjRI2lUQqappNi8ynr6RwHpJPBGl1kQoPvVFZRTOCone6QzSNA6taazspUR7+ITon
         QdkY2tWbm0IUR3XwI+eZd8A6wjCeR2WFOgH/GA7GEgIadBn2PeHYKecRq7sjiDaEcQdL
         572Wdh0QzsSEpXhmD19gVzWBMmVqSSmbXeTdR9mNuus+7XHNVCA8bfr+Z6QPCMZAlITY
         qpC873/9cDh1bXoAzFUgqK1Lo/BGMFUzIqc/l8hxRx3STRBhF3q56zKhYe1Ei/NmjxUP
         c4LSTwbzncIFxxAdUm9p/67YP2sXgvIYN+hBPZ/Se2NESnZqKxpeVAEXgXIbgdo8yZSb
         sQhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiBzHapFtC3PcTDXSkUPHHgaWTwuI7j8SGzPpQ+7Tejb8Z8cYx/+25Wbt/1acG0EonI2c3O2xJbjYkmp8O@vger.kernel.org
X-Gm-Message-State: AFq9FYLmiRGj4dHOzjjaGI1vh3WOHh7haTkJkiRtkLpY8AWfuR8NK9Am
	wq2MMa+s/WT+nsZAM1EMtRZXQk11R9xTdTQh+935h3LxFSxei2kXHTLAfDtt4cBcUy49a1dgnmI
	nXqZ7gNFriUoS5eNkUTHcPA4a7mFaxTzZuutDhoMzl48MhAGjiJhK1F4FC/aysyOgGypcX682Kx
	XE3y5/dE5Ou1uOhMeaU6c29wYvD3jA4LkSzrAvpZ8hntw=
X-Gm-Gg: AYBFou17+EqVtgf2ADGKt3YA8qx0e4nA+bXXkOIRjZtzRzL81Ta2p6dTdAzlxMXDSTj
	oJR3y9mnNfdbQUOtH9iwD15DcTH09ntEVBZMFwH3MTeURIv1LF3hXTioUlk9rbTGPvaCis/rOeb
	1rCz0zUGe+cimHeDuoujc/87pJvxUgiF6xnHNV3aHcPTFw6WZOFTOqS0hEaEr2ba8lijmjaGF0+
	vuyDPeO/6QcCqS2AMwb0P7V0QOLhRNdTHpebEPFxPLa8wxcXN6XuL05JRQSuSF5Gu67Mnpq1K4=
X-Received: by 2002:a05:620a:2608:b0:93e:7ec0:7c63 with SMTP id af79cd13be357-93f6f9b51femr330275685a.57.1792760031139;
        Fri, 23 Oct 2026 05:53:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2608:b0:93e:7ec0:7c63 with SMTP id
 af79cd13be357-93f6f9b51femr330270785a.57.1792760030624; Fri, 23 Oct 2026
 05:53:50 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022071418.26895-1-bjsaikiran@gmail.com> <20261022071418.26895-3-bjsaikiran@gmail.com>
In-Reply-To: <20261022071418.26895-3-bjsaikiran@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 14:53:39 +0200
X-Gm-Features: AclHuK-A5Hp4e6c3qITTZozdBZs-UH-SXsDSTVo8_muXWDLKvdme3VTjvVNKGIQ
Message-ID: <CAFEp6-0cFMSRcTsgOSvep3unzb+vwFGTRaQCyt8eYrw=Os2L=A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] media: ov02c10: Fix sensor power sequencing
To: Saikiran <bjsaikiran@gmail.com>
Cc: rfoss@kernel.org, andi.shyti@kernel.org, sakari.ailus@linux.intel.com,
        hansg@kernel.org, bod@kernel.org, mchehab@kernel.org,
        vladimir.zapolskiy@linaro.org, jishnu.prakash@oss.qualcomm.com,
        birk.skyum@pm.me, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb58e0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=WXF1KB85Zuouuk2w01YA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: FngA3HvcID3tTNtl6QmxwDm-GhCSy24s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MCBTYWx0ZWRfXw4yYZzACMmd1
 7dG+mElx7P/dFa4IBtgTCSPYWQ4akEp7wWJ9KciBfarK6vT6PcDduBSb/FbSSIpjN/h7ma3Py93
 x5tkXLpXFghHFgEd/0xz6NRjWP1L+nJn5zrsyahP1ZbNzeMy0qtGqeUXY9eqChLYmGxh47ZwZNo
 mMmC9fYWG58z6wIb0BxoPl/odk07NnSN2ebxcHl5bKgFndV8ZF2yr4xJjFR2kGLy4TtQrprQlQl
 1QpM2PZOYM6SXihsKi3+m+vy9Hf9nPVLC4XjG+GKYxinlSkZ6sAMCh0UOxtd8L2VVbTMgQ5JsJa
 CO0f4LRG8wJx+3YvqxhgBxlBLiyfEw0Wz+8gGe1KNLbiS7XRlIXQ59b+qGSuoUTYi3bTyfqwTcD
 TQOmF0z6+4xfVFOcmPuMNQRjD4z9S5VOtyfA27ke8tQkuvAQ71wrjpRcr34NMg06yOqqvFqXZL9
 YK7SyaPJTb6X80pNDxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MCBTYWx0ZWRfXzg6vD714+Ge9
 O2bbr+ytWmGD4Wb3Trya0FfWM4G73Q9PwW5yQ6QhmoUeHZ7vQmhn6d+D749pY7a0oyB851LLO+I
 PEIRr/unK3Hm2BH5abx+Y9UucyG9mvc=
X-Proofpoint-ORIG-GUID: FngA3HvcID3tTNtl6QmxwDm-GhCSy24s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230050

On Thu, Oct 22, 2026 at 9:14=E2=80=AFAM Saikiran <bjsaikiran@gmail.com> wro=
te:
>
> The OV02C10 driver enables MCLK before the sensor supplies and disables i=
t
> after the supplies. This can back-power the sensor through MCLK while its
> supplies are off and contributes to camera brownouts on the Lenovo Yoga
> Slim 7x.
>
> Follow the power sequence used by the firmware on this platform: enable t=
he
> supplies before MCLK and disable MCLK before the supplies. Hold reset for
> at least 1 ms before disabling MCLK on power-off, and wait at least 10 ms
> after releasing reset on power-on to allow the sensor to start up.
>
> Update the power-on error path to disable the supplies if enabling MCLK
> fails.
>
> Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>

Should it come with a Fixes tag?

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/i2c/ov02c10.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index 221cb93126ec..42aa43ea0a22 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -661,12 +661,13 @@ static int ov02c10_power_off(struct device *dev)
>         struct ov02c10 *ov02c10 =3D to_ov02c10(sd);
>
>         gpiod_set_value_cansleep(ov02c10->reset, 1);
> +       usleep_range(1000, 1100);
> +
> +       clk_disable_unprepare(ov02c10->img_clk);
>
>         regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
>                                ov02c10->supplies);
>
> -       clk_disable_unprepare(ov02c10->img_clk);
> -
>         return 0;
>  }
>
> @@ -682,23 +683,24 @@ static int ov02c10_power_on(struct device *dev)
>                 usleep_range(5000, 6000);
>         }
>
> -       ret =3D clk_prepare_enable(ov02c10->img_clk);
> +       ret =3D regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
> +                                   ov02c10->supplies);
>         if (ret < 0) {
> -               dev_err(dev, "failed to enable imaging clock: %d", ret);
> +               dev_err(dev, "failed to enable regulators: %d", ret);
>                 return ret;
>         }
>
> -       ret =3D regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
> -                                   ov02c10->supplies);
> +       ret =3D clk_prepare_enable(ov02c10->img_clk);
>         if (ret < 0) {
> -               dev_err(dev, "failed to enable regulators: %d", ret);
> -               clk_disable_unprepare(ov02c10->img_clk);
> +               dev_err(dev, "failed to enable imaging clock: %d", ret);
> +               regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
> +                                      ov02c10->supplies);
>                 return ret;
>         }
>
>         if (ov02c10->reset) {
>                 gpiod_set_value_cansleep(ov02c10->reset, 0);
> -               usleep_range(5000, 5500);
> +               usleep_range(10000, 11000);
>         }
>
>         return 0;
> --
> 2.56.0
>
