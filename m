Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793822431;
	b=C1GZQ2MIfv5KWrJkAktSUy9BXHZo6OHvJGvo1xImpeg7isKOlxAWRpRHbmGJZ6aL03cK
	 RiDWWDKDhNhOoDzz3QEzqYkJjSI16n88QWU8triPxOdXLXaGoaTVsgN3nn/yr5Adylzue
	 FoHyXkMN1LEK/6j4MM+kXoBxwIyxXmGgindEj37X8Czfutif9KK73kEeTVACP3Q1W0MBV
	 MjtqcqaY+V3W2vr9TdXAe08rI1Gu3Az6j3608Gq3GCkyF8MwQMx5pHejw6dyqWANw8j4O
	 fEA4ffaA/f9D63e8+yQNPE1/0f80lcA8VgMJuHecUfWyMDzn07K0qd6FHRSuQb2A0wQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822431;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TMnySzlrF1cZN34xVjF7wTP6vo3g2RmbATZOHHltXIo=;
	b=OfRgzMwfbDnOrWxpvwSf7f9/fwAThSKC+ATSI2saKsgsTrKVQM1udm06Uyi98jLPW04u
	 jaceeaOfhs3+k9b5ROOFq3mJqMWtDcjRXfm/UX9RSWlHB0qZcTbKVql50Gr8ibivEBeL6
	 ruGnViwsrTsidonLQ5kOWIhyMUD2v7fIJCYK7FNcUvS3dRyTCJsLkXeq4kKlYAZ+JrSAU
	 e4TxDjbMj41+oy3cKFfW3ONN+LZGWRzfuK+Y7N3CJWACUm+vq1bjVzyEa7tmWjcPIovLH
	 tyhuofuTxy5XaU37vlLObbtKex2ysNxA4GO9mLM4nMfkESLJe4OEt13ho7P0t54cp2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iS6L0nCV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ROR1pZAN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2670E6079F98
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 20:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2670E6079F98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iS6L0nCV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ROR1pZAN
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Icame2286031
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 20:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TMnySzlrF1cZN34xVjF7wTP6vo3g2RmbATZOHHltXIo=; b=iS6L0nCVeV1D+aJw
	3qBT1y6cbxTEKXlvzCaWTv0EXABqsQeU8uIJPgQyUTx5G1rjJE5FjpV/6r67W+YJ
	rG8tih0dXx2e8dDa38nx9+6TEkbV1ITN+xIBBhJElVj5rjvz6I5plV2tL0u65qtU
	rFWvV5fBkNENIX7uyj2xUu2FlCOMoT72yUOcAWmNorLtPJm6rIAnJ4TOajEoxjk9
	ztd+hd5HGb8mzWXk4eM0RrUMsBe7Rt/TG+/8ZzhMbVnnJh/tVD8LwHxmi0rq6fS9
	E3iVRCctZNV0gwz9KrCalZWk8LmWqDu6gj80RcgKc4+Q1xO2lNa9jPWK2CwRTlHZ
	78QNsA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hra5tgb83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 20:00:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f322ef7d3so260319985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 12:00:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793822429; cv=none;
        d=google.com; s=arc-20260327;
        b=WZyjh0gwXlR8l42wgQhHHXovt0t3Ba+Wns/BNil91uzXF+cBK2s0WthlllmKCQRCi2
         bwS8OLYMaV2OBJI+r0/dwmyUQBYXSE3yCG2spyHr5iedcnt8BYsE+M3/BkU3U+gAZ66T
         1nl2lCIYs+PjNGyFuF0oHJYzVBI97HOYOmwQVF7E1nAqAsp601ZCf75Hcw5+3jUCWHRc
         qxX3f5mB0J6uvXMSGOgxGR2ddOb7fNvJJ2wB+5LznGPQq1GYUnl++3vtrM/ofm32sSQv
         5PFJ8JPJ6Ox2HzS71xQvb+3KdU2OE1OTkVLXGJLCnKkAUK/S9QBaPshwv2rwPCIcY0T2
         LrKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TMnySzlrF1cZN34xVjF7wTP6vo3g2RmbATZOHHltXIo=;
        fh=p43KSotVvp9HHWcwX5SJM7GrBF8pMQNaN2ZbWd7qJt4=;
        b=GpNFgYdKpyfH6ZUZVXoXkE2H7oJCPs/TF+lJaQuIZl2HgTCD6BGAsbiveWsYXCsaG1
         vLLID8O+XH6tZ8WVDNcZ3zTgkvrcmJntb1yJC2lDufEGuaBNMV9xKvIduoHvVTsaafEj
         NA+OUo2UBn6j0XCcndkehDlWG6iT+zMzMvb7i+jIBmgPE10rvBZdtPY+8Uo2zHPG4PHb
         NU9+IG7iGPDooPdxj1Fal/P6gi/6wTpfGXXLNdKWKnB/6SDtNQ27i22tOQecKbR3zhJ1
         SglIw+77S9K0kqylCLUr9v9cdXRBGgZxik/+q7IxEuh4ZpisfiUSOAbsGfmmj6eoN5Ou
         GPpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793822429; x=1794427229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TMnySzlrF1cZN34xVjF7wTP6vo3g2RmbATZOHHltXIo=;
        b=ROR1pZAN3U28paNr99llR2FQOu4iWyXYH28N8PHd1zcNMtzt7K7CdjmeacyR1lcO5l
         1k8k/80Sf67i6ChVjrWrsGGlobxshKEf/zWcTBwca0gle0zFqwfB4azVDDZYKaSWwepE
         mRX1/21pRdfhNiboVODgexpPd1yff5JJnbjNr9BE3HGwwfnaqhmzwb+PmGmYm/268qu0
         vwcuCGVopJBdy6mefYturPhFzsQHgkLZihKjsCnf5B/rl9aNzw68pH/PynZazhtsoGgp
         F5dZyctZjIZ0U/6GEnnS4RXMe+G4iOuJ9oDHfLQlq8XRPMoT3vcIX42fABRve1HMyA43
         BZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822429; x=1794427229;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMnySzlrF1cZN34xVjF7wTP6vo3g2RmbATZOHHltXIo=;
        b=zyE6gg1JCMS01Gm99rPXB6McvrD9YisOpLFkwV7Hti7B+eqgCkvVFpbiRq50tvFwQh
         ofsOBeMjNUnrLTQGHhaafRlpShHaMwc9NC+LbyaWAyun5nAqqPhVGIHgw4/tjtENqQd7
         KHJHkr3n9ZPbqqP97WdCvQN/CdKJCzcEXOZ/gRBHeBCO88Ir8zZqOHmmzaH1YXSMLoIW
         cjxQsZbexkpRoGmddxwe9sCBEM3H2qnmnofpScDREFrhhf4Xf7suPXY+QLTKi2GrzOFD
         3fWSgT67R7vq1g1gllj5Tdwk9VPm6YpR4HPeG2hrTlOI/gxu81VUO0AMEDYYvkdxUgX0
         +9yw==
X-Forwarded-Encrypted: i=1; AKwUvByNgwQx9nhgbM/UvZ/cVyviJMvXg65er3hLvsWfQ465XkOjVHLzm5aKB/APJ1+NAuV763R02vkpw78RNam1@vger.kernel.org
X-Gm-Message-State: APuU4Z9Cd+9Z7dkjb5guCOasVGt/4bKRHIjke4iaR0g7WDTNBuITWlqq
	0q3ZzM1zVc9mlY8qf3sDVDgISw1rR6VLvBE3aor1PHnrnpWQBJS5hyA2br+nfkfX3Kay7iD5cO8
	1jg2RzIJ1PIaZKgTqxhQwJ4ABc6R7ekrXZhQBYX+o1sD5yXjxiiv5kzP3ZecH8PtQ8n4VzvHyQF
	gEY/WS4m7lA8MRDLW1t7i3pQRicpiQjU2RW2N5dgPPyto=
X-Gm-Gg: AYBFou0QeiprYVxXDNaZBtA/VUL2ivemIIPOEXSzcDl/h+UcCRQ8zisxVNQZAa6cW0n
	qa3QXatKEKPPzfduGXC2fDZH13PcZZ0HwNQTUDsqRxMymWJFlnEFh4AcB/kJRjVD0HGBjzH2mdy
	rK4nxlYo/KQS7mqHW7EOuDXqYqU0RzlzfYl7t19ea+QId+KvQPH27VG5dfWmfD2Nduf3UoBCiGl
	hf1Ph9mXDxRdQTuePaeDQk8b2mTsT7DCgGpFt8UkohnAbiHzQzagBJeNgwQlDR/DkHI2tiRk+Y=
X-Received: by 2002:a05:620a:472b:b0:93f:1ed3:a9cc with SMTP id af79cd13be357-9442171a086mr2894451085a.17.1793822429041;
        Wed, 04 Nov 2026 12:00:29 -0800 (PST)
X-Received: by 2002:a05:620a:472b:b0:93f:1ed3:a9cc with SMTP id
 af79cd13be357-9442171a086mr2894440885a.17.1793822428459; Wed, 04 Nov 2026
 12:00:28 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
 <20261103-camss-isp-ope-v13-4-c2cbf15a39b1@oss.qualcomm.com> <autlc2AfB8AZfb2H@zed>
In-Reply-To: <autlc2AfB8AZfb2H@zed>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 21:00:16 +0100
X-Gm-Features: AclHuK9N33CIyZcbZ2UGvyj25S6IIKINlhYmXcHoaT0FNmanaG6JsRfW5JzTXZ4
Message-ID: <CAFEp6-1qs-HmxYWcombWxyuPRACg5cQVrJs47rwrP8AL6xDrEQ@mail.gmail.com>
Subject: Re: [PATCH v13 4/9] media: uapi: Add CAMSS ISP configuration definition
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3OSBTYWx0ZWRfX5TEHK3bnS/zW
 Tc5YXKiUN2uLh6Qiv2ANM3wAHPE8Vhg7R/nPOAJAoN9Rn9QaDZnp5vJPvj1PExHVztR8B9PYaxp
 cIxdnsiI+fOwQ5ADeU7F5HrE/9jA71c=
X-Proofpoint-ORIG-GUID: VjeqS6j5M6tqIWay1cZqYC3r69Co4GIu
X-Authority-Analysis: v=2.4 cv=P/6vFSAu c=1 sm=1 tr=0 ts=6aeb8edd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8
 a=IEpJfH1-mEoR4trvuzYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: VjeqS6j5M6tqIWay1cZqYC3r69Co4GIu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3OSBTYWx0ZWRfX6PAyHlaj8WSm
 TZ0G5o+GCVloiNFMOLCoWIOzsgo3DMOPhqqWpXR7WDze9Jsp3p+ajVoAgPUnxM9lKBVBF6WvBnA
 pFbwGko/3x0K3IV+I8Ss1H3eTEEDMs0w92VEkmq2GP0dREjg1qHyZWUJ8P8gd3o0uS6I4Y81Pos
 UenY/eZR0BJWWrAuUJ2IZllJbECaL9zBWYTGO3McEejp2mfK1ccYRLjIpYu32vgz5HN5bANkooE
 XjGusw3QFg/chjnfXGaszUSw8D3xqxrrGwJWgq8dHVO2K7gV3U2L44obNe2R43aF3/jcOHWRR5F
 xkz188FGIyJ5TrFGO3Rx+wEnMvL7NITYBAkivPOzolD+5cuR8ONi+RdPRpGfyj6fylwD8pl/mTs
 X8XYI+dgCBB+TQAr34/fi9aQV6ryTjuxSLJdttdO6TSXUePojf/qBX4IVae6vce8Kd0sahhCLT5
 8PQkg3elxeuq2D0NI8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040079

Hi Jacopo,

On Wed, Nov 4, 2026 at 6:05=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Loic
>
> On Tue, Nov 03, 2026 at 09:05:48PM +0100, Loic Poulain wrote:
> > Add the uapi header qcom-camss-config.h defining the ISP parameter
> > structures used by the CAMSS Offline Processing Engine (OPE) driver.
> > This includes structures for white balance, chroma enhancement and
> > color correction configuration.
> >
> > The block type enum is shared across CAMSS ISPs so that userspace only
> > has to deal with a single set of block identifiers.
> >
> > Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  include/uapi/linux/qcom-camss-config.h | 217 +++++++++++++++++++++++++=
++++++++
> >  1 file changed, 217 insertions(+)
> >
> > diff --git a/include/uapi/linux/qcom-camss-config.h b/include/uapi/linu=
x/qcom-camss-config.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..543c1682f8aed3b07d7085f=
54a24eb632ea190a8
> > --- /dev/null
> > +++ b/include/uapi/linux/qcom-camss-config.h
>
> We have (kind of) recently introduced include/uapi/linux/media
>
> This file should probably be:
> include/uapi/linux/media/qcom/camss-config.h

Thanks for pointing this out. I'll move it according to your suggestion.

Regards,
Loic

>
> > @@ -0,0 +1,217 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> > +/*
> > + * Qualcomm CAMSS ISP Driver - Userspace API
> > + *
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#ifndef _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
> > +#define _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
> > +
> > +#include <linux/types.h>
> > +#include <linux/media/v4l2-isp.h>
> > +
> > +/**
> > + * enum camss_params_block_type - CAMSS ISP parameter block identifier=
s
> > + *
> > + * Each value identifies one ISP processing block.  The value is place=
d in
> > + * the @type field of &struct v4l2_isp_block_header.
> > + *
> > + * @CAMSS_PARAMS_WB_GAIN: white balance gains and offsets (CLC_WB),
> > + *   &struct camss_params_wb_gain
> > + * @CAMSS_PARAMS_CHROMA_ENHAN: RGB to YUV colour transfer matrix
> > + *   (CLC_CHROMA_ENHAN), &struct camss_params_chroma_enhan
> > + * @CAMSS_PARAMS_COLOR_CORRECT: colour correction matrix (CLC_CC),
> > + *   &struct camss_params_color_correct
> > + * @CAMSS_PARAMS_GAMMA: per-channel gamma correction curves (CLC_GLUT)=
,
> > + *   &struct camss_params_gamma
> > + */
> > +enum camss_params_block_type {
> > +     CAMSS_PARAMS_WB_GAIN =3D 1,
> > +     CAMSS_PARAMS_CHROMA_ENHAN =3D 2,
> > +     CAMSS_PARAMS_COLOR_CORRECT =3D 3,
> > +     CAMSS_PARAMS_GAMMA =3D 4,
> > +};
> > +
> > +/* Number of entries in each gamma channel LUT. */
> > +#define CAMSS_GAMMA_LUT_SIZE 256
> > +
> > +/**
> > + * struct camss_params_wb_gain - White Balance gains
> > + *
> > + * Implements the CLC_WB pipeline module.  The pipeline applies three
> > + * sequential operations per channel::
> > + *
> > + *   1. Subtract sub-offset (black-level subtraction)
> > + *   2. Multiply by gain    (colour balance)
> > + *   3. Add add-offset      (output pedestal)
> > + *
> > + * Gains are 15uQ10 (15-bit unsigned, 10 fractional bits). Offsets
> > + * are 16-bit unsigned, normalised to full input scale (65535 =3D 1.0)
> > + *
> > + * @header:   block header; @header.type =3D CAMSS_PARAMS_WB_GAIN
> > + * @g_gain:   green channel gain (15uQ10, 1024 =3D 1.0)
> > + * @b_gain:   blue  channel gain (15uQ10, 1024 =3D 1.0)
> > + * @r_gain:   red   channel gain (15uQ10, 1024 =3D 1.0)
> > + * @g_sub:    green sub-offset, subtracted before gain (16u)
> > + * @b_sub:    blue  sub-offset, subtracted before gain (16u)
> > + * @r_sub:    red   sub-offset, subtracted before gain (16u)
> > + * @g_add:    green add-offset, added after gain (16u)
> > + * @b_add:    blue  add-offset, added after gain (16u)
> > + * @r_add:    red   add-offset, added after gain (16u)
> > + * @_pad:     padding for 64-bit alignment, must be zero
> > + */
> > +struct camss_params_wb_gain {
> > +     struct v4l2_isp_block_header header;
> > +     __u16 g_gain;
> > +     __u16 b_gain;
> > +     __u16 r_gain;
> > +     __u16 g_sub;
> > +     __u16 b_sub;
> > +     __u16 r_sub;
> > +     __u16 g_add;
> > +     __u16 b_add;
> > +     __u16 r_add;
> > +     __u16 _pad[3];
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct camss_params_chroma_enhan - RGB to YUV colour transfer matri=
x
> > + *
> > + * Implements the CLC_CHROMA_ENHAN pipeline module. All coefficients a=
re
> > + * signed 12-bit fixed-point Q3.8 (range roughly -8.0 to +7.996).
> > + *
> > + * RGB2Y - Luma (Y) coefficients::
> > + *
> > + *   Y =3D v0 * R + v1 * G + v2 * B
> > + *
> > + * RGB2Cb - Chroma (Cb) coefficients::
> > + *
> > + *   Cb =3D a x ((B - G) + b(R - G)) + KCb
> > + *   with:
> > + *     a =3D ap, when (B-G) + b(R-G) > 0; a =3D am, when (B-G) + b(R-G=
) =E2=89=A4 0;
> > + *     b =3D bp when (R-G) > 0; b =3D bm when (R-G) =E2=89=A4 0
> > + *
> > + * RGB2Cr - Chroma (Cr) coefficients::
> > + *
> > + *   Cr =3D c x ((R - G) + d(B - G)) + KCr
> > + *   with:
> > + *     c =3D cp, when (R-G) + d(B-G) > 0; c =3D cm, when (R-G) + d(B-G=
) =E2=89=A4 0
> > + *     d =3D dp when (B-G) > 0; d =3D dm when (B-G) =E2=89=A4 0
> > + *
> > + * @header:   generic block header; @header.type =3D CAMSS_PARAMS_CHRO=
MA_ENHAN
> > + * @luma_v0:  R-to-Y coefficient (12sQ8)
> > + * @luma_v1:  G-to-Y coefficient (12sQ8)
> > + * @luma_v2:  B-to-Y coefficient (12sQ8)
> > + * @luma_k:   Y output offset    (9s,  0 =3D no offset)
> > + * @coeff_ap: Cb positive coefficient (12sQ8)
> > + * @coeff_am: Cb negative coefficient (12sQ8)
> > + * @coeff_bp: Cb positive coefficient (12sQ8)
> > + * @coeff_bm: Cb negative coefficient (12sQ8)
> > + * @coeff_cp: Cr positive coefficient (12sQ8)
> > + * @coeff_cm: Cr negative coefficient (12sQ8)
> > + * @coeff_dp: Cr positive coefficient (12sQ8)
> > + * @coeff_dm: Cr negative coefficient (12sQ8)
> > + * @kcb:      Cb output offset        (11s)
> > + * @kcr:      Cr output offset        (11s)
> > + * @_pad:     padding for 64-bit alignment, must be zero
> > + */
> > +struct camss_params_chroma_enhan {
> > +     struct v4l2_isp_block_header header;
> > +     __s16 luma_v0;
> > +     __s16 luma_v1;
> > +     __s16 luma_v2;
> > +     __s16 luma_k;
> > +     __s16 coeff_ap;
> > +     __s16 coeff_am;
> > +     __s16 coeff_bp;
> > +     __s16 coeff_bm;
> > +     __s16 coeff_cp;
> > +     __s16 coeff_cm;
> > +     __s16 coeff_dp;
> > +     __s16 coeff_dm;
> > +     __s16 kcb;
> > +     __s16 kcr;
> > +     __u16 _pad[2];
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct camss_params_color_correct - colour correction matrix
> > + *
> > + * Implements the CLC_CC pipeline module.  The matrix computes::
> > + *
> > + *   Out_ch0 (G) =3D a0*G + b0*B + c0*R + k0
> > + *   Out_ch1 (B) =3D a1*G + b1*B + c1*R + k1
> > + *   Out_ch2 (R) =3D a2*G + b2*B + c2*R + k2
> > + *
> > + * The @qfactor member selects the fixed-point format of all coefficie=
nts::
> > + *
> > + *   0 =3D 12sQ7  (range ~-16.0 .. +15.992)
> > + *   1 =3D 12sQ8  (range  ~-8.0 ..  +7.996)
> > + *   2 =3D 12sQ9  (range  ~-4.0 ..  +3.998)
> > + *   3 =3D 12sQ10 (range  ~-2.0 ..  +1.999)
> > + *
> > + * @header:  block header; @header.type =3D CAMSS_PARAMS_COLOR_CORRECT
> > + * @a:       G-input coefficients per output channel (12s;
> > + *           a[0]=3DOut_G, a[1]=3DOut_B, a[2]=3DOut_R)
> > + * @b:       B-input coefficients (12s)
> > + * @c:       R-input coefficients (12s)
> > + * @k:       per-output-channel offsets (typically 9s effective)
> > + * @qfactor: Q-format selector (2u), see above
> > + * @_pad:    padding for 64-bit alignment, must be zero
> > + */
> > +struct camss_params_color_correct {
> > +     struct v4l2_isp_block_header header;
> > +     __s16 a[3];
> > +     __s16 b[3];
> > +     __s16 c[3];
> > +     __s16 k[3];
> > +     __u16 qfactor;
> > +     __u16 _pad[3];
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct camss_params_gamma - per-channel gamma correction curves
> > + *
> > + * Implements the CLC_GLUT pipeline module, applied in the RGB domain.=
  It
> > + * holds one independent lookup table per colour channel. Each table i=
s a
> > + * direct (not segmented) map of input level to output level.
> > + *
> > + * Each table has @CAMSS_GAMMA_LUT_SIZE (256) entries of 16-bit unsign=
ed
> > + * output. The number of significant output bits follows the width of =
the
> > + * engine's internal bus; the upper bits are ignored by the hardware.
> > + *
> > + * The module maps a 12-bit input to an 8-bit output: the top 8 input =
bits
> > + * index the table and the low 4 bits are used to linearly interpolate
> > + * between adjacent entries. Entry i therefore represents the output f=
or
> > + * input level i/255 of full scale.
> > + * Output range: 0x00 =3D black, 0xFF =3D white.
> > + *
> > + * How to fill a curve (same on all three channels for pure luminance
> > + * gamma; different curves per channel additionally shift colour balan=
ce)::
> > + *
> > + *   Identity (pass-through, gamma 1.0):
> > + *     lut[i] =3D i;                                // i =3D 0..255
> > + *
> > + *   Encode with gamma g (e.g. sRGB-like, g =3D 2.2):
> > + *     lut[i] =3D round(pow(i / 255.0, 1.0 / g) * 255.0);
> > + *
> > + * @header:  block header; @header.type =3D CAMSS_PARAMS_GAMMA
> > + * @glut:    green channel gamma curve
> > + * @blut:    blue  channel gamma curve
> > + * @rlut:    red   channel gamma curve
> > + */
> > +struct camss_params_gamma {
> > +     struct v4l2_isp_block_header header;
> > +     __u16 glut[CAMSS_GAMMA_LUT_SIZE];
> > +     __u16 blut[CAMSS_GAMMA_LUT_SIZE];
> > +     __u16 rlut[CAMSS_GAMMA_LUT_SIZE];
> > +} __attribute__((aligned(8)));
> > +
> > +#define CAMSS_PARAMS_OPE_MAX_PAYLOAD         \
> > +     (sizeof(struct camss_params_wb_gain)    +\
> > +      sizeof(struct camss_params_chroma_enhan)       +\
> > +      sizeof(struct camss_params_color_correct)      +\
> > +      sizeof(struct camss_params_gamma))
> > +
> > +#endif /* _UAPI_LINUX_QCOM_CAMSS_CONFIG_H */
> >
> > --
> > 2.34.1
> >
> >
