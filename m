Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B1D39A802
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790664631; cv=none; b=UWbsgfQgfLRE5fCN6I84r+WlINbkBD0QrHvkYXQ/cHT9zaQ97WbG8OXXgb5/D5yRafenE8YFtYfEBrnlxq92WTlutCpOAhrgFSByWrsENhMBnfHi0oosHzR1Z695BuoEEWpRCbyXJJsyBY2KGy0buKQf7GZhG6bFCagDGhPCch8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790664631; c=relaxed/simple;
	bh=Vb9KmSS46AwV1UlOKcFOXPSwnp8mz9y5P5c5U77AteE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EINXPBam/DwATzwQO0RTUHvx6sFBgSnIS7d34LG4uLuDnuuxyXMVYyr+WtI3DS1eBbUpgJjdXEsn3pl/nPn6hvSkxNqauOxF0qHun6GG98DMZmbHRESsHmZqaMp/zli7ftEgMdAWb7H88Wrkmwd3oldI+AcNdljOsGWRLqF645k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F3mLAdQd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gx4lID3y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F3mLAdQd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gx4lID3y"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T474IQ2686131
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PYtusggm8SYDRGGRcK1InNqXS+JZ2BU5vx4LMQUuYXI=; b=F3mLAdQdKn3SK0XO
	lalzSfBuBnCC4M/hoMrPl+IlQk+6OnTlXLi2Jwo3OTcTcE/WP29oFMb4spF7v+vc
	sw8JcrMHwDKkzQurlMLRhiuqzbhpnQTlc3sUa3dJLa7lIC+fUp6IpJ8Woh5HU39B
	Lik++itjzMQdiVfcxXwNaOU/nsJ/DGOFC8xnah6rSFNaPKIG/utPx2q4aJEiDWn7
	pS5DaXIcAtxr8SgnkbVO/Zr0ZLNRg1KzZ6GOT9F/pIPtydebtszim9tzcLHXEnaF
	rV2GtQQHz8kKkr/Cg746WjKORydzAgHuuegzfzcOI4U9viz2rSZywGbzG6VAZOlp
	WHcgmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mjh8uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:50:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c6a0d2122so465722985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 23:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790664628; x=1791269428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PYtusggm8SYDRGGRcK1InNqXS+JZ2BU5vx4LMQUuYXI=;
        b=gx4lID3yHW5pe76cC2GFijQwlbyVubYaGpYjgNkN0augsIE9iHCxFzFaMG3YF8MsL9
         1NFFkAMo7G+7zoBi+//KEUE4wKQFBqqxQXouWl/bBVksMacGQCOEyqlj8ykYPQCq0Hrx
         YEwEFAEx0tcKKQGZj27Zj7q2Dv3ZNFezjaQGWJL2YqkccH3vvtEEQHrieg0foV9cAEN3
         yppxhGfKJtOzAGLYq+7vJznDCjQuY4UfyM8oqMsa7PnnTQQI3ObwrEIf+u5YfUpHZUSJ
         eiwY6WXKkJLJkhAc9JmW0LI2QVfCzBgtH5EbHC4dMvCSSB4IZg2DXA/Eae1t2pjWK78L
         u/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790664628; x=1791269428;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PYtusggm8SYDRGGRcK1InNqXS+JZ2BU5vx4LMQUuYXI=;
        b=xwa0z1X3wgw6+LdQPJUL7Mgltbf3E0OIIAAisxJs2JFm3gsvW5z6itrBY4u5Sf33xz
         Z3tQwdc6kfTKXGUPSHWZIh+5tio7jtZTObLhzDvjNtmZnbo/B/ucY9lBr2pLh8QhSBA+
         ACe+HU0t6IrvHO+q2Dn0gE2xJEHRs2pRL6pUp4AI5SDNORF86xnNWRY7TKR6i0YsHH2l
         9PWL0Ygonon79r9Wof9NQcv6Jy/U/GMzMmv2VUJgqT4ppk4AQys2FkTWjy0UwPMXdI9p
         1WRJWrNTIXNCg0PihdGqFdaXX/Bl/qmg0Ayn42H8GI6tfPxn+eBTOGm/7wVFDb18O+uY
         erMA==
X-Forwarded-Encrypted: i=1; AKwUvByIDYcQ6VJJZgCMXCJnD6aSavkUSsaiwfWizhQHrbM3DFU5cCllONVHE8tMiFlUmVLCKzEhiFld72vLF+JM@vger.kernel.org
X-Gm-Message-State: AFuF++naKcWHJHh/nQfyWdl5/fhbw6fHV10IcKBwv2wzrh6LkYZe3U+e
	4HakRui/a3kv8wFqI5fb9kz75WG/IaBxZtknRIy5G4VvAdweE7jpp3G3bKTduPPCb5y5ieYsidj
	ZEe1lmtM/Umuo5p9pf6mnRf2GaCYG/evpYtUtQLUScRplU+p6Fi8ro7+kTDeHB0f07BE3
X-Gm-Gg: AYBFou1nIG26MmM6XHKCNY/WCEgMTR1yzvNAQO/R6eDObEj4SWqQfn2QJXx0QwIxjiq
	VR3/79UJW/wh4vdffyR8p/JGTP5ILhZjW6ZDDp8mCrFFYkKJkNhu7r7ki4MyxIIRJ+RIL1FaVGX
	/5VgzRhhjJuhNDpnK8DnpnJFONiXuJVxKeNU9WiW19qILmxP6MxZw/07G2U76GDjqDEiZVDNnuX
	xj+kJpzzOIGlkkIFWP/Cz9gfIF4e3bHOIBu//BzwpLhsDGFQ4vGo6w+hTPO+ntTZ/Mu4/Y9NwKp
	SbBr7xMTHyBRNNXFoPfO18OZq2z3dkBv/LNjqCSrTfiv3IDeNgaSm2309CEEDUqNkuruttLMFQi
	JFXcqXgkDjWY+gRdI4ms0wt2pnnuKTNSHer7SGSLFlP7I1ylFMNLTjBkJEzJPcA==
X-Received: by 2002:a05:620a:6509:b0:93c:612e:9b4c with SMTP id af79cd13be357-93c612ead03mr1731290385a.58.1790664627821;
        Mon, 28 Sep 2026 23:50:27 -0700 (PDT)
X-Received: by 2002:a05:620a:6509:b0:93c:612e:9b4c with SMTP id af79cd13be357-93c612ead03mr1731288285a.58.1790664627297;
        Mon, 28 Sep 2026 23:50:27 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5056b1bsm1589995f8f.17.2026.09.28.23.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:50:26 -0700 (PDT)
Message-ID: <99919a9b-a1ca-409d-babf-00d61177772f@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 08:50:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/qcom-spmi-temp-alarm: Fix temp_map
 indexing
To: djakov@kernel.org, amitk@kernel.org, thara.gopinath@gmail.com,
        rafael@kernel.org, daniel.lezcano@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, anjelique.melendez@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260928132823.1426513-1-djakov@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260928132823.1426513-1-djakov@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfXzl3WqCRXJcoj
 W2p7KUOUj2k/7g3t24jsbTO2OuWRvk348NPaCTajBogOcY0PAIs7eNxkX2bkwuFCaOiIL55QCyn
 V54TWWtuJsKwZlAEVRB/b/21KL7P6dr8coKcN/xtK75g9HNMvKulbR/+G2t3SuUBJZ2RRm2CdQz
 3iJwJ8/aW34fWz2BBZxsg3P1C9nQhg8MwdqpPmt0AjkgP+YCzYpVYjNz/yeC7lRMpHvLfqOR/mw
 8wEJa+jB6TGVOOhAlah6Jd4ImVuypPTygHBEiCoD4q4apar16qjjxc72KUVTm3cn9gpYwiM6Jgn
 fOvoJTtW++HjEO/zE8SdEK5WzVTk9+03N9lrn2uVMcvZ860/aVvM/4rmSP7UpzlOTO2ZllGoksE
 JR3SNB1VxF+0HPdW44WLse99X49zb/SraOU+jt+3xAEjXGZKE9LOjK6bfx2xmL88A7wihioyGP5
 XbgHZown6/cv654CHVg==
X-Authority-Analysis: v=2.4 cv=OdgNnRTY c=1 sm=1 tr=0 ts=6abb5fb4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=kI6mkRwWFUva2zZDKx0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX4O5CfXmoNQGa
 5c0SINDFpbmP0lrJEESP+q6VYR4p4WnnPbURLMpCJBzKpRxli+PXxrDQkhHSVI7jY2WHn8kQmqo
 psJX2T2VNz2d2SZHaDNgWu0Wl32SHTs=
X-Proofpoint-ORIG-GUID: sgfqbyghvAuaLEnol5oiFbWOaP1-J2z9
X-Proofpoint-GUID: sgfqbyghvAuaLEnol5oiFbWOaP1-J2z9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290027

On 9/28/26 15:28, djakov@kernel.org wrote:
> From: Georgi Djakov <djakov@kernel.org>
> 
> Fix the following issue noticed when booting on the db845c-dragonboard:
> 
> BUG: KASAN: global-out-of-bounds in qpnp_tm_sync_thresholds+0x11c/0x180 [qcom_spmi_temp_alarm]
> Read of size 24 at addr ffffdd2495f01200 by task (udev-worker)/371
> 
> CPU: 3 UID: 0 PID: 371 Comm: (udev-worker) Not tainted 7.3.0-rc3 #116 PREEMPT
> Hardware name: Thundercomm Dragonboard 845c (DT)
> Call trace:
>   show_stack+0x18/0x24 (C)
>   dump_stack_lvl+0xa4/0xf4
>   print_report+0x1f4/0x5ac
>   kasan_report+0x84/0xcc
>   kasan_check_range+0xf0/0x1a4
>   memcpy+0x3c/0xa4
>   qpnp_tm_sync_thresholds+0x11c/0x180 [qcom_spmi_temp_alarm]
>   qpnp_tm_probe+0x3dc/0xae8 [qcom_spmi_temp_alarm]
>   platform_probe+0xc4/0x18c
>   really_probe+0x17c/0x4fc
>   ...
> 
> The buggy address belongs to the variable:
>   temp_map_gen1+0x60/0xc4 [qcom_spmi_temp_alarm]
> 
> It looks like temp_map is a pointer to the complete temperature map.
> Indexing it directly advances the entire map, rather than selecting a
> threshold row.
> 
> Fix this by dereferencing the temp_map before indexing it to select the
> requested threshold row.
> 
> Fixes: 703f13285a6c ("thermal/drivers/qcom-spmi-temp-alarm: Add temp alarm data struct based on HW subtype")
> Fixes: 1f835c6a4c84 ("thermal/drivers/qcom-spmi-temp-alarm: Prepare to support additional Temp Alarm subtypes")
> Signed-off-by: Georgi Djakov <djakov@kernel.org>
> ---
Applied, thanks
