Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657677;
	b=xc8SjOk0g0Za0TXCew8S5A0NOFowgnjmYt3i0NBktsYDIYt19b5pnbkJ6IR6CQ30g1OK
	 VLdjCGQlCW7YcE1dCNLV/nbtR4v6hsDdbN7s8XZN1HN7MZAKCEoUplOZFGlgftZ5gGBOU
	 g17IYNzKNgncrQNItVd7EHE2BuFZqorsJ63PQ92XZK/BV19ftsyzxIH12qvy9iqTIrEfv
	 wIkVA2jiApia7keUKB0E9nF6Te5ziMfUMEpj6icszTABWy0Hnau/G3xchGb0OmD1QvJl1
	 3y7mgGk/Rc2lu0KCTRtGF7J8tu1PavX97GTc2SDFpRRLV1Iy+fe5RmSmYnW/BfiXIeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657677;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=76imXuIV53mjFS0dpPWGq5NvdTYHllEC/UpDn8X1Lr0=;
	b=VV5VVdoB75ux8M/Yf75j0tYXdEhCUHh84OWBGrmXufvxE5m390Y+MULp8jnKnX5Qdcw1
	 Gf5nCxtgqaWRpwqs+cQdxBoPUmh9S9cnzPviFs0QgufHUAebqqkZjv8TRrsajLNkySQEJ
	 HwnF6TetvNCMSs5RqcTapwu23m6GsFyYxT2yi5VfCqjDnaaaz7X2bXdvjjXj7F8S+w43Z
	 alsSdC1lZQ1FcRkq+8FqfUaNxrMEjKKvNXSVWeKZsd64Rx41q7lvwUh0NYwXmTtmreZV8
	 dDp2WpYTLByls1oXXZkoi7QmDS72kUOJNPEveWDmUJlc27RP6FuPwwdRXNj9DB1d6mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WXmEPNmz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fC4U8SfI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5497606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5497606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WXmEPNmz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fC4U8SfI
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70Le32174709
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	76imXuIV53mjFS0dpPWGq5NvdTYHllEC/UpDn8X1Lr0=; b=WXmEPNmz4Y4V/pET
	eCtixtBNYIld7rzRsSR+zMTd+ar+kv+KzSoSg+gYGfU8h5tSFasb7MJKclLvOYdT
	uR6dwmDnuKWfe14nLOaXFPNo3lbPhuGIk6wLIPdDp+jNnYur0Rzk5DDFZIsDIHSJ
	TLHjesm01JodFeJEaSMXVxtO/uLTVxfHOZ9qOo7eVKwwlblzJO3XR8CIZlTdK+ku
	HLYc2IgxXky0z3KkNK5gU4PEn9asYzs6kMIDgvHb/jJpcYimy01AJAkslVv04BPx
	glmPCeWl9+HMbhjjzz31cgYUTwX8TiHgOcocLcKYevwpwjqHDCK4grDz/UGmIrvg
	MiznZQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahecp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:27:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb1091fffso22133885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 01:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792657675; x=1793262475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=76imXuIV53mjFS0dpPWGq5NvdTYHllEC/UpDn8X1Lr0=;
        b=fC4U8SfIugOokiFdBaA8LhyBLUFKErLOvHdFLW8iEd9bQqXlJGGxk+4/W8RLBsb3g9
         q0/nwzINAdNo1CGaYiRM/24RA/7+ETT+MZWdLPdTQfEv9bHAXJNs83/fhTn+qxZFiwNo
         9yjZ8bzRCnCefGDkeehcAmfINSWnucT/deMykYFkdKD9o5dpDZ/gBke0lBIFI4YFhs2L
         iDNqWnzII34KttY6bEv41XwrN46TGwMo+LkXd8871Tz+O3gwUxNoNJIdxuk8GavlXYQe
         G3vX8xuDsDb4u8Zu4rPAxD1CKzRip7uFF+8pwbV0xUDAAiZ1nU+lEDfAU0SttE1zMOlH
         +fYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657675; x=1793262475;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=76imXuIV53mjFS0dpPWGq5NvdTYHllEC/UpDn8X1Lr0=;
        b=lGHqvxXWtr35Rkb4y7GncZUfOdRZm6rs4N9uZc6QM8Nrz44eSfctFSOoM1o0XhQ07K
         ICs/99bN9VxDUdqzs11DELOQ1q9VYvrCzMDwGj5D94NLK4+ExCAKFXPXB4vg0Oib5EN7
         VbuhaKMoqpQfk7fevioOFMa4vtMExFaxg50S9XBvX19reK/tFQ1xkU7sJvoWvUak/HTT
         4ZUQQN8CTOTiwQPkWOV/+p5/pLbnKY3AlDr9GDN4UBFJu2rmRRsxBtNjCOLOvFsYBvCy
         PzqSdCwDexCW/V1DlvepqXmOsYzcdNjy7EKIw0DAzrlijWBJ1V19xCxT9C9wL4fyT+9/
         PAGQ==
X-Forwarded-Encrypted: i=1; AKwUvByCINhlJk2vNLe8HyJFBFlLgUWA6TfS50uuKv+sh3H37QCJ0DwQ5u/quBHekUGjx388KPPSJex8d79PZ58I@vger.kernel.org
X-Gm-Message-State: AFq9FYKHt3MIaeihNS2du40Pz5g/Cfi/Hl30NLUdIiPL0S35XwwTv0RU
	zYWNKlj0aexvk0ugC21ck/pKAt34GvVatgXZE5wWzA0+KPLQvtj3tvRJvCIvyGrSstsWCAd8aHg
	1PP2U6xNy76Om9CnhoYv3X+WADhKJgLiZkz/70FG20NhQfp5VXN27kQtVm230YGXDBTNq
X-Gm-Gg: AYBFou0NfCXep0gXsrLUW3yWji9DbPoWwlq4CY8yHGOZ4B/CWAF/FU/0tvkLaqjCAPy
	o0gYMD5NDq08ACaMkuQpIAl8+wGsMRlKWj7ixu/3y9jGYbDelXJQjm7uOV4YGXngnqxtRUTwSku
	oS7e/oM/3ogDeItgR6ftHCFDMpeOJQqO6idyqoyUg+eCOaYs59+uW+B4k3qcRrj6IsY7+CsdkxT
	x8nq+4H2nrrjY7Lr7uxlOvNJ1h8qlVPe5A4p8J/E92ObTn6yOBLHBhjJNAagKgFksIOR9M+1qw+
	MBXX9dEQKH6GxUSHgRWcznhJ0N411cmVwNybpBt536gxyiGAc4PhqEr7hERMAh7UAotpVO6sZN4
	yKXwX7bmQs5TpbJWRpat22w==
X-Received: by 2002:a05:620a:6493:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f57ff1ff9mr956236185a.6.1792657674933;
        Thu, 22 Oct 2026 01:27:54 -0700 (PDT)
X-Received: by 2002:a05:620a:6493:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f57ff1ff9mr956233285a.6.1792657674506;
        Thu, 22 Oct 2026 01:27:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59d641sm81530766b.60.2026.10.22.01.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:27:53 -0700 (PDT)
Message-ID: <1ec9207e-0eb8-481b-8cad-ee6cbb31bee8@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:27:51 +0200
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
Subject: Re: HP OmniBook X 16 (X2 Elite, Mahua): DT bring-up report and
 questions
To: Jeff Roach <jeff.roach0@gmail.com>, linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>, lumag@kernel.org,
        vkoul@kernel.org, neil.armstrong@linaro.org,
        linux-phy@lists.infradead.org
References: <CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com>
 <CAAnD8RaicCmi2vk_Mna-Mfct4Ebh5dFVnKUkvVSiX6kpTB_imw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAAnD8RaicCmi2vk_Mna-Mfct4Ebh5dFVnKUkvVSiX6kpTB_imw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sVKJuiG60gGdRZXu7kSl08bUpkARx9P_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMyBTYWx0ZWRfXwmYQs2MffUlf
 f+Z1vVYgfVuKRM/+83B6qGAQ8gUncHq8soxA9LAy+ZpxjE3Yay7Vu4TagO8xP0zmISEuvWrk+sP
 Fbr129HRGAhRvejkrzXeQCwNPy2+K+4=
X-Proofpoint-ORIG-GUID: sVKJuiG60gGdRZXu7kSl08bUpkARx9P_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMyBTYWx0ZWRfXyGBVEN8xjGFA
 Z2MLmQMNuiuo3VXZXa9at7jnEBwhxTbDu4Je0ruH0HMfTj89qtVImSMC8Bp9WAWS0Q4ptPjrlsB
 nPb620r9JGAdBdF+q+kPIDucpNdaGbvOJttbEwjOfPczH4DNOmSYVbiabGkZD1dNKpNOyDSjZsr
 8OP1pC/H0iBQJiFhVZVYQSUqG+Ijsm8yNKJ/Ej/1ORAJCLckGnP3HebbiBrslO9tX7fr9DbJozM
 i8bPuQ/R2OmCACwSqtMWc6pE66JYsvtVmavUerU2S6+rkb1AR6kvUIkyUGvZ4naPGkGO+FNtSEe
 o0l3RtF2sbOh+2IlvUxgGwJzEVj4Z07rR1XLY4Y8nAwwiM20nP0zWge48gA3I7sjL+9L2+xzBpp
 5lROrsFCkUGfBZVjYEpH/1gjCB7BqwSyDUqiTQWtiWHd15oPG/lDvkXx1WUO2iluOMjL+RqidpN
 x/73ShIToB/QJGsosEw==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ad9c90b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=rDIKrhz2CLtF2elHLeAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220033

On 10/22/26 2:47 AM, Jeff Roach wrote:
> On Wed, Oct 21, 2026 at 5:34 PM Jeff Roach <jeff.roach0@gmail.com> wrote:
>>
>> Hi all,
>>
>> I have a device tree for the HP OmniBook X Laptop 16-cp1xxx (board
>> 8F46, Snapdragon X2 Elite 12-core, "qcom,mahua") that boots and runs a
> 
> Hi all,
> 
> A follow-up with one new result: DisplayPort alt mode on the USB-C
> ports, and what looks like a wrong clock divider in the Glymur combo
> PHY driver.

Can you give this series a shot?

https://lore.kernel.org/linux-arm-msm/20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com/

Konrad
