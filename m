Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792753647;
	b=N9a9hzTN6IkjXUj+IHmFtQm3fQKT0UnL1c7nTNcCvQb5m5l65zUnOZ52MGpM7dLTXOtv
	 WY5ZZNWHuVK+kILrvlJNIw3Va4+96pKm+FFj1AmAckgMpbAu84C7NCRXLHzqykS8gO4BW
	 txQmVpH3HaE0pY2rqgvHsepUjNe8blF4GUvnJRiG6XOy9w3pNjIWsjD9UWS4d2ZYm3pNg
	 rQUojaCWsvh/46o5N51uG80v9FxXgOePD2WFgOPTZvvmztM6cBN0A5hyF7pOVcyfH9dqj
	 8XxB4hROYWmoo+9ukoSbp8Xl1l7FI0mi4UcVjSJDQTwApU6f5gu6TM+RogWORHkIknA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792753647;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jSSVqDq+NOelbWUVCaJ+EbCkgRjieJWhS34DS37RQKw=;
	b=QlJPwhU57e0ZsAbq5ZdbOcvNAH4DWkdAtuJ0p9NVgquf0fYCL07w4B9xQp+8me7k7NPy
	 XxH8tOP2Z3iwhGiB/CDP8vd9AboM45mYadlYYgxCnpebdF7311A9tGo7dDdlNlp/jeEhn
	 G/95ceGVIodk+jkpk0Vb9Izg2o99lofZzGk1ayEpCykCaO3efiKI/F3C5T3mTXAB6T6r4
	 rfTeGfZCQUT6VYvshT0Tv8d4Q+uMcjMawqaipwM+eFd2ppMWN64btanUfmECXqUfcnPf5
	 PXWDyjwB8bkVBQRIAn3x5IK3JLXLDYKL+PIJsorXqWWB0VnQ8jdmba+Gvq41zXh/92w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tqek0Ovm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d5gMHnX+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA034606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 11:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA034606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tqek0Ovm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d5gMHnX+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAARLF2463049
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 11:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jSSVqDq+NOelbWUVCaJ+EbCkgRjieJWhS34DS37RQKw=; b=Tqek0OvmJj+sI9Mc
	evX8s7G4Sp5KK0woDuKgE3OVExVr7iYp2IItDLMb9jrhdlQTgwLBvKubQvTDWRRG
	XG1JkFXxup5+Sfy2U43swlC5Rr6DrpSovN9ryKjXnhC7PdQxuaZHVX/AS4cdJn9e
	jEAxLTad2N+JUUFIcfNx+vRajIoQZekXi4PosnR0xEDlN+PGrEuwoqFZP3Ybbj1W
	DWUod81HOK5eiLosG9h3tbFeRS2lN4KWREZn0nl/d0VtEyRHJ0UHU0sPOGoSB2SC
	RZEHQlJC+i5SS9/Kuc/f7QSQotyAQdTBXqrSg14Z0LkfN5FUy1nx0Zm61RlnEFOs
	pNTaHQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw3vaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 11:07:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac58b24so19535985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 04:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792753645; x=1793358445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jSSVqDq+NOelbWUVCaJ+EbCkgRjieJWhS34DS37RQKw=;
        b=d5gMHnX+lN2GfU1/6X8HOVBpA+WX9nM3s0pJsTIQExZr33avwo4WxfaZO3Hk8Wdoyu
         4q3DQ9Qfp+JeDLBIqriUfm3eKDZ7W4WBPRNNX4OfooSOMgDhJ7nawLevCkJTZyuJnumn
         fLC2OxGeCgc4NdWvdZT3WenjgIuh9bV4bwyu2jsOlYTLeSJUlD/KrC/3sK/opew+MDbA
         stDOIvTsOSG1P05t/tLpnukea4+Q1RTqvFZweR1jWw5ItM8l9DCFrvAdvZjtdOfSsv+H
         Mop0Knhoem2sTJv90ZeafUi7KTwuKT3C9JWdn1g6Qos7Jv86GN6nUx0uhgB9gt3gB4v5
         l0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792753645; x=1793358445;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jSSVqDq+NOelbWUVCaJ+EbCkgRjieJWhS34DS37RQKw=;
        b=nD5ZE4NvTjcNiBhdhXgl+UfrcOJGH6YSAN823Nm0k7M36lBF1JGDH+RKRg2W/wItn5
         0EJgcP2TitlSupKpim6EUkH90/TDrb2a3cF4HqFhT+Ukh9Sgg7CmKd24Es3iqxLzncWW
         ncrjHe/oKpt/07HSzKXdNrZPKjwAxmag9eg9nfeZT5dqbs7dpq2G2dRZUnixaDZKyXVi
         XIPW/JinMA3uQLtju7U3u07hMA0i6OG/PUIh1SWxECy0liGlTVFC/brFaqagtwRKsqQP
         YmV/rd0iBATxttGuMU9bpQZyUYjQHgAVSaGn8ntTNaBVC2hGpCKUwHrbveVHDntLwT+D
         5IHA==
X-Gm-Message-State: AFq9FYKcDIj/7qV+63m9nDgK3RcVd5BD8KYhbTCvD7O6PUuAI0+BBT8l
	pNn59dPo30D1O9BLz9zRoCV2V3ixjt/NjwvQ4sPBr27OD3VTLHGDi5d5ipNrr8hLlJRXeegg9Qo
	hpQPCOGqyaDMBu6dG9qmWKKEipzeK24MoxXtgw4EPErWex4JPinoLqauwKLD8wVu5f0LP
X-Gm-Gg: AYBFou0lj/cv5J+OsPNEZirYwvOsFE/ci0i5s/7eswYhIamCWTv4HedmlXFkhw484Qv
	ABQm53NQBuh4zT2TNHLOGkFa9wAs5Nk+zerrZTE/jp2IRdVY5RtdHN9p8q8n/tuXd5A0lHXBHKV
	g7UTFscDcvJd19umyEW47dPpe7GROmcp3IWlwiNXs/66eD9fb/cB1x0YdnU9NUMsw7APfwLPX5D
	sfVWI0E/v9Y/v5gwx78Or3FzPC7CbG8cT19dbLkiUfrv7cnMEpxqOpRIZpbabiDq6AuKLpz/5PP
	F0IgQomI5jD4WU1nYjljHuJzjGz8X2LJ44s5R6FFlxNh/B1cDa6nyQnbYsW/cdUM/qFuAj40dqE
	dtsBFeLf/UQQShuy9REpNVw==
X-Received: by 2002:a05:620a:a182:10b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f6f9c2625mr321626685a.6.1792753644931;
        Fri, 23 Oct 2026 04:07:24 -0700 (PDT)
X-Received: by 2002:a05:620a:a182:10b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f6f9c2625mr321621885a.6.1792753644425;
        Fri, 23 Oct 2026 04:07:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5a90ac9sm91191866b.6.2026.10.23.04.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 04:07:23 -0700 (PDT)
Message-ID: <2cef48a1-7efe-4e02-9f8e-7da97cf8eaa8@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 13:07:21 +0200
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
Subject: Re: [PATCH] power: supply: qcom_battmgr: do not report power_now on
 SM8750
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-pm@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20261013002124.332111-1-xiaqinghuan@mail.ustc.edu.cn>
 <179249416915.570120.11194300523322683054@mail.ustc.edu.cn>
 <101257b5-7e43-4cc1-ba17-1507dad27b52@oss.qualcomm.com>
 <179275354818.2172689.9851715727007912571@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179275354818.2172689.9851715727007912571@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: N2osAnw8d35IfBwj8NXlkMA9eRc76oP-
X-Proofpoint-ORIG-GUID: N2osAnw8d35IfBwj8NXlkMA9eRc76oP-
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6adb3fed cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Q0jaTb4i31unmWYDfaUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MyBTYWx0ZWRfXxL2b1QvZdi7P
 2aFrGh8GMPRr1sMoiNauMw2+Me64uiwoipckDO2BtZGEU9uth5op/53Q1YhBEAIX+ah2Tw5Vjui
 CcY/euGM6BmI/ByZnrSGWErlE6IJBWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MyBTYWx0ZWRfX4vXn8pJswGit
 vpblpSoUmYcDidFwVTFt2XPhiaoEY/QV+IyB+Y/Fcx9Btbocvmo0S8jMALB/1MH2+i+GIIAnR5D
 RK/k+q587hbiHOWDEudktpNLzanzGrkd9wAPpJpnTxd1P9Ifx+zK1DjYktPV/NCOPlMzUCwv8NY
 x6f4YzAuRvpoKH4fj+asOtGVGieGwoJ1SPZSsPNECmTBQbvEGyPT/oRI5g6BczR0/dZp4txCuUU
 Wx2y/P9irS93vaH3r4hj9wNylYAWvCMGDfWN655m1omReYPUFbDRVJGYuvpFAvvmNlIAtqXPVWK
 1XnoA2Dq2L9H+uqP70yxHjXHM/KGbE8S01msRimOgNo+14zXebqh7/nxxFiwUw1IxdzJxiQqerz
 VBSq3HJiFKQECrF+5Q/9aDOHjJDMflu6NBPWQ5QMH8ZvQzoKqTwit578Hb9pd+YZLzZP36k6/9o
 vC4ffn+AlaBDvotxXGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230043

On 10/23/26 1:05 PM, Qianhui Xu wrote:
> Hi Konrad,
> 
> (Sorry for the subject mismatch - this continues your suggestion inside the
> battmgr thread rather than the SM8750 sleep one, since it was your reply in
> this thread that told me what to try. Feel free to re-thread if you prefer.)
> 
> You suggested disabling rpmhpd_driver.sync_state to pin the rails at their
> maximum corner. I ran it, it worked, and I think I now know why. Short
> version: the effect you saw is not specific to sync_state - it is the
> Retention corner, and there is already an upstream commit for it.
> 
> What I observed
> 
> Board: Lenovo Legion Y700 Gen4 (TB322FC, SM8750P, mainline port).
> Symptom: with the camera power domains powered on, turning the display off
> (DPMS off via the compositor) hard-resets the SoC. No panic, empty pstore,
> no userland record - the reset is below the kernel.
> 
> Two kernels, same userspace, same device tree, same module tree:
> 
>   7.2-based tree    6 of 8 runs reset      (your sync_state arm: 0 of 4)
>   7.3-rc7 tree      0 of 41 runs reset

Please ONLY do development on linux-next/master going forward.

Konrad
