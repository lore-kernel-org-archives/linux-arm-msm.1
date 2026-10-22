Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665300;
	b=0a54wqUV2aAeP/6jbAoMJn7o6n37xWW+KIGylsllNk1N3NlXd0lKyoDhdJqsuvCC70Ev
	 Lb77YDDreECWNz9gy9EWV9e3vkwIr5baPPHiIUZn5qiLHtwFkMF3x1KST7QCdLN16HTWc
	 Vsd68ApU2U1ZqTji+gk0csDhnCaaYDjOkgD8+zoMt7c2EKIF0EPgJiZK4xr+ODqsPDvXZ
	 Rxa2fXtuNbbev6+2SnEscLF5iPaSxCGfF/s5iZrfFdusVX9ZuNsWaJTN05MNh2qQoqXvw
	 lmX8VXsuiqjhbu/sa743yOvJ4kBrqvwBU2i51wlWwHjUSF9tEyOdw4gAUZCvHC9v4qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665300;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3pHu6LTjqoRt1XRVtGAiHjX9/n4iotAtMTU04HWhmxI=;
	b=mfyAAFIkE+6lx55s8wY902KU2ueB2wAKyT3i0lEGUHxNh9KBCgM97UFgVYkdoHMtp48p
	 pn59NtD9vlsDoUjbrONlVHSP8RFrzWuFV0y21jK1I2sNpEVQjxQDel/LiMI8Fcji/aNSu
	 rCdKNbhVi/rfjds6LibIAxu6N4LeUmcj/gwhMFx0RMqzUMOptHCNzr6zmPsYMzAXnit6d
	 Dea2oAfU5tsUdC+Vj6FfIZMQnYTJqfZBODAMfaKqoXZMLPtgRDxspJsCgfiejG2NVekdB
	 grixehTw10a1tu8dNn2i6q2m1NY5OkrFMbBQSjaObf+bndmT+zvli6Vmqx41N0Nt2Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VWISRxhN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ikd4WZlb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D64606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9D64606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VWISRxhN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ikd4WZlb
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0eCp3923338
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3pHu6LTjqoRt1XRVtGAiHjX9
	/n4iotAtMTU04HWhmxI=; b=VWISRxhNU0Z9f8W8Eo6YwzGdm2GxsJYopgUdjPsh
	ZoCXQI0503VJ0bqYyuHXv/7q0Tsh6AWOhWlVQzkOeB2gzvQmqTDzW8N3ySstNWlQ
	FbhJQBKwwgm1Ojz7QITHtIS5ffjzZm1s2u0FLuhKtVT8JXSIltZ+VyJYu9ZlmqPX
	cv6KZt90S532TJ3Bui6H0RJbpz74gL1Cm92Eca4CQFNHMbFvpHOi6Frrq7pOZ9Cm
	RI/DzjokBPMjfJj5wL3A77vpvODd54QIY19+bPgxfZb8aLhgQ0NWBC/4UN3EXgQ9
	4zpfUbM6B0xSr1o9wC/1NbAx+8fmrnYXXV5QiX7QQ2fVrw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bj29e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:34:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f62934ef6so163289485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 03:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665298; x=1793270098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3pHu6LTjqoRt1XRVtGAiHjX9/n4iotAtMTU04HWhmxI=;
        b=Ikd4WZlb0/PPqkdcx7fozeeQSdoBK9WayV0/fpfo1nkysx7ADVsyBGyRNjx9nVa2HD
         KMXGTtI8nyUT7cd2+0ESvBfUQ8tMFho7XiazmYH5HNqb32zyZMV5O2GLu1T6lUd0qCLM
         Po8uFYjydZxVr8F9jl7slfe35mQCcBlm5b9T9hdEbXcsw6LS1KNFVFzofuqKhyI3FlR/
         dhCRC7wPmRfJOTbV6PUIkunoSkuGT7cUi3sRIJVmxcpsZ5elVyE9MobIlb9TzBo/px4A
         WqQZcQ6NBaZTjrrDOhkX+2af6U5i+lj1IQ6hXiHdyNwGt5MV1it9hxuPLPs77YJhuEG/
         HBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665298; x=1793270098;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pHu6LTjqoRt1XRVtGAiHjX9/n4iotAtMTU04HWhmxI=;
        b=ygbEIhBdI9Zr0r77+GmUIrtBSqeaYyZmAaMscJnHrR57vx4MyESF8NJCqIYtettQaR
         7Yay7AvWWH/IPBMgo1cPpAXeVA8dOa7XG8ill9tY6JC1ixLVh5KfzQikF+G8GPyvY+JX
         SklkC9Dl5xQ+t2tKx0FZM8H4rJ6k9Y7zYoK2lhRBDTK0J0oJOGllD/BFuP7CQML3euGd
         iY5NUQObaOMqWnHikNYJAXP0Q7SgVeFnVRY3nzs/Z76sHwRGsvAaBRJ91ZFukNq7sPVJ
         YvfcRWjlJnzNV97z5lJKL1EEM8bWGtXzqxWGjJg5KBmPpdDAdLh8Jp9YfFfsCiF+zIQz
         Q8og==
X-Forwarded-Encrypted: i=1; AKwUvBwqdBJdZVGLn2tCYlhCsRlyDn6zdB2oOC+BoAJgyopYSEq2jnqeHGK7cRNe3C1kZ6ProYd3thZk2hOTeE0s@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2rDZ9RqHfMxYCHbusRvYgpGRBMYxFgw4IyjSXpiG0gCXaCb8D
	PnohbY+ptto4hgLl0HK2i82IGn0LlYuLzDVK/Wfm+YY+LtZAhx3OFroWaQsM8Sda9mWdZR+7tJr
	eTtVzbSPqF+sQY229cDJwjvqbqQkic/kBYXJLez6S0NW5BoHytYIfkYe35BEZosUDlQtp
X-Gm-Gg: AYBFou3vHgS0GDoeXYSA5m7v4aWoJabxq4fch4fnLllR9dkz5SUK0BycDGPmoJCsWhF
	Yjn2L1VsfO4nXzKfHtbIpEvuJqkbsoKAeO8b4yXkeLk4UIFHVEtahfmxW2e8P0O1ikudMHAjGoo
	srw6mM0N7Wp5KMz/SHCghSVMeA9NY/R+r+PVzwvqCNZxXSb6KRN21JSN9JHV6aush/ySt0Hzo5a
	Y7qCJHcxI7d0UtkibIvfPBgH7ZhIDeZR76IHcYT+dE+JIrzJ7tsN5CvrSublDsM7A7widp4FaJu
	pLxLF6Pfi283yAy5wyrnZkj4mNlOn24HYoTPCUGt6541O30bv9wUj75uYoZJVJhX+V6Dq3QsNkS
	ryfoC0pIcICxUTA+guk8ZbqcDM56uY1OtWOJhQl6CG7UjclRw+ZnYweVmNPh6LgxkImo9qSzhYW
	R111umxq4Y9TeC
X-Received: by 2002:a05:620a:4481:b0:93e:60e8:c9ad with SMTP id af79cd13be357-93f57e3fd7cmr836830885a.12.1792665298304;
        Thu, 22 Oct 2026 03:34:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4481:b0:93e:60e8:c9ad with SMTP id af79cd13be357-93f57e3fd7cmr836827285a.12.1792665297749;
        Thu, 22 Oct 2026 03:34:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1b94eb2sm951886e87.45.2026.10.22.03.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:34:56 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:34:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sm8550-qrd: add DisplayPort audio
 playback support
Message-ID: <y2llowqlazb7phr42o3v5qvjk6qkixgbc5el5wdcb6knoru6rx@qy2q23s5d5wr>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-3-8a189c71938c@linaro.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-3-8a189c71938c@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfXwUcqhoNU45RY
 mD06C7ah2poSmN8rFg3EgCXDiUF0NMC6sTol2UFejarjgBZayRR6wdj4c7Cz2DXnAS6CTag7y+Z
 iq76zsP1+buVSDucVBhhhoj6tnkXFRDczAZmWmmP24riNGm3LAq9zvl6qyRm3mDtJk7uwP5kwkK
 eFmH9MvbyW+HVtEgUSrR9KkUToSQ5B6C+9dew7tbAh9K4pRSvGco2YZLxdVjgSrn+FhCDF5y3tY
 bloZJAbsNSbZa+Z3wqgbwpVM4KHh58FqKiOJYrfHGWwJa4fW2baKIK95Q+HywHBtqMAYdtJOgud
 J2me/qUvUzbKOsuyVyStz/Er8p7m9llrYH6iISmBt4MBuo4gFfYUdHlr5SiFeSvvAZv62tpnrDz
 HbWayMZYDfQ03jaJy5qYvpVRjVQ7lCl5IrGgG/XAn05lsgihQtX5dGkvsX1FPlO7Sas16wyOcN1
 OAzFOMtfleGm+Wsr49g==
X-Proofpoint-GUID: LvF9BqvA6Obo02AbxSJyAD4iM7AL-_B7
X-Proofpoint-ORIG-GUID: LvF9BqvA6Obo02AbxSJyAD4iM7AL-_B7
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ad9e6d2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX+mMCZOEk3PaB
 NiJW6BgDXi6EdA2Mtm0noxkvw7fVxCaY23l2/ST8w8Nr3X67AUCnACsJ9i86csmQNbm/JUP9mT3
 rEKvcqRz4b3DO9KXu5LHN/B70znFHfg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220042

On Thu, Oct 22, 2026 at 11:36:23AM +0200, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
