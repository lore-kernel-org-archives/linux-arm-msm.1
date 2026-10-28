Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793198288;
	b=RPu5mb4wAmm3ne6ibJV6CSFhIHtV1DDvT/IawWBu/FsDoGaMFDuuZowY9c8SAbZ9M7Kk
	 yz7TUrFPc7KoBEQE1lUIP5OsGfjdNVpqUqFfJ06OY04aB77xcj8LkvGgV8WVQ6GeiQwYO
	 zprdFxck2cgRsJd6nxXjyH6qxc+/UMnNcflF3otBOOV8cS+blpW0wlpk4cz5yvPGglkxx
	 xh2mXi38gl4v6f3wCEEieRDbXNLbRGHTItWWY+Ch7CHxTeX2bBOGGbZWWON0allqMa9mP
	 mzif1BveU7c0EJgZz76yyxOAj9lfeZH7QQ9es3EKkZPNYNR09mx2b3NMwnRHXfycpWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198288;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fAkaiu/+/uRR+ExsZZHjz0gNojx9DBeXx1mELGAsYXs=;
	b=29OATf5IfccQYW1FekuH8rBXUvrdAVrMD9m6dtFk6kus+pMPIQdHo5JogtvHILlRlFXD
	 J3SDrw4U5BN4c6Ckw+ewi0PmB9SDRuvZvURS0A7t2InFkVu3FP4TsNX4YhMKr7LZhuuM6
	 nJgAyZh5HRcQG4oMajUj2K1zGtV20lGYJk2IMZEfCu4g16QZ34MRTkOgvcnw7Fm0qYbMs
	 /VEJ6+DD95fXHQkIYJPsOW09H6LLRQP8pkwk7YH0sUAtc5D/wDFr7ORRiZdn8ZrZzvQay
	 iK6u2w9gMkuRHSc2YuBBtFLaHLWSX8llfE+EXUYPAjPR7YJFNzsur7fHt80X9r33RUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UxiT1FZu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kMG1Dc11;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1FD606A334
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE1FD606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UxiT1FZu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kMG1Dc11
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe4Pb2082635
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fAkaiu/+/uRR+ExsZZHjz0gNojx9DBeXx1mELGAsYXs=; b=UxiT1FZu7pXaIl7o
	afbL0i7301WPl6FFAPnWDGTppgTtxlQMznq69+HXhqgcglzlCKuI2hzF4QjE/W9b
	kGn5KwlnIYn6xmWO29jLhp8Gyxu5LAKSt5uYnQOYuEHPLCNdcKGwpBLuJ4VEzBM5
	87rMc+4AUE2+YV/igthkB1cmLRhCrtvZ3xo5MVMP7WLogsmJBmUpHwwVDor0xhEN
	zbbrvryFZfrcIal5M/OpZEDdYoD+w9mUfK3qrv5802WPJeyUWU7OSm11rgZcNY8e
	nTzKUq9jmM3ggDgD+FIk4eILZv+nfyjGicM/RkIGIv2jvR2o1ykLuaM2glzlfDuX
	xPVIew==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpvg75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:38:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91785bd637bso15922166d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:38:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793198286; cv=none;
        d=google.com; s=arc-20260327;
        b=PxGS9wLaXiXMXnzD/ZGqR9mn13NBRolh4je2XhSFyEHtZ4Gv2U26in3siZ5qMsxlVo
         9N1l5UaTxUJVgnezrpR7DepPHgFLtzsiQbzK8+OdTX9RjeZJc+8yZcmc5K0FIYtxrIQx
         YOKogicXpHGaBn5p+mL8uQkFUL1iqyobct+J/qCfqDw2GVPM0pOHucTzCQGQxscKWtm9
         6A2562P/Vhl9kaLsckwusx0HVCO9LElc/A5PJaCkn3RQ+s860XDU6IuuojFysvta5xEQ
         5Z2nlxLnTQ35Vs8vhSWEageMA/Q33oSA9vxkZRnZ0K0jhbZApKXB2kwjOK00T04L+u3s
         bhSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fAkaiu/+/uRR+ExsZZHjz0gNojx9DBeXx1mELGAsYXs=;
        fh=t7d57oP5FL1tMw93X05SjIOY4tgXGVrypxRRP0FBOEM=;
        b=mmgoWogEND9oOfGuXeQj3+iFCPJL1xRPAPNiVbI6QSmMV4xCbXzO+GP30zPMUWeXbP
         0iyqpwdtiqan9cQEtx629bKyJlCBNFQVdmI9KN4w7ma6fF/mpwiIb4XxbhUyS3huA6Bh
         bq3KoJjdB4qsCitA2irvF4BdyFBRqkzS8jZZFeUAVXtfvCc96Ihy3UtLTpM/CbgNqGFa
         32XoeXW62rAL9Jn0ihoqsUmTQ0n1vaitrxTTGeukwPz/XOtBz23RK2mcSUAAdRvILqH9
         xEYjErp4TDAGrvkji3/Qc4Eo5HZK/eIIKlUH5oBIlj4xhtXv+oIrtHjs/SPMRx1zT7Fl
         csWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198286; x=1793803086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fAkaiu/+/uRR+ExsZZHjz0gNojx9DBeXx1mELGAsYXs=;
        b=kMG1Dc11cocpD5zT5txe/QmBhxyRePIg5LSls4ynKF+5XeKy3w4eeYGHWrszlF9d4T
         7AhWs2MD3zsBr8OZHA1u4csr7aAOr+vD7CUgo2abAPh5K6IuJAUszXzORLSAfYYh6xE1
         FqyqSfuY11Xt+b3YJVfO12mikR6k7jZ3G3SVgG4aojuV41+fcFZeKiKRt+9CglT+PGP3
         sxsm2xDCQO6ao09bOkgzXx5hD4OoS7JtJPoD6iK8DMfXM5IKrWEilCic0by2NNni3Cb8
         V/biY2ZVUpDWD5qkSnCVntReV+XS5mhTWxMt8hnz37OZFJ/HnZSeRlvedK3cfFEVQzPS
         Tdfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198286; x=1793803086;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fAkaiu/+/uRR+ExsZZHjz0gNojx9DBeXx1mELGAsYXs=;
        b=jD6Tcw5cM0dLtrzTtuQExzQdPD8LyIp1gSVmzNV3h1E/R+fqRReRnFVMt31thmuBui
         IJEX8+rZ/wuqbuFQ874Pr46v78g55ee2BxlL172B6/6cGSjZtBgF99c42iiisQA2sGql
         4n+QpGox1IG05fIf2sjWeDl+dDNjGUqhSUy8XwTft3RDwvUadwRYbhYLiPtLz7zJPjsF
         xSVtPAppsXZFDsg9MfBKnqZDK6mwmhNdWwcOpuA4qSuvdydmtlOFPy7/xvXdM6K1aCp7
         UZlbIFv846zsSt8dOqZoj3gQSe4yuqlasEFFIS2Ag+5WB79K4UHZjnhxbZ2TSNr3FJhp
         tipw==
X-Forwarded-Encrypted: i=1; AKwUvBySuhoAwnm+49sWd9isuuyFUxtBVo/UpfNCA9kcConZrvSwcOei8i9pvmfXbScZ+9CK9uO4pvtNOLhEy24c@vger.kernel.org
X-Gm-Message-State: AFq9FYIkp+hhiwc6UZeCFD1fFWcOFKEVSa+mDyHGS/H7iTxrvhTG0Abj
	DmvUaSTCFTWqbA/uF8uo6F/stEuCYhH5ObjS2hHrEoHFfYcJRYkx3VOMUhxtgR71raF5/uW4KwV
	QUTBPyNNgpA4j8nLnKhNqj/8LdFbbJDbrKXWY2QYGE0KpQdNz1Y0/qsbqCNmsPe3Cu7WxJcqjjv
	3buNgROO4we2w6LqzZViwdoLWTkgNQUyG4aNiK254Rofw=
X-Gm-Gg: AYBFou0+4NPYu9juvPWGnUTWalXgCIo+oyqgZmmpEf8pgdNgpYowXyBrfCkVgSMaxTs
	VRQs/MxNujecfiK0oRjZ3PesB2UgKwnybul6kMzS8PU/spuwiIv6O+Ic2si5FFaH9PWzvtoxc2z
	eJD1O4gPy0b5UkR7ubnodo8iCTOdPdCdsutyxzXY1BD6Wqo1s3hDMV+5SRsrhcR4yKwkhylnkQA
	crPrVO0CAJsEZYMNuKTJqwlyx6IcQPDoxRGpZwOv3sX3Y+oPGdsY3PszAnjix8ZE4W2/jDA4Tc=
X-Received: by 2002:a05:620a:6847:b0:93e:bcbf:4ad with SMTP id af79cd13be357-94408ca7bf5mr334750185a.33.1793198286116;
        Wed, 28 Oct 2026 07:38:06 -0700 (PDT)
X-Received: by 2002:a05:620a:6847:b0:93e:bcbf:4ad with SMTP id
 af79cd13be357-94408ca7bf5mr334746685a.33.1793198285631; Wed, 28 Oct 2026
 07:38:05 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com> <20261028132403.3505037-7-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261028132403.3505037-7-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:37:54 +0100
X-Gm-Features: AclHuK8TGWhwGUOmuxjm5T5HEecDdKCuF6DqZY64SaTBhWSc-y-SxMf8zRUIXkY
Message-ID: <CAFEp6-1v78-5v_VL2WbboUgcV6-unT7P0D38p==y2k84wfoesw@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] media: qcom: camss: sm8250: set the camera NoC AXI
 rate from the VFE
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX9ztJY7oKrtx3
 04KS2f8W5hS/OKnKNKgivzXBOgzX4BduJG8LTBxuFBWYok82PYN51dRzN/JUL/SLxoqfrfH7dTy
 aLwoYxxgipsf7HJ83mZK2jCwlE94HxN3cBMApvAlNbG9pnPLY5TNZTDSQtdThQFqYXrTGB/DRm3
 2i1l3fPmIp47ZIKIvAGiAO73BhMwyI3Q3NXHkMYIEKAIuY3l/0N5OZ3QF/JacY07xPc23BO6UHD
 XbKB6Fgiq7H6FNPUBb7qr+L8J2ZF8+Oz4HRESO4tzo0JwipAqaBllcEhiHV8lUegK9wervCLAOT
 oM0ctZzOb1oqq0v5IOTvrB0StZepBjfOHY84TQkSaOcsjJYYaCZxvDt8GuNfbTacFWKUIYmX53f
 +2sJxXgYLlRniBD6IYvevBFWTYHS/rPMxj34gZF3EgonOAD3z8kxI4YvBPuXxRIlqp7tqT7h60Z
 0ib2CMrpGtbdnfDnoNA==
X-Proofpoint-ORIG-GUID: UiRAjzjgHmsh0PuMeoDYEbBY9DyKORDu
X-Proofpoint-GUID: UiRAjzjgHmsh0PuMeoDYEbBY9DyKORDu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfXyvZwt0MD0AQb
 kBqgL1Cj9Jg5y1tEjJwRQnxEVL6PMtn02bgfEdp90qJLmur7J+kUQmwB117WTYn2OWA5ywdgt4j
 Uv1F46atsJDJhKYE2LRllUtCldROhI4=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae208cf cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=bqr9HATVWjL3CuKzvf8A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

On Wed, Oct 28, 2026 at 2:24=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> The SM8250 VFE resources list both the camera NoC AXI RCG,
> camnoc_axi_src, and its camnoc_axi branch. The camnoc_axi_src levels
> are never applied, since vfe_match_clock_names() does not match that
> name, and they list 480 MHz, which the RCG does not support. The
> camnoc_axi branch has no rates, so the camera NoC runs from XO and two
> concurrent streams stall.
>
> Drop camnoc_axi_src, as the camnoc_axi branch keeps it enabled through
> its parent, and list the 300 and 400 MHz camera NoC AXI rates for the
> camnoc_axi branch, whose rate the VFE sets through the parent. The four
> VFEs share the camnoc_axi clock, so it runs at the highest rate
> requested by the running VFEs.
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

So, as previously discussed, we'll probably need a smarter AXI clock
scaling/aggregation scheme at some point, but for now this looks fine.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 28 ++++++++++-------------
>  1 file changed, 12 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 9e29b713288f..6c3e00e043eb 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2120,13 +2120,12 @@ static const struct camss_subdev_resources vfe_re=
s_8250[] =3D {
>         /* VFE0 */
>         {
>                 .regulators =3D {},
> -               .clock =3D { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb"=
,
> +               .clock =3D { "slow_ahb_src", "cpas_ahb",
>                            "camnoc_axi", "vfe0_ahb", "vfe0_areg", "vfe0",
>                            "vfe0_axi", "cam_hf_axi" },
> -               .clock_rate =3D { { 19200000, 300000000, 400000000, 48000=
0000 },
> -                               { 19200000, 80000000 },
> +               .clock_rate =3D { { 19200000, 80000000 },
>                                 { 19200000 },
> -                               { 0 },
> +                               { 300000000, 400000000 },
>                                 { 0 },
>                                 { 400000000 },
>                                 { 350000000, 475000000, 576000000, 720000=
000 },
> @@ -2146,13 +2145,12 @@ static const struct camss_subdev_resources vfe_re=
s_8250[] =3D {
>         /* VFE1 */
>         {
>                 .regulators =3D {},
> -               .clock =3D { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb"=
,
> +               .clock =3D { "slow_ahb_src", "cpas_ahb",
>                            "camnoc_axi", "vfe1_ahb", "vfe1_areg", "vfe1",
>                            "vfe1_axi", "cam_hf_axi" },
> -               .clock_rate =3D { { 19200000, 300000000, 400000000, 48000=
0000 },
> -                               { 19200000, 80000000 },
> +               .clock_rate =3D { { 19200000, 80000000 },
>                                 { 19200000 },
> -                               { 0 },
> +                               { 300000000, 400000000 },
>                                 { 0 },
>                                 { 400000000 },
>                                 { 350000000, 475000000, 576000000, 720000=
000 },
> @@ -2172,13 +2170,12 @@ static const struct camss_subdev_resources vfe_re=
s_8250[] =3D {
>         /* VFE2 (lite) */
>         {
>                 .regulators =3D {},
> -               .clock =3D { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb"=
,
> +               .clock =3D { "slow_ahb_src", "cpas_ahb",
>                            "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
>                            "vfe_lite", "cam_hf_axi" },
> -               .clock_rate =3D { { 19200000, 300000000, 400000000, 48000=
0000 },
> -                               { 19200000, 80000000 },
> +               .clock_rate =3D { { 19200000, 80000000 },
>                                 { 19200000 },
> -                               { 0 },
> +                               { 300000000, 400000000 },
>                                 { 0 },
>                                 { 0 },
>                                 { 400000000, 480000000 },
> @@ -2196,13 +2193,12 @@ static const struct camss_subdev_resources vfe_re=
s_8250[] =3D {
>         /* VFE3 (lite) */
>         {
>                 .regulators =3D {},
> -               .clock =3D { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb"=
,
> +               .clock =3D { "slow_ahb_src", "cpas_ahb",
>                            "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
>                            "vfe_lite", "cam_hf_axi" },
> -               .clock_rate =3D { { 19200000, 300000000, 400000000, 48000=
0000 },
> -                               { 19200000, 80000000 },
> +               .clock_rate =3D { { 19200000, 80000000 },
>                                 { 19200000 },
> -                               { 0 },
> +                               { 300000000, 400000000 },
>                                 { 0 },
>                                 { 0 },
>                                 { 400000000, 480000000 },
> --
> 2.34.1
>
