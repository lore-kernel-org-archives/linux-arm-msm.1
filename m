Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3E926A0A7
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789346609; cv=none; b=pVaa1bkxEHA6WQvym6Fcvb8cqziwhlURmEWzmv8viJTS6iIObhSW2V9ypAL3WeWjKy7iJWQk49jQPABgP7zEs91jpOS5Jiyt9F0XZOBCWNGfCem7jlCPMSxzg8O5nqqwh5J/vycIvdFlRbR2lLPiMQT67CARbn+MMWjRjJKPpk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789346609; c=relaxed/simple;
	bh=g4Sb+4EO6utuPttACpx7esnqjC4tL1wK9PbH7KgaxpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LlpqujRDgFV1/ylDdc65SxaVJZLIV0t9oUfIyQr/Qm7m5S7g1vmd2zJ6EtAKFcoEZagAPDkYSfCL+IcDJxJNkoe/eWCz2ntCGbioFiw5zQn260rq2jqXj2xKWPfBfKpTnPmUtgzeKocRQCHDzgPqldXiFxlakHVLjEt4LzITr+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bgQfIVCC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FoduFFMb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bgQfIVCC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FoduFFMb"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E06jil4022587
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lj9pFcVapk0XSSP7vk2Ibgx2
	B2uTAyJseO6HX7OHZTQ=; b=bgQfIVCCMV3iD6UZqTIHicnGFEy/PC9xmmStr4hW
	iyC32DhH9LgnCniqdkSEuCp+18iX2NujkqzB1cYtn95L8LVUk38FeprgNUjoEObo
	F1txYgUXb12oxATaUNxoV7SsKqhQbgyAqLs1qnT1eg2kzJEIYOFCvXccLkNm/YRd
	aC3vPCNpJiZbmz1REOfDqdv6wJ42UIKuVkkfm7QFOBiWNYEJThgAh3RD3xHMQdzC
	6Bbuf/rwqlQTj5DOZn+sS4Bt1FFCprFi7kiLdLEx0DvAjUEGldr9FSevg0hvgOpa
	ceQrTpifSKXCoMijz+EzO9JZOtJZtsFbE/l5hG2JPdZYmw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k089vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:43:25 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97cb32961e3so2001816241.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 17:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789346605; x=1789951405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lj9pFcVapk0XSSP7vk2Ibgx2B2uTAyJseO6HX7OHZTQ=;
        b=FoduFFMb4QvrYTNj3PWf/z6Ap4i/xSOfgjqFI2OM0T6wREgJ8V2SrrRVqo43GfE0T6
         JESM2OW3Gbc9Hzvd6/LJKrXX9L/rQBYWG6n55UdLGkMDYoo3SVbJaVAUMCBEnZP3VvFS
         UeAbPciVsZxkjQX73n3GqxuWFZX3aBm4VDqrCnOgtpjWUrqoA4nP4r7SRperejKEB6or
         B3RVYHtomKjQZAn49Z8Eq62I8/Aes5QfMBB5R+p73wWDCBqeIbAr/LILl/5PtJYe5U6W
         FwGVd2aQ50YghJ1IaZZiOa9byjL2zmG/YENAt7Cu/aU6ArsZmW2GQwuBQP3AbHB/i2to
         JErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789346605; x=1789951405;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lj9pFcVapk0XSSP7vk2Ibgx2B2uTAyJseO6HX7OHZTQ=;
        b=FMthsraZHGn+l6lGdtYAV9OX/UaBiJHQ8OYiTnwGP0LBlX66rOxtbXjndms2fs5FMg
         WyuZVT7uEwdAhgq8tVHjlha2Lw/gTwQYX5wEZoJZUWiGQj1sN9lPNMV83XYkm79ZLn5A
         /wcBnOC+DNZjyDqkd+JkRiBrGNR9q8Ez+gFW2x92mB5wHPIol4ELo6wlM03DweRDO45+
         fVihQgzGduBAebSgEnSO9Tr1h5gaU8WuTYEHauzRdS1gHSMzRyBGolW5Dos202A5FjkR
         samtnbrzfSbVv+NCOzFLkuZwMJwaBr8uCmZfLJwneKsAT0AWvIumkMYsANgdjerjqZaS
         vZgQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3xt4IDt9oqZ0OEzhtHm6Em3hKuKxrc9/xOJydhNpNsKgIwOzlfq7U6IGde7KFjykTj4JdiRYKC9SmZPM7@vger.kernel.org
X-Gm-Message-State: AFuF++lxTTyxYIdpCNEiCw9NAcY5lgoSKudteBl4w0OrIO/mKnO2SoYm
	CBue0D5mATWhlIE4XoiMykquj/XS4HU8mYnvHDTXdISSiDE4jsO6MkLETJfZ0IUCJ6Mx7mOX+3e
	yqNWz610xKKRKU/tKEDcwOHXkespGgMFUQBbi0Lrr8BmI4cAFL2ieGmZckZ3AmKWxWBnx
X-Gm-Gg: AYBFou22vIiHF+gbDQ66DCkl994ytgL/zB41oje6kqEhkfUzzz/GjY3axt4B5VZUFPx
	1Yj/sKBzl24INTD/e97knSOIRvieM13ht9W84+JphzrlY0NERLhlPx65II8Osylc0yYrzATxUDc
	4EhCvbFb+dc9WHiiUIxMlTQN8j/Xb53ZGk3UKqOLnkzMu/P4yunZAQhnHsT1cY7Oengeb430gtG
	fHr7FhhHZ1lg/qm1qmlIjvMm4hcq/esfA1S6nRG9bv9yoIuZUpvPGl1YjXfk4+f1S4JGxVxK4PA
	QtvEhHg8olLh8T6YYyIsmS/5h+nfJ8fZuqC7XUn4tXPnAMOqmuIsaP4fgsK7ScuUqo2ia+zmkk8
	NfYPqMLc+17GEWEeaB8iB3QeoFU9FlE5vVUtemwIjV31gf0Te3SFdh4t+lPaDdaKIKVXoRdWm7k
	Lb3JXvc4VbTkDu
X-Received: by 2002:a05:6102:a48:b0:79a:1d27:a8ac with SMTP id ada2fe7eead31-79b5878ad50mr144546137.5.1789346604713;
        Sun, 13 Sep 2026 17:43:24 -0700 (PDT)
X-Received: by 2002:a05:6102:a48:b0:79a:1d27:a8ac with SMTP id ada2fe7eead31-79b5878ad50mr144521137.5.1789346604268;
        Sun, 13 Sep 2026 17:43:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3303fc9sm23868501fa.6.2026.09.13.17.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:43:23 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:43:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v4 2/7] drm/msm/hdmi: Handle msm_hdmi_power_on() errors
 during .atomic_pre_enable()
Message-ID: <udst66v6mxlbugyqehsrluvf3nvuw34plt7fzj75wwzrwgev6m@wzyiuexzeu4o>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-2-87bdb9f1987f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-2-87bdb9f1987f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAwNiBTYWx0ZWRfXwfkMhDNWKjXe
 Hkqw7Dg4ffLHCignS4SogBfqlTTtdty4SdN7+G70aPyvflwgOTwvcgNgmAmjy6njtGuTpe6lr+m
 zgFNjjW2csoXDTJqqlf9v/mz5VmRG7Y=
X-Proofpoint-GUID: 6_ZVqj2MZnqnZYHG4fpkOL3tG-iX1ecE
X-Proofpoint-ORIG-GUID: 6_ZVqj2MZnqnZYHG4fpkOL3tG-iX1ecE
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7432d cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=yaZh0le1K7A__2Wy8xAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAwNiBTYWx0ZWRfX9/T+bsGyAP9k
 GckkDZg3zmk0lvnbdM00+oMRckAU8I8P7sf6PzFAfr7Mk77Ec6qUxvMp6WT+DNSC8sA/qXbCBHN
 j7CusG0VvmY8WaDitm+3n0LtgHobov8LzHTerUdikxOjJ6DWK0Nx6ezrVS4rucVHxuNmqwJh2B9
 4LVp8TV/Fjo6xmQcY5KEnWKPSqKHAkAKVEpbeHoHIrrPhCmthWvDJYYnN5kWeKAfytCkCG3RwnT
 21FtPD0AnC/GVUaiaRDdVE5fQ3bgJvBLzX7gWNzJ8HLyD8V7NaHI+bKVghH4W0lNpvQrrEcNHjB
 KbPiU4x+OK4Ma44y1ZWDxJdjFRaJq/vxnnTSgumKZQyMLB06JRmx5GeXg2EJlrzxao5sbD6FmcP
 ISrfIFNrdk8mIv4E15BBA1nJOHmYa6Z4BL5KYPRo26VwS2PauD/6PtGBUk4kB9Y08cXkmtIs2SD
 zQH4gq6Xx2dDLpcazKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140006

On Fri, Sep 11, 2026 at 12:29:35PM +0200, Krzysztof Kozlowski wrote:
> Properly handle power up failures during .atomic_pre_enable() by
> aborting the .atomic_pre_enable() to avoid accessing registers why
> blocks did not bring up.  Otherwise this could lead to imprecise aborts
> when accessing MMIO while entire power domain is off.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: ba3d7bf3a7ab ("drm/msm/hdmi: Convert PHY files according to new design")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 30 +++++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
