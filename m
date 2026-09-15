Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E40474276
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 13:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478558; cv=none; b=BULc8dvqSS4UWC7OXx8wjL1H/1DYe9s/UoaljNX56Oio5Yh+LVHDmieuly1u6taD0aSpBk5jjIrIPBz2ycKRi8u13q9rO6FSR5HPXBzYJR3KS6icncKwG4HyKlLSgnFARd9w7vI5L2b/Kz+lGRZK2lx/teOhNEb5y5L1+TEywVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478558; c=relaxed/simple;
	bh=dklDLrl26zvKbWrn7A8Q7hFxl/3kWBj90sfvCieS/0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hyx9PAoKawPtFhDtU/sQwMQ6qRyg1zFYXAoJo+BdQIfI2zYtH7FrgZIIYFiNTIfm9eErWYrwWHL6JXaxxFfr7Otw336DLLeYsrt9+aVPW6lal1jUutwdOrkG+0Gx0zWHBX3xENZ23GCEuGnFOFpU3MQrR2/syR8zVPCGFjz5IW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mUeic+PW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vq5VDe3T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mUeic+PW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vq5VDe3T"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FCxn6Q4004782
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 13:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DKYp6xa3UjEsg++N6yWzjapYoyJmdad+ECxR/j4NFCA=; b=mUeic+PW/BCD6qk/
	1CtlYH+LQABg56I2V3VXh/mnCpW2k2S9Pev/EroDmm2IWjIhOkRiciunxPY4lELU
	DG/lewc1ORsOKNyIyxotbXHCFIiBAdyW+++YhLUNCHVBJkLPLGp9vxokZMKw+Z+G
	b3Ia0FHUZvIKJV7pNC2WPj/sPjlUfVOYr1dHNE7Q8xrD1ekoMDSavT9apRtuLvKJ
	52/jJan38DydU7WmAWsFbLiZrz21UwAZvVmZs5i6iHU5LSLmp/US3Mrvhrr4OlgS
	UL4gDlBu0IDibRpyd79T8M7RoKlrR8I0f8/H3h/2hUGyNwHCu21p5q0EKdthBwJZ
	PEYTxw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3xtrygd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 13:22:35 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8914aeaa16aso2455487b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 06:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789478555; x=1790083355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKYp6xa3UjEsg++N6yWzjapYoyJmdad+ECxR/j4NFCA=;
        b=Vq5VDe3TJ+cXfVJH8rSURaXboOh8Gcp+PwWI0hQ15HRBfZdelevMvyJTiMxYH9Bpif
         dJvZpQ0ujxoxLmKclEaBcOzzpnYBtkoqM1nGHSgqsAj7ZQMJrytWTzAoeQVDj7Yyq4E1
         QCiHwS+2/TE1Kz5KCY++xiidHXUuaAihwpaDlRRVisLgXIklmYjzj4yPUvYkSEao2k4p
         T1gS4r8lY/Q7XOtVof8CtYyMogCPa11762ZmhWsMVY2NO2HvxZ+oifpoX1b5lkXuWi8y
         PmjRVk+LjPgu/N02lLz/k4MwUcgSnWs5mfVwX3B3ntxTB2rPzM6N6nWX+S85GEUeeRoo
         rIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478555; x=1790083355;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKYp6xa3UjEsg++N6yWzjapYoyJmdad+ECxR/j4NFCA=;
        b=hdfRE0/s8Zg61a+trfQdjH7YODteASkjPQabd5KfQ3lFlo6vGn3ZIOydMEb1P1y9l4
         KZAoBjZzauxgHffIL/D2UP2AKGtVorWYuIlJL0m5YldcDI9YPG5xHnSi0QLto0r1zgcZ
         VEBLRiBbkix6kf77vJaZy5fwBfaZDx2av0dyDENiDGPW2n/Ppb6BkPbJJY4EAeUIMMNx
         1CP8SGP2hA1fmnlzbmdUCio31wXt9XsMwKCKgi4ULIr36oWGF22KhoZT8zQSFtcUobCD
         5/zwKIuRXJCMr+ghPDlTBtS9iJIzdHdJ4QVyW0xFyCW1ARWZpso1Ruww7gkjfcFKFQY0
         k+XA==
X-Forwarded-Encrypted: i=1; AKwUvByntmND30eJ/gHabkQWdCLLLyUzdIcTolwzhHjSfYjWH+HuSGk1YDFBj6JUdsyi8Hm9IWcGiRvXbma89qp7@vger.kernel.org
X-Gm-Message-State: AFuF++n3EtZByCewVhN/vzPU4o8WDaYZU7G5jV7cd8dUiIK0CwBbOmy3
	C7g1XHNm+hzAsPstHSFLgMrLt3cYTs0IlO7x8xIZko6b6k7kmbcjp0FAvVPnuPsXgOec9KCHq5R
	qqDiorwKbeILGcUTPIZ7nWLRDlF7y+fPRAvvTp47DUBWSaWaTBHIdkTle3Jxgm5Fpk04U
X-Gm-Gg: AYBFou1dKVhs2StFMY/o5PPdVojzIpOXfNv7NBOQtdhfLlZpUgnqnjo6Cb1mDSdHGW2
	VIltBeMCikXA7eyYaRCnHZ4X7eVAj613qUgOaIuI4q5QSAvfqyJRzd8PEKTWFg64F0L7dQFK7Py
	DRkDiR97x2RRlE6kNA+LWY96lzNXpSBkUdIorCVNsG2BZPj+1F9HzBD0ncNHUP4uCAIThWwCSQ8
	PKmvu136mQvYmCr/GVfk7h1SzlB0AsYo8dKgNfldExcgaui2elxz+BQWBoM8Q14LSrcsjcWjooq
	wIm7LiSjlp+Knz0OyA8VHmWn+bpmepeBhcJcsm0RwbCgm4rO8WAKva/YGz6G58iOQNyG/4mfqGi
	trkIv+BVUyeH1sVIC6LPdQ4hW2KkC0PCAJTHfkeE=
X-Received: by 2002:a05:690c:9990:b0:879:44a6:1076 with SMTP id 00721157ae682-88d21b31e93mr21603637b3.32.1789478554595;
        Tue, 15 Sep 2026 06:22:34 -0700 (PDT)
X-Received: by 2002:a05:690c:9990:b0:879:44a6:1076 with SMTP id 00721157ae682-88d21b31e93mr21603327b3.32.1789478554014;
        Tue, 15 Sep 2026 06:22:34 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939fd0ebaf6sm1014424385a.35.2026.09.15.06.22.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 06:22:33 -0700 (PDT)
Message-ID: <8d849a0e-c83c-469d-9e36-442e0fb29c84@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 18:52:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] arm64: dts: qcom: shikra: Enable audio on EVK
 boards
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <feee7ac3-f5e5-4677-b44d-34be0c784110@sirena.org.uk>
 <0401ba5b-c308-4e54-9f6f-58005cd19a0e@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <0401ba5b-c308-4e54-9f6f-58005cd19a0e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0g3kbU9278sEQGpE0OZhxZy8Ldd7cTb6
X-Proofpoint-GUID: 0g3kbU9278sEQGpE0OZhxZy8Ldd7cTb6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE5NCBTYWx0ZWRfX7TO47g/eC/C2
 Mi1W4kZKKRE/cBeASzUiuok8psCpPxZzNzwAdqSxoxGHs0lRJUP2ox3EWHiVFg2AhoeZzMpdj7z
 oG9qaoZfU5KWKXFODCZ+mdiMseML2sA=
X-Authority-Analysis: v=2.4 cv=As97T+9P c=1 sm=1 tr=0 ts=6aa9469b cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=CwqCskAXZNsc2T-QvLAA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE5NCBTYWx0ZWRfXzg7sPi0KUr9j
 k8C+NObyXSAEnAMUn2Hh1A8m0hhZNzyq9mM650DxeFvkkMm/uH0+oZcHUIjfMuliQKhwo6+RnOw
 EtLeh99488qbFipmSzm+HhwuzRAnQU9Xh+kL2SYethDrwCJqA5EZg8XresOfzwVpzrIbEd9aFJM
 Ih3mQwGhTOu0kB0bDB9PEw2Mt0YxgAfmdt9YWynX18s6ZrAAwNGEVI4v9h8prDFB2w6HHKI8TgP
 ppSuSSbuZR9I1kMfpBRmwwvF06Cil5hoAz3FT4sIxPGJi4tZaDFJ/k9r4nRglaoMo5SjjkqSkH8
 8aycKUlEm1X7PCtZnWvFIJu+m5/18na7LOs52mGYxgMDPkGE1j3693Sq5hx3x6uRkbESLieYLj9
 F9u+Pwbb4NneAC3K+3kEWLv0zF1oq3wrcrFTrmkCXJGvuLFR0dFTe5+Pz6cso4WvPJdeNqDQkM1
 L+9cS1YM5qZ67x2AE/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150194



On 9/11/2026 7:48 PM, Konrad Dybcio wrote:
> On 9/11/26 4:05 PM, Mark Brown wrote:
>> On Fri, Sep 11, 2026 at 04:46:33AM +0530, Mohammad Rafi Shaik wrote:
>>> This series enables the Shikra audio path on EVK targets by adding the QAIF
>>> CPU endpoint, GPR/APM/PRM services, SoundWire and LPASS macro nodes, and
>>> board-level sound card wiring for CQM, CQS and IQS variants.
>>
>>> base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
>>> prerequisite-patch-id: a056f645f45682f1008b321f5e639505f22bb979
>>> prerequisite-patch-id: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
>>> prerequisite-patch-id: 32a1efe2e364ee15c466f496b1ff3128e5326c66
>>> prerequisite-patch-id: 1ddc51582586120795d86a2ff9f0aef20c0e891e
>>> prerequisite-patch-id: 1e68cced9250cf9fdfbb8cdc27ee8ec47ada4a87
>>> prerequisite-patch-id: 99245529321cadedd30d9e38845b53dba3725de8
>>
>> As I've said before could Qualcomm in general *please* stop sending me
>> things that don't apply.
> 
> Adding to this concern,
> 
> prerequisite-patch-id: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
> 
> happens to be "Add linux-next specific files for 20260626"..
> 
> while the base-commit is next-20260910
> 

Sorry about this. will fix this from my end.

Best regards,

Rafi.



> Konrad

