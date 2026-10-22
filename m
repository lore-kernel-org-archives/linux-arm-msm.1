Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656242;
	b=hEIoumC+V1Iq0m6Fi0qpBhT8a4Eol+3f8KTGQeQJnhYPn4zs01FCRqC3xAZANzpj0FL2
	 qA1pvhjoonE5IOJaowme+plBEuWGVVVUddr+20M1Z/bWxFgRXK/En9BbqfiNtl7NmyEOw
	 zVe8IrIXiM78CAHCNkTZy7glV+O3rgZYsR1GLSK8o/HE+VkQvv3Q2WstlGU15PRtVLN9i
	 xB3XT9glz5shRjeNTAaVNFGSpjT52b84Dp1s6HrlLzVmef41db+XDcmrocqhzlKJmboRt
	 WDozv0jE7eLClvol/PZpTnN8e7fJJ0GdtjjXKZbCrdSktPtajMVGjLLOTP1jr9sN1RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656242;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=exPzNu3p9/IZE77xM5zZ2CBcVgSGazYkvGmm0/QzwBA=;
	b=oXFPzFyC8Ypa6moC+Qq5iNSw9F7zMTVTjkOzeJszklK8MlMX+jOjSosBEYYak4UQ6O1p
	 3soyk8I1l3zCjWw4iZjl5v8d6dxUOXMTNyhJFeZvlM/hcAOchGDvfw6wa7PdxMOaR9ZBr
	 wPCKSuBZQ41saqrn4oWc/zzXcTe44u99AY5zPZ3sa419DuA4P5jvzY35ZZ4IaglPfXtxs
	 pgP04m0vNVv8OkSbkeMkDebe00H+d0nLp5JRBH7tWohJ/biSdkkAkt/ADNPNjYRwHSHXG
	 I5dUyOZ+t7L0wu8pcZ+FCI10MHgPuaPufoCLMC/M5L3jGiIZNr7mUONhWSRlWAVlQww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a3BtI7f2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WLAYpwo4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26368606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26368606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a3BtI7f2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WLAYpwo4
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M702Mc2714430
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	exPzNu3p9/IZE77xM5zZ2CBcVgSGazYkvGmm0/QzwBA=; b=a3BtI7f2KXL74Buu
	aS5SOqqimHaSDYMMRfgtO+xlDpAMllSVmpaNRr++jcXpW1LIvgq/cEAcGy9SDw/7
	pP9oSg4VcnrbQmzE044o0rPWtB1tKSt3yPzRLeqFEhA7N+iVsqkxLqPkHLQfyMn/
	K2Ek9uGDL42k+2mM0za33L+j7kXHnH08/20PnCyEqa0Ba6ITWC9GqpvF7N6W5Ma9
	8J3Yn+I4J4VxcosI+1XvBVH/YFJWvC2MGzx44rcp+rVNQtWFhqjYks74YPfyNvVX
	SDxY06CUImMYKIyXk+v40Mv9ibKaKAE3oKL+S8AWBD9yiqtHS68NbcCDQQ9z5NYZ
	N1WwJA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsbju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:04:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1440e081so37486185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 01:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656240; x=1793261040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=exPzNu3p9/IZE77xM5zZ2CBcVgSGazYkvGmm0/QzwBA=;
        b=WLAYpwo4zLWjI7HFTjufKyICESyRSDHiswjPJzMaa0QtXQ9fGJSC6+9kTKNO86ZtG7
         IA7TSaCn+fcP//SjZZJ9OqrDHqqQmz67vPlA5+QYmJKYmp2exJmI8NK4jNRsc1LvTjxt
         zUYo6cJvnZF5goTE6awHhjKXCjE/xfb5xMCEgf1VhfyJEiASiHnOXJmSrlKhmBy94D9q
         v6f2wEXVQhaAE+pOkrt2VGkSnCjiAibuy2tglTRP/ANfP1lqTUcYVnpBYz5kJsVohe8G
         S5BErg8wqNlAwW6fq2+FdK03EnWELpPOR3Hg4/JsUHK833ZMah02lbo8VX1kwhUcMOc8
         cxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656240; x=1793261040;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=exPzNu3p9/IZE77xM5zZ2CBcVgSGazYkvGmm0/QzwBA=;
        b=ULxJgX7KtheD3S9BrFK7XmAqg1YYZhz0SLIGDslf5pfwKsvDUbhbir8DBUGntPtXRA
         tHDuBgN+oJTomwd0MoJkLn9D/DL4CU38NoM/8i7Z0AjTWskBThJRhcDZhShYJn99yFWO
         8Lj3UIiJGC2b49HCA5iVmEzIuqCM8k9ap8P/RU8hzGHLh4Ls7IuptTZbTRn2doO6JWVx
         ibLyp1g2IuyU99rl+opaxMYpdxXHd7mUG4LLSX6F9HfuHSc900WBgJ/4TbimSJaYtoMf
         bc+2Q1W07As9dO3TVLN+iZzTIj6YpTAIvJAai3m3HDS/kGK9vUoFlBHymv4mznvuzul4
         GExg==
X-Gm-Message-State: AFq9FYKNtrwZGeHL0ZnRkHhSjNwr0RrhCJs20Ax8ueE1xDwWsxHYevhY
	Ahu/EonBObOS1NORajmenhIjsxKQAJ/9E/M75saZIcOFzNn+eMZQVOdftbUSiZpeX+k8a25sgWt
	Ow0QkBHPD659d9+YtD9+sxtcnaHICCij8HxrpRgj7ghN/rSPD2jshilPautmPGUBTCPzP
X-Gm-Gg: AYBFou3hVdKxAAEi7eJQX0nYukjIYPLqeXMLnQ/JPM7KoLjeJ+aVU+xvvKRcbkRgajx
	4E21SEpyo5HNHWOi+uXTW5u8Uf8/JmiR9UZMgcC3XyOfqamYGkY4ak3AbASpwFj1XlMt263vWf8
	uX1XPATR3opEwrk9MhPejMTQZWt7Ncdj1Q2rXqszzsqO7sYTH9hbnDRBqVnv5Gar03HniOKGk0m
	PM4ZAd+LMAuI1F2+hdS1HAB8KW3ouyU4NASRv9f/9i2tJy8xylfNzwKWDHI4thXJB1ULCPCwnAi
	Cqhf8TLpUzYx5zVmqBpJd//4EpmKYkAGZrTmxRVbF0xB9s2sVJWpvA1aM2A7+KqO9X1VveAojEz
	dOVz5VCI0cJIZ53lrJGsnFg==
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr887370385a.5.1792656240197;
        Thu, 22 Oct 2026 01:04:00 -0700 (PDT)
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr887366285a.5.1792656239728;
        Thu, 22 Oct 2026 01:03:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4031104adsm1477349a12.14.2026.10.22.01.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:03:58 -0700 (PDT)
Message-ID: <4069a590-607b-474e-9e3e-f7e744d3dabc@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:03:55 +0200
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
Subject: Re: [PATCH v2 12/14] drm/msm/a8xx: Switch to generated nonctx regs
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
 <20261021204244.67160-13-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021204244.67160-13-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wz0NoZ6zTYbh1pi3X39OHWmhTI_bK-Uw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfX6ab2tClqcMvw
 Esg13vso4CEUdNKWcXMXKHEs1GPWA+w98hJ7qmy7NpygStPfYmJ0rrTxQ4SdLakniDUrfLA8W1v
 O1YKlP6s9wLOSs5g82cMfvLTO5LlZRX2dEQDFJhwFA9HXCGLpVFP+dRD7Bqr2tiyIBqJcs1/mrP
 BekaqGGeaQdNkAIJe1F0YJFoHiDzjN6n4/OA/9kUiwYE6MY4L34oh6GOJZD+XoNPQfMKOJRBsIL
 YBcorE9rISPqJ/uxzg2xEuUMF4H8rmn2gZs7JMKG9gRxG9SbG7kj2uYG+N48m6a/rYDQeIw3QxU
 YXsuJ9EmrkKzToT5kOfQjt+xQbTVCVLJiJQingMuWZ/O/Cr6Caurtv5yV472IUXIZyAkT9TA5Dm
 Bisb01VclCg2LgtMDMiASUJii+I6XxcT1zIfWOVPGRlHb9GbGt0CMJmxyZxFxeKkX8DvJcr93g4
 a7EUYw0dJMXrzLbvEHA==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9c370 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Ek6KEbicoYwQu6oDvHsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfX2PA1fQFi/wxL
 Ggma6Nm6Hy7Y7ku6sZbNViOO3EePcwbl7ZfZ+/DoaKllzwWx1JPa3PQA6AJk9k5B+QLRSv/soAE
 i4zDXr4b2vQQoeag4iM1ekdQTXXnsM0=
X-Proofpoint-ORIG-GUID: wz0NoZ6zTYbh1pi3X39OHWmhTI_bK-Uw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220031

On 10/21/26 10:41 PM, Rob Clark wrote:
> The generated headers contain the current (at time of generation) hw
> recommended values.  Using these directly makes it easier to stay up
> to date.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

For context, here's an LLM-generated change summary:

What changed
- RB_GC_GMEM_PROTECT is gone from every generated table. That matches the code change, which now computes the value.
- Every generated table adds GMU (GMUCX_*) entries, and most also add RBBM_INTERFACE_HANG_INT_CNTL.
- Several hand-written entries are missing from the generated tables, for example RB_CCU_DBG_ECO_CNTL and UCHE_MODE_CNTL on a810, and RB_RBP_CNTL and SP_HLSQ_DBG_ECO_CNTL_1/2/3 on a840.
- Some entries keep the same register but change value or pipe scope:
- TPL1_DBG_ECO_CNTL changes from 0x10100000 to 0x10000000 on a810, a840, a845 and a850.
- TPL1_DBG_ECO_CNTL1 on a830 changes from 0x04000724 to 0x720 and from PIPE_NONE to PIPE_BR.
- PC_CHICKEN_BITS_3 on x285, a810 and a840 changes from 0x500000 to 0x400000.
- GRAS_DBG_ECO_CNTL on a845 and a850 changes from 0x01000800 to 0x00000800.
- UCHE_HW_DBG_CNTL on a850 changes from 0x01410000 to 0x01010000.

Konrad
