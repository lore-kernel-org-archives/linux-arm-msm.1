Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806426;
	b=WNkPXKYZ6fh4bQA6LDx5WUFLuAczNL0KU/2pAH3yEuLA335G2OB+BnDaQhehE/bHqQcM
	 F8nvJvj12pyABggd0pgtkG5ut+rfTupbWx/+ezKepq+FKG2wm5I9HibB11Hosro97X5HO
	 NzqQmdfncdxCM6zU5hZ11wDp5kfyGIt3bYg7pdvYHyb/0MLrjxqlH5iofwKybc6O70ZiR
	 crx8LZMp5xMDobCqKCPtt58mAfextm9dEpDjEPxiKezgP9ehYguE5fPxzICJGbzrKzIPH
	 8yrsHPBBq/2jd7HWXVNJiji0CMgPNgXrTZvDEMiQ3trjGbGjHXx/gJAjIuz+Bmht+qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806426;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Oc+EV5R5qicUTnDYhrGYR2No2F9ftwOjqvoIR/sc2KI=;
	b=aIrNnNAfH/P+Ry3iyrXqi00XC6mZHR6exlXEJBHjDXBt5QkSla33Cc+2l6fWxoOJQOEU
	 tK9bPqifUuUheR9mTvGeIjd98rwTK2oyw2f2fCOea8mEDvVeg473o1xa/DlqS3CIpr4Mt
	 V2UtAKRONryeSHh2amHAsfRh1uJUSpiXTJVcguLNjAq2Ef0xXjc64biyTW7/uWiFaNzUi
	 LeoCM3eKGU6HD21oC8PkykJay9C81N+tr1fe+aoeFxC2Wyk7p5k3XsNzBsOQLWODbitra
	 cw1A1wJARE7HrnRdQbgaDNPnZtGso70hHjmj0V9iqWd97XY6Db3ZBMEBBdzHzgMF2NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n5lDlPE1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AdNqXRki;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673C8606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 15:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 673C8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n5lDlPE1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AdNqXRki
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4EHu6w3019317
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 15:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oc+EV5R5qicUTnDYhrGYR2No2F9ftwOjqvoIR/sc2KI=; b=n5lDlPE1Uf7O6RF6
	4aa5Gvgir9U27o1EbZODmoUwDgwjOWiv5/ppwo6knHP4Vb9nxIjcgla/YcjcmzgN
	dDZRaKgUUUioKyYZhYZpvPrFve1FhHOhXv8XUV9GW78Y/fZ9x5+ArmWJ1Bw9ljT0
	mN7vyXaR2qJwjTrXUK0zXvq7d6UFeT6DM3vH6ZIHD4k2ArykiVWhcRd0ZJIflV+X
	jX/SkjczYp89DQ7rwA2/YAMK99u0ltVdXBRSDTDAusYMP4nxtRy9UpaCnQlLZ9B0
	nhuvFMGu1/gVjUT2ek2uOejjr3mo65yrl0G8O5I24084agccrSdLaxIDPuyRe2ql
	G2aduA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj093m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 15:33:44 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-451d80641efso951540fac.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 07:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793806424; x=1794411224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oc+EV5R5qicUTnDYhrGYR2No2F9ftwOjqvoIR/sc2KI=;
        b=AdNqXRkiMfDwId68bO+bfVDeeCQG1h3ebhnQzScYGZ7xelaC2/RLLSt0T5K2wTua0v
         eXhnOJPJyQJ3faAkV0sx75gGppi4zq1ylpfrXYoVyUMSCfTptyjD71jC37Ai7uxcryC8
         UXboldzNzuZCtx7oNyk1Ch/zVN1TjLRxS018wfscC7Wz9ripAxqulhBUkSj6XTbKqQ9u
         kiiSA2+YpXPfs9u0MlCdjKsSWvMVDcvWLoBaSgL4AeT9GtlcYgl2vtK7DjcVVKgtEyy8
         XPUi9TrBLY6r+NdcPV+mU6tWN3+lrbdTLOEdDeq5xVoWn5fzcbmo6y6wQgdoTi+hrjf1
         rFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806424; x=1794411224;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oc+EV5R5qicUTnDYhrGYR2No2F9ftwOjqvoIR/sc2KI=;
        b=pQ25ehM4OfQGhXxqaK8kIoKeg5dVh5AnywyUpD1yL1uTIKAmsOVQoP2QQKcj1aGjmw
         srvvlPakFq2qGl+rVPFD9v0Yk73VHbBb961HN0sWIAD/kQfTyGalj3bcYI5UqJH1wyl1
         E45q0pF0xCi5R/U2MU/b00Bq8XDCRPlIuIdG+Nue4ikF6ODIbkdJAKYj1Wuic8V2kkyp
         R0MhlwtOm0j4sulik2RnkmKmGR0145OVOePwlPi4/ca1PcfIeN+i3B4S93oGRRbf5UPT
         XH8mpLs8rN95rDniQQe+MA7lAeRNaOoYfxQ7MKxV/4mg+/HaF9ME5vFbQM219HDpfr8T
         MJwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNR9FdFMadWG/D1uVDJ12vktOexvrhz/IxBTaYKE5PHT0McqmoWYdONY2OBjyv0BemmFG6FdB/+eEOz1cj@vger.kernel.org
X-Gm-Message-State: APuU4Z/+QJZFE71mb+rmW/cBpcF3QzlNCR71IqgFw9ZOCPlqm+islQNi
	KZXfp8K7hE10xktAlmU2kJjmYt7HWjiczK7wu+zJscmPzReeKdk3PxTi/i0lA2KVYTT9T8I3jMb
	mbswyaSKAbkG8CA+8wJal74KrVQ1z8xlJ/IfbkrnehLcvdFzgnL7D3MEE6E2cVRVcw8Oo
X-Gm-Gg: AYBFou0wlVEJfm3Mb9N8F/1Mh/6zZ8gYFfJq+cmSUtQxPMEkhea3h1Kma7/mivtzmK/
	+FYENQKRUOhM7934cNSHjZ18C7YkWSXH172hy2PjFY1S3g6cCU8b6BO76c2VBeMUXJUP132xRqk
	TT5pMnP6bnRwKXZyM+OgcCihiAWgBmeidlFIq/W0n05FJqvG6LjaxHGzW/vCfLDxYFWSINrNjJ/
	sdo2AOcGeG9R+TSX8LEVmSEvG/aPsUqBF3q42M+GSzeJWB0WYeRinwo7lLyRq1DHt0OzGUjwDtC
	CFTmSEQkX7LSVf00xWcZ+Cw/HBBluPODURISqiJXPprrtk9g5FKmSHjNtO2PWzT2M3G6v9cHV3W
	jIX3iD0t+Yo/bAYxqxHNpTaZ1z2lEW6FvL2sbUqwlgZSyvEP+80fNIu8qrWrlz11bhGw=
X-Received: by 2002:a05:6808:1996:b0:4f5:c4b9:dc14 with SMTP id 5614622812f47-5640dcb744cmr12375082b6e.13.1793806423728;
        Wed, 04 Nov 2026 07:33:43 -0800 (PST)
X-Received: by 2002:a05:6808:1996:b0:4f5:c4b9:dc14 with SMTP id 5614622812f47-5640dcb744cmr12375050b6e.13.1793806423309;
        Wed, 04 Nov 2026 07:33:43 -0800 (PST)
Received: from [172.20.4.37] ([192.210.17.203])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm1961627b6e.11.2026.11.04.07.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 07:33:42 -0800 (PST)
Message-ID: <98d01186-7d87-459e-8c18-db201baef34a@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 16:33:40 +0100
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
Subject: Re: [PATCH 0/2] thermal/drivers/qcom/tsens: Drop __init from the
 ->init callbacks
To: Christian Schmidbauer <opensource@grische.xyz>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261104145740.2623473-1-opensource@grische.xyz>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261104145740.2623473-1-opensource@grische.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2MSBTYWx0ZWRfXxY7zKyD8cn4Z
 dKxZWYQq2zbcMIWjcymJAEM+WLehJLYgFpL06+hPTMU0xCuqju/ceNVJ1GoanjIO4E6/IxCg+FX
 bzxZUwPacETv7UeEUFRBYxUfO51HDsXq/AmJyfR0u0JnexDjp8ugygOCkrNzDu7gaxfhE4OrS4/
 5pPfaVFD8j5agJLtKJXXuZtRbdS3e/WZGARmodB+MsFOwtPhbjX3hrIJKoRvtOwOg7ovkhUq+zQ
 DP9iKW4s7aOvaMceTla1SA0HSPWAFO/8PTKiibkyKvFa17RCTrx4T7Yc/J2wFI0ZrDeN7vCTajA
 ht0523oSJnfG4N7xdL/i97BjHPqoqplAP/BZzTRfeS1w/sQgrmo4I/AciZs8o6zE1xhpgLtIwE9
 Xm/0ed6T3uPR1PW4IRIo8iOrLrD7wG96/8Lh9jmJ3hLGwikPJrHc0KUi/ejLA3UdeiQRJubGA+y
 A59MJISGKtGfQTMMKpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2MSBTYWx0ZWRfX56VZ9G1jI6/0
 JK3H9VO+gGnXQxNevdTXIvp8+pxQacPN4iZ64ffrTtseL19ScXtoPVGWpOH9XYWEeRkKdLFYk9C
 uWqJZUdNa4EOJouuOmUL31hu18GUBr4=
X-Proofpoint-ORIG-GUID: 8KFlpR5yf81lQd9eAM4OeXAOcYtZ5FBX
X-Proofpoint-GUID: 8KFlpR5yf81lQd9eAM4OeXAOcYtZ5FBX
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aeb5058 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=3CSVYe8HblTQFsWiJzwA3g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7I9-Nl3zapt3FfmOfCcA:9 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040061


Hi Christian,

I don't see the patches along with the cover letter


On 11/4/26 15:57, Christian Schmidbauer wrote:
> Every function that tsens_probe() calls through priv->ops->init() is
> marked __init, so a probe after free_initmem() jumps into freed memory.
> On IPQ8064 with CONFIG_IPQ_LCC_806X disabled, fw_devlink defers the
> probe of gcc and its tsens child until the deferred probe timeout,
> which expires after init memory is freed.  On an Aruba AP-325 the probe
> then crashes in init_common().  With CONFIG_QCOM_TSENS=m the driver has
> the same problem once the module's init function has returned.
> 
> Patch 1 drops __init from init_common() in a one-line change that
> applies to every stable tree.  Patch 2 drops it from the eight per-SoC
> callbacks.
> 
> Patch 1 was tested on an Aruba AP-325 on a v7.2-rc7 based tree.
> 
> Not tested:
> - Patch 2 on hardware.  None of msm8226, msm8909, msm8939, msm8952,
>    msm8956, mdm9607, ipq5018, ipq5332 or ipq5424 was available, so patch
>    2 is only compile-tested.
> - CONFIG_QCOM_TSENS=m on hardware.
> 
> Christian Schmidbauer (2):
>    thermal/drivers/qcom/tsens: Drop __init from init_common()
>    thermal/drivers/qcom/tsens: Drop __init from the per-SoC ->init
>      callbacks
> 
>   drivers/thermal/qcom/tsens-v0_1.c | 9 +++++----
>   drivers/thermal/qcom/tsens-v1.c   | 7 ++++---
>   drivers/thermal/qcom/tsens-v2.c   | 2 +-
>   drivers/thermal/qcom/tsens.c      | 2 +-
>   4 files changed, 11 insertions(+), 9 deletions(-)
> 
> 
> base-commit: 2dc1f296b5754dd2441fc8b6613a362a47f6b98f

