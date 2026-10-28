Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793185729;
	b=ebnfRsGsOwD60g89tgdQ00D+PYjSCMPKhT4hmBGjtIYFSaYNtJ2EZkYwuuxmuWr2QAge
	 ydlApRjapsE5orcrLIU82uU3/028+rULWsDbPYjova0KJw27Yq5xZoeeJV8NaH1RD7ysi
	 KLeS1LMVGSESFW6X/wrb+qHLS5eKGy30oiZ41ybExWTrXFO8zG6pHClVXaSBQFrnUGaD3
	 bOqJd3nm0lgdNYpy+DF1KQBHTIuG8OzWO66gvEyE8bdJN82w8wn+Ab2zoeenZVj2N0a6T
	 A+qiqrh+BYL06XgxqfoiV+yokBqtUviNJ7CkemIZAi1yr3zRDLw0mJGl38li/40VH7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185729;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=apv/d7It0m52vyv2iaiTrqLt1NFywEuHxYM+YrQheps=;
	b=bA+3r1Goce2tk6yNsEng6AkyKCnno7k4P7ChZUVGrezQFxgPTOJkg4Mo3xEUycClBiGM
	 zSaYaAT0XooVgB9lKAyHlyZkOYLcRdf/U4Y1qIfashUkFsFWsV3v1Y9WiobsHI+qrO+md
	 KbJQe0wml7qSCFG2z7Gl/byfJTehth9gZKhYSdNQmoIiRme9h+p9DUUdd9ikpHAVUdeD7
	 A9g1NiwFvk7Q9VFBo7BJK51jExP+0lL7HCCLi6/9RNEjG2Vzc2ZiuJWmakjetrpwhu1D/
	 syPJjjupacV6XiOgbrZ3NY+y9iupZMWV2pS5PmI7+0R4xNH+5xaGuUlzRhfKvq9WG1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VTI+T6L4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="X9E645/i";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF856606A31F
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF856606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VTI+T6L4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X9E645/i
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SAZxba872173
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	apv/d7It0m52vyv2iaiTrqLt1NFywEuHxYM+YrQheps=; b=VTI+T6L4Z9CiZiQF
	rw+rxOjjh/WXgmJqhzDU0iNumlGEaKCjHx8hm/nyMgBV/SbIPdc3rfDPZvzwZYrg
	LBGKwxV/EvH6oCffX5UeZxrjy/XkE15aNiaERvUelJSKGfxz8/0Yw5rajqh22Uu9
	YIltgvVvJe8k0mh3NuxOJ0RrsSFh08oJEc3YvsX7UOZ+hobzEKSaERniKcDOncyX
	mEfBafKgGtDqkxrFVFze/76pP6sJxzWOhVwLXUSMMTJORi/TlvUHIM/OhZPOdmbw
	YKEXQhGcdNWWCiKhHbWD7hroVXp7UXicw3mKUiTXsMpAQBItoNRQ2sPbDLH+47Yh
	F11rPQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehg3u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:08:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so1196428b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 04:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793185722; x=1793790522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=apv/d7It0m52vyv2iaiTrqLt1NFywEuHxYM+YrQheps=;
        b=X9E645/i8rMJD3iYETa8V8A4vUwuCuxs07YgmeKi0CJ5WKUZi6F/grWRcm1zi1XlWI
         xJGe5SHPbOZszkTQ7/Hrq/szxa4YVBOelDdLRRN2ogy3RkqfUltTvj//C4ed2zQRmVIJ
         3jwDZqHsGG7YUHhDUlmocbA5+oFy16wTlnADip33WUpjS2mHS/i1+3vKx5vGPiTyR1LQ
         1/AKuh//ahQPS+B3ZOK65xUXbTdY/BL1Xtz+0eKXzAiRneh0JyrC7tYk1n6ujB/j5gvZ
         2UjaMjQBPEZ9RYF0DV6T13wcV5BiXUbNTZvvTQwKSapR/0sk6m2MqWqiTgy0CB80ycTc
         L9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793185722; x=1793790522;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=apv/d7It0m52vyv2iaiTrqLt1NFywEuHxYM+YrQheps=;
        b=QPUOBPmtcYO/g/AzFY6Q3U1yYe1Lsxh1QtkexFcCn2Uz66C8Xvqh0A2cXxq3LQvSr7
         ubfFTHppDNpzyNxJqYXlvKW+ZsX+L4F1Nxfc0hX6lOzBX0KHWaVeKSwtpmpC3xvqXh3g
         mVzF+zbiixC7j+knuCwpjRsE7rc69NMiX8ADxlM1QH6HjvOVrJSMWgiC5PS1hasKh4JQ
         ounE4QXJrWVt/bqT8jFBY0/rMLQ3KjQLk8TWmbfao448HLha4aeuC/UjNG8cQ0jjW9D2
         9KKmAINDkUy0O5N6L3VEIXu/0X2YIkQd2f4ScCmVfmFaAB0iZ+Wz2U2SWLmrzoMfRogg
         WnCA==
X-Forwarded-Encrypted: i=1; AKwUvByC9A2fgKrJeQOyCKMTCVW6cCFe/QdPKWvktO07rZKjfUecCXzlUVy8u3BLElttonytv/6UNAwgMoqAu5tt@vger.kernel.org
X-Gm-Message-State: AFq9FYKCCZfPjT+F1f70Yl2xrtC2bEJ3m7FvrBfiPiSSH2qxddOSxLSo
	T0YpFE3FcVeBmCB/zqiuhKLAY2v/hwq7s/jHlzfFr9JrP7qCp7ZBprHEqDbIFl7y1XCkxGmkuyj
	QOpyHVp+D2Fx5ux9OEAO6XkGKYbJOhz3UiKUjYO96GJ5gFhN32Ge2S1G+XMGLnNVr0kBK
X-Gm-Gg: AYBFou3kAPoqpv74vDa2HlCodrjTtq/qr5gcHiY6m55ueUG0ZIQfyhkVkFQhYLsIAZy
	NHFuDXCMVa44RGnBfG26GiWgWBuABlYk+646FXAc9ELg0SGjKgRcOZNG5RpNFsFqLfi5FzLEnys
	DOV0JWfnb24k+j1Wtb/8EUZVtQD00G6CldVEGMH0meyUrXUZ/wR5QcnL97ffstqSbm77Kzbj1oj
	GgLMadLCefbui4ymFDgJ52eyv+MlnGFP3DY+bRI3uhh/yZp3YWnTb8aNj0vedy/Sxt2+bzOkEuf
	gbWxLXsn6b6Np2SijDkwRGDA1pueWzunyvuzggjr2ZfFALmrqiFncrXkNEsjPrtSZImMoAqh3Xt
	4r9cBFegvjUKJtfn0ViRHnan+hFYnAMh0x9FlOB20qc/IBsiIt2FdnHcj1fIJdiApVMdoyGL4eh
	hDRhA2MwUvOngmJaIrLFfxbrw+aGS4zHKcXYF6uIwrjVYwYZOB+MjSGlWHklJE2B0yksJ9Yl5tW
	GMn
X-Received: by 2002:a05:6a21:46c4:b0:3e1:d43e:3675 with SMTP id adf61e73a8af0-3e9020e8011mr1722661637.2.1793185720607;
        Wed, 28 Oct 2026 04:08:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:46c4:b0:3e1:d43e:3675 with SMTP id adf61e73a8af0-3e9020e8011mr1722630637.2.1793185720153;
        Wed, 28 Oct 2026 04:08:40 -0700 (PDT)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662e3a4sm1000512b3a.28.2026.10.28.04.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 04:08:39 -0700 (PDT)
Message-ID: <7b2ff0ec-74c8-472c-9ea4-1195bbf04e1a@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:38:30 +0530
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
Subject: Re: [PATCH 3/5] drm/msm/a8xx: Add Mahua GPU support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
 <20260925-mahua-gpu-v1-3-0fa0bfd8d315@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260925-mahua-gpu-v1-3-0fa0bfd8d315@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NCBTYWx0ZWRfX0XgX4i/np+jk
 B9m+l4tvA6IwIyW8va68+ld9W8NkMbPnL41FWq7mi4xuWUA5gOeF0PtLaspMB2T/KzN7QKKp+EL
 66nFwZg5TJ3fa0GsxDhMb3/lhRgqgbj+lTf/bfKCyjifXzjECH9zG1ZGS1mgSj0/WdyIZlCs7OW
 m9zKhY7cFRVvdpAi0d9QLkdVHzvXzWEzgly1qwxqroCRquxOl5e/hulvCgDiBnRNPWPWheLrZUw
 kSQUE1OKD+4/RVKcnJewB5S8u5aFtiJlZyZxSUsLzRg8eYXoqDtrn8Nz2nVrTtpur1WKyxAuacV
 bIYfeGPqFbhRBWIv+l3AGNlQjHJnabq7mGDyfRFfATtnXR+MgmhwTPdlxl0l1+E1q8HTRTH4C5l
 xYPcZF8Gsfsf0h/ffOPFEI1gh+P5gLKk5pJwfPVUTvlhRkrYM0QPWtqLApr/qHlVCvqgY72r4Nu
 65+p+HnrgGWZrXKbaoQ==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae1d7ba cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VMI7CB12i6EQ-IQ_HUsA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: XcFEm5EWN8r_tVazxnJxDgz2CGPaQ1AE
X-Proofpoint-GUID: XcFEm5EWN8r_tVazxnJxDgz2CGPaQ1AE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NCBTYWx0ZWRfX9oxLkfdANKIJ
 pQnNKQuR9CqTQ428+0bxEGR+KDS/Dpkog/MbxikozDVSJBi3Z2+TXZNq0ahOXppcs02C0DQwqcF
 jOcu6thnvO5Is3cOI59SJ7zY4WWxK5E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280044



On 9/25/2026 2:44 AM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Add support for Adreno X2-85 GPU present in Mahua SoC. This GPU is a
> smaller version of Glymur GPU with fewer slices and smaller internal
> memories, but shares the same register layout. Also, the GMU chipid is
> different when compared to Glymur's GPU. Add a new catalog entry to
> support this GPU.
> 
Tested on the Microsoft Surface Laptop 13.8" (8th Edition), GPU/GMU 
enabled in the board DTS on top of next-20261026.

Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com> #
Microsoft Surface Laptop 13.8" (8th Edition)


