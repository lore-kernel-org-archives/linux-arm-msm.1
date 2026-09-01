Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C450D471CE2
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 08:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250124; cv=pass; b=u4ixcicW63Wckudxl77iZcryoIrKtyhZgOwnfijxmUMOI90qVgALUNGpd6qBk0kcfut/8bm4Oo3Os+4T60iF87RGTo4k35jv3JN18gij2WOU6CShF7MOjL4RzU09vJEGJdMh9RSNFeV3SptrSXcS+e6VysOYx8/JPEjM55U7HV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250124; c=relaxed/simple;
	bh=gTWI4BcWGvGEt450M4Ez2b9tan7P4TWcMjFJL2RZnHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SYhJcuVCIaZZj+GAeczF2l6SbbaLjjTIfFCOUFm9oTGOXTBX6Y+SknYKueizP9xKNnyfUMttU9Iv8/9591qNa1O2ALpRjFX1+Hp7vZlxD+OPswzpY/8nXJDwuEHLjnYUcNvpYULTHjZDMzkow7AKjKDNilFFurXizDpayfVjNTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1XtT6Dc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H8XEq6E8; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1XtT6Dc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H8XEq6E8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179DLJ1892396
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 08:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ulHqb7cE1CIcN7Qr2Yem28jNDTGlPMQf8e+dXPDEHi8=; b=S1XtT6DcnRt2ncR5
	Ed1KGoJXkVE95bjqMOdjZ/m8mXLDxO1J2H01oc32wKzDM07kiKoIOBUtyGyUC5IZ
	RSRnmiVrcdK4NAknwdnT5NbZgUWwzSL8XW0F97ix3+YcpvRzR2ymELBlpc/06oAA
	5nZY077nEinIRvaj9mf7/b5hq+IPXvGlkL03YvpQqSFNQw3HDGivzW2xPwCVvJYm
	0F8hUQmDiVjHihE21dce7danVCDGerazQQ1KYDUtKHakjBQkkY+UqUiXRjlt2V/d
	qDi8xZSQQTuTWrFDaH8QIX+BqUtooKxOJXfpbUmQjorRDlKWCaLkN3Y9Czip6ePU
	2/339w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7c98r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 08:08:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so715771885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 01:08:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788250121; cv=none;
        d=google.com; s=arc-20260327;
        b=Dbm9Jj4cBFHRn+zABMMp4g/DRY829XhX9yF+g+mKvHaaxLIb7XPUfb0M9RflqNSOMg
         lRJ37dALYcD+uAG2HNC9HYVsuHeRuzlt05zGVjmUBH7JbfnkEBCjkeHsxaoABeBCEeLn
         R2LOId3i7enKmIewIfxcWr5DXczoeBQg9cHlItb0W8Z3kkhjlam3Oc6rCkYxFxsFlBDU
         qn9I6h07zTgJcDxySOu7XAEgldv9xVzfzGCdCpn+ZSPQsToCPrVro0FfeTfEnE8DwSNP
         v9lE5vbygKnKmWR9A7B1TF3EaB7WJSbrbV63VAgs40SdojXTiALdulZxc8OnP5/lj2yP
         qzQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ulHqb7cE1CIcN7Qr2Yem28jNDTGlPMQf8e+dXPDEHi8=;
        fh=d2ozA/U8m8fHEQH7PzrizdGMM6eVjmbPLF4Alm2XQw4=;
        b=EoZQxr2WktFfJ1TqbU+bck9EgBvPsUT0/ZcBdPvLd2cAhDAJQygTR0QbGxy/hVdcYo
         al9p/IXS9iajYMBSNBcBdzLAxJQsmuSRIYtJ8XjwLVFqwqHxJJFXnZFWluordjfhc1jo
         QpCPJ/yGq8xUFiw3ulA6nSroEg4ZRcTiDwBsi38N+YYNpsxG/z4sQxeCEkEbopWIxo7Y
         LEbQgBj0HraABKpmkGsoP3/JqeylfxFUwzK+Qb/eAoVlDTgNY4g9ueemZmfJeVqRchbE
         oOXj4FiOCmo8zPn1ao1S4rwD8hexrDJ91FT6g7fRlX3hVkP+0utKOfKoX7tRkXssRDBb
         A05A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250121; x=1788854921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ulHqb7cE1CIcN7Qr2Yem28jNDTGlPMQf8e+dXPDEHi8=;
        b=H8XEq6E8ZuvSTyoIkqnNuirO9pnIFmc6ikdYouUU1OPAFM+yVqthioRoeI/TIYcypY
         WvEoYdqWqsUW/a0np7ZLvECOHZZei66L2XoPC3Y6dO/vrWruGhOQB0/XZ+zhwc+JXCy5
         qGsQTvmCZR/DxtbrYZf5QgNynq0vqMY3WwcUGtYqQLYFxA1yH55OdsEj1smmLc9zwrbe
         vUZEMSPl8c0YwW2AQp4SghC+1HiSs+3c11Fibqgz1my4blrm1O6T6/NBEYj+X1rVbrO9
         loSURTFzwVtaCwBC3MkFIJkn/Sm0+g/4qNiZOu1LqLJc/3Q7X7Rg+ert+WNV1gCKXMug
         NiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250121; x=1788854921;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ulHqb7cE1CIcN7Qr2Yem28jNDTGlPMQf8e+dXPDEHi8=;
        b=KPCjTRsGReXWXwLbQfm3ZxbxvUWzjcsfZdkPIMEu3ye8wurV1YKAIHhZkkWpUdh98c
         W6o79DQbOxkpk1zP54WPWnl2EbRsypmupRQsXMr8GeGqQwqZys/fApJNkuYcZHHRyajb
         li//1rnwdye2IeN+xeIzze5/5jw6iKxFxP5Wrxtl3OTb2JNTtWs4I76aVJVODCT2VhhX
         yuBoMWRB+ofq5W7dXvFsuUyEEpVqNnIHPs3lz9Xe9pHRsIZDXrnFXAVb9LN6ku99UHjg
         YKdlaZ2thYMZa7b3bu4up3hdbJmYjkIhWdCBgE9ikik78TnR+o7crXSJASqZ2cOrVfPb
         56Fg==
X-Forwarded-Encrypted: i=1; AHgh+Rr8Xk87E67FjcyTZJMksOceZxhY3w3asdsFnJ6/fsNzumd/+kNdMXa8uODgbclO7xGGetREZkWlCXSwO70O@vger.kernel.org
X-Gm-Message-State: AFuF++m5BACVlDWrJr82wPqHRQC6SYM8Uf14+DqBDRPdNzMyjzdoWZyX
	RyRtmy+vIbGA6S9QbEpfQaKWCRjIdeibz+SRtNr3rV3vPb25xYtY5K35t8MX+seJuGMGjgrM27q
	GQK8x7cBVYJo5OAMdLWOP/1V7KLN1fR0odeh0Ts1APovODKXBgqwMHmZaqh2ibZ1UOOQ4JR7RDm
	mXiRzCrz0gwAGYOIn7lU+DOR8u10teZjH3nPkpv+hiO6U=
X-Gm-Gg: AR+sD10wYnubTbVYpr0IvwDzWnbc41DBcjS3Xxnm+OfxnY7CTptAVPtPTTmpu+lvyQ1
	kGC4fw68y5WdYQav5aAAksvCJ5cuiXektja3x9k9ACSRRH3wbgp+Pg2zC68FqOZ+FWtQPQP6Unh
	vDmLcyCuVloRlPU653vxcWRyDVzNgtSIw1HLAGOtahMz3IGyICYR3dA2kCQzeyBy5Z8Sc5TLtat
	S7Xh8O4E625sOnsBBvmZDZQ3buIFVY5TN+gIyq4g4UxYqiYd3jmmilTpoA+z3AfgyohQh0Cj+U=
X-Received: by 2002:a05:620a:700d:b0:938:fdde:b578 with SMTP id af79cd13be357-93947f3bd5fmr771939385a.6.1788250120901;
        Tue, 01 Sep 2026 01:08:40 -0700 (PDT)
X-Received: by 2002:a05:620a:700d:b0:938:fdde:b578 with SMTP id
 af79cd13be357-93947f3bd5fmr771926685a.6.1788250119639; Tue, 01 Sep 2026
 01:08:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831181006.1382372-1-sinyavin@gmail.com>
In-Reply-To: <20260831181006.1382372-1-sinyavin@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 10:08:27 +0200
X-Gm-Features: AcwNN1Xi38vf5viBcQ5z7AYY8-XgrmmkXTpAo5QbZdv9r8lQS_qPsi3OqhYuNxY
Message-ID: <CAFEp6-1Ne2SmyGGLBMMtiXtXXmzEySX0ZgzijNn4-QtN+KFhmw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: wwan: qcom_bam_dmux: account network packets
To: Dmitry Sinyavin <sinyavin@gmail.com>
Cc: Stephan Gerhold <stephan@gerhold.net>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a968809 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=FNx5MMyy-2ZDTin-KYsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Kf6-iy5-FfZlnpc6PzSCjqrIzI85pHxG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX7+eUk4jhTe9D
 qO7v/nhgfOm5NaRvFtgixYddCb1Q/uAYWKmumiUS/3MUOrRItwuxIv6mWB2rGTmlBlPmLVpd+Bf
 KtCx75KBjdJVh2hLWrCM3OzqUhyulQE=
X-Proofpoint-GUID: Kf6-iy5-FfZlnpc6PzSCjqrIzI85pHxG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX+YuORYX1bmsT
 fZn86lkxUEGlAyv+vWHlOomDoX7kwpzm1wnQ55BxhFJRAcc5VuAvlJlxBaqxZkOhzi6LvkMKw+w
 vKXWydtFSRXuUS3aN2Wh+uNfQQV1lqKO3J4xMT9DtMfti9qj5CuYuYnxKFZNiuou7BsbI6yNuB0
 1xFJGPWvRFwGgXLkzrwrEIXiNaiUUlsazyjH7hSNn/UgstxD/dFrFK8qPQ/skfSu9sDH3mR+sqr
 bi3EmU7l3eqPdmiyIDlqp8ehAe1th/KAqr3bjBFxe5K5/i5vNO2O5u2lOf6CRkZ+pLWqb1nL2lL
 X7I0JoT2QQl7ZxI08rqMYWFzq3kj999bhT85vQ7MJrJsHX0sRqlwU15cRpeP8ZBxbz252v15PA5
 ItOxoqVoV7X4Sq2Cqmf3B0ynyBcpqv3JzXLbZrmKgM/gAVx0sy6BIWpgsXEVcra1SAgrUkjkUjw
 w1kCrYYBsEZiehup43g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

On Mon, Aug 31, 2026 at 8:10=E2=80=AFPM Dmitry Sinyavin <sinyavin@gmail.com=
> wrote:
>
> The BAM-DMUX data path does not update the network device packet and byte
> counters. As a result, userspace sees zero traffic even while packets are
> being transferred.
>
> Use the standard per-CPU software statistics helpers. Account transmitted
> packets after their DMA completion and received packets after removing th=
e
> BAM-DMUX header and padding.
>
> Fixes: 21a0ffd9b38c ("net: wwan: Add Qualcomm BAM-DMUX WWAN network drive=
r")
> Signed-off-by: Dmitry Sinyavin <sinyavin@gmail.com>

Looks good to me. Since you're touching the statistics accounting, it
would also make sense to update the drop statistics, for example by
incrementing the TX drop counter in the xmit drop path.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
> v2:
> - Read the TX payload length after unmapping the DMA buffer and combine t=
he
>   network-device checks.
>
> v1: https://lore.kernel.org/netdev/20260830085400.2542956-1-sinyavin@gmai=
l.com/
>
> Build-tested for ARM with Clang and W=3D1 using allmodconfig and allyesco=
nfig.
> Hardware-tested on Qualcomm MDM9607: three 32-byte IPv4 probes completed
> without loss and added three packets and 180 bytes in each direction.
>
>  drivers/net/wwan/qcom_bam_dmux.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam=
_dmux.c
> index cc6ace8d6437..5bcac2ccaabd 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> @@ -177,8 +177,12 @@ static void bam_dmux_tx_callback(void *data)
>  {
>         struct bam_dmux_skb_dma *skb_dma =3D data;
>         struct sk_buff *skb =3D skb_dma->skb;
> +       struct net_device *netdev =3D skb->dev;
>
>         bam_dmux_tx_done(skb_dma);
> +       if (netdev)
> +               dev_sw_netstats_tx_add(netdev, 1,
> +                                      ((struct bam_dmux_hdr *)skb->data)=
->len);
>         dev_consume_skb_any(skb);
>  }
>
> @@ -402,6 +406,7 @@ static const struct net_device_ops bam_dmux_ops =3D {
>         .ndo_open       =3D bam_dmux_netdev_open,
>         .ndo_stop       =3D bam_dmux_netdev_stop,
>         .ndo_start_xmit =3D bam_dmux_netdev_start_xmit,
> +       .ndo_get_stats64        =3D dev_get_tstats64,
>  };
>
>  static const struct device_type wwan_type =3D {
> @@ -421,6 +426,7 @@ static void bam_dmux_netdev_setup(struct net_device *=
dev)
>         dev->needed_headroom =3D sizeof(struct bam_dmux_hdr);
>         dev->needed_tailroom =3D sizeof(u32); /* word-aligned */
>         dev->tx_queue_len =3D DEFAULT_TX_QUEUE_LEN;
> +       dev->pcpu_stat_type =3D NETDEV_PCPU_STAT_TSTATS;
>
>         /* This perm addr will be used as interface identifier by IPv6 */
>         dev->addr_assign_type =3D NET_ADDR_RANDOM;
> @@ -533,6 +539,7 @@ static void bam_dmux_cmd_data(struct bam_dmux_skb_dma=
 *skb_dma)
>                 break;
>         }
>
> +       dev_sw_netstats_rx_add(netdev, skb->len);
>         netif_receive_skb(skb);
>  }
>
>
> base-commit: 2188569e7e1b0bc3f3b557dc97ab7a02befc11c8
> --
> 2.53.0
