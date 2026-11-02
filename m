Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620368;
	b=IfJoKz3d+QW4gOPd7T3k7oONIwcDkTxk1c4Evo6SCcnQhkL/8d8Cyh5Zcb9DhHFKut+z
	 FWPENZl5y9WRjdopMrKCw9x8yZMAL1cQGKdUjAgSHqMTu77grN7av2nkEfMA1lMc/3oiy
	 7v0hT0zuuqImw8u6ewuzkVxYGvx06FwpmdgCHQ3+bT9l9LNzgyJoWEyyDya5NE/O/xqQq
	 7l4zRmMtU1iPJzGJJ5tbQD+uyU4kmydZDvVT7DeHH9zXRsHi++f0n7F5sVSFLS8TDpnF0
	 TnHIk3GJnHASrxheLPV8JVV7EK280foA9+NIMfMpdjf/SSEC43rlLlHpkb/0uVx0v9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620368;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=B4TWMT31f/lhSF0WZOCkUp8azX4lSUxZCkskOlZFhzE=;
	b=Ud6uQ8plkY9Bu9MtWokCdsMGX4oXkZexFrpRn98TBKyZVC20XIEYksK0uLd8E32QIdGn
	 AXnPVmeekTr2s45gSs68X/zvh/vc9Kw/wS+6Jf9EEWXdW6CINwdC+eiQJSFzaq9jHfnBL
	 MjaxIVftrJnZGKgwPBAFX/frfByEoBfIVVkWNKsnaRh38CfScN8YIPonacPQUwxOxnVH0
	 2LSj45VzRrpiEceHNiuNMAQqucvREMJs18WXf/E4dR4Dpe97wLK/dsMRbFsX6AGnCCbkT
	 mMYJYON6L4hPQnf8/rIr2fnf2lzkvRWPXjV9Y7zMPHUpfQ4VWvjscBHwdKACUa9Ybbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZK8uRJta;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A2lFx1zE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829C9606A338
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 829C9606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZK8uRJta;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A2lFx1zE
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AQBX3086616
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B4TWMT31f/lhSF0WZOCkUp8azX4lSUxZCkskOlZFhzE=; b=ZK8uRJtah+ubMnvj
	orvcU7wwTQKwfVht408Kwkf3kDGd5XxojLTa3Bvs2SeMGciAjtT77smbZM8fNNSp
	cwIn6/Qi89iHaffUh8EXJArcDIO6+pngczv7Oz71xEe0ThyiATeIrGRT9blXeTcn
	b8MhroVQx1gaqwibC6tCq1grkPKBprx6cGel+dDW8c4CE1UaUc3a0Yl0vBeBaj/U
	GyOkv8y3Pmz4k2w17HDHQOPAOxt+6GCANZ1elT/8tf3Q9zXv3YJjzM7M16T1ssjI
	0xMrDoPB7vOlWDh44KhtPdcF+PFjyyF3XUoqrWsYGqAY+FZ55kuQcC/CqS082Y2W
	AThmWA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61mtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:52:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-943fffbc5dbso43551885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620366; x=1794225166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B4TWMT31f/lhSF0WZOCkUp8azX4lSUxZCkskOlZFhzE=;
        b=A2lFx1zEnQwm2k5Q8oYmA+oIsHwLVUxJMx8jLYiGkys9vShjGLWRFZDMNWXrKRlyBF
         n5YdZgt8t9MV6kZ4QlIAh1UdecZeQFThaWSnqy1I3rQzss/x7kVFdV6YRovQyKMQhPDf
         t9rlbPWX7R7lld/m5LPsrGdbXrc8QzVglT80oBHE2QivEK4cHDpQKLS7SwbL7EzyezaS
         eIXG49yhYi9IoBHkpw45bGGqMDFWtwV4tmJAgCLyvEg8d8OhRM8GHKd3/+8RZPPocVM+
         bdcuR26rIWwvh7j2VRGVB/uSBIj3NmVouagM9jl/nIl1HVpx3/ofQy3DUIvfI6w58+uU
         c5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620366; x=1794225166;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B4TWMT31f/lhSF0WZOCkUp8azX4lSUxZCkskOlZFhzE=;
        b=tgvNIAxWltWbSj/y/L4e2zd78Ri/1D86NXUD40wLf7ppA23Ultt+Z3EfGd5EruLNPO
         7c+bnl+pLsfSthjCAmCS/l2Os1LR14IpbQI9rixqkEPCvuGTxfF2HrmC6H27T4CYm/bN
         rY+rAWqZftaWiL00dYTT+6G+2el4wTYeOpoQ7oevtzNzChuFrYLEAqSRlh0KVRKCSQrR
         XTbEunxs0qQhh+w141gCulM2bWGe3L7edw12YqEFR3a+UW08vb4zEdErnOJeL+f2v42f
         3TYT+REgt96STYCOL9Htx7HRj+2QeZNDbXBApM6KH4AzMosG+U3EX+GzmhUEI9pGQWbY
         zPlA==
X-Forwarded-Encrypted: i=1; AKwUvBzYZMwtIQ6IPsCIJpaDeXBFrDpisqpRRDzaOZyjG/H2ROk7ZiYRfM8pH5GbNR4V7FwSiAozmESD0icc8Pci@vger.kernel.org
X-Gm-Message-State: AFq9FYIlwLZ5hj1+qrxWSZAQC+5J1nL6+5Hakil//9hpopRsKvt491ph
	+Fi2O3P8tgh8Hp8K0EuXBH/GN59G6LP2KJIsxZeVPcXzl54S5LzeetmecCAnh6r0+laqvDGR0t8
	EBaqTRkijQH4au0EsUAxxAspr25+KAI0Pkegk90CS1qJ7AqEHo6i04K/XpvubqhtHUQGM
X-Gm-Gg: AYBFou0dme5v6u/SR7DBRISnS70aqN7GnegMPui1kqt6WhU5eEyf+YQuTKVhgHtmW6G
	uEKgVnjsOGBoF0HtKTRDCbx11nmRLRIq/7pYljqDBYIcUDuAS3qC8GLpOsirec/x7vKY/Y/Kra8
	il/KXGlebZSqSJkNgNlGCm3N+WH5UBtfj4H34LG8CMf9Rp59XlmLtdDGcTfky0b8NBUhCUe1QYP
	LNoeAQi3FiC+T1pkK23uC6j4PR7wH5YbZHxE0HpP6jrXNEFxxgPCLyHRv579k4H6C7818lWM3MY
	sOT5sjK11avS1Q8cvwFHo64Q9esoYrQhALOTYGxb9/Pw0OD8LJAVGRE6+J1cw32RrNdP5bsGkmm
	eeRUiLhb9gf2C0pG9Q6/GNT+jymv6mdZMX+/t+Vv/x+0T+1LnpTQSg6nhAWrBhGiHZ5ueXzY=
X-Received: by 2002:a05:620a:124c:b0:93e:571e:94f0 with SMTP id af79cd13be357-94421734130mr1759800185a.3.1793620365691;
        Mon, 02 Nov 2026 03:52:45 -0800 (PST)
X-Received: by 2002:a05:620a:124c:b0:93e:571e:94f0 with SMTP id af79cd13be357-94421734130mr1759796085a.3.1793620365012;
        Mon, 02 Nov 2026 03:52:45 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe8f9bbsm380330766b.67.2026.11.02.03.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:52:43 -0800 (PST)
Message-ID: <4a145c2f-24d3-48d2-8e84-3098604bcac4@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:52:41 +0100
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
Subject: Re: [PATCH] irqchip/qcom-pdc: Handle ESPIs in qcom,pdc-ranges
To: kernel test robot <lkp@intel.com>, Konrad Dybcio
 <konradybcio@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Stephen Boyd <swboyd@chromium.org>, Marc Zyngier <maz@kernel.org>,
        Lina Iyer <ilina@codeaurora.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261022-topic-pdc_map_espi-v1-1-7c481a42bac5@oss.qualcomm.com>
 <202610270827.7SxHabHO-lkp@intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <202610270827.7SxHabHO-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4nG320ThPULgg6SvXXKzxWogvQa2qvGw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX7d5ScW/Rw9j/
 VH+8GytUZjadFEPFbOyyft7n7psd+PcVQxLyl7VWu2veNfbVJHuaBkRtca4wdj4Sr8WTOSgzpag
 m87oceftnpYoVNYbHoNgMExYSjlxrMM=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae8798e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8
 a=QyXUC8HyAAAA:8 a=bDLz5rJQdqquShatwagA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX4G/wOY8DlCsI
 guOTEc1nB1iy3P8UY4jhjOODnZn8LN2reSKKIIs73R/suDXPsgwGeYXfK8O1wy33Ig+9GdlvY1N
 u1hMWCvB5wZWgR+kyxqj6KFiRYVBrySRQm+t79V3gNoUUKUCdVAZee2rzCXvy/W70fjB8nU8kKa
 M8cYyM/uwckUsRCgSyycmrR7d7/vkfDQwxrgnNHVfFFyMAGYyNqdOB9EpIe+kjCwjCTsJ2uyMh/
 6E7WILPDJlihZlTh66gkoFH5c0nxcEfcJEsfSuAG0Ox3ktpsrPkoyek/zR86QaRkTCfFsIhHeLH
 Jmf5j213tfuzL9DBGtWmVwdPxiTuyXKsRGI0OcjrAVB/nx0R0wTXdCOGuFnFnTb2OMRu6UogVLC
 DNq27i/7r2WeoO/9jLx/LlRRfU+x+QAZ5IYzBYZesVTOuuNw/xtNW6eFKGhhKQlCc9/600SGaKF
 nH5aH3q5SiY9p451YCw==
X-Proofpoint-GUID: 4nG320ThPULgg6SvXXKzxWogvQa2qvGw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020047

On 10/27/26 2:08 AM, kernel test robot wrote:
> Hi Konrad,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/irqchip-qcom-pdc-Handle-ESPIs-in-qcom-pdc-ranges/20261022-104402
> base:   2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
> patch link:    https://lore.kernel.org/r/20261022-topic-pdc_map_espi-v1-1-7c481a42bac5%40oss.qualcomm.com
> patch subject: [PATCH] irqchip/qcom-pdc: Handle ESPIs in qcom,pdc-ranges
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261027/202610270827.7SxHabHO-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 186e70f4e6a1521991d2340d3d49b23b1beff11f)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610270827.7SxHabHO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610270827.7SxHabHO-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from drivers/irqchip/qcom-pdc.c:12:
>>> include/linux/irqchip/arm-gic-v3.h:605:10: fatal error: 'asm/arch_gicv3.h' file not found
>      605 | #include <asm/arch_gicv3.h>
>          |          ^~~~~~~~~~~~~~~~~~

Marc, would you prefer that this is resolved by:

* redefining the number in this driver
* using the raw number, perhaps with a comment
* making this only buildable and COMPILE_TEST-able on arm/64?

I think 2 is reasonable

Konrad
