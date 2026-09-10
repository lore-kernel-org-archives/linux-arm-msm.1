Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33433515E9
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 01:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789004240; cv=none; b=bXHmX/RaGeLOzX9lvMCfTGy5KScioZSHvQxQIVvrd+WZnsO1kdodE3ag/NeO/Apr3ZntR3AmQviGVO7wzRdvZOjujZdtF36pQSLlak0WmZATtTyzSKkA2Rvp6l5yclwUJjNGs1schMXbq/SOOgP3pMLBlEPF32G0ulnkDfO+XcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789004240; c=relaxed/simple;
	bh=NQgzUm2oapDD9XOauvQ7sAF3oBMmE2JcTiMHT0AxIWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NqozucwQeN3m6foCx2vUDhcXI8TeUnegeboUn2adFo2dZVZS6sb23ri8990tzNSH6UAyovH10JW/BcBL1+g62jpfU2vHxWmW7sKSJQYqFx2vUdA3ag/e8O0W19nSfhpmV8Ct8dNh8yDkKhVZterQUAe13+RLNoSrdVd55M5Wlu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X9qqchTF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cQ7RS0tP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X9qqchTF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cQ7RS0tP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689MA8m83431945
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 01:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U5296QULjbatYMz6kpvnqDY9ew8mUlm8s2jfQjulqY4=; b=X9qqchTFThwZILnx
	WLAh78kMLrph0xponvvrQXZohS+3D67K0JIwO7Prm2SRLb+rC2F6A2119+ztrj1Q
	ylXqkSIyJjtEGMRcpN/Fai9Sw4BNaWtS+BKTh72cQw3UTb1Vl11vz+QcpTzggSX5
	t8j2DZg4jbOEC+6fkJ1NCCaGV7VT0f13EuJ64GrtWXi4LJfXyTUDg9zOegbUHJd5
	6Juf6VhvzQAha7gvkmrnqmtbOC3u+U13LTdOLYJtAMkBPMD+3uh8mNPkmSc7VJAK
	JD2j7Fl68ZmlOR0jGE0XkxDroabXxYEce/9lHUj9gqeDNM5p8Qe2lDNbb75EnwI7
	lWlNew==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg1hqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 01:37:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398ba5404d2so3406254a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 18:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789004237; x=1789609037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5296QULjbatYMz6kpvnqDY9ew8mUlm8s2jfQjulqY4=;
        b=cQ7RS0tPOl2PLFHHVXTd1FNNZ5GKsnr0Es2dAwOuRmkSwsbmA5JVl2/OEPsFYPXoNP
         vRtzzNRc7F3HUAzUy9CFEypqRFMFqfG/Iw8faZL6s3ICBrpTf9w8lDu5Ltm9mmsMKbdZ
         1+9BZAu9ltmy3VYZhPRBeyatijukAyld34YNldMFIIxO8Keokr/OyiIo4iyGRRtnt4vd
         wmlbrslyJVFfmeS+ftdNLBrNsJTuO2yqXHcKmGium3oezZ53FqKg1TtDAQPjUpIwV6Uf
         C8T4GYsdT6b1c+6+/iUvsQ0lSVa5RLRxaNNydXKHDEl/kmZF2IIxOrz7An0fb05yvvpc
         q28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789004237; x=1789609037;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5296QULjbatYMz6kpvnqDY9ew8mUlm8s2jfQjulqY4=;
        b=Y096MaMCx3L+c6p1/d3GJvv6VKxA3l64DrZf0+n6dt8xVEC2lXkv7YLRJpUv7jiC2W
         T8wyPVyNaRtltq+RqRJdduKFbQBHofAr4oKaVEdjFfi0GP3FGLQBi68SbG7aBkAZwrEC
         9hW9u8SVSOJ3qAHLbWUZgV+mAG9vZH/qf+4TDkdDaCmdvUHYT5flXzwuQSPfGx5J09wN
         E8nWuuewu5oJ76WuOJ58pdMfSQ4nrSWE7L0q19kHj0U2wKYftroxA6tLzfyFh+G85PU+
         B+wLvONL51heeNPAz96z6VvfEmC6mqwFGlW6u5zbEw5+lmfO8LmdPoAEAHyheW39tCZ0
         GGOA==
X-Gm-Message-State: AFuF++ke9ZFfl42+tT04eJFQt4Y0nXdZa96nGqiRcs1ASrrZyAeO3wpj
	DMzX6EHQoSdbyy5p28aZSbIWwdJk7rK+lBFvl5EiWN2ejJ18Y/ABmADYSx74WxOh8m3njBcvuf0
	QaKCqYsuigblBJCgiiHZoqNaAV/YiQqyz8hewqXVW8gH6DnXRwFyGuqgYRYb8Lwg8Io41
X-Gm-Gg: AYBFou2bn0lgm/UrJnKXA5weGnFArEzkEw585/G4ZUyHEmIvnFFXBKpnzLKGbi9e+KH
	lkUQmbM3mFNWc+a0yjrZ1xF8l9vjX6F60tIoXzpH9weGeCNUgbBVjdJdeDYv+2X/zu21lNgnj6U
	PUv/OIRAa+CDhGnohEHiMpekT/uHNl9zGhDgqhcGlIbnXoXspdn+v6ICtYzEN4AXdOKHMPpTkTY
	UL9Gu6rbcO79FrTLSYpfHHz0MY5rG30h5npCz28UuBHu7bQjRhxaX3if0LaGRC9rbJNiPjDEJYB
	zZaoGDO/zEYbhZ7CbYp/79J5ZHWnQZc4W110fTLY+MhW43KywiMyODa3WFqxpOAn5lB8cHLduKA
	SSRZvsSHi3sso3i6NDe6EuYfVM/q3Aw==
X-Received: by 2002:a17:90b:380a:b0:39b:2b10:d05c with SMTP id 98e67ed59e1d1-39d709e73a6mr5758513a91.5.1789004236765;
        Wed, 09 Sep 2026 18:37:16 -0700 (PDT)
X-Received: by 2002:a17:90b:380a:b0:39b:2b10:d05c with SMTP id 98e67ed59e1d1-39d709e73a6mr5758465a91.5.1789004236325;
        Wed, 09 Sep 2026 18:37:16 -0700 (PDT)
Received: from [192.168.1.132] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm52774345c88.12.2026.09.09.18.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 18:37:15 -0700 (PDT)
Message-ID: <2ea2d992-d14d-4b26-91f3-c36a87acf82a@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 18:37:14 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/8] usb: misc: qcom_eud: add role-based EUD control
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
 <20260831030147.1500616-7-elson.serrao@oss.qualcomm.com>
 <f23595ab-e0ef-40d8-998b-4cb0426ec166@oss.qualcomm.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <f23595ab-e0ef-40d8-998b-4cb0426ec166@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vu62kO2n c=1 sm=1 tr=0 ts=6aa209cd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=c3QgA-9rzyVlc7GNB-wA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: bnoVrMN-vCQUbXYiDuf0_e178yn8gBPy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAxNiBTYWx0ZWRfX5QcClZ7EPpwv
 kJtuVoMkf1p7jMD0T5wIWfeiEvLkge157ZNSUgNl7zTnqmC7h9czHiF/PVEZYUKa56CiM9/sOCh
 JVaJTzge5wmqFkoTf7gbMJgGbyTEZ+bA7CsPI2fpcmq6oP0VFr96jNRcxCSXJiFSVCActGeDGQM
 3SLwhYa78T2MOH3ShRqB21yoafSBdL2OSEogEktHZFJeo3j9Cm0vk9QmXWvbMAwhUZkBI4osbvJ
 U4EvgZAMbTNWLDa/mYDd7ZIQg8W8U+qIKEJ88HqFpH2kSf1iP6JuodEmuFZ0vn10GZVs3jv4ujz
 1E41j8UW80DyrhPggTYjjSBUTFL+WyBQnJ8J7cVsC35gesY4BlvnOW5w2XyulrrTNcZ4YnT5S2C
 ooZwelLpLawl2tUqMp/OsIzvUvYSG47ku0Tmfyhp5GwxPaODYiOMK0P7RzM60RbzZ547bqRTLP6
 +06TLZt7bQtq+dWAzHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAxNiBTYWx0ZWRfX+xdBkG9TE/hV
 SQE9WcPyhPr+ViqcLX9m9BsESfj+Bpq3yv/KPNM2yRPhVUaVhRCDi08n8cwbNNhGqFzy+ujax/0
 R5MpP/zbgAIwgD6XY1cK6ituCF+aA3Y=
X-Proofpoint-ORIG-GUID: bnoVrMN-vCQUbXYiDuf0_e178yn8gBPy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100016



On 9/1/2026 4:36 AM, Konrad Dybcio wrote:
> On 8/31/26 5:01 AM, Elson Serrao wrote:
>> EUD functions by presenting itself as a USB device to the host PC and is
>> therefore only applicable when the port operates in device role. Keeping
>> EUD enabled in other roles provides no benefit and unnecessarily keeps
>> the associated PHY resources enabled. Furthermore, enabling EUD in host
>> role can cause the USB controller to misbehave because the EUD hub
>> supports only a single upstream-facing port.
> 
> [...]
> 
>>  	struct eud_chip *chip = dev_get_drvdata(dev);
>> +	struct eud_path *path;
>>  	bool enable;
>>  	int ret;
>>  
>>  	if (kstrtobool(buf, &enable))
>>  		return -EINVAL;
>>  
>> +	guard(mutex)(&chip->state_lock);
> 
> GPT suggests port_store() should also take this lock.. I think that's
> a valid concern
> 
Thanks for the review, and apologies for the delayed response.

I'll address this as well as the other relevant feedback from Sashiko in v8.

Thanks,
Elson
