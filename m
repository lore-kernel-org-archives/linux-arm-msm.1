Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED604156D0
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 11:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787915399; cv=none; b=bmVbkAmaAn0m4/ZBLXyBIRObs7y/4K8i9u7e1BvCakzEXvr2mhRGnZT5ibvD4OCLGVHH+hzRhRLM1U7pjZjKLHOcdw8/KdoQz404JVG7PvfAQ881IF2MjoiqcXe007GFUJqQb7hhiUKvcrcRlT4d5beWPrqk5QpuxpjgOQu0YEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787915399; c=relaxed/simple;
	bh=xG1rFcSIgrJvQ7ckFt5Y8Hytd1Fy2ChFfTrpLgIwCkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HZu7X4xYuZYKDehwIvigEz5hhW5c9PO6YHqr4pfGyF9rkweb8pAV3wqI8XQDr+TzoZ/edpvU9QDL52z5FK3t9N4Ue+F32xYssmIqKDNY/nQfxuVtUZBGfwL8RI9NMG776n+1NrhLXbyzgA17ickJN3UMOMt3yVDyXnVfELQELvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7YRuy0J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T9iaZjbu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7YRuy0J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T9iaZjbu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7cHt2744774
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 11:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wfjkYwfc/urAj1g5/jLWsi5W/7GenoznP33mhqucrfQ=; b=a7YRuy0J7cPEMIIC
	GkOx3wlKlUTaAmcGKlYYGIqu05nJjfQ9mjJsn2dAKv32y1EvjolWQyJ6RoLoGxxe
	jUHDPElU/73Vs1MX4VHu78MmSwEmXFZS943Vasli1omemmyonl1bmzSxc93fMlIC
	UbcKVIZ99vS1gfZI10jM2xVBleXQfirx2g3yn0EwvJklXpf042viiFPa4DmTHXU2
	FsAD14+dn23CHvo3Bd/QPueBfU+rIFG+ST85/h+qu2S06C8ZkQsNkbtqZR+eBatX
	UvMsEVjKLmCab+dmOQKpTgsTbOzJD2yFOO4j6lG9kDkzPMKTuIhiz4l7YPHfc4Pk
	fQXHqw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mxsf67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 11:09:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52e4919be6aso2178491cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 04:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787915393; x=1788520193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wfjkYwfc/urAj1g5/jLWsi5W/7GenoznP33mhqucrfQ=;
        b=T9iaZjbuhDTuPM2HDIcyRBFfSyWUdEhl9Zm94DiMITlafeowqLZUYeEykWTJVrzPRO
         UxLETdnytX8w7SMXfuEXE1N5l38qxzktCgI1G0dAU+rbTmvgiMM3X0YLxaAIjL1c/fam
         5z2DZo1zz/+eeBrQKfza4kf8kppk8rgreXsARav4ewSODq3+HKAIgUhu2CaUnE+1SRg2
         xwnqBDdZyUcwkq69HrzLjm+fsPanncdIKJcnPTDS2eDzgdFAiKYXo9vNsRzpknY3mYTY
         AV1rcvM7nEkY15wogMVg5HjTbtbvUCV632xQ7adlUj5bhwIYwWiaaY2umN/UmYhyh4TR
         gImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787915393; x=1788520193;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wfjkYwfc/urAj1g5/jLWsi5W/7GenoznP33mhqucrfQ=;
        b=Ax7+2lXsh+EIYLLPqUlDk+qspXogjLquKMr2UApwdkVT+OxMXXcYPt/Pjq5e5GRM50
         238z+vW5OOOv6co1B4xXx3n9CnPyvfQAlddlEOCPC64LEGyCXLt8d/JT8q1zLcEb2j/y
         is2nZY4GKQOqddvurrs47tK8lsSMrghWEmMW1oJcFvDJ/2kHdiL6N9PmSHQgVTIMMl+D
         Ou7T12d/50VewZfeR7sywaVeT52uzmc+wM4qQ3FJvwz1ZF5rsbvqxZlfQIdAxMMs9lKM
         S0HNZVt5mxZOyHHxRMyE2NE+INr+FAdu2RefvBBZ+GsJmVG2XgjKNiC6a9s6cxAscg0Y
         V6Kg==
X-Gm-Message-State: AFuF++n222KNN24zz9SBed/SkFb0LERmcPdVzE3cM6oCaHHf7lml0Zln
	qH2sNFL7f30ElxJjg9AceYfsTz4yioaCdHrcDOVRjUCj/1pcbmdUKCE+vlZ8asCtrXaSQIaupTS
	oDXB7fLxqMKaa1jByqJ+c898Tg6TacJIIM0Az5XeTcfkQMwypTYX2uvgs6BUUIOloDJUv
X-Gm-Gg: AR+sD11CpSHPUoKwg8YHc/21aCIadyPLiRhZA95X0zEj0ZSz6zwn/ahop5itLvulrOE
	xCLhoQybDN4wAjKEJuKbx64PLb9J0Zthi0yl0vDg5ivdIbvxfRbCvIOI2W7IoXi7A43nMV5JSX7
	jSp1jn9nMj3Sw9s4x8xxiVNrosIw7phYOV5uHFkFxkI68Bvl2KDtWOXrlecGcMEsQDOYn5zPaxp
	7AYkUqGAGvMi6BVi6Uz+HQm7cmmiGeg4FrRBT1bSksJG6hyGNqXL43vQL+H8zRldicC7ie/LzPr
	PytS1ZhiuhbKpTQuBpxgXcMkfRjRqQPj1ZxmHU4nuH0NQKeKhVwuNRvNF6b7xw+iAA1G5pmrcQs
	42Du4SltP9yPFxqCSxAuY1yc=
X-Received: by 2002:a05:622a:164e:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52fb9362f8cmr45134621cf.1.1787915389063;
        Fri, 28 Aug 2026 04:09:49 -0700 (PDT)
X-Received: by 2002:a05:622a:164e:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52fb9362f8cmr45134241cf.1.1787915388649;
        Fri, 28 Aug 2026 04:09:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b6f20dsm395292a12.10.2026.08.28.04.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 04:09:47 -0700 (PDT)
Message-ID: <06d1db31-1168-4147-9b37-3662e8d949b0@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 13:09:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] phy: qualcomm: qmp-combo: Add DP COM v8 header and
 fix register layout
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
 <20260828-glymur-phy-v3-v3-1-8e73ce7c4636@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-glymur-phy-v3-v3-1-8e73ce7c4636@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA5NSBTYWx0ZWRfX9DpGw0EEyyOg
 LCwzxSfVNUed5qyJf7LPWcjm7THZvQidAGYY0GwaOzLyu9dTJFPY8RhcZ8wzZ7Q+V+la/xXlcgp
 Tjb78uaSV164BlXlR5pwivLCnQEa6dF3TNB5G7OyktBadlfyHSKCx0yodsWVbbBjTMCM8RYcLRH
 mtD0XHk6X5/M1pQ4EkheKfL0Ae/pDnwJqL/jandNjZ5mVpCF4MUCyhRM/tT+5ZN/CEalV7Qkmev
 1I2YWowcj+fDbxMYCdVRA1GPOjjBxVMULyEKgryrfecx4ODyOaS7iJh88LXLlGSIXMmYnfx8Xgs
 9obshQ54Oc7O8nmmUcPreGWR5IB9MKh4fZDVBlffyfQf7zGMU7Zpyn9pu56MOOSnQYx+h4o7RL1
 HmTIf+xtNP0WgMGjewp67X74HjlHV4CbQ6fg6liU+UL8MuN0rYui4SBsONeuo+4ABzFsWm5TPPg
 YTHeTEr9Nmn+YqFGgYw==
X-Authority-Analysis: v=2.4 cv=MONQXsZl c=1 sm=1 tr=0 ts=6a916c81 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JKUcNUVehQOhZJPRnW0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA5NSBTYWx0ZWRfXxwAzWqNGa6tv
 AwYa58uGPcrPPDoFMp+NSqD5JWYhDX7MrP1IZR6g3vviIL0MqfxjiVN9l26DGAq2cOW1xGLQagA
 Cb0fQZNqvSQfEk6deSPTf34yDGF/qFM=
X-Proofpoint-ORIG-GUID: bgfMr__PtxdLX7MEtkAIxUKOKInMc-lB
X-Proofpoint-GUID: bgfMr__PtxdLX7MEtkAIxUKOKInMc-lB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280095

On 8/28/26 11:43 AM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Add the new DP-specific QSERDES COM v8 header file and update the
> register layout to use DP-specific status register offsets for
> C_READY_STATUS and CMN_STATUS registers.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

Fixes: 5b289913959b ("phy: qualcomm: qmp-combo: Update QMP PHY with Glymur settings")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
