Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234410;
	b=P7zkX+d7KkUOQPDASwNxsyy8hClaXfS8q6KtyF3OQL35YszEBVtBTYx18L50ngsquO6u
	 OUeNsqgyNcUxZUy58PM6tcdYYXdrbpZnUbgwpC9+HGN0EwIjbam1rGexNwTcvOoCcLgzU
	 RcRDd4GPFRNwPq1EskKw6kZ3zP5Kzsv3DdyoyB1+KhsxJyX9cFCGK9gN2iUUpbnw6QzBw
	 xxvOxWrfJE302gzidQWMyB8CuIbEqvH9F0el3pTy8uOGB6RlM9kCRCjzOMUT5qtuuBOPt
	 A+plLpo2H8wy3tJC87qdnQf7iUiTTL+0xU6+SZd/dz41Sg2XvZwkU/chOcUnda1xmgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234410;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xH4GuIdgKEDoSqYRkyo/VjSwPcMicalP2XhqgL8SdTg=;
	b=b+TTUwQxQFTVksyl67NtEomXygvjnnuFiVy5tFUg/6F9bnLo1srZyo34SDLeceZvQCjm
	 ewP5XBgyFLfyOs8knU5n62rmQIwQ2B9PMsuZ7gCA9Ve84hMgQHrp7wKrTk3tm4qU/+1fZ
	 xGq8Z1VLAYVUGkd2wnSdU2DqIBhXWAHLgpKGdZEfPdZAxxY/h9VDq+uM31dVSmJ6ey8f2
	 6zkcA/gho9auI07FJ1SywWq+uPmiawYXqtBK2GOo6ufXqPQRpV23sC9DS6E726zt+gsnz
	 qSMpOmzLY4mYsJjhrk9OVZY3KKugxJNvSSz2s4cJyXc5WMUK/L++X2B+/srCrvq+k1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kD5iPYuP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BSX2MuBi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC9C606A323
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BC9C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kD5iPYuP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BSX2MuBi
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DExYX3460755
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xH4GuIdgKEDoSqYRkyo/VjSwPcMicalP2XhqgL8SdTg=; b=kD5iPYuPY2+z/u6Z
	vMILKDiQRWVJ6WKTsxgpUUZPgIgNSbbIXlhxpfXnQGZaxXN27K731zoYFhIAf0eX
	eYJnFS+TM7jgo/Y0brzTNIUP+omu3CLbc5dlrO6TvO5dURuToRLhXuZ8nVWR8zzX
	/gv06Dw3r8QLF4G5BwMrggJPE2n7mCzUKVlJPehSLpCs+ue+rwd96vznDXcJO7Yp
	2WbBvrZ9mkwFP5leXUy71qMGBN/7Y+qREZyibOXvQHUMcvYqlLstdtqeIkeMOzgY
	A3M3no9M+teXzTvXsFA4DOq3MIJgqpFTY8WeT9fAfUFC5yQXJxF+UXaie7dg4lQ8
	aSMeRQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0rrfgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:26:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cac495d99so7189785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234407; x=1794839207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xH4GuIdgKEDoSqYRkyo/VjSwPcMicalP2XhqgL8SdTg=;
        b=BSX2MuBibrH4jM+2CyradsJcro/vrW7PlaIskt1vgsU5rdhXVNZ5Xc36lcGIIbsfxG
         zu2cm/iGiF/rNZAkKsb5Mm8+sxP8Vp388bHGi0RA1WaBd0gEzHNCMdYb1SVgwZDKeevU
         QN0HNZ6L4W0i74ikg+YU228ViNymEs7WY+jjkoMJhWCQV6H+kGPHa4k3O6UtBjHywp2k
         cwueUHMzhJRMrk5SoT7GmgnDpcAlSpTMKILXXhhPUJ99ThlLHpVOYGn9ApM6i9N+3kC4
         dz7wdGOgOrHxHGtjwart1lgQXEgAi73mosoq3y4UPE0z/8LQaXN3mEh9RmPmZdx8wE4t
         G+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234407; x=1794839207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xH4GuIdgKEDoSqYRkyo/VjSwPcMicalP2XhqgL8SdTg=;
        b=Kl4xyVzEH/Z95gmIAgj6BotsKErobPLepoQnN9/sjKqEFwB3o6sIcVGTI2MypY6s3l
         OOSortltFP+QuLZaQ3/GHOhCnxn3YAwRnXitceCXFNHXtD9p8U0BTFaIogbcpRPxbiSr
         JJvdwgrIOaNOcpf+/jk+/v2HSYJ6xvbJCuzh4yFpxkByET3zeh/O8uPDcDtSJLugqIRU
         wJ+jRy7S/QScIr87+khFXJLVqEknas3m5HdNo1J8sCesWBMNSn8CxAOKyPn2mO7xvyqQ
         5povlUZg02GwMD61/ZIkPoZd4UVBbMI1QTGULPOrr9c7NDG2rNdQKQF+oeLwqST9o+Rj
         JSTQ==
X-Gm-Message-State: APuU4Z8NwrrdECYqHsEGRg095iEuKE9kffBpUkljC38dGIpSVtRtevXn
	6A/e03uanKbkdOAQ3tQUpEqVlAyKflOsARUOyV7BX/g2k5pYHH3U8xRI7yrQ7PQjRRv64UWEh3D
	36Mq/nTk1uv6BJ0BJD3GRn8rGnfA5kyn15WxP9ymp6xI01GYPv1LDxGEze2ulsCLzypK6
X-Gm-Gg: AYBFou1/FuUPC6qeITp55yapLKu7b/d5Pt3pEIDNKmTBegRfO9kVYWornCkyOsd2Xuq
	xWzfz3iA3LbukM6wSc9J+5+3exrbckDlE5VM9DrYQC82ChZBwQ5SKsIaDwUrmzESUWKxb0SFu8u
	4SLpavaWtahOcHAOoA5Czsm4kV8pokIpbeoh4lvNNqDlWkT1K6gQI3ZyX/ziNFaLCdG/vjnEaHB
	Wo5lxeN1tjiiMkv1uIeHfNSxjiyJegc75xl1IcKnlh3aQv0CQnVzGeEV/WP/Nqggrwpw5XUhSws
	5eiuMdeG602cFaWFILqLw6B40MpRr95U61l3NwqpHrKkOeSGMzCev9AKgqwLLt5TABXYMwbbqxE
	cGJMIdg+4ow4zJhiSEfC0cCC5Tlx2bpdbBlrMZtM9XH713OSqyP/qx2tsc9be54rw5DUx/g==
X-Received: by 2002:a05:620a:a90d:b0:945:c5b3:6356 with SMTP id af79cd13be357-94784143254mr722570885a.2.1794234407323;
        Mon, 09 Nov 2026 06:26:47 -0800 (PST)
X-Received: by 2002:a05:620a:a90d:b0:945:c5b3:6356 with SMTP id af79cd13be357-94784143254mr722567785a.2.1794234406890;
        Mon, 09 Nov 2026 06:26:46 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ea4165sm1604449a12.7.2026.11.09.06.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:26:46 -0800 (PST)
Message-ID: <15ec6068-4529-4354-94cb-eea82eda5806@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:26:43 +0100
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
Subject: Re: [PATCH] soundwire: qcom: enable CPU interrupts only for MMIO
 controllers
To: ivanverbovoy@gmail.com, Srinivas Kandagatla <srini@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109-swrm-mmio-irq-v1-1-570fc05f22d7@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-swrm-mmio-irq-v1-1-570fc05f22d7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mj249IZOR0wIbFjHUnGyY1BOI5CMbwnd
X-Authority-Analysis: v=2.4 cv=MpfHeGae c=1 sm=1 tr=0 ts=6af1d827 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=e7eVDJc1qFFcJhx190EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX6dwDbfigVZlS
 WAG0yrslrt+/m8LWPjm/ScUzT3gREYCA9OlUARghJz0Vh9UArvZ8bFVnt2uEmVJChcS7jNTR/MS
 l8bWrnPy9Vnmfo3FwrrDl7No5oO84WHLyQXZlPICf15PFTWTT2QF7JZgI1Th1sEQj67WjS6tH/5
 cXeHOz+94jHcfUmUYhkZlgZLZoGmhU4nIEq+rySYkBpyub75QqaNXEKQ5I5bNRTp91tqeGPJSGm
 dBLyXBBu7gdaAF0fvndOsCFUHZu2aReTiPckPJgEIZJjOf9wBu4yBq87EFdQtPScYv0WtHnqXM4
 VHATtgGpyn7OmV28ynENeqEJEXaQPBjoxnSg7ZMOAOeqOHtN5Xe1Q51Hpkl1oGMYbbe0FLOIJTv
 NurYGSp7XIGNIPUtZXOKuwv/IT+HvQ8qNDBGuOViByChCKVczQp2TOKIC16/82GSNOVOXjzBLNF
 QBNskSejOqac7mbUkag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfXzjfHvEkBE8Lg
 9iyEBTlXdV8S53bkGx6FWfzJzJbvpKOOK6/kZy1nsG3S3EFuNinISYjgIOugVXh29LdlpDrhZ2o
 Xkk1B/opxfmrAwIbfZazHVHBpEacCVE=
X-Proofpoint-ORIG-GUID: mj249IZOR0wIbFjHUnGyY1BOI5CMbwnd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090057

On 11/9/26 5:21 AM, Ivan Verbovoy via B4 Relay wrote:
> From: Ivan Verbovoy <ivanverbovoy@gmail.com>
> 
> Commit b27be5a85ed3 ("soundwire: qcom: add EE-aware register layout for
> Shikra") dropped the ctrl->mmio check around the CPU interrupt enable in
> qcom_swrm_init(), which its message does not mention. The enable has
> been written for MMIO controllers only since they were added in
> commit 82f5c70c2651 ("soundwire: qcom: add support for mmio soundwire
> master devices"); a controller inside a codec, reached over SLIMbus, was
> left alone.
> 
> On a Surface Duo (SM8150, a WCD9340 with one WSA8815 on its SoundWire)
> the amplifier no longer enumerates since: "SWR bus clsh detected" at
> boot, "link failed to connect" at each resume, and every stream fails
> with -110. With the check back it enumerates and plays again. Shikra's
> controller is MMIO and keeps the enable.
> 
> Fixes: b27be5a85ed3 ("soundwire: qcom: add EE-aware register layout for Shikra")
> Signed-off-by: Ivan Verbovoy <ivanverbovoy@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
