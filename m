Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A1247F3BE
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 18:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101701; cv=none; b=j7PurQJr/2qo61AnoNlVYp72hqDRCmYOPpB5EC8TVV27V/MTC71anz8emXeCoiTjt5Ul4DoKMDxBfa0wtFtjVerbsdqUdfmW5s7P4Q1WFl7SaIJfWkaa4MHFgNmu96vBOAyNszIIk6gjsJ3mcnI5xCgr5ESUfW3PUZDhaPxRD0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101701; c=relaxed/simple;
	bh=nHouAfMbcTuW3k5oZdMP4hN0VK3YJ5ZLtN/ur7LPOao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p3wQnTIckApN0+6ySZ6Qpjl8a11QfijbeBOTO0Aw1bpeTqZLD7Rh+PLW1+yFZBFdicGm02oGoc+xR5VmKEwHQjx69i4yIxkjQMLABsQN7WahYuOUbPmj3z7TiHU2BeVT8+CaV5c5yfXpYs48vnfyLLVuiY7CPrkTcaCvHVIqbyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MCSE6rA5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GyT+ypkN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MCSE6rA5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GyT+ypkN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7E9G1509371
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 18:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F+mZemlg7hGgvRVaZjdVd9HS1E7W5qsywvUfhDPy7DM=; b=MCSE6rA5pdBLqI3t
	4GiByLWhJTg933+RqV6ERhtIm4BC9eKNNnhuw4i20qC5lApfWW2k59hL2bANr7XW
	zmX1iVE4LMEsfh4Gb9hMV5JWIZfDGfNr05baLhL8GCqxYbYL9k4jy2MEbg78zuFk
	klLgYlpmgz8hNbdFelp4V9+C4XfYbkgsMCzcOwW7mPAV7x3WOelOwYvVGbw8cV21
	3SdV0i5Br4UyLik1zy/O2sEevGrf0rX6C6bIPij++ok+/DnEhlUji4zEYiR4DABz
	cNHFn1e4ySc0e3pmLl1SxEpEPw7Xb1E+vigjb/pJi7rh6a/O+nywvOkFKq6Zpzd9
	MS/syg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xr8e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 18:28:19 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-144f706e063so78959c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790101698; x=1790706498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+mZemlg7hGgvRVaZjdVd9HS1E7W5qsywvUfhDPy7DM=;
        b=GyT+ypkNpYC12vM8RBGhfloC8ngIG+IcJEWYgFuu0DLOABPNQadzlYRsbc8RfavH02
         3UAfgqGAH1YjgpFO8i1xRiznr37mouB/6o8ssFOInUPi0JARKk/H9L6Te0JXux49BrT8
         7eYR8ddjyoIBkeEow/FA1A5V45r4TDX9KtU/R4SsK3jX32KhdiL1es7+fPui+YJIJ80N
         R4S1vqJoEZq2XQWM/wJ1i32oSlyvziwXDl0lUTR1CVY815JkkMURZf7uE115zrZcxO1Q
         TADDgRVZZT3zgB/pKPHKFwkhM2eP01cg8DStnAF+D5k11fhlG2UNI2VOWsiHKD/W9vbu
         kCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101698; x=1790706498;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+mZemlg7hGgvRVaZjdVd9HS1E7W5qsywvUfhDPy7DM=;
        b=qlPWCzqLUsHA1dTV59wTJiuoWHV1M50qHZS6U+eibgwwYYrNcMbK3HuzfFCo3sda6R
         cjogBjZPUV4lyXi28KJHZhHT0IhYK92w3yn83oxFyIVw4AdOax8nlwRejazcZFjiWNOt
         nVOBFq3ZMVRJZMPEDdIiIq3dg8Wk8ghdbfDco8lYXLNwuIXKfIEHF4doCA6RmmdfWIqN
         kxAIqOveb15+LEZ9kUVYlwPqCLaBi6aH2zFygupOwpv8OFYYMUWMAgIYtdIlqhFUj8lV
         20rXikYwjGzVrBIVbMMu9q6kyB0NXWttDaWCvJoarG8AWomwhSuOIr/dqXYZmre30VV0
         VwqA==
X-Gm-Message-State: AFuF++nVFCey9rTW0iQeZjmlGo7xxiWrcXHR0SGEaFJQmW4W2qH7mnje
	nxM/8dUJxq34wLZ+HmIrXK/9PfYOS4RurZ6HXZhnT1OJrkouTv4f4m6AYSUVqog9CDWfD1EZMYo
	Q8zwFvJs/k8aSLbAyWrMHQS4xDyvkniozwE+DVxNG1naanBbKQRM8RKeAGduZbVyCob+q
X-Gm-Gg: AYBFou2CaoEmOA4ZhI1Y0Enp5xdyGAfuXZYcj09gOBkWOXdGMqpkTExZx4bD1i9h16z
	0qNaoN7KFOydmJ25IZqQX1oUfRoGt0+wr7o8cqVOMWsWetdQI2alhrc84i3kGLhuvj0X+3zZCHv
	2mIeh6f+ta2e3/AJ35JfywvXQwVruqm1WhLdutmccVbbwCTogsed9Gkt3U2nUGyrExUKPUiUyUX
	wLCrjm+1Sw1cg3j1irs0Y9mxYq29fvZp6UnRUWBn+s1AFdV8L8w5NwCGrxkOqlyO21/bPSbBVQq
	KVogVNi7LZ+WIcLUkVH4b0j7k2ebKrU/MwGpUsFzGK4oUJzuzPZ/si4H0S8LSaM7M64gGXFtRdn
	WiFkYqnMdobVWJOs5AqU/3iWu2oz+ifzvUEFCHROSunmh
X-Received: by 2002:a05:7022:b88d:b0:143:37b8:5007 with SMTP id a92af1059eb24-144f8d4c260mr319912c88.2.1790101697788;
        Tue, 22 Sep 2026 11:28:17 -0700 (PDT)
X-Received: by 2002:a05:7022:b88d:b0:143:37b8:5007 with SMTP id a92af1059eb24-144f8d4c260mr319878c88.2.1790101697163;
        Tue, 22 Sep 2026 11:28:17 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.143.245])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f949e51asm215796c88.1.2026.09.22.11.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 11:28:16 -0700 (PDT)
Message-ID: <b62758d9-1d7e-4a48-89b9-eec6f6e951da@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 23:58:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] media: iris: Add support for Eliza
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
 <20260921-add_iris_for_eliza-v2-2-5fe7be8c0230@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260921-add_iris_for_eliza-v2-2-5fe7be8c0230@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: stVV1Gl_zN6ws8FRLIC70UPxHE2XBJd-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3MCBTYWx0ZWRfXxWjXs7H8XLb4
 vKWZbCp7HJ0hPfSK3r6WfdsU2rJ5Q2ZKbxIHaxv7gmu8x3Je5o0A/P2cik9+E2lUWt9dYkiUbKP
 EvJkqEFvMzgv0CFr3eiK7KWk5Fnh58OzvSDI9UvZHh6iBLZpEJYbKhMu9Fc1wyTbo2NzArH8Eyr
 YuQevj6miNrCq1Rwt+FWqRAR3+dnsZ1vvhzLUXi4EovupsUmBq4TQqhqhYMAV2cxpzFVvGx8FSP
 5L8tNKmD/rHLRgpsNt0zJGIyqrVBg3IV7wfx53ui7Dr4ey3wbNEtaZqRw/6kNEStWid5+M9W7Ej
 VFUTOTzCNSfQy9DjVsWt09VrKfXuradiYt4uVx6thRGoNjZWHbq3kiWO5eQahAQ7kgACUhT9Sm1
 bEL1SYo8r1YSWejvEor6ZX0nfVEmSVsnbvTu2RCIc424PF1dLl/Q29b4nqPomTPQbY/txCEXU1Q
 KdODniIm1WtacDCqFBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3MCBTYWx0ZWRfX0/K50d8Mng8n
 9jAZr8+9+zjHYgidTZPhhFaSRoedzTO/wg69X1xN7RC6Ph1vekJ6basA+fVU05KszrNVLzg3wBe
 3VY5pdCm5CYC+yFfxWsjtAeWbaP60ms=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab2c8c3 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=d+GKXRUq2vCLDWIvqUj1TA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UnPPif1LvG_pJMLD7TsA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: stVV1Gl_zN6ws8FRLIC70UPxHE2XBJd-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220270


On 9/21/2026 3:21 PM, Wangao Wang wrote:
> Add support for the Eliza Iris video codec. Eliza uses the VPU3.3 hardware
> with a dedicated vpu33_p2_s7 firmware variant and SM8650-compatible
> clock/reset tables. Key differences from SM8550:
> 
> - firmware_desc_gen2: vpu33_p2_s7 (SM8550 uses vpu30_p4)
> - vpu_ops: iris_vpu33_ops
> - clk_rst_tbl: sm8650_clk_reset_table
> - controller_rst_tbl: sm8650_controller_reset_table
> - inst_caps: platform_inst_cap_qcs8300 (4K capable, 2 VPP pipes)
> 
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>
> ---
>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>   .../media/platform/qcom/iris/iris_platform_vpu3x.c | 45 ++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
>   3 files changed, 50 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

