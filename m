Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9458E4A2078
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 11:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556758; cv=none; b=rFSydbCDv6w+k1UC7Z1CQ7gWovibFMxOrAeZUctnBPnhyxZI6IGd/j8ECCrBOquJj3WqDvo9NtTiazQgOeAMoWMcUw3Nr8dceS7rdmyAr4AVnVAksvwz/uMlOfPhaI4b0LXO+zGifQbX1oHY0ihIUj1xlsPwzUPkjMlXuvYJR54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556758; c=relaxed/simple;
	bh=M3b7vcLCF4NPMxZ3ZX82+QlHQZlC0pfWJmSdq3RAlRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=COwsgicGrC2WYvRNE7zSHDyA6yIWm0mphZsSSFeQtFYCo+neFZK+wwvsDU1cZQmif1v6el/f43m1WPu1Lxo5PKlXPplibR3MdFq/FrvMb+SPqHfIBWCRSB3buoC9lgiTVp/paYbF4JNZktPzVbK9UM06Vi6gTjUMW1z668IV32o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RWfdU8rJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ClTo2FHo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RWfdU8rJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ClTo2FHo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92gkX2477693
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 11:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	78RH45jGJ3qYRyX0Cn1bvWAKRmZzAW7/P+11DCJ2RqE=; b=RWfdU8rJ+up6Qdg/
	jhDp1hmNO9mtw1w7Z8t3cRWVelU1LZLSa+DOJxYmkusUpHLG13OneCrTCjppkeSM
	VD6b12xiEd1Ra5JG90q6UBifUEKbHURRykcQjm878MsJkY0O3WKR9+a6sdbAJjnW
	rY+IaMnN4R91fkJPrC7WM3hglX/8xIyfzGHOdcdN0vG9ekVxAJef4Wkd9sMW51Cq
	t++q1W0ZwAiYDT94GOZg9e8eL+JnTnAO4bvjb1tVU8W6wQf6yVtPNhO3oR+PZLNi
	cCHhNTqjv8be/Lzqt5ud/xd9JciLv4n309dXNYXyvQfVTH96XyS3J9V0Bozco7fK
	KoS2AQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjckt05p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 11:05:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b8088202so4928168a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 04:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789556741; x=1790161541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=78RH45jGJ3qYRyX0Cn1bvWAKRmZzAW7/P+11DCJ2RqE=;
        b=ClTo2FHoLcMpP2dmwvK7d2W0S/u/aQ1yJiV5d6Ar2pdz4SzS1NKhkNP3unRY+14dh7
         2OdINdRX/iZlfKxNNrD0tPVABaj1tZjO+9R9JOaKoyl4KQPTTHMdg7G+lnuVE9VylWSg
         PtP8nwGAe7aypEy73n5Qz70zbSFxy84K2qFor/y4DpXjfFywmPYo7rugds0rv1vcT7PV
         1d1U1Tmtc4jFPhrl/zB4fZVAOcjK74+MwJGBrxTk8vPZkJuWao2oXdGjamF4MG8O4K4f
         D691Ju7Q78ASkYIVG7cOx8kDJDCD+sNyVI09zDFKfnrVS7E/OzDVGsOOVmC/51tZq7Vy
         4yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789556741; x=1790161541;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=78RH45jGJ3qYRyX0Cn1bvWAKRmZzAW7/P+11DCJ2RqE=;
        b=XbB6ccEq+wKMbxN6I4Xv5aqgshW2nrgD1WMydTKj6pDMh8m5jgycd75NTqQ9WZQiqO
         Wbm04kFlf80hbDAglASwWBLUJV1pjZopQ4FPsWD3ku8ePnJilGwm1COPs0RcWDAvRaGC
         qR2WQWdpNzzQN7WRgC5muTAfEqkvXcSzle2YLiYp7REpIc6Lb4C35VbfWatTFptX51de
         qurjhvZ956cXIgZOWcstyR6DdZU9SDCWCYwVmRIp+AjRxLNEwXddnWc3bMZ3cg1tR+ma
         bQ9E7xV3T6r1Tqs0+bUdmYleaxuTZN04e9HkWnza9j9XW6xV/GF+ARZtS9LEp05I0lvB
         aoOg==
X-Forwarded-Encrypted: i=1; AKwUvByyVrtbIJmmK1vFuMj/bCrRm7xmRAyYbO/rtjOupyAPBjWaqksZQ+PwYmqzufTuN3mS+f4YcMBFj8sV0Ck9@vger.kernel.org
X-Gm-Message-State: AFuF++me+wSsPUzdogO8jowo3aK8iAEQnQtrvJ9BY4Z4jaIlNnS/96LS
	S4GnY64dMI6pFdbfoycYzYAh39dVGL3cPhVNl6nj3yxcqvaIiySjP33EgK0yPkD+1G4IN5ErAgy
	JrUc9rNW+YdbJWqdWBsW1ZewNFZ/1PDqGp97STyjbQrnpwg0g2yo6G0CU06/X7aMQlYqe
X-Gm-Gg: AYBFou0WqQjhc1AoW12LUF9l4T7+v85m1LY6i3tpVUagzYJIHgkEwnsPjJkBEzJCl/c
	+OA2UGAzHGgfAxyLEKiYgci0a1O6k2Ws4JSFpmHAsmRB3uxH6IqROgBJOwmPE/lzeBYDJr6kUqC
	vnKuhhGZqI4jK9x9A+7ctEHAha0NHdHjYfDj5wEL3p+RaqChOy+WNf8N1d1lrlJu3t5BEfip59Z
	TXrthx4EIshWlewrAubyONvjJLL3iDJMFZ9i1O3GeBS1uRaR2g3ZngpdWJveSdhd50v3ZUIWQNw
	ZoosuzfIV8ixCwWUQ+tBtAZmU5pesn5n8tzMwjSUghPiYkL+TwCTxe/TMW/WTeIUhQiSkSkZd6V
	T3xJW5hk/CDzaiN86k8Mxng/aop2s
X-Received: by 2002:a17:90a:e18f:b0:39e:1315:a952 with SMTP id 98e67ed59e1d1-39e1e4deb71mr5857113a91.18.1789556740878;
        Wed, 16 Sep 2026 04:05:40 -0700 (PDT)
X-Received: by 2002:a17:90a:e18f:b0:39e:1315:a952 with SMTP id 98e67ed59e1d1-39e1e4deb71mr5856987a91.18.1789556740360;
        Wed, 16 Sep 2026 04:05:40 -0700 (PDT)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b2753csm14822916eec.31.2026.09.16.04.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 04:05:39 -0700 (PDT)
Message-ID: <ad4aff4f-2d66-425a-a358-6cefaaa1319e@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 16:35:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: smd-rpm: Skip proxy votes on clocks for
 QCM2290
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>, Georgi Djakov <djakov@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com>
 <dab99b27-ebc2-477e-b56a-26250aceee23@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <dab99b27-ebc2-477e-b56a-26250aceee23@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE0NiBTYWx0ZWRfX1cdHYOs9Sr5p
 fs0/hfl3VMQYRPJsXrv5yTFewnCUYgT3uFlSYdM0YULR6qIwi1gxnaHV2mHizPlAfbAq6tgYvnx
 bXxboNbTUoQRcJszDIh3d9zHlqisQLM=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaa7805 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=SFMMcejBtk9OI5fOnjwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: uS-lFzWbs80DqfVvsBEuCDQ2IBJj_-JM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE0NiBTYWx0ZWRfX5CaJtTRVX0BI
 BjEJ249EKqFSgDFmJYBKarflsJBtDB1xrseHDM9LzNsHxjYHoWlx7QmG5LpxusMQV6O0jWrEWWa
 xvy2w/OwlwU8gnKWZAA2EvK2yQARF5Hbr0UqIWpornRvKZ0f89vY19LlkmwlPASY1Spt7668ApL
 /YCkkhUPap+Ysir/va3+6yjdn8d4VgUkkb1tzUhIDQVw6kqthwg2G5LcyuCy6n0mz2P335738Oe
 /Z5lPz/aKIctlrrNCzKH+Zl4drk8SN5dAmvmA0xuXu1KNQvkgzUitJgOjWBIQxTZh95T4KSgCRc
 GHIB8JLJFyjR0AHPEQ/4Mn7H9Zk16WsaPTxQiHUAZ2hayF+LBTF44V5ypcm3DlWkBKASpPOA7/K
 KhjIufywxo6Fv4ok4iB/bZy1jGbo1rNMeb8WGDH2R4cZSBJmLqxo54AVHVvpo4xSKCQUGmMD/n2
 EhTvxyxKvDJ4XAnefqg==
X-Proofpoint-GUID: uS-lFzWbs80DqfVvsBEuCDQ2IBJj_-JM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160146



On 11-09-2026 02:36 pm, Konrad Dybcio wrote:
> On 9/10/26 3:44 PM, Imran Shaik wrote:
>> clk_smd_rpm_handoff() votes both active and sleep RPM resource states for
>> every clock, keeping them non-zero until a consumer takes over. If there
>> is no consumer, those clocks will remain active in the idle scenario as
>> well, and the sleep vote is never cleared, blocking XO shutdown.
>>
>> Introduce the skip_clks_handoff flag to handle this on QCM2290 clocks,
>> keeping other targets unaffected.
>>
>> Fixes: 00f64b58874e ("clk: qcom: Add support for SMD-RPM Clocks")
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
> 
> Are you booting with clk_ignore_unused?
> 

No Konrad, clk_ignore_unused is not present.

Irrespective of clk_ignore_unused, the proxy votes are placed to RPM
during handoff. If no consumer takes over, those votes remain active,
keeping the resource ON in idle and preventing XO shutdown.

Thanks,
Imran
