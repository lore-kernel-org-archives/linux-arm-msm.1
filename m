Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36FD455175
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339636; cv=none; b=Pl7jZXtURAYyN6VoeJELjO4fjVHOCb83CiY4gFF1O9EiJxn4BY3fn+i/2BJrnlFzW3j+wQq7U6aXsZo4dheaow1FkqUDmDxTnhbKUZO9Kj5jRTQRGEZMiGqfzFlaz650XUaBzae+Zd1NBhKU1K4xWCYS5ldGOylrkvGIKXGhtPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339636; c=relaxed/simple;
	bh=boRM9BbxydKBTqZLcH1IrPeu2lNwFuFv/YoQ17FReuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bd2pymtvNEaOXLQ+P3GeBJnZBovNKm0Pln2h83T5XqYvg7hZ9qoWTmou+hsKij6oBq/2EOBf4uhzot7AeozVICqgy/Gt4X4ud9FHPmUoa71W0GKgFFNqwqLgnz7YgmjIW+lkcl3P7qgJcm/hmQiW4qrIGnAYxmXvfCxmR6xlBRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/soHykA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hKo6zl1T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/soHykA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hKo6zl1T"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TFFwO92092795
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wbEQBWqENtkMB1w5Wyv00PZg
	odESykVMvKXI5bLwugo=; b=o/soHykAtpHz5PudiP58I6tZCLfgikfopz2ZKEPj
	b7jt4zKk/fj2U0xI+7jqPf9sU0ho/bXaf6mdHehqjhrrIJZaWA7MEO+7TzbVa2IZ
	Z7KKetGWanu/WJnaCNYbPxy2BHgb6CvlhZ6U/MGdX2T8FqJASXLzBZfncT7Hyd+8
	zd/O6PjLW6U4MDPwb4E8iLerDRldTaJjkWO1ceiSIh1hwFabrJPzRRRejFGR3qBN
	3M930N5cibnF8Lg9h1Ebe1mkDpqkRs6Ak4AM0KI4M5W87PqXs5BwofoGkcAmRAit
	u7EyCp3qk/V9tZrS1GIvV9c44F8YhDuBeg0xDeR/PTXpDw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqm0fg7pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:40:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c12e43b98so12029601cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785339633; x=1785944433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wbEQBWqENtkMB1w5Wyv00PZgodESykVMvKXI5bLwugo=;
        b=hKo6zl1THSR2lyMWZXPHjmTrzjvrU8izh3iQALOJmGG8hWKgB14ShZVcY6SMnogB+B
         L3IZ2NcCsCrLgymjkkL6Ob4i0iekmty1Dq5sVAryTa1AnmH6inK6leEPbcVcZq9cRz+9
         zMGdCdW4rgV+x6Kz5kH2PIBBNW8N3wiog+GTKKl8OsCK8mPpJsSlQb1ub2axbD7GTIt/
         5NSkbOYuta7h6B4RC2xFA7VgG5lCoWgwR26o61HA7bn/C9mIxY3RXrgJ7tTJ82D0/aTi
         65TqPDLRCL3+AC9uLOZQjnuLWDWly1dDSUbImkC6Y17J/SAxHZPr3LQSt6QuAaJ1J0jJ
         /7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785339633; x=1785944433;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wbEQBWqENtkMB1w5Wyv00PZgodESykVMvKXI5bLwugo=;
        b=GaebrNUjJFugquKgN1bNjA96m9XvEi27MHDyF4RNjW6fGuX3sJvOXAFWKp5nbr6R2G
         0OGJfDLgD3KVc+puK/9HLL6vGA38W3n0pGUSvGPnq0/+nCBWAyy4qbh51NLruE1BryIk
         KotbQD9/6m5HEpbx2+UAgqNAWpC9nigfWJ/wn24QnR+h73XolFSE2woic1FenR4zs77X
         C6t1eh28H7jGu2ocNpqdNGWI57dXHO7lCbDQZ3SUFVOBT1lR+gbYOxm8gdrXUw9X4It0
         R566Iq8b0enUIKurym6141LuTtIbvHQWwULspWWIkW20Tm392pkahitbO6XsehCHRs/7
         G1mw==
X-Forwarded-Encrypted: i=1; AHgh+Ro6sdkYi14H62hSX560kQt103FX0xFJT5G0Vn3r2YCM1V+NsVt/Ye6/I75GjEg7W13YrXPSmldLw7WBbpNz@vger.kernel.org
X-Gm-Message-State: AOJu0YwejnLEvREuqZ8rAglkoLZXc0DA7Q/by3Fap3+JXvMEe8ZHcXPO
	DySDBnMX48ezrIYm/5yMq8+kuCbH6mlccFswffFngLw/zOX7z2oRTKtxd18ElrQP/c/rEyQ+GYq
	XD0uPzBYowLFTZ5F1ANWkehjquIi7FDqsstFgXZmvuePR9wl8oVag8hRJgmN64YkkWHJO
X-Gm-Gg: AR+sD13l6IBONzWYNnvPDeCGRA0pdy2Xs2Yb2iBRa9KRShn2xt35jUhwjzMkLSnlkqT
	cKdWbsKXMuv2ZfrBMKy+XvHnkEUvzbLDOngpB5rtkf3acl1CSaxy5QcfvbXFSQ1m/mA3iPhyRTz
	SJvMMOzczFM+g7Y9Sbahd09QyHoMlZQqaPpIKQNBePdVATfeuL2ckxCWe3M9cTBCEhI3IedB2BE
	6kQV0fZmqLZI9YkqRDkVjM57c9SlAej5x/YfmUyxzPvWllPHHAaPmLZ+lq+kccaf0opGawj/tfm
	5PznOIAyQScMvTkSE7b8OX4ueF9Bx4ev5/yaF7NtlCehR55Mz5yo4IhPNQShtX0RxihOoInCBzT
	a/ktTeL/jKJ1EeeY=
X-Received: by 2002:a05:622a:4117:b0:526:d946:fc15 with SMTP id d75a77b69052e-529d71408b5mr64073891cf.66.1785339632825;
        Wed, 29 Jul 2026 08:40:32 -0700 (PDT)
X-Received: by 2002:a05:622a:4117:b0:526:d946:fc15 with SMTP id d75a77b69052e-529d71408b5mr64073261cf.66.1785339632098;
        Wed, 29 Jul 2026 08:40:32 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49764d72d9asm68554845e9.3.2026.07.29.08.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:40:31 -0700 (PDT)
Date: Wed, 29 Jul 2026 18:40:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: hamoa: Extend QMPPHY
 description for USB4
Message-ID: <lmchnasnykn4v5nxnucrlmhpxubpozhydte4qzotao66rgch7u@jtf7jn6wzopt>
References: <20260728-topic-usb4phy-v2-0-5d9dd5149ec7@oss.qualcomm.com>
 <20260728-topic-usb4phy-v2-5-5d9dd5149ec7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-topic-usb4phy-v2-5-5d9dd5149ec7@oss.qualcomm.com>
X-Proofpoint-GUID: L5aeCIkszcHmL-V7U_cMg3O-noET-a_K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfX8ju+uE2rksLg
 B5lhyYyE+dAegIluvZ3QqFnUmd+1EwpqPSdylSDSm+tuZARP6lf8d6C2RWWOu/qygga4yyovvqu
 tWn72AImjzMufk2MiBY24hbqs/Wki20vIKNWoe3ZgYlScZ7wNqglNoAmumbNTkuZQVFKfByAYzj
 atjhEPqZDb26fpDE5hW2ZyVXnm+yqA53GxL5RrnT3dtbiTMmzpgmRXVGoGnklnCOQRK3+pMHLLR
 ilXeIA5wV3CTLajHAAHeVsfUr/e0ZKhpGhCMH0+YYLgnrFqg5SlMvjdfDgl/7MQ0/Ts4WPe0ONf
 LUzXFZoRE3xzAi+qpDd+DTWLCxDTPqaqCYgMftKcLbzVwrBJAqnAdtkVGisBixPHZYloNvWYjcB
 ERsNxBt5EdBv1+oDUqwmEy8/IR+f6LsUJGfbEs0K/gl8wf/Vc0vcLwemdwrCN7TbDgV6AzEIbdp
 hHAnqVOECW+Owi0+VZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfX8vTNWW7Ztftw
 U29fFjnR6gnIL4i+Zs7T5t9w7g3h0W0YHhAsYZV33akVVkBWai1y4CsYbOyiyVsVpCwU+EvYiCN
 VnIHeoIRe9iKL3+s6k+gBLmjRc71a4c=
X-Authority-Analysis: v=2.4 cv=LvuiDHdc c=1 sm=1 tr=0 ts=6a6a1ef1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=qXetow4D2dObSurrW18A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: L5aeCIkszcHmL-V7U_cMg3O-noET-a_K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290125

On 26-07-28 12:10:16, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The USB4 part of the QMPPHY requires that one more GCC clock (P2RR2P -
> PHY-to-Router, Router-to-PHY) is enabled for the PHY to initialize
> successfully. Describe that.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
