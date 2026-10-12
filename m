Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52017372EC1
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789357; cv=none; b=pp6nnwW/RRRzCuoCF2k15UWmUmbiBrrxGPwa9+tnvMJ8+e5G05Yi0Bp3aoNKBmaJ9X2wvbZHloakEnmPQyGdwWy8w7CoCxAVsdcGuS9U+9w1WJ3CLoJVuyqw8SSxk/NXNY8SHnBrPUHttwcTvtg6GgJWGpa4B8AHH8E97MsW7pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789357; c=relaxed/simple;
	bh=Hd+BN6RDJN6bk1MufXlNzSJch755k2WEFTJLN4wFdKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DemhqDeIZa+ofgZVvy2ZCQtaTzVoRQx1sV4A87Gzhi+AfirNqmoHPYD42KlpdEYsV+dkHCAUwdE+64bi28keiv9PKXLFuYh/gyPkn9qEiiFhZMO8zLi9kelk++rTgxGJQch4otp0g06a7xeYZ5REqWtUNizsfNufCEI2xtECvts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WJyoUWJn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G0T/8PA8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WJyoUWJn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G0T/8PA8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55qwV1339465
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FALdQOa0iewDJ5PNUsXZhf0wCNU9EWPT335/P5eVh18=; b=WJyoUWJnVa80v1H6
	EOaC9TlLKjEtG9ZG3YRlYXMTcTdcU4ysz/tK9Q9XJ11FGo/cVHXjHb4WI6Z+fqej
	uSkC+9VwCsWPgKYs+3bay4Tc0b84YWQmPYtphL1CxqpdcBD5hvddCo6CI/30YP0r
	gGzAwcTWlx/tL5LLf/5szP7x3MJWbll/kkziPrz31C1f60Zcx+fnVCLEnAGhDJf/
	4VNR8clDPXC0X3IZMyE0dDKghB6g7hOYG9+ns95CLW27JTmRQoS4BPtjeavjaUS6
	A0V0EPXONjCRVPfMxAPRBZWr1AtIRtDrdFQY2UvBfxkORtMmNOTLpmqWh/c+GOJG
	OmKWdg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dk25av4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:15:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179d9bc964so7779346d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 00:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789354; x=1792394154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FALdQOa0iewDJ5PNUsXZhf0wCNU9EWPT335/P5eVh18=;
        b=G0T/8PA88bV/4HHHhSiBKask51Qt+xEKT+cUcns+55Etv3lEBpNKe8pnPy1NM+EJqS
         Ggntt9UmjWK2cBPXXVrJ30paDFTAjusVWAtvDGS0zYjNhWhs5+MEl7vFOkTEEX89k7Ye
         pDcgJkiOrzUnhu0LGLAWK9dg4Yck5QgfIwTlaUFNicl3CR77OZ4kp21RG4psoWwOROyb
         xtuLhn1/XY/NH3vRFfKRvUmsmKtuCc/oCJy5NQtOapj2nlz0+K2R5CGl5Nb4/oUaqE5y
         79gwEGnfY5Q17yTOXJPmfthmmY44+s4LF8XI9UczOHrsAZQrUFSWmHUrKKPQEhVYRmBc
         /HBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789354; x=1792394154;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FALdQOa0iewDJ5PNUsXZhf0wCNU9EWPT335/P5eVh18=;
        b=bQCONLPpGxgKJrCd/zSYvsnuS1KNnfI6NUL9ZXiTvdLSTG/UCAtv/0rSVJii9CHmYj
         uP7ZPGsEUcn3oyVqynUg8lqQNcl54OyTbf0vqT5kXXtB8vHO5/ozUfFk2kmJ2R0Iarz8
         hgX+i/kiO2SQARBeM2K9xRVItBt2c1PlmrlcTlS6EeBApwC9HIsqhKMQoAn9L7JKEDZ8
         HyG/AJxFGObWvAbOaNQyhOX/VgLwBprDqw8zzRl9NfXJPQW2VEgeWT7cX29p9joOm1v5
         8MzLeVskiBKC1+SLnk54+VDjuCtdg0SzMFYo3kjvRRXb/gbxdUNHFu+80Iyt5O1Fe1zM
         YAaA==
X-Forwarded-Encrypted: i=1; AKwUvBx38G+2Dck0Anm72RlpDm5RcF0IiZTZL0eFSIpRYHR1t5+I6oJDxlY9G3k4GU24QzceMFCKZzS08JgIGX00@vger.kernel.org
X-Gm-Message-State: AFq9FYKYTznDvQuAQyLjOT1PxFC5BBTbf6mPnN0QcuD7+Et82hjyJy/o
	DxvIJZc2wepZL/uatFdaAsrQhxeL8/OzzHG7VpPrAGwd5EjN6E4VG4l6W+MqjvZRHzS+9xdPeSF
	iq0rQiR7ggJ8Bwyoe49WkhstKQsnXFJPQknnMa3MA1qDW4gX0NrNyW90Xr0dc76lGjU96
X-Gm-Gg: AYBFou3J5ksPUUdsWpH8wtbmSjqCjuk87nuzGbUZdAXeoquSu04uGTevlay/N4+zeA7
	z41UGUz8O3DXrNX3+Kr5ZRkszMpIe//khyThc1RZePRwu7hcgs0qgzox5hlsKJ5ahnDXtnfeUwj
	iKTG05ZMmidQ+2MBC0O2eHdcBohuT8lAEgAgcuQjQLVFvxDspXB7KUler44pMa4x0wfRypoAndT
	TRsC+CpIP2D6TMGhZCy6mtwUV7QiOGMkKHXRRUWM+/9Td6GsRG7Meq4rLAJDKcWK17qiF/eOWxr
	A/Xd9c8I7fA2DcLkOZUfL6kmYC89Q83uc2YgZoOOKdD/wTma0LbJ38f5ggSIOFnqHCTd+4vmlth
	7BsQLwPjzT1je7FbxRaXaLA==
X-Received: by 2002:a05:620a:2b4e:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93ebd1e4d57mr1612192985a.3.1791789354439;
        Mon, 12 Oct 2026 00:15:54 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4e:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93ebd1e4d57mr1612190985a.3.1791789354033;
        Mon, 12 Oct 2026 00:15:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3382b8953asm199591466b.21.2026.10.12.00.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:15:52 -0700 (PDT)
Message-ID: <8ff749b8-2ed2-4ccd-9f7d-e7bca7aeb38b@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 09:15:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: skip hardware rfkill setup on Microsoft
 Surface Pro 11
To: Dale Whinham <daleyo@gmail.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: =?UTF-8?Q?Fran=C3=A7ois_Roux?= <franzelfranzel@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261004165132.4313-1-franzelfranzel@gmail.com>
 <d791e70f-9c3f-4916-94de-8d76517339bf@oss.qualcomm.com>
 <CAFcmK8haaN=O+aqvcRr4t6jc6dr4Bf2QDDPso-aT_frqEfSPWA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFcmK8haaN=O+aqvcRr4t6jc6dr4Bf2QDDPso-aT_frqEfSPWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mx3gXD8PC6OzpRy_uI2Z2Q7PMxOwWVzV
X-Proofpoint-GUID: mx3gXD8PC6OzpRy_uI2Z2Q7PMxOwWVzV
X-Authority-Analysis: v=2.4 cv=E6hYNqdl c=1 sm=1 tr=0 ts=6acc892b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=p15cCi0eOIm9mb8E23UA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOCBTYWx0ZWRfX2NaqQ3FkdlMo
 LNS9p+rafB9xr9gvEVAHGmifIJ+F2ZIlupT3LAkHJPT6eKXec8HW2NgmlS/jcPx8vHHzOnnLh12
 url14qHLI7IzTU5epr8H3vBEONLFFVlYJXI5KHmYE3n/HqnpyvoD44rwtfiqAHJMBuxseLAzBlO
 VX2CFP0j/Wltr7Z96bYj0YjkEhxpoPHS4grUh6EL4MVJUk10mzG9fBwRl1Sy3lMHHNO989WQfVw
 VPwaow2X+f7O62p7mFaliseVUoAJaFiMoa2RL4d5FVTrf55kE6ulTad4ewCtcXAqxwkp6HTZ2Hi
 rSXnpP3lGSW+fOpI5crmO/j5t2eR6lNl4zd0tATGqXV2xlXuAwIN7ptXTp9S53FKIJgW15JMmCI
 t/wmEEF8KSQqSpxhzuVF9DAqxhLyZOJ1UdQYHKhWtjXy7lqL1yoU7VCsS2hZIk9+2PoIDoOqXqL
 XXlJiVWXNO1wsmw6Ikg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOCBTYWx0ZWRfX/ftCrJOKoUfO
 Ya9cnZ/bBL1FIowl/+/rf4Q7bpIyAqHLAxCnHxYHMKdJeLloUk9BLfBYKEyFQ6MJYcBvN+8ndDd
 L1BCOq89my5cA+6Sy4MmwggH/zI6Dlo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120028

On 10/5/26 6:50 PM, Dale Whinham wrote:
> On Mon, 5 Oct 2026 at 14:37, Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:
>> my preference would to to break this out into a separate table-driven function
>> so that if other devices have this issue they would just need to add to the table.
> 
> Indeed, as far as I know Microsoft Surface Laptop 7 (aka. Romulus) is
> also affected by this issue.

I can confirm

Konrad
