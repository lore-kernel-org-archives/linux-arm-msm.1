Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454603;
	b=V5ocshXlFApUCF9K981euy00C39SV9sn0SfmAcfE+gcan1UUITuvCRS6fUnjBIciQ+18
	 wTrq0jIwcOSvJO/m8YoCLPDnFU2g2T/fS8i5gL+lbsVv320XdP4274V5Dn0CTvfHTVq9y
	 gBtN+Ha7gOu3lLPSYqfBms/eRwIwhAY0A6SAsZlvVfAI8VPiq7HNsdMWpQu+eMLWLSDeY
	 NrrpjDNz/XUQwcxiLfW4tAGPeJvoUYM5kEDux+ec6i1W9yG5jyV+JpBbf8UndkjMm8ngq
	 ujBSos9/1lkCmO4yjX82Woy6l02NFzSy5anicRJI4LzkFCbyjLTU7LlKY26Z60FMEcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454603;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QqMha60toiq9cJ0Dwjl5c0knVmrMb1MbEveOjw8znfg=;
	b=iQY7II2bh2qvY6/MEY/kafJJHEwwhTWUYGvtZW23Xj1yUeig5Eze+KoUhC1lmWrLUkkk
	 N3uybfH9CYMl+mXDCxaQ897jC2y4w3YsS/jJjS3rhvLPtR6ldTQLgvkwAqwVTPoOjKJjd
	 AB1CHPF2J3k7Zty9Fn4IaYszb7v97CmaZ39Ta27Kl/TdZZwbtTL0aXeiu7WKJdbBP58Kw
	 E9b6eeTjke+I3+O86TaI9mv5oDgp1AoE40wgyBdwpGg2hTH0w3t48iZTc9ftaFRrB3wrO
	 1k7IQoow+jfmayTgcQPhAiiDUHDEeOtG5+TWM9XjlKLUZ8zRfmxkxNy0GB7lBD9id7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=knSkjZp5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QbiDcwdr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3666606A327
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3666606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=knSkjZp5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QbiDcwdr
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGHHSR2845288
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QqMha60toiq9cJ0Dwjl5c0knVmrMb1MbEveOjw8znfg=; b=knSkjZp5LKR92Av2
	al90EzL7Icqx9lO9pkbP/E0hjvkTFTphVMldeVE+zlb7IHvd9z9iDIX9vDs2133S
	Y1g99l8t+ePbH5zQzm3kjP13wyEiPZy+G1X0VNSTg7lYg2Silw1llyAPdX88XZaZ
	R8w5wfayKFiius+c5dkLpWVPFGVrPxrRF43w6glKhHLXL81FiuHnXVna4Y6rFz4K
	ZpgdopiaJfoiQwwf2XxxXLC3bR30QDGqUUuwZsHpnReLJE7tG/83wKt2wILqcAZR
	t7ww+/yE/ls/sWw3n1Zr056FB97gXM16MXHIod2hhA6Iaomrj5irQRrQYnjBatbX
	Qr4SfQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k2k1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:23:21 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eaab6f56c7so130440e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454601; x=1796059401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QqMha60toiq9cJ0Dwjl5c0knVmrMb1MbEveOjw8znfg=;
        b=QbiDcwdr9s31R9mZuQuvRRe9qQwP6o2gP3s4HAoaHzYGM3KdMGdiuLk75J2H1rmamz
         GUZlEkkXb0Wvba4ff/LzENQsW3t/kJowWoSuXDRO4knHB/ebY4XBDbuvurCwWs77ylpd
         V3kEjPbTsWTLDudRSF7SYycW4eJMXN9K6XLSUG/Hr0GOtrbDM4vbJom4nNx/uKJYZkNb
         38SrHuosvHKPf3mwlKW0CVVHFUGbFRh9Z9/oZ6Enh/SqLAexTk4wH2btIg6pT2dVJJw0
         8AtEI+gkEBaRv+jcm79aKMTk3v9Ka2ko6DjfUgmKUig6C/cOLHtED957M91rQdOqX55F
         KI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454601; x=1796059401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqMha60toiq9cJ0Dwjl5c0knVmrMb1MbEveOjw8znfg=;
        b=AnnIAVW1I8XjsYEW+s+anxIW8gbfxqIh2Ny68vhXHzkMujGNbJuZYUTQfDM0n1Pw9L
         0p+hzjDHtZ8sWVbx1/+GCmZPk8TUIUOTrFOcoB8vyO6KWsTZCmmn2gEfDdQzgUoiFDax
         0ij1AE5cLurRUctjzYPKjj/V9+U1ykb4lv1zq18uxliOWzM0GufpW3EsnYyuhxF9fXfj
         CBBaKz59GHbJLyjcV7PnFxj18kr/JzUwx4pgHsfxrHQdoMEi8xNlygiIGfpAmMDgcEh5
         hNvgaqsfl8zeRbup4HenMMByP/1XeTw7o0sVcwtN1ZxCGaAniwYqS41OYklQMiUUdoct
         5EgQ==
X-Gm-Message-State: APuU4Z8F3S0MAY55UQNZrsWkcdNXFyCZPyz0JyLd+8Eq23ZGKVIE5bPR
	NqKPhFbGCaz+RMMDsIjdAPpCghYk5JB5oHYBqWz8+os5hJFNqEEUd+biJwbqsA//9h6JFisEDpg
	3K7l3udk4LPnXZD0sTjnJCFvl2KPol73y1cjwrP9Socm98T+JxSb/JUfVbaQv4W83ZY4v1xBTrP
	Y9
X-Gm-Gg: AZFdTZexT26x16KO5PeC8eJrhJGjM/PmDpgy0cOca92erUACQdmgWlbBEpXudX/bNDK
	+fABIA8gPhyCGalc0ErKvP9xbIF534DbkgTfvRs/EqhmncAN9i9PkRqbfpS3whQOEm8/Aiarjl1
	WwPffZhLpgfr2z7UrG8nO4mSOM0nPPnq35+E6HO4GFQoEpE0DHmw6NrSiqYijPzW1MiyjI2AbXJ
	zym4Yxd0ZzDGzF5491AHTGNgKp6rcrSO0sQyR2mC/WjM1vP5/tExrcQopazZESj7VqK5otuncvj
	Ay6spci+Bf3QRs3TVL6w8Pv7yx9fdFefSDclmwes3vaC9w4CyZS6Qbwg8aT7OeEGaFm1e/nP3Jt
	GiBrKHph/+3qImOwlOV2yly0D1UYCbw+UbMbrpeU6Mb6P3h87cfr0GeAMbeJx/eYwqYDJfuM=
X-Received: by 2002:a05:6122:6846:20b0:5ec:b437:e670 with SMTP id 71dfb90a1353d-5ee8aeb50e2mr6973953e0c.3.1795454601016;
        Mon, 23 Nov 2026 09:23:21 -0800 (PST)
X-Received: by 2002:a05:6122:6846:20b0:5ec:b437:e670 with SMTP id 71dfb90a1353d-5ee8aeb50e2mr6973910e0c.3.1795454600582;
        Mon, 23 Nov 2026 09:23:20 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6872asm419548566b.13.2026.11.23.09.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 09:23:19 -0800 (PST)
Message-ID: <40157685-826e-4011-93f2-1632b244a1df@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 18:23:17 +0100
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
Subject: Re: [PATCH] drm/msm/a8xx: Add missing preempt_record_size
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261123172025.402295-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123172025.402295-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OSBTYWx0ZWRfX3/42k7cIRpsb
 eymfhBYJ0sNdE8evRyk5vqGzXzYZ1o56dahIxp/SiQxEqm51MG67+pH3N8zC9/+fcY/XpkwMibY
 UG+QbVkuRFKdorPW4urY9b9SWooWGrA=
X-Proofpoint-GUID: pzNL39C3DIf_VRgLBIf-UU5TKCVaRxh_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OSBTYWx0ZWRfX+eCmgK3z2ICO
 ARd3at+ns2U2VuR/EeZEFv8r3KunouQPKs5HxmtjvNLFLCVNSw/qM0dig9iVt6G6WvSZrmGjpid
 G978HFFaXz+437/9xggFQO+hu4nVOwt0tZ3y55AFhG1dC5tVCVjQKmcqdgz2QFhJB/ovAl9YGml
 PF+E/5C2i7GOQM9/6AZGNb3k1WPgsqLSVQt2yY3ofCwlJGqyeC2FW4ej3rxuJ7/S1u2byDc4rgy
 Rq5sdCh5FHMyIvdQTVFn9dUGTB4lqMhYbfc1itliMNruJABjCVABnW85YyT+eB1wGAH64Ym4bTR
 0iUQQ7YKvFCvEl2J22bHgvvThD9IacjYZ+uNZqEcDMPWEwRPyRMiSMiHbyLO2yuFj/CVMk7/bAJ
 pdX4nwqBqtGE+UpV8SeNjSD/IZ1FhKEQ7+15EI9P45v5jG1D1aYYPE1mtq2bL31O33cyFakSxsy
 gq6KJxiqVLY2DdqdAZg==
X-Proofpoint-ORIG-GUID: pzNL39C3DIf_VRgLBIf-UU5TKCVaRxh_
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b047689 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=S6-QWJaKbxxgmz9MQ4kA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230069

On 11/23/26 6:20 PM, Rob Clark wrote:
> Somehow this got overlooked, and Glymur/Mahua were falling back to the
> default 4MB.  Which is way too small for the amount of GMEM on these
> devices, causing faults in cases where preemption needs to same GMEM

s/same/save?

> contents.
> 
> Reported-by: Connor Abbott <cwabbott0@gmail.com>
> Fixes: 7fad33097e67 ("drm/msm/a6xx: Enable Preemption on X2-85")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
