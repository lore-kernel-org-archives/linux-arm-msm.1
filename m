Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794544420;
	b=I0fK8G6XgKIWrtQXpQdfhqK1Clw7v6AYTDD1lIcaqbNrZBwfjMqCE66Xoo7nfnS1q7HM
	 4KvldjtEpWJ12aB9gJaHlNzPIC8x95pr6WE5v+7MRSve5NVx+teqEPWyspeTttdBJ4udd
	 1uN1eJ1rsbqB1UJ0PiWqR/nhBXhG/cP/Cw6uVhuTcsRGVq9KHefxIspFzAODT77TCF5tN
	 TPl1DXSEfTOE/Cr+Ed5KtD+L4URfvJ627PSSMgy2Y0uou6FTz6UEZqf7y90dpxg3a365Z
	 6pQ1il3LT52Kt+h0/LN5jSXB+0qCvXMj9Se2e1Sh5ITIxSZ26neF5Arqbiol8mEedtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794544420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1KEaPhuXG72mBW8WdGwUc5nutV56+4/Q4XKgy03FL/k=;
	b=g2RM4VrvV93THnn6WewPRaniyjdVLQtfPMl/YFod/yhYXq8LfzFsnNlYXwTfls00gpD8
	 JpOh5tp3GSZz1rG9xvVbh1wAzZl0WBB4QsBi9VLNuQqHs8/9HyJp/mp1k9zwZepEGg+P4
	 75q+XZwFuGlLz/8cytTHBKqZwuyraCjn/5hrYF+WezBMsJuKKhr+qtK0ZKcFIyAxL6gzQ
	 pHDdDwSOwucDFRUKlwVq8pHS1G10pyW3gsK+WV1wMh2ZVOraIZ2paE39+T/tQT9Z6cTAL
	 3giYqx9ItrYLaNpHj2TlVXB4F1nAOvSZEMA7mTZ537outQjKru6ZZVjhv/YO1Wp0CwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pLEo5URY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W1KEIOpq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EE9606A323
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81EE9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pLEo5URY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W1KEIOpq
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K5HH3273766
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1KEaPhuXG72mBW8WdGwUc5nutV56+4/Q4XKgy03FL/k=; b=pLEo5URYD/JpUWO3
	ZcOydo5NS7NewYrfU/DC5G9qaZO1D6XbPO06nX9SoG50AkvhBhfUQurdsagrlbP4
	w+2fK8K5ZrP02zcNyGbB95hT2h/uPSBt0hGti4dtpS3xXhgGAXBpFJ5krpR9FCgA
	Bl/hJMSuyj5bWpuIOkvVbB3u/dTX/bkO/0IqydI+zhL/jRhB3BB6izerqIkdYkdn
	293JVWUuUMKw+XUOYt8pea9ws4a2UFp9nF3PmjWJQFgHZSjRVdw99jF3WGJWQOnA
	rj0d6mF5C7nIzXrb7sd/CVmxlp2k5uZIVQJ0IQ0DLmMcGuKp9olV/hkBtBafo3p1
	9fB0WQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufgp6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:33:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f479b9819so668745eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 20:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794544419; x=1795149219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1KEaPhuXG72mBW8WdGwUc5nutV56+4/Q4XKgy03FL/k=;
        b=W1KEIOpq8M/3xu0xVFX/dQZK5jgI+fMA3EhGQ1lxG4GtqpLjxBXm4SQSe0dScQ8+vP
         WkukR5fkEHB99ORLHXU5VuCrTzw+IKBGK1dBAPacjXeoS3u+TJ/2r2m1lM2xeoMgqAAm
         L3VzZxE/t3Ue0B2k7J0jHAW3BKfKf8nAepy8vpG+e4KbgXpHi0R5aMSMNxuwDHrnZT/i
         5JzBd0TWIp0Wn2KpMkO5TB0pe8jAyYrs5RujIA/n4DHPJBb4s5ZdD2tvVS1Pc5+4ZCDf
         QdtZaYELP4eOGvZTcdxXhStdi2RzMlK44+LjM/kmUrwNovt5qCpTPhx8kODAXgt7n+mt
         HyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794544419; x=1795149219;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1KEaPhuXG72mBW8WdGwUc5nutV56+4/Q4XKgy03FL/k=;
        b=TOJ+Y3b4KF5HixhsQqYLR/NesyIFhHXqoISexvNwa+5Pt0MhJ5JpsFF/1R+0G4zCCx
         fGHuvCDCPDj5/dydPqVQNyw64nRM9Edn1P6LnTv7wq1E4i4GWw2xq/ubZgnnuLti/p0+
         XV5MnIxNKw73ef627ZUdIczfSDZEpm8Rrxe3Hnq1r/aQgnMXOOUT5ABB+tkf5MWr0HfJ
         t35QCdLl325+8BFhuVoGFnqQweA/zCgV/c/kLt0tn8rrGiVj9kdUHgshG8pFPXUV9KxS
         uNgva6u/RrKpqhFAezAXmt80pY0Ltl7e++dujKZLH9T/+rzzH/a0PYA/8jHS0fVjBFTS
         se9g==
X-Forwarded-Encrypted: i=1; AL+hErEF6P83mqcf7yeA+EGfGWQEDUnWeni1H+pl7nr3BZD8xofP0xQxRM5Z8GAsDXevvQ44SQiL7zUB1L774Z/0@vger.kernel.org
X-Gm-Message-State: APuU4Z8BYbDLuMLCw6qjRsg2/MglSdBKya5A0McWqZmxIT/I7ILKsSbg
	ndXPV1VXZORt6AC2XfXwXeYTuZ39pyvDvS+xbEXjcq8u8+PcfONHCDNktvxcqPuVc0jU6Zwi6FJ
	UbLZDw/sukwk7ezSjwDFzF2RGvvdpBdLEEuOADHmzQ9lU2M+04GQ4sVE50t4XkpH1wsUg
X-Gm-Gg: AYBFou3dvQyCd7Xn2XKmsA/Njf3p7vKN6mAibhP8TbuPzutU33iy2rjbhy+7W7Lec98
	BIPwfK7znpvAEM1JwKM5p4uICIc6LqGgCOS/o83MTiGq8mEqECcS838mubYZC7dJoM8Xw7ZZKxd
	m0xcgZuUoc/Qg68BeIC0MAlR+S3IyscY37QBAXJTlu1ZymeSec1Gs4n7gR8KMtx2TygwgSBtpp1
	XnnTOsNvlNsSm9HANm7tE3zAGtCvcpKGvUi6vhaTXCcmU6Ghka948MBi5hTHlOlypWSBybuHHkN
	aYxhTWBZTMHY4SMqKx5BDoc92NB2ccVtG85EmjJfMEKNZKMfMTtuDkDbbOZEFU4up9YZbfV+Fwv
	pt4CLZe6nyvoHiQKEO19YuYVTFF+Qd9j1RYj4/L7YP20h8CjsvYjk2dLRuqQDQssYoOd/FlK2TY
	AGW9A=
X-Received: by 2002:a05:7300:2a9a:b0:35b:cb8a:8d0e with SMTP id 5a478bee46e88-37966e3b092mr1208982eec.16.1794544418744;
        Thu, 12 Nov 2026 20:33:38 -0800 (PST)
X-Received: by 2002:a05:7300:2a9a:b0:35b:cb8a:8d0e with SMTP id 5a478bee46e88-37966e3b092mr1208959eec.16.1794544418106;
        Thu, 12 Nov 2026 20:33:38 -0800 (PST)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm6220492eec.21.2026.11.12.20.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 20:33:37 -0800 (PST)
Message-ID: <50103867-1f03-4346-8174-b7301ba3ddf5@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:03:32 +0530
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
Subject: Re: [PATCH] soc: qcom: rpmh: Fix use-after-free on timed out blocking
 requests
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Mark Brown
 <broonie@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
References: <20261102-rpmh-timeout-uaf-v1-1-f1fe9d38f1b8@oss.qualcomm.com>
Content-Language: en-US
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20261102-rpmh-timeout-uaf-v1-1-f1fe9d38f1b8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eVxpQCcpWwwM8GyJOM0LCOkaT0OJ7N4M
X-Proofpoint-ORIG-GUID: eVxpQCcpWwwM8GyJOM0LCOkaT0OJ7N4M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxNyBTYWx0ZWRfX5CokPSNSkTs8
 YvL7LcpWPrRV7UVFkTq0ieRi7meONza6jqBG0f8QLUwDNNaNktAgLAcsQL8b0RIpIVtaIfHJQlu
 r10E8cH2Yf+i9QJbzx1YLSwPgbB2s7gLhT/GhOCLYZOBC2CDNQ/Z/91t8uQJcs/lz2Ic2BLjOrb
 xW/K4KMnkuP6ED3Rlf9byfLMFQTc1Iqwk19yGhZkj+TqNGYHC9cOMlvpeIS6RRDMaO3m6NT/LC2
 aiWv0fRJ7zAlzdnkBtt5yD3jM1ys0rZ0WG3AhMI5bP6hBl7p1Cmuw/c8UwWg9ixZAAKCCZg9lDB
 G33gR5/xUHXBCp9Zr80XOK/+4qOy3YGPfaTip6ZRmN/emz/ExRZl26OJFczADul2OCH/SC57q+O
 4rsAylKDlDHZg2q1lNRaBhosWuVqCmcrYd2K8Xt92+O/o0w9mDuHDFS3dSnFzdVhT6TyT8QB1lw
 5bFvkv0gQVUaXuwkmlQ==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af69323 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N4WVbDJ3b7wuBwOiC88A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxNyBTYWx0ZWRfXxSkQFqwUPIQe
 z+ZGaemlDTKI2Ia/7O+zTF3LR/ZnJcP91dufxpVi3tL911ZPvGFrz14YMvth+f9wQfsr3iUowRl
 HsPfHwzdxiaodwl/DlvUn7yemeBDWTA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130017



On 02-11-2026 16:16, Abel Vesa wrote:
> rpmh_write(), rpmh_read() and the ACTIVE_ONLY path of rpmh_write_batch()
> hand a request to the RSC controller and wait for it to complete with
> wait_for_completion_timeout(). If the wait times out, they return to the
> caller, while the request is still owned by the TCS it was written to.
> For rpmh_write() and rpmh_read(), both the request and the completion
> live on the stack, while rpmh_write_batch() frees them on its way out.
>
> If the hardware completes the request after the timeout, tcs_tx_done()
> fetches the stale request from the TCS, passes it to the tracepoint and
> to rpmh_tx_done(), which then signals a completion that no longer
> exists. For reads, the response data is also written into the stale
> request first. This corrupts the stack of whatever the timed out caller
> went on to do, or freed memory. rpmh_write_batch() even documents this
> with a "Better hope they never finish" comment.
> Fix this by giving every request handed to the controller a reference
> count and by embedding the completion into the request. 

I would prefer to use BUG_ON() instead of WARN_ON() whenever timeout happens
just like downstream does rather than to handle the timeout cases.

In cases where interrupt never arrives, already HW is stuck with no way to recover,
so current implementation of having a WARN_ON() and allowing to continue to run
will eventually end up in BUG() or crash somewhere else.

Given the RPMH_TIMEOUT_MS is 10 seconds large and RPMH hardware transactions
expected to finish quick (within milli seconds), In cases where interrupts arrives but
CPU handling it after 10 seconds, there is something wrong. 

I have a series to print debug info when timeout happens at [1]
I can update WARN_ON() to BUG_ON() in v4.

[1] https://lore.kernel.org/linux-arm-msm/20260812-rpmh-timeout-debug-v1-v3-3-68c0a40dce23@oss.qualcomm.com/ <https://lore.kernel.org/linux-arm-msm/20260812-rpmh-timeout-debug-v1-v3-3-68c0a40dce23@oss.qualcomm.com/>

Thanks,
Maulik
