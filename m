Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604246;
	b=yR5Pes0YOIv2FfsZ38KqMI/dPIQk3ig/i51fYLgFF73UEZ2qAifbOPY831XBu4navvLk
	 dLyu7XP/4Mq82XUplbWeXmPBEwpu8deXrU0QNcREXaYCIH2MRVwKGcLZeIPeoPanKyuFj
	 AYwKGVS0GMFUr+OEL4NLHoY26E/yHFLkTJLymiWj/31jCcvya6iyZf4xapShCUxe91cnh
	 ngz23swv5mTnPaZuHnBktdLXvpQ7e2LWkvXdUrMT4Maf5lKf71OOzjk/GR3nM89fBjKxf
	 rWJEOOrGI5CLWkuK7FNSST5mDwuQMQ/8PCcllSRtcvgEvbxI9vr5jqedSCR0VHAMWIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604246;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6DzF8BpUesnkTDGC3vGLBqxidELpfvE698aw+tvKd3E=;
	b=3Mt0AtVxVCtAKqzd0YCzWe+/gyosk39e0eCPUM996lNGELRvNFWJ7/FuS190P1lcloam
	 uc6s7LWFXjuPVzjRVoOWv/nKIny8QxlclB7FSQIAkeEHZJSv853dDW5jcqaDt10AbgckW
	 gB+ixgU6gIMtOZl52W4pEyB1ca3iQd/x7Y5mLFnD0z8COJ5zVU9NyWOCyXk3K03yCKKEk
	 Xidy2CKI++2voEUp/ZglraEqMYBun406QQ+P4Cz3N+l11IYKeXWrO1dinRH28i7Yrgs//
	 c95UxzHxZDPKDchQn44p1wwrHmuXdcQadpKNCccVaOJzSPENbBIhzw0/XeuDOlLIK2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="U3/9eESd";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifzydRbO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB28606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAB28606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3/9eESd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifzydRbO
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mR0S4131722
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6DzF8BpUesnkTDGC3vGLBqxidELpfvE698aw+tvKd3E=; b=U3/9eESd1EiDqFmu
	Htw1EFqHz3dcSU9MlAw8eNl/xqnRwlg5yGQO7QZqbYbMyHec6YzyV7vP/Hrlgeei
	+/sU16/4ewe+HKVwdjWstxny5JbHnUFzBB8AyDuTkOc0U9IRp/JLtGDTgMoTAZPF
	aCXY2hB4Y00wSQUq3e68zW5ttLtniHmj+5DXXZ5/qAOyoOkkPEJE/aogmnHWiEsh
	WL+hWwredsAC5CWuSEJUjhRwLKSyT7ocd+5kPLBzwhJcc7lk2nS5k4xPw6Quqkjg
	+u9f1HocgqWDKM2eLceENQrpwn8TaSR4VNuJLOnYNOHvUIUX37aY4wtUViZyg3yU
	VkCCDQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhrfwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:57:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9460411fce4so32713785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795604244; x=1796209044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6DzF8BpUesnkTDGC3vGLBqxidELpfvE698aw+tvKd3E=;
        b=ifzydRbOJO0fEF184DfHUFE9gWc3Bq6FoZCg5CoUDP2SYj6vpn9cBB1m40xy5sDfUZ
         3/g9CvAcOzafwpaZzptJfAgS7o9vyDme1areiettQOc1jfb1/BangZ0LdtZCmE6ahGXL
         IToFNN/2h+yVq25EHBSPY7riBA0XeSyPCMKEwO3biSKcTb9Tp9QFAJwHsQfGIPAgYYOx
         lAnvpyJKZ6VtGX2L6JXkoeL9JJ3qYwEtI2WCOwXjl51R6SSSU2mxJcGSE0HCqNkZWA5t
         pAxmxOJlo1RIammECTLNKwSOjy+5lsw2fmeCoZvfqEgel8wPqbBFYchiVNkL1VKvMWaT
         3g7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604244; x=1796209044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DzF8BpUesnkTDGC3vGLBqxidELpfvE698aw+tvKd3E=;
        b=Vy2mz1Ou1Pp63Wn5OYw3eZjiK8Wu0GATuJj0/joxlJlGr7seHmtZYrnc7GlvM0jUDJ
         XlxC60YJuYYKA8EaPtWVSsXcQYH/RBZDH8hrOvChHvquHvaQame/jt4vWId+RXmeYQ6z
         Ptv0B4r40N+wGdUue9cp1lYLGZBp7wrpxnlsFmNj1CDiQqD2Pbrz3NgQcD2s/XV2dykX
         R7ZtyXDEXUQIIdeI/yAFrYdtWbSp5LIwEnyipf/DG3kEy5lGClT3WmlaEBI4f8Te8Y+7
         7FUlXy2Z93mHB7vwnq5dHT3gmCPhrXHf5LtVc/ET9NsWoiS1cZO4m/dv9qYtE8VIhWtH
         AOUw==
X-Gm-Message-State: APuU4Z/F/sOwjKK16gJZL0YWt7DBXEMUzL39K4P0RdUabT72WnusJKV7
	KFX2LOwCZiMRQqZRr8wqnAoWwXhPnhVFlBFxhywgGUPfQmWjP6wL6nv/zhcJhcJpXHjb2Wv3uob
	Cfm2pGzXeSWQYIvIFZbfS+946Vi2wGktGoEcFERbxKAyribhjwTP7EFVmsscGyQK44z5m
X-Gm-Gg: AZFdTZdc6E+9gToJ0y4XEhpUirqkJW6AyC1clFudQrYl0zS89mEPPMRRR52klSh42SB
	FgCaA5AP+zqAnzyEUCPhR6C9ArRjJn6Ta/iLquFLMQF39UmtxzgYwHkxbGiMRTXuS2CoPTK1Eru
	VjzDLAXb8Kddo/QJ7mGSvdB3jHcyxHc6NDJyaIauv/laYyjcet0Eavzz39NI7toFzRdiyX2TCRv
	kwWPI4wRQBXblrGMRFegXg+/oxaW4BaE5VyJ5T8/+SLjbW/5AAWwthMY+ocNG7xc2N6LNnwHZtd
	Z36dkFI2yRU/4hbXeThXNxly7rCyIkARvMBTBSmS5kCR/S2IYoYcCAWA8efdqMVy47ulgUWMPnF
	zDqfyHWV0XjylB3bjIvVt++iV1I9f3nL3Nves5TVEzQa4YQTGirmnb2UWE8JOYNwec0M/a9c=
X-Received: by 2002:a05:620a:5399:10b0:949:6fa5:1edf with SMTP id af79cd13be357-949ba7f2491mr2901804885a.1.1795604244004;
        Wed, 25 Nov 2026 02:57:24 -0800 (PST)
X-Received: by 2002:a05:620a:5399:10b0:949:6fa5:1edf with SMTP id af79cd13be357-949ba7f2491mr2901802585a.1.1795604243589;
        Wed, 25 Nov 2026 02:57:23 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37108c8esm8206482a12.31.2026.11.25.02.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:57:22 -0800 (PST)
Message-ID: <e70f9afb-339a-429d-a569-fc9c452b1cdf@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:57:20 +0100
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
Subject: Re: [PATCH 1/4] firmware: qcom: scm: Add QSEE app start, shutdown and
 services image load
To: armandas.kvietkus@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org
References: <20261124-fpc1540-tee-v1-0-6c6985f05b06@proton.me>
 <20261124-fpc1540-tee-v1-1-6c6985f05b06@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-fpc1540-tee-v1-1-6c6985f05b06@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06bf14 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=br21HGidAAAA:8 a=6imIkYERwPMp48qjzFQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=rq5_1Q1BYlbxkLLkNd_B:22
X-Proofpoint-GUID: ZiTTHP0i8yvPt0nMSrPvOa6ZmATlZEIH
X-Proofpoint-ORIG-GUID: ZiTTHP0i8yvPt0nMSrPvOa6ZmATlZEIH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX5GnCosky4Vip
 wyAtzcwuHy+Hmovq4l1Kp48UEatD71QYttcs4s4msVfZRs7h5qzJExdvp3WOzne1MQMtP12CMmD
 /bF5TWBN9Aj09d/bqVCKxKBOzycRAJQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX43PBI0qYXHHA
 By/boG4wp4IDr06YOLECOvj/qt7SaLuDkrBL3Ih6o/KB6fptNTm0sB7MGHwGpJoiir9ekGjS7DU
 FkW2mxOrLVyiZExRUPT1DKPTFl+PtVDIkmHI3KbQczfHYKmUWt+X5i1cIrKCp1rDnVW/KSv3mKS
 GO1dLo9BU8esFWNNT1pP7CqvN149hMlzUZQh1BUWLseccZwy/HH5cN2Go6wQu+UbNQ/lbYHadZ2
 wr0PKC468NMn91hHJr5vUiCZBRZyKet/qDLLbSvXeY1EppX/AZ1XI6Mncku07KTsKe/Kq8rPiA7
 r+bYK1O97GmThv4tYO5nQcd64gzR/e/TSPaI+lAJncdStaCh4KG6BBIZJXxENxfF1HXrkfv2d0e
 aoMnazGDZOtfhwx5JbBsWqOUk4Dsjwx1cTGm1CSpbnn9RZy7G9A6aqTZfYwcKF2rnLJqLwfdu1E
 KhYiuBW8rfW4wWdR8/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250043

On 11/24/26 6:43 PM, Armandas Kvietkus via B4 Relay wrote:
> From: Armandas Kvietkus <armandas.kvietkus@proton.me>
> 
> qseecom can only talk to apps that are already running in QSEE. Add
> the app manager calls to start an app from an image, shut it down and
> load a services image such as cmnlib64.
> 
> Signed-off-by: Armandas Kvietkus <armandas.kvietkus@proton.me>
> ---

I see there's a lot of interest here. Please coordinate with the
other efforts from Dawid:

https://lore.kernel.org/linux-arm-msm/6b1853f3-4315-49cb-9b7e-83f967720a2f@dawidwrobel.com/

Konrad

