Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC6544B68B
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 11:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791459345; cv=none; b=WYH+SQ1N6A7yOx0MxxIvAd3yRrUPNuKFqoHZmty4+M3sxy0OOJdheGqYbgIKp9n6RK3KMquYayI2GLutK/Sf8o68w5rGshpsKqWQhWbmSqryk/9ZGSaWg3fhuuq98C69mkg8nciojnGaVcc/+TGZa913DP8tggcLaHd9EpHBeJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791459345; c=relaxed/simple;
	bh=rwWhjJygeBF8XRrG4xDSZx4gG4+AktM2mHlK8yumXmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oyyl/n1ZXtjSkqfebODBe4zfZLqf3nbOI1iUJB6umn2yLrpHGzlJIbEshMRhxxkZ+yDl1V+NmZdXn05tSTID53CiGQhjMWd0adM430gHsaQdvx8QYoaKRo0w6aaPNLqDKzf3qXprAk3M1h3HdRd9j7cLRaoKmP3CbC5R1nwVAjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXvqAvNj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LfT67SBG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXvqAvNj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LfT67SBG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK7fx2705105
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 11:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fN1oRv6rGdX+0gnFTYgpfMvfvkFbtEGtTqLBs1YULyM=; b=lXvqAvNjspEXOLFq
	68EW4uXZa1Ie+kUDBp3Mt5gLxZyDeAnO8+yU/5G2WYXvIo/+QnvOpvpO0PJx54sA
	DUOsq63RYpAX6gBHrBGwxbcVtFbBAHODORXO7L+IH7I2mh3Ul4E55k+Ezi18p72F
	rvGhP3k2q8qw+bWb7YmNY3dp7M3w5B3x1TYeXWMBLmhky8QMfudNRzdjqN78seuW
	k7Exb5r9VxE1Ei22JQE44q6pjyP2o4hNTCJcABilvrjtP2JQID48JLa48BGTYwvG
	H4+9jLKd4GJo6+piaXSmASbpW6ty7coE5c9DUTVqZ/lqvrIi3irx9osM6mzDJFv8
	n88AtA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2tstm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 11:35:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e46b4b700so881632785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 04:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791459342; x=1792064142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fN1oRv6rGdX+0gnFTYgpfMvfvkFbtEGtTqLBs1YULyM=;
        b=LfT67SBGpASerZr0SeNKwXrroYWcRImPL8f2AYbNZbVXKW40Ttu2Jz3ZqtsODlNuVY
         jkd4dqF6UnKZINIJHZ9Sv3p9mR5mUbKjxNlr07/F82N8w1GFI5uszBc9t882NgnSeWhI
         xfUMBmcQYs7JYLjZjOX53tSbvhcLF0upt9zLf4qQ/Sw+RGZfhTeJx40YhduvPL6ZO2eq
         46lKmeIA/ZWOuAZ8duLR5/EHWtSRPkOWu2yF5/a0219/lTAAYTtFqpyHL2dhna7tTNF1
         4/WDlHk700Bxeob5bj3RreSLq8u5YiZI+2eL7nu7GSZYvLcxKYzniP4JTjdXubgmXcVH
         eEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791459342; x=1792064142;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fN1oRv6rGdX+0gnFTYgpfMvfvkFbtEGtTqLBs1YULyM=;
        b=zavIGWG8V9CCiTpTjE5G4olkTYMecmlJKz/sBrEM5zCs/TsQ227eGuAi+dhohU3gP6
         YKUcmzo54du/eLs+cPCBp3RK5y8kRqggkXhBsLpptQ2dASp40iBHvjEEkkK91DSPb4Tv
         i878H7AKCY2gdKgT4oSycQEp8AUcW49oHDX4VPoi+5Lh9C3FajZq0dxwtyPrlzUhn3Yz
         lQQL/PJV7lG3JmO77y4bBSAk3hXD+H0+cx0S6p/myDfPNCV9kKewJxXjed16XYF41A2X
         +5rikmCLWtKnd+Z5SgjIt5oXRe+E1wGH3z/H9W9b4SoJMhcXBFvJIkc59ab8DWBRrDUc
         qz0g==
X-Forwarded-Encrypted: i=1; AKwUvBxOmCDRJYRae4/45qkDddVg2Y1IxFeKGMBSPAQfnTQy6IV5NuPpGui3pvdOM06cfWJdwbsgdDf0parR4+v9@vger.kernel.org
X-Gm-Message-State: AFuF++lvBPSdNEbQ3LlzVt6448yPVONUd/+g2WY108YcsSNjPWy/VMGa
	tqgaPDpC0Bkuf4ncwm1dS6rgaa93A1tMdIj0v/TH3qV0rdAQpZHP1WJkB1nKjOYqa04Z3dfGaGh
	b0ncl5nKzQrnVF6DFH4x3+TS02ypyYtiZcdlHqHkb1PvCtfskRsDoowfT5+Ng5g8s8Kp5
X-Gm-Gg: AYBFou3+7qghCkeAPkWFuuPMPqlEAsTzlvOdhfsh4+I1NHLLOx38cmCk9VwkR3Ze1I2
	QjfU948LJxHuvLPE0VyfFDeai9ABIb4W6qbqqUJXflNCaTGNbgEx2fcCIhNqkA8GO1EPtCrRS3u
	N60/miEPSOU34uVPaM9EUCbHMxm2b8SdVPV4nDRjwVXUfQ8siWzf/GP+H7Bc4S4Hgfaaq23klox
	ZB+6XXf6+eDi2+QKuYnJK+3oDd1d/I0iKwcCLt6HPRelvK3w+gs+vh77c+VIcmwitZnOslRX43I
	vLQKm4jXvo/MON9gxPJQGBzNwrrzGNyuDln9c506i6WM5JgyGE7RDMcD/Ck3TvXlmgRoH/Kl7cJ
	DOU1/nce3HXI4rNeZuA8/+rGll7CK9YKBi2tc7LTm
X-Received: by 2002:a05:620a:198b:b0:93e:9809:8388 with SMTP id af79cd13be357-93e9b895a5bmr1041751885a.72.1791459341889;
        Thu, 08 Oct 2026 04:35:41 -0700 (PDT)
X-Received: by 2002:a05:620a:198b:b0:93e:9809:8388 with SMTP id af79cd13be357-93e9b895a5bmr1041745785a.72.1791459341229;
        Thu, 08 Oct 2026 04:35:41 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c75b4e399sm9891941f8f.56.2026.10.08.04.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:35:40 -0700 (PDT)
Message-ID: <5e19888d-d037-41e8-a3ca-f92d9991f3d5@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:35:38 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/74] media: qcom: camss: vfe: Define output based VFE
 controls
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Keke Li <keke.li@amlogic.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Hans Verkuil
 <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        Robert Foss
 <rfoss@kernel.org>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-25-ed985aefd611@kernel.org>
 <307f12f9-8805-4b3c-92d7-422d994fdeff@oss.qualcomm.com>
 <0d1c5d19-68f8-4d44-9efd-f7d1aeaa7b32@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <0d1c5d19-68f8-4d44-9efd-f7d1aeaa7b32@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac7800e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=HyDj4FpERjvnZyVuxHIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Wzo3ysC-bHP0PqW51naT1HGZXhSdYNsY
X-Proofpoint-ORIG-GUID: Wzo3ysC-bHP0PqW51naT1HGZXhSdYNsY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NiBTYWx0ZWRfX8ouIAPSmQvYS
 4x6Rn+Bn9H0+t98cy6uFJA/q+4hYQXTjoobPapL+E/j7bvmiDP18kuWJHcTUc6ujuBJxSl15vH1
 Mj1DZ0vWj5Fvb9PYyDUSqHe9tCAlBO0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NiBTYWx0ZWRfX2dv0W3u23k1H
 0XylSOCWEza9yakLZJq9495oEv2/+zvV6Ud+6ZDcs6euGuhFD5nBHkZUAeebDujwU0diRYyGPuX
 lTMJY274qBAy6xhtKURfK76SwaasnBxHrDvPJUkyi3b/vfjS+OVudb5BHc5pRlqAXEuGiWWCcAM
 aWSPWfnNRN/vNJuwlwdM0Q0EO6RGDwxa4MKQRV6k/AX5F4QTJduB4h0eg3Wmx0bXvrf9NbaTOhw
 1eSxJNPENOf0bXRo2a3z0P4jrH5XcyD7Un8DLDiAEF84hZtDP0CVXTkS8zz/IRHnwQlqVETuULy
 zoO8STUfCQMOzf0rWvNB+xUB36eDlYssy27fi0EJk5LFd/QnJ4JxkbRD+THuuhvFZMP0VEL6X4M
 gQfK58gtS4TDWJVN8djdxckUPdTSYlAxie6iu5sk/Gt3g1yplekGI3Gx11Q0FZzxUr+Rt3ZYAdY
 ydf3rGsAA/huf0yw5WQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080046

Hi Bryan,

On 10/8/2026 2:17 PM, Bryan O'Donoghue wrote:
> On 08/10/2026 06:55, Gjorgji Rosikopulos (Consultant) wrote:
>>> +
>>> +	/* Output based API - new and shiny */
>>> +	void (*vfe_output_start)(struct vfe_device *vfe, struct vfe_output *output);
>>> +	void (*vfe_output_stop)(struct vfe_device *vfe, struct vfe_output *output);
>>> +	void (*vfe_output_buf_done)(struct vfe_device *vfe, struct vfe_output *output);
>>> +	void (*vfe_output_update)(struct vfe_device *vfe, struct vfe_output *output,
>>> +				  struct camss_buffer *buf);
>>> +
>> This also deserves good commit message, this is exact copy of the other RDI API with other arguments 🙂 Shall we migrate
>> all existing drivers to this api in respect to use other deprecated API but having both of them leave in vfe file which
>> creates even more confusion and readability of the code?
> 
> Ah but that's the point.
> 
> You add in a parallel API which is 1:1 but which can be extended to 
> describe completion groups not WM indexes.
> 
> WM indexes have always been wrong - limited to RDI and we have all sorts 
> of spaghetti code to work around that indexing mismatch.
> 
> The fix is to stop doing that so yes, implement output / bus-client / 
> completion group - with wm and planes described in the output layer and 
> then move everything to that new interface.
> 
> Including new submissions. The only real barrier is finding old 
> hardware, making the changes and ensuring nothing breaks.
> 
> Since there's no DT dependency its "just software" - easy.

You are maintainer and responsible of the code. But i also want to make the point
again (which i think others may share) that having one vfe core code which is trying to support
different architectures of the ISP's which are quite different is not correct, it is match easier
to have different implementations based on ISP generation (different sub-device) and abstract some
handlers which are shared. As of today camss vfe have mixed interfaces try to match multiple
generations in one implementation. So that said i will not be convinced that the direction
which camss is moving is good. However we need to live with it and add support as you are
proposing, so all is good lets wait those changes to be cleanup and we will start re-basing.

~Gjorgji

> 
> ---
> bod

