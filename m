Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621963BB113
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 10:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787826340; cv=none; b=UIAZQ16kpuWJ3Zr2pETDVBAE2wmiMNi+QVKTZuBlS78repQ0CC0FxSXOoJMSGkxy+gHKUOwrzAhnhwtJ844VnrqUCFEqJUAJyY8WEnrYN/dblJbPgv/vLgxIZ3R2RVw9YqsLll3h0MlW+Zm5eIQSfqhlvt6xTAqwmU+F7htqHDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787826340; c=relaxed/simple;
	bh=zigP1wL7oxtYMtnDpQWIUrURkgMFBxyXiiIMf6C8Gf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LVAgeSZGKOpKOEslr89xlJS11kb76Lks0w0cX092K0hHnVD50PbIIwm14i5/pb6D5KeK/UL85MSLJvxerui2KdhvcWbpM3o+TzgcCC0ui/qEx1N6vifM+Sf1SZ/CKd9pQV21YjPgXnqwK4COuBTQfiDJ1FpkLBRN3k35IO7R+9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BSKlQgHk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XK73MsVT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BSKlQgHk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XK73MsVT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R9HGeF3090807
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 10:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/L23aaG3Wf43bePcqUlEH+4iKXPWuwiLJQUsss6YcTw=; b=BSKlQgHkoszJG9cE
	5ZAs6MfSXLW+mLZpCQ0ECzm93SOLDyHR+MxFGuAYROgQel9o9wpQ+DNhPecxg2iW
	s4hI9TqMF3J4xUEzIr+snu9oRswlhHDLSrFVhCYCAoVkA6aDv7wMg2nzz2MajScG
	Fk0X18Hr/wULS2eLES5F64CavCVWUv63ynaZB2sBaYq4KjlV14IyZk3OprMlUEHM
	WpyUn/JWY346qow6ui5NxiVn0JvZvCEMooRkLDG1xwYzEWSpDUm43+G5WxwnBRU0
	NFJTE9zGO3qPrJbvMGXEGVjl7lrivgDEAmo+3ycEtRuxfn6NOqTKdLAzqwogNqmc
	QHmDqA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4fwkbcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 10:25:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfe48ca1efso31406625ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 03:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787826331; x=1788431131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/L23aaG3Wf43bePcqUlEH+4iKXPWuwiLJQUsss6YcTw=;
        b=XK73MsVTmGc6ZyDYvD65rIgrF0gQhvgAgdopF4PCp4iD0PbpMTqIbaXdKEtO+Gc9Fm
         nefBgNnvji3mNsVKVAaWUGSktGVGL/3vl/Fhb8aFDx1271t0NCCcTWdEjBJqKAsm6lf6
         UFkiZ60rWx643sB46yoETg5A9TStBLc3w3jKK6ARzsKu519woAE6sKH1Gyf0SkRlo6F0
         UIjox/qD4H8vUF7QS4jN9A3zvPlk+jGz5fVxkKvBlfRi3DMFOsW325ceGosPsLhWH6mI
         PCI0+u9n5j5Zl0xNQwqNtHgH4LfeCryb0wy5Wd0mMZqirB/AkzljYS3HKVfhdwCgDWjL
         BS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787826331; x=1788431131;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/L23aaG3Wf43bePcqUlEH+4iKXPWuwiLJQUsss6YcTw=;
        b=lhmXpppMM1+PGAQSNes67VArQgBdbMGSSFG5D+BhOFqFSoh60FoClh8eJI+mLAaPhZ
         1habt0H/QP1iOg9RLLbEarbu7DoDgM+torZEv2Go2paqvjUn3z0Q+zm96f+Od2FSk8Vr
         ifC3PQoq5qyEFxZ5Gl9uEEjrLtgs8oGdmMgtG+DwYJwvmDfQKYUZmFqbPQu1zawCKTJh
         HApNX3IMt6qjCFB3iWavJfLJ5TQLDdMe97ylzW9doqTQBswcqatqxKPoZJmXIGNeDt4t
         xkwxlkWNxRuxiQo/hkzkK3CGzE1E3462omCTPBrAd+cCqJSHvSFVVa/oDVoOV0Ixblpx
         y/kA==
X-Gm-Message-State: AFuF++mbOxvoUn0XEPXUYUEZJ6dOALkEOJsvO70I/blrDsl/rGyyIC9k
	XpdBMjkuI9g+y51K2gxchJca7tlkFRCZ6bGaxT1D/rdMsCwE4DkQbzMKKnijbGb1fMGdHw63LpG
	sFfqS5w98/4bCqEElSwocavJR0/Zg3pE+L6ywQjiQQ9r9thPSFdCgC0sZN9YMJrJ2ZfIk
X-Gm-Gg: AR+sD133DJdkiYPmqcTZvKF/P3Oe4Gu4oPYlbm28h4CGIru8/WHm2keEKT+pS7dwxPq
	VpkR6HpfH9lByote4oXTPdvk5VzpCS/igVKwX99gyFIS89W/G3ddYyzctD+mUfcFfhRISs3INFo
	iyFIOpDo2VDScL9qZ6VJjndb380ULg8enLbx9f554rjdV6HHoDnm27F1z2YhShBGTusPMlICM/B
	YDrxFKHK1xH3X5jzx1ui1/q/n6/WuxyyWCWdx8KocEBZAQPNS1+jUExfa5awpqx+9+GXyj7FGOS
	j+hs1dfPwY2J8lyKCNlpc2fPHHoHmosV43SMcV9x5W1fvBfAPhHw1Cz7VBiKAhfu52UB49HtK+F
	wn8kxWe2dXuKoPxitBuQlnHEPZuLiiMDYtDY=
X-Received: by 2002:a17:903:1a45:b0:2cc:d6de:d597 with SMTP id d9443c01a7336-2d707a9fecbmr260214125ad.7.1787826331004;
        Thu, 27 Aug 2026 03:25:31 -0700 (PDT)
X-Received: by 2002:a17:903:1a45:b0:2cc:d6de:d597 with SMTP id d9443c01a7336-2d707a9fecbmr260213295ad.7.1787826330516;
        Thu, 27 Aug 2026 03:25:30 -0700 (PDT)
Received: from [10.217.219.186] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704b9f73esm15212855ad.39.2026.08.27.03.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 03:25:29 -0700 (PDT)
Message-ID: <67d915ab-9206-4a93-9eb5-f8577e321252@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 15:55:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: busses: i2c-qcom-geni: Use resume and get pm runtime
 interface
To: Alex Tran <alex.tran@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826-i2c-qcom-geni-pm-runtime-resume-get-v1-1-25ee55d1f0c8@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260826-i2c-qcom-geni-pm-runtime-resume-get-v1-1-25ee55d1f0c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: suGqiKUe1bhXE9tj9BwSDhZTQkFbfaih
X-Authority-Analysis: v=2.4 cv=OtZ/DS/t c=1 sm=1 tr=0 ts=6a90109c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yE5FkoPsXTdA6R0Zz_kA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: suGqiKUe1bhXE9tj9BwSDhZTQkFbfaih
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA4NiBTYWx0ZWRfX1mL/ovgJlWrY
 LOAx3BT82TLe5OXAJmJMJVofK4xJSFpRczA9O5UhOfScaiefVH8Re9PJ65EkHg6z/olDLM7Pb0+
 1YOvRMOq6QhuYVxG+LquyiyDyZW6YykekhSqwJ3SdA2frVRtKWLKHx0/NZZth07G+kzgm5tMTf2
 v0sPH0uCh7Qow90U3bVSBWeRSpAT2xwMFgdcY6xXbu4U2pzP5LaM+en+7LOo4oAaUz7T8u7DJPQ
 whP5W9Ll+0m1kFiX1eZCppxdQO8509MhyDJ9GZpzTihC41Y4KSBfYGx94tSRkk5Syso5pGYgXqW
 H725GP7T7pF8WlxVkyI5XMGA7yrvNzfCFIrup6UJ7KeiyGXRE5dN3P7QeK3PdcyQGudf22ol+rA
 64Chp3oxeD68mRSNP22Ud5hCGeNZ1juKv+JCdKrVpBrwF278RqxXHEr38OFx/5uNmLA758tuWM5
 yO4O3df66/M70xxTsgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA4NiBTYWx0ZWRfXy7mHRr5K/9Gz
 MtxnL/OARHhUpHIt4hPJ98sZt5O5dwP1pOJ2TaSudq5zHxauhfdWxuyrrkj3v41BhCFmkqYKv/e
 nh36Bm9HejyU7GqKIYEij+9W/L4dDBA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270086



On 8/26/2026 10:49 PM, Alex Tran wrote:
> Utilize the provided pm_runtime_resume_and_get api
> to increase the usage count and call the rpm resume
> callback. Upon failure, the function takes care of
> calling pm_runtime_put_noidle. Remove the explicit
> call to put no idle.
> 

No functional change added.

> Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
> ---

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>



