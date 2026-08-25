Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825CB3F6606
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 09:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787651429; cv=none; b=hT7ncSOaYIHwNJJ657CYKGj1PGWzu1H76KrzsyYiszgrLYaFpXNnbBoyZryHKo5+coGhyGFfqbYTl9rFH76elFQIRKeGYNqyXiz4D77iYdewk5EYdW3JuBeJsoDr2U4bTtv3LDPquSsdEI/3Mm/futRZzwHsNo+3hulMDPxiy1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787651429; c=relaxed/simple;
	bh=gNV8XyGRdNQJQv6ANnY/KKnuHFv3nDCb0YIitvKZb9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uS6tZJ5qClmWm4EKKpxi5Md3AgCpCACXMlen/TOSDDNhp8azb/Q+unA42NHLv53HIMEI08IWYoNzpDXbJbGYWD7MLf7lvW8aLCQv/+PRw1D7F5pqkr4GFk/Y3kHZVLTPzrqZ8oyv8zQrJ6y91kRPu0Ux4/uFGNc+Vib64VEBMQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIOgGW3+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UZODPvRa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIOgGW3+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UZODPvRa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88RAK196278
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 09:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gNV8XyGRdNQJQv6ANnY/KKnuHFv3nDCb0YIitvKZb9o=; b=aIOgGW3+veLJRK0A
	cOCJpAzK8UD2ceM/r1QAGWlqr/glbiizXz/VHD+tZwTxH5aM09LobvUMwwgsir8d
	T82TvJtFInnv/49WtTchBTlzdcf7kqxqsuOhHo/wbf9WXB7ZnewVEuCxt1m6xiou
	8/AzsnZ4FF0cmvjSK5cNmNW7oF/VwehxiJAHAFhMq60gluM0JtvolCSTLyKhFmRR
	uLEmsrNy5/GUa3LnQWcjFxU3HFTK0TuE4XVTABqY+a2n0WBkVHFJklXGPFVMHstI
	seOA8znVtBmbgKE/TNXK+62kmjtIZKLlMtwRHVAAlskMMQAsy5qjhThL94bfRsxw
	2PCOtg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93pvh8ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 09:50:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c07313be5so10790891cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 02:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787651425; x=1788256225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gNV8XyGRdNQJQv6ANnY/KKnuHFv3nDCb0YIitvKZb9o=;
        b=UZODPvRafa2FFzHl5lXi5mdNur2Rd07MaaLZimicjEadfFXWnFnX+BrIcWifjqCHsb
         Rbo6G5+QRZ4LEqH0Ijz4sBovKOSgiIB5pJCyH5hQFpXBoteRk9BSEhirHN9I8ufn1f4M
         QuLdM2UYgH8RQFhJ/XjknAil7rbWTJdRXGhn7ouVQZwIzd/lINRzxAC9/fV+RE7XPcCp
         HjwKdpYCClNDX5TLy/FV6I3hXrKlJmYI/YZpcnZ194S3E4FfgWLuy17ixUwdF3HD1E5k
         g2vMfg8px+lxDJnkY6bdhDzfLopLGgctcxgDXWqf/GEqsiOoKJz2KivgV3Ofp9D69J4o
         E8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787651425; x=1788256225;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNV8XyGRdNQJQv6ANnY/KKnuHFv3nDCb0YIitvKZb9o=;
        b=k6it4Qx+MqBdaR0hYmNUgpgQD3/xvR/NytbYwJiI/XJu2SEXzgHQalY8/WDa0GKLzL
         tIQ9/XVxpVFAab1ToZYcScWhgW7QoI27Feutf3uY1bTnZRcTeD5m0Jty0oPEsZTv/+wW
         crNda9nr5M4kD8jd0RsE9OGtm9Bb0M2YGV2aCASCp6oBSuPZNsQz82168mxA8urRWemX
         TN2ViluMXjdj0Dsfm4JRWtOXNygTRrvCINz+onTrwuWot0NSAhXzpabxRrcJ28eViY3x
         pxHlgZiMCB2RDE+4gj7sOYRHg5cPflBXtonn5BT0xCDyLQy2ohOoWURLwpztQf6vJxsG
         44iA==
X-Forwarded-Encrypted: i=1; AHgh+Root/9ARvAjvpIwDTijI7L5GzhGpM5xYVTCZ0N7mAZhWBe82eNJRMb8G6NK83gRJPr1hr+gpz/G8glKL4Y/@vger.kernel.org
X-Gm-Message-State: AFuF++mGjd+bfPaSrLEZCc+lFY2OgOa9JfQ8aV8cWi+sSQStXjLivGkc
	ahBUA1O8Tg7ks8ao5yUpzjDWAmv+N+rrFUH9X0SeTwIO6yAnEWS/XqqKZNga9ZCJKtpuJy6FXSu
	hxiXENxpAhVZHRmIJ3fXM/Zgz4qI8FUPHgzgNLr6j83V4tLrCunb1NZE473BZXDhAmfvn
X-Gm-Gg: AR+sD123XM2ZO+hE6jLHGkh28AYNvGzJsTfnO4/MQLa86LKG9ffZlAHE/eZUtvTF85e
	dOOkeRcohbsFdHXG7NZIPX252+DcUpWRwaAdxctUsqb9crznZzSKgRSYFZBylgPXEJ/XbYne+Fd
	CeLxaXt5wKOBtj+gHac6btFZuRWqOwyLw0zpyvFwHAsT+7FGLRv2MfUlmplgOI3IKd0X3EOkiJv
	mMsTDtzVzCYhY73wItFs2oWmz7PFbveWmzNBKc9T3jAfs9bxkVkovXKvZrtAyq8/I3+D5a60FSN
	pLqn+uE0/hkWx/x6FdX3kRcwpuSTfsPr6dfL8PWDsTyKgVuZ5eFNAn+ybF1spYJNGJo6A79i9bK
	V/eY6LM/NG0JxSI1qKVZHaO73
X-Received: by 2002:ac8:59d0:0:b0:52d:8270:8e36 with SMTP id d75a77b69052e-52df5a67157mr247828021cf.5.1787651424652;
        Tue, 25 Aug 2026 02:50:24 -0700 (PDT)
X-Received: by 2002:ac8:59d0:0:b0:52d:8270:8e36 with SMTP id d75a77b69052e-52df5a67157mr247827711cf.5.1787651424312;
        Tue, 25 Aug 2026 02:50:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b60asm1572829466b.9.2026.08.25.02.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 02:50:23 -0700 (PDT)
Message-ID: <46e5d133-61ce-45c8-b706-d146e654038b@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 11:50:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add missing USB clock, power
 and bandwidth votes
To: Greg Ociepka <greg@ferrisoft.com>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260812083522.774711-1-greg@ferrisoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812083522.774711-1-greg@ferrisoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4MiBTYWx0ZWRfXyU+raHQtvQT/
 bOMyI6uPNcSR4S/RN8ms2TqT6ruCWmAclRHc2uumCuc4eqXo/GBmu+OVh3Qw2Z7JvfZdZXAk9Zj
 qdk6o7Hkzd3LJjvd3IgZRl5/cxiaBtk=
X-Proofpoint-GUID: 0SZ6Zy5dxoSaT7YiQeY4P4VuxtgTZRNa
X-Proofpoint-ORIG-GUID: 0SZ6Zy5dxoSaT7YiQeY4P4VuxtgTZRNa
X-Authority-Analysis: v=2.4 cv=Ru716imK c=1 sm=1 tr=0 ts=6a8d6561 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QrEPX_jjF0vNn40jFYEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4MiBTYWx0ZWRfXyvmttGqoARQ9
 5YkjoXCEyCS6kjBqTvoeyp6p1UgRV3PU5hF1mlV7FLrzTN/Ye4CwDJWdkQXmMvDPjiB2sFlvcTs
 rgtvFKOOZWfiAg/h4XZceyUfVC1fPa1rcDvGZe4eOr875Iffi7h6IF/Sx50/fwBvhQm0yzHxsJg
 W5uBjsNO2VdXjfOtaZzgw98xxmYEgNOYZtUFfOiuQYqZBKTa7IBlgIZXU00ZmvrotIR3XSUwCOt
 9XlEtDIT2maSkLal4iTI8fEzCiZXI2z+y9OvN/ak7aefIMzroo+LhE+GFXd2T8ZEuG5Hq5Dyn7g
 Nut92rnoIHA/XXTBAKym5NN6Fw+Mj0SSZQfJVNKO1Qtmni2/nuxxkLeEcpbARKWuecgrh22MREH
 V0MjgfA9saoe8YnP+pj/f/Z+9HpCkrlCFRj7iHr8ZZVd37n4+SrP8ouvXEsN2n4pGsZY6Gmp5d2
 M1ZQ0RuIVyfnim/y9Ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250082

On 8/12/26 10:35 AM, Greg Ociepka wrote:
> The four USB3 controller nodes on Glymur (usb_0, usb_1, usb_2, usb_mp)
> are missing three property groups that Glymur's own usb_hs node at
> a200000 already carries, and that Hamoa (x1e80100) carries on all five
> of its USB controllers:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
