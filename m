Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795427638;
	b=nLTU9ffXpW+J4wf/MKpJ72szILBGcCvZU3B5UTH+ZBwLjJVe9KyjLwzEzRD/c3Lt0vSF
	 K4mJnoHn0TssaHODgYyWv3IN3vo9/vl7A8lbKmBzwbIqH8KvdrXaYTGpxDSD+Prfvbqi+
	 238QwcoV+Io1/EDOauEd/gQJ0yryWTjc9iyDyvkulR4yAwmjqDKi0A2pj7LHDgvqBsXw6
	 qVFU0mCt72xZbdEPOZYCmHViJ39wr4HJ7Yz7DtewvRSgiAJrOij3Uul2I3MAEZLFlCN0f
	 1xI/ygcPYXNckPdpwkYLMXpvR+pSKaxryRQgXIEg61J1pWm3NUnxcNb7CUwgXsqDdUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427638;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ieYuTps+JJgKR2xYVsY0PIVISQxx5gD2PG31i9Q69t0=;
	b=iuMKG58bTtQ0pTlHXUh2kBGlAC+SP8f5VLh7WtaDjUfYfaRaxhUSvOClQaPr2bbPVUJZ
	 KbqTFD4nNKEL2yTmjP/nj2ISf35w84PAKewp/24ru5TjboaiSnQN9pbLZnCg+kSOCB/y2
	 yIHwFqymyCCWwg4c/oLAfY6CHlj1D+RdlcHUbmE9I8/NpwjA1lsPGx1H+WaEy628talkV
	 pNIsrDYRXmjC283eHH71qk0qI00LuswFWxI4e1keBEFlfVApf+ERbarPHxt6FzFxNifT8
	 Wu3sMF6hSll+jnCPAnUZTKC8cfF7UBdV978UXS7w0u+Y63c0w+x4jGXhama36rBe5pg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g+8JwThg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f5gleDKs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E883A606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E883A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g+8JwThg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f5gleDKs
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9IYwk3490935
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ieYuTps+JJgKR2xYVsY0PIVISQxx5gD2PG31i9Q69t0=; b=g+8JwThga1A07+MM
	qt41dcAPLLfWRynVfA1/SkllOOAuAE7RxPhiAJdOhCwiBSLO28meZMWD74T/sjsg
	14isrZUTn/he4iGnoF2Gol5N2lNzknqDsu5HSysnGpV36C7RbSpA5G2Br0spULqf
	eh6M1HNF1qxhftPLrFXpGI654VGIYnVhoQja9CfiKeVE8ra/QeNBnvrPlrzWAX8k
	NNYw8aw5LEAU4JQUSSVxqcN52gYXxe/0iCmRD5Hhk/frWM8lPJxIQzzKqKfHqWFk
	ZXhDAWOUxaJxq1zzbEMYOCdVfP6Z7B3jgt1etkeY7uS75FMhMxkUAjKOVbsE5bIk
	Zk2opA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsh0ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:53:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94960bd17b5so525972385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 01:53:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795427636; cv=none;
        d=google.com; s=arc-20260327;
        b=i4ckEo1aVSOrLjJGatv0pczaTqiJCmtvkU9CDpeOsWLGzC+Ydbjgle0DsbebdfhKMi
         ke36kvg5ZKrXbNyAr1kzWpRt8IAhzaOOPRxRY+gJ5Eznw8inVioXbWIhhyKukOvk+CWT
         WxCi3r+dQZY9fasJU/sVtUhfZkmOcnOtFKFgGInwhn1XsdgxtADra/oMdh/3yymFQBb1
         nSdxmG7+1gNn6Z0nOXG74LuYbfdOAvAQ+v0E3CqR9rTwKi2jDJdhbRJgoevEgPLNAtmy
         w0La/jkDOwkOPhleL2UvQKaHDOHUtBE9l+iSijkqfgCgrfDxO/JXBXQ5JiWJAxEJf1Qk
         vP/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ieYuTps+JJgKR2xYVsY0PIVISQxx5gD2PG31i9Q69t0=;
        fh=AJR+5RuJvGwIBlbI5uh/8WwVE42UrNXFw+0xd31WN/Q=;
        b=dUXyBtDz7QHxL4pVHdYY3dw2DHruQ/dt7zVKmjH5vEvStw0JUKDovt5QviM3xDHrgj
         9dM33VNttozjhJyiLMfYaV6KhWuSzc+9ILl6ugHu83TJ0HaiHnM9CzdvThuZGjeHZ7Do
         qbKHWFbLtPwFh6T0fm1w/f3z0OZSB/+wBKnhezRlb4LMTpcNefn2tGep9B7nk8msXclR
         wuYatf3uD9AgplUjjeAdM+/lficGRs3p3bHPDeMAV6D5Uoo1dc4QFVUfds4HYhsrui7s
         MlY5BEg/IISdijr/5FYgtaNaQzPVTrSoNjjs4TEIk0ok63PGlLybMR75vxn/OcwlOtYz
         CQlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795427636; x=1796032436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ieYuTps+JJgKR2xYVsY0PIVISQxx5gD2PG31i9Q69t0=;
        b=f5gleDKsgLIO9vtM4URYt4Pvf4aSC4ZaaLq8SuRanPgErj7tcyJ6lwgcH7vH250+M8
         Eu52+eSWSW81ftDYQwdMLiiKlaSPTA9hs1yPNwj1qGOQ+gRcxL/v2nmpfxMNnwn/Njz6
         OLD/7MShbHJ7npz3YnO5Jkz3ByFXk9Ze3p/qnvGi1q84lZp9aP24RNQt+1y4a6kn+QD8
         DUdfw6EljXfKbe4vptr50LfbNMRTu3K1j6Xpg7ZWDRkrxKL9PEnT5xExRQ93uHE/C7GG
         xfHS2rB82ln3wRXtn55XkoUgRfExwnApyjClFWwY/hgsO2g3c9ZttkqNFQneRVV2FfjM
         FsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795427636; x=1796032436;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieYuTps+JJgKR2xYVsY0PIVISQxx5gD2PG31i9Q69t0=;
        b=bhUf75bAnpqmXer2gO9hQSYhmiRtpTse76KdP0+y5Te63FsDjbW//UiDd4OJssaDEr
         J5oYmLfUU3vETxxfo5MNndCmcV3TocA76TvCAXUYItxd2ItAtUoqOywdVtukJIb7jfV/
         jljGk3nB8ZtAopuEsbiZOC1qDRSPB1BuIHfq4hGa/efo7xsfrdF7B/FOJJzEFo4wEq6m
         8udsxbCj9SO7xU3XuCOEXKJgEBWCLiTVuEokIEQkcBUbMsbjvpD2Hqnoa/EGl6JWlXuh
         S1/X++q2Y2SWLpF9/2drFQv/rbFRLBO1ZjhRwyQCmbbV6LRJncTTttBoZhNxpr8OIhDv
         3LZA==
X-Forwarded-Encrypted: i=1; AL+hErG17umhwnV8HlAJ+vxzUvj5FrMB4llwPrGsL/MbX0FSyVxOnRxyFBJCZULb0DlMZaQCLni7w+eCAAw4Mt3x@vger.kernel.org
X-Gm-Message-State: APuU4Z8Oh9rp6JuwE/3OO+cahilLC4GfRWj2SXABIfuLxV3fCg2g7zEr
	pKHxpG/iCOGRSCkPcdzMblPUd9LjktXmXayDOHtGU/ZEMhpVQ78PdrLCiGPeZocH+7L4JnBn5DX
	30npJXpiQPvVE8l/BetYPAaefX5AJgrVi5Q8Lm2KYtHlnGDiLWrvMyYmCh5quTFNMKxgip6DAj0
	5twAbmdTUwm4rY/Zl42rI63DjYQuLV97ABf4oCdLQ8phUB5Dc6wFJ1DA==
X-Gm-Gg: AZFdTZcqm0p47qkfUhSYpM4Cx2oJU0p2ZsB7uBsdx+3xGmNN80ZsCQfZIquA4SsjxuA
	eAlMN8Sa2NnbJxj/N6vhoXOsG5UjVwdKSHfbEHnhHeuvn9KQ6nk3vpJfc0KgVC5DRzJT9StAPf9
	p3YxfvSsecacf2Z+06UVZ51JftHydmfP1eg8czur3bL5XKBa0L40MSTLsxK38yVH7Xg7QwfIkrn
	aWaIH+qsaV3027/bBlyH3S+1uqTDW4jDUzNfca7++cqsdnCTva9J5pkDB+1cQAzmT0Nll0AnpF8
X-Received: by 2002:a05:620a:4396:b0:949:7c43:d54b with SMTP id af79cd13be357-949ba98df47mr1823199185a.30.1795427635880;
        Mon, 23 Nov 2026 01:53:55 -0800 (PST)
X-Received: by 2002:a05:620a:4396:b0:949:7c43:d54b with SMTP id
 af79cd13be357-949ba98df47mr1823197485a.30.1795427635411; Mon, 23 Nov 2026
 01:53:55 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com> <20261122-camss-fixes-v1-3-9df4deb87ea2@gmail.com>
In-Reply-To: <20261122-camss-fixes-v1-3-9df4deb87ea2@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 10:53:44 +0100
X-Gm-Features: Aa3M54p-9jx9h9N90YDgJyYG9vBUNQ4vxTHnFd6llwQocvVqp849Gk2savD9K7w
Message-ID: <CAFEp6-22Mdbqxj4wZOKo2DJ32YkXQsyB4MGtojx+fsjy7fzXtg@mail.gmail.com>
Subject: Re: [PATCH 3/5] media: qcom: camss: csid: release parent device on
 power-on failure
To: robertijtsma@gmail.com
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b040d34 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=gN1Sahebtm5x3it9UtEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: SyPeEaB-XqjTcPnrcoFKjTQPRM-d3QFL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzOSBTYWx0ZWRfX2TtIZWhHO9Ru
 f1Aziu6WUzIcKINL8dVpft1cFhsZp9xHhnO5yiGPyUJPt2jKeBYMuiijyRzr6nUgmyO5Hi231fi
 JJDLIsqtwq2RNkJc6BHJIQyruq7Oei6TOujPceg5N7okJQfsjANf5fLx5scYMUr1kXtdM6mChQS
 TwKSucsb1c6WmbnvT3r6kZ7XDKY/ItlQ2GDwaCcHk+LRIAk09WdA5KhXFXVUWNQ1hAzWXsW5TpT
 5EmNM8/OjeBeuhnPELEDVTZf2JzVKncmUMrARq6Y4xckNr+JWG+3raJHEhNMp+VwTqjbnaVoOZj
 Do+SH6RaiQDm/oIpwGuuDQl1Zo+S0mNaJyFTBOBSGs/CDVVZIgaVMMBm6i4j6Btm6v/dla0k/tb
 wEjWbhBwVBcmZNnFM8D5kBw+BMWbsjVzPFtiiRvOmHOQXWqwvIOaXbZwkma6viy+tU0sZNZsDgD
 F2hQAmjlhJXlYYdkaYQ==
X-Proofpoint-GUID: SyPeEaB-XqjTcPnrcoFKjTQPRM-d3QFL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzOSBTYWx0ZWRfX5rwn5ixzVsgd
 0VnqlihR79l706AOZPHvJiK3A8pOw6UUCJpxDvYCCsHlUmDto+VCz1YfMMRAkBpsFANWeYWhxeU
 eq/uRqFimORlHN5zAJjlYWOy4ZkwgFM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230039

On Sun, Nov 22, 2026 at 2:36=E2=80=AFPM Robert Ijtsma via B4 Relay
<devnull+robertijtsma.gmail.com@kernel.org> wrote:
>
> From: Robert Ijtsma <robertijtsma@gmail.com>
>
> csid_set_power() acquires a reference on the parent device via
> parent_dev_ops->get() before resuming runtime PM, enabling regulators
> and clocks, and resetting the CSID hardware. If any of these subsequent
> steps fail, the function returns without calling parent_dev_ops->put(),
> leaking the parent VFE power reference.
>
> Consolidate the power-on error paths using goto labels and release the
> parent device reference on all failure paths.
>
> Fixes: c5af8db84c01 ("media: camss: Do vfe_get/vfe_put for csid on sm8250=
")
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csid.c | 48 ++++++++++++--------=
------
>  1 file changed, 22 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
> index 51f2090..e67edc3 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -682,7 +682,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int=
 on)
>         struct csid_device *csid =3D v4l2_get_subdevdata(sd);
>         struct camss *camss =3D csid->camss;
>         struct device *dev =3D camss->dev;
> -       int ret =3D 0;
> +       int ret;
>
>         if (on) {
>                 /*
> @@ -696,44 +696,28 @@ static int csid_set_power(struct v4l2_subdev *sd, i=
nt on)
>
>                 ret =3D pm_runtime_resume_and_get(dev);
>                 if (ret < 0)
> -                       return ret;
> +                       goto err_parent_put;
>
>                 ret =3D regulator_bulk_enable(csid->num_supplies,
>                                             csid->supplies);
> -               if (ret < 0) {
> -                       pm_runtime_put_sync(dev);
> -                       return ret;
> -               }
> +               if (ret < 0)
> +                       goto err_pm_put;
>
>                 ret =3D csid_set_clock_rates(csid);
> -               if (ret < 0) {
> -                       regulator_bulk_disable(csid->num_supplies,
> -                                              csid->supplies);
> -                       pm_runtime_put_sync(dev);
> -                       return ret;
> -               }
> +               if (ret < 0)
> +                       goto err_regulators_disable;
>
>                 ret =3D camss_enable_clocks(csid->nclocks, csid->clock, d=
ev);
> -               if (ret < 0) {
> -                       regulator_bulk_disable(csid->num_supplies,
> -                                              csid->supplies);
> -                       pm_runtime_put_sync(dev);
> -                       return ret;
> -               }
> +               if (ret < 0)
> +                       goto err_regulators_disable;
>
>                 csid->phy.need_vc_update =3D true;
>
>                 enable_irq(csid->irq);
>
>                 ret =3D csid->res->hw_ops->reset(csid);
> -               if (ret < 0) {
> -                       disable_irq(csid->irq);
> -                       camss_disable_clocks(csid->nclocks, csid->clock);
> -                       regulator_bulk_disable(csid->num_supplies,
> -                                              csid->supplies);
> -                       pm_runtime_put_sync(dev);
> -                       return ret;
> -               }
> +               if (ret < 0)
> +                       goto err_reset;
>
>                 csid->res->hw_ops->hw_version(csid);
>         } else {
> @@ -745,6 +729,18 @@ static int csid_set_power(struct v4l2_subdev *sd, in=
t on)
>                 csid->res->parent_dev_ops->put(camss, csid->id);
>         }
>
> +       return 0;
> +
> +err_reset:
> +       disable_irq(csid->irq);
> +       camss_disable_clocks(csid->nclocks, csid->clock);
> +err_regulators_disable:
> +       regulator_bulk_disable(csid->num_supplies, csid->supplies);
> +err_pm_put:
> +       pm_runtime_put_sync(dev);
> +err_parent_put:
> +       csid->res->parent_dev_ops->put(camss, csid->id);
> +
>         return ret;
>  }
>
>
> --
> 2.56.0
>
>
