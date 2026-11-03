Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705357;
	b=gbX8kwonALIh8duMBpirbWhRTF/C5yTgsUAFXRVPAHshq7zT0xIkdjGBxQEKnII+4mfd
	 fb6V65m20lTHRp+aDQS0cfIWCj//zahopi04pBKQQJRLY6D51jscs/WIXWFGeq2jFnKRT
	 RrVU7SSCkNABoC33A3GflUx0ZYt8hRelmG1SVqGbxYbHqezhq7y9gbxR8RAjsr58igTnT
	 F3yodSYzwQN6iwjy9vXezGcApjpm3hNW2ElOZe5zfabQmeWaiCkFeNC1bjSMD3CNjJWBY
	 sRtDD/8UMEwuJ5MPa+7Cn3q5jx1tscVGsMXw6V/7XG1cryzEEAUr8/9YDVUAJvXzVpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705357;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vnCTWc79Z1mZ8LqblAJEf4ii8AcIYeMJM3mOmd7YS6g=;
	b=eHnSnB36JVa49F/pTyMeus2EBNO4QPSsjx4nLbwCOThqEK8Gem0VlNyJFU4kycl2hi7l
	 Pu3bgapR0MFc/L4BCiXk7YYFZAWI4KrU8GSOlDF/uJllceqxzdDQhWnc7wbEa9PG6dsQx
	 6ra9nVN7M8hgohKgenlOu+7PBO++pXZnwIkj9Lsoa0GW42p4OIZhsDmhMhQftapez1G+7
	 EzQgTZwbaa8gEmG2GO70m0cXUFw6UqX5ninFFo8q68zkY8joMJ588jPiyCqQfTc/bllk0
	 C0vziGq0Ycpbhk+SUFIY76lIyl9ALyjbdava1AX/obClixzLIyMV+YXd7VHzGvQASvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Sew2dQp/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OFG1spZm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91709606B10B
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 11:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91709606B10B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sew2dQp/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OFG1spZm
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AALvB2554797
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 11:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vnCTWc79Z1mZ8LqblAJEf4ii8AcIYeMJM3mOmd7YS6g=; b=Sew2dQp/0Bsn3yVV
	VvPKV9eau7fOM4MH+Eff2mYfZkjEH35+7hM84zTqLXYqG0hMMP1jtouqm27C+cyJ
	U52q5l/SUEx3rmAT5dM+m2zmbzCxIudXMFjVnn4UbSB7Bg1qfc1+GAsCPv23kbFN
	s/ocAIN0MNrsoqgCbzDq+d/v+Yb8ZMfefE55ggXax5oqReKqDbiGil5d3qekzbTm
	ALATqVOt3cLhNnId23gaqBMwMuoTAPX8CIeOPn2wf+uf5OGB1w7GAMtKmjhgGZFR
	f480dk5QrVaKchSi3IMWmGbgxI9ycjT8Op+ycVe86wPS1iFiiRz4bbqEgLnwF7eQ
	AsPBWQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2acjweb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 11:29:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ade5b3ae97so410482a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 03:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705354; x=1794310154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vnCTWc79Z1mZ8LqblAJEf4ii8AcIYeMJM3mOmd7YS6g=;
        b=OFG1spZmMsYtWa4OxILjU41MGudRRzeiEO/ISLakqaVJ5qPIsATE0JHpLiEQvzZrRr
         gPqjhcrLE9MZr24t9DABvNLjI8SHhhLQIYCfvRydkcTLzo+aWvVPHKVb7QNt9ND/LNJA
         T3Z985QuPCh8+YBNDGQ6s/v0C/8UZriakcRyiVgJff3exS5XIRDt2REA8AWQSHzEu0cC
         uqRzy5pptJVUIMXHTXLxfMhV4SCkdWXqBuFO5KVwF5UN8tMXrR8A3y7kkDr5HQ7Rkwxc
         OgW/cVZpLt9P2xc7mOwNsmah1zSL0okCcnTir+BRzLTPJwhJxutAs1ZkeiXa99z1y2Ef
         GBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705354; x=1794310154;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnCTWc79Z1mZ8LqblAJEf4ii8AcIYeMJM3mOmd7YS6g=;
        b=OESE0ml8s5uQGm423b/DEapYadgMDfZtomX1Fq7Fx71HJmUTK3G7ieHHqfyxT1+OtW
         2kBcM0hlTmiOuzbk7rwKZJIlfkVbrIxNuPXmfkcW8EXtp5oT0cJr1w9Dqy7E4nii3Nvs
         pFelKI5XZw3Uuijy1ANpjQ6W8XBLQALWyal+MqLfMSOFJEozc0j5U9UmNCwom8xXshO/
         NQqZxpXPe4vCI0rJF3HSKJBHabyz+osTJ51qqjTHxm67zlAPwqKbhOJGeBv+riKmnBvI
         CoI3Cm9hspjHh9U7g4hofvJ3Y6+taxnvPYG5/BP45Ppr4XK1KuI4hvzeqKte5UZg/oB+
         Qilg==
X-Forwarded-Encrypted: i=1; AKwUvBy+fFFtLnhWnU/6VqqsGD16KrdRFec550vztkwdIpO1fXNhy0dXXcPY75KN4yFEyWnV6TBcEingzyEoOxPm@vger.kernel.org
X-Gm-Message-State: APuU4Z8JldsMrrFATjQ8XcTUrf5wuV1I1yHF13ZjvHoSR1Q22voMWAZ4
	xOUgk2uCxnHx8DEzmIJRJ298QMOC7PQDF87ifSxPuPUB6L3SiiDnA4g1w86NqZKQr0DxSXS7vdp
	UyffQI48Ob38xRh72NSH75SbUgI/ybN2KddJN5nuFUvS1edPIr9zOBGavOr6oppjFzX8+
X-Gm-Gg: AYBFou0qgjYX5TjHdRR/CLMR/GTSgLnoa6XnGKGG0CZlZAvYA1fTvuKePIWcLsIvqIQ
	qfolgzNy8QccuqCaz96Cp4ZJg2L9N/qbzwRmlu9c7fPPQQHfqLLYWKVmN+8mgz18t4OOf8xPRcL
	uWFC7+S3rN3tQ9SJG0QDKNszGq8vC5qfMy/oLg9OK04VVo+7g8Jd3Hz82czpFi1YGiX4I6xPTu8
	bHPv6N72Y5VAHG4vJsqXjGNE6tU0b5Fm1Lnhb2khGphnkXUlRdEOj8kRBqoC3MA+IKXj7JJr44c
	kZkUoyF6nHvJbt+1pec9BF4j02wPMC/jUbVgA9Z2eOtZFx1Ee2j88Z/XhsniFhI+U5kh1+ZyBlQ
	4XEWS9bRgn+HL6mcF+zURFrfyJp4gZ/ZaVb98f60428FIgk4mWG9u4PLg08eDV7/GUUHsVWSNpR
	E=
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr7146005a91.26.1793705354437;
        Tue, 03 Nov 2026 03:29:14 -0800 (PST)
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr7145979a91.26.1793705353952;
        Tue, 03 Nov 2026 03:29:13 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85cb91e5sm10519214a91.0.2026.11.03.03.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:29:13 -0800 (PST)
Message-ID: <bac09735-4136-442c-9208-556568d39967@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 16:59:05 +0530
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
Subject: Re: [PATCH v12 8/9] arm64: dts: qcom: shikra: Add OPE node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
 <20261102-camss-isp-ope-v12-8-702254689feb@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261102-camss-isp-ope-v12-8-702254689feb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae9c58b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=sEFLFU3R8KEXLjjolHsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX54+C26B7+w/b
 3i+Cc5VRtth0WSt60V8r4BIARVFkwaHEkWW+FmgVSGj0gUGq8eGR9ELBEIT4ri9mIRW0cYnqRC/
 h7c981UTf29AtG6QKBht1HbsmR6A6wKvd0wEMHLRuv2+dUw56LBl9vxh9Vz2HO/8diAMR8U+ktT
 BNOnzKCD1mLHn9kdfz96hpctI02yotfRlAAAqTy3iffYbkR1qBq/VAv9QHJGkG1MU8ebAgS3qax
 lHAR3rFaULtSSGeS8xVI3RczRDL8VsgjecLKc/aIITT/q8DKL6vlrrwoXKOOpA7u/gq1yEWmB1y
 FL38QNWdALHsmFbk9LTcZ2vqJ7+epqRV51LCEsI1rOqvITkpvggR03i6w1Qzd7itHcL6SlDZLYU
 5e64nvDo4FopdvnZE6kKT2Gvhb9e7zF+vfL4IlwzDL/KMDWrOeSUgBFbH6pnIRf4M7ljHa92RJl
 VxXfGvFQBIdJ3OxFhqQ==
X-Proofpoint-GUID: tZUpCVI818ZwQyCTMMCRKq91YRdq2p2F
X-Proofpoint-ORIG-GUID: tZUpCVI818ZwQyCTMMCRKq91YRdq2p2F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX8vgW7nNsur6E
 q0jMcr28AsPspHl7TQjKq6Cpl5kF89JJdmUl6O39UIiYh6kvB8tCN/WIC42YSNPgLf0BcKqX/Ux
 7Nwun4XDs8lTX9kzoF2pKW9cZvOC/FM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030045



On 02-11-2026 21:17, Loic Poulain wrote:
> From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> 
> Add the Offline Processing Engine (OPE) device tree node for Shikra.
> The node describes the six register regions (cdm, top, qos, pipeline,
> bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
> and OPP table.
> 
> OPE is a memory-to-memory block with no board-level dependencies, so
> the node is left enabled for all Shikra boards.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Tested-By: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> #Shikra CQM

-- 
Regards,
Nihal Kumar Gupta

