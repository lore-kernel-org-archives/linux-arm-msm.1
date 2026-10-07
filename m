Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19CF3FAE19
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 06:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355126; cv=none; b=qpqBdsg0HmDNrsBjbn8KshoYIXNn0zIm1+ojag/B47DLGqFzlw9orA3SsPNkCLL6HUZjAs1Vql/gTcU7d4011TxpZc0neGpryNtxjFXmluCDoyt9sQEckESJzQmEVEtCNZZPYMpWvipfuWJsLpC/tulJtGdnmFmQd4bSsn7EAg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355126; c=relaxed/simple;
	bh=c7j8dGPAmYWQCRkZw9yq1rfqouGuMmkVMm3m0n4Jm90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JzyoCG9NP9CQEzm8Kvzajax9u+1qyptOqCPziwkcJYdEjuGRWdS0ZVx+3Q/UV1qX4GlJWI6EjRf/DgPt9fbtA5Y7H1fxjnzjkubO6SbNM6g3Lu0l3eje4ocutz5RbYPPqCPbBRTMk1m8Xas+nMcNshmh3MbErOBF5RByTFPKPIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A+fkf6Zw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A+PY/oI4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A+fkf6Zw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+PY/oI4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6976V0UO3649248
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 06:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ACzqyHWtdt0fC2Pj9BbXxAGnwUR8TgCimh4uH8dmHU=; b=A+fkf6ZwKdcZqsQB
	R5sqmyDRCWMhhL6Kk5TJNPUsv4X4Muz9ttlYFFzsmQYceKrnW9DoTjwS54/XrXiV
	QhZdm8GYApm29GXjrRnLMZWd/ucrRMZONkWbdiscyaKKb0cbxCpzq1DqnqcZALge
	rL+kw+9gITbWt6EtG8soeH0khhOWMwH5gPAPGLV++oQtZuK0RuBW6vpOA0gvG5wA
	154KDLYhvLuZzw1jy5kSDXDh7DP6GkZSi9MPmePE38IBbDCJRVws+Sr2gEN3DLde
	cztO4G/h3L9aXRrrhhSG9tX1NIRWS1xAyWFwHadAQ3gkEMdtqy7ERtbknCXvsXxz
	omi3QQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5gvrr0wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 06:38:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e5dcd82b26so13625045ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 23:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791355123; x=1791959923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ACzqyHWtdt0fC2Pj9BbXxAGnwUR8TgCimh4uH8dmHU=;
        b=A+PY/oI49jlleZlAVkpFgpSk3fW0gowOv0OEvdB5vY7pvwSFL2UYVQhOuH1WNSAJzT
         Ty/YMmkWgKYlm4J7KK60u1DSuymOPeVc6k6A0gVuBEqCALHmGx2QVb/kyKzmOmCCLKpF
         P1WOl6cxt5y1nduRv6FZYj6kN4tESgW0NMXFL6aowhMe6XTGEOPyhUfgK4opd28we9QD
         dPl7T+bK6q2h6yGx6d0tDcGPagL149+3GjVuQiRlBAY9PipDu2ttQYTemhJhTr3qyOHz
         uqcKAap2LEXPtuE2gsnwOIqpKKnL/x2ANKlNYjY6VBNOykcm6B3UcR5fpKW1tKSew8B7
         QTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791355123; x=1791959923;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ACzqyHWtdt0fC2Pj9BbXxAGnwUR8TgCimh4uH8dmHU=;
        b=dXulgENw4Pgf4iPUehAXZpIN2f3dVZqWYQP+z0OaO5T90xGcBcnJ4GXorgbnPOwFIE
         CteaPYCPeQoaiot/UksRmiwYk3DmiKjWlEmHQgl+kt2ejagFNhF+vPjEtyNSXrZzJchO
         x/uaSXWBTA6VQiPDqK+MJfSR1gmdOjXYbBBQ0lGmjkpQ/meR7zYr1biCrK+ksxIg+4l3
         8Y47nxIQDewDN+k5IoQie4CfAnFjDJuHVt6YtcDIGivZ+mZ5FrJtJWpI1Xlcr0tfnYAU
         +cRf37AokC7hUYIRFRmsjidFHXJkJkJoRseeKh1n53eruV+mkTU3xq7sH3i85AiEzyfV
         3Jgw==
X-Forwarded-Encrypted: i=1; AKwUvBz/FY8N+MirbaK2OtaDFm6QoWkbhCrh4FosOf0kWCBgmK6oseZf3w3O+kUybFyKVT/IIuv7dzU2EXvdjFGZ@vger.kernel.org
X-Gm-Message-State: AFq9FYIBvQBgfXDjcfcKlwrrRYiZ8FD9MboljRf5t0aTj7rAhRcixWui
	J8JfC6VJmcwITbcueImVeHK2z51mInpj8JnB9ctSsCiFGc2EHhsk07tSL/sZJ/pMymkyJeGohAz
	REkg3Anvq9U/aUq+X7tPJVulU41s+gmGD1h+J4Up8gLf9WvrHfo5MRK521V3tH53cvzeT
X-Gm-Gg: AYBFou18WLN4PhGAPNm3nOYn3yCZXm2o2Rtwrst2QouAm1h8uPwKSF+iCtNRj2edOmp
	XNWjhIDFW/Xfve5LW2sFB1ukoq+kBdFpcLiqdAWy1pb/BzfXM0udtxcXEJY4gHbwcivBLv2kURH
	hr9Upb8UKVXLNt7wjjBXgmte9q644dxjsr6QkgP1+GEW5YLVR0TXY0peOt8tuCRFqesppgNseyV
	QRhtLfJmYbbQ+6uBpSHAIadzdgGK9/18eBSoCt6cSdO8Wwj0AjjaUHd8A51EWpUNwGd2Cx/FFsh
	3kXg0eWw/I+aElIu0GEqMqZ+kcH+6PFhSzxWPhks8KUyOM6mWXXoz+EBLIjQCsAwqi1QHc8uc1j
	8ktKRAoglCYgJM96mw1Rg33kwCxA9
X-Received: by 2002:a17:903:184b:b0:2df:a608:27d5 with SMTP id d9443c01a7336-2e6003b5d8cmr13570845ad.12.1791355123185;
        Tue, 06 Oct 2026 23:38:43 -0700 (PDT)
X-Received: by 2002:a17:903:184b:b0:2df:a608:27d5 with SMTP id d9443c01a7336-2e6003b5d8cmr13570745ad.12.1791355122781;
        Tue, 06 Oct 2026 23:38:42 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fdbcasm5501515ad.13.2026.10.06.23.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 23:38:42 -0700 (PDT)
Message-ID: <8e7ac84c-5ac0-4e62-9aff-f1151eda5def@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:08:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/17] phy: qcom: edp: Add Nord AUX channel and VCO
 divider configuration tables
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar
 <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-9-e25c073cf1b6@oss.qualcomm.com>
 <clxbpw3awcpispcixwrvwj7hocvoag6fhhp7d4azamxghk5x5o@ar3infqpcy56>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <clxbpw3awcpispcixwrvwj7hocvoag6fhhp7d4azamxghk5x5o@ar3infqpcy56>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W66txhWk c=1 sm=1 tr=0 ts=6ac5e8f4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=jUuSjYW6OROygl6o7qcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: CeY8178VyZc0SGQFv_P7MJQMtVp2fP61
X-Proofpoint-GUID: CeY8178VyZc0SGQFv_P7MJQMtVp2fP61
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyNiBTYWx0ZWRfX2gLpJ5Nen4VQ
 oFjkEXcJ/H0pkfC+S3T63996F/ZK8f3CcGiHiK8QIVMSjFrG7ZSAS5ecwPjGNKOrdqqu3ntDYLx
 wWv8iWAhh+t6qKbguzCdi11ldHH1Z1lM1mVRIWgkywvP+5cuM/p9+rDfmeb5Bkf47+Qd8uS3vwS
 3IjzDdO/C0s31OAbC5GNz9HovuHyajwQE7c53y3/N88SOUeI3Tt7LWC+/REg229mmuVuIVgn/a1
 fIbbZ3y+oSLLdL53QJDctZoEcBQaXfuGxVrJxLxkkyyCXeXMsC070MBj7x9Pgy5A4ENUXj96uPM
 PFIzqmHFqIpvBmO8iBHsug/yWPnfp3qzr2RuPgENjsRKTqQ7Z2ZO39Z9tmVrlxsAKONgN45UPpX
 rjnXCVYfEzHoNEzQ3iHGYDpIpl+Z2Zf1PojHrNTqobP/5AVCSRwjjBTtrzZGOMkjD4RjpRJfCT8
 qvDZrYhTK4xjuRfFkEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyNiBTYWx0ZWRfX0AO7DqJiCRBQ
 qyQutMGKVXKNGLc6ricnBviBy8xkSFQmjXsCCU1MN1qQBg2gyOwwK+OZ88twLeD2BRsGDd25nrB
 /lrgsklcbhA04usqDYSAUUd5WvfGuME=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070026


On 9/14/2026 5:33 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 11, 2026 at 09:06:40PM +0530, Nabige Aala wrote:
>> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>>
>> Nord requires different AUX channel and VCO divider settings compared
>> to existing SoCs.  Add edp_phy_aux_cfg_nord and edp_phy_vco_div_cfg_nord
>> with values sourced from HPG Tables 2-1-a and 2-1-b respectively.
>>
>> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-edp.c | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
>> index 373f13b3d6d5..ee0d7f1a90fe 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
>> @@ -1508,6 +1508,25 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>>   	return PTR_ERR_OR_ZERO(phy_provider);
>>   }
>>   
>> +/*
>> + * nord AUX config (eDP mode).
>> + * From HPG Table 2-1-a: edp_phy_aux_bist.csv
>> + * Index:  0     1     2     3     4     5     6     7     8     9    10    11    12
> Drop useless comments.
Ack
>
>> + */
>> +static const u8 edp_phy_aux_cfg_nord[DP_AUX_CFG_SIZE] = {
>> +	0x00, 0x13, 0xa4, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03, 0x02, 0x02, 0x04,
> So, it's the same as edp_phy_aux_cfg_v5, except for the last register?

Yes, it is same as edp_phy_aux_cfg_v5 except for the last register.

you want to use the "edp_phy_aux_cfg_v5" for nord also?

>
>> +};
>> +
>> +/*
>> + * nord VCO_DIV config for eDP mode.
>> + * From HPG Table 2-1-b AUX Clock Settings (eDP mode) - Nominal/Turbo column.
>> + * Indices: [0]=1620, [1]=2700, [2]=5400, [3]=8100
> :-(
>
> If it's AI, fix the AI prompt, please.

Sorry about that, that's on me. The AI-generated comments are a bit 
excessive here. I will trim them down from all over the patch series.

Thanks,

Nabige

>
>> + */
>> +static const u8 edp_phy_vco_div_cfg_nord[4] = {
>> +	0x00, 0x00, 0x02, 0x01,
>> +};
>> +
>> +
>>   static const struct of_device_id qcom_edp_phy_match_table[] = {
>>   	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
>>   	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
>>
>> -- 
>> 2.34.1
>>
