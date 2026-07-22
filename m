Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F17366816
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717981; cv=none; b=bHSElaQjes28iNZQL6jR0VkTo/ApMGiJgv7IZ34MCdaH28ZKbQwjD5poUcoB4vyMZkACNv+FbQnUk4DSNISAUysvJuQZk4M3SAs+b+v5od1RRdMzu1nEdv5BsTT6r3yuVzj57Kk9CiCeihmfx/J+1pRh3+t4IsRQm4omvEG2yuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717981; c=relaxed/simple;
	bh=TlGOa7Q4JnZWRpem8FybOSI0XTsAWwND+/pRfgVDTHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hgsnU3mTMzGYVgIT7uM2BbxtA/ZeVVrdLPVMaPbCD3gC8rrxbSiBWPIXE5BXcEVwxNmpe2wo+rbp6AnDTsHVLpXu8g3IHPzj0MDqhhAKeCQ5bwDRtu2Ij3GIBk3i46H3YH1wgb1ShVqVIp5JSk6tIL1KFZtrBt6ZEnEuTpVPGAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lSsq1pLE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zc/aRq8U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSsq1pLE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zc/aRq8U"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xdEV123835
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6NLD5QZZ8/I4Gf7f08HT3hDB1lW6nFAOR1yB7m8BKXE=; b=lSsq1pLEodEksU4Z
	w1qorF4Kr9l0Fb5xhfsH5Jtmmoh4ftLrU2OvnmPqGGd+4CwSHJh0K7Wkfm2TZ6B1
	E+AIK82r/PW7Q5FWizV6Yxhq4CP1bCFFpDNiGPDuf1sbB768zdvgroaHqQQrKCmM
	xg4WUOVoq4f+wkN8TqVaIQ9vAkzuELjAcQQTeXWsxOriJrpht9F1nZW+QR/fa0qa
	Oy8HRurwbLnRHG6hkKvzBh6Qw5Kz1KhvnzBYBBMaBF4bUwYVyMkHkSZcDG03SAjS
	7eh2P0x/zNU923fjjnGkuxpw1Pmz91OVJ0clwR/Gg39tjV5c6mRtXqjnKnZjhx/K
	fmLNjQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4sr49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:59:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f1e4e0eac1so227155676d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 03:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717979; x=1785322779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6NLD5QZZ8/I4Gf7f08HT3hDB1lW6nFAOR1yB7m8BKXE=;
        b=Zc/aRq8USaSad+uGK4xk2qEiaicyld4kWbqZrX1qC7CA/IXZznjEixE5a8SzSSFHy3
         vAzGxV79IHRmdSStzmqGclqgfiBvokzJTKiGJR6YH04N+c0uavo/axXwJM4/4jg8WZQT
         IlH2E+zzIKp17oHT1BG/pCd8TeCvp9RUQqqihUOMzVXVm2Q0+17Fdtev61KYgWeB6hn2
         DHG2kKAtbUERkQJjI6Dn7otV8W4gxXK3Trs2707AB8APWpkXERmrWNojco93j6jmRzFu
         bF+dDwUP3oZ3oNmxVLAzX/xQO03qszpGXDNqB9dVXL/14jgsofLVQ+byFvv61++9dg8/
         22fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717979; x=1785322779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6NLD5QZZ8/I4Gf7f08HT3hDB1lW6nFAOR1yB7m8BKXE=;
        b=ZLGLd9wwQtt5P363X2wg+rhcFO0E8NJoqblr5SGePa22nxEIBOr+lcO/x42MbKX58y
         MWI9vc3m9aw0USmMFxMkSbtBOYAn0Zk1+iTGqClqpb9wmub8pQt/4KbWjagkjp0HGpli
         GBv9f7094ydhBl013RsTmcQ0PhcArGnpNcnvS7hPyvWj8Y1hDMQbQRQJjAb0qfZRYzsm
         l4UerqzZzkqc2EQd/HBXtvGsneVMNEVuCftZ69v0m+zDCKKKtR9H6v6Ldj6SEwZrUvxh
         CsRfN3+8uNW4WOMXFssd+tj8Dndk4u3FVCpMMGvCl2FOM7QkOjniN9eSgZaOToNMaUbN
         w+hQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6nSxYYPp+BzLBB3RXwgDoFVgYs9LRNuisbPAh8APbNdpNEE2Soxtwn1p7xDvAii/Q6cGWUFd9O+h22jFj@vger.kernel.org
X-Gm-Message-State: AOJu0YxfkXxtO7tHGXBJM+tkMFfKx+sQQJADlhiU2oTC244bgvDT4Jge
	lkiMfKKO2dEbRhsKwCtkwpi6QdforowM5dLOVMoFr/eRJCk+KSC6VcUHQ+Tk9YqBwgA631Rzwaj
	nmwiD47M1lBKPPF551NoUfmdUZ4HS3R6WpUGnLmtsZ+y4yDQ/NudcywIorzx4hTa0kQSL
X-Gm-Gg: AR+sD13mCDWcYcxQEJc/RGixyLmP3bVoYbWSJrGvJ24kh5lRXWOFTor6bO6E21nnFQS
	r7dl1mKSsr/dKNqzjOr1RIZJDKL0QXc+Sr3te8yA7N1l78a6Q3xWk9r24sywba8G4Qb7Pvq9j4u
	iiBUdZ+OeAzuiHeQ+Nh23qQPRJszGOADAvN5WK5IzTL6zdz93dDygX0zOeAWsj4JNx0LRHSecYT
	kESG7VSUKPEJ3JZXJ3gqtDDnrq+XcFOfIWik74llCJQ25xl3TveFcDRslRXEBQFXEiPvjM50Lgl
	jK5ec8FXrpVcxgVh35Gw2GMgQJL55acj0vLr5ERO9zQRmUvmKVVL9eP5r/mSOFMVYgj0W8ECMJZ
	ppBP76Fd5JKhAgkZg4DlV5GHDvXXjMrEQ5FX4LupESUWPWcUMy/dSVyj94Hb/hFODwA==
X-Received: by 2002:a05:6214:5d0b:b0:8f3:469e:5051 with SMTP id 6a1803df08f44-90778358215mr238108436d6.18.1784717978528;
        Wed, 22 Jul 2026 03:59:38 -0700 (PDT)
X-Received: by 2002:a05:6214:5d0b:b0:8f3:469e:5051 with SMTP id 6a1803df08f44-90778358215mr238108116d6.18.1784717978006;
        Wed, 22 Jul 2026 03:59:38 -0700 (PDT)
Received: from [10.111.173.228] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba9e18d4sm18438546d6.23.2026.07.22.03.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 03:59:37 -0700 (PDT)
Message-ID: <fa4eda4f-a492-467d-86c7-98b9a6d35344@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 18:59:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/15] drm/msm/dp: allow dp_ctrl stream APIs to use any
 panel passed to it
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
References: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
 <20260720-dp_mstclean-v8-10-bea261bf4e7d@oss.qualcomm.com>
 <20260720062405.E079D1F000E9@smtp.kernel.org>
 <3k7xz57peytyda7cvzfpao3j6xuhn4gyf7f43wnspdpgnrel4r@vipemh3nkoi7>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <3k7xz57peytyda7cvzfpao3j6xuhn4gyf7f43wnspdpgnrel4r@vipemh3nkoi7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DYS3v0iM7jaDYUVj-YDAe16u7N_fm5Zx
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a60a29b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=fjmCN9aIutHrqzZMW0YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfXxtZg88fhuAUa
 xGUpWLdksrj4nbOdzv12S6F/XoU/cZPD1NpjH3aI1Bn59DYWhYK8HMdlvHnN+qp9Q/lOE0jBGe7
 srPuGDtjeBahOs7yZrimcNrBh1mGTCFCtXWKVrbVM/Brgc6b6kgCeiIbebwV8HMglpBGmJ11PiO
 S9nzwocIYnBJWvncRT7mvzPyhR9WCn2Sjtr4ubaJLc2nkZJpxo9K4USoJXSVHNdq/NT3baDZWka
 UCAAUqE9zrMTqcJJPOFaEzbBX2WSkk5Iz/qdezMjrYXX8OReoyzb9RE2XPCm+fnoRf738KljuQC
 RwS6JANGwrJa+0QTg2ycn14fHpXLJeTZTXyVNDbnD49U0M8EXti8bBJXVUKdpVT63in+fHrOKGY
 yzNzOSBOoX4CxFLkDZJ5JP6TiTsR1t9SCKyoBmYJWImJI5cyQSIVaJ+m+qhwki3FDtVtYrjo/Zm
 vaAGSCBv7LYxOsVrXVA==
X-Proofpoint-ORIG-GUID: DYS3v0iM7jaDYUVj-YDAe16u7N_fm5Zx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX4bjzkRyPpwdp
 9QIoMnc9nR8AKttFMZJuG4H3y/WfdFQbyDQgT+aea/reiVQYKMGo1koVVD8HtTWjAaSYpQ2SCXj
 YxEVXsyvhn3WfNbgaNdnGlZ4PXZBQz4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220106



On 7/22/2026 2:54 AM, Dmitry Baryshkov wrote:
> On Mon, Jul 20, 2026 at 06:24:05AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [High] Secondary stream panels fail to have their `hw_revision` initialized, silently breaking controller-specific hardware workarounds in MST setups.
>> - [High] Stream-specific panels are incorrectly passed to mainlink APIs, corrupting shared link state and misconfiguring the link based on leaf monitor capabilities instead of the MST hub.
>> --
>>
>> --- Patch [10]: [PATCH v8 10/15] drm/msm/dp: allow dp_ctrl stream APIs to use any panel passed to it ---
>> commit 07d3f4b80ae5875a958a8aceb22c9ffab07db108
>> Author: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> drm/msm/dp: allow dp_ctrl stream APIs to use any panel passed to it
>>
>> With MST, multiple sinks share a single DP controller, so a cached
>> panel in msm_dp_ctrl_private can no longer represent the per-stream
>> sink. Drop the cache and pass panel explicitly to all stream-related
>> dp_ctrl APIs.
>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> index ae79cbec26d19..207643fa73063 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> @@ -219,7 +219,7 @@ void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl)
>>>   
>>>   	if (!ctrl->hw_revision) {
>>>   		ctrl->hw_revision = msm_dp_read_ahb(ctrl, REG_DP_HW_VERSION);
>>> -		ctrl->panel->hw_revision = ctrl->hw_revision;
>>> +		panel->hw_revision = ctrl->hw_revision;
>>>   	}
>>>   }
>>
>> [Severity: High]
>> Does this leave the hw_revision uninitialized for secondary stream panels in an
>> MST setup?
>>
>> Since ctrl->hw_revision is populated during the host initialization for the
>> primary panel, any subsequent stream panels passed to this function will bypass
>> the assignment. Could this silently break hardware workarounds that depend on
>> panel->hw_revision being set correctly?
> 
> It does. This should be fixed.
> 
Got it. I'll move the panel->hw_revision assignment outside the conditional.
>>
>> [ ... ]
>>
>>> @@ -414,10 +414,11 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>>>   	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
>>>   }
>>>   
>>> -static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
>>> +static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl,
>>> +					 struct msm_dp_panel *panel)
>>>   {
>>>   	u32 config = 0;
>>> -	const u8 *dpcd = ctrl->panel->dpcd;
>>> +	const u8 *dpcd = panel->dpcd;
>>>   
>>>   	/* Default-> LSCLK DIV: 1/4 LCLK  */
>>>   	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
>>
>> [Severity: High]
>> Can the direct write to REG_DP_CONFIGURATION_CTRL at the end of this function
>> erase stream-specific configurations established by previously enabled streams?
>>
>> Since msm_dp_ctrl_config_ctrl_link() is called on every stream enable from
>> msm_dp_ctrl_on_stream(), it seems this might overwrite the shared register and
>> corrupt the state of active streams.
> 
> Hmm?
> 
>>
>> [ ... ]
>>
>>> @@ -1810,11 +1821,12 @@ static void msm_dp_ctrl_link_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
>>>   		   str_on_off(ctrl->core_clks_on));
>>>   }
>>>   
>>> -static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl)
>>> +static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl,
>>> +					      struct msm_dp_panel *panel)
>>>   {
>>>   	int ret = 0;
>>>   	struct phy *phy = ctrl->phy;
>>> -	const u8 *dpcd = ctrl->panel->dpcd;
>>> +	const u8 *dpcd = panel->dpcd;
>>>   
>>>   	ctrl->phy_opts.dp.lanes = ctrl->link->link_params.num_lanes;
>>>   	ctrl->phy_opts.dp.link_rate = ctrl->link->link_params.rate / 100;
>>
>> [Severity: High]
>> Is it correct to use the stream-specific (leaf) DPCD to configure shared
>> mainlink properties here and in msm_dp_ctrl_link_train()?
>>
>> This appears to misconfigure the link based on leaf monitor capabilities instead
>> of the MST hub. If a leaf monitor doesn't support features like enhanced
>> framing or downspread, but the hub does, could this break the link to the hub?
>>
>> -- 
>> Sashiko AI review · https://sashiko.dev/#/patchset/20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com?part=10
> 

