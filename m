Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1A94446F7
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 11:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433938; cv=none; b=og0X1mIv36gvmDhEwroUA99ppU32VD4x0YRQephEFSR+W9CiGbT120BqB0+QfbuaJHys0d7P4kSm4nUv5S38K8hcAAo+aJrawTn/Sa7MLoptvjKfddRMVAZroq3K71sir18JPG7t0KsyAquDWgAe5BixtHpNRU671tumdXocsLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433938; c=relaxed/simple;
	bh=6e9pQsXZZQk4BKW/6pEfyREJ9Gd3PYVS4aqYk25zbZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JqWT9teRyQ9Q0AF/Monnt2g6AgyQKa3Ixt8gRkSITGMx4WkWZ20wMFqzBS+duzPEn+zKt0x/IihOG8f6gq+hevNhUaZQ27wbRWeQnoPeWBMk8UqATPAvC0E7hNnK68Jlk8BL3T2OcUmy66P6d0vayG7/dKkH2CfQZEQpS5NcmBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LJXVP97H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HYjhUylJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LJXVP97H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HYjhUylJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683B0NdX753090
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 11:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lXuegiGWgMC7LS4JW5DZVIPYdBVcElPGergWXc3e79I=; b=LJXVP97HayG1Dv7C
	jQEPU0vh6xtXnb6/P1FBhjS0Fqw74DGzxDyaQ66EdZCaN9TeqcDlPaQyFyXQgqvB
	4qOi8wsjiDTEN6bemi4S8mCZ3k11WwOb+8Zq4Spg/ug9C8Gp9KZ9iK6jea2/1Cg8
	MVAx/KxFPSwWHTrnYldy7VnQq99mww3l7v4awnNm1tH3uOChwS526ZStTjg+/2dt
	k7e9DsRB8Y+3a6djKdubpGFBwbHCIwTziV6Qo3xVbBdvSwd2zzg2GyWq0b949yQf
	P7UnC038QumCkqvlm0SgELGkX/4iL5fA4THrrtQIibSNR5Vp5/mVVW49bwcUsX5U
	7yYZFQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4hf9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 11:12:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39533bb224cso3134500a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 04:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788433933; x=1789038733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lXuegiGWgMC7LS4JW5DZVIPYdBVcElPGergWXc3e79I=;
        b=HYjhUylJKfLv4jMco6yDIQ1iOtfdz6RRTQBreaSMDpng/SGft/cz+QL9EA7XYQ3vwN
         oHoZi/mU7JSOsOc3HrXytlrSloFQtZAEW2638fIHNX1EY5w6wkcI1KHKjfJvxNYU2wgT
         2orMOcRAJ178P+dbQotxSJWygzo2J3rpFNHbQiPbSQt1oXyJddPrwd4+E25jTXq3Gkw8
         H39y1QeavdHyIvJg53FIO8OCxFb+JuszIhuOmhZv7bjvREBAVEx4/9uIouc0Hu5+ZQ3b
         MBq1E77bgxzzrn/ExNdCMRdzpGKu/Tkc8lvfVyk9TZyH9ZU7Q4maxdRBwYd+DXTLcG5I
         olIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433933; x=1789038733;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXuegiGWgMC7LS4JW5DZVIPYdBVcElPGergWXc3e79I=;
        b=gTyz7GjeJlDLbpF5UgjWYwMwVTLnyH3ySU4qXtGpNuVFuFlY7VrZRPWS5Ny1+l9hf9
         j0VR0mfdU2UOsM3NT99Idn3VcQcU+9L0OLip4c8Bss/ZQzJvOii5S/t4UTrdA12ZEO9h
         nuxZoGJf30BLDWAJWyf4fl4tl3Uu0VjfmM0v//pyetkwq10xfp5SdO05N1OEFD04M0+2
         KPPux0rCsR5obijHm2mVqIMIy4GcptgT3+drzzQ5l2lmtlKn6+ssezMzeO0RO+2D00dQ
         fxnVg15iXIKKT3xmu9tL1HQLD7GJZtJhxnk5yVRLojoTVPlLhNOlVTDduoCcNLoKnDn2
         VTpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxposU/a0Q1IFbDnYHtHAT3xqUo/DKoiPNrCjFc62KFxtqHnAAO+WrFVBWMh9rd5Zi0UOjtwJAhNIE85vsE@vger.kernel.org
X-Gm-Message-State: AFuF++lfsfTAjbTzkVcByQj7HIUeXgae8mcNA5Dz4j5M7td0xmv2b9R+
	+MglvfPl7w+KUPOGk3Wz4SjOoI6svuXrz3ekRDly0V9AWIFKZQNsi2IQqLkCwIFSY+5xZkc9MHg
	K1KYkqCHuQ4rdR4/bFQ7467GgtFnHSCE6mHED+ZPL5bABMPrTZq2VvIXOkUe1jfDtPlhn
X-Gm-Gg: AYBFou1vSBQtHOQ9k2ceCykEQJENjEFxCpDX4CC72DYvCb4fZyfpz0bpFQJ6vMHa3pk
	5dWY7yAVwYsQ8CegK7JLMoG02P3fPiQqngCMarOLpj6TgLTFWJFO8I2t092FRSpVRizO0XijiO3
	JNQ1moeYHOkCT3XZlB6x8AaVBh2S7v6WmABOiQ6C9fBQYbVRHOSNNlU/2jntrm+IdxhWfdhO5ff
	DvG2vTBl9K3gcrLRqKNj766rjic+APpwlQPzawO1KvydfkL8lZYumbDUULsR+dsmvXTPmeWAxZV
	FwazrIxG50SG7dlFdkKzYmExlgzteb+wxuAd7oOb+v3FMu8GY3oAz3yyYrpMKPg0PCmTWpSDESl
	+/N7nSvlG+7Xc7lGZuYg+fDbX1cIiRMH1BlyF+X0SEGhdjJVegf6RFBl4PZ1orXEa5adnkFCf3g
	c=
X-Received: by 2002:a17:90b:2d8f:b0:398:9beb:5c17 with SMTP id 98e67ed59e1d1-39aee13d992mr19020408a91.18.1788433933518;
        Thu, 03 Sep 2026 04:12:13 -0700 (PDT)
X-Received: by 2002:a17:90b:2d8f:b0:398:9beb:5c17 with SMTP id 98e67ed59e1d1-39aee13d992mr19020280a91.18.1788433932942;
        Thu, 03 Sep 2026 04:12:12 -0700 (PDT)
Received: from [10.133.33.193] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm4905284a91.13.2026.09.03.04.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:12:12 -0700 (PDT)
Message-ID: <60b12a54-e930-44d6-854c-0d76eabc50af@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 19:12:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] pmdomain/cpuidle-psci: Fix behaviours for CPU PM
 domains
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>
References: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a99560e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QURvCu9eW4BULfhiHY0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 3jv3gK5XROrQd1gbRaCi2kHoqPQyTrfc
X-Proofpoint-ORIG-GUID: 3jv3gK5XROrQd1gbRaCi2kHoqPQyTrfc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NyBTYWx0ZWRfX1vonzn1eI8RC
 Jvc1Z3Wh2+QkhBxycowhLZ8rD+UTyhOwKBTJiEhhyNPFOsA+9tjkCzRsVuvJDv+ryrcw1IKQtFS
 n1ZuLeECVAkzs0JCX1QYQG/0QuO6Mto=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NyBTYWx0ZWRfXwLGTAfc1VHJI
 Y+xmzg++FwgdceGhtT9sHqqkVwWueN7ss02eOqelSspYLsNY08Uuji/UxiAp9Kqrcpt8xks8s8E
 mkCE/NTn5jJdBo8ker5U4SYwhdXPo+Unbe5RWIb6W6yL7q+WiHxFOXK+49DW0/u69NoVF3aZHMj
 +EC/4xtvecF3Bl79A4y2kcCNLq5F4CS1htsYqrK2PBOoPBNofZeJqvSXvRIraLVewoEUgE+PlS9
 T2mpDBwxpuGVhqkl2Sfj97rb38X2POabNR4qu1qIcM+NAHDNXR8ZOcXxsvGMSWBY8MbTzCaV15+
 pZiyDjxt65Qnd1J3YwlanTRemsgjn2ry0Ll4tlkBglBY81ENjsLI5TvU1mh9rLtbr1D8YxroeKd
 cC0dGaD9odNRXFBKNeJ4Tc6EauediYP8rWZ5Mx7YUKp7EUWXc9K4stcOKk4zpRXZyn3JKsBK70h
 VNcgQbnQOFbz8TcJyMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030097

Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>

On 9/1/2026 7:14 PM, Ulf Hansson wrote:
> From: Ulf Hansson <ulfh@kernel.org>
> 
> This series fixes a couple of different, but highly related problems, when
> dealing with CPU PM domains. More details are available in the commit messages
> for each patch.
> 
> Note that, this series is a follow up to fix problems that have been pointed
> out in a series [1] from Yuanfang Zhang (Qcom), to add support for new
> components for the arm coresight subsystem.
> 
> Changes in v2:
> 	- Dropped the RFC.
> 	- See updates in the changelog for each patch.
> 
> Kind regards
> Uffe
> 
> [1]
> [PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc support
> https://lore.kernel.org/all/20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com/#r
> 
> 
> Ulf Hansson (5):
>   pmdomain: core: Rename genpd_status_on()
>   pmdomain: core: Allow a non-CPU device in a CPU PM domain to do power
>     on
>   pmdomain: core: Add a genpd config to support unknown initial status
>   cpuidle: psci: Initialize the PM domains in powered off state for OSI
>   cpuidle: psci: Move initialization a bit earlier in the boot sequence
> 
>  drivers/cpuidle/cpuidle-psci-domain.c |   5 +-
>  drivers/cpuidle/cpuidle-psci.c        |   2 +-
>  drivers/pmdomain/core.c               | 111 +++++++++++++++++++++-----
>  include/linux/pm_domain.h             |   9 +++
>  4 files changed, 106 insertions(+), 21 deletions(-)
> 

