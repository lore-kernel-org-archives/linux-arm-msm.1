Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411620;
	b=rVTzS+5BeJ4TMp+It6R4ONjhsMQxkFsDAUhYUsBBWeFaqcg4Pmh/yefFcQ2eosv2NnIF
	 aCH6qWE1asA4hJfmdg393qfC/4truu1i60nUXceYSRNygG7mlt8k9HwZkYd9VeGOWa1xT
	 mGuGKnrPR4ZA41HmYo+/PxNiII5X7Pc1FGIoWbFDzzNmS0sdghrSeT8cG9LXHKLsEtwz/
	 YXg8XBUMSP4ad+B6N9Hr7P7hlxykzX+Dq6WXzHy5Fj2wd85Vrr2XNo99R5NrJPhtLHWgx
	 uPq+Zxpeq6pu/YinKxSKEbpzZTCed4nmzTm9tL4S7g6juRrMCZgy6z+iXnkRxt0t5bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OprF36JLM5p8Id+XvKPw4GzNwkz1XZPEfq/0vWjxfZk=;
	b=16zkCWwtjZG2IZfKaw4MU/i6jYdIEFjZLDpKy5gy59vknbIs4p/kTkfiNe5FDStPY/le
	 orplwJmlLMw25egegnFKficxcYUOyIxRquHWUU2uA4nVkhHKdEV6Fn7/KF2GUYfustJMy
	 kZCSFSDKX+LIW5yK/z+KMTjPwaaunN+SFt9XzCi5P/7H1A6Qd5X9Bl6AdS4CTvvvTPsH7
	 jEW03exf8eJV56EACzkmv1Xix2NK+Qr9HVXGi0xRaOxQd9ChkhwPAtwyEdCW3M5RCzeJY
	 nCCg6TkFQChR+r98pUnlhhIxLRx13NaVtTfdKc8T4Bmg2rov4vZ++QPxU+6YtSIK5pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M3QwgKSx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F6K+7eDA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6EA606A8A9
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E6EA606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M3QwgKSx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F6K+7eDA
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0EBk3289585
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OprF36JLM5p
	8Id+XvKPw4GzNwkz1XZPEfq/0vWjxfZk=; b=M3QwgKSxxQJcxSGDa83MrU9chql
	7DznRsYzMHol8NytPvt3D1F2xJjmZ7dbthOA0b/J5D1EodiOHkvC0ns+JiO33T1T
	K0X8/mW6GYTCiciPkvLf9yJh4vSogWBim3GwODi6alKa11Ki6We46ssLeTFXRZbQ
	73acnyKcZNE6fPVGfRl3youG4KSxRumDeKrCNIpH4/ZgK4GE7Hc1IhSozZ/qOkdJ
	W6BHo95e5jnbpoyzkd/qx+2ZxtVCZXc4g8mFRyMYmyY1ShMMCTR63hokMnRaUZ8I
	ry39PhoMrxAMgMeaQN3W1WenZC5Lho3ZexgSJFvWTYn2LyqR/cvuYBmwERQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt150eb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:40:18 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99c203da2baso255136241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794411618; x=1795016418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OprF36JLM5p8Id+XvKPw4GzNwkz1XZPEfq/0vWjxfZk=;
        b=F6K+7eDABkt7UC+imlBBZ1AEA4ZfVsAuhxpuk2455MVR3z5g8rTJGGrz5TNokawhCQ
         eGEe0h58hYX1GN0mcO7tcueEZmUKgcWXfhy7WJr4W8ZN/OxHjI5lTKBzKqVClo38aziH
         I7sdhV4e14u4935XIbBad+Z7jaicPpIFUzl8GQJYKVM4xHVALHxCkWc9agQiJr2K9FIE
         QKolPWM4xdcX/06T24Dfa77cyhp7YSgl2UyTUDM5kbyGunUd6HPZyEz0U6DFJvAyDCZs
         AwYSD6ycuTIxD7Dmb/+0gMmc9on/GNiX1qa7jOw6WrNDtYwz0+27tvOd0vDsC3C73Gid
         xFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411618; x=1795016418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OprF36JLM5p8Id+XvKPw4GzNwkz1XZPEfq/0vWjxfZk=;
        b=2Fb8pBxZLqP7EiWjHm3xBdoRz00AjoJ85ISkotgLMhOQzCNiWN+fkh8p4LfUUVOVVf
         AKj/BQXlx4MfW6MGB8jKfPrnImBILB6/EdyqanpU/x7jPRcpArR/LHGaC1UJuVlIKn91
         9XYi+zrQVzoBSFXKUXXOuyQORSr2ruU4nXgCfofe8u7qBvHLP+CEq3btsbTOaVoo+Hib
         9EwOUjIILnRNR39qKsc9O9ehm0fXXv4gW4YKKnDeIQ74G8kSYz4PjiFyzu+x9v8VBqyI
         +ZDSHcKHm0L1Kv3O25wWcXozt9MkcOU+ryJ4Lo69ttkqoHnGsyzNePvTQ8mU2rVfMgI1
         A/jg==
X-Forwarded-Encrypted: i=1; AL+hErHvsX+uNOcamT1du6M4SV7IzPEfWu+dwlzrR7qXZJSHv40Oah+bHZe1NgSBVcD9WWKSnI7NFne71YlUPhJ3@vger.kernel.org
X-Gm-Message-State: APuU4Z/F8hD8/EgLTB5d8jfIv1MV2mOakuQHx6eGbDCc/cM8vzzPKZgP
	hAoTs+CmmP2Gm0RWaAoFL46Q6pXm/ZK5zludoMwpKNoIbFraoM71n6FU8mxWs+gXoeJhyMiII1M
	2hm9MkIrb2pxtNGj/EAxUvPcNhasHCOziOy2HCpP6eNSICk7tnvcxsR5d4v0vYFzaTlCW
X-Gm-Gg: AYBFou1NFbQIh6Mm3E23WHx2XWVxHFhhynL6DGwUW/pPW3/aJ/bpJDQ5dLv7ljKLdNN
	+FfxJLi7O/+Qek1M7EA0+zgyB5naLeGdN7vgDQ5//yfFG/0RoBeNXyzv6LTC88Bnc79gkTSqvWH
	CN/BXgT1SEV0kFRKdjHKDtPkCz7abpIf9pzFS+DOgJkRgPnkIS8c2QCDEM7PSDOYjBwiKx64U+E
	xok1TbpUuq1iVvtToLstZCMeyMYfIYjg2ythixtlqm1gkJHK0SxQO1z2xrXBV84MyMOnjcfOCp7
	br4dg82XD7kjf/H0eIpKhDYEDpUmVRQJtGpKapPFkKPYHJGKBtDtuOW88w8XLOT0/bvaKLyiR/a
	sl51w6eWtZRqjx6mhZIzO82qnfezwKio36v4SVa6DxEpi5d3lH6t+1EOnImMulCqV6HXaDLdC2w
	==
X-Received: by 2002:a05:6102:5798:b0:7b3:7653:5487 with SMTP id ada2fe7eead31-7d50610a960mr802011137.32.1794411617697;
        Wed, 11 Nov 2026 07:40:17 -0800 (PST)
X-Received: by 2002:a05:6102:5798:b0:7b3:7653:5487 with SMTP id ada2fe7eead31-7d50610a960mr802004137.32.1794411617218;
        Wed, 11 Nov 2026 07:40:17 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c5f53efsm3517355e9.13.2026.11.11.07.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:40:16 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v8 3/8] media: v4l2-jpeg: Add a baseline JPEG header writer
Date: Wed, 11 Nov 2026 17:40:14 +0200
Message-Id: <20261111154014.654617-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <qb6mqteoxdk7xb7qhgiruncdamptf7m62m3y4zrccs4cesxr4t@q3oukzsd6qyr>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-4-atanas.filipov@oss.qualcomm.com> <qb6mqteoxdk7xb7qhgiruncdamptf7m62m3y4zrccs4cesxr4t@q3oukzsd6qyr>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfXz2MkCqgg9XCO
 G+wd48WnhJKxHkIIBNQPfSUdPFe77c13Ssbo784BLYFynRnYRP7wKNUHCIq6b8gKWgBjRvqPjTj
 rPzscwydko0uyTtBSQdr15YZ48DemOA=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af48c62 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=l-wiyt6Y1aSZOmScoPQA:9
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: Cz8_2gtlyq_ULmmdOuRr2vuGg164As4o
X-Proofpoint-ORIG-GUID: Cz8_2gtlyq_ULmmdOuRr2vuGg164As4o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX5AdTJbvPa1mE
 sQV82xjX/FJLw4KSmvolJWaYY3ceZOFkaLSoqVYMMYjC2M5d/b1/bo9qcD8b0UeAXU6DNwT4Oyw
 pXBmLyfOpNN5Iz4pxGwNuT2EACBVzbBhGUGgKDiX/+cwc5FWVahp9zcaV8l8nNw3jW1xBdhoo80
 L67DcHg0vGOQJzocIrJ7JjSQPm/ZUao1dzzMLcuN9M+XnYIt8GYgsfuT5YssNLOY48kAdkseMvC
 PpBEIl5QVz0MuqMS4dpv4OAhsNahtYxuHA6yxSqFhofvKVdZd/ynvyNIvALCtScW5PvzXJUNpdH
 fWrttNqEOSj6zDGBEXDUt6l/ZMHSe0Tb+8RCh5mhsIE4YMz2ZTYJ6Z36FFU/LA2czAtoV9E//65
 4JWS13GWsT+jFBGf0LjXEt75W6tlGZm6My+NFnALcuqclj0ubWiLBmuSCnoz4qujrbIc90CTWHq
 +fHffILAUhFB3hZnu2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Wed, Nov 11, 2026 at 03:30:57PM +0200, Dmitry Baryshkov wrote:
> > +/* Writes past the end only advance pos; v4l2_jpeg_write_header() checks it */
> > +static void jpeg_put_bytes(struct jpeg_hdr_buf *b, const void *src, size_t n)
> > +{
> > +	if (b->pos + n <= b->len) {
> > +		if (src)
> > +			memcpy(b->buf + b->pos, src, n);
> > +		else
> > +			memset(b->buf + b->pos, 0, n);
> > +	}
> > +	b->pos += n;
>
> Now b->pos has advanced past the b->len. Is it expected?

Yes. Nothing is written past the end, and the final check returns
-ENOSPC. I agree it is not clear. I will use an explicit overflow flag
in the next version.

> > +	jpeg_put_u8(&b, nc);
> > +	for (i = 0; i < nc; i++) {
> > +		jpeg_put_u8(&b, i + 1);
> > +		jpeg_put_u8(&b, i ? JPEG_SAMPLING_H1V1 : params->luma_sampling);
> > +		jpeg_put_u8(&b, i ? JPEG_QTABLE_CHROMA : JPEG_QTABLE_LUMA);
> > +	}
>
> I think it might be better to write explicitly:
>
> 	jpeg_put_u8(&b, 1);
> 	jpeg_put_u8(&b, params->luma_sampling);
> 	jpeg_put_u8(&b, JPEG_QTABLE_LUMA);
>
> 	if (params->num_components != JPEG_COMP_MONO) {
> 		jpeg_put_u8(&b, 2);
> 		jpeg_put_u8(&b, JPEG_SAMPLING_H1V1);
> 		jpeg_put_u8(&b, JPEG_QTABLE_CHROMA);
> 	}

Ok, I will write them explicitly in the next version.

> > +	jpeg_put_u8(&b, nc);
> > +	for (i = 0; i < nc; i++) {
> > +		jpeg_put_u8(&b, i + 1);
> > +		jpeg_put_u8(&b, i ? JPEG_TABLE_SEL_CHROMA : JPEG_TABLE_SEL_LUMA);
> > +	}
>
> The same.

Ok, the same for SOS.

--
Best regards,
Atanas
