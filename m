Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597665;
	b=QFeAd7aspJKV0E8UcRKi0SjeTu6E7MlCiI8o2ruO0JOoKm88lAdSbmGa7lLIoQxaujns
	 A4PUFa2d5ABuFj+Bm3GpTQEMZy3ejDQD5OTFxf9xztiwjk8QEglnB/4wgudyStQ/TKCpN
	 1air4D+tBupvfAZAI3GtUiOPR0qleIQdiGnPzLDgNlsmWY7qFmu9GzlnpKwEumVR83XQ2
	 w3KtRgqocArF/CgDxU5EQ3p2py+qhDBx//5k4qeHO90nyB1L5JvlqM2ksVTlQl/Vl2xWE
	 Q4HT7lCf/voSML9W7OH0cP2kCw8DPYm72DLNoJaj/KyI8i5dvufSRpoKtVaf6T3/7LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JbFjtNWWTKC1BbORibQeDjAoB7n26eQHzhKA8Pohz4w=;
	b=jXbk5lKN/4Rnmv8jmKX/Z0cmSdIDZ770L4Hib5JSUKIFzddHOoK/ZrZARjD/So27TSi0
	 SMzNYv4V1NjA4Yrq/N0oBd94Li+W/0LHiK1lp9xJBKdvrhtDetfraHUJ1XQShiz9FsqEm
	 UNL4LIr0eCeOlgU9AX93251l1dEqGdbnWp+lCjcDRXnt8x+JuC8iiFt2iQ7lqp+oReMHE
	 yAh5hir/hNx03616Vk0h2IN4jbOgSeYGJsLOlANDFqM7YMj03jmK6vKwmcIxDBt2WRRLD
	 6xp8GrTPZ+C9BeaUDbVZydMwP4rn+gUcldn86U2+HoHLPO+YBDMljvnEcCim7RVSA6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fNVD3cgM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MsFTBxK+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F96B606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F96B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fNVD3cgM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MsFTBxK+
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68ewg1617088
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JbFjtNWWTKC1BbORibQeDjAoB7n26eQHzhKA8Pohz4w=; b=fNVD3cgM34B4gPxT
	E1UqbEwqyXMf9dZr+DGGozrZkWlcFONDD6cGM2JkGYqO9/bN3M64ZdxQ0+BARvyj
	XoczQLcRZRSqn+nGcdiYOg/KuvnLOs/A5sYUb5EN1z7a510KT60lCbOn7GoXZcTM
	TaNhZuaFdGpMdGaAXxaCim3lSN79hRU2/5mecKERJQ6sCXxl1ROK55hVV2D+g2ca
	qIQ/nu6tJB2cDnftA/Soz6CN4mibqYo27PkPA0wjIv1AjWioQwjQrjfMzunBsTlm
	nSnrfn2azHJTxjYXLnhEbnacrUKG41A0lu9e/jLl/Lm0m/Tb9I5vEK9//y48285x
	IVAu6w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5effuhqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:07:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b45655b428so4557686a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 01:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795597662; x=1796202462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbFjtNWWTKC1BbORibQeDjAoB7n26eQHzhKA8Pohz4w=;
        b=MsFTBxK+83n2e4QMK2DxegXkTEhwoWNmHziRSIbPClvRYZBQRt7LTJXpncT15ykS7h
         boW2Rbr1M5ym0W3/LLMUJW4Nhr2LnJ61hXRQgnRq2wUYgH/kifxjulkgAWSdSiGugHmv
         zxSxI8QahQQ2IK1G0BLNFZn+dV/OsDjfW+UaIoC5hz4CqChiA/MAwha6KBBo0KY/Y6Rp
         EDfSD+YecsdgjFFsxpEnCofJLw1Yjk4EWOF4Wnm/1aVryCyH2PJesOTlG1Hj+w/Jh5p+
         RQXOZL35kb64lDMIbfyfDWZsjBvntp2t10z5IkFNMOuevcmr84tESXeAhlF56VUUKrmG
         k06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597662; x=1796202462;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JbFjtNWWTKC1BbORibQeDjAoB7n26eQHzhKA8Pohz4w=;
        b=NfaHDImSXtCyIUakDtgSiONFVn85AhYQnn94p0XnVPZw2upKnRrJz3Ba/1GYxWrzu0
         i/Ecyn33paNxhHBANZVWpKmkl+4nl1aOt/ViSFjKvEJUJiNlKDJFGn2IX3zMv8BaXEt6
         WC5oz5Z1F2v3VSaksqPna0mc13EMUAhL1LYL7OLm9EkWaIgDHLiNKiXEaxUUmPjL2Fim
         JWMtV7DM5+WCG9gyotN8DYmXQnT1n5QUQ3wtXde2iYba0zBEk6j/mvd/4Y0k5rWI0nLo
         CuUEGLAoC8knaBG4FdokwdkqiwKIkvj0J+3Y8Mc3M57S8XBavsE9RiuXkK0HscU3wv/3
         lK8g==
X-Forwarded-Encrypted: i=1; AL+hErHyhX3qDdgaOuk+8rCPagdfaSeYxf+hyLQdT1Cf+jLbIXE0PgGxdx+DZWXSoQRdCsL1GM6DHg2P7hf4C/35@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZI3TvbbXmD37EIqwNgBwnFfS6i0K3r0prpkdHptu89zwBAKHi
	6C6Tv62H6vXKbMItB2NvO5/fv/LaqDO5mQGtcMOBzkplURMa0LIlE0r8iSKJjjV+LPSHVWlm8Dw
	P5myYZ7iYIqDMAWn3wJ7vtc/G5FX8Et54xEEyalTUeuT8mLYjMrxdJVIEO1/GKgYGCzqs
X-Gm-Gg: AZFdTZfQ/7C8rK9/c/jv9hsqzlLDzIjhweb5p4y9afSkRURQP1+GpA9IDXRt5BJOtjZ
	3bjT9nE8d9N96MAkS7G7kIU2XeMdJOuNSvQ2wMtiRYcmtQyhjtoXU2vQaXUsO7ywa/wm5n0LjHR
	/GY+wBe/RIyDvo5i0FrX1QAJFcp+v8ViKN+9bJ2kcdW/AcAtXZjW28HSLU0O05A0ve+QZ6lXWeu
	rxfgTdLYn7mWbGPlGDaDRj/+3wsYgZG3yEq3ymoalaP425WeOtEF2XPAHeUzHNxdqveHgjwHYRz
	6FoiGHo57PvhFzwMgx0n4PmSVAr2Xeywri21rl4ic3xbwp78ilp3EQAoI131qd1vl8oM92crxiv
	w9V8acqBc0eGtriIo7rfDTZbZ31IcHsFm5nRkBojKxJnd48frSrWycpyiZYynrVTI7Hvw+FtYBs
	/3
X-Received: by 2002:a17:90b:4d89:b0:3b4:3c33:3e5d with SMTP id 98e67ed59e1d1-3b43c334caemr8256635a91.67.1795597662547;
        Wed, 25 Nov 2026 01:07:42 -0800 (PST)
X-Received: by 2002:a17:90b:4d89:b0:3b4:3c33:3e5d with SMTP id 98e67ed59e1d1-3b43c334caemr8256260a91.67.1795597651179;
        Wed, 25 Nov 2026 01:07:31 -0800 (PST)
Received: from [192.168.1.12] ([223.230.5.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm25769550a91.7.2026.11.25.01.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:07:30 -0800 (PST)
Message-ID: <42920cf2-1587-47a9-a53d-d604bfb22b76@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:37:19 +0530
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
Subject: Re: [PATCH v4 23/25] accel/qda: Add DSP capability query
To: Arnd Bergmann <arnd@arndb.de>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Srinivas Kandagatla
 <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski
 <krzk@kernel.org>, rob.clark@oss.qualcomm.com,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
 <20261102-v4-v4-23-88f2f24a5f0b@qti.qualcomm.com>
 <23d04f27-dd2d-414b-acc1-27e46538bfcb@app.fastmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <23d04f27-dd2d-414b-acc1-27e46538bfcb@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eo5KXYpX c=1 sm=1 tr=0 ts=6b06a55f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=7CQlB+x2kvO/AZ184d7fkw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Uvs7DDoz1aZytBm4-AQA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfXw6jarT8FySak
 B3dMiO12V2KzeRMwfH8XqGGYcc/dhK5etlJ0cGkByXUjYmWVPS5PSqvRq/ROHDiLxlGpefSldGx
 loM3uN6TQM7XIFOYCxtnRIr2od/dWcyOFM0KwIz0qVMefN/rQXSONGn5mRdfUZzeOe4AMsIZ3/p
 gEXkUcEHLoL6i/aiZp0Pssmlv2maiygrJnufj+4Udcy4xoLxJXjl46zW1W8gFuZe/fawwXnKGK4
 81gdy3samGphCdT6R0XfcOQulKXxO01BMsVYyYSsTdmNGk4dDBYJZGtBILqctvUKimQ2pCKGlYW
 Z635CT1YAO5pTXlH7lB5FDx1FY7pVqBMuAJvqaAmjLdtqfTsKGuKX47xTGNwXw82dcUm5w/MWeu
 /0XSzLxiMftUkRzoHwex5OPVqs/7LEgOlfq7fQId9ACjsYNKhKDalSXaWoA0US2+8YEfKXcBCfy
 75HU1OU0a2uPvH0Jhmg==
X-Proofpoint-GUID: TtPWXg6ybP14ja8fQLYOOYAY5M7ZQOIz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX6wqENZn9KSNn
 dfEw3hPB0gQqBDt6sHYw22uw5r1PovY5yjx6ocsTR53F75vIxyARFweiXRK9Wi91kimMqa+SEmb
 1yNfaB+Z5HoG9oclZQB3LI/aNxkTBTI=
X-Proofpoint-ORIG-GUID: TtPWXg6ybP14ja8fQLYOOYAY5M7ZQOIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250036

On 02-11-2026 14:16, Arnd Bergmann wrote:
> On Sun, Nov 1, 2026, at 23:21, Ekansh Gupta wrote:
> 
>>   *
>>   * This structure is used with DRM_IOCTL_QDA_QUERY to query device attributes
>> - * based on @query_type.
>> + * based on @query_type. @dsp_name and @cap share storage, as only one query
>> + * is made per call.
>>   */
>>  struct drm_qda_query {
>>  	__u32 query_type;
>> -	__u8 dsp_name[16];
>> +	union {
>> +		__u8 dsp_name[16];
>> +		struct {
>> +			__u32 attribute_id;
>> +			__u32 capability;
>> +		} cap;
>> +	};
>>  };
> 
> I think it would be better to make this separate ioctl commands
> instead of a multiplexer for each thing you query. ioctl numbers
> are cheap, but complexity is not.
> 
>     Arnd
Apologies for the delay in responding.

I'd prefer to keep a single query ioctl, and likewise a single
SET_OPTION ioctl, for these reasons:

1. Precedent:
A selector-based query ioctl is the established DRM/accel pattern, e.g.
DRM_IOCTL_AMDGPU_INFO, DRM_IOCTL_AMDXDNA_GET_INFO,
DRM_IOCTL_IVPU_GET_PARAM and DRM_IOCTL_PANFROST_GET_PARAM.

2. Extensibility:
More queries and options are expected. With one ioctl, each is just a
new selector value. Separate ioctls would mean a new ioctl number, uapi
struct and shim mapping for every small addition.

3. Safe evolution:
Unknown selectors return -EINVAL, so userspace can detect an older
kernel and fall back. I'll also keep the struct size fixed (padded
union) so adding a type never changes the ABI.

To address the complexity concern, v5 will document each query type's
payload in the uapi header, and fields unused by a type must be zero.

Thanks,
Ekansh
