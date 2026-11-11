Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794381247;
	b=LH6W9ODyCgno6Xv3X7/dcOU9OR4G+pZdhPDKgReylETC/dUTYrx+N2txXr0BLl90U2pq
	 qz0nFt30AyiSlQPMdqugZHu+dz4Fe/ke9/TbL+PiRufEPYcueukxqqben7+25jT24hRae
	 725Wp2/1KtwhekWoPMam6Lq2rqH4rRP3YMpnGslIcxHzQJpQtbBjiQzKV+AGGSjm574uT
	 /5FHVGBM1SZBmI1CfUy5qKsYc5MCRxZ4/+9PTIC01Fu+9blx5lImnpThKagkxNnnEfQCH
	 8tyWPLtqK5K9VIrKZuqt7xrHHPVBuUfky5x4tjElS14mTfSl08ESGvU5Zc7GP5caSCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381247;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yhiVcwHv7tpMqJImC6knJLtSlQ8s0N4Jer0j4grDt2w=;
	b=UcBma2pHPh7axTKtMGRLZmO9Zx2UuefBB200VLhRf9TQeDVK6c5Y0S87K5fBCi5IoBLm
	 TClnLeQcq2cdgpNHHf/b9wMtlz1Y9H9nxqVnz7Z6Nj+J4WrC1TIw2/VjGuk1NYqH4vFgQ
	 Htia6XzEhmc9PEcOcan6b9Dl20PxYkyZVYyYEi0fbCeBFEXfjeoTlfruc+gjipWQk0XfJ
	 /RfyHFYDA0s0jckJBnHjXiVsBcN3SCerHgr7GusWdB6P3KnE9VKlXz0SjEBAvwNk/4JAB
	 qcAHGhMN7iaXavCkFhqPz5znvuC5KiSd/PRb14/vwtjgyvYi6CCbbZPmKoMdb4p6xHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E6ZtrJWS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=glABb1JA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403B8606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 403B8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E6ZtrJWS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=glABb1JA
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KLZ01409577
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yhiVcwHv7tpMqJImC6knJLtSlQ8s0N4Jer0j4grDt2w=; b=E6ZtrJWS36NJglrd
	wrr1bpaV9Jd9mV9zd7xBCZYYEwwSNptUySacWLWhEtOics1GqNNZGOztM2ZpUOIK
	lsJ79vl+7z2qX3fM4jggXDLB9fin1eITfHQZ64UTV7ypRU9OKeO+7RVI76duUfm1
	uYBjm5xXKfiH8hn55EK8aO+XONk6UCcCKHIdeVmicDZysX1GbQ1kYILRRrb2PPIR
	33CqW2bWiaWFITu6A8Ve3eYH9i9aSTg6Zupi21eeaTG3lhCKhKdiHBsMTCpzic5Q
	oqRxqFCPKU3V5DRzDhPN0GfEeu5SR7eequFTx3qGGHRZ/N0IcQMMZdvFYhm3I2cI
	iWIFpg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdgqdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:14:06 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1aa0fb7f157so4706124c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 23:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794381246; x=1794986046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yhiVcwHv7tpMqJImC6knJLtSlQ8s0N4Jer0j4grDt2w=;
        b=glABb1JA9GP4/m4aXMgGq5JGRA6XUUCMtWnhjOEl6qD4a+tJFq6CSLHjGjUjrNeofQ
         cwxaEaWf2Aq6BVpFlw1VXDfKfm4cZriKZNF5uJCZqe3yXXCSZNjwdSqrhJfLbReEpw77
         mjXCNlzi7cbyOw8bnyCyJMryibZrsnjviOk3EjU+ExgDvEMJJpiyxH91+TeZ13sTdkn4
         wPtPw1M67Wgj6zmfMYlYnRa0cNtDVbTlKdOg7OUoRt7FXjADDT1DZZ+4a4ciFDyq+WTJ
         05CX79BJOTArKp36gx0CAL2nXC9acayUpsjD9dQa9fE3MS7xhttsH7F9K1O7wVEBhZj1
         fDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794381246; x=1794986046;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yhiVcwHv7tpMqJImC6knJLtSlQ8s0N4Jer0j4grDt2w=;
        b=olSEFM1ihgap4tutOAwsQfnPLZcQEEDTrbcyC97nTxXZXN8iOhbRupLqisiQBN7jQS
         4cNcME77KHLmCt2cwk3oKXqjT/xbpeiUWs73muVZWr5nNEE/Vqm+kCm/ARWjsDZkSJpE
         cozmAJfsE13/6yJEaQXMpJYu9nYHdBbJDdVuK3HUBOSQALWZfS4DuDN6zlnxeM5ChoUA
         v3eJZQWg4UZhvwAKxJR6H3jGECdPggzcnXoSvff1d66Y9AT2m6gfF+8qnYja9GYIncvR
         AWEBjJDBQijwFjNPlmA6xO6b4t4MrjzJ1vyBBpqYviiJDCVCxUkmObiNfecD2pve+xtx
         6Gfw==
X-Forwarded-Encrypted: i=1; AL+hErGSjmeVJqALDohlb6dc+8WTWPG/Gtc/IAL0uupi+v5MOqVMIKI+TU5eO9qKVKQdLYXWjyRQby5pN5th6VtJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/rvxD+HC9mLjKD7JH62ITBCuF/r8xM9sDPXFjUK4FSrcy4Yr8X
	zzLuD7ddyrINwwAUQydwF6/p+371TTPq56XudYz12tykO8GPtytCNPMs5scDR1hdx3D1NOEZ/kZ
	WqROkGKs1drE4GbxRz8hoW6d5juBozsTgNNLsbclw2IVvMUJFJVILy0mwMTd7Fg+b8wKA
X-Gm-Gg: AYBFou2Gk0Rgk3yILFukuB300QzUMbQNnAA+TjNqcQxMQOUpa1FMtq/0mTEuOjKH/qJ
	LgBnwMXCh5qMZQdi20kb3R+ox2b+tLbtUXI77KTZrFZ1RTkI8GeQn/S/9jpT04PO/OQ5aDMTYnr
	I08vt3lB/jEZzWxi6W1ESEXcgQfSycweeF84W5g3WmAfmyaP0kysNiyBlNdOsuhPc7mF5aIxTri
	U3fRd8G1nKJT5J+yX2leMV+t8dP40ZneaXgyjvfSFu4Z0DX6khmugTLn86QH3n+11rdUQFXas8Q
	T79qTx4ru5HYveFNqhFFNkRhZQcux/fdpSOg/SxX0ZkXovBMZuBiqgWF47YXB/Fk3FQx/ixbudP
	qLCSBor+RjtWGEqcyGJqG9C/GuMzPGDOQFvoM0DFwS+NMaLkXymSyd5V8d4yoV/q6D3zyeUxLLZ
	3ZNJwbA8U=
X-Received: by 2002:a05:7022:170a:b0:190:da74:2c89 with SMTP id a92af1059eb24-1b3c0324aafmr1387061c88.21.1794381245640;
        Tue, 10 Nov 2026 23:14:05 -0800 (PST)
X-Received: by 2002:a05:7022:170a:b0:190:da74:2c89 with SMTP id a92af1059eb24-1b3c0324aafmr1387024c88.21.1794381244935;
        Tue, 10 Nov 2026 23:14:04 -0800 (PST)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm13146024c88.1.2026.11.10.23.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 23:14:04 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <512f4c94-15a0-4ea2-aa70-b0015fcb4079@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 12:43:53 +0530
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
Subject: Re: [PATCH v2 01/23] dt-bindings: display: msm: Add Qualcomm DCP
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>, virtualization@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-1-7cf014efdee1@oss.qualcomm.com>
 <20261027-camouflaged-orca-of-debate-316694@quoll>
Content-Language: en-US
In-Reply-To: <20261027-camouflaged-orca-of-debate-316694@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af415be cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=iiY4aUXpewVHb1WYKVUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: UZaZcIfXivMksrF8Zv6D8VGUtmW-Xz_A
X-Proofpoint-GUID: UZaZcIfXivMksrF8Zv6D8VGUtmW-Xz_A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyOCBTYWx0ZWRfX4ftBFQJOowja
 a0lVPz2Y3nBeDvUfi0yUDRh7sp/77HCTKW4Qhy1X+c0GMHJB8LI3uFiuMbnAyTQmlK1ojQfaGmY
 iTtZcK6EL4J2GPx2uaoe3SIC6tG3LGbgGXCo8WPV/FZ5hIMCDVORb6In38jlxZnFjltBLenTshd
 IMl8/iBLPj+37z4rywq6ox59i17RKY7tb8AblrfxX9SSbW1dXQ7HWEdY0dKut4sKnk4QCjB5gzb
 2g277Rvzz2M9HFxFxgmsiNhMJDjN7fcQOE/blhSpIn8pTiWQPcoP2KQ2x3Pfkd7cTZSY+/KE7xC
 gk3+mnhwKr/4Y5tWSkBSfp+YVnF7aZsADukXT6EVDU3BtoDVQ84axXfwkWoCOUL+D8XJSVbI+Ps
 7FO2L7jlt9WdKUayLuQsMHXtfYbmmcHBAyUfgksHibfhQByOTWNHm9eQMcxmX+NHw2X/pDlwffK
 e6iUk4nC0lx/Jw7UF4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyOCBTYWx0ZWRfX57sOsT/bAOLJ
 PPs583ZYCtPuuQLG0r6iyx45j7zvYqceU/AYQI0eLE+uIj5LcMLRs3E+EUT9XEH456uUQlaNBe3
 vf5BbRWySIooFLWjsaFML+3kVdTzwIw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110028


On 27-10-2026 14:06, Krzysztof Kozlowski wrote:
> On Mon, Oct 26, 2026 at 11:51:11AM +0530, Jayant Shekhar wrote:
>> DCP platforms place the display pipeline under firmware control, so Linux
> What is a DCP platform?
>

Will address this in v3.


>> cannot discover display resources through direct register access. The DRM
>> driver therefore needs device-tree descriptions of the Qualcomm transport
>> wrapper, display topology, IOMMU contexts, and panel connections.
>>
>> Add bindings for the Qualcomm DCP transport wrapper and VirtIO display
>> subsystem. Document the IPCC power-notify resources, transport and
>> framebuffer IOMMU contexts, firmware-visible IOVA range, INTF graph, and
>> DSI panel connections. The wrapper creates a standard VirtIO-MMIO child
>> after the IPCC power-notify sequence has completed.
> It's still DT for real hardware, so I wonder why no SoC specific
> compatibles were used.


Thanks. The same DCP transport wrapper works on Hawi and Maili, so the 
current driver uses the generic qcom,dcp-virtio compatible.

If a future SoC requires different wrapper handling or has a different 
layout, we can add a SoC-

specific compatible and match data then. The child’s virtio,device34 
compatible identifies the VirtIO function.


> Best regards,
> Krzysztof
