Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601092;
	b=V532A7z4m9+mbWOPCx8+PpzxrxM+HOfk/vctnj4oC0tZmv4DZkGHKMYeFd631dZ8DQJ3
	 n+msIl8djnH/Nj0O2sKhZoq5ygHK/bmSjEGxR7mKtT/JqfxRrE8t1a5QDXRJzY4OW9Xds
	 lRvioY3JtcOCxocDzuEDT2DPzfti9Zmq3TUuw2q3o5LjRqtCSFzLq41su7Kk+LWD+KtBq
	 DF0JkFGt758qZYeyPpLTE7XF4X59lGSLSYeu8TlZygjx1kBieTD1coeoZCZD+bcfCoMrZ
	 DsLOAZDJ2GqGSdPAd/jBaf+f30pcngfsD3ua3jtRl398pciYbshi0GcLEJpy1QamT3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601092;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=etGgwq6UQispo3f+AA3xA57FPijjtc6+G4aS1BXg2q0=;
	b=G5iLHhM5KEw4WlwFfmGoPthZ1Jc3K8WDUnTZYPWUtvZe1GVfG8urJwxcXIW04dX5scQq
	 IR09x/oUyM3WZVkc5LYi08TIi3jtU5VOxdXjEDNf9MjVQpW8r1P7LHHrOhotNfd0Gb7ja
	 fAkRL0kQvQ61vK5uHsEl/mwVIWz0OKdApLq+AskflOxQcREyw3sItNKpBmLqWUJ3yt6k1
	 UMTQHgU2icbqcjJBAjXqVAYGn7l/rmKigi7htchxbo3a+6nrKStzPSDJYx8QzKcDdSgES
	 k1IlhnYJCL/Cym3MSRMKdnvRKS6WYR7eKxRlSj5NANoKgWJdYfmawuyvHHQkSiWCTEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AWyHI9ZB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cTPPO0Nn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838B8606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 838B8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AWyHI9ZB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cTPPO0Nn
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mNA6555513
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	etGgwq6UQispo3f+AA3xA57FPijjtc6+G4aS1BXg2q0=; b=AWyHI9ZBVqSnO/8k
	s3R6QLL3aKZGyrRk5UlNvJVHYDWxafTzttqw4QBV1iA96nd3BLw9fVK8FAJnZcqi
	axca9mszpX78SmLVrir0fVI+BBcl2NQeGrU+p4L5oPGPF7pWuS/qY1/dYpP69V8p
	9PUYs8SlGoiIgkE89vJ8aBQao+xjY0ntcNR0lB1uld1LyrFImjgg0JZHR1JKJY79
	/VJlLk88S7JXR72o6q2DPQ9YlPOTdAlNoLd/Vr7CJJhvJI6S/eqHVrVfU+5qXapw
	t+OcWzfEPAm/poP3YnUOt/OjeoQ01UaXQ5z3nS4xN0lEV9ejPKqfZHCLOVX+7hom
	Vjs3lw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnr83a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:04:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94965dfec53so68570285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601090; x=1796205890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etGgwq6UQispo3f+AA3xA57FPijjtc6+G4aS1BXg2q0=;
        b=cTPPO0NnqHqKUDwYrHMKGsGrVX6rwWQOmjw7+9iRvAkrri1q+4LN0bAsBxYseoeE1L
         JhnYcHJbaBB/lg0+1NfB7oeHRT7SjOG6whF/HvRRT1vBm3rF9fVblrCHZNJ14ZdU+NqX
         K//NQguJvyebTmGacZjGFSKlJgLT6UXKOo279PMAMOqS7Ut/JkYbJJDN61RZomwwZ2ah
         bZBsrvzjMZENE5e2wKVbcFLuaghCEAD26Aq+0iZafiPjJeF06cnyL1ZGRBHEpKPi4kaJ
         5P6rcKFC0g87f5CVEklIIJa/oN57yskH90hfVoGnzFqQqoe62zF6tDOyq6Zagvpn3whX
         8eiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601090; x=1796205890;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etGgwq6UQispo3f+AA3xA57FPijjtc6+G4aS1BXg2q0=;
        b=nH4get46XZfzxfecCYZILiVgwy0BtwLUVg+FuG+a/8kTueCzCDEpepwnOXqtS7isCQ
         ZAdTLAlrPntP9LdUv9c6ZNVUPnGEH8tamwAXY5M/JIP24SJRNQhGmPt1iYIPmur1MeV6
         iIkX/9c/2GGr0XT0XuGGpCk41BzyB35sumYGA4lZQJ4KZL8uTyrfG0u+DAkkFzEfN/Mz
         /YcHP+dphQMmpHpPs93bbtK9jc0JwoYtR9LAeuGg4iR9ZrVZldL6jDitwQeEjfut5fQw
         zEfdjaWzdTjlnthJic4hv2erujqFPX1Aj1Ox/CRAs7rdgv+R+trSXbxYsF3/i2hVcOTt
         Ad9Q==
X-Gm-Message-State: APuU4Z8DsqUtvY+/umWJPmzI8xuOUqaeooppP1vAfQDfnJJoTH0oGFxe
	CzGqh5F91SQKuY0jweKSqy5yAod8PhXUvD0JdoDeT5BN6hVBa19vNQtv9pwxzX6d6kJrbzLWXV6
	qMd/wrYEBV/vVqsYZ9v4bNkTUBjHoseIZCqly8RfBNf3s9nzyCoL+FPhqGNlgWLxKdxEz
X-Gm-Gg: AZFdTZeCmQLk9mFsW1oRzeg3uzqRdthH3SxSHOUdhyspJti6QhvSH+mwrZ1rRgrU2Se
	kYpXXOlZ0AvsKxCA0r36B5aKvD3XKb8q+mdc27Ih+EGbQWqPVoZisFHC0iX5QdaPJO5FjWWtElK
	xfPscuCriBaUzM/f42f/uu+lcHRVF1/H4WTwjObJDtAfkVvE3C8aLB4+8P5hHILqJbGjtV2YDEH
	ZzZwuzm+LsmGjl0n9zU3wdCXWEMdr7Ulq160db8YZYf0fD1rpTW/IC2NsolAlvYN6EhdfG+UDT5
	JapwS/l4rhwwGz10eLXRtgtbvaI/D6YjHofBdN5XEorZWeXBuO3tg6vMEJ2e8mJHgVSV8Jclz73
	paa5h9gipEzwov+FqZdeVi+WXF+MAm49oosI8x9QMr64motlbKTYoogzSLgTIdZDeqmxbfwM=
X-Received: by 2002:a05:620a:864c:20b0:949:728b:51f with SMTP id af79cd13be357-949bab797a6mr2862182485a.6.1795601089713;
        Wed, 25 Nov 2026 02:04:49 -0800 (PST)
X-Received: by 2002:a05:620a:864c:20b0:949:728b:51f with SMTP id af79cd13be357-949bab797a6mr2862177785a.6.1795601089242;
        Wed, 25 Nov 2026 02:04:49 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad01b0bsm614267866b.10.2026.11.25.02.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:04:48 -0800 (PST)
Message-ID: <439e3917-3125-4602-a81b-26aae8233595@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:04:46 +0100
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
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Save the need_pas_mem_setup
 into qproc
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261117-qcom_q6v5_mss_msm8953-v1-1-0fdaea2855ff@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261117-qcom_q6v5_mss_msm8953-v1-1-0fdaea2855ff@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX2bN0IJ4I9/gO
 sW6PDhf5a/l5TRqofYqqzC4TGc7gD+0HGJr5hHW3MPbek5XU2/3LDwpUCmE+m361ZlJNOTfEtgh
 7BQ+mklEVdA/oLTjHZ5EtV+Ua2G9u2jD1v5Ru9lBqjo4gl/flcR3C4SwgoigavmwmsZw7bHJedl
 0V4VKbkgdwV2ZJUXu69NiPmnDBDWN+7LGRzwQOlaIdah3cu2Rw40id/AKvGhHLUJ50wiM17DnAa
 XIsX3CZn3Qxj+0aBggjKdAIVZ8NuxZa5sL7XdfWiXu28LXkLdsjSCYo9vp+EkgHGcV6hfh4ogkZ
 pr1T6sVQx99miCkyPevKqRGCeqVUZbjMEdIbcHRbckw1K6vSPFI6TYcZtDnWSMhqX9RlvmV8/MN
 U0yamk7KTovxC+vkCwt1F3eD0VtID99zgWEcIVbkxTNJEN+K1Dpeeml4aEeoyuTf7Fve4OC3pMT
 uYoxrMzXdZyiouYROYg==
X-Proofpoint-ORIG-GUID: Gk9CaKqQGPR9yuLZPcktXKzD4iTzFvcZ
X-Proofpoint-GUID: Gk9CaKqQGPR9yuLZPcktXKzD4iTzFvcZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX8Fni1PB8Dd4k
 A2TuIJ2AhvZYRYXeanxA7VZ3UoR4KMzcDlXwTfqSCOGssRstOMWFgD6brBbnWm2OHHf/gAxabxH
 f3oF293Dfi/zP944MJEpQtc6HxHEGv4=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06b2c2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LNBVZBixs3kL4_gL8vEA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038

On 11/17/26 8:51 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> On hardware requiring Peripheral Authentication Service (PAS) for modem
> memory setup (e.g., SDM632), the remoteproc subsystem skips hardware memory
> authentication because q6v5_probe() fails to copy the need_pas_mem_setup
> flag to the allocated device instance.
> 
> Original commit didn't save the value into the structure thus quietly
> skipping if (qproc->need_pas_mem_setup) condition.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-83fcbc28-236c-48e4-a6bd-731f4361f9ae
> Fixes: f56052f4d87c ("remoteproc: qcom_q6v5_mss: Introduce need_pas_mem_setup")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
