Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612663;
	b=uLD2bokeQE0Fugfcf2KRp4p5e9ZJOL6YfV4JQzH2Qedb+bSfJa88pOyz1fD4UxdeD7fl
	 WARKz8+0PXQhor/zXhPAeCr1sbJP6ky5mzBSHxNH3RDoCZuFViR/HS/myjHL3T0wyVIwm
	 2meDzQlutgs35X07tqdDTFOF6v3LssdDMWVCgIj0ku8hr+1dUhVHozekWt7PSrGQk0C05
	 OdGtoR+WSZbPIBVLZxtzaPPZGHP4fyCdbadjS9YYA8nNfVJzKdUeQOP79vnw9ix0pYpIH
	 jstlKyYOgi08fMDV9gsgkNBsga5ypxAPNB/HLCtBSGLsRawjpX0Zrb1tk/36LdpocNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612663;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZCa/YPK9ZlF3OQw519mYhFypdJ6PeksxTIjOEMw7euE=;
	b=NQe/NzaUJTaTM10f6tgHap49VORIYDeSDDlQDKXSis1uA/Pgl3D8aBEwny6P8R3hyuSL
	 fPs1oaHXNBoFEC/kZxWE4vpsb7XZNZaEfMZWB0WtuuiCLJuXhuYxMdhskjeQ5k4Bf/buZ
	 dwmxWm6klfFFnve3KkdVyKIl7u5XBALdw1baHVxjuxPssqPVYPNgSw62aSwXkmA7A/Xni
	 f5KueqdvbS4kJswhtp85oVX8nx63Z2rHsF4KpE9vDt+9Ci2lx09ZqiWglNTXyerRzn/F7
	 q6ZRWQhO3AaN2/F3YEZ5fIBPOA+pvQob7GmU67Vru83vEid+0mPF4doed71Y7t3tTbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZRREO1QA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KQgAlhh4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF501606A324
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF501606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZRREO1QA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KQgAlhh4
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AOdC3086539
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:44:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZCa/YPK9ZlF3OQw519mYhFypdJ6PeksxTIjOEMw7euE=; b=ZRREO1QAjeVOSxCH
	lv9RJxZx6z6iWF9jL2zBA7cxtzVayVF4tRsCazMYPa+gDalzYovZbrHVdgmEDcMQ
	4OPdDGklBAzv/3CWt69NSeI9TW2snsq7uT3+LzIMxkol2Ny9jnw4bGF5Q0Z2lujf
	rP0ICGltYROVYVALb4AbHFg2/9QX2K95et3GiThuGdJe4Ykt0ZBq3O4W8czAYtXE
	/XUX5lgx16wyZZDLPxuxB2TQCP01X3NAN5WrZQ2CDuHQBWKKZiVYUFudXd5wN0uM
	gGW1IEm8rGkc1hoTCpv9OKLNKx26fqRID1BlAhS/zB+XknvZ7WociAJwoa26gSej
	mwAL8g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61613-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:44:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1440e081so47777385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612661; x=1794217461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCa/YPK9ZlF3OQw519mYhFypdJ6PeksxTIjOEMw7euE=;
        b=KQgAlhh4nDDk0Lp9lFowBkfeocguj0TGQNNC91USFy3a5dR83dKMZf1Tf/HNvN34VD
         xM24O0lT/Cj0lGrC5pC5Q8E2imL3oIAyVDgXy85tyZUz7iB22QEFFZIFEGUxi0QA9v3/
         losG2+PrzELumYHu3J7DmA4pbabtmSngki1QWJjVgU9kK6X0ysJavagNbo9NghYuysWG
         QkZEVuxq2HtuooIG/dFAMa5lxasDhXeTdtCRm46FFVzVG1IxqEGgI8Q3x6a+YNq/9dEF
         43CALuJXOGlLNM4dJFvyumUgvGs75kIel5WXiUMY8l4h7BNYZzYGk9kp2aur1iJ/SxEO
         C5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612661; x=1794217461;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCa/YPK9ZlF3OQw519mYhFypdJ6PeksxTIjOEMw7euE=;
        b=JD6MwOk8v4+6jufgarZQgTk05jGdiAR7uw9XaVDL8xCmioy0kOVehbIoCtPY/CQg4W
         88NFzIe4qAZpDmji0UvDRVVwf90k95SUvDLJKNEg4qbdi+eiJ7owZPt8Y038scU4G53W
         NjCPK2R/JSxB9kGoOtvgfYv9VkjPn+OjmFgDyb2+rnNtCc98nZ8d9meQet961O8yfNj4
         i7gATErsIzYzd34Q+luAJq7GtajgOfaap70hcUAqBeIi/sH+5LJnHbepf1Fb3mJYwg2r
         r7k21lRrheoOQdFETykcj1dEa6XL+45hzAsvXrwoBvCrQvGElGS2Rup4bcYwSCj99NIN
         FpBg==
X-Gm-Message-State: AFq9FYImQ/He4y3NT7Fo3g9S5l5GoVhpoCS3lY8cSiCanB0pXzbF2LXG
	ad55Bj/Xlymbvz6YuSN1ToRERCmbpPmYPfFBlOOfYKlqjmwyZNEV/iJ8eObS/BkR8XbNrD2KvV/
	pgmfIYO20dHBX80tAEII2vF2NTfK0njrGUNTvy7rD3yAYmhen809HcHwNvzqbJU2szFKt
X-Gm-Gg: AYBFou1w5MxmzajkjanjEDGnjaVQ55rGVfJ2Go71BZYK+lL2h1QHIUqutXmGP5VTe7E
	iFDXghlZzUQ9TZwT5DPWApX0VK0YuyX4EIzwSkSWn5Ly3jma5a9Ql+EZrcrBT6fJyITftsA2dsk
	WbyMs1xPuLcyrSEfEq3mgjjZ51K52Dwgg6hfh9hrNj8gI+zUlDPEqYTl23al5TpYpcpT2NBQCt9
	55NmytTT5Tb9RLlqF8G7dqm7m+3DHR0e3i+gOlPNPOGu3UfS1ZQwKf3jQ8RY43QJ7yGfnELAL5U
	av9hHsDKWqxKCGny1kgmoH/91CBx/0CWe1wO4dEjqHAsGacB9jmQeshSB+uBaKCXANYiTRNOrEv
	4D7ZdI0hpslr5ffGRt10+XAMGFBunaHQOMJ8QBflbgla7mAKJ5T1m28HTMWruJIlkZTmI2+c=
X-Received: by 2002:a05:620a:4d0e:b0:939:8148:1e3d with SMTP id af79cd13be357-944215b76dbmr1780539385a.2.1793612661002;
        Mon, 02 Nov 2026 01:44:21 -0800 (PST)
X-Received: by 2002:a05:620a:4d0e:b0:939:8148:1e3d with SMTP id af79cd13be357-944215b76dbmr1780536485a.2.1793612660576;
        Mon, 02 Nov 2026 01:44:20 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9a767esm3081382a12.5.2026.11.02.01.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:44:18 -0800 (PST)
Message-ID: <6f842ef2-91d3-40b9-b22b-365be4c0c6ed@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:44:15 +0100
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
Subject: Re: [PATCH 0/4] drm/msm: Decouple IFPC disable and sysprof
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
References: <20261101174631.23637-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261101174631.23637-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7xMnNxyEuAIpGndfCfJZ5Du2-KPbQSUZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX2BBtdPXUae2q
 Vgfrln6L0OiftR2lyqf4PKpoNxYz2iuNZySA0WBFvwWonN2WYi4ea8dF5cjvJVPnCFZf5RRJEjX
 nK8qqyw3JEZUq8Yh0mhTUCQ7NVBsarM=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae85b75 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e5mUnYsNAAAA:8 a=D_WMUv83azVPUa-0ShAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX4mI9YylP74yr
 aF3KzWuti2Irkrfa2ouxKUXCqJqlcgM7yOkFcUEwwK5rW+lHo0a06PtzCioTK/i9QzENwGVvOFT
 pIjyKUi0gASGXokGa7dtAnperwWAoRVD50eix9wjc1RhBOScXqcgM0cRy06F0wy5W6ya82RDESL
 gOGYUcaCBL71PjXT2MbX2ky5hY5TS9Qa2b7zeqRjfY5Mfyv6AkgcMYpKtxr9AqexHeD1QwwoA9F
 LYPJyh/j6C9UpYoRPsig4wiVkWWE7n/7MU2XVkZ+iND7ule+doMLQ5l5o2/GLDY/tVpLLJs9c49
 GY4QoHK7jck8sx27ii0LOFVdbi0WbN1dRTIoGH3HRdqXTOv9UmqEpbKioQo8EEhu9dM5eB+Vak+
 1TBxwLR8e2j5MRwQ+TJHlAVjwl9EhB5Csorc+eqPqUqGn8D+14Hn76zuEdJ/pOYTXz4yFUlVCv1
 AblpqnmYQW02P0S0koA==
X-Proofpoint-GUID: 7xMnNxyEuAIpGndfCfJZ5Du2-KPbQSUZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020038

On 11/1/26 6:46 PM, Rob Clark wrote:
> Convert IFPC-disable into it's own refcnt so that multiple threads can
> request IFPC to be disabled without stomping on each other.
> 
> Extracted out of gen8 GPU state capture series[1], as other than fixing
> a missing IFPC disable in debugfs state capture path, it is unrelated.
> 
> [1] https://patchwork.freedesktop.org/series/176505/
> 
> Rob Clark (4):
>   drm/msm: Rework IFPC disable
>   drm/msm: Add cleanup help for disabling IFPC
>   drm/msm/debugfs: Use cleanup.h for gpu state dump
>   drm/msm: Inhibit IFPC for state snapshot

Sashiko has seemingly valid high-prio comments

Konrad
