Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A41481675
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 10:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468044; cv=none; b=FtiVHzjTunq6H/Zlj9mqWMqrLKrfARDnNMi3X3fsbjJvE9DDDNiFkHbkHy9zV5ij+fuqMYDh967oNKSxVqSzUxUf6QGTAMU/8Xwb70h0ds7upzrd4iEjjOfoD0lKbD2K7byPRhv12v3zcqy6pHhFOXbcM+2QSRkuFa4fA2Awmvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468044; c=relaxed/simple;
	bh=ckBmQCsGl4i0H5swMQltGNEvLAQ4QNaTpkBEqzAPUS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f2VvXL8KaZBXWKinQl86akFD3luOvvZY7NCEAd7TVbTjpVHZn3QRalVx6nq01SpgjtLfdxnLTUHRlB48pJ24jpULbcPxevdTVXYIY5KqT5sclOtmDoEfz9q5YcHkwkF+WEGIMtIHwXMkjMRXF62ieQY+Hbs19o+aYHhIyK6xDJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIwOYd+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A+AAJ1Ow; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bIwOYd+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+AAJ1Ow"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h1183317338
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 10:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4B5u4XhHsQDHFwAeN8RPYZsJq7AgzxHPXAAIftTImPI=; b=bIwOYd+JYKFSCYrP
	nCi/eAq75tXkFs1ZYz/8MAhCy2Nx5mfuB+SFhJqYWAdqO5Ki8XFzECuVfSnWzAuL
	4thiNLSTzeKsrQH8W8M7dEv7sk3jh/6jCBbsThaG7649O4nEo4YKTFQMFhfbymVa
	5/Ra+rKB114Ves5BkmJ3Yct/+R9zfzlYATVK366v4VWegslqrg2Cxj3wA/GeutJ+
	ZWlEWlB1EpGpqgJqPR2SIE7wQw3G1l8luRBwF010kkya2wbCAhYUVOKD4FWDU7b6
	TfjVDwIpn5KdQCHsae/OHIlHaGMvkewseomzIlAx7Aykto9YgL2jjaR+TswQDBU6
	VQ6W7A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq38e09s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 10:27:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f27c80a3so852450985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 03:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789468041; x=1790072841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4B5u4XhHsQDHFwAeN8RPYZsJq7AgzxHPXAAIftTImPI=;
        b=A+AAJ1Ow+z3KDap3p5y5DwQ6Or5Jcda49yL5jcB0mdgnrNM3yqcY8foNUdYh7ghn/V
         uydNmRAPRbeMEV/KkCkpJ5N/Chgj2INnT1uRL0nbIcjKr433SZzCG+onFhwRqhLtGDeO
         dZYzUWCE/ZF+R1ykPn7Rh53jBxU5X0BgtDIQpJWypUdgLf81DpEhSNdAGsbn1gIrneJ9
         noXuH8PdJHYjNgA7omdGKrqtHKdqFvwVM6rTiOZxJ9MLh1kQH2d4FCwtSzQbGGFqb12w
         IOr/GMu1rlgvFqqbyrW48nOgfCb0rPT7l/lJrKATSVNDVNcpMqtKsKL8oR6LE5tpK24Q
         gpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468041; x=1790072841;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4B5u4XhHsQDHFwAeN8RPYZsJq7AgzxHPXAAIftTImPI=;
        b=LNdJf7ZM0Zpo3nbCg9yNoPVZYOt/kS+QPpNPtAVVobR4otCHI0Y2Xr/YIkzscLw+W6
         9yDzDZ8d7piPV1Xskm+deOGV5/im7LzwicY6IEr7Sf6TSzni5bQHRYFor6wQsa/cgbWN
         LGN1RgiKlktVhAnSAylluUJ3MHGDX81Oz25hHqQhmPt8TtxYDgqXGMlG3nn05SYUegc2
         KxARa+GcfkjKXp9ZAePXwbVzMg1DM6ygQLnAeBqsmTwOOCf4+W6OcenbjKc2YTKSjZtv
         XKM3mOVLghniOLPqMHf6SBHoXlY9AW/284j03nTjtuH2lucGkentLY+CiyheY2Vz7cUj
         LoQg==
X-Gm-Message-State: AFuF++n7Sfybt1Q3LyCuX1+eMnA3SsAQyudSOPCaRriZihuivOvP3M8S
	844u+//x4KTzGexdUWhoEIJaRZ0CCi5etZCrG7eQ3QKVvfNE++sCrvlIt9CTniR2khYFEs/D0Kr
	ztP+h6IO0ju8zN4fA4j4EGIUyBhaPErv+bdBRkADPK+YCnJg3ebrG18GtrAYZrsnTfrL3
X-Gm-Gg: AYBFou2KNiE0Ae4yGLg2klPd2X32IXnSIV3zZU/ON5tJM9Z+Qd68rqzpVrGk2SEjNYQ
	CyJ282sFE1gJoJBgIGDti1QuTyCE4jhWfsnq/vJvm8+njYULc9/lF97p8CCibD3Mbk/fiROWbLb
	ien6+8zwVYMejlw9qcaJTbXOv7xnbPRi/DCpKXnN9sH9VONma9V1dnuUpedfAtCO++l/c7G+iH5
	Ztl67NsG0/1ovSKXyuddBTIYOEhTy5HCrapf09FGZkosRD1gtk5uGGxqLb25/vpxeh/+bzSwjNo
	T0j1r0IhlCP9Da0M4wNUaQNNfCsfeMPEIH10ZI2VGVhc5CFCy+pkVkCqdhCcJz/toK1sDF2os7R
	CQ+dYw4hGrFQ9i4FJY7/5EoAw47sU9oa+f3iVyhm9TxaiPjb7XOwUb8222itDvCc=
X-Received: by 2002:a05:620a:2955:b0:939:8bfc:471a with SMTP id af79cd13be357-93a29bb4ca4mr921802185a.49.1789468037818;
        Tue, 15 Sep 2026 03:27:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2955:b0:939:8bfc:471a with SMTP id af79cd13be357-93a29bb4ca4mr921797285a.49.1789468037445;
        Tue, 15 Sep 2026 03:27:17 -0700 (PDT)
Received: from [192.168.10.107] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6b6261sm71836915e9.14.2026.09.15.03.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 03:27:16 -0700 (PDT)
Message-ID: <0bef7837-9fd7-4401-b6cf-ba744f5beb58@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 12:27:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] soc: qcom: Add QMI TMD support for remote thermal
 mitigation
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Casey Connolly <casey.connolly@linaro.org>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-2-b15d47adc379@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-2-b15d47adc379@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KjZeblmlik-AV9JXAvjcnLbMh1EK7e-l
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE1MCBTYWx0ZWRfXyVGHTUOIwZ4B
 dSH9MrCazxAeU6bUJFddshRpJLeWxRkbrowx89ab0VmSUSXz6PYsy/OvCyFp64pLNoA2361RCj6
 R7aVKnW/XG6g2UyDEDDDY1FS++ClY8U=
X-Proofpoint-ORIG-GUID: KjZeblmlik-AV9JXAvjcnLbMh1EK7e-l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE1MCBTYWx0ZWRfX7L4qVTIz3kUz
 sdogol42JdjuuTGjXkJKyPmoO+PA29i+PDfqqam6kewzLZDUmi7SBNuwnu3lOaedjiq6qHoMg73
 nP9mS6ekneSQxIaFvsZZ794BDj9uNYS6QQh/QdoBJFWQgop0bLLykdpDkG8YBHet3CVVSVCDRvs
 2ykQb2y/pDZ4KZP57rnX4L/uiemKLemESBDSx5DG9RaNjFHoodc/ZD9w/3eDPspHnNb8kzOIEUz
 WmXkTNtgsa0gr4NLKqtsTKfwAXLhHSNH1QXd4MiPLkOEFKPVbdSARFUlZ2zTpGUhCfA5c5u6XUd
 RK4bxk+cy65R4y18a+yqn1IwlZ1+Z5Rj7DQLhhbU24JkdqlHsPIf84qpr0XzNvlG9R/JNKh+F74
 emyavphBCsmkNiTp4lSdjhI5x5dPahHG2ysSGg82grDPP5dwf8Fnd5yU0+j3Yl1+L7YXQFmQsbJ
 fnIA6ue40ZWi+LwSoPQ==
X-Authority-Analysis: v=2.4 cv=BswIUoX5 c=1 sm=1 tr=0 ts=6aa91d89 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Zce52TE6RWQhZkoPOn4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150150



Le 09/08/2026 à 14:28, Gaurav Kohli a écrit :
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Add support for Qualcomm Messaging Interface (QMI) based Thermal Mitigation
> Device (TMD) cooling devices provided by remote subsystems.
> 
> On Qualcomm platforms where remote processors expose mitigation controls
> through the TMD QMI service, client drivers need support to discover the
> service, register cooling devices for available mitigation endpoints,
> and forward cooling state updates to remote subsystems.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Co-developed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Just to clarify I deeply reviewed this patch and made some changes to 
improve the code. That is the reason why there is a co-dev-b tag but not 
a r-b tag

[ ... ]
