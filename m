Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218B9421EF4
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388938; cv=none; b=a2eCNDtoFZf4okdNlB6t3nF6GSldsZImuYODd/rpJzLSVxkzYi43TI5/4OzSFDivWA1xlROK28C/zMhm7DCF9RFAbNcvZUPRf0v7s5HeAK7g//Mxvvyvcc+dEvOqjr7SooJW7rT7eLIwC6nr97w+D9unD7alzUDW1r7BZluozr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388938; c=relaxed/simple;
	bh=PNm5ThoBhQTfuRajdPniX5QsIR0yF2ykSwtXSu/co8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VBS/sLtVXUXdCIdJvMlotViz0AgSnztzPgoKTOv/SffwT5TIj3v/BjwIogWMGRdWjwi/8+2yr5hME9ayJdvt98jOTcONl5xiI5Pc6cZlVIqbLKHyHdH8rKr50rQa/FxhBvlKmPxCv4tlXS8P9Ir5qq3EwG4yO+p8ob697XxVRjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNb9mEf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MSGVOrU8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNb9mEf3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MSGVOrU8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRFES406691
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ok88jN6tA+bS0wPG8NA+wgvWUCzgWt64lfwgR84wwPM=; b=dNb9mEf3FNT1FZnJ
	+sVnJIgxvoWbjGGQX0oStfXksLgwdvzXZt6Qok5USqDmNrvEZMCi0aJNLHQZQTYZ
	Xvn5iDsBlu3Xb37+Fl4KVvGdUi7E7Wx61xn5xEXs1x4eieVodpq8F56F60xq5zPU
	hBh+YR7S8CRYbjwlCA2aj16eV3/LIl2QeHOY1vk1ywCmzH6yHPUd7BV9ju+Dtsjy
	dDzQjdPodmyrWzKQ9+0QnmU65ph57ovYS6p8Rl0VVecg9MExLk4K4ch/pwmsliTV
	1qjGt4Eg6JNXKItSM9OzmsE2EeBZlPA4Y+jmVKE1bP9PACVyKEb0xILd6T4edfxX
	XU/qBg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr606-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:28:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a18b457bcso44878885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388936; x=1789993736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ok88jN6tA+bS0wPG8NA+wgvWUCzgWt64lfwgR84wwPM=;
        b=MSGVOrU8TLn+PfD0i4m76qlZTaxSHWNxWtUZ01jTc2VBePM808GWtoIAmo5r+MWcUP
         Osn6hfJq9bPSr2d66Ww7Yd3Lw8GUA6C+4XvIs/cAs2y8/464WtokrDdfRuWaIUlub+u2
         MJ9okSD4Wo1ZxTYTACYNZxmRoXi8JSR61/51B6+rmiRBPVPJVfUXYYKKkvybW5CKnXGq
         rn9tSZ4dDU/+JI/RBivSgYpuGS6PBZyUF8rxiNdazxYxwNI36M3vYwEoeKCpFmZaurkr
         W6BvwDl652boRy2BcJdA7/G0VjecJXMglo84wj9JnsAnyleJaRggwZxe9ulHz1ZKseQX
         Jv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388936; x=1789993736;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ok88jN6tA+bS0wPG8NA+wgvWUCzgWt64lfwgR84wwPM=;
        b=JAyru8tN2djr0rQdMIzsSn6ykqEgBx360eBGXR0pUK5YzkUka/U7xlldAj2tKsrhPe
         OVIYWANMnKiDx0gR1j4enwRhFFAsfX/NUQZOQPW3fDPn0CaffGdhyH4AGuahITYXuEOM
         aU5mkT2NYZGcs015NRseSN2zbLnkOkT4X41gy3tw7ZsMJpDrbKIVzBO52ZI3YhDzshNr
         fohEljhBEtuN19vHkro8+4W8UcPIDDlbsTk7T6BI7HxuJdkYelivQ0jH7K5e/o3KOzva
         +9wviaIfHhYGNse4/95r0Xhsa4dKSUav0A2ThDSBbMBMsL5BlukEPizqYaZ71B9W+Veq
         ybbQ==
X-Gm-Message-State: AFuF++lIhYJJKSGK9KXwHS7ZDN/Dggmm/t/l9XaiaFEstp9KUKDLsNh9
	Cf08eU3VlpMRT/0ZH+ubEYZgzYDxhy5yvdv7y/qjQnuW3v3MgfGMJr9LnIijtOVmF10aKZchK0w
	r5XLkIQ1QRlhgLsmDydPEClIuRFT0K7hzIbks7buOnzlOKeCk5P8GKPEUWDRSohnvGo9P
X-Gm-Gg: AYBFou3vlLCJ09lJR8JzCW3lll8dgnAoL07i6VjqqXiRAgEZ5AjXXSpGX0s6PhKcRSN
	wBdB4AhZK+5vdzdsR7Y2+jRxNWH0nWJev0XjfwhZI+cJqyRp/KaletFCzonMIkP460KkztWJ4Z2
	e8YIvZc0bCVSlBUKmpJfPK51v1DtQqkAS7EfGHQkEy3TJ8zK3ngUxz+FxRqhyVVppbJ+RMrZNe2
	Y/2c2g+/nyv8hHEK5Dyr7sNhvxbrQFtKeiZ6jfFkrdR4g1Eff9rNhoADl99MfQsbfalFYKLF6Ix
	/Byb+kJY/Jv3xXAlkGxxR04yjojWSlRYmDZ5z56KRgE4jM2iv6LEa9FXztXhiRhKTsqQLoCtPja
	mKpecmtAPx1D6onc2WuiURw==
X-Received: by 2002:a05:620a:4384:b0:93a:1312:ff19 with SMTP id af79cd13be357-93a29bfd542mr225506285a.5.1789388935526;
        Mon, 14 Sep 2026 05:28:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4384:b0:93a:1312:ff19 with SMTP id af79cd13be357-93a29bfd542mr225500485a.5.1789388934693;
        Mon, 14 Sep 2026 05:28:54 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296605b438sm419224766b.26.2026.09.14.05.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:28:53 -0700 (PDT)
Message-ID: <09fe8d04-002f-4b9c-93f2-a933be8e875c@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:28:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 31/31] arm64: dts: qcom: sc7280: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-31-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-31-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RmIqs-MWm4LMs3l274dfF3MbtWgKw15R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXwd5PtDmSJxKS
 Cd+zgj08wM9jNo2kD85vKIZTXLhkE4X5sUF6EqzO6nIuwjCZHsf5Aqx93sm6owX/E1p+cAx5jnc
 ZzLhKSDgIxlcaj+uuylx4+IJPLgW5xPjws3RfnfSscKOl9/19CTAkQue+dlY98OyEydvXMqklqX
 1zKAW19g75/Ln+3DiU7UXzNDve1OFwEDXHTybKH4eMTGILLgr96koT36Vsp04bVN5671R1nrI6I
 nQQ/UQ6zG9P6A+4C6+DU3Zfh5Wbhu5pY0EydlQATHkF5Ol8CQwXmpPF8skBeFYtltUZWPKEZT7h
 uXgVmudo5c/c/otbJEXOTFobZlmbIr7ZYJr4tar2TleNYC9D0jx4fKr9bTMFM0nSjoU2PwY1Q8/
 RYRkNHaB1S41S+13DrZtBwNv2q2OIWvINDxlvQMW9vinkEoqSIuchEuyN4oDHayNpWs1gyvW5Y5
 l1y/9dXdl37+ddKDaeQ==
X-Proofpoint-GUID: RmIqs-MWm4LMs3l274dfF3MbtWgKw15R
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7e888 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXx+ktz1BlJJmH
 ZYef/4KT2TesV30zldKtiSRheil34WrG7D/tejAEgWxUsWZLdJIZzY1pK5EY20qIBd2ThAWb+j8
 Sp+aRSrKRI/oRdHcgx9sBtoy87ANZOA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 9:00 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
