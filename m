Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792461932;
	b=rz1Zcy/vqg3jA8PT2pW1ZIuCCHLm6YnMcUodmCjn6FCA5N7HzUrBhms8gE46mk4o/pi3
	 W0hvMiCQPRfdnmHI3T+h6Veob7+628i6vbWuMOXEYaTxInY0hBf1jkXVwuvhsDyzo4v3d
	 KjeQBIrAZrsKTytScfgwrLRJ+iQh9+9KafsgY3GPO0dCAlXF0RWvPYWQ5QQk9t1JpgWtq
	 VZOreVzSUc9JVw8+pXNHRLPEe0RMTf4Qgl70IO5oZAARqUYN+LusSAZ+DWdC4Ts13j9vm
	 Avr9/403R+24PvMUZKDqbpnYA+Ur4rAjzZmeHHDMYsmK7M1nmxh4M0Ceis4ezbq89ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792461932;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vcglXXCdLJZcuT0AS+TO6iQYBvNu/3CXXS4wmQqIQX8=;
	b=LrvRiQWCwIY/N/7Enu1wc2ulpLZJlOXN657ynRAe0kNAKYUttaH3xbw4mflaI6yStzWD
	 d2E3EVAhutPeuhhWsG58D+QOP6chZPKk6+3UAU0Gd8OIwUbZUnnojDDb66Tsivuf4Yp5K
	 TxB/ZYcf0pCL8WxjV73YTU83odW/4NIf1N1tP9zJFw/JkrWjZAPMjOOHixCCC6oK5SrEG
	 hRoAhhqqmAikWa8ElCdwTunlXr7KPjJTzwdKL6QwtVGWFTHcKVzSQs+smsuOStY9ILZaG
	 gDjFy6avzsyRu0pbUCokoqKReR4r2ps4fuvl719ajzsxpbQbiEDDTi/16AyhwkILRjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aZq5hCtH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CVN3IcfF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F42606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 02:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4F42606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aZq5hCtH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CVN3IcfF
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tVGx4178316
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 02:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vcglXXCdLJZcuT0AS+TO6iQYBvNu/3CXXS4wmQqIQX8=; b=aZq5hCtHuETxGA1d
	ZgBXVhAeq9Yo6J6HkuY5wNC/RzzrWWWntLhjFbb3RvhB7BVaQOjaxailEjrVz6Jh
	j5D9TwTFCSrG50hNd/Yr1IabXFaJXsdnaBWme5gVYQZr4mXtD//Lh5YdOOe3gZtW
	OVkFusIxmL4UYUmRR6HUt7gkFRb9dzo+uyn0RyiRVHxQ4gXAdQxQTKxq49PXP+YF
	FkkEX4E6zb/2euEk8c7ABOg1nSAPB+HKexzfroUiIpQj4ptVIJNx0vK6LrVvsO+A
	vDzP45Fb3dQ3ZwjTL0UOd9n8fG/dDUSB0xpsDOhk6Mm5OHrs3pUXgxU5mk95sqUH
	4k0SLw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n0cnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 02:05:30 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-15c16792146so407510c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 19:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792461930; x=1793066730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcglXXCdLJZcuT0AS+TO6iQYBvNu/3CXXS4wmQqIQX8=;
        b=CVN3IcfF6ATvR4PU+ZFbsTfG95jwDQiMsZBb9vQ4cHNkzmWdH29TVZGp7y1rRrzgpK
         PTXSakC2vfAO5ufwgrceIwgJVx2gBsJ7rfanb/EZTw4Qfv2aT2goe7H8G45MdycYqFBg
         UMCwgkU4hPSTCK0LMaMpAOf4qsYlmga7uTfG8Sna2M8F8JM1ryaf7WWqBEL04elHx0sj
         iLA0S14yTYW+RQg9T7yk1PlEnYvPZwmh3aURklViFOC3LZgPIzgstqz5DMxTkkH7LHaQ
         umTbneZSnTcl7z7OrVnMYvWauRFqthXm81AjPBWP4UGFf+Teo4BarsiDZG2tbIPrKnq6
         YL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792461930; x=1793066730;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcglXXCdLJZcuT0AS+TO6iQYBvNu/3CXXS4wmQqIQX8=;
        b=iB6+/MprOeZDvbkKNJUfmDw2o3R1aPpC058CdlX84nW1zjfsdTGPtlEfiHtVTJZ577
         orxUAMuml51MO9VUD1aJEGx+1iIhIwLmO13NAqbcLwi9S1OKjIeK3qeDzb2xJXfyHNFn
         Jn5MtHzPsnlcjFegq68lPELMJ85r4Y5DF1ZqxFuDnQe/7nSrK5Mz+5JFMQ0U2r1Q5yL6
         lJYI/pl4l4doiozQtYmMZMuJRIdkIXGCiRYrm9j/ex3+qBlOhwd+PiYtIsIWCUxIph1R
         FcJxy6jgHXpntscVERu1dbZDBeieu3sDQjm0rUlJ5aoBMEnhEXJU+SIl+vmVTrcGC07I
         RfMw==
X-Gm-Message-State: AFq9FYKrUFsJdf0qgQtPSb1lMJ1zZO0iQv59LM5R0RSHenvjzIK7xfUM
	2IYVNWak/7d4b83BLBYfmJr6OwAP2DrS354rSx8W+BabHbZcJ3qB9n0XFl42hVmBsb5XmvAlezp
	nLrESlRscoCqZ2XuCfdwlGzsIqdW7bfhggIqQB8OfmfIFlEu+8QDSUQsJOZT0hvVx/Vxv
X-Gm-Gg: AYBFou1wDQid7yVW/ShNzIR7zCwPXRf1U9kn+yUmFCoV+d3hU/cW722T4rn1XsfJNE2
	KbpCpEuOx05zSGJXhupGbZoS6elWcTARohtg0bcYqmeH8JJX9bvSnQBaDC07BYJSvhDb30ocvDv
	KezOmwJid73Y7rfzx3yVO14XpGtrETExCsGSYvVmd6sXpHMJr7K9tlcXwNG75gdkqpDpaLwseeu
	dEz9tmO2+NprFME4iNL47wqO2FS8hkdb5ZDJf1yh7nWKncTFrc9jZ141/EeF5NqfR+TBYdnNC8o
	sspPi8YfFXAsJZ2B2lxkKjffxZuh8RNWNRyfHbyhN5+/mcqB//v8FvKEYlmwk6UBKRkGSTiWgJC
	SVlBpEJxDn1rMjDVZLfjdxYZdPumNa5bXD5Q=
X-Received: by 2002:a05:701b:2918:b0:18d:5988:8d3 with SMTP id a92af1059eb24-18d59880c2cmr1634916c88.3.1792461929312;
        Mon, 19 Oct 2026 19:05:29 -0700 (PDT)
X-Received: by 2002:a05:701b:2918:b0:18d:5988:8d3 with SMTP id a92af1059eb24-18d59880c2cmr1634870c88.3.1792461928590;
        Mon, 19 Oct 2026 19:05:28 -0700 (PDT)
Received: from [192.168.1.235] ([47.231.130.140])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm36101206eec.13.2026.10.19.19.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 19:05:28 -0700 (PDT)
Message-ID: <81aa3d0f-cce1-4f78-9610-67815507bba4@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 19:05:25 -0700
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
Subject: Re: [PATCH] media: qcom: camss: configure C-PHY in the new
 csiphy_stream_on()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
References: <20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com>
 <a561ff9d-eb2d-4097-ae66-c1857f33e42f@oss.qualcomm.com>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <a561ff9d-eb2d-4097-ae66-c1857f33e42f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KW2owZJOYQmOX3I3JNmBupKYMJSLmlEB
X-Proofpoint-ORIG-GUID: KW2owZJOYQmOX3I3JNmBupKYMJSLmlEB
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad6cc6a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=TcmD64HtHlR11PSYA/r07w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Ra3kV2IsKW0ovCRCs9YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAwOCBTYWx0ZWRfXwogilj2HFAip
 WPqJD0MBpT02mt22wn6oN6M/9ylaD0GLnx90hnwlYoorfUOSy2yezk5amOzfI/9NjuEJObLHWxp
 sbnnxJZ2i+O5G1Q+PQRJdx5FBURq3FcTsSBc6+BDUr+Db86UNVHeN4aOxKu5pxI1br8tzfUmOow
 s95K/BPj3ePwlGOln8x4cvshSQ0CDwxJSrLvZyFRu6VelbtBaNBZJ4qgh0bQZHu5N8+nMUQWvzC
 pOEQVd+q17YCFf0jERHz6+/f5uiPtWIqF5pkvmmMZ1K+o9dYlloEaB+rwxLBU693iFsQnuGiyHi
 W3XNbF013Zt5zYJit0d4cxpcKG5Jarwbi/+9uFHdagfJhA5o/7LZ5VkflReqXg3Ff+Uc8GSWZgw
 ADhJI79cU1zLyB0BJ8iJRsBH9DwI1dRN5FsYotW9ka/qePhw7bACwCkT9MBmu6gEHBc8tYnT5Hu
 /kYa6Eeva9LOAmMSVdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAwOCBTYWx0ZWRfX6U+0Zlr9mNIO
 OSHwFMMBWq3RFAU4sl7ouGU2OxvPrYJwlnFNHwjZW8CfPxwrDFf3NF5kwjX5Ukpz/2UYCTKwMtj
 JRmE/e5Fpaf8b2ho6qWd7vc63xuaJTU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200008

Hi Krzysztof,

Thank you for the heads-up. Apologies for the noisy CC list — some
internal addresses slipped through from a prior workflow. I'll fix this
going forward.

I'll re-run scripts/get_maintainers.pl --no-git-fallback on a current
mainline tree and switch to using b4 prep --auto-to-cc to manage the CC
list properly before sending the next revision.

Thanks again for the guidance.

Best regards,
Anusha

On 10/17/2026 1:07 AM, Krzysztof Kozlowski wrote:
> On 17/10/2026 06:05, Anusha Arun Nandi wrote:
>> The new (non-legacy) csiphy_stream_on() introduced by the PHY API
>> devices support only built a MIPI D-PHY configuration and
>> unconditionally called phy_set_mode(PHY_MODE_MIPI_DPHY). For a C-PHY
>> sensor this makes phy_configure() dispatch to the C-PHY handler with a
>> D-PHY opts union, which fails validation.
>>
>> Branch on the recorded PHY type: for C-PHY build the opts via
>> phy_mipi_cphy_get_default_config_for_hsclk(), populate the per-trio
>> lane positions and polarities and select PHY_MODE_MIPI_CPHY; 
>> keep the existing D-PHY path otherwise. The shared
>> phy_configure()/phy_power_on() tail handles both.
> 
> I received multiple patchsets from you. CC list looks really random,
> half of the addresses are some internal ones?
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument, so you will
> not CC people just because they made one commit years ago). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> Best regards,
> Krzysztof

