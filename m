Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C7149E5DE
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969570; cv=none; b=PNZIKc9gstTEbGXNb9hhXeLgiGRH+cOkT6KqhTX4091mwvwNLCl3fT3ovdmYoLq+I5oh7rlbhvXecAma3LWAyzU0A9X1g0yUr8oTLnBVv1SvtQ+KtmwEujZPgtMEIaPqFNllPZwR+V0H9lvGgZiiccjLVy1AFhZ2v3gyoB7kbFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969570; c=relaxed/simple;
	bh=oJvnW7Wg7eWAZidHc8oetePb42bO8D1vvZLFpH7Hvn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YxbbaiZTu9uJiFwsbXzKpN+RxcSvXOsnZyPiNiKVyja3UcBHYWyrEO1QgJXbetFALs1Rzj9UkOVH4bh0rPG5VzzDkIyyPKSiqF2L00dnXFj1Afj0D91Y75HVq0S5/XaJDqdihiJR3oRK+upRl3VmIc0Y3GQsveCEmGn+8jQjoXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RZSQxUg8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgvhKJ81; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RZSQxUg8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgvhKJ81"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E6Nvo03103922
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I9vbNOPgSoW2/s5EmJhhLhQxF1+z/I0nBNc1/Lx6mzA=; b=RZSQxUg8DMWENbz8
	/2tgFMNww2z5LvmzbTrkdYN9ICez/UgIJRwOx/TMVyQvFAjY3qR4Y8Mm9dNGlfat
	A1064UEzfyNvw8PSF2d9hDrnNn23L1YXP7hFAL8Kh5SBc1Sv4q6y6ZPI7mwFxNjH
	m9UsN7zh2CIHVNo5eTvRL7oQAb1E6+3vtAu1tYOdi0E0OuRHHJkvnJ1z1dsZcFFN
	8xHSTAl2DVJwQIxTfEr5veeA6ukArm2e6oXEA3lN/FGyhaIJz0wyAsmrT9TWTZ4y
	yXdXPTtfHdXenKcYL9+rAuaODX1Ac9FAgS8NseC9haHxLCURnbGlLwg3xy9sP1XN
	9opTeg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9wgt271u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:19:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d001671a54so57422455ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 02:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791969566; x=1792574366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I9vbNOPgSoW2/s5EmJhhLhQxF1+z/I0nBNc1/Lx6mzA=;
        b=IgvhKJ81Q49Rzo/PFEaDwqzXOkq1gH5IJnKHIGp4DQM4WK7DlbJC4DtdDtjZ2WsRal
         Tl6GHq/VIGMC1VLtTpTKS8sc3YmuqwDGDf/dO+cKkICmR3VM4KQsc6UHWReTH0k+NLRA
         dwJsb4G6K13pwSVn4KNTSwMDgcCcTz1MZmC6Y08eaC79woup+oV9s+q2ecw/xlvNbnVH
         iT1/ngzADQtI1oA5T/HQO+Khv0m0uw9GIIac1ipqNzBKwM2hqCd4onTjKOfqRA32BqKF
         HxV+e65z/N348DaYeFiKwg1gP23iSutHGBZ4cDwUVWgM/gJ4mgfp5Bh40U7clW4VeNod
         64FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969566; x=1792574366;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I9vbNOPgSoW2/s5EmJhhLhQxF1+z/I0nBNc1/Lx6mzA=;
        b=GYEFjhMaituBEBOXibCK+UwyDHHP0mhPwrbZRsbLgNLDN0AnKh4x5SgcJG3Mt4sVDk
         KtmCNLBqSXvm/OzHeIA2p79FQwZACdc6xgqCYbeeX9ZWZQ5vG2AbhhCQRwdK/EaMkedT
         54qlzVxBKze3vlCI745cKcHp+q4gtSCso42E63bIsWaT4slgAWq9mHAJyhQuSXi2b5Ef
         ltHgLscrwikjPbmxWht1cDEMambV63yhfVGI8MtkoVZ60Oci3+ihD9IBSCOsAaPC1MDY
         248/o56K0wm+yTe+cIvxMZ2tNbCaTSEc5FULVmwxuzdtelCZ32HO1L/I/pKqml7Uviyp
         8iBQ==
X-Forwarded-Encrypted: i=1; AKwUvBybAoUBainL/BNIEuxuCs6jCxRNTumkKrq9iMDTYLj/u6nNin7dtFCsANtvzqF5D4xWqbBHJuRYgGX1qSQD@vger.kernel.org
X-Gm-Message-State: AFq9FYLcOP2QY0BlpotKmTQq2Dcp/kfCrduoSVaEPRoV0M/eeCm3X3hv
	nMkC+QS4iU2idwNc5dxVpsQcQ/TeYuXCN/QO7uq2Uh1Hxp153xRcM5O+hTOjenLIdDvkUGWlFGR
	UGJ6wG9erZBCtygaHos15Cp17LhlzyVPmbDLFjJJwhrr2lOns6B0rU03MS9Wt356dJpT+
X-Gm-Gg: AYBFou0WLXB8N8EPcoSWqcIWhuKo6oz+RLqBKvchOMM2lmbLetye1ixCV4N9DtmB6jZ
	+2bystX1K5Zl6zgh+SzQYANxcFGOXLcThq5ufTDjSZ+7NNc16dy+05ePOZMZ+65BpgaOxd9OfBa
	VoD+Jc5B5ESeaeBEKu0thTFFm44PqycTOli2tBAikOn1poKC3elI31KYV5OwGwzFWTasYdxzqk0
	3X0OlKpvhrXsHxzjiVfTVBAyENdEyFhVpQ+nQIJyk6hTjTuS+RABfyaP7ZdO30jYl3TAn67VQrv
	7tCd8cCfR74cmtRCYDC4EAVKm+2iAuH3RgPA2mFUswWcXmO58kYduwv2fbImDj7vuH+wLTyQPzD
	nQSTKXxvXiKvoVjzQoBQVxdhNGerF
X-Received: by 2002:a17:902:cec2:b0:2e8:2f95:764d with SMTP id d9443c01a7336-2e842dfd299mr134805175ad.59.1791969566310;
        Wed, 14 Oct 2026 02:19:26 -0700 (PDT)
X-Received: by 2002:a17:902:cec2:b0:2e8:2f95:764d with SMTP id d9443c01a7336-2e842dfd299mr134804985ad.59.1791969565791;
        Wed, 14 Oct 2026 02:19:25 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8202sm64057305ad.51.2026.10.14.02.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:19:25 -0700 (PDT)
Message-ID: <76ad74bd-e742-428b-b206-9db6cc98f10d@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:49:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] drm/msm/dp: Add support for DP controllers on
 Nord
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar
 <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-6-a2ab9af954d2@oss.qualcomm.com>
 <gmsyzeugteg67h5vwzf2y2e7k56eg6aicbonzjl72etgedd5oe@vlizd2npwtn6>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <gmsyzeugteg67h5vwzf2y2e7k56eg6aicbonzjl72etgedd5oe@vlizd2npwtn6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX54lEbURELNxZ
 WOCqbiKSy+3Yurhk9TtPeTDhZ1L4WO7F2DslD8oP+AG0d1kmTzwv+r3yEGx7+Frp/57AeK71kcD
 fllxhf+P+XjNr7pnK/R+t/0tEyv0kdmstSdSJhbpWRdxvrlb3VYv10dvPhWK9hqswBUa1M6jMuz
 M9ZB80j4qe1qw0YPl3D78mAKB+K2rkD1qlQUqFWhqzsKi5ojiO1NaFI+7DdEDAkL/watQBX84JA
 wSOC82zFCMRQmU/obSizljGeofdFZIYiaGGHaahJHlgrIBR7tZsUqw1+fsCNAgUpKokVgNo5Kaw
 s82D8cHSo1qabfBae5Jvk4Q1ZSGZxVmphMEDILzb80tVN8fsvWl+OubWQWV284lIj/ziKRvPwm/
 Ce/3GztN2zFYJcP9gqYcR9hTdpp1RsG8/tmutSD2it7OGifE9B/zSv59Ec4sCc2FPRF+yhL9+J1
 ZH2SHifoJT593YESLsA==
X-Authority-Analysis: v=2.4 cv=Jp1kP84C c=1 sm=1 tr=0 ts=6acf491f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9x1Nq3F55a8nTBbgZHMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 0dDFzsWfaQm_2Pp6LI4hiIL7BStTxewl
X-Proofpoint-ORIG-GUID: 0dDFzsWfaQm_2Pp6LI4hiIL7BStTxewl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX25S0FXe6GAjj
 hj7ZEQIsNcVdS+oH1PwHdKPxt/jPHynn4PAbi+7QNgrj0p3qx3VfZPgUkiTBkL9ym7npuwqeT4j
 Cem2RP6VR3rgSpgSvRCcDF+DV8F9Q58=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140036


On 10/13/2026 2:48 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 12, 2026 at 07:02:16PM +0530, Nabige Aala wrote:
>> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>
>> Add the Nord DP desc and compatible. Nord is supporting the
>> four DP cotnrollers, two per MDSS instance.
>>
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
> Why are they not a part of the existing entries? Is it a newer core?
Nord has two MDSS instances, each with two DP controllers. The first 
pair (0x0af54000, 0x0af5c000) is MDSS0 and the second pair (0x08d54000, 
0x08d5c000) is MDSS1 at a different base. No existing table covers this 
combination, So I added a new desc entry for Nord.
>
