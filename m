Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E901476066
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 16:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786552498; cv=none; b=F6U+q4gFENA3dBxUDwyn1n9+gLcn6lX4Co+fIZtkl2bVInGoSRAcklzaqpd5Kj6HFbjBd1IFERYkcL3yop7jsBYEnoSTmYyaDSECDqCvPBhsPt6YnXhkB1Edu9xzoyQXopmLSTSZG93CkDUIbLkr2bDL9jAYGWXeYHjf3TYsgBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786552498; c=relaxed/simple;
	bh=gA0lORcd8PzgzQRPjvcSZ8SlhYNfUM2OulIiqvoMyCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHm7AFzXFNHg88XVIthRWghg5h4tWHPIGWXWj9Ry5LEW617bbK8ydlVESxByK3MIEnqzk429QtRnZML96bgGYOZAIWHvbWjWpV6DLCorrihul/yRGitJZG3H/nBcgtTRgrsI0cY7oMyERdZMH/A3XyoLVlhRVhFnFuzVx3z2lx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DtPhXVz2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCawuyCl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DtPhXVz2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bCawuyCl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDbuAK3194375
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 16:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HidDxqccptEjRvOvXtg+GI/B
	TnjMVm5M30ebJJ0kgIQ=; b=DtPhXVz2+0m/R6csiE0wGrnIsFPodPamlwyUI6pf
	zhlldQEOuJ7nDYPJKChetqocP+ZHEezY0pFdP5YQ8xqRgyLQy35Rv5PHHcVo/0jH
	kTzTmvlhPi7xrG85rZ4MvUXQq13X38FVm+ARtlyjUHut8tOJ/ykvGHUxEk82j0GU
	njjDyif9U6MCd6RJzCAwlJzYseugPR5COfRV4jdrEnReOlc9rHg/YL6S3fWJdMCI
	OZJUJph4OuCQYU/3XVwN3qniFArxXKV7AUfuTUOA7aXb7PI5FbxWqkIySnT2Oi81
	psONeFFgEbwA49HBLcfCUbFxdwoSqP1eRugJQMnLQ7b4WA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0mnda8wu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 16:34:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d137a68so24099971cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 09:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786552489; x=1787157289; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HidDxqccptEjRvOvXtg+GI/BTnjMVm5M30ebJJ0kgIQ=;
        b=bCawuyClVmBDfAKFpA2HNmVTfgohiaQuTzpfFg5HTTY7BaEQqOzsKT6bTX2/AE2B24
         bcF+lN9n3NeCadetFVoVb1ibkRgEMrtx3OD99w2s/sTUQxEUS0gRehQu9QCa3GAI8YWD
         oDHFFERK+0dEPlq/5FVnFgrbSPkzkXq22Kotpy2f40y7sksZ5E3rkAJILgcl7XacZMax
         ReJ4B1GD0S/e1KDMLcUTujpVHM3Up5+kBP/PiOQ8PymOk6uiCP3LQDTqg+f9yfXw/Be/
         k4SiKDg7k6kpsBGmbT+NrKWZQe4yLzvnsz/TxU7ZvsSbLRP8t0V4MxdRrtTQyfW30mja
         JtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786552489; x=1787157289;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HidDxqccptEjRvOvXtg+GI/BTnjMVm5M30ebJJ0kgIQ=;
        b=IFiF3bk0woQ7OT9pdmltCsjRSSImlOCvLQuaXq0V/JONhwCNFACGcvANB/x3JXiehn
         WPseOkYY90Z2gfVhQxckZme5PF1fpylOG4AQHrZVV5KHN1wtz/E1FFmrivt6Xic8Iiha
         y91obZq87z7e1nNkUEVR0E0RZv9jizdbEcCEutAPGN5HiarXvIaThzYmh87SV0yPZadC
         1ymzhiWmOYSHwKD6r4uzAloKdMvrgNRFSHu7skxecOPNlsgTGgLtTjVMhREDVg+ZHdoS
         Rrdp9uzC3ElkkRGmMLaWKckJ/aIFh3+q4+1jMoyxg/MkriUlhxXvDqePmw273lVFIYdc
         DlRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp6nPlfMWHGcSc758yqloCjUSfL/9rMHelz+cStHlu4BKlcSb8J07wRHkZL5KvHWGn7Xl/LsL2G7cYf45lI@vger.kernel.org
X-Gm-Message-State: AOJu0Yyglh6aSCm7N8YtNJAI3lHAVdXeFJdyUHAtyUL9foRAD8MCUOAu
	ovZFeGMq4ULhxeXUc4HoDeQzMNBJmZfJLebr743kWBINGpwtQSX+5bUl//OPZ5iarE7e9FFjdo/
	y5l9RIKTF+dM705RmWieY5LopzLp00BprKqeDefbydNxxxnwtrqcAyyp4te54M69+nDbZ
X-Gm-Gg: AR+sD10wTAag9aOG+KVVl+spGW8Aud9ydNjj0uGB+WAAVyoyVpNFS0xqE4DNVxNucNW
	wm7T6zQf+yLgWZbeFnhoOwrJdcc+a8wLavYsOUiDSuLJLoxDsLQErt3+IHMDmfoXD5E4DppKwPb
	y26IfOpWhYMk7xzzCuVSrzjtn2uw5NoZCvxkoA2JbK7K4g73FRcd7M5CeFt+MMMcJrfRHA8marZ
	U3v1Dp+zFlLIm51sbUmNLRfyFXQfTErMWAzl13VReBxIifWIbhHsmbKmt1wZ9Wyy/KrGlwZ7RcX
	qU9ZJ+N6GQRh1Ydv5fLHUx2HgVdhh6/Uy8tmI+V3DgL8eQFLo+Ks0QC3xbUbI04aWO8XE4AOWlz
	Kc0kawHbexJ3y86eHHriWItkqclz3jK5gdKOM5jh678iCvUqDLOCSLPWtqk1MvcX1gTsjDe/9JA
	==
X-Received: by 2002:a05:622a:1349:b0:527:809c:f9cf with SMTP id d75a77b69052e-52d647ed01dmr52950881cf.21.1786552489288;
        Wed, 12 Aug 2026 09:34:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1349:b0:527:809c:f9cf with SMTP id d75a77b69052e-52d647ed01dmr52948811cf.21.1786552487064;
        Wed, 12 Aug 2026 09:34:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44cfb2e5asm609335e87.6.2026.08.12.09.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 09:34:45 -0700 (PDT)
Date: Wed, 12 Aug 2026 19:34:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Greg Ociepka <greg@ferrisoft.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Mark USB controllers
 dma-coherent
Message-ID: <5wnlpg5pt6la5e7fgd35nejmnh6iudemlriiubm2amg4qkdyj5@6p6iakiik4wc>
References: <20260812154014.123315-1-greg@ferrisoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812154014.123315-1-greg@ferrisoft.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEzNCBTYWx0ZWRfX/epi4wr80xpE
 VUVswhukW7gmFpRY8gE8uvLcXyBtgqLLlt5StEDBcp5nlwM0ho9qX8EiOSfSYc9jG7Iux1QCzQr
 cikSNKAD9Yb+7+VlewTbbOAZctIw3KI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEzNCBTYWx0ZWRfX2CQFdOOrAwzt
 8CqKWZ7iVl6eyFjx6b8h4k37IKQtqE2ecumJioKALZuYvxDZjCtvfafsRfgBcnsFPmOfBSUceU6
 UhZLK3M0uNn3DwHtYZ/HqEtI24pN5xATvd2J38bN9GOZAq0o3LqLuGrZw2UtP6iqi/xhXRxDnxF
 MA8K0i+eaK3rAF2Dv12Q27baEJj6rbwzKvlOlYP/09+zWnginBd2Z9coFjLFigMfPJ3vdqgZml7
 ZJsE0VJEuaoY3iyToeDLw8uZEV5DxRZxgLXCX8PmZuMMttwZ7pfs5EMhPYH4o+PL+oPFsuWWBN2
 FGB7FaOV9vmQFJ3HpUN8pKy1gYuxY2L0kbc0Bz8GJIWoFlttBHBYw1Ft19OrK6BhduKHFWT53CZ
 Vcvfu0Id4AgjvDuWWQMo52hzqDaaxOKu3IiL3lBmU7BMUbF+s7pb13erNrI0b8r0VpLM7k8FomX
 DDBD2ZBfj3TjUOkLe/g==
X-Proofpoint-GUID: yUt7mCoUInh-_aeB4r7YpudOPDhZZIa5
X-Authority-Analysis: v=2.4 cv=C87ZDwP+ c=1 sm=1 tr=0 ts=6a7ca0ad cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=a8UEx8NLAAAA:8 a=i1Pha25J8sJlEzR877YA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=-yeuc7zBjbfZT8aiaP-D:22
X-Proofpoint-ORIG-GUID: yUt7mCoUInh-_aeB4r7YpudOPDhZZIa5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120134

On Wed, Aug 12, 2026 at 05:40:14PM +0200, Greg Ociepka wrote:
> All five USB controller nodes on Glymur (usb_0, usb_1, usb_2, usb_hs,
> usb_mp) are missing the dma-coherent property, which Hamoa carries on
> all of its USB controllers. Krishna Kurapati confirmed the Glymur USB
> controllers are dma-coherent [1].
> 
> Without the property the kernel treats USB DMA buffers as non-coherent
> and performs cache maintenance on every transfer, which coherent
> hardware makes redundant.
> 
> Follow-up to the clock/power/bandwidth votes patch [2], kept separate
> so the already-reviewed patch stands as is.
> 
> Tested on an Asus Zenbook A16 (UX3607OA): all controllers enumerate
> their devices as before and a 64 MiB write plus two O_DIRECT
> read-backs over USB mass storage produce identical checksums.
> 
> [1] https://lore.kernel.org/linux-arm-msm/f92cc91e-6e5c-4375-aaa6-f079a165f4b5@oss.qualcomm.com/
> [2] https://lore.kernel.org/linux-arm-msm/20260812083522.774711-1-greg@ferrisoft.com/
> 
> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
> Signed-off-by: Greg Ociepka <greg@ferrisoft.com>
> Assisted-by: Claude:fable-5
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
