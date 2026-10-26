Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793004953;
	b=a52w1w9F+YHtH2nPpbcF50fWBk3dEhxu3nnIpKtfevWP6g/CUvwKSyGVshhgWk+EEppY
	 xtAnh+0rf/wI5jL4kJJ0IkonsxEbJrQIl/tbWSPHNwaK77ongD2LCkpyjvUp+UF60yxhN
	 ZrB34TCn1D8p3z8I4r79zOTI1B6yeuTfe3jPcUqkER24YGopOfFOH9fkZpff7ZDcP+s0J
	 fVyE5agIHKDUVKG81p7Dz9L1MQKBAoDNrcANM4CnvkX45UI2qY3/a+114A+7DR0BKfpzm
	 wl9tz4xGmtC1QvxSuwEVxG5buAXeD5/LC5yslTFqNnBgSOsVahAUN3N1VjFVEcVvSJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004953;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FXg4xpgpqKJGIQZFyp8YqpU/D9tULXMJ9qr4Kv5LHP4=;
	b=Fef5fgcP9W90aShDVP+T2LhG7QX4+sQC3XKnw6tTdK9SuG2xI+FT0a6U6SkW/idtpYga
	 tZxxcwErjiTGKiLSIPN9InTn04YQb3XyIBRYwjSrAuW7e81IGbKf4/Wmj9eoE3IXcYFrN
	 9OZ7JDZivYRPWkTmQWznv0h4lNCEjzNVxRqUK1O4+dd94KupwtadJZQT3ei8QC3+N9/C+
	 tFehMX/YWsCffQQObEM8WctkdAS3AmcyGokHtOqp8L+qagTUfSdQOWn5Ko62JXRS2weUO
	 poBqCuzLRt2g/kSJ4y/PWFcYahhr239bwgqgaJ3B/rVZtxMkI10kDBVDwyg2PuQsF+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="XPq/q2OF";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ORg3rkSf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556F0606A321
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 556F0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XPq/q2OF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ORg3rkSf
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aUow1708687
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FXg4xpgpqKJGIQZFyp8YqpU/D9tULXMJ9qr4Kv5LHP4=; b=XPq/q2OFwelomY31
	7jQqED3q7kO/Cqs3O3TBMuh2NdmHiVYuEeI8yXDtPrCTE8cWgCkIZDM9VBqpqceD
	Bs5TR97unIMvVfETuhEci3sylb4EA2F8OMfihATxiWUaol4oJnKgs6EDij0Ypjvf
	y9fmmIA4fR7neiJBiwIn/TYxF1lVvBL81PMS8gx2n1GF3SJg7UJdJjR/H/N0zgG1
	jdikEkgXRVD5gPQZ+hHSV+cXkqZn+C5aSIQe1bPiohMnlSU2df4+8Rjsu935B8Ha
	g2n79KAFb1NjKwQ1FMt9A5f+UykW6xIbVZF6WqagWLEdrNxKabZXUB8dCNQgWIBq
	8Kkuhg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjd9n1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:55:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so34907185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 01:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793004951; x=1793609751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FXg4xpgpqKJGIQZFyp8YqpU/D9tULXMJ9qr4Kv5LHP4=;
        b=ORg3rkSfvbQdtlWEgiKmPiv4VXJHsUrR7EkWBk6QHFmbtLeJ+3QRHFY9xer7/pPeDd
         slyt/KINkJG+P0s/6O2x8glw1RsLcy5Reo8soZie8siGdM+elWpYloB6QdAykv45JU/x
         2ZWAdl9p4NgWd3ygKQLXBKg/d5L6XA8XleSVnvEdsYmIzbtgLaayCJiBUq973KwCF5as
         OjIbHlYZymureI5uBDup+IVMdG2mm5NXS3kSJDPCZUL/W7SxuJJDIsGIqKyh9Bbi4tQi
         dC/dNLMCVV8rpu9fg1n2rl/eo0YKTscj4JkUqgEspYC6v8llR/5BmgktH48Q5SyMXdzb
         P9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004951; x=1793609751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FXg4xpgpqKJGIQZFyp8YqpU/D9tULXMJ9qr4Kv5LHP4=;
        b=nowbfp0hA31n70pdkpV+2JYGLVPpt7dj9R+qrYuG2+ZYKRg8vv73yWzwq/uXGSCLBH
         E8jwzL4n5+o7JJS/5DKED0yQAjaBJnUEutpPIVblG0TnMsMmEyGQH+tGpuC1VTin+v7V
         4dYFK53BoPkU08MwCx5zNgzcTBc2OwunaXxmdM3FXhkSxy9hPQOeqze6RiwJFeBdBVJ0
         M/FTObdKMScp8cWYVc1g/uhUPt+u8B+0wIdq6wMv89HSsBjfosn+P4WtWwmgeXHPkg02
         1Ie7ROqvaLL/CcHi1TccuO/hKrUjMSdZiaXyu9Tdtg3fxou1aW0s5S/66xUughsEmxcB
         iiAA==
X-Gm-Message-State: AFq9FYI2jSnABJOj5U9VnjnAAZxVFC0dlO2KfCYRING1aeqxA8+B2+3K
	yqD985MvnJeMrEGjd07Tv7sZA+fVbbHbu22KyyQKgkHvwOZLV/tFlYlLaYOVp9DImQxD7lRpS1A
	T16Zm3WcY72KLnZxQl1htcDrDejHAugPomLEbWylIj8/u2UDwVXML5oEHV9F6VUUMfxcY
X-Gm-Gg: AYBFou2P+QRfVLpmenQE8kWZpRdGVqscBXJm6H0rw9qhn3ivccJgKABoE3vFkjLDsU5
	5pmLumTSak+v5JjG0HImlmoNrcLW2qiClcgd8gUfxbe0Xi2a4Fnc7fB23JbBZmyIZ54+bfSqynW
	ZvfdRxp5sVatiMwpyH9DIN1WB9cVQiZVFoDEDeg6ohdG+6nocO8bGqHv/sDLFrpr7fIbhQzKRjq
	i4D+TJ4mMPqoSfYJr8xIe1nQw8ScL8f2B/rXXtkKFB9gu9UEom2AmUPNllLJX35HOqmouITJBYy
	aZtFLwSKRqtp+uw15ZuOrGDf0sX+KVxettcxDB9DGQmSv7iInQvQ/cn2SC+udNq3X6oA3lJCG2c
	auc+3+YlPX5PLe3a3QK/HuA==
X-Received: by 2002:a05:620a:3bcd:b0:939:9ef4:79eb with SMTP id af79cd13be357-940ef96e36amr990257285a.6.1793004951294;
        Mon, 26 Oct 2026 01:55:51 -0700 (PDT)
X-Received: by 2002:a05:620a:3bcd:b0:939:9ef4:79eb with SMTP id af79cd13be357-940ef96e36amr990255085a.6.1793004950822;
        Mon, 26 Oct 2026 01:55:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595d5e8sm3412794a12.6.2026.10.26.01.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 01:55:49 -0700 (PDT)
Message-ID: <0453a913-37d9-42cb-bb4a-511c112d21b4@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 09:55:46 +0100
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
Subject: Re: [PATCH v5 01/10] drm/msm: serialise framebuffer pin state
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
 <20261024-fd-kms-fix-smmu-v5-1-a5b0b284aead@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-1-a5b0b284aead@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lAokfvmMitN_X6Dque3s-oF4Ex0rAcP0
X-Proofpoint-GUID: lAokfvmMitN_X6Dque3s-oF4Ex0rAcP0
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf1598 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=II6hZ13XIzipqfIPTBcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNSBTYWx0ZWRfX/xMfDBUZv4t/
 Sda08w0v9LDYRp7H0/5D/BAHP1QUXLEQqFT9coWM6UU5USZ2m+FOv6OcqwYuzqhoP8Lpz1NtPDw
 XvpmWtHIhQr0nuYVi5j/fYcTa+5cfys=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNSBTYWx0ZWRfX8Jo8k3J+24q+
 wUwI/VuUITsDGtR/HBwKu2LdvCiuRF63eIAoud+8tTkSW7KRmfPUxzJ9fAxXiJlU4toJfS75+fh
 /b0rj2vuEYspl1SHC3Vb3H83BejoNiAsiGmRp+K0az4hSjHq8o1y2egjJKIgDuPN77+mbSECDGG
 lvTmumagubhYJu48abptOhffF/WIey2pmdOo2cGjg+qqyGUerIfkCegyX9GtYMOyAmJeNgfpIK9
 8xOs4gxIk858VP8aeBpSOYXkfoHiW2SCexdWxvCaGgPpIs3FgheWBJtBWhe16+b1bw+BIMfNyYm
 VIkNbvzyJCkNyGgsxt1yJeQDQG4CvqzHFUMFQVY3nHgaqAZHaGNqLjS35j4wpY50gshfMybptP6
 kB+k1IWVJRNVwOLnXg3Y0LTM93kSRlRMfoeHX4nPqd/k5THltOZNmyYDvf0efasKdP3KBYQwhgq
 WMDx/kx47FiDp1Bvncg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260035

On 10/24/26 1:25 AM, Dmitry Baryshkov wrote:
> prepare_count, iova[] and the pins they describe are updated locklessly,
> but drm_atomic_helper_commit() prepares a new state in parallel with the
> completion of the previous one -- stall_checks() only stalls on the second
> previous commit.  Commit N+1's ->prepare_fb() thus runs while commit N is
> in ->cleanup_fb(), and for a double-buffered flip that is the same
> framebuffer:
> 
>   cleanup: prepare_count 1 -> 0
>   prepare: prepare_count 0 -> 1, pins, stores iova[]
>   cleanup: memset(iova, 0)
> 
> leaving the plane programmed with a NULL base address:
> 
>   arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
>       iova=0x00000100, fsynr=0x3e0023, cbfrsynra=0x1c00, cb=11
> 
> The opposite order is broken too since commit 8ac37c88f991 ("drm/msm:
> Refcount framebuffer pins"): a prepare which finds the count non-zero
> returns at once, assuming iova[] is populated.

The clanker thinks this is correct and was able to reproduce by doing
something similar with a test program

It also left the following comment:

The mutex approach in patch 1 has a direct precedent in omapdrm, so it's
a sound choice. msm is unusual in caching iova[] per framebuffer and
then zeroing it, which is why it needs the lock at all. If you want a
fix with less state, the amdgpu approach of not clearing the cached
address on cleanup would also avoid the NULL-base hazard. I'd keep
the mutex, though, since patch 2's count-leak fix sits on top of it.

any which way:

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
