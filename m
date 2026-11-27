Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768689;
	b=J9Lms0w80sgVoBW2rlSIgFd5qHKyGdOeekVhwSin7O7u/NhKjXbgjEXucJaxMo3tAYvC
	 YMCOHjCJdrfvl0nkPaMewUmWioYRidM4qGHQBX9n+pIvhXumkoS8Eu1ADfyjCWpI0xxVy
	 FJiTntQvg+ZDNFQT89XeYAQKRbCRZoJLQJdl98u7WKvUVwrzP39VL1lXvfW7QzsxxTEHs
	 MZOngeVap9Kk5rA2aje+G1CtJ3FCGVxu0TY4RkKoGY8xg9IdqlV1zv7vyMPo8zrLFOcT2
	 kuzwTK96anDIzAKiEBKTHMdWx794WJi2I3sDnQTA7pqE1DEnIVuH2GRUKL789k2XOhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768689;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JMQn1/nFBMol7ezl8F6vSFNMPv5T4CKNqiUdSoWRWgE=;
	b=GOTB9/adG0RVpPM95YIzpAxNYCf3CKq+qi31YSCQZzLQOCgMSb7zMGjtsHrPGpApx1kM
	 NN5JVWrBjdfoZiYEjyNxUqeO9JnMRiE+SPXf5a2WyGR1pgjkrECh0aLW+dOaYpVS+Zeh5
	 qbXuV/xDCOxrw3mB5hGMqrjKkLH90KHdSyaivviKl+HSNM4ObGpCPEFJ3GnWo9mNVDMs2
	 tUHNSUbdG/llCX9G7go9xVXmzEWsgCGx8r+yPhWl/zJDFjVRB+BUI9qnZWC62nIpm2xZ9
	 7uWBXkgvllEpmKR6gK0p5fKiVZ36Y4rKvpngg1+sTyyl4nNUFbkJ0MlyArOYXRrs8eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=REp96j+Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PKZKgGET;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59A5606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A59A5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=REp96j+Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PKZKgGET
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GM8d1779885
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JMQn1/nFBMol7ezl8F6vSFNMPv5T4CKNqiUdSoWRWgE=; b=REp96j+QoMCw+ks0
	0NldNXf7WOk1IGw1G0B8bFFYsnsNs+fruWPDqvUcmoSgZ6pkcfpQ0YrwvbIERj5Z
	WLYbkEMk5rIbT+zeiUH+d7scuqG4+M7TfAAnmWNdl4tjkT8rPqJolX3nGeoikNci
	ea2OF2x22HnTaCF59Wwn+DBI+zODhXU922LwqZ+7XmUZ9/EBtYOwJGGX1uKsup77
	4zM0h6Npadgjcb7jqHBZxFVNIQzISI7rTdn1A76Mjn8ncQbJzjyrGcZ6cALqS4di
	miR+qtzvD2e1YcpFB3UmpLFXAv3r6F0wwjKK05CTDGkcsEB63wf2Oo5F0QUVH5sk
	j5NrWA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhgpgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:38:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55d7544d113so143625421cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 00:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795768687; x=1796373487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JMQn1/nFBMol7ezl8F6vSFNMPv5T4CKNqiUdSoWRWgE=;
        b=PKZKgGETVaHTF3ELYKvP0fwYLewadN+sgMQSq9RWzpwzuCqTO9TDIpvcNk9H41+GoR
         r/AEFAKVYQkdTROaZk79r/6SCKTGCFV3PlSPNYOwV+q70/xJiaN+J5doQ6V4oJAYMMAD
         NsoGuHQyyV3GP5589bagWX+Ab1cvT7v2A5bIriPXpEMrDerbQfZ9C9Gd2E57aLwadAPQ
         K55HMtYLzcuVy3BtWGnNtpyuROY3QmhyQyJQQfECcaeCUUvD5KvJjUGi4jWlkCDmSF/N
         qDFviGlDCIHtlD0rXYbowpUUHG4IpI3soVpLpEQVjrfG2F6NmG82yGBloaefWIMm5oZw
         anNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768687; x=1796373487;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JMQn1/nFBMol7ezl8F6vSFNMPv5T4CKNqiUdSoWRWgE=;
        b=OfWY16aZp/ZgF3clyqTvpAIFfLQlByVWi8GzRzXzT9Fi/Sim2iWlUe0kHd73LHqC9J
         2SL2wZhJefZaV0dDD0tRwAPRXGto00SHWYxJ2mOdQWwdR+TFmEV/kKK3Nle5gRcP+yba
         +UYUjrxYWNU9AGzy1B5k+2O8vup3wOMbuM30FsyEHhn1WlD3lVs6XjwvD/Quf5ac88mq
         3/K8i4jMxCqA8cpaBL39Uh1rCkZ6K4Y29su1P3JiOOs+/en9xwxywVmo3fjvaxbltISP
         Qb8c/9XZdnvvPBUNA8lVuqL+Mu/n8ItEFYpEYthYxtlYujadSmmikoRIRgn/ipk+0fVo
         XdgQ==
X-Forwarded-Encrypted: i=1; AL+hErGD726WrbP1OQhmlhiVL+nMcyayQn1RxVvMn44UIqF+STdpxV7jpG5EfVra2oTQCSNt/6CZsOMHwx5NQhYI@vger.kernel.org
X-Gm-Message-State: APuU4Z+i7Lj3g54RJfNjZw0Te81RXFWtJLhr8mrh50hkAY1OcsB14r5y
	Dsbjfhsmg9DMZpjZoyHnnQj3F0OcpK5tTXW++YxsNGafH1bm1Vt/Yyp5sSkNU7h93R1UBaPgL0P
	UZJLRNgNhN15YozKWZKou3gohPOyH7IIy7gjWT8oToHqHIgJVEqaG6Jp6hBB70iWHlCtx
X-Gm-Gg: AZFdTZf/JgWTFi3vuWWRUCm3j8s7pjNzGkmo96X23+G4Aro6eYFvzm8uOr2zD2+tTU4
	s17u8L9yQJn8nk6gsG53furtXEZzIZqgYNaQLkvLld+Bgr51oc6Nd3uEBNp6yr4fIGe7u8U1oFt
	T1Y3uuKFmPbHr2xDujVSDtOwjoBNb+nLuWI2x8t++u1gWGRjC73TMJmn1/CVHtp6Pd013RDq6ET
	P9gfhLadnUVNiJT1Ewh6MdD0fugV3QBQP3xX/KUYsBtLGL5LDMxhNkO7b08MmdP7Hy+pcMW1bDF
	1wrOGQSPV2CjweJ4xQ0ueTLCBQfisX5P8w3mgRL0fXd//CLpVSGtYl6z+loehPCxJZzi1nunzq+
	dEBnm8nc7LIwkztvTWFIrzwiHfSmVY+iTJLv8KHfgbnFgT9fRT7q6DkHE7BsS6XkdMPluuQRqHK
	bWbJLjP+e+qakDoX3owbQwcLJqdaSoFwcSKeShwg==
X-Received: by 2002:a05:622a:e3c4:10b0:55d:84c7:7d7e with SMTP id d75a77b69052e-55d84c77e4amr286763591cf.23.1795768686660;
        Fri, 27 Nov 2026 00:38:06 -0800 (PST)
X-Received: by 2002:a05:622a:e3c4:10b0:55d:84c7:7d7e with SMTP id d75a77b69052e-55d84c77e4amr286763321cf.23.1795768686152;
        Fri, 27 Nov 2026 00:38:06 -0800 (PST)
Received: from [10.111.164.147] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882e32dsm205186781cf.13.2026.11.27.00.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:38:05 -0800 (PST)
Message-ID: <cebfbf95-3dc3-4129-a658-0251b8c9b631@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 16:38:00 +0800
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
Subject: Re: [PATCH v2 0/3] media: qcom: camss: Two routing fixes
To: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261127-camss-routing-fixes-v2-0-b7152f0af49a@kernel.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20261127-camss-routing-fixes-v2-0-b7152f0af49a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfXxi1jGCsd3YPf
 BNSryWNQQ21w5iOwrmUUl1+3CM+EzlFjo6+pK7QtaqAThEYwMgU7vIssNpeFDKXOQ62PmKWxepB
 N/bY0TyXcmbfk5wTWDkxyakAZfC7ZCw=
X-Proofpoint-ORIG-GUID: SrRzELfukEpyz2H1efWUcf2lEAJtwn-3
X-Proofpoint-GUID: SrRzELfukEpyz2H1efWUcf2lEAJtwn-3
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b09416f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=NqBOXpl7M472BNfDCCEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX0+MJGMpen00W
 Pud4x3FqY//SjpEX1mscdHPVtbdNrYaKGtKqi1ZxANef3fvS/Rbw2VNwFHvdFwTOz68llmN2qKR
 sdCnK1X39yLkhw+PehSA/LFWlWBUmBzN2CXaEjjNV0ELAKl9/FP5n1JlsSyLM2pSee4pFhA8HBA
 pskzVkBBFV4WGb2r/WlafwGXp9tCp8SkWsfE0YyD/nhK1etTWSKEcV0dQawZvIQlly+V/P0o6yH
 rUjlxjkgBDvmezQ62RM9QzG/grn/V9Y7zBvqtnedxyfgdYr8HjyFxqC8zkzrKLUyI5Qm4XJp+tR
 h2KRiv5ZVruUQq92UaUTgWBj74zlN+xJLg33tYDmZleqJ6ltYKvE20uaWU6evKNXremyjYd0Czn
 grG79RtfRN9p0vO4dGQj9zOXWpfStqvCP566OGWfBPdNf/IvUtSpM6QPAV+PGZYMbxHghRPun1t
 gaKG1c6nleZ4fVM+vOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034



On 11/27/2026 12:15 PM, bryan.odonoghue@linaro.org wrote:
> v2:
> 
> I reviewed-by and then wasn't very happy with adding a new field
> to CSID resources hw_id because this means we would have two
> identifiers despite already using csid->id to mean index and hwid.
> 
> Bite the bullet and make the conversion.
> 
> This is the way - bod.
> 
> - Adds a precursor patch which provides a .id in place of CSID.
> 
> - Converts from using csid->id as both hardware identifier and index
>    Instead helper functions make clear and explicit do you mean csid_index()
>    or csid_hwid().
> 
>    Several callsites need to be updated to make this happen, but that's
>    life. I'm a big fan of patch granularity however the differentiation
>    between index and hardware id must be done simultaneously.
> 
>    Follows the precedent of csiphy.id - bod, Wengmeng
> 
> - Straight drop of CSID2 retained. This is the right thing to do, CSID2 is
>    useless dead silicon, already RB by several community members.
> 
> - Link to v1: https://patch.msgid.link/20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org
> 
> - Applies to camss-next from
>    https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git
> 
> v1:
> 
> This series lands late-enough in the kernel cycle and applies against the
> camss-next branch staging to linux-media/next.
> 
> Link: https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/tree/camss-next
> 
> First up a patch drops the declaration of CSID2 from x1e/Hamoa since this
> CSID doesn't have a corresponding VFE it is entirely useless and violates
> our 1:1 mapping between VFE and CSID. Since CSID2 routes nowhere there's no
> reason to keep it around.
> 
> Second is a fix for a longstanding error in CAMSS which as stemmed from
> the original development of post ISPIF devices. These devices have a 1:1
> mapping between CSID and VFE so the mapping we have given to user-space
> which declares each CSID as connecting to each VFE is just plain wrong on
> these devices and has always been.
> 
> So the second patch addresses that longstanding issue but, I've been
> holding off on fixing this for a while since I believed it might require
> extensive surgery, but in the end its quite simple to do.
> 
> Finally the third patch is a tidy-up patch which inverts our current logic
> of continuously adding new elements to the src_pad_code switch for new SoCs
> filtering those SoCs down to a default: statement. In fact is is the old
> SoCs which are the exceptional case so, just do the switch for the old and
> the default for the new.
> 
> To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> To: Loic Poulain <loic.poulain@oss.qualcomm.com>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Hans Verkuil <hverkuil@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> 
> ---
> Bryan O'Donoghue (3):
>        media: qcom: camss: csid: Add and enumerate an id field for CSID entries
>        media: qcom: camss: csid: Stop using csid->id as both index and identifier
>        media: qcom: camss: x1e80100: Fix CSID2 routing to nowhere
> 
>   .../media/platform/qcom/camss/camss-csid-1080.c    |  2 +-
>   drivers/media/platform/qcom/camss/camss-csid-340.c |  6 +-
>   drivers/media/platform/qcom/camss/camss-csid-680.c |  4 +-
>   .../media/platform/qcom/camss/camss-csid-gen3.c    |  4 +-
>   drivers/media/platform/qcom/camss/camss-csid.c     | 34 +++++---
>   drivers/media/platform/qcom/camss/camss-csid.h     | 18 ++++
>   drivers/media/platform/qcom/camss/camss-csiphy.c   |  2 +-
>   drivers/media/platform/qcom/camss/camss.c          | 98 +++++++++++++++++-----
>   8 files changed, 126 insertions(+), 42 deletions(-)
> ---
> base-commit: 91ff71dce5e770e7965cb3b09c87f6d334c6c4c5
> change-id: 20261122-camss-routing-fixes-b178bdb84f20
> 
> Best regards,
> --
> ---
> bod

Reviewed-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Thanks,
Wenmeng
