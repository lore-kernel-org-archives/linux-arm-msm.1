Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE0037DABD
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 07:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137039; cv=pass; b=a8yTeDrn37Phz1nHkLrEo89xqSd3H/hcXbY5o13L5+0lKCBrcaCu4+jkzwrpQs4s0Il2AA8L9tTmlFITXpiO2gjBDk7YZ1R7rhHThBkz9NANxBuZYsA1w8fcXg1zsBYIagEXh3G5cwsnUcgxhIL7P8hmjL4HZvS9haOW03kWv4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137039; c=relaxed/simple;
	bh=HdaXDt7roetlcl5Z7zLdM7ZLqhcMX9rkrRQiOIl8xO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Friu0I8c7kmdDssV/ybjBkSsIaqYc4w7jRvLtYHcKjldcdwOd/M52t8Y2GUDG1CeflIHkMTasZ6+cbkcYO9Ybv+6vh1iI03wvyDKVZTnG/6na/bCTSKDLKrm/0tvutIKDUP3lfcgMP2kE0KmrhWw48+r6oDSrEef7OY0Ho9B7Oc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqx0GIUL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F8ioKYXP; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqx0GIUL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F8ioKYXP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G75rRu1635423
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 07:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cac2SsbUpbTX58DTz0jrcqCuNi7ZOkA7ZgNCrxGWe8w=; b=bqx0GIULVEZ0BXv1
	od54Q8iEOTBmD3qGKcv+wqjM/h9tX+TNbRdLnyAafGBPN17aJtZpM76ETsMAwGtI
	OL7vWqbx3UFGLeeBxNyVo06XsH/OViVlUVpOciNF4pF8aB3fJT/WI2CregIoli6m
	DbBQEUA36k5tcgudCf7tkh+McX1s19USm/p570neMhabLO7GYSVGOqaSI/LNhfyS
	A78pZiRih1DjTGVM/KWd8bIBn7OSpGeRXzjF0vc2g5Kdze1vOJ8mBUi1mCXPK5Ek
	G+VbQYVPZcrrBQ0YRbnrAmekABBPJpQ+4QoxuZYM+ZJQpE0pZlJqeW2iNsdZUycT
	gsJBbw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r11gvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 07:50:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so1178996585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 00:50:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792137036; cv=none;
        d=google.com; s=arc-20260327;
        b=WpRfcwxTt7ofX0gMdXUCLU4lqBpjeSL91sScBv//IqMiLpNTljY1TBV0HUY80i/pER
         qLizwk5l7Vb52HXTR37mkMDRDJLJY7ZWItxbbj/cfOT511GladngPBMaEK6koBPzYfYH
         pVb0l3yEGEV9lPQ5B38ZfEHEsZlckfXbjBiyjxBFsDIzmMUvU4umkrePGg6zUMWUIuHY
         R66wwAKu0DhW/JD7WYp9G3pxhWBCB7un3muhFscYxMl6u1/8AaaWVIQg7D1Hf+/UKhOT
         /gqE2LEMMLCLy8UkoXO/sDy1nJLA0dFC0Wr86v5o9ULan5vgRQCf59yru3oBwUdBFjfO
         DlXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cac2SsbUpbTX58DTz0jrcqCuNi7ZOkA7ZgNCrxGWe8w=;
        fh=0Xn6kDuqQ7JULUoXz8FPREsxNYCglrJAYljbvfT+Cr8=;
        b=FGjIBXHYHat6V2Fcu2CvcG+as4+6KxlZ+vRCrk1tkv4SmAtBda90YWJDsrOaggvFxJ
         o60PDcbsXW/V5S4jATxKoqyqHau+4fbLCTqN4W34z9gAbSqK6uTbnuMw9jxwcV8uWNyW
         mawrGQ/giD6zQ4rY2HHV0LegwFBaH7yoVTqtIRaDG7TF4iXneTSgujiuHLLNViIBYkUk
         jrO5G96+FjjLOUPKj532ixYbF5KSJD00bl4Lfs8VvMKzGmC3/R5zjGNvn9ocI8XNpao3
         aQBhMRFwuEcvCfk6tdxr5Xhng93vFBDIwOvbrqkDSy9312XT84yflAlW/dK4U6Wkj21S
         2wWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792137036; x=1792741836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cac2SsbUpbTX58DTz0jrcqCuNi7ZOkA7ZgNCrxGWe8w=;
        b=F8ioKYXPwXD0vyF8crg7z04qpvNs3BO3ANwEOZrHSQPRTsaYs8eIQVwOJDs5giZZeU
         36u/wJo8y0UIofXsgHvNd2jWX22W6nr1HfCp5VD1zOKnGHPAc/2Gz7HIiOeqM9LVFt4c
         d96HrPhdA1fbKgEJyCnRLYHofCFy+TXzQxz0PtvxIER/O3zLxqcMnyJzuYpw+6ABYimT
         a2d+zOT2tqnDbU86w9L8XppiiljC+b+u5gFVnkQoMSl4M6FvfiM830rwvPCZL5HNGhME
         XlqT1bhGtGjDyHEvu9ufqPqNIqpus0WO3UNQNGLCZm1b3TQNV6JxZsEdWBCPT0bDACmP
         RBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137036; x=1792741836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cac2SsbUpbTX58DTz0jrcqCuNi7ZOkA7ZgNCrxGWe8w=;
        b=OQ2Vv1WTbJAqcLmoADoMA3XB4vRfrN0IYl1t1fRD+kqwaDJMzJUgEvCpAWRf+p4lMK
         0ddiD3rkaMBf+AsaUnk2p+5phUHzPGEll6SR6d6Z4gY3UF7mNNa+dtrT5AzWg78vU3NQ
         JHA9eto1bD4vsv/HjQ9vxYXaefcrWBY2478sNRY7rblasAnMrL0p9fogaPTPjOj5q5CO
         3EKUoaqKtFCW6bu5eHcndf2wM3vojE8SRWgLcWn7iDUj4iHSJP4G8En+Ndh+A54qE51H
         f8u+ZgFI5bnadwp0ICE5X+z4rrx+Nn+6c5qp94KUXp9XanPDJz5fJHIG8/xB/7j1MTI0
         4DFw==
X-Forwarded-Encrypted: i=1; AKwUvBwsIZ0Nqgqp8sVQ5aD6qJCUe5wV7xPtJkpiaCAtdtBMfmPqrSlAxkzb1rVGgVkCzb63SPh2pmxRyxRmoVc3@vger.kernel.org
X-Gm-Message-State: AFq9FYLcPo/Dt7K7MqStv9WsFhjjsX69xNH4n60l04jucfWPaRxU0/Bf
	7chHbvwVBO2s5Tth6sM9NVuLujLpE2HcuV5PbyyGe4XU0LF9P1It6M4n3TqDFFUHE0cDedHPOq/
	Fr5564uHNk7Ph1h7GuJq5uPWtrnnFPScP4iPf3rDPSfjj1CO1TrxHk28LrSzIHqSRkW36WCzdLL
	BamyHKq1ydkaz2VBEBgJMoWNuAER3rEphCVejPF3ZuOhM=
X-Gm-Gg: AYBFou0KfWK/TWIcWjoB+juBNGInbzVEi2Ax1z7VEePMK+TJLcj/h5JRMXbIH32hWD0
	oDYDiNdfCsp8RxTx8RbtYt2l1bIE8dIygftLcA5GdThZxgv1LdIdJjpzHOxNQ2wrGeOHxSxi8Jj
	g05eluCvVEPx1jW9ttwqcxkul7cstqVV+mqMq04C4gz8Ypb7MkhRvYuqjw5aaJzvs/pZXbxWXgh
	dSsj7ko4wsVtITo/ZWEAtot/fmHIgE81LbrpsytqSLZoNHt6YuWETUL+eVCZVBC5NVVZTe3TLuE
X-Received: by 2002:a05:620a:1786:b0:93b:ec83:80ee with SMTP id af79cd13be357-93ebd25d1demr3398992485a.57.1792137036382;
        Fri, 16 Oct 2026 00:50:36 -0700 (PDT)
X-Received: by 2002:a05:620a:1786:b0:93b:ec83:80ee with SMTP id
 af79cd13be357-93ebd25d1demr3398990185a.57.1792137035856; Fri, 16 Oct 2026
 00:50:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com> <20261015-x1e-cphy-rfc-v1-3-1f3fa9af940a@gmail.com>
In-Reply-To: <20261015-x1e-cphy-rfc-v1-3-1f3fa9af940a@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 09:50:24 +0200
X-Gm-Features: AclHuK8JKCvyx1h6mjiUhNqE7WWuH5Nj8DI463hKl1Pcfxn_BS7ehKW2f4RxCvc
Message-ID: <CAFEp6-17SySt2t5HGYGeQ0RRf6DPQDz08JjsAJicaj2R1KDD_Q@mail.gmail.com>
Subject: Re: [PATCH RFC 3/4] media: qcom: camss: csid-680: Select C-PHY in the receiver
To: geocausa@gmail.com
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 5qb4pFyfPasvDq2H1s9yDvBf0npnm4g_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfX6FzBXAt6bKV/
 2SDgjx08r9Kk2gkfPa2ejNq3c86EVWu2kDdSJAEK99ef1HE/OT0mGcXSqF+1dwWgxbtbGFFIXUU
 2wUu7Vv8suzcVR+Gnj60CHvWxaj8T4w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfXwulDNsU85UNO
 AcTiNd81q5cFiBA6o+VlNQqq2hk91BOYlNFl3UlVU+Q7iOHwdcJQPilVrpj1oiTdU5PAd5FFHno
 Q+qLk/JibTR+AJiAG3vyq/CbBLJqBc082zv/FrwU2nuCFVz+UABHNMwAb/QRW5UAYaGs8pKgw0d
 awf/ZhfeFCh2wWm+/RrNm6eS5BvmsLutLpoUQPWO4fKOtDrqw+RcyWS/YfpNHRLzggiCHcPVSby
 4/P23pRGiyG+UN1oTGP4f9Zi1JjbF+AvFgdGLLZ15t0044hZX5Ri+265mhvqZI/gIAdbsj807n0
 39OEUANI/cp+TxG9eANcmglrtO1sA4N+yZIUUnBJE4y22AJDyHCRpLR3te86rXiwtEoP6hf+0Jk
 fr/ALmNareMAPUbHl37zLZggu3Sm3S36v0srmWsVyq4OLWMPGSFkP+BO0AvmcrrqcMX3jjG4T7W
 iRaeWkyE8VRwE5hCjyA==
X-Proofpoint-GUID: 5qb4pFyfPasvDq2H1s9yDvBf0npnm4g_
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad1d74d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=LElf2VvS5UWv9C91Qe8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160031

On Fri, Oct 16, 2026 at 12:20=E2=80=AFAM George Neacsu via B4 Relay
<devnull+geocausa.gmail.com@kernel.org> wrote:
>
> From: George Neacsu <geocausa@gmail.com>
>
> CSID 680 has a PHY type select in CSI2_RX_CFG0, next to the PHY number.
> The field is defined but never written, so the receiver always decodes
> D-PHY. Write phy_sel to it, as csid-gen2 does for C-PHY.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>

It would be even better with proper masking/FIELD_PREP.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csid-680.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers=
/media/platform/qcom/camss/camss-csid-680.c
> index 345a67c8f..16b199f06 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> @@ -202,6 +202,8 @@ static void __csid_configure_rx(struct csid_device *c=
sid,
>                         << CSI2_RX_CFG0_PHY_NUM_SEL;
>         }
>
> +       val |=3D phy->phy_sel << CSI2_RX_CFG0_PHY_TYPE_SEL;
> +
>         writel(val, csid->base + CSID_CSI2_RX_CFG0);
>
>         val =3D CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
>
> --
> 2.53.0
>
>
