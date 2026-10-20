Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481645;
	b=dYbAM4nuIyxV35zE94ypgjcTZuyiBPB6j0KHU6+Xb6uC3CUktRz/Jhk4LXuWKlwPwqR1
	 DOlx5dCD8ngVVqUuED6YlyAjEd6pH9dtUB9M/S2HGeGXHv5XIRbMPcPKAkTUICJ6ZIIGT
	 /phzZI55mxZ/gTMIOKNpp6hBRN8d2EYKWD6jm6hKDp3apJzQV+cQHvzga0hQS8GNfq1VI
	 xbuwvGb0dg8SHLBH/ZAm91LRHQQQ6ixk53vTPkyZCFv8aIbtlyDn9IlQEIfmZEpJu2A3y
	 ykfu23OfI6rLzI0W0vyPX3v7S5ulqxagSnWIC5KKuwKMTopbiMWYwzqbVQYSkknkCAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481645;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LWzrZZFQhSyO/FR7rQo4rKuqvNnZWfQyCXRPSU+R25I=;
	b=Nt2QHN7xDqW+qxyMJvUiMhGBbEDdH31ssPGRuPPeb6Vl2AHHv24nsAzoGtSQUK+IFDE/
	 ktNDzPoLfYKJinLAIlo5Bofqdm9Y856B7NqFvCo5lhxVboWXZum1qNiYg94TAi8041X0h
	 XptPDZE9Mw+LbYixk1f9pc7eSCUTVSCWe+Ofcn64BmRC8zhUsFiBfRFElq5Swbc+ZVPmz
	 ExN/q0oHrOVNNlaTfzc8UqqXt0ypxSeAtPhGsS7v3QRTViFESfVcaW0pNtmTcW8Y64tvA
	 OpjTfRdHMBwNk95Ybdv3d6Eqb23n9bZG4kySEoqz4riDfjIrPzAvSKVf695721qf1yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jxe8ahch;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gxDufLMr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A98606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A98606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jxe8ahch;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gxDufLMr
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tV144178316
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LWzrZZFQhSyO/FR7rQo4rKuqvNnZWfQyCXRPSU+R25I=; b=Jxe8ahchk1wjRBJc
	s4o4UFhlDXJ0jw+NqXMrnEh1GWL0YaAMDQR4nmF8AFWbthX5JqJhb9RBoawKuzR7
	RA1hK3KqMQ0MySBNY9jS2cYOeLw383XT5U3HMmGmXTG5tmoOW8qURACbpH5MK+Be
	1DliUpgwv+GwIvPWHxNQ6gfRrpa2qml4v5U6TPSI5MaTcYfHtF/EWaLoV35PU18C
	zeJH5oWNEZ9f3RXXxRBQr7JwAKvbJ2yr+TNli3HzGMoQoM7xqZUf+rXQvK+lnb85
	0cWqYTSvEztmg1yA3ILUPgvO6Mr5r4O0fekBS3NQpMsPxtDXiFesRHaClSLhjm/f
	VqKgsg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1cnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:34:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179ef12a03so13876726d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 00:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481644; x=1793086444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWzrZZFQhSyO/FR7rQo4rKuqvNnZWfQyCXRPSU+R25I=;
        b=gxDufLMrO9bOWgzqrYf1MuhL+Wg7wbydTyHAsVrvRhHmV18Gezss4lLlVwdZ+AdCJS
         gnrRP6QEaGJA1Oi2YB1OgadLYAaEJrEHFGv5/Va9Xej2rp8YV4p6KV20MEvDHgQoh9lY
         s77+KRbgn7KrwdciuUtFchPsOLnCtueLd86ocQWsYzMUGbajglip5+hQCPu4hzdSPydG
         cDuflStcPPivxIacLHEbILfdXzMcg1BdlBD7IoWSDlS0kSqeHA+rP9ITOoEwxXmeFHIz
         i2ozk0vWcZ2BtwHr+Cku9N5/I9dlJ5buBaj524hmF30TFm7GkUS4t6546xVOYvJr7ovL
         cy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481644; x=1793086444;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LWzrZZFQhSyO/FR7rQo4rKuqvNnZWfQyCXRPSU+R25I=;
        b=kQJush5T8kIGwMmeDD5sBAG+NsjEJac3TEKlcTToN03Zk/sxhbooYHLzolH856mniX
         IwFa5o1XOTVW9Y1HYw+rESG5BSpTpWR5PXkuPAHOIf0ZRL5G/WcmtMoZYP5xI/KcPyAT
         PegcAnBaw+g0eapG+C1Tni6fB0VFCAm9q+EJlqYn63MOmb1QDwqjWEj7fS0ZC79UKOVv
         YMKFVOgQH9/Rl3FA/7m1/Y3q7bXfMfckw3mBh9Ji93Cg0/y4uZiLqHnZzEPzpSg9YOuy
         YNMcBeH02spX4S9GI5innhrr7QxV9ULmICccieIK1u2IoaxXM8SA6Ds81rER9AlvrMQ2
         TKgA==
X-Forwarded-Encrypted: i=1; AKwUvBzZCkS1B1snsOwcV/T2S+407Tj3QkLhxqol/M1oE61UegGVjPqsJEmmRKk88H1t2JB7zvI6l9LeuUSePhew@vger.kernel.org
X-Gm-Message-State: AFq9FYJtKIjyYf6PdM5n8IcSSWPH9X0Y9LXY384XLa9o9XTOMR3mwZdw
	T9tQpSYqeifrqQKnvLlXTMAGFDcTnA0JybI4nuiKUeiKytYLU71qzqXdKFOdPtlIE1YodH+m5Yx
	n6JMZJ+aBA+S3KpNuRa8BQvz7ATeMzT2SRwpSnUWLeTDhancjT7EwE9x/JsmsnJloIgrs
X-Gm-Gg: AYBFou1b4toMZnzvdyBA3dZxt7op7/5dZ5TBKOjGzMSk+9BNzS6ygZGIVcYbPl2GlVL
	Y1sjaan9THAsiicu2vjjnURjn5D84X5tjMnfLxaxuX/4PictoRz367YzFNG030suOu+ONWnW0HH
	m9p24JuZNNocv/CWNspj1g74QBvbSZ92+caYku51KFQxZMJmRcnxdvVFWSeKwY4Le+xad5mShgO
	0YdF5I3NLiNNeySBcJa8kl/vhRrXOEJv5+GWw5s/jONemfBcSv8k8sW1bAfA0PaeL/s4j6gQ+N7
	e8QK0xPaE381GhMXzHrwTJUNE3eUydUmaN6l67WdO5VGdxH5bem05ZmOQ1woJVmpzxv9HnJ4IGJ
	H41zeRNfRCUAIGi2WzEnnsQ==
X-Received: by 2002:a05:622a:1304:b0:52e:3991:84c8 with SMTP id d75a77b69052e-53645d643e9mr179572561cf.2.1792481638749;
        Tue, 20 Oct 2026 00:33:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1304:b0:52e:3991:84c8 with SMTP id d75a77b69052e-53645d643e9mr179572261cf.2.1792481638228;
        Tue, 20 Oct 2026 00:33:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dceadesm461490166b.20.2026.10.20.00.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:33:57 -0700 (PDT)
Message-ID: <720ed230-4284-49c6-9332-e29f23765944@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:33:53 +0200
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
To: Luca Weiss <luca.weiss@fairphone.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jasper Korten <jja2000@gmail.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Luca Weiss <luca@lucaweiss.eu>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
 <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
 <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: l3ig26v-bXp3TrmmRyEa5MO65DYyBUqj
X-Proofpoint-ORIG-GUID: l3ig26v-bXp3TrmmRyEa5MO65DYyBUqj
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad7196c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=nd-lUt6iTfUX6z0NebQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyOSBTYWx0ZWRfX/KAn0XjSqfX+
 w4Bnosg8LqA91dGCg68W5+Xt4ak2nYmnDv9FJcE/6yL7foPiNihgKtNdphVY41595WgBUncCfDu
 dEZBqrsTamBMUVE9QOSHwxHh0n/IxTH2oVH7ySSE4ly9kDzwTrUe7uoOJwMmKHrosM4wKjsjSLx
 4WDSQazszWEEgenZhhdZ4LGFS3np4imYE/wgWhmVB1RBZAyuDijZYSlJOoOx6p8IrLwTy8QjqNO
 27/xFr9P7CDi/gDkkbAgiD6N6S2QNuGQ87Jy1Y24uKIJ1q8v7WraEm1z7qiqal+TKMcKDBNo8wh
 HzJUhxcu/2TltbZDgIX4xavDGniejl03zjqjl1xYhB02JveYRS7k2FnG0FeMlcH4IJG6O4HYXbh
 ncITkYxhtS+AW0hv6twfH/GglWnbIID8r4WVUJPhGH5qtGVThPmiu+4oqWGXgdEcpotvwkfRtZt
 l6pUHsqYFhk5oK+gztQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyOSBTYWx0ZWRfX3UI64uhrdyvU
 QJZwbf+YTJiiwh9NsiLMNfElugfO81yOeNQ9/LXHuyA4AcfVQv4yvDFrQPcwEyvNiCTM9c0kWEg
 Br0lDM+Vr+d5AQqtjFhDdmn4wl0z/Ec=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200029

On 10/13/26 12:17 PM, Luca Weiss wrote:
> On Tue Oct 13, 2026 at 12:10 PM CEST, Konrad Dybcio wrote:
>> On 10/12/26 8:11 PM, Luca Weiss wrote:
>>> From: Jasper Korten <jja2000@gmail.com>

[...]

>> Drop the output-low, the consumers already take care of the state
> 
> For both enable and pwm?

Yeah

Konrad
