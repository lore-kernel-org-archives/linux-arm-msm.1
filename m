Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457B9472F78
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 10:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541251; cv=none; b=ElStZhn/zWtTB58FCQ9WFh4nH7jGnkzzlSKsFmQvWrt8rZ+5bPcVrgm9wVHJ5bkn8epPGWFFsUoLZFpFY/X531URk9UlrEPHDEBWxY56tSTdQOWv6aKY2GoDhmVfBp0GnGSaM2o6Vxv3z6KuJLs6gqZ/06hevozNYVw0Z+AKdF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541251; c=relaxed/simple;
	bh=GQnpL1wzKHxO/QeOKLPZKEO8BbalR1e/acTMvQgw5z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sSk8OFbodvhPZpukHX3Vpc91M9UcqDzIg8Xz8ggqtDyNqtrLs3ekWVfri0ZRxmgWawHuExIwNvnCrGPlEXgN48iyMo6uS76oh8k2CkgMwK5c1UKAe+FNM8jmg+NdKbqgeya4t2+it5drcQbM2FjSv0yiG9ytktVj2SVHNoC6igc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QZdxj3zv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CaIJ2VmF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QZdxj3zv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CaIJ2VmF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KFBn1625861
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 10:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gwj9DlboKAnnxG5g7o8KWSRp+dHWnkDcSHLJmL3TOO8=; b=QZdxj3zviA1MoeqX
	vnnU5+AUy+L4g9IPHAfK44SGhgoUqvvHxjabZI5+xG7jK1VZ0gCzFaGpFbOPlO9F
	7vV3jCapXw0YoSNdV1784PukmlqQiA88PfxpreSoniFagM9tgOmswlCGgXmOOaVs
	Wt8g5nQeJq49k0x1mDBXEGW+XM1FrkHcyCN3kFLUVA7Pcfl1mqCk7XNjTTXfSFPn
	xeTMAg0L9IVYCfTYzyqr12K1WaPcuYV5JswsM4VLEx8yK+yQiE5m90YmvdcDRxua
	4D4Ui5uit4FMzjEYW294SQFkROA6fozyuEx/rn2pnTLRj/m1XRNXJJeaQ6OMb4tX
	gTHPVA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj32ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 10:20:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aaee1fc104so2953948a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 03:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791541248; x=1792146048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gwj9DlboKAnnxG5g7o8KWSRp+dHWnkDcSHLJmL3TOO8=;
        b=CaIJ2VmFWHf7VHVx81VjSQ54UcQrF0hOhOrxw/F9OZEX3GHmmOTtrTdMUIcXtLxKrk
         68TpsMAbmAbOfOinrQNly3SNY6faY8zxtkPqzDVcSQPCNkrva0GYQkPZL+4FflBUPou+
         5FSWEK46gns9QI7XH1N8esl5F8TqkUyMYvY5rENyeI7G2i5TKM0cWv4VPzlcpgtJH+yr
         XFJ3j1mHKrJm0qaFCU4ouyWpucfZKYKeKBYcmTUrGPL1iv9Uf877nZy57ubMeH/nQaRx
         NghOPxAUGScJiQ4ZM5F6rYuUQ2u3ooSqe3qR2+kX1/GZ2+ln6BxXeGRITmkIbatSAvpd
         h4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791541248; x=1792146048;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gwj9DlboKAnnxG5g7o8KWSRp+dHWnkDcSHLJmL3TOO8=;
        b=Af6iuNNqGKKW9m6U9/KHrWmB4IhIYLAgfgDlzQFnyt/JetUSjIkLJsgmmAtkjb3oLt
         gloxcPIdVFh8rgarN0QxMEf6Aytu3XScSKKuPy1FPd1jyxcxMLgXuzWn82/6SOiii9eA
         kYzcmSEjVdZuWpjuMoVLlQWfYixUEIggOreJiCjKOXY8SZ5uhwseDdo6BhlsY53XH/Yy
         3ltKqu0zvi+unW4WSAH4wcqewiitK+g4OAKbGrbapVOmz/oRBpHWzrHX8LfjgneaGn6l
         BPJv+GIgaYOz4qkT95fXv1HAjNSKyI+N26biK6ShOTeBn1yZxVHLnLtI5aywKEY9xr6H
         GhtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTdyG8+BmdR8HPzVGrDQu6qG4xtFp1hU1CvXbKzqxaBvWpAVB1qchpsEJqxKxB9db4BBCf5hyGlqSMFKfJ@vger.kernel.org
X-Gm-Message-State: AFq9FYI9tJiXCFGTx5cB5Ye0vhvUUk6LNFzlavFRbuM2UEmaqsTboBk0
	6JflOe5R6GTkMbPEqafOQPJmVFgEGI643WFGQbHk/ov4mOGaio4QNU0Mb5Fb5kbozhXUYIHpjLY
	iwkCqzhkkMSGw6WR+w2Mr5YHD+C8FSEvuM6agGg4PnzD1mPeQKF2YvkhyD5bK16Zdmzii
X-Gm-Gg: AYBFou2IcJgmxBAYbhuYulztRx1L6KFrVzlMl/5jc3LhgUvfs+YklU6RZwi6ttclGPV
	jr2Pw3B2pTWLP5tww57moCwNWYrCzJC4Vj3yrYLPQ5me8NBD+krIQSbpE98uBTas2zUhfnnZAsp
	uN4BBMnxyVcTmNzm5QM9n84r4XsMgecUsc5kFSPMhryKq2xIJcUxyS+tmkzAEUrGOfY5XDJi/xA
	Dh5PZ5pn/mQf7ybVCVkPdYXUiuRVvOSUB+Po9hfcxBqEV7spaH1Hu9nTjQArTtsEyAfnD+8ul2R
	DhEb632p2uzjWwrCky7/2bUMNqMDdpQPsWpUXVyRhlOZ1oZgnt3g+3bj00IiOiV72m9uAg2fJ4v
	OlmUMtYAnMq8mchJoxdFKJahXwSMq7efPeIbblfBN
X-Received: by 2002:a17:90b:1847:b0:3a4:f6b0:7de with SMTP id 98e67ed59e1d1-3ab3a90e800mr1364981a91.22.1791541246604;
        Fri, 09 Oct 2026 03:20:46 -0700 (PDT)
X-Received: by 2002:a17:90b:1847:b0:3a4:f6b0:7de with SMTP id 98e67ed59e1d1-3ab3a90e800mr1364937a91.22.1791541246091;
        Fri, 09 Oct 2026 03:20:46 -0700 (PDT)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm1366459a91.2.2026.10.09.03.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 03:20:44 -0700 (PDT)
Message-ID: <7416dc0a-7b4b-4d26-95bb-7f24e54dd6fe@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 15:50:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] phy: qcom-qmp-ufs: Add Glymur support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
 <20261007-glymur_ufs_qcb_enablement-v3-5-84cf4f861415@oss.qualcomm.com>
 <zovl7lrhlleflaewk32o4wofr4bzm2bmkdnakev47peijrnkfe@p3ixrxltdpcm>
 <f9c7bd4a-2e97-43e1-a9bf-295b841ef0a3@oss.qualcomm.com>
 <p76qp5bhijenec2ygj36dd47uxkeyk6kztccbuhblte5lqn22x@yikvkbipjbae>
 <7e8ea792-2336-4252-beed-7345815b0b90@oss.qualcomm.com>
 <unvey6hlz5ov4flgzza7f3i7nowxym5ik3dd7jkzx3yiqt5xqp@ci3z27we45e2>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <unvey6hlz5ov4flgzza7f3i7nowxym5ik3dd7jkzx3yiqt5xqp@ci3z27we45e2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac8c001 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_d3xwxgixdHQDNbgaEMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: XI3ItU6TjKMOOEMwt0Mcz5kJ7kenhnlM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MSBTYWx0ZWRfX8UWay5j+ZhKN
 4SBwgnKnXI0g9UA5PSNWt4O/Kv0UAqyjZmNi74xHMuueI67PE0dpew9X2rBwJ+7NkCHge4lPq5J
 Okhqaxu1OEPxft5cjqARgPYSscE89JrmBEOcarTLtkG7S/UXu9xcpUnHwtTVrNjtCcIe1EMWkzn
 kgNCrCXMl1Cge/K25OlFvUo41FS6TULYHIsPv2kDvWJMe7q2XOa6tySK7Lp9HBcIAu1upwHaHvS
 nTiqG5+dqCj/XFATVwnYMKnYuGjxPXnymFdhqpLx9xWjjGV3gCBO6YBFFQ573EuC1J9x6gZ5KNJ
 LMg9ptIoxQnUdIRuEgeptNoDnc/P0q3tS3ot5PBoE2BtZpROKlyqR8AQx+dbkOVjjZPZm2qGmXa
 5GI+AOusaJ4N0tgsNPJlPNgy7JWOM0LGoCuJBTGx7wLoQefZqWUzzFIDux2QyKrtxmOSlnD+Agj
 Gj2N5O0Kg3syvQBMZbg==
X-Proofpoint-GUID: XI3ItU6TjKMOOEMwt0Mcz5kJ7kenhnlM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MSBTYWx0ZWRfX1+EYUVYJopGh
 QOAGeXplhX/9vSAeU3SVGdE78XrchwovEWm/sshpArtdFz67LQs/7Rj9ige647Aee3yxP+8w1U9
 YlX66sAmhd/rna94FnsQqdlQ4rGF3k0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090041



On 10/7/2026 9:17 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 07, 2026 at 08:15:39PM +0530, Pradeep Pragallapati wrote:
>>
>>
>> On 10/7/2026 7:13 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 07, 2026 at 05:03:02PM +0530, Pradeep Pragallapati wrote:
>>>>
>>>>
>>>> On 10/7/2026 1:18 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, Oct 07, 2026 at 11:59:38AM +0530, Pradeep P V K wrote:
>>>>>> Add the init sequence tables and config for the UFS QMP phy found in
>>>>>> the Glymur SoC.
>>>>>>
>>>>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 99 +++++++++++++++++++++++++++++++++
>>>>>>  1 file changed, 99 insertions(+)
>>>>>>
>>>>>> +	.offsets		= &qmp_ufs_offsets_v6,
>>>>>
>>>>> So, is it a PHY using v6 offsets, but v7 registers inside?
>>>>>
>>>> The QSERDES RX0 register offsets on Glymur SoC are aligned with the v7 register layout offsets.
>>>> Therefore, the v7 QSERDES RX0 register offsets are used for Glymur (similar to SM8750).
>>>
>>> Mention in the commit message, please.
>> sure, i will mention it.> 
>>>>
>>>>>> +	.max_supported_gear	= UFS_HS_G5,
>>>>>> +
>>>>>> +	.vreg_list		= glymur_ufsphy_vreg_l,
>>>>>> +	.num_vregs		= ARRAY_SIZE(glymur_ufsphy_vreg_l),
>>>>>> +	.regs			= ufsphy_v6_regs_layout,
>>>>>
>>>>> v7
>>>
>>> This still holds.
>>>
>> Do you mean changing ufsphy_v6_regs_layout to ufsphy_v7_regs_layout?
>> If so, no. ufsphy_v6_regs_layout contains the PCS register offsets, and the 
>> PCS register offsets on Glymur are aligned with ufsphy_v6_regs_layout, similar to SM8750.
> 
> => commit message, please.
> 
sure, i will update the commit message in my next patch series.
