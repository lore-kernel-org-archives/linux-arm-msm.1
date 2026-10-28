Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223169;
	b=FMc66l6UQO1nP5CwmNHa4SfuDHdKcWCOJopeff25BtQzp+LHA9wcyzzFT+SKDZ037juB
	 PLoJiyovZ6FIv7s/lRaV7T1WGD+QnQ/YrOojGZMiQdxSApKturvOX0G7EbjrAEUCo+mew
	 BJSodidjCFyMSfOdFLIvoTlbELFMvf539cZqslMqGbAz4KVP09bskPhYgczJVkX2Wj6gD
	 pNK+w8ZGMj2JXevi2aJHJfWao0tFlJAwdd8jZjs6yt35M6wEo/SyFF5I4rK+zfH2UpfCt
	 4TY3gGkjGztLBvrUbk8F2DABUJFE52Xwyc7Quaa3NQo2G0gFOTlaWVQNdNAkLWZlGAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223169;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=roGi78ys1k2Uv1LUZCj5d2Fe7dlBCtFSPtg4j7Hfqp0=;
	b=kmOoUItzNSKVHkfYkBpJNClBYsYe9idM46ng9wWQ822js86DPKBmqGCqa1vydu5xTQhh
	 vvG97Merqj0gNuXjM89wd/gpLtwtcOY+azCXIxpN+yz/Nu9Fgv8y6DG+5gP0D5vxEUJCm
	 72h9ytyK7RbIZLYAoB9yUSOf1AdOq7y/P0vDUAXOryKwWWpUZdSZriSRAaupDG2BYRXJ0
	 7hnl6th5iMB2Bxqdbl1vtEGcGJBzSmDg59oWsLqhLXm8xNAJNnW14tvELvnu/OHkG4SiC
	 DMlf2H6HkJOYnUGOh60ENuCrjVVOlv61HDH8p88saaoCzM7l0g7xddoQrDq0nrxowEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jsOGuWIt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gdfdRNVS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDA9606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 21:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EDA9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jsOGuWIt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gdfdRNVS
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPT3J2995290
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 21:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	roGi78ys1k2Uv1LUZCj5d2Fe7dlBCtFSPtg4j7Hfqp0=; b=jsOGuWIt+kH55A/v
	1NNo+qrfpvISreJ9xXX34fAdfvyQMy3IVE/nwrZ7zBouTaL4O6MNz7/rD0uImM1o
	oaEzYk3qdlqlBkSzqQVFyfQ9pWYG5HezU32fn7xhQec0sET/Z9LvMMaovzMojFuY
	vIcYnYPgP8oysRCgmf9RU4Cq0FFcZqo9zdhNJK+cAK8Y29YhPVAMsQCCFZcenmF5
	bB2I5T/qQXNWWLuiqLgmrb8JHK3wXyWdZPb1rf/GdKO38s4chNd614BQjxWjspUU
	HarJ2nio9JkZiASdTpczxzfEOGLWPmC/AmHlXrev9a2zGTCRk01eB+IHy9zNou3c
	nQakHg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkneurvtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 21:32:46 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2561468eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793223166; x=1793827966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=roGi78ys1k2Uv1LUZCj5d2Fe7dlBCtFSPtg4j7Hfqp0=;
        b=gdfdRNVSlShQ2MNBU6B+9RZUnmbr27n88zetW1rurPykhvevKNQTZw9u9xsg38ko4h
         64UkWtObpfuPesUjfTHwuxiE1vyxPrTVK7HO2e5H4DHi7czNhk6cc892r4cCEgDPQhOM
         1SLB7UgVPeLoWo0mhR93fb+tQA3CFGiIG30K9k/yiTl+eVECZ5azb1xhSHAMiyDRwbNT
         wX/ybVwIfhF0H7lc5/giK0CSFDQhsks/narFBIX/jhY/p/baYNawzAh9iU1iSQNkSK4P
         JsGCn2fA6i0ALBDtRYsx9L0epLQpuRVOwZiXEWZtA0GSwsuOBLSQ3mJrWgkQ2PR+fFYL
         XE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793223166; x=1793827966;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=roGi78ys1k2Uv1LUZCj5d2Fe7dlBCtFSPtg4j7Hfqp0=;
        b=N57K6+6ax8to+O/xHF2ZcHYIGC79hBu3HxHRW8r6CMHsG+MBaqHnwkVd6tuBhrGMpv
         65IzuQbM+SLhlgWg0ltrLbmRMNqY5fk4MlmJJL2RxGR5eoixZZQztg0GwVNdryRdB7Xm
         UssizB3zEr+z4Vg3Rl4T5ErtRuUnK/3OUgAvDru/WEj8hXfNKOmMoRFxC07pqVC/J/hw
         KkUD0xVMNtX1yzS/YakNiWyuMFykYYEzDIiCX2k+KW89QOE/e+IZappxv8lKqXaU2lhs
         Gkadl7GgoSTpCW13nLJSmc4tY1mpxJVvwhclq2GMbRAGNaU6CPdsFAQNjAjEi9W+B3Cr
         zQSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmKKdUQ6A3ZVumDimEzthfmOWBnU9D1aQmGBgpaAppIh2jan1+G32UJxnGTquKY+iTViyg2gYGeYVuh462@vger.kernel.org
X-Gm-Message-State: AFq9FYLZC6nP09un/Gs9ILnv/sExRhJ7/VZPpA44wN08FHfzlvSz4zak
	QbyEboK/7c80ILnG0L0ENFY0b04M1Rx/h+yM5q1xqf8htWRPYJVLMnlxs5qeSttnDJ64SoFvptT
	C59CvV0VwSmApzfJofi+xkh/YYLazacDIRaCTGyZQDfuVSM+2RK+8cLGQeB9lZ79UvguS
X-Gm-Gg: AYBFou2O0Y9O83bntT7jmPd4siiadNp7FU96k1kXnOoFb6EOTdEMZ9Opxx4EoUIzEVC
	SlOCZ71ksDAD5Ej4ZIeQOfaOEksNGELsKpmJc37J1HbQZRh+DmWBm7QgICce377CwKT/7E/+wan
	AQqTPnoRFc/Ltgnu6pAY9/KQj4YOPUdt+bOw0T3FBcJLUaz2cJ9BXSYwbgWhTQHWDd47Q6Z4zmw
	IvsowpXtJmHd8DKhqpkhOUun8LbUyNaiLn7/ofqgr7CUfVRtwhJGJ2lYMJ0TZm3+UbV0XCKqKnO
	Xzr9fEWuyRff9e3hAgNe3/Wn+h4Srh5VTH4vZQmFJrVsWAqgLf2+HtsDd5G1xWFOim+mAlQz0oA
	KF6NB6f45MthWxjQw9D7tPHDCcb6tTB3IXgfDlYSnSEqiXjJZgxiRICvHDkaUbOetd+Ut1U99AC
	tRVyGVJbjwWlGfPmL7FcrAA+o=
X-Received: by 2002:a05:7300:6028:b0:36a:1089:9836 with SMTP id 5a478bee46e88-36a2014b7d9mr4548079eec.15.1793223165881;
        Wed, 28 Oct 2026 14:32:45 -0700 (PDT)
X-Received: by 2002:a05:7300:6028:b0:36a:1089:9836 with SMTP id 5a478bee46e88-36a2014b7d9mr4548041eec.15.1793223165251;
        Wed, 28 Oct 2026 14:32:45 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a26d59f0fsm7520287eec.6.2026.10.28.14.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:32:44 -0700 (PDT)
Message-ID: <a34090f0-1843-4e04-a3f0-a53a62b1c1fd@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:32:43 -0600
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
Subject: Re: [PATCH v3] bus: mhi: host: pci_generic: Update the default
 autosuspend_delay_ms as 5000ms
To: Slark Xiao <slark_xiao@163.com>, mani@kernel.org,
        krishna.chundru@oss.qualcomm.com
Cc: loic.poulain@oss.qualcomm.com, val@packett.cool, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20261021105434.29897-1-slark_xiao@163.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261021105434.29897-1-slark_xiao@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4NSBTYWx0ZWRfXzwi1mNM+Oaed
 4VLmVazfasbwGl6/d4HRy8lDcd8dGEd8RGWe6kh88muJnrZ+tGFeUaAWdYd7m/2HzZBCjTi3brG
 Vgh3qH/JdUC7k2w9Tw6xNsTEAGO67YKOFN+QKk6SKp2Uhq7hTmEBLOTnfMCpdlvQJUM3v5OUmym
 jLQYN98yXU+/7tX94d3PfO1Zt6IyMvpZxVjcaSQfg8ikQgYfE29rA4OVpHX6yIQrwC6gk+4rxRk
 yyIkgQCnfGJGtbjlfPdpRKBZTpzjK9OVP174v13IH/+nRZfSvofbFY5lGSKIUka0sdGb0jCGTPH
 flM0IHYt+bSdTNjCgtE1PXTF4cAVv3o1JZ9RQht5LmoBVjQfRHuzXWsP7eEzZt/r+fYNT6NnF49
 opl+YNiqZTfclp0pqJ7xpH92dkx2HWldZLdFYCZ8BrAnwD3CkxNSiSsMqmPZN69Pv6U6QgfYpAR
 UjKznt8gjmD6pSJQXMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4NSBTYWx0ZWRfXy4WGTaqZwACo
 GrAXNCaVtSX9T7WJMHPMavD14R42tSq84xGQKGzCroFnXRCwwB+bJKT+yUWqeoS1eB5HfxCfqvo
 1zsp7hZt8CV4rzMtURLuSOUpLG87klw=
X-Authority-Analysis: v=2.4 cv=LoAHWXdc c=1 sm=1 tr=0 ts=6ae269fe cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=hbk5_eJ7lmwJhVnmj34A:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 4SZqS4dUnfH7izfJ9Fv0tLw5T4a2QgJu
X-Proofpoint-ORIG-GUID: 4SZqS4dUnfH7izfJ9Fv0tLw5T4a2QgJu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280085

On 10/21/2026 4:54 AM, Slark Xiao wrote:
> For some MHI devices in some specific scenarios, the default value
> of autosuspend_delay_ms may not be enough to handle the last wake
> event, potentially leading to device timeout or link drop issues.
> This can lead to a runtime resume failure and a subsequent system
> error:
> 
>    [ 8749.089545] mhi mhi0: Resuming from non M3 state (SYS ERROR)
>    [ 8749.089573] mhi-pci-generic 0000:73:00.0: failed to resume device: -22
>    [ 8749.090218] mhi-pci-generic 0000:73:00.0: device recovery started
>    ...
>    [ 8752.940324] mhi-pci-generic 0000:73:00.0: reset failed
> 
> Following Qualcomm's recommended settings from Windows and their
> suggestion during case discussions, update the default autosuspend
> delay to 5000ms for MHI devices.
> 
> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> Cc: stable@vger.kernel.org
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
