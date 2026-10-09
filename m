Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B973046AED3
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 23:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791590172; cv=none; b=l9ojs53mWNieolz9qbaV2NJd7fhu/BneGxAEjLxMwNQXsAjsppWpSvx8u5UEbCYPfbKK8FwKpDvAR0IPy1HGVhtJm3nlQbEDH3uhzalMt6DqP9UlykViI4hYzjyqgc5xaFStYN7YuE4nrCF+o5y9pm5m3LFo+ZoVgny6ko1vshg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791590172; c=relaxed/simple;
	bh=9z7hYxQOC56YcYk/la0dPkEnEgUTeM+W0hts9a9DAQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=caf2DjR7VfvXwjD6MMoS8676nQRGrwBP9TmleeuF+THFjsfKs8/Cf/HJffBrzEywBWUvxJwXOx1wLFhzrbVQGvdJn5yT9ZayxPFNsAWEuig2KOU72CgeQnH1OSjMr+Jj7e0bTnNDg2o+4PJtUdmEG2OwQvizSMDvR/cm8ejJ8Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJj/w0u2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oqzywpsc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJj/w0u2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oqzywpsc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699NKNgn3714870
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 23:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sm8UHt0kUeP9v337omYSKLBHjxWM+fIM1E1WXPZ4J0k=; b=QJj/w0u2RDGgekrd
	cAP3WliD2fOKkfKMSWKRMxj9RMXdqP92SDKtMDO0fMw/aG2qMd6m+5hW3PchhkHD
	2nvWkBY9O/wR4TKcuwgXPKXepmDA+we3drKc592+/1OenSWZ/kYzW1U0TUtUIjIf
	y3DEqFwcKSaGhjHRudqXtidWUV+em31rSJWV+mBPYq9a+kgs4DSuifEgW/gbTIDZ
	oEMrqn94bujPXuOktGUlicG3clXjCQz6UQhhbTKuO1P12m6+aR2/SGPCmfunOLNk
	wYlmjcIjta628pgRGhCrjVtGCflClm1D2bG7MZk9nppSwU7E631i0Hju6Kw9kuPO
	UWaTWw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t8h62w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 23:56:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bf4c0af4eso517223085a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 16:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791590170; x=1792194970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sm8UHt0kUeP9v337omYSKLBHjxWM+fIM1E1WXPZ4J0k=;
        b=Oqzywpsc0p3pGSXaYuY1qf6oV3ajs8N3qhcqhrs/Jhf0SRI+FKpbWfIXsr6rdhY/G8
         bFGQpEVrNPbFVHYOIxNBcPKVvza9NouD3nMM89YPjOy6VTu5BQDtpPUJYNcFkQcrPvR3
         j1SJjsszukTpPQ7WoUPwYngzAyXW+aYCG41WNx2T0HMGubKnbp+x2aGNOZPtAo4bGKgm
         267v1OvRrrVWy52ncCspa7x0P34cHmgqQe/3Fv2HR7awNgIK5p0E2HVIQZOx6hUqVLP8
         W/9nMbD9tQEG0gzkEK6UStQmimaNs1fSxF6slWBje6DG57lUvd3D1txbZIMRAntG/Urr
         l/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791590170; x=1792194970;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sm8UHt0kUeP9v337omYSKLBHjxWM+fIM1E1WXPZ4J0k=;
        b=FoNtdAzf7FQqQXymwZQ7siyRT9Qv/DZqCRxn8jjTsbnppYNYana5KUMR3FkNwnjYRD
         Io+h4icAcD4t2Hl5fCbMr+T6phJsJBUcTeTf57SRWYo1g0Ka3xj/I89Pe6DG3s3u9fbr
         nYAW1Ky9M1GIdVqzKY4/YxitToSHWeqBFuumH4owGwppgkkqKv57xQjWKYrTnUper13L
         7wzRvUcddrvFE2opktClx4dc2X52G4jLw5839WHS/361mIygzdo/W/2dceIvU9K5NXdo
         p8ZiF7CZPR73MgPf/DxStAggYFoSNYtuRtdEDluRM74RBXraIhJhTcrCetBBme7QMq8+
         QuQA==
X-Forwarded-Encrypted: i=1; AKwUvByJbAj9iPONhdFoajb5gs/BJl5OqLkzWzax4oPIqzQh8NZf2rCN89ZNE00xhRP8KkI5I6LuwXqPzDfuF91e@vger.kernel.org
X-Gm-Message-State: AFq9FYKtCjMM1eLsLZouxDsaSISS8TrxS5bqqAuI+GH1vDbLuGfEyVXK
	P5hUOJWck5SE4BnmAN2ZJMz8Ybg7S5vOCtMhVD+M/TMnBUMXTWBLe5GPA6PiMERF1Q+lQyuvmBX
	5t7/l+DhucOjLZP8r1EXQl3SOo96vHVwRELCF5CptfrgVNimT3KqUNHUlEQXF8fe/kI7m
X-Gm-Gg: AYBFou0uuH5ydFgIx92vv2j2oLINEL8AAEso0OdV1cOeruRcsa4HAM9w6k2k2aWvkgV
	+baRkDULNjwmXwx9/wN7Fmys5P/Tz1k5MTw/LsOb36gDhLm4IdiA2LiOtwtqGe709H2thldWHSq
	j+Per/wZvyG6Nl7bpihj1b35a3qWoILGmZ/HxexwJguvqwSyorHD/GvZMkUuC9MD0nFK+mpbYVb
	B6pLWMJTs2IoV/vKPBe+VtDe8WK9MK4zyTqPKqYTDCqdzdIJdCo5vJWaEddPve7WfN/5O2JzZwA
	yY08El3dKLq32PrCPgj1S85zu/G53M/BAoHpnyEj1uutHoVn9Nkxg5/EiPD+BAKQ96PglUppjt9
	YO2UO6GnRazjhaIrmVmoHDimi4w8xuw==
X-Received: by 2002:a05:620a:17a0:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-93ec12d54f1mr427906785a.39.1791590169792;
        Fri, 09 Oct 2026 16:56:09 -0700 (PDT)
X-Received: by 2002:a05:620a:17a0:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-93ec12d54f1mr427902885a.39.1791590169279;
        Fri, 09 Oct 2026 16:56:09 -0700 (PDT)
Received: from [192.168.0.31] ([212.5.153.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e30a7sm6357514f8f.12.2026.10.09.16.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 16:56:07 -0700 (PDT)
Message-ID: <6713512a-d879-4fdb-9138-12e125c21ed6@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 02:54:36 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] zram: Add QPaCE zcomp backend
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, axboe@kernel.dk, rostedt@goodmis.org,
        mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, djakov@kernel.org
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>
 <20261001-dramatic-hasty-pug-68ebfd@quoll> <ar4070oH8lRCJMRw@google.com>
Content-Language: en-US
From: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
In-Reply-To: <ar4070oH8lRCJMRw@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA5NSBTYWx0ZWRfXzut2mFOrwnzX
 eNbvfODedev+92KN1USeCFbivpqCt4vn70o99exCZ4dqKSesQakLC8HzT+dD+ANhMU+MSngeb7q
 qDba6SWltHSoIrqtTROj8Yr1Eat0ql8=
X-Proofpoint-GUID: F-UX0lxbkiG_TORy9xQW2IU2pfQEDvr1
X-Proofpoint-ORIG-GUID: F-UX0lxbkiG_TORy9xQW2IU2pfQEDvr1
X-Authority-Analysis: v=2.4 cv=AMIlxa6n c=1 sm=1 tr=0 ts=6ac97f1a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=douLNevBrtimd63D7eljNA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nv9Pdalr7dmODPptRzIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA5NSBTYWx0ZWRfX+OlVjaJCWPf0
 Hizdy6f5LjnwIbDcEe2F2fpZg1RDQdeP3uYGrgvnLT00kpcUUIuWjNbrSQ2f2gbBUBJHaSCjsgd
 aruxRBP4IrMpWcX3j39JcXhJxeZOzVE4gH7Qx15Wm/n4qLcH96kWdY9f6OAdGr2AzM5schUG+WT
 V7MScMHceLtpi/CpyGAoupGqGonUWlxismJ7+M16u6T90hVrNGUjrpTXYtdHojt/ZGZ0rB8i3MK
 0fhSyW6LzaFXA8OUEV60OW52eUFnJtKkAMEhz5cdtT0cJ0vU3Bcm4jY//GuphRMvKMgEsy6JVuf
 dUZ6lrWNDYNnh/gDh3vOPYGxWWeC5cjNLCFbIpgSmpcojwRgQiT4maJha4IXxScamdmt58TU7+U
 4IFdnk8NR8bk2uan0T63TeyKh+nrV8BMJ1vVZ31NrSGkdh1LyVES2/KQcgIZghkrel7LigSRPkd
 b1YmftM8Uml98CoqYJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_07,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090095

On 10/1/2026 1:27 PM, Sergey Senozhatsky wrote:
> On (26/10/01 10:51), Krzysztof Kozlowski wrote:
>> On Wed, Sep 30, 2026 at 07:52:13AM -0700, Georgi Djakov wrote:
>>> Add a zcomp backend for the Qualcomm Page Compression Engine (QPaCE) so
>>> zram can expose qpace-lz4 as a selectable compression algorithm when the
>>> QPaCE driver is available.
>>>
>>> Compress and decompress operations are handled via the QPaCE urgent
>>> synchronous path: each request DMA-maps the source and destination
>>> buffers, issues a blocking hardware command, and returns the result size.
>>>
>>> Signed-off-by: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
>>> ---
>>>  drivers/block/zram/Kconfig         |  11 +++
>>>  drivers/block/zram/Makefile        |   1 +
>>>  drivers/block/zram/backend_qpace.c | 134 +++++++++++++++++++++++++++++
>>
>> So entire qpace should go here, no? Why did you create this entire layer
>> of indirection, singleton management under drivers/soc?
> 
> qpace seems to be standalone/independent arch/soc specific, and can gain
> users outside of zram (fs compression, zswap, etc.).  zram's backends
> potentially can disappear all together, if we switch to acomp crypto API.

Are there any plans for switching back to the acomp crypto API? We moved away
from it some time ago and dropped all the crypto dependency in favor of the
custom comp backends, right?

Thanks,
Georgi

