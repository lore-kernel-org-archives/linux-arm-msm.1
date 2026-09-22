Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70BD530E04
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072082; cv=none; b=QR9KMagdI4ISDQ3LXGXXVwYfFnwalwYGA4xuCNFz8Oz5e+6SkHfnu4qqgLQbEz+HNi/j3xABh31XVg17cNjBmsJ7SXHbVi0vBuVxn2KypD40B8bboTrmSWd7vFSMsjnHVgtTsKDH/vV4Epm9AHg9TWsOd8Cpxt7ZQWS09LALWoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072082; c=relaxed/simple;
	bh=te1MmRG7Xxhf2ipJsVG0r0wfnHerGJXp1YCvt0VRkBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UqNxEvCzPMF65VunDH9nWhSn+JfKc4JlP08VnbVf2RaHILKVH2vul6J4yfOOCUhLfmQQ11S4gI9H5y2vmXr3teFwGes5QEb+zaO7jvndxQpajKbucDGH2/SRMRYjlNHHOtIOfZOm0HgAQwXgxmEu+pcMtx20Jkm6ZZqAFp/CUN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYFdvK+0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V5/+UBUJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYFdvK+0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V5/+UBUJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7Buha2166354
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y00J4GfX8E3zrLOCKjxjJS2m+kNaYhhwZAFzWHyLQnw=; b=AYFdvK+0jI4lcJYh
	OfI6w3dsgUDXNfnNwv8cFn1y0rfmHWJpwIXNWnqqodqJ4uxCXljFIxm/vFZ0p4F4
	tMYej+kSeGnipHQr/6AsRA2oqV5b8jfSO52Z1ohuHBDaiLRcp+DVR+i75K8hYD5G
	F/pO3mGErTxnuwCCaz0thxgY8uTP28Xx1zXyDim52c44A52wWhIOawOYfXhNLlTV
	ouoMFQNNFYv3YimUaoEa6o43F9Il+sFdbWVnWN03coDpWLAF4JcstFiUIjAjgb98
	TFKfconRdia9bfbBAStpzPQWqqrO7wdF9DS/SCxO/FDKEf9YKrGPR94cvDHczCSB
	2rL07A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xeufac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:14:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso780267a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790072079; x=1790676879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y00J4GfX8E3zrLOCKjxjJS2m+kNaYhhwZAFzWHyLQnw=;
        b=V5/+UBUJ1iE/5dpwtOeCjvyrfhXFGuXz9RTj/AYeh6r8DGmquHbMYMUueIovlAUOqz
         u0b3Agfn28LM+8EXDJQ/3iCsgWRJDdA3Ra1sbWLEWoVM5ig7GE6P58dt6zq+CgCIBj8f
         +0Sy1zKg6nIGH/6ov0SNxYEWBoSqF7+OCOC6H4cS+S9EnJzDOXc9c1Ke4QBsonDFXrip
         k+VVDu7OBdct6VM21CVPE8Yo7GSiMZftZtoddooSOYYvvnchWA5bFDf68md0Rw+JuMoG
         BUiAzfqlkatCqqSddYR98KQAw7I5Mb88xByEbdH+vL8Fas6ntYR6phbDl1LFmB5rnVYq
         0HwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072079; x=1790676879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y00J4GfX8E3zrLOCKjxjJS2m+kNaYhhwZAFzWHyLQnw=;
        b=AIjVZJtD/gqDV/8mtdZUxHVata0MAfTaSeELFYsf9PVyt3hwdc9AjcIsPJCV8V5peQ
         jGszK4pu3sfIkD/TRPsl5lDCKyJuIB4/Ilk6BVKyf6UoZjv9OTAo24xRCf9KAnQPnoEp
         crWJJjlshAHx4mrKITzzgsRrOMCGJqCdc2zjcSvVI17zH9I4HiHQNhVVFqbUkE8y5LzW
         mf+Uxq7EWhtm5E1ciMf0uQ++XUrlsJe5mEaAfou1vawywz3DMUCWtG4nqsLchSGZGMMh
         YHYKoy1wNJQ5Ql7fOkv7aghsbrToFzBIwvwHoaXzZ7TxoiG8pZlGO3M3RFXO8mpb4FbR
         8CjQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4QawS9ic0H1S9BF24E1mHfW29RFh/tJan3czWXxK1YY2rdxIO5bV0neH2gdVuEoYY7fQx+eXlgvNeh9kL@vger.kernel.org
X-Gm-Message-State: AFuF++mXwJLCiBVQfLas2gnV9bCADRpvp7SWLAtU5gQI19ptEhlH6FYy
	6OfjuukKhzrBDZ0rMnT0yKZBzpYntZRPg0X4hzewHJtIMqhX9iJquTVsk45tXif8WeJprZo9+Yz
	EuQrmhypK4LwolrgpjXgfIDtOhPU+9aWcMevuUrkf7klJCV5zX81WL7PF90Fp5QgOn7LS
X-Gm-Gg: AYBFou2dKTc5bfyVcLbJdhDvF2YWnRTn/6tfcsp2mqCm0TSjLjYA3THEKx1PutaTY/X
	R4ueiERf+Y6VFFEyKiTkpLzfVdZSCTQfMkZdRSrAN2zph8B3Vlw5NRRgHppIFtXJ1LdAkZQ+hsD
	qD9WqsIonGkaUOigE8Mkj6d/SOD+X0BsqtiG5MPFTuhLUPR5FXSzG91Yu/JCWyhq+f/vTQ+ruZf
	tGEZ93Swyu9uAG6ALfVRwEi9F7pbjXIXm1sLCLHtVHNXGFFRPPtw5OZ0u/rpSjnNicVRX4CFu67
	V9akUuL85O/ISm7fSyssCqHpzVYATvjDuNy6lI68r6fyFJaaLDFUJ7IceLT6BDTmcJvGJqrE1UP
	YPJhmj32qTkCMbl6LD8JjKP9lHj6+aPAV
X-Received: by 2002:a17:90b:5787:b0:39e:5cc:717b with SMTP id 98e67ed59e1d1-3a07311b790mr584181a91.25.1790072079085;
        Tue, 22 Sep 2026 03:14:39 -0700 (PDT)
X-Received: by 2002:a17:90b:5787:b0:39e:5cc:717b with SMTP id 98e67ed59e1d1-3a07311b790mr584157a91.25.1790072078555;
        Tue, 22 Sep 2026 03:14:38 -0700 (PDT)
Received: from [10.217.219.38] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6131506dsm4464341eec.25.2026.09.22.03.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:14:38 -0700 (PDT)
Message-ID: <30756100-d633-412d-be81-1078b7db49a6@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 15:44:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH resend] i2c: qcom-geni: Use device_set_node() helper
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260919141434.22999-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260919141434.22999-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KcyqcxEz9bVWfEYuFK24630E4xqsATdP
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab2550f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=k_HDGeKfpP-0RDluWcAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: KcyqcxEz9bVWfEYuFK24630E4xqsATdP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE0NyBTYWx0ZWRfX6hcAx48WqMQJ
 7Fp6Z+Kmuwz5vCD3PPKb/KHgl3II34Omg+t0c7O28HgdxbdsUCRRipKKH+tcml70xafvHS44MMM
 bwAYobbMJYhPkd3a8Az3dH8MoLUe8mO7O8xL2hTDAXlYz4XmZg63MZqkFAe3G0tqsdaCw0b9zEB
 d2UqHii16QNCCrHbdy5fSuZ61hNhp9sSDXpWY+USzQxRdlnOmvtygrn7klBoLsIjcvPtTovtP31
 sm1RQ65uKLDqO2QkOK2NbM9QkQAllAn1Mon+5v1joZ0ZzFfQ1MuIe1z4f4WKHLZzETysrYeonvi
 tTX4/t69zBpTdzWz0Uokad4S+VmSLf5I4Kh32MI/Xlo9qz9wXkVauiEV02mh9GZTl2P0eHpkko4
 1UMBoItud+OXUZ5AbfuiDOLE7SjdmkUUIG3/lYYHGUVYAaNk9IK/x7eDOdSg14KXoHzft3J0zOT
 u6IlqLG3Ssr2TMCwdkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE0NyBTYWx0ZWRfXzl/mH5WeWYEu
 m4kGV/hrxIY1+CPY+lYr/eHXsipWohnQmTG9T460kxPEocMdQ6EW98QOEYBF53cAlmzo1u/Nyum
 ++YmplBF+qmmI23Rxiv4qStVxEmmGsE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220147



On 9/19/2026 7:44 PM, Hans de Goede wrote:
> Use the device_set_node() helper instead of manually setting
> adap.dev.of_node, this:
> 
> 1. Ensures that in if he parent has an of_node adap.dev.fwnode also
he => the, seems typo> gets set to point to the parent of_node, rather 
then leaving it NULL.
> 
> 2. Removes the need the specially handle the parent having an ACPI
The need to specially handle ?> fwnode, since the generic helpers take 
care of this too.
> 

May you can write crisp reason and benefit like a story instead of point 
1,2.


> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
