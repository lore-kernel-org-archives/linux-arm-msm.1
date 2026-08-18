Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E7A199E89
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787032457; cv=none; b=qGRX8Q7TIjU0TmwB5S91rOtzQ9nhJYq/hQNrqnQzEqAZPIL+KARFHGSSCPekY7kYql6k/F+SX+pF+pbiaQOKBAGarGkB9bFD/oZ6KT8EZ1EqXQTE7hdYhWhu4ROtecJX5KrDhUch7hCc/C1x88zoBLUR4bguzGAJDrReCfWI+68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787032457; c=relaxed/simple;
	bh=GosCLyy1/VLuOxPlTGn0Ls10HQdPNBqTDEuKCEOC9lI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UoN1TcpGIgMDj3TA8MpMVIZ//mhAcMkFaY5bxohgIa/h43QrBKG0nce1mdfygCzqL7T1mtIBmW71INJLCzHh/Zel69/ki61qFsUX1jn9FOCEpkkCp+kfQbkZoY8xEaX+qsEuKYrx933N5nVDwZA6gbA0wKdPM9Tb+dRwli+CTf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nrbmFUAA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=btr4bPQT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nrbmFUAA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="btr4bPQT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I4eQvn3464517
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TbCaoRP4jgmLhzxgTcurQvCQNdUxxOfgWCAkLYtazKo=; b=nrbmFUAASt8pesrB
	u6WXz3wMqamtjyeAym9VEQ30v6hrhOpqNHLRXUYW1z69xos7AnS5/aaIr4VCSczG
	2hUyBz7eu41USoVjZRxHSV1xEdUrpHXsUMerp0kOsHW3MKOd8F7PuiLIRmdfdFMF
	tEzdmZDbZOx/GPAPsRbBnqRa+7Ju90vC2pfkQfnj76wXlM+/ZF4vXSCDIcFsbfVu
	ruQQdsAJ8IFCQ5EA450ikk6EUspdIKiobXhzSvQCBGFerd0bZfdwoHz4Hb6k+3mK
	2JmbjRf6C8qC9vAorkSv/A42ODwkMaZRZWjXqkTjUwHinLZysyNdsyl0lxFjjXSi
	MwL3vQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4611ayqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:54:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso7674068a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 22:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787032454; x=1787637254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TbCaoRP4jgmLhzxgTcurQvCQNdUxxOfgWCAkLYtazKo=;
        b=btr4bPQTW7WbWGuVR+uOoJLisz1ii7/DxIOSeHNWtvPVUAp57ce717PTTnvDn5nBUn
         yXdmEe0aaSo5l4VTuHqT2rDLlAa7kh6iHKk+ZpsJiiM2iCAEc6VYIj+7UDClJjm798QC
         NzR5jaaFqTkYP4X1VDHWQpyEz1ygLr4Utp+6Kui1CuU9QkJx+1cQPM1dh9S41L+t6UwI
         hAtH/jwRMAERtKIb/LCV0yQ7tQ2pHbHgtmiSm6L8jkGVyfLy1vOvoBSd00kfE/xqiy8B
         zxphmQzYC4DkLFtxuzKqp55lydUybkLJF2soGjuQ1YXAQ4nX6qTn6caw6HXRQNeDSIY/
         gltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787032454; x=1787637254;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TbCaoRP4jgmLhzxgTcurQvCQNdUxxOfgWCAkLYtazKo=;
        b=sKhZK4VTQE4pnfPe1L5P3fDtbDqixTARaRcaCpvNIw4U33PAgI/1K12evb/NZ9o9uU
         SRjRV9jL1yrF4JOmkUPmy+BsgM6HEqwQMNyfWa3Xg5G64Jn59RP4/2LzfSCbMNrT+tAz
         YOZZllldnHdnrS20IaDkqKLsHXjvzxNJFJE05sgn8vnx21uzzgllYI7/PX4kw0GJCtxq
         84mJ9MyCBMYgNCsB2nY3rWuiDlZbKFs8YxuljKTFWKFO0L/Afbdt/2ozTdiIIslg6ejn
         Se7YVi5c9C2MvT4z9FRhF+maw+NFt1hDZ3rH28nVAuPLBCyJhcetnC9jLJ4+zEYCe3O7
         q+sg==
X-Forwarded-Encrypted: i=1; AHgh+RrBDXq0s3UyaoO+sFfkzCTur+e2p2awUXIqF5b+5GcdhtKpKoNGj7kRuTXTOld/MA80q80DcOi7jH4wyTtF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/kbniW93I+YQ54RE4gsWNQXeQ0ZnLVz58QqiuNSHmGKBIWLY3
	Mag1ebx9Dxz8gOX1xUQqZ9poRxh4f2iY7f18CzZ3OQpcsvu/jbcDx6gSZdaZt5pEnEVx9b7z91X
	LnTWx2gOCNVpMlBbv215dy/aZIZeMJD6EeEJmm5KZ5vIKozIWTr2X7Iem3a3kapGznHwd
X-Gm-Gg: AR+sD13WeBtEVJbu/TfGJdlcUk/BaTjnX5k22NV2/XJvczgTAUdOy71Y4wmv2rJjCSR
	YuIPLyEwtnajHePbRIAlfyjTvnWeFZ2Sh6gpsnhQwF0pgcaoTDvCmRykOftJJYg3DUicupjFcC6
	xJ9ycmoAvOifp9c/eqYzh3LAb7oHAVJzoiJbuTiRocfYMxwLggQhDjR/YRhWdO8wfVRJ19MOEqE
	7eC5Brseu21L0NFGTi+ZQ8x+HLnpyOmACqzwmWeUCJEdv+r2zKP/gswKFdkF0vwtFovBf4sJ+X3
	/gPe5NcH+FrlyhDockxwQSNYLLKt1K3Mfs1ugSnzwaDWwRXmwQHgNAyXk10fIOmqiyoYTW4AGs5
	/l2Vh1Y1ujzlpad6SRqGFyHv4mah+uQ==
X-Received: by 2002:a05:6300:141:b0:3c8:e10b:7a9b with SMTP id adf61e73a8af0-3cc71b19c7emr37663914637.16.1787032453946;
        Mon, 17 Aug 2026 22:54:13 -0700 (PDT)
X-Received: by 2002:a05:6300:141:b0:3c8:e10b:7a9b with SMTP id adf61e73a8af0-3cc71b19c7emr37663839637.16.1787032453547;
        Mon, 17 Aug 2026 22:54:13 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc13bf26a0esm1592712a12.8.2026.08.17.22.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 22:54:13 -0700 (PDT)
Message-ID: <376e0fa0-c863-45ae-a8f8-6d4b74ef0b8b@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:24:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET
 IOCTLs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-10-69a02e9090d4@oss.qualcomm.com>
 <tjfcsz62is33iphcwtensnoiohhpfk2zh43qfe7ijd4b2324pk@v3piffq646ac>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <tjfcsz62is33iphcwtensnoiohhpfk2zh43qfe7ijd4b2324pk@v3piffq646ac>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LV467o13KfonkWF4tnuY3N47Xv9Zoy_n
X-Proofpoint-ORIG-GUID: LV467o13KfonkWF4tnuY3N47Xv9Zoy_n
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA0MiBTYWx0ZWRfX2hBhNhDXOpef
 PKXxWVlxSk8kaUNSIjCocNw/2/G6kXtRFpZMxTRld+8C3N6zCQt+EanJ5YSFaW+eDcSZDwUIqWq
 dlPfMz+sdRbDcI0Lyov7Dsi2PWNOTes=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA0MiBTYWx0ZWRfX/3xeUEpM/gB9
 TFYOd5r5vBr3oLPvjWxnUWzNwnyA2N2ECn5TxZkm9c8V2/PO0LUAd4w63/wdFcROl1CRVRL0ojV
 QHwF+0A49hKbnyi4CBOCnoALEDF3VetGGyPHzNhGBi+Q+yUlKFBgnlV+NNxP8ReUPZShpPoB25K
 yo4KaDBtYpJDsQIZFDNAwBE2cLPWN7XPn2FCdMT/o8aGJIFXZTOE6P5z9OaDEhHj806K22j8g9k
 M6F00jp5SvkOq2Zvi79PZZLLD4WbyZlghl0ywmdmk68BHOjNYD4Uoa6TYmI6ea6s8Htv4u8Dw6C
 gzH/HLRm4nOdME9+9EWlba8l3KYmCA7jym1jjE5/tsIckkwXajQ38jxEWDeUkkleUrucgHbXXIC
 q2NI2ouSRkg/Kl/xmzFKX2mt/zvIQ2AJ4D471mNei3COB0nYFSH5ARWIKNxiW22LwcG6Y+WO4+v
 kvdreYqMZWW70PSsH5g==
X-Authority-Analysis: v=2.4 cv=UslT8ewB c=1 sm=1 tr=0 ts=6a83f386 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=cA8Zc-eO91vsJqbwH70A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180042

On 18-08-2026 09:19, Dmitry Baryshkov wrote:
> On Mon, Aug 17, 2026 at 10:17:45AM +0530, Ekansh Gupta wrote:
>> Expose two new DRM IOCTLs that allow user-space to allocate DMA-backed
>> GEM buffer objects and retrieve their mmap offsets.
>>
>> DRM_IOCTL_QDA_GEM_CREATE (drm_qda_gem_create)
>>   Allocates a DMA-coherent GEM buffer of the requested size. The
>>   memory manager assigns an IOMMU context bank to the calling process
>>   on first use and performs the DMA allocation against that bank.
>>   Returns a GEM handle that identifies the buffer for subsequent
>>   operations.
>>
>> DRM_IOCTL_QDA_GEM_MMAP_OFFSET (drm_qda_gem_mmap_offset)
>>   Returns the mmap offset for an existing GEM handle. The offset can
>>   be passed directly to mmap() to map the buffer into user-space.
>>   Imported DMA-BUF objects are rejected by drm_gem_dumb_map_offset().
>>
>> DRIVER_GEM is added to driver_features now that GEM IOCTLs are
>> present.
>>
>> Assisted-by: Claude:claude-sonnet-5
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/qda_drv.c   |  4 +++-
>>  drivers/accel/qda/qda_ioctl.c | 50 +++++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_ioctl.h |  2 ++
>>  include/uapi/drm/qda_accel.h  | 36 +++++++++++++++++++++++++++++++
>>  4 files changed, 91 insertions(+), 1 deletion(-)
>>
> 
> The patch LGTM. THe commit messages needs a rewrite
will fix to commit message, thanks.>

