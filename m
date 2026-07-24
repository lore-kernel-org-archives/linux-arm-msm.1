Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E3C3AE184
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893834; cv=none; b=bDloyeD0pyquanM4sJIM5ZfAXZQ2V0r6QnlzEXFBt3hTCWB8GMoCfzW42Lbn71tuMq10jNUz92DNuir4fLcxEMWmjPV22SCPKZzo6DgTO9Hey4AsDQCtSmjJwwWu0Rz0BsldCbkIqzz7jc0ob/v5o2GOWNn8KTwPXB8EwrwED0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893834; c=relaxed/simple;
	bh=XTNSnlHusJ4VBG0xAKOutwbbJoMFOkjn5GzG2m6QYiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H3Z4jEK+CE1G2jXQjAx6nEvFmHn2qRk6xk6DnWjrlCUVnHW3ITDK9b4i/pVO16x1r8b8XEs6c2BwQsveCXsQ03GsmOBZCllYgeWWg+9YsEO4JmluaTvmEMRWSxzZecmJYO0mKF9E7UGrCoj1JfiTM3kZa2sTcU1m7SM/qFi+hao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2baCOSD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F31E2kPN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2baCOSD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F31E2kPN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAE0BW2917066
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngi10dipnmpjKLANYerUzQW2iedOJBKsjkGXqgK4nLk=; b=U2baCOSDeLzVeYNW
	MlanArAiGsjpiEAN8BSUniMiMi6N57lpxLn+5xUpb4kp4tkhWfHXO+bKh77CFezL
	882eaIRSI+IKoy6JtZrt/GHJCA17jeL4ir74E+nO5EU5Tlg2J1vzxT1gW+R9SFrX
	5Mpp1elcHychyq0qbtP+E0FuXdKVmzOmobahJHhTwxyQxwehcO3Ei9OdHER8qkSY
	3yE1FG0XA4rpobHe18WwNNun4C0z9fxINLqViL8m6gT+s0HIs6ecMKNtLCUt2lDE
	IKRlpoWB8Iuan0IhBt9WSAl121L7aKbGecBs+iOwtoPKdflp0om400CvykBOUW7R
	1eBYDg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vm1c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:50:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ef4a54f86fso668386d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 04:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784893826; x=1785498626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngi10dipnmpjKLANYerUzQW2iedOJBKsjkGXqgK4nLk=;
        b=F31E2kPNDFFsN8hYmDl2XozuloyD6ExvWzZwO0ypEkcKGXE/KlwADbCtQUsM4OGkYh
         Ca8gfXK5vU4668kEI4C7LsUHjxP/fG8SHil1Ib75VgwmjIIzVKXK0sadBD/4awSe2p05
         uGjbQ5LW02tNW3poHCbDMoJhYZIbb+TEPMY3PJwz12UvRifUxeAnB+s90VI3MRTnMwQR
         DoG8p7ZOfK9tDDookBkO5HrF9s9VFmec/dptfUV9pmnU+0Siv60diM3eW6PqPEKEFNgm
         BZr+QFbhd4SJ7Z6c12HlWkieLGlppUDcYU4YREPZdsPtHfDZC2GXJdfgVhXihGib96Jl
         Fo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784893826; x=1785498626;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ngi10dipnmpjKLANYerUzQW2iedOJBKsjkGXqgK4nLk=;
        b=nUjAjnZsWz5TWcaYiU6E4wXZ7umhnB94CR4mbnvuVUdypQnNJJtV3uBLe44QQUPDGm
         nngElScoVor7JlcJwNS0jAAkLdhz7cX2bqACdSWMuIEupS3qq1MsI2qiy3f+A0vejYfL
         PZed5D+PgViITkGjciBuSHFpo1HPnRjQp9f5EdveFYvl4ZsTBSG5Id+wqJf5aHjUiehv
         MS2rcZZIKea+zJQICNQK1x27l29l7c6YKFNDiqWkn6tBbj8Mo50KB5PvZ0Dc2KY6gjXO
         a7E8+Sux5sOkmJcD05RcLKMXiqDRf1dW1w0/UyXQn66H/Nauuc8qIYemSvy8siyEp5T5
         1dDA==
X-Gm-Message-State: AOJu0YwsY0NysHpG5VwqyxzTP4IwYGHOqj5ChDuYvc+jJrplfRXXfKcZ
	Mgt1vDup+Z6tkReFlJ2jAhA6mMydbOvLwYj9B/j5eOWUGg2T0YANP4JNMsAMIFD2wjfvIQxBb5/
	8GbvqjqB8SYMnhsMxh3ToqScM23f9vtVOGrgK/UwuQ1bXJZ08c68bIV6AqdAZA5gniEqE
X-Gm-Gg: AR+sD13Eka6oPuYP4ncUaYPCleqaqqYjghfrSmA0cyymTzuNSEnpLk9/UjwGqCXcDw5
	QiPlV/ox+15tj4kQgzop8dCdJq78Uqz+hdxs2KZiqNs6cms3oqOH4FbPBV7LpFNdg9PbdNd19A+
	OrmONbIwN3IkpmHNb41GkOiKaGRPw1SFN2X7uk5b8zF+cgOl9oWtFEyLy75gEzhjyVhuzGZbqN7
	VRVUWPyfOH7f/eH9TqT1RsiaUwUj+iMkD2cd6oRsegVRUBli88/GLbV97DUTGOqoerDnRhkw3qD
	mUpxlyusb63ma3XWI8wHA/gmnJ1BmalFVB7O2jIxf7Y/hcHStMx9vx2myWSiD++pViD0vOBftvs
	2+zQRiJpZwBq6qKrMwjDsW52u
X-Received: by 2002:a05:620a:454d:b0:915:4ca0:1210 with SMTP id af79cd13be357-9315e3318a6mr309420185a.3.1784893826518;
        Fri, 24 Jul 2026 04:50:26 -0700 (PDT)
X-Received: by 2002:a05:620a:454d:b0:915:4ca0:1210 with SMTP id af79cd13be357-9315e3318a6mr309416085a.3.1784893826012;
        Fri, 24 Jul 2026 04:50:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebbb0fsm326664666b.53.2026.07.24.04.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 04:50:25 -0700 (PDT)
Message-ID: <e3de235c-e962-4882-b4ed-8001142c838d@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 13:50:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: kaanapali-mtp: Add s5kjn5 image
 sensor on CSIPHY2
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260720-knp-camera-v2-0-a21c3f0ecd55@oss.qualcomm.com>
 <20260720-knp-camera-v2-4-a21c3f0ecd55@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260720-knp-camera-v2-4-a21c3f0ecd55@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwNyBTYWx0ZWRfXzhBHFBRoubHO
 At1JVQeKtnxGk4dN/xCNneX6Ie5QRPkgylSsdo5dgwkoVxmtqvkXdw7CXGBOS3fRBEhtasQmUjv
 qobJDWwlb05QxuFv2rpfc+OgrHduknA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwNyBTYWx0ZWRfXwcgmqzJW6r1i
 GmXub4kby6BO211DWiN6YbMCe/w0iJYUd/MUuexEwYmfC7D5nteQ5t5HOt4ZNvjspg/9PycuhnZ
 Is3zjOaG2bPIUdVVj2KA656+yMlJx9T4YzrztNznKb82fZv8yIl6DTre1VSC+iFYFmXPFzBtbqb
 nwWmv6j7/Wq7yMXYthONdf+JGRz34e4r7+96SELs+9B9BQ3HoO6WI6E3f5Dvvs6seKnXzTutONz
 uAE/RIFIR9CEE9WouQIQyvEZgLmkF47xH+c90+u+uMwApWFg68Hbvcq+6GBJZ7SxED3kHreVpVH
 peejlqWyLfxRVblh8iHoJxr9VqCw+iCD5tSpeHNsNCtDnRtUMhQa8M9eNSHeQTPaBM11ztjU7mq
 ipFjrBrCPcBdkWGPt/1g+cmUqjM4NjEpRPfn27VrcOQvtNHGETr5agv1juUnQm6wj+V+Nu9x0d5
 cri6TJy6g6VmQS9CeeA==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a635183 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bz0ebJsaLN0xPZqafr8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 73nrkMUgGgCiSdZuI5jltn-cwD0dbQPy
X-Proofpoint-ORIG-GUID: 73nrkMUgGgCiSdZuI5jltn-cwD0dbQPy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240107

On 7/21/26 6:57 AM, Hangxiang Ma wrote:
> Enable the S5KJN5 image sensor which connected to cci0_i2c1 on Kaanapali
> MTP. The sensor appears on CCI pins connected to the CSIPHY2 interface
> in four lane mode.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---

[...]

> +&camss {
> +	status = "okay";
> +
> +	ports {
> +		/*
> +		 * port0 => csiphy0
> +		 * port1 => csiphy1
> +		 * port2 => csiphy2
> +		 * port3 => csiphy3
> +		 * port4 => csiphy4
> +		 * port5 => csiphy5
> +		 */

This comment is SoC-specific and is really not very useful, especially
since it's an identity mapping

Konrad
