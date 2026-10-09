Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8233D8912
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 14:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556810; cv=pass; b=mEP29PEtahqgNaXjajwD0y1F3N94Do2fongO0FWqch660tZFUJ4vCAtdI1UKHoRLN+MLNNr7NFJw2HBrV25vttmBWZwBy/Mo2c7xtXMep3hroPiHGXQ/thJMXphmhlTFE+AKQf5XGWpAjsD9A/UdMAuC+e0vlfhCGkT2hK5pdIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556810; c=relaxed/simple;
	bh=JTPddtxrW73Lrd3byEH3IKo8/W3YU2i7GToZvzEj4qo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k81BSNtQC/6xBfDSs1UULYr++JxcfZkH96+xonGug6lT7/MFo7XzOKD2vxIBfWva5WyDQyF+p4vxotaYBTvXDIImdF7c+AFYZ0TxSKOYqfm8MMH5tmguJpFGi18pOq9nvut8xJv0vAdd9l6i3uhKSFFSlyezmpdngtMnxfWCxnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEwBJpQF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LqLskn0u; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEwBJpQF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LqLskn0u"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKe4S2408370
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 14:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oI3ezl+n4MiIBxKoGsxgWBJshhguw/mDEnDrtpu5wV4=; b=AEwBJpQF+HZELJif
	+dli8QDseOEB5D1YjoRFgSWX1/nD1zSmvyIr2DpOA53QcNWzjF42YPuXyjjGc7T3
	rAsYcE0oYm1AObdFuuq2NIxV0zWn/UP8e7t4sF2BMTQfmwFZle8LFngFDKEJHaxH
	/jCZbh5HsMG24gZVv7r41JUJMoynbAv85qULvl462KNUajhAeztKnyVI9TDphZHd
	sKIdMGy+AXD9WdFIsdERdt3s4obCzAUGz6hYwWs0eWYtuEXZ1pMIUD7lBRn2p09S
	4BE+ijUjvyIx4tPoNYuuaGiXTrwgsHLJVp+B20rSr+kFAJZ391t7RTC2yzI3yWBh
	g6OxdQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekvca91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 14:40:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8067974so614132185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 07:40:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791556807; cv=none;
        d=google.com; s=arc-20260327;
        b=SCRd4GpySvW48l7U73wAevu+qHyBVnFoPs//8TIpWm4Fhj3KVqyf5FToYpRcyJCIWH
         W8pXmI9dGkWQCfWfMyh2jtmZeUaeQCBr2AJTd3dWp95bao4DnNByTx30yuaUJpjEVp7E
         IF5TKjRZuEhmBKgdcFaIohtOfgriDvMFfOhmhjttQxYtjD7AjajYT9voJJofZOS9drRz
         XDVB1AyM5Iv2764ElACptwyrduw6jx7NpVgcn3FTnzyGYTFT72KcOBYJAEcbas36Veu5
         GZhQIprMHsx9Q0S3IJgZX7319Spa6T0s4Vyh729ASywdh+2ANDsDfkr9PVDRwADD7DGP
         rj3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oI3ezl+n4MiIBxKoGsxgWBJshhguw/mDEnDrtpu5wV4=;
        fh=bJOBQvHJ31MDF+6ymu81GVZAKWgxkQjGGwgXanG+aBI=;
        b=l4KRyUsMAfMLh99iTq8vv2CmijIwpezflwZO7OzYR3qH1MiFAQzcvSRcrBKjYhmOwh
         99BoUGRrjQnvq145E/eVtwXD7nCckLtilflFTIlvQ7Eouj9Rl/nPIYj2n6B3u2b8B5Hw
         IDfiM16cwlgM1Oe3etYQzeTzlG8Xkts9IvliePw8BO3NNPy0guHCN6rIX9tCgtqcYKvs
         io7AAz1kY+8BuAEVhK937R9Qy8PrXt9BuOBdIrbSkKsnLfyDSna/P824nHZgjcXPz8/5
         3vUx+GkgBZ67QJ4l1wBqstk6Cmkr9OvZUMDvrHdIvc8SQaZc1H8UqZKwBQdnCiScbTTz
         vh0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791556807; x=1792161607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oI3ezl+n4MiIBxKoGsxgWBJshhguw/mDEnDrtpu5wV4=;
        b=LqLskn0ubw7IqJ3M3LxtGFZFZtPbyge7R9b3ibonuwTeXLG7ODLq0kofbJAeZYJ8+5
         AFcssqz1PSuGMc/p9GSxSyiv6wLwgRPMePhg1vx36BxEMufiT5d2irrnwGiKUnzz9/jG
         uRrTmvY2cKzw30CB8GqLUFUq0pkqRqNbSTPgjkG4xJtLzVEOGNuyStgSYtoWM2s+Ysip
         7cRud9Uduhz5GCOCjWwP3aa7cz/8jZ8UaDJq3ZGjAuexGcLYmv85eTM7A3h3JRJDSb5Z
         VjyOD0CrnJHou29+cX1ylh53IGvnti1hOfPAy2K+Zo2DvcnSr4YOJ6t46jjDyro+dXm8
         X5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556807; x=1792161607;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oI3ezl+n4MiIBxKoGsxgWBJshhguw/mDEnDrtpu5wV4=;
        b=S57SXigltjpx6e6KG6E+dJa53I//R10K99JK3mE380GaBU50QsA+Zv8v6Y2q0cinCz
         PQ4QbyaIQBiuJyJyUNBlbXeG6kTWRIzONbheVFE1FtvaoxExQ+humbim8JQnd3/RBkLG
         KEeTXAPkNTMH8TA4NYPtIw61PvHRtOOrh4NtRrNeJCLji73ma8J7yPZ/DTXn0sx+Ur6a
         QTHqvuRQzfplMoaoFhBz2dkj3Xds9vcpBN0cu5wVZO9X6IuxzI6KJiRZZbRZfRH+75tj
         8wsnXfDI0P0PSlobIAA65txGZICxREI57h7Hb7e4fxeqW6JJvjLVBgXN/A4xRGNp44bP
         FyTA==
X-Forwarded-Encrypted: i=1; AKwUvBwaYH+AJVsYmHJwGpqrdSRHZO4gHJf4OMv9+IgPaoD583B0+XsPxsgq/WA1dHfQJYB0ePldNt2PyOCc6Fce@vger.kernel.org
X-Gm-Message-State: AFuF++lLrMA8zuHLs3Y9s5C/Ce0lLofi2K0Zx8Qig6NGeVrWL9zm7Na9
	maNpiGnN0rd5TBs3R6i6797PEkyN+2Z2Baov7QffjNFdJU1u+51tenoqGPJU38kWP2ZBzTzAGd7
	BQs7ej3P43Xxix1iCHT53gyCI6+hT1IHZSvoCZDOGcohEZ4HoJkQ3Ks7GK/CdNfDdBW9ug4t47W
	GcflyGRNcsQqQbLtpP5Sb8m0dky93H3YzOSuu32A1/H70=
X-Gm-Gg: AYBFou1XDIIv/B978D1bkXZGj81fkQSa8X0EtAWh56jFE3SU/bV1cnwC7/vuLeVX+zJ
	zYY5SxqgvqAl99opGhba7dKN3XEk5KmnUCUqrNICI3xb43HY9n0QlPeImJiG0o9UK2FmQE+ebwz
	HMfPPZEOUcukL3zbwUD/ctiOHCTmtOHmSYLAJ9W2MzoXRJRC8vg0+tXi1gn4ZYPNtWL2UoyMihs
	IXoLBo3GU/wGCWoDDATdk20aj0wUnHczFAsCQUHFag2jYWODEz+E+NIXm6spVPhFYkaEajxZxJ8
	n/6SPCR3v9ritrNQAGHGpxCdTd9A17aw
X-Received: by 2002:a05:620a:1d01:b0:93e:8542:4f4d with SMTP id af79cd13be357-93ebd2923c0mr307219885a.57.1791556807083;
        Fri, 09 Oct 2026 07:40:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1d01:b0:93e:8542:4f4d with SMTP id
 af79cd13be357-93ebd2923c0mr307211585a.57.1791556806436; Fri, 09 Oct 2026
 07:40:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008230725.3228-1-okerixx@gmail.com>
In-Reply-To: <20261008230725.3228-1-okerixx@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:39:55 +0200
X-Gm-Features: AclHuK-KEBHBU7JnA4O-_Ixe1AIJbaoKZCZKIAWioy0RNObR2nZvqEeX3Rl1-Q0
Message-ID: <CAFEp6-0vi0_xWGbXUxVQ3APvHMsWgX+_AUXvJDs0FZWky73LyQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: qcom-cci: skip core clock rates the clock cannot provide
To: Oleg Keri <okerixx@gmail.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: yvKoEzvVKF3knQPtk-sQu8fGZh2ZLn9Y
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac8fcc7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=BuF8_mXB32IIVKhl71AA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfX8TTkuB+VdLk3
 TrhyVoPeN2eXVleohGlFFpFR4k97y5iLBuk52lV4icHLy6V32JoHXnd2HgXkzejx5GTqP1BQtvK
 P09u5SX2HIxLzY55g4267/THi/kZ7WyzWitp6BSnq1Gu4F+VKtEexSjOQBWt8QE7TvDeXVtBKbA
 AJxG3HoOQcUT9W5DvAN/D1LfaayypnJa8XsUjBohwf3GAU2eAHCQYAPQa1kP7X+RQwb+LQ+MHOW
 hQihVLX9KvJ9hYGRhP/V/eJDyZ8pKjd2JnfmeU2VIsEP49YD9eWp0mONX5t0hp+tPJxPW3XOSNv
 xxz1m3MTyUG6ykhRGTTCnVSmiLaMH8MhicGtzju4nu4Kw/KQ/7cB4TKsJvD2nAR6e+WrKFfegMv
 OcHzhPJxqBMsiqqXoNty+G9t4Fk3JunrrijjXCoNU3stcv16pqleBpuV5CLrwOAIbLgcwT88jMS
 jNDrs9jLF9MJLLj6fNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfX7uqs33tlFvrF
 U8qMxJa/RXlw3RGsjAqqsNaBN6fAFfKTZU95aQl0VN8vrND3g21eFaqIeVz6l2gno7IO9cp3oSO
 xmUpiflKBVj4V0TN5kOg1HoDSbaf8zo=
X-Proofpoint-GUID: yvKoEzvVKF3knQPtk-sQu8fGZh2ZLn9Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090058

On Fri, Oct 9, 2026 at 1:07=E2=80=AFAM Oleg Keri <okerixx@gmail.com> wrote:
>
> cci_get_required_rate() picks the lowest rate that has timings for every
> active master, but never checks that the CCI clock can run at it. On
> glymur, sm8750 and kaanapali the CCI clock table has no 19.2 MHz entry,
> so the request rounds up to 30 MHz or 37.5 MHz, the timing lookup for
> the running rate fails and the controller does not probe:
>
>   i2c-qcom-cci ac16000.cci: CCI clock is not at expected 19200000 Hz
>   i2c-qcom-cci ac16000.cci: no timing for mode 1 at CCI clock 30000000 Hz
>   i2c-qcom-cci ac16000.cci: probe with driver i2c-qcom-cci failed with er=
ror -95

sm8750 and kaanapali have a single 37.5Mhz frequency point which
should not cause a probe failure.

>
> Only consider rates clk_round_rate() can deliver exactly. Glymur then
> runs its CCI at 37.5 MHz, which has timings for every mode.
>
> Fixes: fa1eb3af12fa ("i2c: qcom-cci: Enforce the required CCI clock rate"=
)

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-q=
com-cci.c
> index 6d8be7b8b79d..289368c00fe4 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -586,6 +586,9 @@ static int cci_get_required_rate(struct cci *cci, uns=
igned long *rate)
>         for (int ri =3D 0; ri < NUM_CCI_CLK_RATES; ri++) {
>                 bool supported =3D true;
>
> +               if (clk_round_rate(cci->cci_clk, cci_clk_rates[ri]) !=3D =
cci_clk_rates[ri])
> +                       continue;
> +
>                 for (int i =3D 0; i < cci->data->num_masters; i++) {
>                         int mode =3D cci->master[i].mode;
>
> --
> 2.55.0
>
