Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793766983;
	b=qQC61nnY5eGST6I+j7lDPLcvUuDviVWEObBKB+r16oy9lSiJase2VDTFhiYgXsDza4ZT
	 NQbLVYfdlNS1zZxC25tZTKvKk39HP2ZOepSxFfDM/IVYr6xuDR0MF+Q/fwS+6b5gXGQmi
	 rEag4lYAMiZMkwg03qJn/tD1sZzxjz1SErCJwtNUh/vc4RwT2+Pl9zmyjgecHtznmFrTw
	 UpsOxF5/k7tdlWngPbljQwfmvbllchhQdLH4R3jbjzvUSlDd285fTH5SefQFfSTlAeR9d
	 SY8Y0wwlOad5uVSiTTXMRnN0JPPz7TPEiiLFR6IwvCSErMeKZx271qZp3VzuuP8TK5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793766983;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3V525maxqjKyk+mej84Kbl6ipEaD1iBYV1Ed7VOLqW0=;
	b=awsy99+qggu3kBsFnEVPjUICfpUDLpvoW8Ql0rfxzGLfC1C6Mz8sPCWr9ZLE1HaVgSdP
	 oSzTaaLgIipyRdjj8ERjytCDRMRBnr58J36Ql55hIG06ArcQ9aFV8FQnrJQSbus9kA6Rq
	 Dc2jkUVQI/5xEvN3Mg133rTtt8i4oYT4LbEk/OLpO4gnYKZoEumRDSh96yWEGKy+9WGi8
	 eMjOie/oUTmIy9xqA6LzseGZ2+nfm5VzketIoaCNxCARz8IOeKS7LQpd/lLXdA+k2AwCA
	 IY01gS3NVbKXG8TzklOJC/lzkGdKFu04QnkWO+CPrldHO3etyaf9cY4juye/N9vhLNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B+hyv+tS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bO64/qTI";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED97606A326
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 04:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ED97606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B+hyv+tS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bO64/qTI
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A442C3n3300268
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 04:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3V525maxqjKyk+mej84Kbl6ipEaD1iBYV1Ed7VOLqW0=; b=B+hyv+tSKzu5fBJH
	nbGxvLN3dJthWKoHaGlykDB7Uyfe9vZO20IyqlvVtnqkdYtB5BiGt4BcyEojeWUm
	aS2cRx/J+NvrnN2+MM0bUZxT/4S3GGfNVUxsb58lMpAyZT5pqX0by1DWg4BQj03A
	hgavavI3r6yb84zB6k3sEYoZgBHkKsWXS0i0CIwSoXtAPkFqVMyuMiZLtDHIktSq
	IleQiii+G1lI2K4dryFYtCFC0q0OFJVZY2i16nZvu0xR9jSWal4OOWvxPBnyhI5b
	ngwW/b1fGgk0sVlAnBrjA3CyUUtXygx9sXs4P8FVeAn981MXacrg3gF+G7U0B6J1
	0Q1lBA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqwb084sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 04:36:21 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1acbaf81bebso495769c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 20:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793766981; x=1794371781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3V525maxqjKyk+mej84Kbl6ipEaD1iBYV1Ed7VOLqW0=;
        b=bO64/qTIbsQgskpBDCf3ZCrAfqXP5czjZG/Hu1zvhAI3lflW4Qq5vvnhRpVM3k8KCz
         sr+5V/9Fl6FhjbcBeaPlGIpC7pcPTXKkUo3eYIg0+QCdEHDWtcQ0pZZxCss6bAmKkvyT
         2ErclEvsx/jcQ/Tz4ivA75JzeSRy5Csf6ockuOUDlslZ1DGBRr8arRbND6rBZ+jOo8iv
         rHamREBWRXRiMkB/x6N50EShys4CTnUSl6yjxNFOXEPbhUJjOsiONAxtQbrX8somj4eB
         OpcZM+FN4DINRX8dbiIjVZsPhf0e5BXr3xxQwdkF7pGN/GujpCwB0568jdh3MhhGu7gG
         h74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793766981; x=1794371781;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3V525maxqjKyk+mej84Kbl6ipEaD1iBYV1Ed7VOLqW0=;
        b=naUs+d7+NKXUg1u1w4+st/mtYi1DtXXZpsFoiF/dC+YZ6I7FSA/IUCj0Qb5jxyPc2A
         ld0K2cMilAptYrKKVTtjs5TwO8ZdYbKfwjaL/89XUw4pmhOsCW4A7PQUREAcLPb/JUeM
         qcEi/ut0ZLdAPSzkDVEuG8iIuGnuojUCM2szPVYWdF4vfKaIIW7HgrpTQv0lNpF7LngP
         ctu9kROORkEQtfCJTlPcpFUKXh5gFrXlQEENOkA2GLQKGe3JJ5RIXD5O6FKI1WXQ1g+V
         r45KmmSwXEzWFpAzmhtCik+w+4ZBvZSvtRSzz9o/9WmL4z8L/iwrhv4wnAYUmIvxkKrh
         tThw==
X-Forwarded-Encrypted: i=1; AKwUvBxQNEc67R0M/LyQ9R+fv5GFukF+eR56/UTzs84ktKewHU909a+53DYpuM+EEC3pg9a5NgxUaSV7edGxSyC9@vger.kernel.org
X-Gm-Message-State: APuU4Z/zUWQsRlogANpagcSE20ld0IzjlPY9+vG9Rll10X9LK8ZUm5Mr
	BpbU3uIiTdrb6EEYJJBWnqRCFmwQyzVSugrQsGrSV9k64j3pwJGT7Ej3UGqCenSPqowSEWbev1h
	1yCUd2JZgYFYAH7t8jLpTjA4OAbne0v5WkOY8BqXFWsZPlh6g+ULf+gKT1hntgQejmj2S
X-Gm-Gg: AYBFou22Nl/zdfbrGuN8rl67OFgwDOm4m+bD1AZ/Wthz2l0ac+yJb9mBsku8GVOKg/z
	oBibp6seImA5u52sSf5vldbTiHnlIeIYCyikp0169MoMMe/krLta9Alue558vzPWptWWfH9JKnb
	wf2RaEoyq6foiKfqnBP6Po0EDPW3PPXkrAtYm6bPxIHt7lK/PpIJ+2HXdhPe4+bBWQqBh8bd2kz
	WPN0Oe8BFH78v+Ol8s1aQh5UozMCkjwSlTfLJxq5xv9ev8xMvy5GnEiVPMFF0+Qx4mzA1SqRI6m
	vY2u4r0Xt0TCSpZiL855WKFpxZte+uJTA7s9ozQHFolvd4cgcf70R9kIPlA6uUXsdih1hzL8Im5
	SDws0pCv3TkF86mUsVs8HK5KeCkWfhFWNEtY/oRx/ZmoMM0O5kYe8Hcq7MtXMGJ2ZkjXPSP+0el
	yg0Q==
X-Received: by 2002:a05:7022:ef12:b0:14d:ef19:246f with SMTP id a92af1059eb24-1ac5f36d5cbmr24440347c88.45.1793766980570;
        Tue, 03 Nov 2026 20:36:20 -0800 (PST)
X-Received: by 2002:a05:7022:ef12:b0:14d:ef19:246f with SMTP id a92af1059eb24-1ac5f36d5cbmr24440311c88.45.1793766979896;
        Tue, 03 Nov 2026 20:36:19 -0800 (PST)
Received: from [10.217.219.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm4618852c88.18.2026.11.03.20.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 20:36:19 -0800 (PST)
Message-ID: <f9d27fd8-cf33-4e6a-a9fc-6770a933cfb3@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 10:06:15 +0530
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
Subject: Re: [PATCH v2] usb: dwc3: qcom: Defer VBUS override update during
 system suspend
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Vladyslav Tymoshchuk <tvlad744@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261022224220.480-1-tvlad744@gmail.com> <auqXyUxc9cRIuYou@vbox>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <auqXyUxc9cRIuYou@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAxOCBTYWx0ZWRfXz3X76RY75Hf5
 8VopaE2vqrrPNnXbAdkjowhlxsBi5bfHBzovwYXD5KlvgY8dohbX9OMN+fUPX+qnSW+25m4Wwuy
 MlAL9JMOMjUrAYccUXSQxn/rPlBJ6ks=
X-Authority-Analysis: v=2.4 cv=OfINnRTY c=1 sm=1 tr=0 ts=6aeab645 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=DWlGITjgz4oUXde0rNwA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: lYUsiNeV27OlvtB0SP6ukyqJoCUk3lL7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAxOCBTYWx0ZWRfX5Q2Jm9L7uCPI
 42DrZNVDeJv743sww13k9uGcyKgMKiMePh/hwjqGxbTsXVlGfDd922lRPSyB7YqYsEFB0ziGFCv
 PDN7g+vXQb8jghnqSBeasE+pLSrWdwK112L31uWp3KB29LnUjo8NBFeZRI6Qbi6r643/IEYzLwp
 ommR1PFkdG/tOmNEqa9rjqwP558Cf8oFuzt1bL+b30u9QyYdl8tweMFw4nX73bioCxADtyhqd1W
 WAsYrGC5KRiotrPjfvBVbp3bsydfbqShfGV0iM5SSiSiVUGU8lhYniZ7vzcYPdrqX3KJ6t+dg5I
 HuLv7lMNj6dpBlHWWO1UOO+iQd9nkNmBWQs3o6TA985vaEmc2fn9y8E2qQp9/iu0xInaI/hYkyR
 SnBnkeVkzwG5MN1i2Ib/k/P84gpNi6egQoBHaXdIpf50wYf0nXFwldOxic3pA5k5ZKgiFNb58wj
 meURYEUpfGJwKUWu/Rg==
X-Proofpoint-ORIG-GUID: lYUsiNeV27OlvtB0SP6ukyqJoCUk3lL7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040018



On 11/4/2026 8:07 AM, Thinh Nguyen wrote:
> On Fri, Oct 23, 2026, Vladyslav Tymoshchuk wrote:
>> dwc3_qcom_set_role_notifier() updates the VBUS override in QSCRATCH
>> synchronously, from the context of the usb_role_switch_set_role()
>> caller. The glue assumes that role switches only happen from a
>> freezable workqueue, but that holds for the dwc3 core's mode switch,
>> not for this notifier: the UCSI connector work, for one, runs on the
>> non-freezable system workqueue.
>>
> 
> ....
> 
> Good catch. However, this should be fixed in the dwc3 core. The
> pre_set_role notifier can be called from the freezable __dwc3_set_mode()
> work instead of from the role switch caller. Then glue drivers won't be
> notified while suspended. This is simpler and applies to all glue
> drivers.

I think the problem with that is, dwc3_set_mode doesn't know USB_ROLE
(especially NONE mode).
It only knows the mode which is gadget/host/otg. Thats why vendor hooks
are used in drd.c instead. Perhaps we can cache USB_ROLE into dwc3
struct and use it later on __dwc3_set_mode.

Regards,
Prashanth K

