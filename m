Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380745;
	b=OAtAA8J6OVmsQIh2sRXqNZWfzTAdByfFgTxf8slXoEyn1MDhS0Nbloubqi8+5aIp/sCh
	 UTAusB/UUj4llBQBQtKYZERDvWaJZ6k2pQClFElvjDhTu/PhEtITBf8VD1zJJWY/s1edg
	 M2i6xI/gfZ+Cho429YXuyKMhDZq1vbhyQtZM4D3FpHrcOEn0IunSSaHgfo3RentFlLte0
	 QuKwLr2jRVUxmuVAL8MqbC5PkD1z0n5L/SmSSAu7B1ZuvyJTWE4PjHxJsK4KwDQ5eGaIP
	 mayqHiOWzJJN6aqPZs6euxF1vd8eGkXDuAI8usHs4TCpMp4DeMAtZyZmjltGNK21HPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380745;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LztxLNl/cxBUH5XhoVCY5HWh+124EuWqYRgWVaTkemI=;
	b=3uEO12/U9J1CLtS5VORqYLtbWFpdRF95Isr5HeoqIQ8v1DhB4i9ZIsLFnGqj7meQrJBM
	 VBYaMPV5PTinxc+stzxpQUi3xw43Oc55GGeaGplbf1XF6HYcUfO3ndEHAUyZu7teXXOgz
	 up36HFMQx4pHr+L8D6bqnquqHDnVBtILii7CWw29KqPLvF/aZvaa8twOOL/yItwBl2vx9
	 r2+rpjon+7Uqnq3cqBNycxdUc6ZOWEGd/FC1cx0kEpzFGm0UvxohYSKwG6Aa2X5uNq097
	 GmGaPooryBN0BGNxcX6MQNtSVUwyFRle/187Rn4lrSLNJ29IJT/5txdx4MkQzoYfwrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bI6s7Wzt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=berzHw0L;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEC9606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 17:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAEC9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bI6s7Wzt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=berzHw0L
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERuSd1953891
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 17:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LztxLNl/cxBUH5XhoVCY5HWh+124EuWqYRgWVaTkemI=; b=bI6s7Wzt5RY1O8qb
	Y69aVd5U3HUS7vWVvI6035fPSKCxFs4pl12z2tNrlwnTS0DzHG9oh3pYA9QU5n25
	HMZLYfzm1wv8I9qA6/SaFgs67DiB9TwTpsARVffqccqUyIkOiq16GikcqKy/3ptI
	/kxY+kekfRSso2oTMGsyVcFlkPxmzTp1DqpVNHqlo2grOnza6ZAib5olImyjtUxz
	hxZr1OlExF2aO3+qCsq0+fW+eYm3Bd7FrT06/lOS72KMk75nLSGCpPtxmKMhYyP6
	Z9BNKHJ9k2xPIMzpJAdBZnoPmHE6KrLIkUyMrQ1D2EAxm3nd4AziX3uchjhXWlEN
	zJn8Ew==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pm6ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 17:19:03 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-845156f593bso649527a34.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 10:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793380743; x=1793985543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LztxLNl/cxBUH5XhoVCY5HWh+124EuWqYRgWVaTkemI=;
        b=berzHw0LM/RQkAlDtkef8WovWMVceMsDKNlqFPhwgiZaCEoljpXD64EjIaEkRTjucm
         jpCcoHx9kSFHa3OcMTkuJoPmHXM5aWvMY18clZIzWy+RJh/41fbjXXBd3qz8s90NzNS7
         3EiW1expVdOG422Vdf9jWEKgM3NF8rMThZZOd6IACe0rIEcIsB9TkBUww9MdvcrU26P8
         YEPvkktqzINXV2uHktPvJ8QuQ7kEfgkT0VRaaPLaFOACPsyuoTnS6JpklJh76LxtD7DS
         6WbngRNBu7LWDEu8M4Yq9fJNP3IjEPUzqptd241O2YPhL5z4dha8MrwEo2GD0YpfSZaR
         QqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380743; x=1793985543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LztxLNl/cxBUH5XhoVCY5HWh+124EuWqYRgWVaTkemI=;
        b=w5BYzM2TPBh0wC8yDfXVCNjzPERmCi9O8py0gFATObu/Ge6YDeWH54T1UvZ7UV4X9X
         awEE70j3a2ggy5uw6Hx5rG+DOJBu/htg4xyK29Fx+X0r5zCYL0Sen+LHnWWB4DB0Y7gI
         2VPik5Icv06f0NO4AFNr/lG2zEOYvYPZausHUofcDHsk1N4ru1x4YIdW2gWTXIm+HMHG
         tp2XQdm5deD0akL55Y1OrkGoR6yT/JJEfeD5U3Gek6nwLddMnMT6WXkXryHZwk818euq
         H41jgxUrA/9icoaJS8mkmlvh9VExgiG6oyckTP5UOMFQE3IL1x4y8ISfqitXKIaa7oUL
         hvaA==
X-Forwarded-Encrypted: i=1; AKwUvBzkCWhlTBWUY1gbsBAsae9+UIEmH/Xk2dkf2c62sC4w8OPyp7s6NkOsMJjgu6g5jLQM8n0ULVSwayQlcFOf@vger.kernel.org
X-Gm-Message-State: AFq9FYKP6Zpik8Zq+aDqqmkzLQPUbSI/NhlcWfBhdzuz0AQBm8wnHhjM
	Q8FAUyJFj/hjB87Qi4gHjPqKoFN9IhA/aPuVd0IE+AoVtA+cFEXOgATc4DnjsTBJKI0BhsDZVcJ
	NIjPgYtdqhGiOPHDdy/7rY7wwlwtyxSt1mMQqO8IPHT+YqETcHSJfIkwNvQpm/2SXs+3g
X-Gm-Gg: AYBFou2g52CcH6yvgBsXi6EaGrjF4NTEao+zpBIZLeU95n+N8J5TicYIcf1pd07fstG
	QnSyJaK/GJXxq0rdy0PBd7m0rUjHYwVwIuMecVOK6OBkoh4ZFoj/OCroK3rSfRgRkBmKhUKaT/f
	tHFz3DuqLHA36v2HkO4Y+LjgCrLYiuQElMKXoUxQdIMN91yHV+Mn3BXPf03ibJZMnrro40EGWMK
	lC4zulYgwY9bm4c/jr9j6lrCw/tYHipvTRbyZ/PKM4/OcXmxq7HLAVu7u3Klk6vyrjtYR2bI13q
	Io212+U3Nz3nmfHJ/n0Dx7UcGTgve1ABs5HilzkOotOBy+7eBcwdqbIVlSZRpaIpp73hGgLwmRs
	FwOgvuTbxbb1kW9cE2h+RHESpjCzNDD37p6gtjsi+wOaQCHSdFjczV3ylGwUc1WGHx98fF2LxBc
	HkdkIiWDkhwPPuZZOVYrVHdBaIiCE315UXOnfFm7AdHRN0fsj3FRQrjdrU6gy8zCVJ
X-Received: by 2002:a05:6830:43a8:b0:81b:c62c:b63 with SMTP id 46e09a7af769-85d3654bc97mr2516101a34.18.1793380742750;
        Fri, 30 Oct 2026 10:19:02 -0700 (PDT)
X-Received: by 2002:a05:6830:43a8:b0:81b:c62c:b63 with SMTP id 46e09a7af769-85d3654bc97mr2516083a34.18.1793380742316;
        Fri, 30 Oct 2026 10:19:02 -0700 (PDT)
Received: from [10.50.42.16] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d355295fbsm2491106a34.25.2026.10.30.10.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:19:01 -0700 (PDT)
Message-ID: <11d12057-11ce-46dc-8310-be660838515e@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:48:48 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] arm_mpam: Fix MSC MMIO window size off-by-one with
 resource_size()
To: Yin Li <yin.li@oss.qualcomm.com>, James Morse <james.morse@arm.com>,
        Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini
 <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
 <20261028-mpam-resctrl-dt-knp-support-v4-2-bdda1e445cba@oss.qualcomm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-2-bdda1e445cba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX2rMKqV1VNGgs
 C1sFoQqiYmt35mO6ndNQ12rV32G3+cQYRgRmIuQmPEYSAlr8KuXNAe7GFRCP6LXT8/ZyBta+lME
 PRGhBtT5vLJBDoq58ycJNz/3EeIzeuF9dThHQXcAWzTTOq8vlIrCwVl36qLBPxAfmndRdHY6TKT
 2/w3If06A2SPt7ZY5mI51w/5BHZMqHTbVxBIkeMVBlilOExAS1PGjRGT3nYnukXSc+7O9CPHBa7
 V0oaEG3VLH12SEA6bekFUWkrtKhHcan2gmlcpW+9EHwOICWHPtcQiMYDed5NbVMi6vFacDEqFMl
 i81IFJb6Aj6SGMmIHRzrGsIm08xGaO4hZCEVCYZVJYMTvdqmLGb5UcOhmYMEua/mP1S5k9bZ3ek
 prS1B2V0tVa+bXcLl98gqROlvq4rp7bJc7PcfNLfnPcs5VF78Yay7mvTRT0flIf/67EEXLS8SU4
 oGOdiStCiu+qotP0sZw==
X-Proofpoint-ORIG-GUID: 4SeUt2BfwiG1LoZS0dYydhaoE4bsM4sw
X-Proofpoint-GUID: 4SeUt2BfwiG1LoZS0dYydhaoE4bsM4sw
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae4d187 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=lcbwfqp2WOkoDi6s_FAA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX0/b4sRn+B6sF
 rkgWrN2F83Hb6Qua+IktURrnYJnZIlBvQejzj5pBn5raShjiAtpqQ+2+Qz4HQqEeMp5F34hIO2n
 XPAgxmGTUboo1kRQfnJm2cJfFLCm4Jc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300068

Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>

On 10/28/2026 5:15 PM, Yin Li wrote:
> struct resource uses an inclusive end address, so the window size is
> end - start + 1. do_mpam_msc_drv_probe() computed it as end - start,
> which is one byte too small.
> 
> mapped_hwpage_sz is used by the register access bounds checks, which
> have the form "offset + width > mapped_hwpage_sz". With the size one
> byte too small, an access to the last register in the window is
> incorrectly flagged as out of bounds: for a 0x1000 window, a 4-byte
> access at offset 0xFFC (bytes 0xFFC..0xFFF, legal) computes
> 0xFFC + 4 = 0x1000 > 0xFFF and falsely warns.
> 
> Use resource_size() so the size is correct. The ">" bounds checks are
> correct as-is once the size is accurate and are left unchanged.
> 
> Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@intel.com/
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 347a5a6d6a1d..0f984fcbcae9 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2508,7 +2508,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>   			dev_err_once(dev, "Failed to map MSC base address\n");
>   			return ERR_CAST(io);
>   		}
> -		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
> +		msc->mapped_hwpage_sz = resource_size(msc_res);
>   		msc->mapped_hwpage = io;
>   	} else if (msc->iface == MPAM_IFACE_PCC) {
>   		u32 mpam_fb_msc_id;
> 
Best Regards,
Srivathsa

