Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590529;
	b=PCg1XwYH+WOcSmPbohzSkuyXKOVC66EPKak9gQ7Qtts+dfq/Zp/lXXNEGyQ+AWlSOzhj
	 V9QrkwFLI+ySfK9zai3VSUin3fxeEEIZ7/UlYDFzFX0WxcsJAxbqJwalzaL0CqBe2D2Ax
	 jCCAnkdtEVlwBij4Yy67nH27bhUJ1YG+BckTkMtxvOYjPaquteCwJP98NUFkd67iHWhAw
	 DOZB870qNtB+0V0QY1u84IOnqn+rGqET1jyNXO5sAS/NxRCpAdBu0M68WFv9dYKVA/us7
	 Rcs6Q7Tz0NZqqqp5vW31goYVTzFhmZYiCTNl5TPNGjp/cfiRuhQVe2S8Uuf/k+Zz7fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590529;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8mNXDJzEPLAkTirj2phYmas51ZDGCneGM9OsyGulW/4=;
	b=1ewc68NgroouCX0WXwAOfLVS0cBdTN3b8g9r/V/j998hvudKz8cVd3cBbHAcm79+hzri
	 Bd7kDTbek7v5/rNEonbfKpdwr3zOqwelx/fBUPZ4Xq2ZgnxmBL2cylEupzR2p+t1g11OQ
	 lcox/cWHvWKs+EcKXFmFFcJi6ifcOVwpSrOK9mOQDAhYlWHfe/3yc58mHcmXwdnX8wd9d
	 Psjuuh3n7mhau4Bg0aZa7UpLJnsvrxJ29zcmMBgBD339eZODCYC+2Ylgk7uDxDUOR03A/
	 LejeBvZDl4MrceXf5896zryxT77R4HoLrebRsg3u0e4W2mJMrHidoWlDGEx6Fy8bouA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eeHmZHwu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TyVawEib;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE25606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDE25606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eeHmZHwu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TyVawEib
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDf1C1748541
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8mNXDJzEPLAkTirj2phYmas51ZDGCneGM9OsyGulW/4=; b=eeHmZHwuumefcCq+
	9Om0caRyw6TgR0Ueg2f0wP4Kw7z78dA7MDKTqPXxSJ8JeniikROzhDvSU8dphnsV
	BLBIUX2ZIA/DNy2XOaA5ZL3uZ7VtTZuEzKSbqG1RiVieqN1ZzZe6qo8E0YYQ81HQ
	CA7YqX9nz6OhWf8tGVi71IMxmxczDZqrApnf9uQR0ln+kR0rb+UDgV+A6rZ+/n0I
	bDs3l4KYF+3NtdunvfcNxhxaqZ8Kt5GJ1JjwYBZST14HQgqw4ULgtXmu6i+goyOQ
	DOf0N2VozTavvhu4e+0j0XKrbhIdgn1QhyOFiMXNbhBeQKqPbwwHem659865XvyA
	wSNbzA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r393p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:48:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac58b24so21242785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 06:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792590527; x=1793195327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8mNXDJzEPLAkTirj2phYmas51ZDGCneGM9OsyGulW/4=;
        b=TyVawEibZ/vEiJ3s/jg2bHQr+/bUevZefvM5bi6ITSnuUJJfzqCEssQe9M4yoGYn0w
         GVg5phlm4egJhiV1O4PaXkWGdnArcvR5ithKWatLuVTUkIGv2PtyNjIEmsUZ8xsvVZUu
         ntak0XZlh3YXdpsrg0FueOnkxlFkHb1HyTcYmU6b+wStRgVUO5NkHgPdpdLP2liBbth3
         sSOcMp5VaneZrgrV4eLPwSkWxwFsj0yYz8mxYPjrY2HhFILOQydAjRts+UYi8/xzqtql
         1kjCezKuaaOZ2kiZ8wIBvzpjGH2r0Wfg/BqmkZ1xG8qSZHWloPuAACvoZPx/0d86PMxo
         qy/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590527; x=1793195327;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8mNXDJzEPLAkTirj2phYmas51ZDGCneGM9OsyGulW/4=;
        b=bDLnN8X/sbdHzKOlzQZIHzhSvFhskZTyTRIzoeJZJLlf4sjVn2TB/gFbqMzjnIezHN
         nVu33vncaITy79RR78lqRDZKlM6e79stQYgsFvyZiCdBGYH2DPW2n8IAXH7Y5Wquyy3t
         O4U+OWeaz/yQ+tKijNrvJcSrqggW4/EO2pNGp7bNjl8RTtYRnEycZya2QnJS2UC+xu5o
         E/E2DO7A/L1bcBcQ41rji27nysqyCzOct9aoatJ9nTCVbi6pL6Af3LeM4SvjIJsepD51
         J6syRACH9yZ3hr1OmEpp/iCZ5RTDfFIJOfxcsEC+O3ZfvyBuAphweiEy17U6gNuT6BBr
         YA5A==
X-Forwarded-Encrypted: i=1; AKwUvByNFSdrjGrDEgWUz+UusbQ4aF5nVAxPnaK3r9t2sLayQRQXSegC3nuFn+DM3W+ALvvsHMlZwp16BDPeeByf@vger.kernel.org
X-Gm-Message-State: AFq9FYKVpIS4+IemghHiwlkYlBsY64syH2elAKjcEVNvyY0dAyQ4Id1e
	lwkqiBQkZXic0fKJFJLxHCQhnqjGiDkbSAC5FlCsaxP8HHXFdt7YZUP5zeS/PYC6+QIKWxCDfmn
	gcdvnpjyMwMPBVzNRj/+Yev6QPnAG9kfh46p35Ta/JU+8KynuxwOGbKSd7ql94qfXKGFf
X-Gm-Gg: AYBFou3GkjvHWUvXvUUFF6qzjSYifoW2KM05bu0/MEbb8WU+tzMbJXf6QQZ6helXjau
	qlaM28RwJmRYxUa2dRxyDdrlfLT/mVkAsmHsHunxnrR9WOuCjTUCBnmqiwz3Cn28uvBLoWJV385
	HRrlsFMtvPF4i98Kx9zqmbJoXoBrN4tBuBlBaDvHI5dzkWnHkaO7CJ9sXTmUt0N2MVtvj/+qA2b
	t8D0UiycG7x+u7Xwt6a8Lx/CAH/LRUZjGxVS7m07OpbBustGr7q+cJMWnQw9YVoEB4G34//5mWL
	ZoopkDY0EhDuZ87wxjfB7AIc7M4TuGd0Ms4AHSTfnLyO7sbywsPsbOh8hIJT6jrZNZoxtGSPCXY
	Milf+mDXQzP9KU1m2OhgihQ==
X-Received: by 2002:a05:620a:2913:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f57e5e2cdmr501591885a.1.1792590526856;
        Wed, 21 Oct 2026 06:48:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f57e5e2cdmr501585485a.1.1792590526242;
        Wed, 21 Oct 2026 06:48:46 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1f0526sm7553266b.1.2026.10.21.06.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 06:48:45 -0700 (PDT)
Message-ID: <c2b5f9de-d1f0-4131-82f4-396579520515@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:48:43 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] i2c: qcom-cci: Factor out write command queue
 programming
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
 <20261016-cci-imp-v3-1-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-cci-imp-v3-1-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8c2bf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=J2fI_2kDf8iagJYHrR0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: NhK1btHRfQfh5ky5Vhtxzgs5OtMKeZAR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NCBTYWx0ZWRfX0oquSVQep8j1
 AlrW56a8Rc+dZyxlL+d7B6vOXBH1m5+cGjK9lCaLmGrJzo/oUNKXMCkxK1f1pT9lWJ21emFC0tl
 /2pBtl2ybbLTVb96xXbF+AVodFAHdI8TqZ74l0ZJwE5NvZi/8FoD6s+MmncRRHLg9LVYZeLlWAL
 aOmXeEWbrcbUfy52tmCEaP+LShIS3ghW0ymcEV0wMMw4mUPZ56vUcjKiT/dFK4V1tyogRwHPnbA
 douaJdrJgjHvlU/QY8kH4vuOaIPQGk4f8MaP2eLCgBxsiyuxJ/JPaWg89msYOreJjjXSpXES3xM
 pJrU9IYp6sfNZurwvlp5NeuF/v53CIdD+xlC8x6aBLe2OLSD8dFFRUEv69qCIABIA7wXr7/6XG5
 6bfJJ1rEMwQxIVjuO37bjEUV0KMnh+BWa1kZLkDVX70ArT9HMcvC1hAr5fCT9D5hCZGfjrtZbzK
 docEaje7UWyrRUpWHYQ==
X-Proofpoint-GUID: NhK1btHRfQfh5ky5Vhtxzgs5OtMKeZAR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NCBTYWx0ZWRfX6IxtzJN6KJc4
 XvEUNybUOMW5D1C28yBw4xSuktjyYjWfTUjlneHJ414k9ABpTfC7EEcL48mDd3TBKI1pvFomu/I
 qXjHNEOSD2cvC52ly8h+02nUqNg7ChI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210054

On 10/16/26 10:00 AM, Loic Poulain wrote:
> Factor out write-command queueing into a dedicated helper and replace
> the manual byte-to-word packing code with iowrite32_rep().
> 
> The resulting code is easier to follow and will be reused by
> upcoming burst-write support.
> 
> A command can only carry as many data bytes as fit in its words, so
> validate the length before building one, and do so where an error can
> still be returned. The I2C core already rejects a transfer longer than
> the limit advertised through the adapter quirks, so this is only a
> guard against building a command that would corrupt the queue.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---


> +static void cci_i2c_load_write(u8 *buf, u16 len, void __iomem *loadq)
> +{
> +	u32 cmd[CCI_I2C_WRITE_WC] = { };
> +
> +	cmd[0] = CCI_I2C_WRITE | len << 4;
> +	memcpy((u8 *)cmd + 1, buf, len);

LLM says this is no longer big-endian friendly, but BE arm64
is going away anyway so I woouldn't really change it

> +	iowrite32_rep(loadq, cmd, CCI_I2C_WRITE_NWORDS(len));
> +}
> +
>  static int cci_i2c_write(struct cci *cci, u16 master,
>  			 u16 addr, u8 *buf, u16 len)
>  {
> -	u8 queue = QUEUE_0;
> -	u8 load[12] = { 0 };
> -	int i = 0, j, ret;
> +	void __iomem *loadq = cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, QUEUE_0);
> +	int ret;
>  	u32 val;
>  
> +	dev_dbg(cci->dev, "master %d write: len=%u\n", master, len);
> +
> +	/* This condition should be guaranteed by the caller (i2c core) */
> +	if (WARN_ON(len > cci->data->quirks.max_write_len))
> +		return -EOPNOTSUPP;

Likewise LLM suggests this is an odd error to return and I agree EINVAL
could be better

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
