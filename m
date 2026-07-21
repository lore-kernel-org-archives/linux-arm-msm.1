Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3023643B6EE
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674320; cv=none; b=WMbtHrXRG/iRQgoxMix4FOk7hIJhDHdgb5tJRMFnJqptMpdytu4MZa/AYJvdYmsBA0iei8YkdG4WfK+wXQiftZtSaxZx/jWVpdPie71JI2bLLByUDq+YnzAJ7NVUFoHsaTbRWU2r/PV4Y/qekfcn5w7Rj8HOwYnylyNuXm3wT+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674320; c=relaxed/simple;
	bh=JrOknWscKHKF6jfjYw8SzYe4PSZVjoyP04yqzjfj/AE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrLWe24eUbKglHYKm+XJWtw5cCtMfbKTonW19xqofHpt0m0ha2rg8Dr+Qeb+9TNT37p8tMZKiOjDA7ATfWETIAF9P9txwfgegYzeM8Kp95EhLFeA58uTz9+woZ37lcNGF7Nm6qHD0cHHcK3YtM3qUl1O20MZcF/qr8Oa7u5mk1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MQh34pTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBz4sCE7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MQh34pTK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBz4sCE7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZQtc3027068
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XS7xhh4HCfCvNxpAVUpkGBU6
	MKSoOMCEQaZdxWSYEO0=; b=MQh34pTK8MRFuRZtdTddPb+jXNkA8+u4M4BSQ0Y9
	iOOyv4AoEzc1rO2Sh3HprdK1WcKGFj/ZAbHy0CLewf2fFZX+TYCevx1URsS2xGZd
	VOQqm4s7JeyJ4PDTD/xgRuPNKeEO/fdqTBWmigArdpCzQq1Eh/lb+olIkPVjomX6
	vemmRo7JFBYUxVi9HmdbJa8yCLZBqsl5umtm0mK66NcYK2PyrBsCQEVvxMriE6Lq
	d7M1SDk01QwHzDCY0/WbcNAN+i+lTyZvlV7eDoKAw+bYQwQlxJeNcfOcgvupP9NB
	wFXYpA06m5a9sose5TbTjBFvZ2GmYDbysrNrtwFnmCNFcA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pab8tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:51:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0f0a0760so286195991cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784674316; x=1785279116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XS7xhh4HCfCvNxpAVUpkGBU6MKSoOMCEQaZdxWSYEO0=;
        b=HBz4sCE7/Ml9cDzNL+Ewi57PDfL7Uk2qIDGtthHX3Y2edozlPJglb+brEUil7o1YZz
         Ae3pti8OZgL4EThxcwdzTJLOEj+4b8ORm3yZEOOA0fCs9p5zdPvG29Ml0K8+hsVG8FG3
         Gxm8H5yPhg1VW1fzZ5DaArXV2erZFZnMedWtucK0wby1i1b41vlvKlOLkjezgx2gApLK
         uvGmeUn21/A+r7AeJ4+M6w5EZFoxlfRk8NOi/QMZIvGOSIU46Ife07+rXwd2g4B61Hjd
         L65B2TT8LrBgFzL52rq9VJetRWyFFsqNDj36CQrZKfFyIXpY5H6Wa6ZUFEemcXnbv+ax
         KmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674316; x=1785279116;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XS7xhh4HCfCvNxpAVUpkGBU6MKSoOMCEQaZdxWSYEO0=;
        b=lXl9B4JR1jJIrONttVCjyoaXtTM8wKAfxICuqr0Wg8qw4k2N2yBYvN9a4KCn6ueKUh
         QJHW56F5/JS/h///Eo8dqXxjjstlJYe0YqjbrGlErw4xFD/IoaLwURWpQ8DlrgyC7Bx9
         HzrIjYiYHQBBL0OhCHMZARbDj8RwtqsBzyF4ivS8oCGBWWuiSSbpBWgaX8HmKxClgzQP
         2c1TY1WAbgXXH0aOfSxXlZUVMZLCcFZsX3T//CE9tpCslsL3PvhRTjtqOWUZwvXGwTfl
         DH7GiOobjmyuArauh8jZ1+WlzxgitdKYn2fnB6ebpYu0zYambTbgDieYk01SBV1U37XW
         bWDw==
X-Forwarded-Encrypted: i=1; AHgh+RrA0vSWsNW6M+BcyI0+7PwmK3Gwi1/cWJGEom5IRubslWfA9/ugCrDMouPGMa1du8GDc7AcPfVBXld8J5Qf@vger.kernel.org
X-Gm-Message-State: AOJu0YzqSfgETt4NwT61r/PyAcm5GZyxc5x5p33VDPt4mKLlADW8/WD8
	Udy4Y0CX5EmL8z6GFdHOFv1ZVtOWZReMc7bt1dwJ+ROTgFi/mBjp516OjGTUjOMZWycGRlMBXoG
	uW9JxXxXmC1afPC0RSkeRU+9QrS8OTg79qMj67ThK0fZJFszQbtzp4M+diSmcLapwY/GA
X-Gm-Gg: AfdE7cmbSn7zWCreUiyuH88FEA3YHfdlrI8CNLKfzWuF6CfCx5ZBMBUG7MXMIa9g9iX
	1etCD210qK2ctJt03N4knfFTk4Yb2/3gLQonNsYG2jT22G7zJnDisxelgDEUji5e0cGikFmJ7WW
	cAeawble35jzQCGnt4XQb4fYz3ttwi1pYdohS8HKY962viJ1ZukAZFdMNZRHB9dWVaJ6sthk2+9
	GK/QDX0cluR2h/k6m8n93L7ujyUVVYhZZdB76KnBdJSlWmcGyoYvSR4FZRJsCy7gvgy6ofvNznR
	vuEGWS/WHu8PMuxFD3rW4p1uf4ZUqZV3JVfwjlwbk2bK3DcXvfgQSA7L6x8wrMoNhSZ/EP4dcF6
	ygBROf+o7zTxBNCsAta6vf7+VXrf3UM9EUi32Rn2WZGkN8/aINIZi9VtdEho5+M5xFd/IgJ2Gbf
	jmxiECykO0pbBtbQ==
X-Received: by 2002:a05:622a:22aa:b0:516:e249:e30f with SMTP id d75a77b69052e-5213e876fdbmr202401391cf.42.1784674316318;
        Tue, 21 Jul 2026 15:51:56 -0700 (PDT)
X-Received: by 2002:a05:622a:22aa:b0:516:e249:e30f with SMTP id d75a77b69052e-5213e876fdbmr202401211cf.42.1784674315887;
        Tue, 21 Jul 2026 15:51:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d31c82sm151883e87.41.2026.07.21.15.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:51:53 -0700 (PDT)
Date: Wed, 22 Jul 2026 01:51:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] phy: qcom: qmp-pcie: Add pcs_lane1 offset to V5
 offsets
Message-ID: <vnqbthpnjfgwm3bsp3lysfhugxfljd3cictjmwvn4kuavytvmt@lwkhsuydhamk>
References: <20260715-sm8475-bup-pcie-v2-0-48bd91a19abf@proton.me>
 <20260715-sm8475-bup-pcie-v2-2-48bd91a19abf@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-sm8475-bup-pcie-v2-2-48bd91a19abf@proton.me>
X-Proofpoint-GUID: SBqysdKh6440WqW4G-WQBeZ8aDbOEXqN
X-Proofpoint-ORIG-GUID: SBqysdKh6440WqW4G-WQBeZ8aDbOEXqN
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5ff80d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=cyArV0-BNq6UFoJ5HPsA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzNiBTYWx0ZWRfX7RQwHL5a5i1k
 Ukdlx/MepHRdYc0v+jnyySlF58HDxIllUEAte8OHjjbtQeOsmFe0LdhDeG0teLNl8ULzXgkTKgh
 Ifckeyzhp72DAgrPYde9y1gsJ98N880n+cA0EnVYrmvgd6AXdR4+xTjj+W8jNUJbcEFV+RYnor3
 +zIQ0hl2xvRWFoyW7lar2HVGJ+h8mG/dhMxpnnko8RSDoq6tfLZvXj3qANwvCJJd5jaG1Y1gAEq
 MmKqnekQtkXEt0hKgzvWj9EGqYbZdGIEUBe1l5dG1vwXcTRtPFs0wJuDIesc9kgYqT2aCxtBhdh
 UgzFjm5/DwKw4l2JOZaI+CWZQueNbh452dga+Cz/c4WXtc3K7mAj8Ut6sxkbXulV+6ltteFvL5r
 ro4DkTsVvw/zEqP8WgCv48dPO9bQI5L60k6Hp+ehFGiMR/2JNL3hj2sf8Scd3Q6I9mRoi6FMYfA
 O+d+QYm5HMXPLSMT1Yg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzNiBTYWx0ZWRfXxSsuE8zJ1Mjz
 ykMApuzGSHbKO35nnzQSglOJeSvW3Pqz5pRZtNJAHOrAw/fC/AmiENxnonzHj0PXdIOkrFjJBmV
 zmfChSkQqrM3/MXi1LmEYkYg7UPIHsE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210236

On Wed, Jul 15, 2026 at 02:37:47AM -0400, Esteban Urrutia wrote:
> Some SoCs such as SM8475 write data to registers using this offset,
> specifically SW_CTRL2 and MX_CTRL2.
> Add pcs_lane1 offset to V5 offsets to support this.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Fixes: 0fd0b31965b0 ("phy: qualcomm: qmp-pcie: add support for SAR2130P")


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
