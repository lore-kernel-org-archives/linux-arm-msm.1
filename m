Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80DD43B4A8
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 15:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786549689; cv=none; b=OQB8Mqgx6Lqb3VxZJCdbRjqq6aYPwm7/xpsETTDYgFBQROPUdV+YX/zwbgZSouvTEfYMaBsMOonBPCpdCUm52jgTGq9BJN+wGmwoR8oQuSdQKLN9LXq8VFO9K/XQ4HcbZDzzOtKvql4kfnCi4GggSt1zhipSyYyfCFobLCOJnFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786549689; c=relaxed/simple;
	bh=zI3TNPPe6L8M7xlS1nDQbUrr8AfIzmyJ+pWobJL8pkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PFXX8NXF27tIw+TnZCi80/G0VQi0E50Ubd2cS5AA5FziKiUcAsDcL/j4y9uyeziJLYjghtTvrrVlW/PSTevSN7Yb/s5wZI391zlwFoYv6LBztcdeDW1TXpvsoM/hBAapHdkWJrI4uqu8GgnyYpy1pdBMhZGz7YPJrOQqRWMwzks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VAbBZY4E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BKIfoNpI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAbBZY4E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BKIfoNpI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDbmmZ3971657
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 15:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6eI30N4Qm5PW71y0No3cx03eQ8pMDtF1rEz5kRS8Gxc=; b=VAbBZY4E/j0w6E0j
	hjKUn8qJcZscS7lWuAx9OCuhh/GqXF3hXB6ImbrsomP5Nu3TIHqTYoHkhLarllxg
	PuaeZta3NKvvYqxqq9SpvjhfjQoD0+Nu7OwnwXimUeoJFpg3acv+y6ux5e2pbmJD
	4OdkazOg0ekTcpYgepq5O/82gqpGt2kgwKiQupJLvOl3CSR9IlG6aY+nJEKjGgaL
	KCJSb/kE2Ibi8B5YqkCYpRnWwA3RJBjCBWpz/eSed6mTCq8IL9nsqVafACcfs7nx
	S8mdXMD+tmXbRSkTIGu5YyjZeFZj5qmFEHg/E8KSNBdMUriNyiIWJWPlmVgsmdd8
	ATkLIA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0jgrjka9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 15:48:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cea6a46766so16778105ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 08:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786549686; x=1787154486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6eI30N4Qm5PW71y0No3cx03eQ8pMDtF1rEz5kRS8Gxc=;
        b=BKIfoNpIVIx3Se4idJqfPzcHxTciviSWthPsKyShyuJq16IKwcfznFKpY8OZL21x/H
         PiB/riaO9FV7C52uDf5Jyf2e/AyrT4aqiWtvAbhn7asiKWCOVrmwrVsrHeFZd+edMlOS
         /oVAOM9rkxjvocr7ybau9nXuHZQjtPiuAeVw7/5SYnAm6hCd/Oh48wDoG9mCZx4Tz/3d
         e2hzRLoyG8zWHlkecoXm/GWUw/y8WvpQSNPov+t5AcqJ9X7HPBBL6tNG7DlVlsPGkZCk
         HHylU6DACMUgxAAE5bZA/1rW58FTe81jq6N2rORZE7D5qQYIXubhsptZAP9+nEjs53DM
         tC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786549686; x=1787154486;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6eI30N4Qm5PW71y0No3cx03eQ8pMDtF1rEz5kRS8Gxc=;
        b=lpyzhQNr1LRo5w2E3mZRCz12Fc5tt5Jj7MM2G2zSeKgPXTOVuk8S8evKU6fgltW0AZ
         UT3lBR3YcrJtAxcIp8vh0p12SVb7Lk2Ih+PTp9DiTxueBmZ2RhLYr4aUQ+fTV2Nukfsn
         cvfkL2jlCsnWNz4QxEaU0YJan4dERawm9/cw1KbVDfwiyyjGJiqIwh/r0MuoMH+i7WeA
         sfO6np50ookWFuDlFfo404fulZDUWoxLeiA3FQP5Rp+aqgFBcIpY6eMFLEEp1ut4IDHE
         A60ajDwvzjLqgKLImMc182DHfzCjLf+D1JDFfjJJ/qr35lmmECkcKgk2j6XsyeoBllRm
         vNkg==
X-Forwarded-Encrypted: i=1; AHgh+RrlYSg1Vs7prc3cNGJba24ywHrSa63Wu7trdtXNkuRSxhmXBiLMASssUk8fkseMVEYoTE5zh1cnIMfEiTBn@vger.kernel.org
X-Gm-Message-State: AOJu0YxLNDCEjU0RMz8H1sLqjLZkd6qekOhFEIxeyBdnDY45zDeJOnRP
	RX/A1qzzsjb/3bUem0/rwegGPERO0EBqXv8CZTnwB9IwGnDijuZR1qNrRm6o/IK9SXNPdg5p/kH
	fDlgUyWLZISUuSjDeUmfT9/zxao+7Fsu4mmHSEUCqJSMYW4CBVpXRVxWwb7W08YygbQe+
X-Gm-Gg: AR+sD10CGgajNA5UUzH8UZPX4snYWFh1hb5VGNaMTzb40MwTIOE7aI+2EY9KTbVAX/p
	qEgqFUiRD1oqqPjq/RvUdDbfTQ9ubkgIs4EP+k3I/7MnGpU+/R1UF2jqwzTRfP8JJ26qdFm2J6t
	0QmMoidPnsT1mPeUPMq0WkQYjCYpydcScBNjefJI6/pf0SvkFUsrEkZnv+kP8l0q2sVTiAMcEBA
	iaeK2Ac/tMRpl5rbFjfEQ5RpyMPh+6fCzj0ZwB16R+R2pXrqSKQc6yHai7gA1Xjp+eVAlc4xOVt
	v4X0uX4+d8kVm26hMEc/iYzOMxR5rDqSyY2Wg2RgZ+xJhBkY0Agdn3/ZIDoZLHMIYthuJ+q3o1a
	kjdJn3WWtEfEPM6CoXOxx0eyfm+h6
X-Received: by 2002:a17:902:fc4d:b0:2c0:db23:4c4 with SMTP id d9443c01a7336-2d34567e628mr70678295ad.16.1786549685456;
        Wed, 12 Aug 2026 08:48:05 -0700 (PDT)
X-Received: by 2002:a17:902:fc4d:b0:2c0:db23:4c4 with SMTP id d9443c01a7336-2d34567e628mr70677715ad.16.1786549684965;
        Wed, 12 Aug 2026 08:48:04 -0700 (PDT)
Received: from [192.168.29.179] ([49.43.225.2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf6d7a3c7sm18740573eec.29.2026.08.12.08.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 08:48:04 -0700 (PDT)
Message-ID: <71b867fb-f7fc-4d82-a02b-3d0e7874a6e3@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 21:17:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm2290: Hook up MPM
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
References: <20231215-topic-mpm_dt-v1-0-c6636fc75ce3@linaro.org>
 <CGME20260709114143eucas1p18463122323bdeae8e63b1d13cd626b55@eucas1p1.samsung.com>
 <20231215-topic-mpm_dt-v1-3-c6636fc75ce3@linaro.org>
 <dadff7a9-bf04-49fb-8c55-5605e99be7fc@samsung.com>
 <CAPx+jO9d1qH12mxg-n1rkbp6Xd__sdrSMeoc7CPELE+jgxRYHA@mail.gmail.com>
 <e83dffd9-e54f-45a8-b997-e84b5beead71@oss.qualcomm.com>
 <b434e198-2778-4dd6-8896-f7f54bc9b8e2@samsung.com>
 <ff6f8e27-5489-4d63-afeb-a38881d717d0@oss.qualcomm.com>
 <869727ae-e4b9-419a-98e2-798c1aec5223@samsung.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <869727ae-e4b9-419a-98e2-798c1aec5223@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEyOCBTYWx0ZWRfXzGhu1kBrNkng
 vc8e3sOc5AS75iWxQFDX15G/blaLtBr+PL+5sdEfc4zHYVqacxx0NE+T7aTAA0qzE0S+UFLaJA9
 25WJJ4b4QvDIpk3aoZhokgiP9twOEHpvqMsf7rFBlimQN/JBsg+wujxyrbHqic+omTAbfVgdxhM
 km9ZpvX27sKm0Fb+0LjrWOSNx23Aa/KXRIlKm155bliA118rWNzl7HyWPbrkOVui60GuW11To4F
 U5r8DbV26EPiDmBS7r17d0uiMMceLGB7wDLcKyS/8AZ7GUXPeA3ppS1kGoi3Kp4QaiO1zjMDmLK
 1fjk9IH8SPoF5i9OJwfMjmYl8PRgs7d35zUMgCvbBZnPLpB4Mwg2wpbXpqCmBj0sI4+Dgby13v3
 kFyOvmBlnGzBEgZpDv2tK/jp+lRQu2pURH3HzYknoWCSsYu+m7ZMWz6sImfTofrphhnWHee6NlR
 pP4n/xXkQe9XmmErbAQ==
X-Proofpoint-ORIG-GUID: fWnak3XzBQXr_CA09A_Yay9NTk51jdzn
X-Authority-Analysis: v=2.4 cv=TNJ1jVla c=1 sm=1 tr=0 ts=6a7c95b6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ltT/yu60HBk4Fd3MSdKqqg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=eRr2Iam4zZPITqxNHqkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: fWnak3XzBQXr_CA09A_Yay9NTk51jdzn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEyOCBTYWx0ZWRfX+dPzH2F7bBaI
 jqPain30Nue6cjDnH+co7Sf8XuH8/A37VZ6LHtpbsb6zsh3g7VZI9C2x0hwDz/DXC4uitC27EzA
 k0H/V1AuSQx2ICJIIEnTk97w0gYLhko=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120128



On 7/16/2026 2:06 PM, Marek Szyprowski wrote:
> On 15.07.2026 14:37, Maulik Shah (mkshah) wrote:
>> On 7/15/2026 11:44 AM, Marek Szyprowski wrote:
>>> On 14.07.2026 15:29, Maulik Shah (mkshah) wrote:

[...]

>>
>> Agatti device tree change in the series [2] only removed power-domain-cells# but did not add power-domains = <&cluster_pd>;
>> with the reason that qrb2210-rb1.dts had deleted "cluster_pd" however qrb2210-arduino-imola.dts still have it.
>>
>> so below change on top of [1] series would avoid the BUG from mpm_cpu_pm_callback().
> 
> This change moves the 'invalid wait context' warning from boot time to system suspend/resume path (although the system suspend/resume is and was broken on UnoQ at least with current next with and without the patchset from this thread):

I am working on this to fix this warning for system suspend/resume path as well as regular cpu/cluster idle path, will update soon.

Thanks,
Maulik


