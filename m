Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739B84A0F0C
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 13:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530390; cv=none; b=fS90NTaxSJ5jJ3dbEiVV54hJAKsIwBH1BJwiLBXnC1RAr25de0arSQ/GqyNe0YoNkdCynBKFKzWiu0PsLYhsvcfCl4neXQQ49ZD58kZ6YRbwJK/p6VQhSt8XLJgj/4e20yEtSRRXQVm+sgqscB7PsLgGTMpvJw7kmdKblW1cH3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530390; c=relaxed/simple;
	bh=rOqwJWlnCyLtEeUosqm01QDB1wq0VG+lLC+a/zLyXaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=slh9bfmQ9qZ/34EUpjDu35Sg0uq+AX6MkUtdfz5ua8iDG5TXEFvvSzFxe3Y7bQcFRKXiBjMwyaUrmphfbU7wbaArZK5ILOmjiWAeULDWSnBT2DWIV/tOcGLfQ0EFPbARTbMd5Rjt8L35zaZNDgO2CITCkMKHt0TFw4lDmS91cnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fY4xsw7H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIS1yS46; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fY4xsw7H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CIS1yS46"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684DgZ6r3196284
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 13:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jxs2oaGwNjggxYlTmrfnys1Rey8M2EkDDSrCRn43Mpc=; b=fY4xsw7HwR9/FMO3
	jOCQfqol95XN0fLUfd+N7N9h9PW9lOFV19GbCzojuA+I13RdKhzgtKmrd7n8dszf
	prafltu/5WW2i4NjouPgcSrgFodABKV5nC952ErfIgC43A9skmCRrCs5FOWzuWKz
	/HnqL4OULbe00I1oaZuoG9BpYT+Y1wQVIQBgKsE2AZDdPJ1usaoCjyFxPSWtwzmn
	KwjyRAJcfQsNFRuwcbQyCK0RuFnOsLqMyw3eg9yw9D3soWAOporGKiIyX8pCTcwq
	jjGbBEkZdiDzedjEcCrUG2ZeLiYaH31aRza3C6znRn8fK3ajtjc3A1OZUVX+R8XD
	nyKfwg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfk922hjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 13:59:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso2488359a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 06:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788530387; x=1789135187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jxs2oaGwNjggxYlTmrfnys1Rey8M2EkDDSrCRn43Mpc=;
        b=CIS1yS46Cw/iBbRbmNyfnLEj6CTYZ3PJ0U0QEtQKAuC0IIM53V5Rq1NTSi0LcfYwDT
         jSXBUWw5Hd4VrmLSYiw4Yy7J97Q1XCKkPEQC+UilDt6XO69SPJuJnpBabHkGeJpfDaih
         a2wF9uQPP5D9U2K1FWns9y/wnhk0z3QUBsTnh093bsLTr2OK052x8goi3rrXZEPuy9J1
         9nNrpRpVhrQrt0RsI3wpUDY2v42xzSTuIEdScOJB4zZJNW6XlAh72oWkQ6ctFjA+o1AK
         R+3XfF1/PmswsvLaM4heW3F/X7WpvBw9iBOH+Vj59ZfM8vJ1DjXiSAqVOpww56GEUNVv
         +l+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788530387; x=1789135187;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jxs2oaGwNjggxYlTmrfnys1Rey8M2EkDDSrCRn43Mpc=;
        b=m2uepuevHPBI5IMtJ+yvmP3E+FpCMSDO1Agg5HvcMdPsh1y/ddf8GiTdOKIc4s0cT6
         TF8Pk6p8tJlwleA84VvWCoDtdtQEWO64OrTtWs6Msu+/RfIS+7nFnEBQgWOZ+OZAAgM2
         42O+W0QAHIvJs3CzZQLJyEkXdsdQSxN32cLPk/9FJLIJ1iYGW48gH0OtNOQxUshm/mLx
         D+XB2nLvnWXqnK8L3ifPdNRm0eoHRtoEZwcuaVwf85m3C7UhKsq7Zys80o7ntqFQN6dp
         t7d9TiyTrQ11t3DWUuwqT80QtMOVWjF/zlQRdSWlLf9EdpvBrQQd6u9W9c+IIhQsP1vi
         I/Qg==
X-Forwarded-Encrypted: i=1; AKwUvBx2r1i+jHSZGOIeWM4Uc+kbDl03t4TcY4qi3My7PYUjl+Z6MQW5JarVac/cBfnJatV3YSvtCf7itnYm7+xT@vger.kernel.org
X-Gm-Message-State: AFuF++mvKKRcmAKE8FVH8p9OvHC2lAyvqsBpDwYepbq3QyIJIYwJPkL5
	hgVzvz1wzO1dHyJl0A5wFJ37+2CB+7jKOiir9TOnbUpENhf0IyaWuWDu3rnYDHoEZzV0iRHoigq
	V31HXBRLOZrcfpWkE0M8ao0C4AhVDafYS1MDdT3jiSuiNjL32XEVngJppKCYF67edax6u
X-Gm-Gg: AYBFou1shI550xQLsclkKgMO9q+3/T8Z6yaGUBvjxtAh/EwnnLWQz0jtgFP5zxcRi5o
	udVfcNEBDORZpuW55TBHLyJhpWhG9mHBaZrDS+cDLUu0vft4TTn/hBX7gqvvcR2LV2R6BOvuBgv
	q0QeQ1zZQDnwpIfOvm2a8QGyPGvjkNPo6qKVDAOwKKzDio8ZE6g5b0f8DO4UywOzRGY+ObYcQUY
	Vi9xyryDCsycmroHrycoKAdswkZZX/iDB8Vn/hlhR+JhQli1R+F/qQ7tE0VGWhjxWICeRAH0NA3
	ceot9rhvReNG3KvJc1phd32kJtytGQz49z8rvK0tWwTax5Sm7e+maXPKkOnvzIdIrLMRnYZLbCN
	lMYQsR0EbJXhmhas6pJuoygCB84Hja/oXVZ8=
X-Received: by 2002:a17:90b:4b90:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-39b07f2f31fmr14673329a91.6.1788530387580;
        Fri, 04 Sep 2026 06:59:47 -0700 (PDT)
X-Received: by 2002:a17:90b:4b90:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-39b07f2f31fmr14673267a91.6.1788530387149;
        Fri, 04 Sep 2026 06:59:47 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.235.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm10478642eec.16.2026.09.04.06.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:59:46 -0700 (PDT)
Message-ID: <8968c292-0613-4420-82f9-2e3fbf30d81e@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 19:29:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 00/12] Implement PSCI reboot mode driver for PSCI
 resets
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>, Lee Jones <lee@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260903160401.GV2133376@google.com>
 <CAPx+jO9Hi2R_UnCEhsXLwf74c3RTb+RodaJ6SOVXbQX_eHt++A@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAPx+jO9Hi2R_UnCEhsXLwf74c3RTb+RodaJ6SOVXbQX_eHt++A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDEyNyBTYWx0ZWRfX++ZMHlhI07el
 O4nc5W42kJgf9JRWrMXRlQgT4lKAHqh/l/JCGKCAXx0OgoDQ8Vpvlxh+s7ilo7qU3gMwz2qHQ8v
 zSiSNcWjO2nyJXMIhIZt/xAylg2SmiC7Ewoe8lNM7ZqG+WKE7EAQOuWMrFUHYI/L837UGafjJQT
 5u12nHFom7Ro4FqbMVNNHxG0plX55EKc+9xnGFa2mxQxeyGpgb+c8G3bINlZBqHjBJ1mA7WO4Mz
 vtmASnuVVZ4NV2ACfIGJUFPQrEZmDu0ibKfj+i8byOPiB+vCXuPbOLegqT1raZeuqxrkbTYTUoc
 6JrlPnXOTLMmzIX/JUpU3kuNN6oM63ITB6GME7WWZid9QINzG2GQDzVx3cQPuetOA7M1BmcuImo
 nU9EUd7h5DSITSN6rZtyntm91X/Pevc0Ld0I3O+ZzZSjfjcsjf+Iy2IgWiLdslmjPW+6zLXBsUm
 vjSiQZkLDyy4Ggqd9IQ==
X-Authority-Analysis: v=2.4 cv=Oc2oyBTY c=1 sm=1 tr=0 ts=6a9aced4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=KLk5RGObiDQBJbYytlEIzQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=KpQgwA5mMx-DUpL1sGUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Ok--fRNzz_bzaMckg_s4MkCkb9jJn8zw
X-Proofpoint-GUID: Ok--fRNzz_bzaMckg_s4MkCkb9jJn8zw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDEyNyBTYWx0ZWRfXxc51mM9kmXln
 UGamo0B5ET1o0OfEZLtTr94Nl+j8E5w7x658MnlyJOUzxmY2v/vH36jUJsfcDhb0PtUu3ILsUnP
 GlNAUwpjszAP+bf6/B3ASyxDhM+s0mI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040127



On 9/4/2026 12:47 PM, Ulf Hansson wrote:
> On Thu, Sep 3, 2026 at 6:04 PM Lee Jones <lee@kernel.org> wrote:
>>
>> On Mon, 03 Aug 2026, Shivendra Pratap wrote:
>>
>>> Userspace should be able to initiate device reboots using the various
>>> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
>>> patch series introduces psci-reboot-mode driver that will induce
>>> command-based resets to psci driver for executing the device reset.
>>
>> The more I read through this submission, the more convinced I get that
>> it does not belong in MFD.  This is a potentially nice "architectural
>> workaround" if it a) didn't break some of MFD's fundamental "real
>> devices only" rules, of which cpuidle and reboot-mode certainly are not
>> and b) didn't require a massive expansion of what the MFD core is
>> designed to do.  I am more that a little uncomfortable with the 150
>> lines being added to MFD core support this workaround.
>>
>> My best suggestion so far would be to base these changes inside
>> drivers/firmware/psci and use the aux bus to communicate with the
>> various components.
> 
> We had some off list discussions about this as well and it seems like
> we are in agreement. What you are suggesting makes perfect sense to
> me.

Thanks for reviews. I will move this to Aux and re-post.

thanks,
Shivendra
