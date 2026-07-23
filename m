Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D078647A87B
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 16:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822863; cv=none; b=azUzBNlXacjeJUYojzwItqfr/B8y65/Z4FAMwWjipObRbKSHP6g7Ts4u0NqgBNFCfA+0FE2urlY8DGzY0M0IoEudjd599dvHZQJuI1xgzUo5X16SZ3E1BPEC7+kDQww/tY9ECmZnStjWsIkk2nqQJ6oftiX8nYyemnEqqLrMQ0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822863; c=relaxed/simple;
	bh=jQtRW0O5nwVNNT7XofY4i+cPCBo1wrZ3oTkdn0RIoPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JLiHEbDFWTbf7O/32aEL3iRoOclinw+gwyvoqmZdWKpmdpDKvI4zZyHECuxN7Maopm4os8i7roYkCWljW9HzFSjKH85NYIGq+UZfKm8KK/6UGASopf92DeQI+gYnAhTKxRA11OWUbJh5Sd44B/B5RC/Aifa34hj4rk3O8nRyfzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0nuE272; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFhzXpjr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0nuE272";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EFhzXpjr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvnEs011770
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 16:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4dMSh+AFMvwZ14SfCMbaoh4hyPzA84eMxFNhAjJ6ooE=; b=o0nuE272SCczCe6A
	VHnAoSSguW+DcHFSGpPg2eVm9BGfQ/VNpPjpVXOoTEa5Fk+MONVMk9Di8wLlh77Y
	DOKb1PgN4ca2D45u5mJ3DSsX8LIQv1pADJgRtbXMaHQysAo2N/rbN0jBJCZdVT5V
	Fe/NS+9ipqvuDut9teovwHn3R25bzIn02SbAiPRNfbZVAfg1wqHEBIrI4/BDYvn6
	/6lOXpyw27ciPOtlE0bQDEh/4EM9HovjxpHMdajfTbcpjUbGCpDjWk8XzvbZI0Du
	96fjHTlz7kgvGgO46xaVaQ63cKkHV5dyksy8JJyMaOOpxMyy4+CBN5gaI5lOr1R7
	7qrtNA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkayhb3yj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 16:07:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so656183a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784822857; x=1785427657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4dMSh+AFMvwZ14SfCMbaoh4hyPzA84eMxFNhAjJ6ooE=;
        b=EFhzXpjr/d4PPWr5LhJTzL9PLxdMLrEGj4wLrUfqu3XLeT2+2nKiuO94RuXR1gQoDb
         5wZInzujBm7El7bXtBpb+1y+tcDNCpSc546G+oFSBwrcRYMWkzSyZNN7oXZl8FfIe1SH
         ZUo+uBo4TS9rHoqTEPWb9BQW6Rn+A6g+mQJ54ejN0zaBa4CY6aSUgBwhYRiIk6elzZYp
         RAhv2ZxQyg+D5hxSAyyQIK8/Otb/EkAPeAW+ksiIPtmieqJCJd2gPuHfZIkDqp8bu4Sb
         be+R8n9bF50DzrumQwJWYaR9u0jODcNUMmRfz/6g2f0891txxla/Bt6aVtVYgCbbMRMe
         4VWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784822857; x=1785427657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4dMSh+AFMvwZ14SfCMbaoh4hyPzA84eMxFNhAjJ6ooE=;
        b=YeGCmGiXtgtiyxATXzTPAnR8jr3q0UXzvLKaYvi1wUtD1LiENfTxPWJlF0QWOScTW+
         M6mgQuDSjugZMBrEhX7l92F+oWXIYVrQenMJchwdEmjJLmzEcXhOfQdeCuq7LYQfsWgt
         D/6pHxenR23KNWyfKqBezvOS0L0a5DvpnMsJgtAuClt1iaMeV4ZaEmpxXE5JThgqa/Lw
         qGhYLFa5sodD3J6kY0GVicOlE+4knswq13ToRdCedzo4z3t7Y8frnzoq18K/CgFi1V6J
         UcETH7jIuMeoX33JljT+cTBEV1zHtq0iVjMBgzDlEwfxbcHSv9VDnlViA8S94tquY+O8
         JpiQ==
X-Forwarded-Encrypted: i=1; AHgh+RqANlnbYrgSLmmzmFgybrVhBE1JnJOlT6CgwThxBvPGLwbu2YMJTi4J32EoXf5j/iMbJl6fjNypIMAv1aCS@vger.kernel.org
X-Gm-Message-State: AOJu0YyN/1CF8sI5D610P6aOkuiSE2dLP2TLvFs/WL7JNUgcqtV1Sv0x
	ZPnhvZ2neORz8jZcfwT/uvY6z1cDiPw+vgvJzwmxbCzibSHNnDhFa3vKmLZ4aUvqp6ymaeemGp7
	ac02AGcCUUbb4yr8S9a7nfFgY0+u7mq4SZjLvUJF3SqfxJc6PpnsxNbVerxwSXq4+m8Yv
X-Gm-Gg: AR+sD11N1rN2Lm43zGlFNFg9gT/SUhSPz+XJ3EsONcH9mu4bQx0n0x3LtyRb37X6dRJ
	9K4JzGcLOm5N+yVVkhNrqhjbo9t1+o0uK/w1vfKgwwKvRZ3NQ1lqsRMuud/wOPh6cc/BIvOzieU
	KypsdQjoSbUSPzRIB9Iejlc5UJUTQ1PP/JkB948WQ4EAKRGltEEfcPS0mSt8QqN7yIcLbR96rvZ
	M8hRD8UO2Llwcq5Wtv1tvJUgqr5gPrFKySMOVGVfnPlpswcIugpGWdSXr5kJxry21wdvMGxPLKY
	c9JE9a5TAG8grQnlFQ1+/oK5RQFgxxJZQztaFocYTmU23g96yti7c5AZNt39WM7uyahb0G7duNP
	Jj56DODxrJYarDEluVF38TJoA9eCYF6AAmYc=
X-Received: by 2002:a17:90b:3c03:b0:38e:7e9b:5fbc with SMTP id 98e67ed59e1d1-38ec8405228mr3812768a91.7.1784822857019;
        Thu, 23 Jul 2026 09:07:37 -0700 (PDT)
X-Received: by 2002:a17:90b:3c03:b0:38e:7e9b:5fbc with SMTP id 98e67ed59e1d1-38ec8405228mr3812712a91.7.1784822856500;
        Thu, 23 Jul 2026 09:07:36 -0700 (PDT)
Received: from [192.168.0.173] ([49.205.251.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13014d27sm17979574c88.4.2026.07.23.09.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 09:07:36 -0700 (PDT)
Message-ID: <302540f9-f784-4852-978c-f21941982164@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 21:37:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] media: iris: force stage 1 work mode for CBR RC on
 encoder
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260723-iris_multi_slice-v4-0-45f0a3fe7fce@oss.qualcomm.com>
 <20260723-iris_multi_slice-v4-2-45f0a3fe7fce@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260723-iris_multi_slice-v4-2-45f0a3fe7fce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a623c4a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Am0+rXbGVt9FyytbsJdRwA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=W2-BaTU1wbAZhcYxqcwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: jiRz5-FnnIvIFe1j_5jU6oO2SSTqut2s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE1OSBTYWx0ZWRfXyhgbXAC2ptKl
 oa//NC6Q5uYh/LfkRP2omOE0wflSo1UCu0ldSyRjpE/ILd0JAuL08haSQt9L9Wcqrmc3eKwT+3p
 aPIzaz1PE+RJpyU8C+I6Yd+nUZb7fdMjOrbYoOEFtKrAW7Ejyhk26gf+t3rc8HFqgnQh/eHVB2e
 FlHX6viZ42yRKQz9gKpQA2TOiAzchSGpeGdo5rWciKkrqw4PIOPWBNFjyjXRmqABllZYf/9sj/a
 VdPa88otENtGwNFCSz29ycdCmJ8IavJvnhiD3l3HZsPQqObI7r8V/GUXmksIjQeu1t2XOKHyiqD
 WnT+zFCZF1dFf77cGTXK66fnPUKCVZHXS7Z92b08B7cYCRZD4+f619mKJ5YprrX9AMo0k6Jj1lq
 dozFdRr0nME/srEgnX96i8cBJIv5WTcSsKYzVsl30Wio/4ifKV/qB6GnW5hqmOa3ZsBd/KlT7FY
 YQzmsWuJsi49FlaPRFg==
X-Proofpoint-GUID: jiRz5-FnnIvIFe1j_5jU6oO2SSTqut2s
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE1OSBTYWx0ZWRfXz47uZ+MXQiep
 nAdIRMSRTb4mR+f9ByuizzNHS8fueaYAEFW5dDeGDj6U7qt3w3idERg0yjyzjK8b/xaf/U0V0lm
 L0abDDp9eRnmH6bqzD31oW10L8rl8vA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230159


On 7/23/2026 3:51 PM, Sachin Kumar Garg wrote:
> iris_set_stage() currently always picks STAGE_2 for encoder sessions.
> CBR rate control requires stage 1 operation, so force STAGE_1 when
> BITRATE_MODE is set to CBR.
> 
> The BITRATE_MODE fw_cap value is used instead of inst->hfi_rc_type
> since STAGE precedes BITRATE_MODE in enum platform_inst_fw_cap_type,
> so iris_set_properties() would still see the previous hfi_rc_type
> when iris_set_stage() runs during initial config
> 
> Reviewed-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Sachin Kumar Garg<sachin.garg@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
