Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630FC3CC310
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787118906; cv=none; b=KOHc0pZx88N0Gkx5Yt48DRKZsm5xWZuEWHtYLBeaNqlF8Km7HmR+siehcYuy3uw0HVCRTnB2gQSdsEnqIGVq+D/MbyS01hX4lszoiSNsiuDVnDrUa0PUoV8Us9t6Sjii0jsKSI/LD2/yaUtBzklD/hcRgyDn8ZJ7yRq6aZIPexo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787118906; c=relaxed/simple;
	bh=PL2k+4Qps9LvY9ulv3Nvf0VNlupSvPL1VW2219uI2lI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DxsqbZYyPg+a6UyNSXxFRhLpcm82Q9SKq8uhqxiAaJKOLnFac0W5hBvJz7UGcGMH49Axydjet+qz0qh0siXnN3Riu2G2AllnPgNmb67TJCmnAutrzJFegTWUScrU8YKHU+PBeIzvOgHSzKQDfcNFK0LgV0qpZTPhboWNL6rYO6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cv3N21CF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJalBGJB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cv3N21CF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJalBGJB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5ICVH2555225
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5i1bHJLYFJAwvc+rH/TJfwaAKODFjicQ6VDCYGaNX7Q=; b=Cv3N21CFwOGyWevR
	Erfa8c22pJ3cGXVc4NvIXRyMnH6EkjHpDL2ZxZ0c05ev2raG+m/MtRkEk+6j5rf3
	CEgs9Jy7DPuo1SN+QGDBx1PMdO3DYhj6JmwwGT6c4/4/BDPn9uVLJKYcJ0hI3P1i
	mwpIi3vlbqjttscPkMuuG1valag7nE+tIczMNcWl1ytRWIeZJBJQsRXCarlfxjMA
	tmH7Z5xjCfHChaAqaB2dFu2PV45C08W920R+pX/s7XFSGCK7HCZW1wsZZ4LaYRf+
	T2iFJYZscYal6cnvHlHqzkOZp/O7IjA2ZWXKvCIMe5vo5HkfxvT5uCFBtRtqTsu6
	DnudQg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm1jsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:55:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so897666a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 22:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787118904; x=1787723704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5i1bHJLYFJAwvc+rH/TJfwaAKODFjicQ6VDCYGaNX7Q=;
        b=RJalBGJB4RZ/h58eKYOrUg4AbnQXuh5g8Ie9qKdgNJv6rR17/bUmeiZBvDqhXmpWQ4
         WrjIceywkYIxpuay/N2d7ujYan/7j8kPMDvl6RHxzNeGo5VC4GrA+RAAdSdP8rfXi0RC
         fGc9U+H4VvAmNrnqjoz/Qkkm/m86M3IKYxCiYlyN9tH0fTSNYkVmMJWgxGGYywA8Oozi
         yZfU7M3FJPQPA04kD0uE54QA9P0WGaThJv94YgwQ36H3b0nziATaUBccMhMdT4TpogfH
         mBJR+dtBnaxTgs0N+RLqdvdRKXmxpQmNPq45iyPzERWJxkCZW+VLRwMA9OjEFGdKDiQj
         OPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787118904; x=1787723704;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5i1bHJLYFJAwvc+rH/TJfwaAKODFjicQ6VDCYGaNX7Q=;
        b=nqu3TSpkFK5A+xnEgDOJHbrI9O2uesLTnPyv4GkTbeJpsFe8i6d4Y7JQUcsohbJqmv
         sWC8zxuMJm9PN18JCjpl/wZZlKCxJl23pIvghTV4fwGDGQ1vHRu7v0xrW4ZAoy0/By1u
         DB8VMZLGhFeduFwN9lQywNVDqNILCfzs41TlZJYbR2Wzm2LBToJ8dJ0czftVtbJ1bKMV
         nyU6IF5IH4PrdzFm/USvv7nYk6psRqqQWm1+MKGJuZP6wA9oXx/WjUNFpnaYiCXkuREF
         XZVCq2QZovZlL1Jv6cS5I3ZMH1x5uoLy7Z4eZB721n12qhk8OtVQLCry4QPE/VD9jAFh
         eITw==
X-Gm-Message-State: AOJu0YwIpyd2UvPrG1lz3/u8seOFZRUffoDHwTURP0DjfF0A0e/1Wn94
	4GQzXfZLexCaet4EZrE2yLeGa1/Ws7OCsbH1h3TEEd/sGVy5mvAcYSO/HMOjXkFQe69RNtqFZhJ
	yjTqE+scfzPz6uK6fmoNzmNpGuvf2tyjJzGT+EdXfOgTPd5TVn0ngRbNIevxKtHR43L0e
X-Gm-Gg: AR+sD13xOuDH9uxJ1FlxQBdLSwaENzQ6UgIJIUD68YN01GfwB12kNEgQqn38+Y2iEO2
	m27OPDWuA9iTejVh+X2bZywtnc+rZn2vBGJWaWfTK9yKXhYwkQxNf4iO54wJlg+t7UoJZ4Lc808
	WnKzHys7tWBp/wKIzSUCSHJnJqS7oNwEpodX3ZfGvVq6bmDICk6wQ66oO13hnHQwDVlZE2WnW5f
	YI/iK5S2+ZQ3l+NBap3escVTC0sA59rW2FCuCrLmKDgRJoXagrdXL2qKSyLxwZdbTVsBW6k5bHB
	6w/Rcg0uYk7EA0+/iGO5SAe7cA5fN5QaDV68Nv1h36KNXBPydkLuzB8HoC7i2K5u2favLxbhLzo
	fBmctDmLN0fbDNt9yP5bmJqO+IyfhcAAZ9LjE5z9U4CZ6CW4O8UT5CuFcwnNR8VgmasqN3B4=
X-Received: by 2002:a17:90b:4e8f:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-39580a80a58mr4065242a91.1.1787118903809;
        Tue, 18 Aug 2026 22:55:03 -0700 (PDT)
X-Received: by 2002:a17:90b:4e8f:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-39580a80a58mr4065187a91.1.1787118903372;
        Tue, 18 Aug 2026 22:55:03 -0700 (PDT)
Received: from [10.133.33.183] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f9ab4b4sm1275131a91.8.2026.08.18.22.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 22:54:58 -0700 (PDT)
Message-ID: <aed5dcc4-8e7c-4f1c-96e1-9b423c053480@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 13:54:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] Add initial Maili SoC support
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>
References: <20260819054203.61385-1-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260819054203.61385-1-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: C7btiWzCtH4NW1ftx0o64txTgvwB9tei
X-Authority-Analysis: v=2.4 cv=bth8wkai c=1 sm=1 tr=0 ts=6a854538 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ET9HiAfWD_CoYkg_E4IA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: C7btiWzCtH4NW1ftx0o64txTgvwB9tei
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA0MiBTYWx0ZWRfX6QrdImF5gTja
 yecGuR4BLyjwXo0ECN6SiXs/yc+SlmB8pSekYW2CYDXpK3F6aWyAEhOfwGcEfFRG/aFCFAsHETM
 cBkhJQ8/WJhC0K6uhzbG5U1NAu2yIlDg3Q9ONAjDd2A1Tm1+1cMzGrTjSnoyFdE0EQIEFfuGPOs
 cu5vd5wCZ4fk+pZ/Enibcw/d1VneKvLtsVVr96rtR85bsD254mCPGk7BXCdCrvbkLZ7hYJMjbiJ
 OwCL1pVheC4JYlIM7DFmdlD7Xh+Md5Qahr0pwkQyOODpFtxxtXYJoAkHX8ILEPbVAN5AZQsV/g1
 SdR2JXjZs8rDAIJJv7jm/2XwBu3QrNoK9SlIWl2D9pMMVV5F2xxdFh6Va9ZMSEcYkmjdJnTRScL
 ShaISaxm+7fX15jIm5bKBzK4qObRZd91dm2g9QXFgXakprKTl3+jWYm6XsgtyscYeZM1yiXktI9
 kk6gcLl1Et26r+A6hcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA0MiBTYWx0ZWRfX29gtckUtMbIY
 HZx4W4RZZhQElb8mzmQwckFmAXdEMXgHM31ndcPNaISxFTSYcucNiBva6ST4lxC763+8M+QVHaD
 H4A94u3Ka9YVxKdfq+Bf5axK6EE4bTs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190042

I think it could be better to have a more specific title like
"Add support for Qualcomm Maili pd-mapper?"

Thanks,
Jingyi

On 8/19/2026 1:42 PM, Prasad Kumpatla wrote:
> This series introduces the Maili SoC compatible string in the DT
> bindings and adds the corresponding pd-mapper support required for the
> platform.
> 
> Prasad Kumpatla (1):
>    soc: qcom: pd-mapper: Add support for Maili SoC
> 
> Yijie Yang (1):
>    dt-bindings: arm: qcom: Add Maili SoC compatible
> 
>   Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
>   drivers/soc/qcom/qcom_pd_mapper.c               | 1 +
>   2 files changed, 4 insertions(+)
> 

