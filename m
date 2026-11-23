Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447408;
	b=Z3IrVP8SG4eO+7Ij9MZS/Rp9sPC+HHsREGDglutDarKB2Okdz+KeLI5Um261pnMIrMdv
	 HbzeZDVRW+/onbitT1m41gNfk/8fQJdEVeTDUbopanXQBupp5iWOqi7WEjSlInqCWavl8
	 d5UpD8cGIIOAqy6UXDvcm80uIWpfMqCOSO5ZlsWwHXETFTvTu+WyHcIS64E6aT9NexvQI
	 89gJ20YkdSJsivS0s6ibQ1y04UkqyhNjFWMcz+NMtaf2i4hP/mzdU2fFQXMzLUJSADFbz
	 z4tMJ5UpJBR0/4D9iUo2R+684zUT9HKVcSwIzVe9uJbH8qLKy8UIKRviMTnW09nDq3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447408;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hlb6BJq9p61fYoar56ASHEQgHyDDnHMDuFb4MoZS8Cw=;
	b=gmOX6ZDe9RfBndhx6FUejM4TrrMvPdxmqDs1YFsVDYZuy+zbukpyOtVD8zDeCV9jf3+T
	 TZhV2pIKdC9X9aVQaHYiLmAXZ05YdP79RgCJas/lmhb2xjEPhlVtBtREffnYMW05NL2Qb
	 rtHgoZ554z9IPQ18VZ4VJKjMahLhnlioorH9HovzNdtjgWBnkSfkbQWOqKUl7SvKK9t0l
	 ltz2o5t+r1pbEnvmsyzi2+yG0H2erqdA9WzN/VHUES9B55RA2CKv3lKqhSA27hpCldfYa
	 YbI86SOGCkGLD+sePYAP7Sk/l/6qScfkEjMIoL4TMY2y6VTAZs4gDanqbVzsTXx3xjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RqsFUyhC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CEYz68q6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73482606A332
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73482606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RqsFUyhC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CEYz68q6
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKxlk1937753
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hlb6BJq9p61fYoar56ASHEQgHyDDnHMDuFb4MoZS8Cw=; b=RqsFUyhCmepWWsF/
	rr280aDKH8Udvemg/SSbsq46+Fl38Lr5q8W/RJfdI82TM0AvpGnhAhCOvXHxJ5gV
	ZWfcZS1BYbQCSc9EtWGfw+zcgQL6q/sW4IxJVvBHEOGv3ISBggRgbQWys24T+eh8
	57YYXbJEDWSqU/Uo5q/XEsOJuP1++7UBc+wsX9uX2FTX+pTqS+vICcJiphPvS+A0
	E6fjdqh+7UAFny+VyWZCL6Ozik+9HYUwqkLb23pkos+54xiJwdRKy0suXfn8PbC4
	0aLJ1FXhBwzRwXUqZ6GMLlFxKAKpO5j136LPCR5do5Ld+YyIQX3g7yy7g4fAZ3v5
	ObYn3g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx28qk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:23:27 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5edfa7703ffso91964e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447406; x=1796052206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlb6BJq9p61fYoar56ASHEQgHyDDnHMDuFb4MoZS8Cw=;
        b=CEYz68q649iRL8iRrFg14o4fvCsMa7TdBAdob1ypyZXeUxk5hQeCjm0vq/r+4nz9QT
         2G3wYc5zHgFS5qt7adxiEoY0LmqBep1m3LwMUZBAg9QR9IDp/gZ0p9sniks77rKmiFXS
         nQVJDgMc9wskAm39FCNi1xCz46p1AoyL9XHHshMHg2KTXBGVxQBpVJop5XoH+dAUIRo3
         6tq8F6bgYLD5608Y6pAer9vx126VvRQE2dVBSb/bnynqd6Wekd0sxmX7p8WYFbeA61x5
         vc5U7GlqIGCAWoopGdNkbwBMursmQCfL+OG0mnuudZhnPZTxDOt+UOOjaptkZA2G9OGa
         6fcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447406; x=1796052206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hlb6BJq9p61fYoar56ASHEQgHyDDnHMDuFb4MoZS8Cw=;
        b=xqHSxHSE+7cNQG10/iFVMJ6uNUfhcv0rPepe5O5TUwzTLJSIFYC60lpfMDchpxfihW
         zW/+KCTa3p+0aSXV5tJ3eD+m0DFJvsdIgX7uShYO/dyBFg9le57VxrMybYf5i5Gyfm+m
         TvbI/txRhawho676dx5sRc4H3qMUtBMA/4RtWu6t6JJe9HMLYKGMAnt9+zr1hltc+mmy
         RU4fyQUOBjuPM/3BO3vTStM/qagO84Hh40CQjyteCnpRi+unnohzKyL0/XlaEdMp3bCc
         ZeRs8znRNRr3IPhqfeHw8G4CxLfe6/YFbE2r/fPKHMNwpefhxhTTfdudHmwi1mhn4m8u
         bYWw==
X-Forwarded-Encrypted: i=1; AL+hErFbTR8odQ+KVjXJxIMnwfJQ69u6/gkBDH9MIgwe6xdHHWkiJvTl62H2xqV4HPcmoIs1ILG06lHoXGkPnB/u@vger.kernel.org
X-Gm-Message-State: APuU4Z+QMitX7VYtMH2JRRFzmdx9nNTV9GpiLRoXvWQDQIpT5q21P+sc
	lZ6/ntviznsqjzroXW1P2erhxehZHiaiH7ILmlGMlt9GlIQHyC4UWaCXPcVRyPeo/lqC8YtSdkh
	GQZ19RLBttcT0HW1yb8td5vhSyJgiZMA6Hvt8Pwqgtr4oUBI8NM/TnKLi8K+sSc8R5bbX
X-Gm-Gg: AZFdTZfA7t7JRXewUhVUD82YkxCJXvg6lRW7j+VSVQFb/pnvDt22P5Z7T/dcC0R5qCb
	PhEV59aVeMsnnW+QjIzAiEaQDNLUCF1b/rU5/wGP29lX0ngYKqeEbNkc/oBLaHPsgq0YacxAXer
	G7oyCXOs9MMaydaPNxHaKYBUx1EUeeukVF35sDVOUcnJsdx13LppOKbHM8lN+39aj9WUYSNfGVB
	x/BCqPnc92hqDoMtDlnvL4GTopkuDG8dBwhEn/GlIjqla/P2FITnSikJthIm7pehEL7z/pyYn82
	uhfhzl4LjmzZmXxO4pxunqKmkU7zPZME7iVJNJSKIp9Xoxc7d2lXD4P7thFS+WRM5d8jJ/fEcnR
	pMTSSsLiu+Oietb2Fask18/THQptqsPfZu+SGEb+SBYVg/NJJY410UAnm+uDd7PrReGSOBi8=
X-Received: by 2002:ac5:c00a:0:20b0:5ec:afc2:c0f6 with SMTP id 71dfb90a1353d-5ee8ae00500mr7085661e0c.2.1795447406550;
        Mon, 23 Nov 2026 07:23:26 -0800 (PST)
X-Received: by 2002:ac5:c00a:0:20b0:5ec:afc2:c0f6 with SMTP id 71dfb90a1353d-5ee8ae00500mr7085607e0c.2.1795447406114;
        Mon, 23 Nov 2026 07:23:26 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aeabdcbsm420368466b.46.2026.11.23.07.23.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:23:25 -0800 (PST)
Message-ID: <15b682bb-4f5e-4084-86e8-df4ccd538720@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:23:23 +0100
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm6375: Mark RPM message RAM as
 no-memory-wc
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
 <20261123-rpm-memory-non-wc-v2-3-3e868b4bfa48@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-rpm-memory-non-wc-v2-3-3e868b4bfa48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b045a6f cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=948W2wBnRhwx5lWVa8gA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: N5S6mwuFvAK4w6ACoeKkEbUqzFWqSTSl
X-Proofpoint-GUID: N5S6mwuFvAK4w6ACoeKkEbUqzFWqSTSl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfXwb1wsa28NDrG
 ABe9hfIjAWR7pbLenabXDZ5rUfClhchmNX/PxOs99ojkfbD6zQWZjdq7IeEPu6lgFUtd2lrwEgZ
 i+L+I/x0aOaH4f8XbM6g5wxYNEbT5hM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfXy+vs1Tr5yfxi
 QYCLYLo8k1LojqGYQ3T+DAXgQ69267ocBwSbw4Gl0eabkZSNAOI7+UmTgixcdhd/Qg7zaYISPe3
 H27oEZZShe5eiViG13jzYZCcJFqJjdbAGmO+yhz7EUpm/UzIqeDC6TJotSi0K8Ac9gXV8O5tFor
 P76tqaprZj9XW6JnRyhqry7AbZ41ZXys6GaPci9P4Ir3UHFp4OXyXK5PTEisLllq6XbVuUXxZv8
 0GMJV6w4tQedk+OEeE+g7A6Np2prAbiK+xNqztgYOQEEDLyjY4/D+e+25ces27qx2zKr+wuhpoP
 MflEenBURjDktlKt24k5Jsp8K6xX4VyGpBJphe9LPGWfs/FEoPRs+04zw6F4SpPyQfTc4bjPZf9
 HrLZx/SoqmRFq1K9UKoJUDBqHWgdnHkixnFwrcxBlQxcprR47UQ1piJehk+lDfNNivnkwdQpKbM
 A9fRWnzSaHp22XOQY8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230061

On 11/23/26 7:18 AM, Vishnu Santhosh wrote:
> The RPM message RAM is shared with other subsystems, and parts of it
> are not accessible to the APSS. It is expected to be mapped as Device
> memory.
> 
> The "mmio-sram" compatible makes the SRAM driver map the region as
> write-combined (Normal Non-cacheable) memory instead, which allows
> speculative reads into the protected parts.
> 
> When Linux runs at EL2 (KVM with VHE), there is no stage-2 translation
> and the write-combined mapping takes effect, so such reads can result
> in XPU violations. When Linux runs at EL1 under a hypervisor such as
> Gunyah, a Device mapping of the region at stage-2 hides the issue, as
> the stricter memory type applies.
> 
> Add no-memory-wc so the region is mapped as Device memory.
> 
> Fixes: d3246a0cf43f ("arm64: dts: qcom: sm6375: Hook up MPM")
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
