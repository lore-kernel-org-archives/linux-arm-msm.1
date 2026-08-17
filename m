Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2D142D763
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786976066; cv=none; b=Ohe4OyOXJyyrEilTud/jGIz0i8ZDRbnjbACZTeu1V5NGZKbeCUKUmzShdgVwz0eGV0LJjMGxMnCPn+5riwia52Fzr3vKxF8n+SYJkTA8Ss3/Ll7u3arul8i/YLi3X57KvBGC9brLj+j3A3t4SXNTEVgPeNYepvEfh+yLrb9Hut0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786976066; c=relaxed/simple;
	bh=4/cvtqXHsCg2yJhBIIxzln1YJ73gIo2ViDJWMf8xh/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qvAKS7YEYuZd71UXRrk/WkUIoRfqOmn06ozXfL4ZQ3Vo3gsBk/J9rki1HqLQrjn9WKKQOEY1Vjn//jZup13rXKonZyJp5OAVbnrcyZICsEEPddvygVeUhA/amvFptX6jEeQ+mbhPHekYNm1BVRmYXdye7CuRdGsFUd105+fK55s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HIDJDKcq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cm2D4sQY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HIDJDKcq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cm2D4sQY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD64fE2238938
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6KIqa8NWjnhrY+o22T90DyvLOoGWN8sNSAn3IPl7xuQ=; b=HIDJDKcq54Ui5H4z
	fdVChMBtd6v73U1FQRXbqKwqT9cKpv8s59dOSnvtbum/BZ+UPsmewdigrK2TigFo
	6MnS5eMY4qXLbJATw/EWO1yPS2b6NHL+AVw5NFQalHPM4slYwIGtm/LngpL0iM4D
	JCgdPqJMBI0BFuvi9+N6CdtJ77UNDEndnNeZ20qbFoEmNQZToPKIvPNznKzhsdtu
	etGx9C0p7Mz4nFZHPkTp7mEvd5bowqYxMM8MfJufG0Tdr+hBQ35QXUBUHj1tR68K
	QdFjNM+mi0yHmXMFdY9RFhXIhYOuDpD6FAs6R6hWRhzrO6N3jONNrYAW1+8OQkfe
	gau7ug==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xyk99g9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:14:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934a8cd3a8bso33096785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786976064; x=1787580864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6KIqa8NWjnhrY+o22T90DyvLOoGWN8sNSAn3IPl7xuQ=;
        b=cm2D4sQY3tRqP6iAanF4vfoTVXSO3oW4PWLVjFEw9Fga+NXYpVPbueVGDc1Zptbqt/
         p/7yR3jmEOd2QTpr6sjEkU13Gsk2J635E0Ynw1vR9EEo4PAyx4NMnBjk/GheY8pPiFsT
         A7M64Mb5R4kq8WgpUWrHJ+aLsz0l7BEnMYXt3pVldleWQeN9ngW8JRteZlY/HULmvMz3
         cJtnWGh9uiPAXlZqBP95V5WQWU8vJn/E/QncuvOSdO/+cveiH2Or+u+WyBppjJ/Y5GNV
         vVIvqQ+DjrF/xp1aaNT9IyUrbxptAGI+qmu2E117doSG/OJcxMb8QrB5i06pwTUgLBCS
         Gxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786976064; x=1787580864;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6KIqa8NWjnhrY+o22T90DyvLOoGWN8sNSAn3IPl7xuQ=;
        b=DAMUwc0+ZEcUFDP/2gxIfVjBxYBROdCL9v9xLGdSSvqAz5WRiRhTdUSK3D8ogaTeRz
         J7766am7JZoL48giZNg9MoseW5us1LwJ6R+nltM27dB7E8PlokY8JZrcRopfq7fMBSET
         dRFtDEe88xePFDMCG6r9/UToSry+wbR0Fr9PtFHXKSc+9CDm3pgpZC83eoA/e2/Te408
         0mow0uzhadOiohcDEdTtHeojy8wIauv94OlGw2otMzRtPoYK6SymznJnZvEXpYYywA11
         ilvk5NY9/wsBjYDPu7iMevWo1NP9/87CFB7mNWRJ6wOR4Ul5mPBhdiJuRu8hv7msEirf
         zOJg==
X-Gm-Message-State: AOJu0YyZhsmYrp3UcpQ0Y59LZzTbVpWsA69Rur4Ri5puU/yEXyneFnni
	z794xGwwQ7JIw6K7WsDpu9Vl40U0XkxRHbYPPBuHoS5eGoF8mE6iZp+DHXhr/4vRJtHjNAi3y2t
	A33k0T9jLgLDqEVBdimGTCPkGUnJgthEUdnDlBnb/UIrk5MUZWZS2esoTPb2xRokhakM/
X-Gm-Gg: AR+sD117Kjkvlhj2sIuG48b85b2Qmb1viEU+htwyKhUjXFeli3uUtDnkHgHkZfAww7F
	PicEqFsOjAarbgwCzFVdgVfA2MYAXon6Aj1RpxqEpAhxTrBR91Aji7Qu/7NZWeBvQsJ3zoq40+V
	tWmFtUHSmZbQ7o4M/+Jw9QLxffxu/AEaleOIsgj0RNm6qJR65VvxwNI25seZ7e5rkw2azXFboqF
	hk5Gx8lSPjtXd0SfjOL62Bn9d1N4nPgK8Flv6NEYa8xS7hKScpdDPbY95VqRfYX1TBwzG+OayEZ
	ss2fSU3yst2MyQbuSWyh9YKGqwSbTgAhXpVk1fIex4AulqW9Rf9x7eHBNVCUTKskQ8rDzKH28Ej
	LchRoPO6JfY1sFNTRBhFWay3L
X-Received: by 2002:a05:620a:6910:b0:936:2f59:dfe4 with SMTP id af79cd13be357-936d1edd4fdmr1907564485a.0.1786976063509;
        Mon, 17 Aug 2026 07:14:23 -0700 (PDT)
X-Received: by 2002:a05:620a:6910:b0:936:2f59:dfe4 with SMTP id af79cd13be357-936d1edd4fdmr1907555485a.0.1786976062918;
        Mon, 17 Aug 2026 07:14:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d852d915sm757705a12.9.2026.08.17.07.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 07:14:21 -0700 (PDT)
Message-ID: <db2a18aa-f5fb-4ee8-8747-05fcf740749f@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:14:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <b36691d3-e996-4fc0-8955-25beeeecc385@oss.qualcomm.com>
 <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
 <5341e732-0deb-4d00-9a7c-595e317bf1e8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5341e732-0deb-4d00-9a7c-595e317bf1e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WVaG3FsDtp3QRTeqbh0UszvT7zy5UxE9
X-Proofpoint-ORIG-GUID: WVaG3FsDtp3QRTeqbh0UszvT7zy5UxE9
X-Authority-Analysis: v=2.4 cv=dLaWXuZb c=1 sm=1 tr=0 ts=6a831740 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7SNk80zgYqIXXrXIq28A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwOSBTYWx0ZWRfX0geyXHJIc51J
 NutvkLgtN0wZVwKePOJDmQGl4wFHNJAvDGW42zisq4lZzjJPWmHKXbpJ2+H6mbJB6Db/xZnot14
 eV4pNNsuhd1dCIMz9ARBiHrQmxRE+VoFFZEsJSVQ7osggSORsw2+u8vJUpggY4bi29+pyqJ2RbL
 RW+AnC3va+Zc+/fx330CQpHwu3+n4tsLZzzONVKNAD1/OlBafeGE9CRexXG6NathGz13FypinUW
 yvBUf4N/OWxAJdl80DUAsKSyhUbmzLsVOqPQvOCjrLcRsKRHFdMxm9XTYuhP+DXaY7Yta92+WkA
 y3iHa9KIlWF8NxkpJs7tZYlcyNl7zRs9Pgw5B6DX3GAVj6awuIN3Cx3AXaMllgi0fAXfabsFEDu
 e3T16vM+9JlgEtxeWli5Ln3dUKeyzOlqHgfVQ1d1+FQv6Bwji0oZLBk52j6sx8mmOp3VM2gSAfh
 xeDnMnshA1fwm5PeWwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwOSBTYWx0ZWRfXw0D3E5X4Q4vS
 k+MTIdaphhVHHEWAGBx/cVf0lNDsbIVuWBdDPKvasheAi4bv0E3THbFQRZRXtuqmSpBErcN4I7G
 n0sWygMqltNaDE6YNGB0dMSA7haYYd4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170109

On 8/17/26 4:13 PM, Konrad Dybcio wrote:
> On 8/13/26 9:44 AM, Yongxing Mou wrote:
>>
>>
>> On 7/20/2026 4:49 PM, Konrad Dybcio wrote:
>>> On 7/20/26 10:43 AM, Yongxing Mou wrote:
>>>> Kaanapali (SM8750) and Glymur use two display power domains.
>>>> CORE_GDSC powers the main display hardware while INT2_GDSC
>>>> powers a subset of SSPP blocks.
>>>
>>> Can they operate independently? Does INT2_GDSC need to be
>>> powered on after CORE_GDSC?
>>>
>> On Kaanapali, my understanding is that CORE_GDSC and INT2_GDSC should generally track the same state, except that INT2_GDSC may be powered down when SSPP1 (VIG2/VIG3/DMA5) is unused.
> 
> Is the MDSS any useful if *only* INT2_GDSC is enabled? Can the INT2_GDSC
> be enabled itself if CORE_GDSC is off?

(I didn't quite know how to parse the list of states you provided in your
reply so I asked again)

Konrad
