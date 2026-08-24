Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AA91FCF41
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787564783; cv=none; b=fw/AngjrxECSo5p1h/jEGeDWxI1MpP3ceGEC2dttqFtrQvlUSQhomAPymH0xK6spZmf2/euopcVnOBlyTxMi6S1xuQYkqivfPHQG2wSuaM41ImUnAuI0Dre928/SKWwiDmAW0IEnfmDO8cbrD65UsqE1UXEW3uOZgczImK90BJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787564783; c=relaxed/simple;
	bh=/RGfyliEUANaO658nqDO6+n5k5sqCSVWjr4Ade1cf7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bdwqIDK1evKQu6IQ0+VSzwaF/DC2cJEs4I+hn6d4B3x7Qi2vQLL/TY3fjiyoBDYj5a+4NC3yoIlIeiocPzF0QQs5eDbPbiduqEu9G6MbsgQduPKFBP2cxob8fKEylkYGTN0K2LB0HHANciPF7+mlIsgjQOOdOUl4WT71cVq+ujk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvR8/Ayg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=efub97+C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvR8/Ayg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="efub97+C"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99kUg2572312
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jPkYMwpH3T9LJMuYXSpWS/SaNpZEHk1LI9FfTb8V1Uk=; b=kvR8/AygV9gO21y2
	I2R8CqukLcGRVPn8I8EPKndDknVeGi+gtNr3GYKYzJrzj7AUHcBKrRxgiqewy7vK
	h9hnbSxjYrnXCrZwRw9YMf9/u2XSLkH5hzwhpEQhXjEnEp9Uffzx/YO3Da9ETGQ5
	Ht5Ce6EKFDjAgk9rMhs5ztNKwVHFa8zu/V6eGHOw9Dp0pQGwbMA54qbbBMoJ9+T7
	MH9kJZrGmV10HAMfenQCxOnVVchza1CN/j6juESLcGz/YTEF39rol8hSbNtBhDt0
	UkE5noOHlgeEe5pc/wfnXRxW25YF2xWxpMmluI4SWmCwBJfnrpRXFnnOJdv7dBxb
	m8/17Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr1uve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:46:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930a312222dso20397785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 02:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787564766; x=1788169566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jPkYMwpH3T9LJMuYXSpWS/SaNpZEHk1LI9FfTb8V1Uk=;
        b=efub97+CpVsxwKMZy0dlyDtABIJod4YVEHM1TprbHjNIYsDyhx5P90iBHmk/AL54IK
         ewzSnu0TS0vhmIV0w3cx1tSTjOCkEw6EBGz/M4pHE7xBFtDY6GVdjJ5VNPxQrg1ZffOZ
         TVfG87SzJteRUQShiaL4NFfxDcnU70+WPJmsFQUIkqh3z6z2sqy95qlrligLalfozjRv
         EaKNJqzjKi61En8grCiniPvjw0amu5+72SPQIyP0q9Pttp4meWl1olEJSZfPocY62Eku
         E5gPP2ctcwJikUR9d/yrIZi3bfW7XyJDpNPejuk3Q1hykiZAHZAjW/+yqeC9ZJkt0xEI
         oLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787564766; x=1788169566;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPkYMwpH3T9LJMuYXSpWS/SaNpZEHk1LI9FfTb8V1Uk=;
        b=hYV7BD4Y3e6Y6cUCN+124BEXdcJyrGKQ/kjDbe3t4G/ir9+rVJaldnfrhSGtAa6qyd
         vT4iv6DLailbOMoQVJUyMkdFKPPuQwZ2lSKFEz7WYbRIYNEgrtkBMQOzJrAddVmel1Vn
         E7bOCa6RJGaO06qpjGfoL2uoRsgqxbKuueRR/EA5kVj4dFQ473Ggs1qRrU71mKj5JZq1
         peqFfj05F/yYhrfdzYHaBiOYb84Omrfa5tgv7R5lWIbZiNYXBr+CVLsJqUOueOqZFEww
         Uom7lyjkzl5cF0qYyzlT/V1o+KOVN9kfLtOlwbEZjth2Fz6xkBOJV+F5N2EH7zpw5gUt
         lAAA==
X-Forwarded-Encrypted: i=1; AHgh+Rqzv+lPt4Ew6VXj2tebfJVsKag20SIxA6/JwQHEM/uTivo80LBqcybRZWomp/dcn55nDI9S/6jsU2FlDBwT@vger.kernel.org
X-Gm-Message-State: AFuF++mSlV1lLnhcKLBL3AtOEwpOqxnFZuG996iPGCOW8Cq3mOKPMiAw
	Xt+nLPPZeJf3KscDCGOV9aQ+oUK3sUllIljAJDs/nClNMldvwLLW219rMwCVWyqGV3ZBaNZTIsg
	hY+ZzTMJd6bWHYNb5psoWNA3JVlcp2j4UVPcT2xtiUWaa8JdPsQ9mNIhw+nVBeNv8NuYm
X-Gm-Gg: AR+sD11nL29Sp/EHC60kEsWgp865c4B1yo+Cv82+zEm2s6ixTnMt/uqQzSWohFBk8og
	FeoYZT3N4fcN8xFy5ATjTLAmMnIBko6l5VaMRvf4DNo5R9eLfhjJb3nUi/mv9m6l3gVCvqlZYD+
	YSC5Zc9ve1M+aph17yANwVVCdjzGAqd1X9ngBHkn/QkRKs+FN7Fi7+po+Jml3GzTJXk6iUyF91O
	VhuBn+jKFTFK1mE1Kt/lBn/vkz1pDLcX4fTT+HY26SmODcd8sr9kUc9Mlk8JSDVDkIB4m5we81I
	fXMQ0nML+5yHwX6UHaKTpGtP/mZdXjFjpbGLk5CXoArqLvL9iL6/iV3Cj6V+YWHwHCYftVLUe9n
	s3v0mjGiIbpGv+SYUaZXbXCDE
X-Received: by 2002:a05:620a:4728:b0:934:95d9:85fe with SMTP id af79cd13be357-9373957a356mr1703824385a.3.1787564765811;
        Mon, 24 Aug 2026 02:46:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4728:b0:934:95d9:85fe with SMTP id af79cd13be357-9373957a356mr1703820785a.3.1787564765402;
        Mon, 24 Aug 2026 02:46:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966fa8aasm1256229366b.34.2026.08.24.02.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:46:04 -0700 (PDT)
Message-ID: <2aa0e4b8-c22d-4dd9-bd05-00bcf9cbe736@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:46:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony
 IMX576 front camera support
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
        sakari.ailus@linux.intel.com
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Tarang Raval <tarang.raval@siliconsignals.io>,
        Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
        Kate Hsuan <hpa@redhat.com>, Xiaolei Wang <xiaolei.wang@windriver.com>,
        Walter Werner Schneider <contact@schnwalter.eu>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Mehdi Djait <mehdi.djait@linux.intel.com>,
        Miguel Vadillo <miguel.vadillo@intel.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260806120216.24145-1-himanshu.bhavani@siliconsignals.io>
 <20260806120216.24145-4-himanshu.bhavani@siliconsignals.io>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260806120216.24145-4-himanshu.bhavani@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4NCBTYWx0ZWRfX6RkQyzvVffZl
 tiqcdEYk+SzAeAaGoaZnEB2bYfauwpyAcNLVKe3WF0NOw+TwUZnfK61lhqYyDkTV91sUPNfZ8vA
 G99U961B7pi5Yl0wihqYsO8BwDHl5B8IrHZVFJYcMbmFM0lDuoRmF+KPr5yE1AP60LvxkIOqc8l
 udRdV8pDSEdA27sC89lC/e45+Vei10h8yNjWi56/UbXGlZ/2qyVCMPVZh0wAzFDW/SReSDpYXFL
 t9Wut2aU71ZzQD8d4YtHNxqdkJn56KgrLYlLkc95E0NDv8ynA1L7kn5DiNLbAspMt/ZxxXlYJcq
 PFK/gtWYQMff4kxmJjnuno4o4K4oBm1IlXxEBMhNE5po4IEKLGpWBsjpQ7huR6TgnFrgUDB9iJh
 IIYtStfEHV6zffyDoLuu4q4s9Mv0d9+JjPz0ijnxIe0SfFxZrUhP3TOPpwjDd3VSHSA8q0UPAex
 vuSgnO5/UlPUSDbIF4w==
X-Proofpoint-GUID: 1UuYDXL6aMBNM-bQmoKnbkWqMe9neFaP
X-Proofpoint-ORIG-GUID: 1UuYDXL6aMBNM-bQmoKnbkWqMe9neFaP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4NCBTYWx0ZWRfX/V6DwJbWw0TN
 YoMtAvXZxXi4DQpYYRhY2rpfTutFCbi4FcEaeshPYAm6v/8o08lCaNh8q8IWCv9+EAaZhfZAQIf
 7y7PFtrcFFh3ERAKWXHWfj7mopnGMwg=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8c12de cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_fYl8KkWePwGJAbRzmcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240084

On 8/6/26 2:02 PM, Himanshu Bhavani wrote:
> From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> 
> Add device tree support for the Sony IMX576 front camera
> sensor and connect it to CAMSS via CSIPHY3.
> 
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
