Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04744385D91
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 16:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784652905; cv=none; b=in64aleADJspCor17QDbZNLhXuuzHPlyge+hy4BJsNeblhvBUn6wlaLZ/PvnBp1NrOm8TgUnVNiMibdMY7GODNvwO7gVTRiU5TgKwB23kFUbqH6QZPoZMdh1YUmlHIHi1n6TLu1uJQZvPx4oae3hQr+SPMj2sLmbepVsVdNzADc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784652905; c=relaxed/simple;
	bh=tUOGkrU38mJEYQ6zuey7GmqIR1DTnR211ZbxiXdMIpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KZ38fjjSJ/IJx8tdwnSPQ62CsPkABV6bUpC80hCipKPvyJDHkiP/c34v/jPgLdumKG8/yon/+XK/RmusYT+eB+LYqHydNH0ZFxHyxmKuijhqH/68A7pCC64KBQl9s3rSZmOBjE+sQrtJC+zmXSXsc4KRzobOXlL0Y0Ni+QYhB3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjCIE/t/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jifx4CeU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjCIE/t/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jifx4CeU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg35p1592023
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 16:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l1o8yex40q2dVFxxH/gSrgSpN6Ch4JjKqRjhqPQXctg=; b=UjCIE/t/65fmEIq0
	kq92YjXNqmxGYGE81D2sfm+knDmJT/TNZRdGfegorbV6og/Io4zCHGkrO00UtGqQ
	t9wotnCGH+wXIzfdOzGVy6D2b9GDO1yT/USMFtBiwAjS0A79zcP60xeA1xs7SvXT
	6OPFESLQ+Jbu9E1tgZEHuEO0+NhPLf9b5ZNtt12Y3C0hj19IOM1gjQy9xjs3Ujx4
	9iArhVY5zAXHwEeyqnYgCY1iD8GYU274RAnrI79hI81eSmNiopFcCKpLVY45PRf5
	Dn54CcHUJ+vl5M9qF6rCNXRFDaMDjB9uDj51enUvukdKRwFlTGQKLgnr9QUAYcB+
	XBUPiQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as3yjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 16:55:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso9266692a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784652902; x=1785257702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l1o8yex40q2dVFxxH/gSrgSpN6Ch4JjKqRjhqPQXctg=;
        b=Jifx4CeUlstoBuGCBbiEktS+hgG71KzAN73QPYp7+E+r8AW65LDQ5S8SYw/YnArBd2
         cAtDQMN7VhvptHZ+7txg51YjY8pHZn7BpEjgoPuZENocPoCKMq5r8Hbk6SmAArmnvwen
         nrLHPZ82ewbEqSh8oZZnbN8lB7HSO8StSI53vD8OjJIcfcp5przvbfCTy368I8tgWft6
         UdYLot36ZyPJzml5Ni3Ka4D5vI6RrMa0wcYlPr9TaGvfLvN/hBW5Mx1MuB7XFl8vNWKD
         /nM+SrClM65Lv+QocMRr4rYODgSo2EvNuceqyrkEp8Q8Nzv4/4WZIFDfeSdSAI/UaW2I
         c8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784652902; x=1785257702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1o8yex40q2dVFxxH/gSrgSpN6Ch4JjKqRjhqPQXctg=;
        b=V7oEM2KXZqVNYZQ4pcW6dzvcmIvWBwTDpRGL2NF9Qx1RtqPWXPbLoxpq8KSF0mzlDX
         uc9EiBTmjMzxBrfoTz92KS5YdZqKSUUpx/l1fobC9JOVWa3FGsGlcWUh+0RSl1pXG6Qu
         e7iQuLWjDNujG/TfISAZvg1rZGmEukWv3jnBPFZlhnS5kbrJI2qRw6iKyFHugNGEdXoz
         JhLFlbYhn+xiG1fCHbGv44E3KkVLGFPGoaP50RPEdfLZiym8LZYFIBxNWjcFJHOBfXND
         avDVz5Fdqkedoj9Yjgi9zX/jn5GprE7vZdr2bgsNzeD5WtCD2iQ5tehuxPS5et9N5mxL
         wznA==
X-Forwarded-Encrypted: i=1; AHgh+RrToH22vfZYzz+2vbtn4SZ/K5maWAIp2hvisym8wmkJKWwn3IpMYPn0wsWypStzf/tzW0Bv6oJgQmiMPJ+c@vger.kernel.org
X-Gm-Message-State: AOJu0YyJqYWyVWdPaNgP/Yo5dxxxh8+QOwY2vwDrmxvGm7pXEIi69PXY
	OwsgPS09KUfYoyrBLSTP2NVIkZEh/p3PKgbieB49OJXz1XcSH/uQW20nPi0Tvd4G0g6L8GmvjN7
	1pNl758+YpQ1f745ghngp+9bSgNrVT9TEncml2Jit48G0dzrRuR1RnonoO+WN+r9MuiZg7cnUP2
	pX
X-Gm-Gg: AfdE7ckEd+qs1c5atyIyXbmuvLBsc1GAh+AMRtDnRE2sQdkqclDPM8iyH9g0yBskgA8
	HUNUDnjFDvis2iNy9Ic0ZYXDrNQgUzAgozClnx8k3D/eB7ZiPjU8PqJEjcZgEqkHLJHOhrwCYT+
	rPSwPhummBR8LTK74CDynb/M0PVj/XuztpzcBi4HZ9YyvG3jQEA9EyeZAsXr/VcRwKtvQ/pZ0rb
	R4sHMk0RQVxLUtVM++rXwWaP6UVBKFxh/a34XP26LtiAq2zi66EIGRU4ToVDNMhEVRPmawTwfNe
	aO3Vw+ZhERzgUh0GPVMgX5Ut433H0gY9DggqZD8nqaCHAR/YtmjKbfzo0MBCWBWRv03RqFvdvLy
	Hneu4mYbjYTwu7xrZe//BKsFHd4uVRO5fhHvKS8jz7AI7q782HtD7MZmcnXGI/EX/bQmk9tI7
X-Received: by 2002:a05:6300:2704:10b0:3c4:1708:9cd8 with SMTP id adf61e73a8af0-3c417089d37mr2522200637.76.1784652902522;
        Tue, 21 Jul 2026 09:55:02 -0700 (PDT)
X-Received: by 2002:a05:6300:2704:10b0:3c4:1708:9cd8 with SMTP id adf61e73a8af0-3c417089d37mr2522176637.76.1784652902041;
        Tue, 21 Jul 2026 09:55:02 -0700 (PDT)
Received: from ?IPV6:2401:4900:1cb4:d969:b5b5:8f5b:ef15:61de? ([2401:4900:1cb4:d969:b5b5:8f5b:ef15:61de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc61637sm657080eec.8.2026.07.21.09.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 09:55:01 -0700 (PDT)
Message-ID: <8885f841-798e-4c8b-af10-88551f39f2a2@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 22:24:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dmaengine: qcom: gpi: Fix SE ID and SE Protocol fields
 widths in SCRATCH_0
To: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, bjorn.andersson@oss.qualcomm.com
Cc: praveen.talari@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260721-fix_se_id_and_se_protocol_fields-v2-1-ee1d63d6c549@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260721-fix_se_id_and_se_protocol_fields-v2-1-ee1d63d6c549@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE3OCBTYWx0ZWRfX2J2yha7UuG2I
 4wla4kreCniurDA/EsLNiwGy7LjCSguylsp5JR4679ra8cSuNOETP5l+nZ5VdOr9KHL+xSgLhCq
 jcblOhg2Gr3SiLik13/ygMDnhz8XRaAlzK5CvRmdROBSgH6Ue3tZmFg+xjOAEzVJ3Ia/e35yhNj
 YA3BWmMLU7yyU6xiJ730tI64qx51lt4A2OPpW+StsmNX+izMM+D6zNK6/du3TY076fzqtFiDGPr
 se5wmrycoaVQR0mqdY6z2jXz/NvAfV4o/Wcj5Gi2L/g4tBroIg5H84z5TW4ZWgWvIwpl7MaHMWf
 6tIKWiqtBkiZ3fMaIk42VqKAt+uLnXrMuEmKBXCTdYsLbhR8iF6tVI2Jk9/9cmCt67mAPE5Flwk
 wGOCVM+JEpvqTYd/gNTVMGcBTtD5s3YRK4LEjEnB+0ONYB2z6TtB9Au7Eid2d+bwD1/O7kBz3J/
 YfQf6i4k28CrJo9vo0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE3OCBTYWx0ZWRfX7ZJm/romnxTZ
 zQe0IuzMkdhZ7tfzzdoba3HDwyI958nA+Lf+17RRB/uDlTH+dQO8LxA/yqIeeaWQxGPbsvxYISA
 7FNJvOz8V9ldZ3Xi4P89gTETfxTVtyc=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5fa467 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=k8JVevEbTmNoh4gevwMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: zKp8Dm7UocHcJ9KF55NSxEO_TGdHFp0b
X-Proofpoint-ORIG-GUID: zKp8Dm7UocHcJ9KF55NSxEO_TGdHFp0b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210178



On 7/21/2026 4:45 PM, Chandana Kishori Chiluveru wrote:
> GPII_n_CH_k_SCRATCH_0_SEID is currently defined as GENMASK(2, 0), only
> 3 bits wide. Serial engine indices >= 8 get silently truncated by
> FIELD_PREP()/u32_encode_bits() when written into the scratch register,
> causing the GPI channel to bind to the wrong serial engine. The
> channel allocate command still succeeds (it doesn't require the
> target SE to respond), but the subsequent channel start command times
> out waiting for hardware to complete the handoff to the (incorrectly
> bound) SE, and gpi_send_cmd() returns -EIO leading to GSI usecase failures
> for SE8 and SE9 serial engines.
> 
> Older documentation, such as the SDM845 hardware programming guide,
> describes the SE ID field as bits [2:0]. More recent QUP hardware
> documentation defines the field as bits [3:0]. Use the wider definition
> to match current hardware documentation while remaining compatible with
> existing platforms and enabling serial engine IDs greater than 7.
> 
> Also update the SE Protocol field definition to match the documented
> register layout and keep both fields correctly packed.
> 
> Fixes: 5d0c3533a19f ("dmaengine: qcom: Add GPI dma driver")
> Signed-off-by: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>
> ---
> Changes in v2:
> - Updated the protocol field value properly
> - Link to v1: https://patch.msgid.link/20260720-fix_se_id_and_se_protocol_fields-v1-1-e41dbb107d97@oss.qualcomm.com
> ---
>   drivers/dma/qcom/gpi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

