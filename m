Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B9B3BB678
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784801784; cv=none; b=L6nHMMvH2aL1IYgyq6ORc6YExZePXXFrdw+3fTv2BTWl53IBxIpWqUfVy510D+PcNBtYderhylRR15/bym8QyewJ43TRoBu05UmPSw0EiuOLcnVGHlSYjppry+Gabr5Q9H36Kt0xyxdj2NcBBdOwjyIlQzsYTq588AHcgY3mr2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784801784; c=relaxed/simple;
	bh=OOzxk0j7yI39H5AAbUVVegB2Hx5jR8U3vPwKCA3cJcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rvs0nOK70ZOo80hVL48AV+luag5PfLBpB11nN+4C1/jQqvVCuc2741i0rGQXL+9FACPAqLgFjSNEOEN9VfRec7C9DLQgwKQaY/5aYCYHCbBx3meb7/mBHJ28i1bvPX/r13gyQozq2roommo8aLRn2IZjY0/T9LjnqwhNMOXFnHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DJB7vrJ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CcvN3cny; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DJB7vrJ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CcvN3cny"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qXNt3648575
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eTUkxGPu6yjD3DgvQUN6d2HdXWpUU9P4B6iCx4Rs/ik=; b=DJB7vrJ2H0i7jGyv
	XkeifS7mF0TvPEvMi10gub0RQ31XP6G8aMqELSt739/wT1zJY9rKRFiRNElWQkWg
	ekWpuvNyeh6+F38csSMFXFIW0RggFqUvw7QW219naytFbyAHjkm6yPNLUn7388E4
	M6xAbBTKYtONGKPoCoNpfQFA6Eecu0jvxw6HJnp/kTh4AjG4vTyLboR+RWgyQ91M
	njfSbo3EpjO7P0f490nIYtKRYFI/NjfFohV5/BbZ4jLbxn0LqqoehhQTWKKvMUjw
	8dHVMY0GMGqKu/jjW9AARfZxYggNhKgqkhJZqw7b8fJMyaNTHNezrt4AEUpKPuIl
	ZQNqew==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7jg2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:16:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c9d953b71so1075281cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784801780; x=1785406580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTUkxGPu6yjD3DgvQUN6d2HdXWpUU9P4B6iCx4Rs/ik=;
        b=CcvN3cny+s7J+yMnU9+iBeu8W8F0pv0X7j/1nperazhKHJDqc2mHKxRFbZ75cK+E28
         Corh3NEchF8Uq3oPZPg9FyGlR41hI7xnWZvsHZg0plIplDXp3RPEUUAokESn71VTHweM
         Wldc9KtBUQK2I/S1KNJl903owkil1BRbWvovzeHJ7yGiqpeqbSxzQ4Mup1UHDyh28aCm
         eCncH5wvPd2dJbBF1y63AbdS9uWMC6l8AbuMt6NEZWJOOb/hA31KRD0ijX6SSpWJjsBl
         /I+wjVp6AG3tDdgiV8mU13L9Vp7uG59ZYfiwZsgP1YBnXnSHvfqdleZYE+gWeJ2nsuII
         V8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784801780; x=1785406580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTUkxGPu6yjD3DgvQUN6d2HdXWpUU9P4B6iCx4Rs/ik=;
        b=hFJ61wPyD+ZhebGIhYYOdkiHANwkC1ZAseQCg7tts4kNe3aQXFrCjEVqJjISFt7VbA
         RVQGe4EChOCsKvXcPqzIXYjNh2HvOAltfiJBsLY182FWgAuwLVnkwvn0R88HJPYStzln
         QEixsY6+ZnOSzZy4ZZBsFJJK+NQ79GXbF7cpzwM81HqtVxkx5B7pWcQAjCfnyhYPtrQ9
         zrGUewvO3Fyf7f7PjOv/XcLD6ln30VoPhIGWWKInUlp6Mss9puWkTB+p/Te/G/Q52dNC
         Yr0tboRMkd2uvXD8nC+QBXe4OAO5LQzGjAPltPGLUceBlN5CE+OPEQIgS/FN+yKZMPnt
         QFRg==
X-Gm-Message-State: AOJu0YwxFNIW/A93O1HIbmbepN9rOXZj1rXqpWt0dzGeNaCZAnzlNPP8
	Oub10EMKD0MTTHAtlo21akhRkAZdIKyKM7dn/TfsKcBz0wDHTRfiKT6vYnaHX9ADIVOg66W8qky
	mTcbRJYCWH4A7UoCsWj43av00q3i6djNEPuYZmgSJGHEJOQvxpvoO8oCgjBQ/xeowOrd3ioumhR
	Ci
X-Gm-Gg: AR+sD10WVz9OIRVLN4aIpgjwilP06UXmEW9lVM0Puo9roaVYeBndoWNaZ2R5Y8Onx15
	QoKyqoWPf1ldFeTApc/2RobzpPwAIwYLfJ3e8qDBZJJHrcz5ISPlto5QD7eiy6UJYh+mjNgm885
	VV1H+kPrXLAUCiusxUShGpA3UYNa3gbYYS8ZVTWPGAoFO2rPmajkipJykpsf5iH2BmKSOWpT9QY
	TxqOduVSBr7edzUuYfHFcxKblQTwIYIhtHTuTOVSrnEtFoRas7TF4CIYPYgRs25ao9a7+nKRLEV
	GhhBHwHC7+DbaT2dFqr+p6ys64OkMsCXzPzJx4NV9gSEPOgOydyJJxZGMOf7LFSBx56seBDnIEy
	39XTwqTppFJ4v2/JmVg6YzM1F
X-Received: by 2002:ac8:6f06:0:b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-5283dedb47emr16401531cf.6.1784801780079;
        Thu, 23 Jul 2026 03:16:20 -0700 (PDT)
X-Received: by 2002:ac8:6f06:0:b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-5283dedb47emr16401391cf.6.1784801779644;
        Thu, 23 Jul 2026 03:16:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34b92a98sm1923256a12.10.2026.07.23.03.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 03:16:18 -0700 (PDT)
Message-ID: <ddafcaed-3c87-4f1f-94d5-629a2c0ed18d@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 12:16:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom: q6v5: Request shutdown if crash is
 triggered host-side
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-q6v5-host-side-crash-v1-1-23bd53db90a7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-q6v5-host-side-crash-v1-1-23bd53db90a7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Dtod2BDXIm114cpwiUcx2F-TxTCsd_Dr
X-Proofpoint-ORIG-GUID: Dtod2BDXIm114cpwiUcx2F-TxTCsd_Dr
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a61e9f5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=sz4EqRGSCKQxEAjEHVwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwMSBTYWx0ZWRfX/sdIJJud9DhC
 rUT7h6ru0ymJ/rsHSS1tw0v8JMPoMLT0GUeKP0RGkYIzTZXgYMVqNm6j1JVnfZjFkfJuYOhce/k
 1iUVPNDGmFq5EgOWY9m5GT0N/k0AWaA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwMSBTYWx0ZWRfX1s3hz+9oFTbY
 L8cJFct0mD3hhWZJUNaP2rl4FK71wxTuiQ9Ncl/9+GTKkDkmf9FpVP4wNdrrc0p8yeqGgr6gxVl
 9zsgTXg03BQMWrqjrgIDCvIfrodEq0dpx1ZR10YO+A1Za3HTOmwctGd5zHyCV9aaXAQI1kNf3g6
 b2RKmstfl/tCqzWCzbyi6alX0O6xa7WQudWPDZlvAv4+NIB+rwmRXfrnnNfiJEeWJqA/Wc8lUbR
 ADpedZHCwKEN/+xOCrK0wCExybZJ1YHMDsiTB0+UBmDqhwTdrg5U0JB3p0XHsX+coHO7lNln0ix
 XM4H2r8uM9WX24pGG4SWC6QRe7MSkMZy1c0jFJgvUbzFFjyMtNLg6lZbyiiJdrQPd94UmVkH0JL
 iJi+K/3oCc0LCDs4zsfG9zsCwb3r2jQFi1ENgVav66lP4n6aBtH6BeDbFOPVIbvGX7V/8Vy82eJ
 +3J+2MkI7MIei1yt/Sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230101

On 7/23/26 5:00 AM, Bjorn Andersson wrote:
> rpmsg client drivers are allowed to invoke rproc_report_crash() on their
> grandparent when they determine that the otherwise seemingly healthy
> remoteproc has entered a functionally broken state.
> 
> In the crash handling path qcom_q6v5_request_stop() is invoked, which is
> based on the current rproc state whether to request a graceful shutdown.
> 
> But the current rproc `state` will be RPROC_CRASHED regardless of where
> the crash handler was initiated from, and empirical data shows that
> unless the firmware is taking part of the shutdown the system state is
> often left such that it's not possible to start the subsystem again.
> 
> Use the `running` state in the q6v5 driver to make the decision instead,
> as this does represent the actual state of the firmware.
> 
> This makes it possible to reliably trigger a restart from client
> drivers.
> 
> Fixes: 3cc889eb83f5 ("remoteproc: qcom: q6v5: Avoid setting smem bit in case of crash shutdown")
> Signed-of

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
