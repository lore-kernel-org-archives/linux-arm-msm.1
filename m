Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743218;
	b=OUKSJ+iVkgMPCCrGK/2R1gCQpvJZFYCain3ygf/Q1yK1/6nOD5Kdgdiq96f5vKGIsZaN
	 SacGJgEVEauZSnpCKq7gmyZ6nRT8Cw1/8jrExJvow/CGebJz/+HOZGMi1bhgeilsTw4Yg
	 3cfr0GA6bXjbz2PzB+QLGD9nSnr1e3h2pT2k6aN5HyuvGmnNA92SO8e6FO1nWxXx2mM15
	 q6tg2rkhx/e6cfPZAAbhqLTiDp+xQVBnOrNQThuOuvx3tbsDPkJYzY8/JWA5ZkSEEjzxj
	 Fd8WPS7GwisaGX71wYPksAZF/ogDGXFx9ANAAxXYkGAIcZhmQ3T9n4hIqf6k5tDrkIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=w1cR5nFuPtaQunkx4EbNjBSTwiut8OwG/7WqorZUh1g=;
	b=b2gxnWPhTvujBJZjr7SpFoxezfZL6woubS5MqKBupTNVKGQxhZzUNd644gGR/t5oLcLb
	 +gUBEvsnDHRwpaCP17qzx52r+/RnfsMWngx6P/diqiAY1dc6rlgrBsGwZ+zlQR3nIm62Y
	 P7vn8LBl4TcUpvx+3mcIWe/YBwpCpYMeAFxZRKq0A9uOjH2YOUsApDYhRnx/u+A/G8R+9
	 lzhsyXWdxS84aEvuCQqoWmZ/KbMuJRhjUHKYauwpLJJoileoVx37Ygs1VwfE8dwEhjyVO
	 //3ilqd1cPwpsMjFJE4oBmyFtffT8bcQSRU+1vdCAVuzR0JzcZ5Ec7V/KaurhmkTVoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lHATfJfj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dcZpvE5W;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480E0606A334
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 480E0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lHATfJfj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dcZpvE5W
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FLrm1552394
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w1cR5nFuPtaQunkx4EbNjBSTwiut8OwG/7WqorZUh1g=; b=lHATfJfjVwc/n1xI
	Fq5bTkBZGf8usRg/UOewz83RDXzSqmwUREWgpNUmEA4rwpK8AQ5B/iirmxFauo5l
	T4ELnwXIhbSzqQ5sbFktZNEHIFOFIQfhwn02w/cliaI7ezT1lK+S0nEy2s9r3u9z
	crmxZsLyVxMNNxEMKr8maaAVRRr9saSLCd6Vvw4vUnE8NtyuSDsBoU/L7L+Wd6fw
	50LE3njI2BrwrZWDSxJxaKOwLVt8lAYOM0Mc24dnvUKcd8DwsJlD9f0RX+IXRQS/
	9hR6dKo5NMoNhJNqTqOF5LvN5gcXNzKsWVX9NBCBFhSd042/HX+nB23kVK9/RZnl
	a2Fp5Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmttncn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:13:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac5877bso21308085a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 01:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743216; x=1793348016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1cR5nFuPtaQunkx4EbNjBSTwiut8OwG/7WqorZUh1g=;
        b=dcZpvE5WQsS6Cu8SqubR/JkWJ8n0oqlL1iy6sb4eOO/afmNAh0rkL4wzFBcq3X2OAT
         BJaGPH/qv5bKa3zwopCFjd+O9+da9XQV5w3YRJn1NA4n/gYvuMvhzkId+kNkAO/yzvPW
         jP3DszbrsLZR0OMhdcJ1q7/AEy/ncOsmi04q/ruevKIQ2ds/gg7WH1AgWWMdKQjjLuIy
         kfQo0MyE+kiAHelfT0RKtutJHNtU1JG3WnX5sHA/hFamwGTz8TgZuz+T2y3+xk27y6rb
         lGG30qSgekHHBGkxgmjScPc0ep6jsd6kZKNKTX4bZGskrpQJ225y7VSyS9q6+WuF6BSu
         /a+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743216; x=1793348016;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w1cR5nFuPtaQunkx4EbNjBSTwiut8OwG/7WqorZUh1g=;
        b=Ing344nRnXWJDeqDlYVQ5RC4rzRvmwkWqPm2h8nIjn47HHzaUMtnTQLXgWIhqFkB8r
         MdtObXKYvxeTuBS9J48wWHrOrNYv0Lw9Tb8NyrivJBb2p5uCt7zhuhHZkh9Igzd7NfXf
         VmDtTbT2JVy8dTHGbF6oLoczZLaEaVE/o9eWCkyPzUEub6PwVtacMwOgOAtL6/Jd3oJ8
         i7+KEDpUxEU35Rt8bhmy1tn3cMUqMcGjFuL4wqI42usau79MmRMt7FrZd2TEJCvjuiip
         XS304ovXAn8jCpz1ntN26Ou6MRIGVD3SdNIY5hibOn1I5o/XsMhcAjWi1c675nu9xKN4
         Yiwg==
X-Forwarded-Encrypted: i=1; AKwUvBys7bO27g8xQNcwiwMRpvIdzqlGiw2kkpotWFhSA1Xxaf8PSvD685MewszgD+zQymy63JxSykQ2sFpsCei2@vger.kernel.org
X-Gm-Message-State: AFq9FYIX9epi89UG1FUZRU49dgigAl5hsDwHJU7Tw+L1O4Ehz4K5CE5b
	mw2l+lUJ9owHN8OLUvQFfQRv2MSFl8CYgXDmaPVgyDP+USKgEwxZNUV3eN3Sx8kzcx6uPrywVTC
	YGhsMKY+p1gaaN2fpsWHKPty72Wp756d9oROnw37AYDRu9GDs1iX3E1va/HBBlnT7FLKD
X-Gm-Gg: AYBFou3qvXQovlENMll70gy2+ydQcvwz6sGxbY+uKkVgYfrFEEuYeySM9YBsrIUn1ZB
	2NUVTqj4ySZGevqUoiQhL0ZowT2ObgpEfvEUxCtt6kQ7V5TybHsLFpt5GrtAxE+7DzIi0yRzSPX
	4XL15OBtYxvNJl07NvnfbdG44hHUKqz+yzCONRICajdXmZmPA6vRfwERHj3KGNYQvjGtOMg1oio
	f8K9/pvBha+/6QHxNMkcvph4VYn5/GFIzGHEduYcP3HA8PJN0EDP1yxMiCD+1tTmM6MTI1+dc/9
	1KrGGoQ9m+GxqziS3HXzJaroGUm396Pxs82H7fIoA8O/p0i/0KgurRHVBZvVdALZlxjQdCc1Dor
	eXFm4Kn5GYucfJcOF6NCDxg==
X-Received: by 2002:a05:620a:90c5:10b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f6f7d8a2cmr297173185a.2.1792743216458;
        Fri, 23 Oct 2026 01:13:36 -0700 (PDT)
X-Received: by 2002:a05:620a:90c5:10b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f6f7d8a2cmr297170785a.2.1792743215985;
        Fri, 23 Oct 2026 01:13:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46b378b3b8sm10988766b.25.2026.10.23.01.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:13:34 -0700 (PDT)
Message-ID: <63cf18bc-5c89-4a55-aa15-2550dc47c155@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:13:33 +0200
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
Cc: Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261013002124.332111-1-xiaqinghuan@mail.ustc.edu.cn>
 <5bf3636d-be7a-4800-9914-808d2fc5ebd9@oss.qualcomm.com>
 <179259054168.209323.8102186130128474174@mail.ustc.edu.cn>
 <52fc4222-508d-4acf-b38a-7b4e5aeff3cb@oss.qualcomm.com>
 <179274197125.1374502.18211548118625978753@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179274197125.1374502.18211548118625978753@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb1731 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=IjCPCkZtk2ssS8GsjjsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 1EJSmNxnmJuecDYapvo_bfMvxyBj-zEe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfXxCJzrV/mOFcO
 KpB0iz3qHZ8ic1kRfWgNvT2NFqtG1Gx6uX+VEAGb483vbO+a5POSEGJCeO+3zzg/sow9jAp3WY1
 7WG8VufkEYAcQclGJHt+PyFLldSIkmwEtrZ0UGDYJ+xlGtyjJ9NoJRGQIbvTniD0z6aU4KJ0Yjb
 qFAq4OLhd30H7QkS2GZHq3UylzHC8By1g9U1UJHaETjw5RzpOo78pM59Sdu5F8rZnL5wPXjapNc
 Ck+FBFkrrSKMpBV/oAchiMdbuxWgk8QyXkNLlE2xqqGB9xTp/SjrLArsez83+9U/jwuxBjCXxWL
 MZ0v1t3DapWYf1U509r/S9YPnF2nbNeM1eZR4Xvs24yaOZsBCDrJBZ+92L+UURLD2+xiD5Ybnq6
 RwhioN+BPhmzy2dpQodoAtcn84ZF7WLM7KakCbozBWT3gyuaZ0Y8XV3LB0pDztrQX+u9gAqREgx
 sgKOMFnrWFkQqd7EGhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX704y8bydsv3e
 BR/o4Z0VsDAF4/meVXFJKcmstpWVEfz/vzyMg07y9lhHYBUXQnacnEISP+Lk4pXtF+FV78aKGvc
 BgiCDXX30anOq3aeL/b3LXbigT/LMBI=
X-Proofpoint-ORIG-GUID: 1EJSmNxnmJuecDYapvo_bfMvxyBj-zEe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230032

On 10/23/26 9:52 AM, Qianhui Xu wrote:
> Hi Konrad,
> 
> Answering the three questions directly, then what I can offer instead.
> 
> (i) Downstream kernel sources
> 
> No. I have no downstream kernel source for this device. What I have is
> the prebuilt Android boot image from the vendor plus its extracted
> config, so I cannot statically check how their QBG/PMIC GLINK client
> populates the battery property buffer. Anything I said about the
> downstream side would be a guess, so I am not going to make one.

Did you try reaching out to the vendor?

Konrad
