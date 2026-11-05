Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914067;
	b=lAwTxkABHny9Sx4zi8f01XuKXGj5NpL/2QLstB3DS34D72hEZNj5pgAk/lieRdVCC49J
	 qIovfGxLpeWxyLP6nhC43e/qceFlsRY9TFcq+pvR4ylbI0tXI60iSx9sPa0Cvg7vuiCY7
	 d92ZdS6AlsLd1gGOvoNOeMQgnrW09op1Rsk6N/3US3P2daPs5uzKNpXyRnYDal86c/i8f
	 IKeGZrZqmsIhKzenaucLJd3B+RYGUItRivERm2breHLiK/oEo+hbOp93Mhkwt56Fx+JFg
	 Q1t/LGY7eY/cmX8xwug5e9OsYTpkbDfEWDbO/mR0gWGSl38lW+2e1VU9JcVL8/leq6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914067;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZWnXimVpeQxb/+8pu9gZLHGbBkrdMiXRvBKJrkwrSno=;
	b=bDYj3lCbvDmcL9pWMDbuCi4NJIePiJCqYDfL5I3ruqwu/4c5oLX/etWavrH8FCQ51KXO
	 N2YU5dRnFMyu19jy+dxRaISdigVF1EiPZOVXC9HTlzwI3HTAo1SXwFvaxIuvR/kvwFS5K
	 nv2AqASBYVnuAc0nmK2ziU9sCNjgeWv1WQqFvZhrJwKjt8YA0udF3JuePEynGjRzVfVl6
	 QLHhkbodKLpV14Nok0uef/NxgndIMvlK1nXZlBoQxfJ4Thny8AixxHo3Niipbci3OcC6k
	 ITqc+FjYmqKFG7bPO/cXmxXSqzMB+hNrF9kIFt9yFKNSLZlyDSbZeNnE3PLVzjQf3qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CVsdHCQv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C4qq4Dzd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74F8606A329
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 21:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E74F8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CVsdHCQv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C4qq4Dzd
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5L69EO844637
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 21:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWnXimVpeQxb/+8pu9gZLHGbBkrdMiXRvBKJrkwrSno=; b=CVsdHCQv4Yh9N6q8
	riZuA1weyRqQjS9kyvUPvnkHayKLNCqxz7VB6mh/XKWqSc14Iv+AQlxsM3ajCWa/
	o/RD6PMzixrN8SlognVAeWuvk4vTpOqvnBz+UctsBBtiDfgIyjbN+L9xj0ZMVLff
	NmYZRoqpwB81nsLgg+CwO/gWVXaoLolsqGLqG+KhJWWDs5O+cFLpzMu3GkbmMw0/
	bNB1gSqCNDqa4DMsMDhfz5Pmd7OpQ8ZV0Eoj8rsXLduAs851Jb3lfAVDNKO8bRYg
	JArPJou9AKWvopAQZ3soVW2flwjKR7KoEOhH8B86jG+pHl+eXVxBUX0cuezVOssV
	5QWhrA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hryvv0h6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 21:27:45 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso4638812eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 13:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793914065; x=1794518865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZWnXimVpeQxb/+8pu9gZLHGbBkrdMiXRvBKJrkwrSno=;
        b=C4qq4DzdeaEamJtXDPIDiWnU8LKLiHM50QDO4fm5ulC1h+UIljnB9n778zdWfD/ugl
         EBEpsXA62K9R/H8ES6LQVBNX8kFP1AdU7D88X+sLs84BfqNEw2kRtAtg3i7CHDfEA9q1
         itGH1Too3rF6jznqtQZFJgLeGc1LglcWDq+6BO8RL85KVqBgYMZ+xbKaLeQOWIhGMNLl
         Dy4dbU197VPqovH745/yLhEvOwPKZFUMukDq4cYhNfmkS73NMYyf2YvEyIbm0a6kCshq
         JYkTC1kHkSW0q8JuMw6lzOmiW4+IC46tMIfprDvp9C5SS/vYcoqBNSpMxr7WM4hDmk4V
         Uzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914065; x=1794518865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZWnXimVpeQxb/+8pu9gZLHGbBkrdMiXRvBKJrkwrSno=;
        b=gDGfWK9KFz9u33LVoc6yni9oDS86Z9yLAz7r5MlkavQq+dWA2aXcV9qx9MVNK14wC5
         U40u9uw8G7/fYsnxpfGE8+dXSwoVQF1RF/CGqnWxHPE5zO+U+u7tealk55DjXtTeYiV+
         74SDPCdvkkLGVG50wbz7sLgYtX4v1q32MChBQ3zh512lT4JG+urWHX0TMXsDO3iok5R1
         Hw+fYSDwULCb/2vwIK2Wi6buZLAwff4HeXusUAMr9KhFouesZs3ZYuURGDeYubSNtkw8
         qDzdYN2rBW7uX3zLDWpst0uf4LXp94GGDQefxEj6l9HJAtjX4CBp4QwLLY4+1+7lCZpn
         ARKw==
X-Gm-Message-State: APuU4Z8fNwclKDqgRf3tB/kFmRpTl2jp5Z9D8vuH/XRnZ0R/5GFUjNnK
	F7ac/xxR8rBP7AvSBZ2TIlzGKtNpuxrRgiFiubUrMfBSt704MYEPVu5lm5Y3Ynbr2XgW4RxSupW
	m08N++z3+G8y7astFAorTpbm3DbJ2+ijjJ7G7NSz7pUwdhDaUw9kyQa3t2EzGvTCoo7HvLwhLok
	Yr
X-Gm-Gg: AYBFou2ejxC8u+Jdne0NQ0RWyo445Wr47uWCvo4b9c7Jdpwc80XinGROLBtKqijjQg7
	6xVaMdgt4BvcYBZAjc//ky6V5u+csEI/Ejin/svh24TPc1W3/bkUTk6eNOxneJlHF3leZKTUfR9
	7T49AbxGQqHqAO38SGMr+EVgf7oj7rl9Phkug6l3rd+jJR/8oMFsR/iq9SfNIv72ZkTCfAUy312
	IpMaNs0J2ppPsZuhgR7VMqpsrC4hzWMrpntGK2IWt4cBmZPLZtefyOVCt5ppG2GaHwbSv/xdw1P
	USNdAmARsOAUFF5o0wm4tRRQT0TBU1/bri+3aCCEwI21cIjo+TGr4oObfiXk7Q72YzH4dmOTDvt
	56A1TjOrf2BXVUks5LGANNtHpTO1X3f3+ebGUqLOVlPIvxHXNiiL4oANuagbQ3tVVt6+jEXA=
X-Received: by 2002:a05:7300:8245:b0:36d:25e:1961 with SMTP id 5a478bee46e88-36f76c16096mr455673eec.22.1793914064585;
        Thu, 05 Nov 2026 13:27:44 -0800 (PST)
X-Received: by 2002:a05:7300:8245:b0:36d:25e:1961 with SMTP id 5a478bee46e88-36f76c16096mr455637eec.22.1793914063996;
        Thu, 05 Nov 2026 13:27:43 -0800 (PST)
Received: from [192.168.1.9] ([106.222.231.155])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f7369c69fsm912457eec.6.2026.11.05.13.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:27:43 -0800 (PST)
Message-ID: <4eb8aa1d-08ff-43a0-ad85-85005b0bdf33@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 02:57:37 +0530
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
Subject: Re: [PATCH v6 0/6] drm/msm: Decouple IFPC disable and sysprof
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
References: <20261105164158.23263-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261105164158.23263-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NSBTYWx0ZWRfX/FRa7Ji675xS
 23ZahJmRvnwb0ktlJNV48tu7GGZ3MEckbcVZg18BUokqtVXJRX5mqrmdQq6z0AF5mlH38NeNbtR
 JTLyTh7lpozMLEakCnpCqxSHxTprXkk=
X-Proofpoint-GUID: CkdsXHv4RDCVAFJsqoq536300-QvEldw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NSBTYWx0ZWRfX1jx5sAH9xsiF
 2ykOoHN68PZHPKTxXugVNHB1ujOB5DeZomDpkh43hNQLVr4/7jbjiMSkdnmcYJmYDhOvU/w1Ddb
 B2Qnnv8oiHrJbO3GxoHoLrseliNmfyz66mAOrNGt+0QKgdALggaACyyU+eYgd+Ov8XuZbZgL6XH
 fIymldvzW3hYaN+50+PM+SnAg425WmZL3OvWKNh8JGyfeanbpXbtQSCJ0nlQAugISZa/jmwx10U
 B1acqTu0VUNtqUimy2Nz5KxjEioQ5yr0Cr2tpstpR+8Gy9KzZficKXY/JwPyNkAmPI21JhLjTUw
 XMGG9Tb9Du7gKfevPgeq7ohwXYsedJKla6MhxGt1fwV/cB3LSFZGn0YR0XQxVCGmNJ3ennCrVQw
 dbmQ4Yw32x+2CvGn2Yzj3BA/4Qcu79NCWXhA0QRWYm9qbpEmcBxS7k8wacUGFkMj5cFWBEj3bng
 epsuG+Q5VcLtEYGxpFw==
X-Authority-Analysis: v=2.4 cv=dKUzC+Zb c=1 sm=1 tr=0 ts=6aecf4d1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Hj0ah+TxS5FywmoD0uLh0Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aFxOFIhO4BgZX6uqFnUA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: CkdsXHv4RDCVAFJsqoq536300-QvEldw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050085



On 11/5/2026 10:11 PM, Rob Clark wrote:
> Convert IFPC-disable into it's own refcnt so that multiple threads can
> request IFPC to be disabled without stomping on each other.
> 
> Extracted out of gen8 GPU state capture series[1], as other than fixing
> a missing IFPC disable in debugfs state capture path, it is unrelated.
> 
> [1] https://patchwork.freedesktop.org/series/176505/
> 
> v6:
> - Fix potential runpm ref leak in sel_worker()
> - Acquire gpu->lock before runpm
> - Fix unmatched OOB clear in a6xx_gmu_shutdown()
> - Link to v5: https://lore.kernel.org/all/20261104175931.28475-1-robin.clark@oss.qualcomm.com/
> 
> v5:
> - Skip unneeded msm_context_set_sysprof() call in msm_postclose()
> - Fix potential sel_worker deadlock
> - Revert back to original gpu-lock/runpm ordering
> - Link to v4: https://lore.kernel.org/all/20261103231850.17493-1-robin.clark@oss.qualcomm.com/
> 
> v4:
> - Don't clear GMU_STATUS_OOB_PERF_SET in suspend path.  Restore it in
>   hw_init()
> - Don't require gpu->lock in a6xx_gmu_ifpc_update(), but instead warn
>   if needs_hw_init
> - Move perfcntr resume to after hw_init()
> - Link to v3: https://lore.kernel.org/all/20261103184713.29664-1-robin.clark@oss.qualcomm.com
> 
> v3:
> - Rework IFPC disable harder to play nicer with hw_init().  If we
>   need_hw_init, simply update gmu->status mask and let hw_init()
>   restore the OOB request in a sequence that won't anger the fw.
> - Link to v2: https://lore.kernel.org/all/20261102190010.720443-1-robin.clark@oss.qualcomm.com/
> 
> v2:
> - Fix double acquire of gmu->lock
> - Fix missing a8xx hw_init() path
> - Link to v1: https://lore.kernel.org/all/20261101174631.23637-1-robin.clark@oss.qualcomm.com/
> 
> 
> Rob Clark (6):
>   drm/msm: Hold runpm ref in set_sysprof()
>   drm/msm: Resume perfcntrs after hw_init
>   drm/msm: Rework IFPC disable
>   drm/msm: Add cleanup help for disabling IFPC
>   drm/msm/debugfs: Use cleanup.h for gpu state dump
>   drm/msm: Inhibit IFPC for state snapshot
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 27 +++++++----------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  9 +++---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |  2 +-
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c      |  3 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c |  5 +---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  1 -
>  drivers/gpu/drm/msm/msm_debugfs.c          | 32 +++++++++-----------
>  drivers/gpu/drm/msm/msm_drv.c              |  2 +-
>  drivers/gpu/drm/msm/msm_gpu.c              |  5 +++-
>  drivers/gpu/drm/msm/msm_gpu.h              | 34 ++++++++++++++++++++--
>  drivers/gpu/drm/msm/msm_perfcntr.c         | 17 ++++++-----
>  drivers/gpu/drm/msm/msm_submitqueue.c      | 20 +++++++++----
>  12 files changed, 94 insertions(+), 63 deletions(-)

For the series:

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil.> 

