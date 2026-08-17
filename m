Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C85C3515C1
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 11:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786965612; cv=none; b=tJIdaQj7aAq5LzE7EnZkn7ZOCUNC6noqZZ48ihduw22DNQNOJDbXVQghUNL8inyWkd1ciavq8Eiv/UYkoJ32W0yTuLMx7UIJocJ7dmgoBU6xfJm9f+G48TbSzoXsxAjswB0Ms4yxfpoMlWXMYds1M4ABNY7uiJKmtSoR6od3c9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786965612; c=relaxed/simple;
	bh=osvzgBpz8nZCp3XOFawKsT/v4+qU7q5DC/cLetwjTdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e+YRpKb6P2iZS+rcFYL93djv/uyeECHISlA77KuPecoY5eCj8vXXJ9RjTGdSAS1RzCnP/KUopNr9yyS2SJkidt8Uod9gS+Tlfd/86shIfjcZxV9LxAg8RV6QFoZaKrtZNWa1wuCrZKUJ7gMA1VbfNKvXo14mcQrCd4QkNNovT+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AfFUcCSM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GpVGRkB5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AfFUcCSM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GpVGRkB5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H9dfnU2470492
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 11:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PXEgfb+ycUmKnB3Ohf7t8gp0XPQqN7ee9k+HPlfSajU=; b=AfFUcCSM6621VzT2
	QfQHIxlKZvh7rWeJ2j70iw4ATxZDgl3OVYopFw1PtSS8SrhVnVJ6r5SNtxj7BurQ
	cPWYyZG+XWxlhI/duPnoAZ+IXrQL8EQd6OKnowgLRHxUDHxXX0VpkbHqlTULPryu
	VAO3kc4o3j5g8C/M+8s/njcGZA61bnf9rGxtsWuRhIN7fgilxRx28LqwuwE4Njw8
	dJbyQJt193/EGpNL6kRabdoKjCRaKHB7slJbsgOIDtN2S3TbfgCIx6UvWYm6+hF6
	/6+oxEpaGtIFzvOxGThLZ20cznylaJ9h+Mfp5RNs1ZYATr2iHD7ZTHq7Mp5iLOHq
	bLLtNw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wm7rxkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 11:20:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8fd356ee3a4so2954606d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 04:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786965609; x=1787570409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXEgfb+ycUmKnB3Ohf7t8gp0XPQqN7ee9k+HPlfSajU=;
        b=GpVGRkB5+i5LNH2IYIWyqGTA/wPvpuKm7lQG0DfpRYLpO1y4W6/NeJiQqAzM7KoUpG
         BPC0nC7JsjHMZ/kJc+R/nkOTsHBNZLuG2mOHiRB+9ULwsL7ikiXqCQHHDO8utxpBpS5c
         YF7MDQ5QJd4bH2AhQ+ymwC1IcgWKtMZMVzepAqOGkuSI7rivSxHNVYjmjga9DisiIabQ
         d7ay8ucdM8zs7w/U/kcBD4h0jViL71IJxn+EK0BHmowULUdjqWLiIsKv76GQmH587XL5
         Jo/zsGhIDi5nhQ/dTXO430iL3FYmzHZsUV/05iajTp8ZrsTT9NkHib8xcAoi9hWTtatM
         Hejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786965609; x=1787570409;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PXEgfb+ycUmKnB3Ohf7t8gp0XPQqN7ee9k+HPlfSajU=;
        b=YOMLtu0oVBcsnZMxH55lMh3PR7iFPny7NcgImRi0p/zkEVxXDPdIl4zicyhE3gWhMt
         hyUVbvdwnuwupuzsdiZ5UmHAQfhcfaXv/fHXSs4RFIpajaZz3sUBWq1HKKanD8GVn18O
         +cNxZgHhxnlPYcanEKvvC7Zj/fuS1A5ZrESE/kFDtnRrUzKyYiz77Z0G0fhQwi0pkx4a
         TNV2zQCtxzUjQZmGEwsAxVSzWLfVCPlbVytAJCc5NAr6WZC0wAuVwO//dpFCDo0Fake2
         njj0iDunxrnacrjCfHKcp0yqQbxsbFzv2pJpb+QfXQaqAtoWL5ejExGBxpd9EBKfZ8Im
         A02w==
X-Forwarded-Encrypted: i=1; AHgh+Rqrmd1stzaFnQc+Th3IOc4DhwUUD+2u6VWdlHO8FosyqEghGVhn2N9flbkLSrkEhbNh6aN1W4nBoFwgjQZ+@vger.kernel.org
X-Gm-Message-State: AOJu0YwSCs3wJohgi7AEKpIDprzQYJGrRU3Btx9ydQAgWvAuAZu1CWbO
	Wv2PPXpJiZrEYgw5obkG7uWuqzsnrpYEtGcM8+eX0McQWT3DptaiqiEtEKrSDjfpVMALT9X8fg8
	In4xX2A3rvQJqi0UW7+S+3eB+Tp7zxrfl4RVQo0jBzC1MrjkDamThZFfUssfkiwDVVsoi
X-Gm-Gg: AR+sD13u7Y4b21IkGHM1HVb34ipZyuHt5hGeDsTryFxgCUcQ7DlQaNF7dOQZid3P4di
	Mzw1p0Pj+zStj98azv7KYOuFZUwwE27nhLgudgpdaep3+MguVDJVBS5htjceW8qmhSszjPARYHT
	PrRjFI4tAVtHgquW4sCsbXdTK6OjMmWlFx0Mi5gb5dDM8Lbn93UG5Ty3EdfNzEo9EOMrZYB7f24
	0d5dgx7Auv0LwcR00JUgwhXPgtX8QLW7aiJla08tDQuwdhVHx/8g6K+sPvJ0VRg3PqTUiPd88fi
	uf/C8y6JYreBHvRh9JIeGzWpt5ktw98cCWkyXhkM7fdowRT0PYsXZp7pzuQrgRAG6siN6oP1WiF
	mlAqOH/Od/u/ay3eyHJ+117Zp
X-Received: by 2002:ac8:58d3:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-52d854c89bdmr195887501cf.5.1786965609414;
        Mon, 17 Aug 2026 04:20:09 -0700 (PDT)
X-Received: by 2002:ac8:58d3:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-52d854c89bdmr195886821cf.5.1786965608835;
        Mon, 17 Aug 2026 04:20:08 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b977a3sm8480566b.45.2026.08.17.04.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 04:20:08 -0700 (PDT)
Message-ID: <02cc6973-3e69-4c53-99b1-7aed7cf953e2@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 13:20:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: venus: hfi_parser: size a raw format property
 by its own entries
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, Tomasz Figa <tfiga@chromium.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
References: <20260812-venus-8996-v1-0-6615f82a63b8@oss.qualcomm.com>
 <20260812-venus-8996-v1-2-6615f82a63b8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-venus-8996-v1-2-6615f82a63b8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6oMjCuxkgUb_rNWYtK1ic8HYxeKJY-If
X-Proofpoint-ORIG-GUID: 6oMjCuxkgUb_rNWYtK1ic8HYxeKJY-If
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA4NSBTYWx0ZWRfXxMMmaqMfoH/K
 OJqB9ij0cg7jGxC8YN6yI+mgBB9Xo9kZlT4bScA5fp6gZzdmPgyrlf6CFbSGyJhkH8L/9iw5O6Y
 rgvRnAXoWZ+B6lKKxkZ6IKjyAMWEKRcbM10jmxFqUF9bMkoPn8if6q6p8hd7dyMHCa5AJAwxIB+
 wkhn/hfipXC0WZlMjnsd2Th8FnF9zlCJO9xc+3iqR9pQDj+BJaBlYPNRw/wTP5mS/h5/+cDjM0B
 yq1807jc5v7c9GieTk3lMzgvulhHJ/+Sl8GEiE+zQluu8xSyWmHmyzo7pl+wc2Try1peH8/kTvY
 GiBDBNdF6SeZy9/LkX48YTkPqjk04HKYZ+2SvqyFEmxdbb2xBPEpUxilliWf8x401AqUP1KTz6r
 8rf7oW6mjvhWxezUo5lAdMHtmsztVSi4xwpoQ6J4FYJQVsLcLiXWZ3bGQv1pfPAHqPf18xLrxqx
 gD6yEPbyGi1n+pfM54Q==
X-Authority-Analysis: v=2.4 cv=YqM/gYYX c=1 sm=1 tr=0 ts=6a82ee6a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=eYyzU6XjkX6kC7LtGWoA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA4NSBTYWx0ZWRfX6j0PK/yUrKvm
 CkuZ6NbtbmaBiy2ncthK/7ITtXHic1rvw7c7vieVMO1hYyFHK9lEpW5c1yWc/SFK1rZ+l7xd8P/
 leFmtEnfLFNOzAaqWlYNKjEHgm3jaWg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170085

On 8/12/26 10:01 PM, Dmitry Baryshkov wrote:
> parse_raw_formats() walks the format entries one at a time, each of
> which is as long as its own plane count makes it, but then computes the
> length of the whole property as if every entry had as many planes as the
> last one it looked at.  The result is only correct when all the entries
> agree, and there is nothing in the interface that says they must.
> 
> On MSM8996 they do not, and the parser walks off into the middle of the
> message as a result.  The raw format property of the HEVC decoder is 120
> bytes long and the walk claims 152, so hfi_parser() resumes 28 bytes
> past the end of it, skipping the codec mask that follows and landing
> inside the property after that.  It resynchronises eventually, because
> an unrecognized word is skipped one at a time, but everything it jumped
> over is lost.
> 
> What is lost matters: the property skipped that way is the capability
> set of the codec mask 0x7002, which is to say the frame size, macroblock
> and frame rate limits of H.264, VP8, VP9 and HEVC decoding, all four of
> them described in one block.  Those decoders end up holding a bitrate
> and nothing else, so frame_width_min() and friends return zero and
> VIDIOC_ENUM_FRAMESIZES advertises a stepwise range of 0x0 to 0x0 with a
> step of 0.
> 
> Userspace cannot negotiate against that.  GStreamer builds the sink caps
> of its V4L2 decoders from the enumerated frame sizes, an empty integer
> range collapses them to EMPTY, and no pad is found to be compatible with
> the parser feeding the decoder, so a pipeline as simple as
> 
>   filesrc ! parsebin ! v4l2vp9dec ! videoconvert ! fakesink
> 
> fails to link and the stream stops with "not-linked" before a single
> buffer is queued.  Hardware decoding is unavailable on the board for
> every codec in that block.
> 
> An earlier overshoot loses a raw format property too, leaving the
> decoders with two of the five formats the firmware describes and HEVC
> with four of seven.
> 
> Accumulate the length of the entries as they are walked, the way the
> downstream driver does, rather than extrapolating from the last one.
> 
> Fixes: 1a73374a04e5 ("media: venus: hfi_parser: add common capability parser")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_parser.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> index 3413b91b0b7e..f79c368647d7 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> @@ -171,7 +171,7 @@ parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
>  	u32 entries = fmt->format_entries;
>  	unsigned int i = 0;
>  	u32 num_planes = 0;
> -	u32 size;
> +	u32 size = 2 * sizeof(u32);
>  
>  	while (entries) {
>  		num_planes = pinfo->num_planes;
> @@ -183,9 +183,10 @@ parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
>  		if (i >= MAX_FMT_ENTRIES)
>  			return -EINVAL;
>  
> -		if (pinfo->num_planes > MAX_PLANES)
> +		if (num_planes > MAX_PLANES)

Most of this patch (minus the line above) is in next as:

bd595b745eb7 ("media: venus: fix payload size calculation in parse_raw_formats()")

Konrad
