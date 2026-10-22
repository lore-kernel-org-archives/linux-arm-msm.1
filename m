Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663831;
	b=3mikzG78ZQdfl4sIdIkmN6J/OzzFgtFHIqU1bmUqaoap/wAk9O01oOeiVrNZMmd6Hn9S
	 4PVsATUA0H5RokGLTge9Ntf+7wjfDuu3COt6huE/QZCNeG1dZRhTTPjvEmSqDZA4ABgA+
	 rew1MRRmmuA+sFWefiWo+AKJ7gwlh2EzCtRB8Av3bYKWL3b8HcdSZWbsz4VPSzcuc8mjd
	 3ffJWD6O5fb/0eHqv7ebcfahspl1TKwCaaeSfDxQBW2b/VutItY4PzM4G3flEeuPWlYsY
	 q3RXPh4LCMPVq2Xqu55aeYfCy9NTW9LOQYxowV6eYYSrPCtzqLESjn2B281ep8Yqq1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fbKLGq9PyipegVYiZapN8cQvPdSHH8CKY+98Y1mqjhY=;
	b=phJT09sNzaFOJc7XwcPDkn1ZjvB/SVoHHT3ZcODc+chkOM+mEIth8k4r5bPu4fqjYHQF
	 GvA/np4woaBtqdSv9vXQfFBtrqra07F4sbn4PfVQHr9sRxvledrcCKSZirgArIRi87cFV
	 VaijdvzOWwmxQa6jvsvc4MgbU0cgeJkA4tKKm5UQ6xrOIm63xquBMHVHHGUkze1nHXjKW
	 DFoFSChEZBIPxeGfoMZRjazqJLRYZBx1eXdkbSSxhn9Qr1RnZSR9bV6AQJuPTbUpIrmrz
	 Lbh7K3a2C8ACOtz/mqXVkNhVqlEAfD55hNtkuLuAoi30oevYYq1+k6JRNt7k5WOe6rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QU0Webh+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E2LHjH+8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8047F606A32E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8047F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QU0Webh+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E2LHjH+8
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0EQJ2397070
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fbKLGq9PyipegVYiZapN8cQv
	PdSHH8CKY+98Y1mqjhY=; b=QU0Webh+X8+jU6IBgNvZcDg6N/kD+t0REZyXD2YJ
	/p8FBZJkvhj6GDn4hMzgSZi6ZbWPzC9vMwMKs2C49wFrrFP2NYZ7MFB7aPzKtPWT
	66jrEIPjbFE1CDIQVEtP1Ay4pyMP78zyFVMMkB8YBzuO9RspfMfXDJDmrkPV0XXn
	/tlxP45MqKFdV7qsLdPdj1ReD1ERCwx7GN09CLY6rqnG9YBbmmdg/2/fJgXuxQ+R
	SOYyNYFVNX0OkZCYZmbLfpSazF76pZHYe40fY6c2tiHuM55oNupzVihSLXEh1a1K
	3t7JecY5+WZ/Zz64JhTumhF8SrmyB0n8L8IoxzxFJTZ4JA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsu9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:10:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so568854585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 03:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792663829; x=1793268629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fbKLGq9PyipegVYiZapN8cQvPdSHH8CKY+98Y1mqjhY=;
        b=E2LHjH+8yGLt56iO3X34S+5PoU5WeGta0X7LbnCTNle7OJDOxuglHEjz/yniwy+SKT
         RzvXHWfRIPMO4/IqeOttd3tYGCQnZunzyHi+WC2RCu9wU28OwJMGJlsNsr7jr1Q22UTr
         auueRZXp5qlQJN4TxKPOovZqOQa5Yi4MsVb8A10CsYFKnGWx63/uNuGPMvjhLQhs+8B5
         97u0x9t2LF3SoYvpvE1XRcEQ086RTAHgK2kKJjhM4rf5T290wby81tkkHoCskcUZUi1u
         VtJlUiqYgxR/r4CyU9qtDwkx2mCK0gJq5e2AxW8VfI10unluHM0fJlorb4i3BMvgansy
         9XJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792663829; x=1793268629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fbKLGq9PyipegVYiZapN8cQvPdSHH8CKY+98Y1mqjhY=;
        b=eyWzn2JELSyXEkHppHXDuq0rHBWj5ilVO/wJ35yud20W3RHIq/Zy70Q/xr/zvtQPaO
         waF6mWMYiuMxaKuVGIU0rrzUVvpUsskqvrfGeNA1Jfu53Gho0lMF8H51lrKwczBJWirN
         St80k2aA0QGdWiunfOrFzrOQV+jgL+2Dk2PNlVoihvlxwWTVcIaUChQlaT7SKrITyipQ
         GhR1cGKpm1vgKPcmkzZKHdiwFstMWeh2PQ/OKCIzfsPXRrzdIOQYYM45TaOVBuk69mqQ
         qR+LwFDc5+Bk3VJWzovsZamhtlZNwSSDdlTPH6oCPX9+0OBma8vDvpc6+hBupewiB39w
         dNeg==
X-Forwarded-Encrypted: i=1; AKwUvBzUa4b6GqQ/S2o4br2w3HLWBvi7jWCgW+H4k9qHaRMA6jQEvY/jrbbeCYB/+hEt8t/kYkF8s1sVO9PQ6JwO@vger.kernel.org
X-Gm-Message-State: AFq9FYIkdHrVjr8Xhrlkq7/akJskj7Vl7nAVshhGt4Cohbw2vHoRRa2L
	UtfStKAZ/ZVtNmemElQhw0UbliZn4R8vThS2+X6rIzHbm6g4IYFferLhT8/peG9HLcwzqwjWcQX
	C+++rjg8wQIg969bsS/uepz1JS8v4NFVmm0mugtlJK2P95zd6hN/EtcFqmHdA6VsYuLl7
X-Gm-Gg: AYBFou2Lm0h0Dk+aUHrIPZAJ0yNyLBFuTCXHvm6folYanGaGuDfR25KHQ0Gq6gvnBgt
	MqRZwK4I9My5ywrQcBuW3WjwB+Sk636g8IZO2M4TzGONCwbZ3NVYUG+PjIsirjYVa8ZZUiXoKJC
	SlOR6+mymllH0KQHEE2LD9mFeeWs6jBONazzYIPysV9JdAD8ZXtFmRFAQtnqay6G7VTtpwjiE41
	jinJAAXIYODK1wRkwXo+gJEeMOEOSlY/OQJVVJhG3WKtLc1nXDKNex6tWXPtEMwO4sCuiW+MF2A
	Ri1fvz83KxvKy742v6K7+ilgiV+4P8Uwt6xIoeETy3XC5PUDKpD8TKoBs4B1zzB5AA9h4exlqLC
	l+EBuRro08gjbFf7IVCMf23vu+R1wxV1a93sA4K+v+JFWV5SAs04RsOzHzcAUGXvNqlUb3yR46x
	WuBtWalDRoOUkf
X-Received: by 2002:a05:620a:688e:b0:93e:d364:c9fe with SMTP id af79cd13be357-93f57f5129emr848794685a.40.1792663828377;
        Thu, 22 Oct 2026 03:10:28 -0700 (PDT)
X-Received: by 2002:a05:620a:688e:b0:93e:d364:c9fe with SMTP id af79cd13be357-93f57f5129emr848789785a.40.1792663827828;
        Thu, 22 Oct 2026 03:10:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1244ee8sm1026945e87.84.2026.10.22.03.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:10:25 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:10:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 04/13] iommu: of_iommu: Add support for "iommu-ranges"
 on a device node
Message-ID: <325qovw4tt75qgk5uncamb4ca6ql5ulyivkgocumi3bwogmkwn@ijk62fhpxptb>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
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
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
X-Proofpoint-GUID: 83N4DNsRyPq6q6YOTjt_2fPLU057cA7L
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfXxdkSvikD+uyA
 PEq3uUI6bplRHdINd2XTSN2922x4xqwK4HKuL8/bXEk5OZvZWyBWM4gXLpkiQzn+QBqm8Cidl3Y
 uhVCcLQvE2tafsje9Y1MFz2VODo5Sa8=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad9e115 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=AypnKj6NB4iKfuN-KaAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 83N4DNsRyPq6q6YOTjt_2fPLU057cA7L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX8lVj/OnqPjCG
 M8gULEof/oQBqfihb+ewLJ9/iDOScnSX+lkwWmD43fakX+vDe5/ZLFkU3wVNG/KfMlGznEhYXsU
 1GFXTVWlXjwnIwBN4hMpwWFqeaJeKH0GKgIi6e7v+xa0l+4R5bzHWF1rwr/+dbOyDvyyt4WtzMB
 7Zrco5kACeNFlH4/7CgdcPVhKjlAIr02DrgTGb5AUfBgEjFS3hEUrbkFCuYnKAoSrsI2dDRALuu
 cgNKqtzjci3RExN91A60iOAXw02UXBVQJk4TbZm3NsqGpf9SPziNBRepZ820CHc8Yl8WQQGlAA9
 7zc6FNVH3sz0kC9w5+IK6IkJZn9PXbwPWIn/itSDcQtCysypSZLOvJfOKmWDwNzI7aM+WSPeus3
 C6LAc0sohX2aZp0v30LoyNPj6uidcZE/PrxB3M9AQ1JwOGrEz20/qbRNXDXfqS46oVFTOm7fwdi
 ujEsBORGC9gKeTvdXjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220040

On Sat, Sep 26, 2026 at 12:04:03PM +0530, Vikash Garodia wrote:
> Reserving an IOVA address using "iommu-addresses" requires it to be
> placed in the reserved-memory node. But when "iommu-addresses" is the
> only property being described and there is no backing "reg" (i.e. no
> actual reserved system memory), it does not really belong under
> /reserved-memory. A device IOVA range is specific to its own address
> space, and does not describe the system physical memory to make it
> qualify under reserved-memory. Given this, place "iommu-addresses"
> inside reserved-memory only when it is paired with a "reg", otherwise,
> define it within the device own node. It was discussed here:
> https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
> 
> Existing "iommu-addresses" property expects a phandle, which does
> not make sense when the property is defined within the device node.
> Introduce a new property, "iommu-ranges", to specify the device
> specific IOVA ranges when there is no backing "reg".
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/iommu/of_iommu.c | 128 ++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 121 insertions(+), 7 deletions(-)
> 
> +
> +	list_for_each_entry_safe(pos, next_range, &ranges, node) {
> +		if (pos->start > next) {
> +			region = iommu_alloc_resv_region(next, pos->start - next, prot,

As pointed out by Sashiko, this can overflow on 32-bit LPAE platforms.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

As a note, we'd need this patch for the upcoming Qualcomm DCP display
driver (posted a week ago).

-- 
With best wishes
Dmitry
