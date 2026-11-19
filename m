Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095262;
	b=I0m9Gm+6ZWBjNlo6I5fknM+1RuErkOHEtyIqeU2+GoLJ8Yidqo45/3xItCj4chQ/rETs
	 btJy3lfH+Om+WDbWUBOh4AmUEapUll1GyK8qQQxzxYk5JYUO4/EEQ5sPsSmfNTlQyI+Jc
	 kWYierFKK+LVyQhnDvfqLzupFCO0lNDDNEigGZ5FdHOPdbfExjIZREc936B/6vArrdysj
	 ufvPJ97QTUqUAtpZzyBTlMaPYkLB7KwoatSNxpuNno5G3HzWR2UDzB0gv6XsygSNW0UdL
	 AE33vUy5d5TQEUrN5K5dsIGdrPyNkFQXraBImoXX3vtXqgl4kVN2LVVggofz3LhwaHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095262;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XdEYrnYr49EMd463s6DrTHK2N5Yf7ZI2aLUZaA14Nm8=;
	b=AeTxh8XDB4SsE8HCmc4L4WJSrT5PWaJr46BpxpZGUesKOCizKkaU+PU8ki7CZsEohWY9
	 iQErMl3O13D76AqRsiaXLdWllUxJ9kaujnz0qd2+mlHBZaNKT8cwfqVSxt8tUpj0XUpKI
	 nz5Mic+XYuP2LJ94OaC1K5M18zXO0WUN2+o7y6WYjGpGDy523kmpJ/tNTwkpEWH5UX/Kx
	 pqFQDvi71qaj5aRW+NTsnpKEvlnsER8iV9kDkvozkUMfUEuffgzJ/3RKNNbXYkIF39hhd
	 XyrZKcZASfEkgZPmzIL5rxXTjgTbR99NetE+MHo3bgLP37R1jNfEpiTkxX0E++2g4vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=im7pBgOR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y1FXb2f2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A013D60A260C
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 13:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A013D60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=im7pBgOR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y1FXb2f2
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBkUFS085308
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 13:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XdEYrnYr49EMd463s6DrTHK2N5Yf7ZI2aLUZaA14Nm8=; b=im7pBgORjzoPB17n
	j5y184hEUdw1JoyjvY1hXb7jvS62rbF3Og4cl0O9fz/EjjiYrH2GVj0NtesGegRZ
	bQVx+NbIU+oeb3PhNagba2foACMHlZM9YgNB/SL0Y9xvOPqPBFZnQOzQ0Zbza1uv
	o5ADCGCM/GXFU6QWcJlVHLE1plAjZUS0TCqjCv7YGv9wS93fjRY6z4AenarCi+Zz
	GzERrUKeZAPDfT5p9Qf4CQ3PD0N2CzIPVJkyAiuZSk6ogTUHhpB9nWTJTO5GFWaE
	nH9Ktt1SdhcBC2C+xuKe3Xstv894tt6cTsGU7fpUOwHpX9qVF/b0vjM4W0VnNlU6
	Yxu9Cw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1vv2sfke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 13:34:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so1499086a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795095259; x=1795700059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XdEYrnYr49EMd463s6DrTHK2N5Yf7ZI2aLUZaA14Nm8=;
        b=Y1FXb2f2A6ldofU4SC5eGHthfBy736SjED/xRPvsiBHRZbdRFUEb+ahrOF0yENnnPK
         LjCLQbw8lyg0lpQMtZTYKu119J87hD4t8I1L3kNjGB65Nb4GQYCHyS49aamNWhtmvSyt
         zPzCMzPuou+IbJ3MP3isbfOhS3+ehTssiol7hlTcidOUmaBNsFAFcIrOK5ivDouqMDvY
         a4kFTMiqz71VWUQyTk/7L3Hfkc7RbwZby63ZkoZxL2VLdC4cRws0dg9UoefPgHN96CEf
         35GCozYul3qU0YVqQCeUgvRVp7B+n1KGPmH/ciips33NReQ3MGYVI0GAoLFC8QFLFZZp
         K8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095259; x=1795700059;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XdEYrnYr49EMd463s6DrTHK2N5Yf7ZI2aLUZaA14Nm8=;
        b=UaCg5Gu2muJNYqoCADMpi/KrUmfvY+HThlpRMvKEjYQ433pscizPWA4A+5EMcHFJqA
         5xr1m1Xpp//5aFwSRAuXbmTIiFmdQFtohpMDYxLVzVHzFGESAmIXQBYyigmDfSEqmwWL
         bqPK1y8bHGQQ2jjHKBpdVrLtDa/MD9UZvuKpJC81ci2W9534DwFbgQCR1HJ/Ro84a3P3
         hoI47v0Th7flN6nWelc+B4Ecs9Yov4gIPak3xnRf6dvlmKsvB0TdluvJcr1dzv3jk5jU
         r/mEPzSGxcQAMImlWKPaJdml3aTR4bsRb+cTB6UR6BPWCZnx68WxhQ5tTJqRDIUxXIYm
         injA==
X-Forwarded-Encrypted: i=1; AL+hErFurrw258yGzy39VbH483kh2ew7Pp/Q2Rloupn1pwKOCNeJBK7NQHmtd2i04tKXEbMtj7t9DydWdWJfW4nb@vger.kernel.org
X-Gm-Message-State: APuU4Z/YPwfKjig2C+RQeHiDR6xjef9d2TtQp+pYFmTkoH7TbyZCx9bc
	vmHEoUDxGuKZvfj3+zw4tG/7EplOf08+L+SsAFWbODn9K0XFcBAcmTFhVi0BUILJmX8zNJmqevf
	x61PruarSHlDinQYdJYUd8J9qICMP7bzxideeDGM6r7QBbJS/Giz+Q5lik8IbiqxNNMnm
X-Gm-Gg: AZFdTZelUCrgHDeAUyaJm73kub/t12B2WbVxK2OrfODLhPLifxxNJLsFy0QT7atkRZN
	EhObb7jTmF4jGT+nOnUCFfoUsfDPMttIj+VCcN5btKr4FgqoqL8Mkq5Su42lCvdI6qIgNsbRypi
	qlT8X1+r0afEipcK9VwfJxGUCX5q5LlhcH/heGIc0/mdhvwTpBdfCU2/ymVtpE1DCMQpNrOzHp2
	c0nkZgbODlWPLh2PJr+uqiTIOM/FnQbgqIqDRXfc5Hi7ikHFhIhazhJg6qS6dn3/IhVNltyRfok
	8SKH13Z9GlK6pedoEnES/WlX3WFRAU1RwID/RjuXC313Ft+Gt8a0agDRBV+bskKtAAr3B+palZB
	0TqPveFP8LPnUNrqlybmg36+eb8hRuQKpay3N3JlStKcclejqMSF93JtTlV3vu7aHmJimEt9ZfO
	YYgQ==
X-Received: by 2002:a17:90b:2d86:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b3d0828c40mr5184633a91.52.1795095258600;
        Thu, 19 Nov 2026 05:34:18 -0800 (PST)
X-Received: by 2002:a17:90b:2d86:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b3d0828c40mr5184602a91.52.1795095258052;
        Thu, 19 Nov 2026 05:34:18 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b401f75ee4sm1493331a91.0.2026.11.19.05.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 05:34:17 -0800 (PST)
Message-ID: <18effb9d-b83a-4842-a32c-0f2305cf0a14@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 19:04:11 +0530
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
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
 <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
 <20261116-vegan-amphibian-muskox-3c8a55@quoll>
 <de0bd55f-9b80-414f-adb6-eece067d92ff@oss.qualcomm.com>
 <8e8300f1-d837-495b-b947-a3b52f44b4d6@kernel.org>
 <d90f6dc5-bd8b-4fa3-a17a-e00470a9b8a8@oss.qualcomm.com>
 <88467521-f50d-4c87-8206-4a3249f65212@oss.qualcomm.com>
 <d741093d-345d-4cdf-a48d-2c5e55be2129@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <d741093d-345d-4cdf-a48d-2c5e55be2129@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UHeU-u2hPFtg6cZF_qmLl30adYVsY4tr
X-Proofpoint-ORIG-GUID: UHeU-u2hPFtg6cZF_qmLl30adYVsY4tr
X-Authority-Analysis: v=2.4 cv=ZZWIpcVA c=1 sm=1 tr=0 ts=6afefadc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KOBisHcl_ayXGa7m1pEA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MyBTYWx0ZWRfXz5OUqXpTZlbc
 rV2Vd+gxzJRolFfsEyYtfvsltYE24+vgDx9/iRhIVRCemMItEJB0BNX1QjYKe7ERR8adle/0oJe
 cdiY+nRikDlpUgcLpNrS/UvcK0PsJm0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MyBTYWx0ZWRfXywoB1Gu5isuT
 Lzgxbf4sVDQhMxfDMWBOGHiIJQ3JNGkjQG8vBMBYvnorLWqEkJY/2XmuydTB2hK2aAY1Bcr+q0g
 9bw/TaCs+l2gi0NRsZpLdW580YumRWQikBHpDw8RdWEHHH44wmumyd9o5sedBntHQ3JhTejnhK8
 tnjEuZVvtXxiqZK+w+scjMYFy0zgLEzBQfiof1WVE8rT01R4fbEiJqItNEQ9HHLx63BQBriLbMq
 AIUIIPNEufNhuQ5WY9tpc2spHt4T0psaWyjDeKamgSNKu4aMMnLRtmC9Iyk3p4vJsPoXpZIf73j
 YpJOapEaun01t+8VhDkw0ytcSpVxeoUI9G2o8G1M8x3gSMi8rJuQx0tbVPvZtznJQB3GS0VTXmN
 PQ4FlwJER2Ft0TV2zVNv9c3pd2ZwxAwI5eWwZoUFcKCa1SMWPcnzMO8824mnatOfe8WfiOqKKdE
 HQXFZbZmJkw0X2/mDTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190053



On 19-11-2026 17:36, Krzysztof Kozlowski wrote:
>> How would you prefer this ABI issue to be handled, or should I
>> send the next version incorporating Loic's comments?
> Commit msg should be clear that ABI is changed, whether that ABI was
> ever working or even correct/possible to work in the first place. You do
> not answer my question really, because if description was not correct
> but everything was working fine, then clearly IT WAS correct to some level.

Yes, you are right. The old ABI was functional with the driver data at that
time, even though it used the X1E80100 CSIPHY resource index instead of a
Glymur-specific port mapping.

Old mapping:
  port@0 -> X1E80100 csiphy_res[0] -> CSIPHY0
  port@1 -> X1E80100 csiphy_res[1] -> CSIPHY1
  port@2 -> X1E80100 csiphy_res[2] -> CSIPHY2, not present on Glymur
  port@3 -> X1E80100 csiphy_res[3] -> CSIPHY4

So port@3 was functional before.

Now, Glymur is using linear graph ports instead of reusing X1E80100:
  port@0 -> csiphy_res[0] -> CSIPHY0
  port@1 -> csiphy_res[1] -> CSIPHY1
  port@2 -> csiphy_res[2] -> CSIPHY4

I will make this ABI change clear in the commit message.
-- 
Regards,
Nihal Kumar Gupta

