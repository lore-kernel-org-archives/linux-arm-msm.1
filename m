Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608820;
	b=urI6HeI9zdkcwIAOAjcU8Fwuq18ljiebvcIsBHtBY7Pongt9V31N8juZIbUQdZlI2i30
	 hiKnejWp7kNLHfo4PoPlAvV/KouBJhd+DU9cIRL8JZ82KEHPryh196hzrp+z/L0t1aKcI
	 SAx0oABzIm4cdlqUZJ/aKvafWTlMKxHoTkgGvFcavhKSZTXZsXX6wFve0NpoxYewtAokF
	 wDn1r2hvXzgr1NR95ei3gblymCiV/U4TVyFHE5O6WrZXg5nt5bUz98DTCjKd/vHrDjfRf
	 61Zf9GphX7lXf4XuuhVH2z+XMO/BY687p0w/AYzfRQpcnPOU3PrUjlHwSfFYlHZ5J0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608820;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K6ogSbk0YvyUylVZr4CzNwW3Kja2pbrugfWzt4tBuZc=;
	b=pm9nWLRd1B4YlgAKNa2TezD2zmYzv6jEnum8tlUPu7H8ItXXf353pv6GkKzTpgEy4f/j
	 wpM+jEVZMb/FQxLMXeT6LgVBw13EOcJWRLE1r6MOW4ze/o73q4TTX4orP9Ll7zVLhJixF
	 UeYCxr6klij12LsJN6pZUo3wAJbwzio9eVnwVfXoq8L6GDKLdCxR5gauF9oSjLMeLmn0J
	 xEUkkj5tIDM/S+J/37v+uqxPsTT2NbVlbt5bbtlGv0tMiqwxYTC8ReSkUo+WpOzGlDrg8
	 Mp0Teq+0klEBxMNSUT0DZfXKLPGp/h+0T3NTYjmKW2NiMacxBPrMjEojM/dPCq6g+zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iaxwUrVW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e3p5tb47;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783C9606A32C
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 08:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 783C9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iaxwUrVW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e3p5tb47
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A27qdOM3862931
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 08:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K6ogSbk0YvyUylVZr4CzNwW3Kja2pbrugfWzt4tBuZc=; b=iaxwUrVWDGpR9G7m
	KHrqIv193A+yxzKN5AoZy5ZAyieB9I3E3lhWPp54Bt/8yTSYgjpB6jAXJJkIGz1z
	cHcN5gA1XljRc8by1OyBzW3IYw2FREqbSCq5JUG8CmG0xYbKSkmkKwwnrLpfyzWU
	FQGMt3CCKtsSytSMlHH+OI+acTFa87WlaEjn+cENDPlTAe8lSEecgYm2vzHMUnUC
	R11sqpT/n8E/Y2wdjbi8BlODrDOP8f8rRf4k+hk7GHCZEDHrfGv23OwUH6xiXpWa
	GO5ETvKb/VqiVkNXoLpgCFcx6O8hnR3M8goN1Emz478V1HBkpUHPAOYPezYhR1Ul
	fKibnA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph186bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 08:40:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536708d1a3eso4439611cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 00:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793608818; x=1794213618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K6ogSbk0YvyUylVZr4CzNwW3Kja2pbrugfWzt4tBuZc=;
        b=e3p5tb47gpcFXoOi3whRfHe5/+7zZKxosWm4o3b0Jz71cLX7P1N91f/Tj2VKJgXAlD
         33bT3uXyYBcjmYf5fqy3vu3sLwM7he5gkwLoLK7kAafGPj8qxcWTFEN5/6Zgd30AA7+f
         AMQj2pvdAA4lrHXJTHirIh2l84WJHsrgLFfOLA9zMlKwrKDG8ybJ/P4zfqkqqg4VahXj
         4r0SndlCVjnTf1GfOfxiy0lxxqvsdBELhhX24A9juGz/DD6Xq9czKyDzt09nvaAHDyS1
         gVvdwckhBDTc5kHjIwFVNGpGd6vyWtg0/TmPFdgLPsIS/BAw0oafxmYzP2VzyYpXx7s1
         xKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793608818; x=1794213618;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K6ogSbk0YvyUylVZr4CzNwW3Kja2pbrugfWzt4tBuZc=;
        b=CdEFMUzMWw1vkA6SHYX1mCbwBcrq0aHx4szLAozidgVU3oEuq4gplxTLxdxp5T/qlv
         5j52Bpk2mxvNDZ9V7PmUvUaX3aoK2vZXwHFo4T5f/uylQmhZR6OXLn+ORoaR5Yq3nfnJ
         83+1oxOTvOSein7ndfC76h85qEZO6hbgdQRNgty6dLGubsCd+ZPvQNep5l6G3SEUfNYo
         0bzsr/FWBDnksdmPgJVFlVVbWnR9hSvfmXit0fbMf0ZgeHTFRu3mQEtyXN7p9AW3tsFh
         +Ewf+h7sziJso7AGL35HT/FSjJEDOcWj4UnlgqjnMLIDp8OOgXFQM1B95MlWH+mrmllv
         Ud3g==
X-Forwarded-Encrypted: i=1; AKwUvBy/74oOaCoqoRtf9FJ+llplz3xQI3x5p3CkBzyPzlNBKAF3HFFS+E06jwh2F6ZeqWI5Txvgz7+OQQYolfwN@vger.kernel.org
X-Gm-Message-State: AFq9FYJtfViQiSP/OgMfdNB7yNVbjT/6gz2ZV6YgFi74yYpW/LNnVP4K
	LWCRCaZuj1w1E8KU4lfly7jEflJLsiDzjnHyFduk1OWXQwEgtwMix8v8KnlYUE95ArHgpWJpoFn
	lCCK8PbNa+RLzWf5Bd8zR+2lAtz+oL4G2ZmeZo/um4OsEB/B8SX+upYRtw6lvZQgBDmAo
X-Gm-Gg: AYBFou3z99m7uBkH2cWUAyUnc/UVLJ2Wb4XyG1FuIMKe6PFOseC/cZ3R83rojaifHVF
	rlK2vevzk+dbwqTXcQ5VFYD3vNsHVdJwBCdkUmOEHYqUprPZbvQNxyNWf2OiwWW/F94D0S2RqNo
	YCK3qT0Vb3v7EQF1GESK2h6Pf164KXGYvql+7lrjwGnrsQ9xm5jG5h+8mKVaDIjRhnnt+h9Jhqd
	3ZfaayGQzMRaQkIofGfHW2TdbbShMz2rXGxz0xOX8ujdytxKYKSQoszAG3Hy7SN82QjHzhGXZ8h
	R8xIp3DBPWZQXljfLpqP2FDT74Wmv45S+cMVgryLS3lsEoRSeXE/jxC8T6u6tn8bqCptDgX+bam
	vXhOp4289X0cK4WatwFJYEidzm+2VXpy2WQkdAH0ZWy2lKEunpOJqCwwjvrUEVOYrN6uyXAg=
X-Received: by 2002:a05:620a:a8d5:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-944214c4e2dmr1550671585a.1.1793608817427;
        Mon, 02 Nov 2026 00:40:17 -0800 (PST)
X-Received: by 2002:a05:620a:a8d5:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-944214c4e2dmr1550670185a.1.1793608817034;
        Mon, 02 Nov 2026 00:40:17 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fcd6fsm2945801a12.21.2026.11.02.00.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 00:40:16 -0800 (PST)
Message-ID: <719ca9f8-85c2-4d91-863c-849d38559447@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 09:40:13 +0100
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
Subject: Re: [PATCH] drm/msm/a6xx: fall back to MX when gmxc.lvl has no levels
To: Tyler Baker <tyler.baker@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261030192014.694393-1-tyler.baker@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030192014.694393-1-tyler.baker@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: X0gxCORP5V20i5y8zfb2ZfUs9L-joetP
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae84c72 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nSTmtbGWhtfu_40JH2gA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: X0gxCORP5V20i5y8zfb2ZfUs9L-joetP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNCBTYWx0ZWRfX99615s59Pfiq
 ffdKQDPj5ja7xME03fcq5JXTykaIxzRkimcpJH9wD37yhNasugx/0BXjyLc9NOP5aOoC/4og20y
 Vs2e3dS587MfUGxe8uts3oR+H9+eqH1AC5GUZo5EMGvOH0QNZqpiUsUysyJ/+OFjlxcPpaWeTLo
 L3PY+xv7zjZk6zI7JE5eCWsQIKmq7UqTCSOq3n6HypQ39fJXAsnLrLZI65I47mfl1isCvbip92D
 NtU1a1YNMteLLVwqFeL6JKtqmu/R0+zru2oJWfkG8y21wF9S5JrNctanLYTshdHfs6v6Pc3pXEG
 NZeNCpPVNBqfBO/meFr6FP3d/kRTSLQpxshICoYadBdqXMuIqnM9ZQGDMQp328hipSeSc+zSNV2
 7IadZnT93bodOFzxktVj19eEaUZyvg/4Dpebks607lYZK18kLt0vEIUt6mJMiZ7n1dqLUi2kCGZ
 IKBoOuWTkSHd1RJtDgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNCBTYWx0ZWRfXxF/yPiv+9QY3
 cO9HWrXD0QLxYKeqcONdciukLCHqWWmjdxZCoiZdFU9bVXPdUXSfu0IJVLA+zVAc3YLzjazONXp
 npyVQ8cBi2NhF/RWOZYdlcSgpZN5RiY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020034

On 10/30/26 8:20 PM, Tyler Baker wrote:
> Eliza's command DB has a gmxc.lvl entry with an all-zero level table,
> though Eliza does not use a GMxC rail. a6xx_gmu_rpmh_votes_init() picks
> any gmxc.lvl entry as the GX secondary rail, so building the GX votes
> fails, a6xx_gmu_init() ignores the error and the GMU gets a zeroed GX
> vote table. On the A722 the first GX_BW_PERF_VOTE HFI then times out
> and the GPU stops responding. Before a6xx_gmu_rpmh_read_arc() began
> trimming trailing zero levels, every GX vote silently used level 0.
> 
> Read gmxc.lvl with a6xx_gmu_rpmh_read_arc(), which rejects an entry
> without levels, so the GX votes fall back to mx.lvl.
> 
> Fixes: b5269bf0e1ad ("drm/msm/a6xx: Factor out RPMh arc-vote helpers")
> Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
