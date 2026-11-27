Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786304;
	b=4Tl/U9dnreT4+3xpIW6v1mkTA8pEOUgTGJ6GJDk8WgqqATRgfWG7uXcWjeBmVODOlwA9
	 9oYdv3OFdXaCr/bE4bmWYHUp+dUmRHK7IvHtP2qDXl7UkBo+7cOzM9pd8dxqDwsX6D6px
	 e8Nxrh/J8oUQYc7rV05M7X3VjZaw6MTYfx3ENABtjDZzadktaCqWFq/ZSpxl06jTJ5XsN
	 dfyH/PZkIR5UkgJgrVwvk+oJrRUGm682MXNrDGGSbkBHn5U1u/qOHkrzrWy5hK2c3ANOA
	 z5d2k45aNAouojpZnT00drm5gRapSx68HqBHRmlCl/tC66pI6FHrmyhwuTztWFvrLzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786304;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fw8zVa2/GdShruq/BrQ7DJy4AOp9EJw924iesQ7tk+c=;
	b=W0kzX9HEGoiOEM37r0AlBCHxkgxj+g6mMfeAckGEblDasr12kocqf1cUWPuP5vKUuQHW
	 8v3272Db3C+4SaFkmIgmkSkW/f0XTsRBF/l9gz4zMyGtMsybgywbghpRlYjt3QtO8PsI5
	 kDuU1UUFINMLzqhFzzDYDoauH7CFjVpIoZmg0PpUH4HHS7YfceyghlSW9eiV0vWv3wbL5
	 m9sPSVl1x58Ljslt5DTY1UNVst6vQZ0i20wF/hhRZCIpAT+yjRNtAEtYwiW+0wujC7o5f
	 zj1+EgSxzPFcDc0gSA6e9t+DdaBxI7mGbASzjhP+f6ovW8qCqdlUigxLDmgrPSIhYxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=evH8njkL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Klei1wBo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D02606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54D02606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=evH8njkL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Klei1wBo
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARCifeO3153123
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fw8zVa2/GdShruq/BrQ7DJy4AOp9EJw924iesQ7tk+c=; b=evH8njkL/TLzgNau
	KHzfI8iNVD1HdH3UOaNX994fNRKQqHHPUQ13YPOoMUuxFpkUhGSvvMyY5Jq+529A
	Xti2KksoHv3nDG9PnOnUSD1Oom3GwQAKqeddfQEzixm8vMW+W2AGScO6ZyG+aU0p
	k8jAgFRbhtrd/8VD8l7Z7HltCT+CXaaSRD/p/DCTgSdZVvvUjr+2zLuZJR4T6r9k
	umS3LHcbCJ683Z6woHLB4Yniy2cyWYLAHQi/rM42ucvj/n0PpHTYsf/OQ84y/XDG
	BsxLKvh8ll29YwoQWnXVaMrLI8Ih1cmcmjChWGLO14VSkj4Rz2jQCCMXwja6sCCS
	EJpcyw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf93qs6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:31:42 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14373747468so7756541c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795786302; x=1796391102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fw8zVa2/GdShruq/BrQ7DJy4AOp9EJw924iesQ7tk+c=;
        b=Klei1wBoKGZ8Ivh01hemdBW/PrNYRdfKTuraEU6fSvXSF4ZxipSQe2YuLmOb9Qlg7T
         tmJPfohF5ntitehP6RJjIu1r/5x5C41G6Z3UbKWku+1LXZjDV6D7fszIRz7B29TLooAF
         N+QAahCkUEdHmL3krzVELef6FxORJFXVIrubuOrTDoKs2qC6jrW1SZfnE37cwnuPuzSf
         okJJPgAtd6QFr3ISPNQJlsXLEyXEEolR/l7Uegg55m7kkES02fZQ3f0aB0DkQ4tGpng9
         ri2zW6Bc/7ddHRDceLOBCGn9TMjKOG3I8moEkgx3htN0FatpPYgRyfh5/fUcpuVhQIE9
         gSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786302; x=1796391102;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fw8zVa2/GdShruq/BrQ7DJy4AOp9EJw924iesQ7tk+c=;
        b=KqKoyNrCQblOiv5mbHNmx3JS7JCIr1Lw0n5L+Hyt6Qr3FJOqkhyE2o9dPTIaPXcmij
         rABJxuGVKjbNlxjizchOZXDBx8Cchz1FFWG+J/p3tSPV1dtnX0MxRVbN+QKa6HE3+fR5
         f80U31r6YdUdmdiMcuebaqWs2o9Mr61+yR6vJAQmGr+jiNlbT2zYvOiMd+jKiHJehf4I
         MPcHEDtYIFh5e0jufTkn1y4gVL9b99vy1omH5HPSlXcGELRpyUVbmFKzeN34o10AWGVR
         v40viV7DezDDALPGapmA8DPX1Sx348cDSO4j1qYqlj5ugrwtTSG0RjS3yg74UhkucmAF
         hdFw==
X-Forwarded-Encrypted: i=1; AL+hErEAJMAVhpyDG3Vp6fS/BzkkG4grZpI4wA3KSidTfODetlpz0DzHU5yGtaT8u7/lmqkzVcgkalgE6lRYqLnE@vger.kernel.org
X-Gm-Message-State: APuU4Z/xS82+2wFA0DQitnsELHCXUTQLi3xqRnxkiVb1WLn8U/2/q0h6
	BATK8yu3eiGceOz7rJ5Ho1dYvTju9FCV0lHu5dVCdAczYdEKN2Ni8GH2W30I21qWVpD0lKn8u33
	7sYMy/W6xwLUwnAY4M33w0DMdJZJPge1Ea4NXes9hAUWxhVYwwXRkLunNIcMrG8Ry7B4l
X-Gm-Gg: AZFdTZe4Ab93ZkorUNo8Cb/0HtjuGj9RlUOU0mXI5Wf6+3j8kkos2suXv2sw57IQcRi
	PoZuQ1jmdVNFWCwcY7JB/ReCZitHZ1O52CAH+i6vtLLYJnzwTam36NKkNEWXwsTe5j85+nZqgca
	mOlDfUfovkC0/3aV3P4TzL/ZOGk+51Vu2fKKiSFIprcprGv3DiiLRqUGV/Fv+86O8xzGwTXgCLn
	tiHxhwS+T32+CRwatNcqtZ54y9PomP6KCIm3Qh7KMn6blY5Dz/XHVNKHYkQ2bm7G0xZAdfYsSRB
	cOzdLVq4IJLG+mS8ZW+uWhjP54gEr2pAE16tFi1HpbXrXt19AqzZ/PxUm4vM+8JrOOcIQX4DMU9
	a4LLJ40jUhNj2a9Z5UMPV9hFzouoeJtd5CQg6Hjd8/izG0VcCLSFlc4loeIok2xW1dxWayyOsCE
	Tt87bgnQ==
X-Received: by 2002:a05:7022:e981:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5568ac1d5mr30974323c88.21.1795786301679;
        Fri, 27 Nov 2026 05:31:41 -0800 (PST)
X-Received: by 2002:a05:7022:e981:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5568ac1d5mr30974289c88.21.1795786301163;
        Fri, 27 Nov 2026 05:31:41 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm43708473eec.18.2026.11.27.05.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:31:40 -0800 (PST)
Message-ID: <c1a5a27d-5b59-41f9-976e-68a7961e9936@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:01:33 +0530
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
Subject: Re: [PATCH v2 2/5] media: iris: allow larger capture buffer pools on
 HFI gen2
To: Xilin Wu <sophon@radxa.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, dragon@radxa.com,
        Chris Obbard <chris.obbard@oss.qualcomm.com>,
        Deepak Sikri <sikrid@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Loic Minier <loic.minier@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
References: <20261127-iris-va-fixes-v2-0-385e8636c22d@radxa.com>
 <20261127-iris-va-fixes-v2-2-385e8636c22d@radxa.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261127-iris-va-fixes-v2-2-385e8636c22d@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: m40qBTp8BFSGFAY8LrdYLbx-vh1W5ZDv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MyBTYWx0ZWRfXzvlUA5Z7oCMC
 gFGzcRCpctiBEsawk8pQZ8NXpCC8IV+gqYe6g1iSe6bOXYTOnPDfiDqrK1s9sx61FpYV3PTQUUv
 ZtY2xI9IFYTXHLxVkOQe7omxWGVLnQ3zSasqhRJ2XuuYKhyBtXcWNy+nQMTENX/db7lnov2fqMm
 lsHO2yMUTgiVVPKdMR7t4v2R9GgilYWlmyfKhhzVHaQlzEnx93nvjsYsSf3smIuZfGlOfPOvb7F
 IWzNvSas7spG4/jY3cFJ2Fp27SGJYsPBnPBTVsTNM6/ELwrfiMtDBIvzcTs8tvws3uhFYCpEPov
 HhXCpNbjRUYC9CxEQcriyuCM+9FFEwOTj8PycggMvcs6CGNLIQ9j9xuJ3c+Z7LxUYeMP+CE4+a3
 2RPVWEAFfVlJJ0F80RbfyNbSAujxZwT8+p6pkr8ZWm+mA1JCd4o7CjnRQD5RQZSfHfnTaj7RUP3
 dAycTaFMtRvSvMo4YEg==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b09863e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=jXj6vGqe9ollWG7NQzIA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MyBTYWx0ZWRfX06kWh+V8EnGA
 HXJpaAdn6MwfmkhB9LHfFINRjGK2nbMXUc/YVenrze5vV/qc1rNRDPoIqJyPHGDkbbTNcSqTJ+y
 xWN1Rp1a77PAGW2NKAIxEXXLmyYYFu4=
X-Proofpoint-GUID: m40qBTp8BFSGFAY8LrdYLbx-vh1W5ZDv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270053


On 11/27/2026 5:10 PM, Xilin Wu wrote:
> vb2 limits a queue to 32 buffers unless the driver sets
> max_num_buffers. Clients with deep decode pipelines, such as VLC with
> frame threading, can need more CAPTURE buffers than that.
> 
> HFI gen2 firmware takes the number of host buffers for each port
> through HFI_PROP_BUFFER_HOST_MAX_COUNT. The encoder caps set it for
> both ports, while the decoder caps only set it for the bitstream port.
> 
> Add OUTPUT_BUF_HOST_MAX_COUNT to the HFI gen2 decoder caps, and size
> the CAPTURE queue from that capability when the platform provides it.
> Platforms without it, such as HFI gen1, keep the vb2 default.
> 
> Signed-off-by: Xilin Wu<sophon@radxa.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 30 ++++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vidc.c     |  8 +++++++
>   2 files changed, 38 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
