Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1758A3563FB
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 04:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787200264; cv=none; b=VgBAHHfvDKuUumBL6EXBiPdZbw4ewfTPAMBVFFSsNPZZTVwZQBT3nApD032S1uOpax217EnpAxEG35b86NN3lE5Zr1X7LHZKisfGGyWObFYxtU/j2kVs/mcC8EWJCioGzU7jfU8+er0HQW18poPNVN/H5m3eVSLgv+9feHtBv2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787200264; c=relaxed/simple;
	bh=ESbYeTT6UZoLxLRl60FYCX5yiloJI3i2RgClfxdS7DY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=khQClelAVmRXRfJYUEoRMNvVA6JdaCr14gcS6y/bvUJYvVeDz4uW9IUP2Onr9+Sbj8UiEgtqiREzAORxTizSTlHvTtQoXf7zyPgYula44+hT+ZjJrcUGmxKq4BLV9vNacp7DnD0JgelI4RqSCsByRdXgzqkiHPf5XsSPa3b3g7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n2k9h9lD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LR64wqad; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n2k9h9lD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LR64wqad"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JL8IYN1777748
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 04:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	frKQRZUt2a/hKuf4txBejBfHQwTIXAlTZS5704pYNeE=; b=n2k9h9lD8Uzm61+4
	sEva0nvpAsRJWrXOdr+J1+P4jqaOEnkCScuaGIqEAXJvb/EEi6FAH9i2yiYnR5Zo
	krcJFAjEDYTyE4YFPNdttSK7THPJ6XvgM4XBtes0CCr7/7bYb8M9PKd5JtMhq9mt
	zRyxa7CODZTBpr3aQl00AyNix7kM/tSLDfprx6AIKYuzJv9hG8IvfXmv9Nd6yKEB
	S/8Hf2cJHBeZ92D64OkzYGTYyuBWcwWpN8mclw6xRkNohZq9QThOrtqGCE+saDF9
	QvR+hBr2GDFHjTJKtaOgv15GEXffyaVOnyiB7+m1zpWGWGO9mLqKPlUEGa0YOWIp
	WGmMAw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es3k374-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 04:31:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so2491978a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 21:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787200260; x=1787805060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=frKQRZUt2a/hKuf4txBejBfHQwTIXAlTZS5704pYNeE=;
        b=LR64wqadqCUCjf9nZO5O17tUoet1Bsm6yuRw6Dzf6TkL+MJEiV3WJkBVfOLoyuKzol
         g27gusStOcq9+CvHj0bmtnx1DC4s2gXCnR8V9J6qOWM1RMorE61rYFbhlgr4Nm6/QMMV
         fw4HxhQUdJGtRaIHOfmJZt3T/FWbYexLdtZShJIeAUW+AEYp71RA5b8akRY6LJ/i1ZBA
         IJokymyX0dnA8e8rWGyUXIyw3PYuLHHUbP19eRI9IZR/HSMGRNbKazrCI+Kn/EV4rI0/
         oL78jbfcuZvRKi/hA34vo5aZ+7AhukJEbu/OZMT/ujr0QWJiP4CNDtx+wvJ739HKoouq
         mtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787200260; x=1787805060;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=frKQRZUt2a/hKuf4txBejBfHQwTIXAlTZS5704pYNeE=;
        b=NzU3ceW65tTkLdKtv6LJ+UVuNlx/08cY5rVtnU3P88zQcMjwc9WFGBXPMJ8EHCozzo
         L81OMMlw2H2GIN8g1u1uEEBXN2/9l8HclElwyLIkEPF60ZADiw61cfVvjcD1COo6rFaz
         oGhIVszAqFaqqP9CYFjZLbC/qK2IxVbkk0D3L+yHcdMhmC142kME3AxEWErEu5gXxIjN
         A7E8nqeb5H1Gis9Thu+BXbCfCw2vp4hB6Ys08XWUhBYmqMdnuTLvpjThJzJcGZhXxcxS
         amlUEzCYJWJaK5tVOs/MRkNdiXfGB3HsyjSgms/G3ELKKNz6d1S042UBMCBLsznWvda8
         cd3w==
X-Forwarded-Encrypted: i=1; AHgh+Rqs50SVLeMVbYV3Oq4EvFBpjtxcTvW1VO+V1P6PPpA3Q65KNOm8Xia/Rb1sud9DtSU05wo/NMy/cGLIeRPX@vger.kernel.org
X-Gm-Message-State: AFuF++kzyHrnD2ceOKieBy7FOsil4yT1hMBBfQKZRwQT4UrKYSPKgXfl
	EQD6o6bnPmRq2+Ii7n1/awtzqo0sVPbaERLML+0QiWWDqXjXSggwLqt7RfSjS4KPxdguIB5d4Ym
	lPvvp6UhgFU+rK7p9YC1tvUhRpuMWiMaZeAd/ieIFjA+eKzT0ZQvcwsWz2V3BewtoImfa
X-Gm-Gg: AR+sD10B1i/fL/zLrJt8orLwBNbtXiioFN2TNFgUImcoDi7mAFmxv2RCcVwxaz9Qh5i
	Y8hwD+dr8Etxw13e4O5wiMzSHWMP1kzBwuEWCO2Aq9/5p6A4GN+U673oGmueJgdLHx5Uziy0RXq
	Vb6n7XluGp/MMQBCDqHhFrl4cyJpifhTKXoYMiszhhBnb/zhsg8INH769EjhRq415KV6saH8Y9A
	C0nvTVYgjAo2dRGAOaDLh/GjYnIPHp/HL+Tu2QiRr5kGGFB3FKgEmEEyY0P8XpBMfUdKSDGZag+
	knekWAj1LAUXv+6ZJPb7I2SWx9JMEPIJobu+H3NV/9AgItN+dSNG2zwaYnIMP8AwnCyLR7h/ZB4
	5qbl4oSdkqz31ZyapGpNWByAiCdfDgg==
X-Received: by 2002:a17:902:fd8f:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d5fd5cee10mr198915665ad.4.1787200259911;
        Wed, 19 Aug 2026 21:30:59 -0700 (PDT)
X-Received: by 2002:a17:902:fd8f:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d5fd5cee10mr198914735ad.4.1787200259383;
        Wed, 19 Aug 2026 21:30:59 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d58a897sm1806855ad.27.2026.08.19.21.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 21:30:58 -0700 (PDT)
Message-ID: <7e025cc8-bdd8-4247-923d-821089a8457c@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 10:00:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] misc: fastrpc: avoid duplicate DMA mappings in
 fastrpc_create_maps()
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Ling Xu <quic_lxu5@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, quic_chennak@quicinc.com,
        stable@kernel.org
References: <20260805060940.41414-1-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260805060940.41414-1-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UIrt2ify c=1 sm=1 tr=0 ts=6a868304 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CeeczvWzjZu7FbgsozkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDAyOSBTYWx0ZWRfX6mmeEm6gfRro
 JwO7I9KNSpHpI/ErkAj1M2E0doyK84QWJVsFouzyt1t7SEa5Oe9O1/P2QMmLGlGnIhynfmvF+d8
 2IBNT7rSUR9X042/7uv/vshMnC4oqx4TV5OuiV1uNX0kKIAni4hco2WMXwWUw7wtqIvZfAx6KJL
 0mgmWRYqpYTfwmgrm8s4YxadXGTtyt5PMe9dWKClepkU/+1dPYiuXWSDyEbDVv80hDhK9D6kFi+
 MXIM1kS3X4xKgFvdedHpwuR1DxcU/0WXSHjFJzG0ARj/dHjrbSQeHAG5eqTB/md0jc18y8ahrwI
 NngwhJiOqfglT/lpwharoRO2xjXPMTS7z++rz123jivDRu5l74DB05iw49xnE6OiHfzwsRj1XL5
 nh4ryx/0lNkVI/P3+nao2m+EnYrzFquEkik124igctG3IZky/lSbRIYzs8XG02/DEPrk9PV3UnV
 KnhnCgHKSUlO/3HIJUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDAyOSBTYWx0ZWRfX0+hEpp8WzMdX
 RT00w9IDFbZMfSlM8a6UoJpg/17FR+G0aj7w8UwJmegIU9Fp34s77DToYBlZFL8joMfeoXHJ7oK
 kHJzXx0Bel6hvCGXA13u7kh+LueqIqw=
X-Proofpoint-ORIG-GUID: 94uh35Pl8mXMj-CT2T0-nMqp4RBNrEqH
X-Proofpoint-GUID: 94uh35Pl8mXMj-CT2T0-nMqp4RBNrEqH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200029

On 05-08-2026 11:39, Jianping Li wrote:
> DMA handles passed as invoke arguments (scalars beyond nbufs) may refer
> to the same dma_buf fd as an input/output buffer argument. Taking an
> extra reference for such DMA handle maps leads to duplicate mappings and
> an unbalanced reference count, since DMA handle maps are released
> separately when the DSP returns the fd through the fdlist.
> 
> Fix this by not taking an extra reference for DMA handle arguments
> (take_ref = false) and tagging them with FASTRPC_MAP_DMA_HANDLE. As
> these maps are borrowed references, fastrpc_get_args() re-validates the
> map via fastrpc_map_lookup() before dereferencing it, so it is not used
> after being freed. fastrpc_put_args() only releases maps flagged as
> FASTRPC_MAP_DMA_HANDLE and clears the flag to guarantee the map is freed
> exactly once.
> 
> Also reject FASTRPC_MAP_DMA_HANDLE in fastrpc_req_mem_map(), since such
> handles are already mapped implicitly during the remote invoke call and
> must not be mapped again through the explicit MEM_MAP path.
> 
> Fixes: 10df039834f84 ("misc: fastrpc: Skip reference for DMA handles")
> Cc: stable@kernel.org
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
