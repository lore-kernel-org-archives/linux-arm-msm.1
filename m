Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227694AB3B4
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 18:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917333; cv=none; b=cc864qRxIc6zl4SITdEfE/E62t1WEbTAlhD760Y5EZUn0qmq9V2P7SiuJFvB6JWsIFqawAntshuO9dBsbUg4Z4Tzs14sYjkdcaIJ3kUV4ycl9yOF79VUOzgjv13DDRcfqmoHah9aTuw5lX4kuDUNEN8jprlVTaK/CnKE+4F0ppY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917333; c=relaxed/simple;
	bh=i1eYrfq9pOmLNSAGowUSU/U/aAqMVoOQ2FEK8FAF0w8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dc/k8NBKO3F1UdE6T4LT8d9wPv6gqkD+nVgZXFJ+85ZhVkJsP7xV2M8oxaa8idhUap5tHoGdnLeLEy+q+jOzMaE6QbwB2ynAJmutFNrth4f2HHNkEDjtlbB2Yzuwrk3iqRhC3MM/hVQtUGVG5ZeqTSJlZvS9EI0/2EZZBfO0Pqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kn3P+sjV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=icvfQ7Z+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kn3P+sjV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="icvfQ7Z+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHRMu43018226
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 18:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jIQDQKtQTro6A7rUte5OR8HVE/aHunqAOpl0ebYcwCU=; b=Kn3P+sjV+qBx27Ts
	h9J60XNRISKYnG9cE3lzCrJ54O11ukdL4JCF/+ki0BT7mUAleT9TvnwveMGUmqyn
	LtRdTJTlwE3uvmObLX8LRmMLoRkbz915rTjY1I9OGO6pZ2zQtNz2qyLN0fomcDyF
	qPddwRwyk22lM2MDWR4nyvBpSRazg91XGp/RuldPuZV55H3K3vKofaxXfjOah/Gx
	8uWGQ/wegJHmkW+M/ufexofhIVeTwI4VksWQx4axZ4O/Qjayl61ZSAXGM8pkwiw3
	VlRCzLryVoXTvS7ngzMlFDPHm6wdXam82PwmCPuj9/Ur0WveUIWDlqg8YSLWJZ4a
	XCrkrw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b0eak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 18:48:51 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso4975788eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791917331; x=1792522131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIQDQKtQTro6A7rUte5OR8HVE/aHunqAOpl0ebYcwCU=;
        b=icvfQ7Z+wPPN194jwZ57P84Vl/Yx+UHUnNjAtIwtoQOalNUvfgvWdWjTOQwLPMWZbt
         XVM1bLi5vDJ9SDDYOjPjek/dqT4tb2XWXcnL60QXqHOI6JbuYAkWdbRF9fqSmMl6YvHb
         3qRyG+yvdGxjV1v4kx5Q3oY2Q+WCWLeWiPVT7pi9y27r7GwoZrgu2cc6mEvyG4zxFCzF
         96HuAkEypkzRNfP+cQ5fGZgUhwUtlaKAFeq4jyQoXoXOL4PzlG4VwM8kXbXQarcyzZck
         AwIbbPZY193Kx9dxW/GI1QbGBlL8jh6ucpI+CSTS8P5DPjZoqpmQbEvPdKPk7POkglW4
         KHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917331; x=1792522131;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIQDQKtQTro6A7rUte5OR8HVE/aHunqAOpl0ebYcwCU=;
        b=RL18SP/b4Ti4xpRfvyoROp4nq4f7wy6NB6N/VOX4CXsUfzPr7Wxckn4eS2w2IjN+pZ
         Lk+7O/Plm6a2NSycM21uzub70jhP8zs8A6Qsa6n/bFaCPe/zgo2wAD7E1Tnukz0bZs3d
         0p3AI4NjPxgneLKOs4GRnjTVk/LnoRUNaoi2K1jnSyD/dqjAERjZpfAWdjugoUXAJhq4
         N2VF8MB8bA6h0nNy4ynOFWGyV9Jqg1tZWbCmlxDm42iKq/MCklqSLZBuDZLf1FuPTRp6
         knlMpXIpxcc8mjhmD4EVN8vtqrH+NK5T7BtQvVjHgMI0/E7v9CHgG/bsHqn9M9Peu3hv
         JEdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxe5aXFC4Jd7jSqLpqyNnHMDPfXvJyKb2FjbPZ5SaIHhkUqXyhUOqRNLRsQV1QfuEGCYPlggPoj/+NxEzzk@vger.kernel.org
X-Gm-Message-State: AFq9FYJpgUQMHg4edzoT1vm8mRroo7suMQ7Tcjn/RNHNEAhC/sqXMMXe
	O71XULFr+vNuA53hRt+ZfPUJMJ7+tofnATfv4pvnG+pD1z54d+ZpO9nzYmknUdcS17m9RW/+qGf
	xHm6nuLp55W80f6+2W6ve++QSWHaEs+/IZMzqrXNRnTPzaykL1LmSBH4GXB6bj+M5hnB/
X-Gm-Gg: AYBFou1LUYcLEAcYVwXLtYQ8C7aAmjZggwxDhttHMmVypHo6YM4/ETZMAXlda9XN1xn
	OFs4xA0neTShlTZsM+Ya88km63tVFDdjIa+JhRDxHCBGE4aOc9GhhydLmGGE6PhUZfC3Jr1rZiV
	44MPenGZCO34OiOUfH4cF5/W2pUQvyH37gmvMMZKx7KjUjnbzviwkfR/rjwVLBiusERp9mRrGWf
	sm1/ib7tFFtEdveKqAky07tWlCNJOjUcGO1RBJvTLuStVRA6LvZl2S54D+AjjtvsKcEOCyw5Ozq
	Wwgg7NqW/9sCU/7QUxEEwOI0aSsB1opwxDuRo2sQMJhXyvmODJIaRRLKCWolKFK+W6Wrm/YhjhQ
	CzWjIkLXra57DPM78AYj4TSnEClmobfl9uQt22p1MWW2WYrlkwg==
X-Received: by 2002:a05:7301:4208:b0:353:5c6a:c8d0 with SMTP id 5a478bee46e88-3537e2dbdc1mr16883468eec.41.1791917330491;
        Tue, 13 Oct 2026 11:48:50 -0700 (PDT)
X-Received: by 2002:a05:7301:4208:b0:353:5c6a:c8d0 with SMTP id 5a478bee46e88-3537e2dbdc1mr16883399eec.41.1791917329136;
        Tue, 13 Oct 2026 11:48:49 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca6d20dsm48905293eec.12.2026.10.13.11.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 11:48:48 -0700 (PDT)
Message-ID: <64c03ba1-7f44-47cf-b82b-43b11970939d@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:48:47 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/qaic: Add support for AI200 virtual functions
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sashiko <sashiko-bot@kernel.org>,
        Troy Hanson <thanson@qti.qualcomm.com>
References: <20260831135008.1418190-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260831135008.1418190-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6ace7d13 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PocSdXh09T82xRbmK9gA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 7c1MjEPSrwb6ZZHsWMro9AYN-eMmajdG
X-Proofpoint-ORIG-GUID: 7c1MjEPSrwb6ZZHsWMro9AYN-eMmajdG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3NCBTYWx0ZWRfXxFVbtnFpJWmn
 b7Vnj5/cmX9whUAOw/Jy/HnjkazR0upRbBjBpwvFoRSCPprfrgSaFoUqaqtPu9MJ+MI1sjxk9uv
 OS0R4QSLh0YUGcr04V4qrhLgf2ybqNsAViw3LGxZPNt+tO0wd+2t9JrP0MFCZLlyCgeR3hOGgQp
 dFE2eNAaY2f+GSfaAkWHIDuHQIgONPPlmjeLeFs1ZWnx1IT5KnXKqVWhIdk0y+7qGwXpwYJXvx6
 RJzFmB4Nk6pPRJIbx8i5+7Ifx9DYHg+0oh15GOkt3diHKd0pdUt9AVIUaBxQ+uTt0W4hUOCfBTk
 ajyTsVJeqwxMrlhRwQtBpFmsONLNZhGTP56SwrE0pVfhz/36QNjXN0ekOSBQ74A7QS2uITGlqDl
 I2uTRrk6jFxBOwKhZs9s3R+ktDa7r9rIoqqjD3e8lOMRnwLCyzujcsxo+ZNjYa7bgK8knkYmWRh
 PySPGDAukhhxu3y8Bfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3NCBTYWx0ZWRfXzuqhlbw/TIao
 7A7Iv26h4SB2qEM7fd0ezPsOuwDF7NMtM6e47N+arlfLSyK2byTRmG12iSbSFWrj0Peb4aWqMPc
 r3XEdE6fsCdRROxvruDU3z0CKm39hZ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130074

On 8/31/2026 7:50 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Register the qaic_pci_sriov_configure() callback to allow VFs to be
> created through AIC200's sysfs numvfs entry. Additionally, define
> a new MHI family for the 5 channels supported by AIC200 VFs: NNC,
> Telemetry, IPCR, Loopback and SSR.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/all/20260814165907.C76841F00A3A@smtp.kernel.org/
> Co-developed-by: Troy Hanson <thanson@qti.qualcomm.com>
> Signed-off-by: Troy Hanson <thanson@qti.qualcomm.com>
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
