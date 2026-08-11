Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2253C3438
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 16:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786464067; cv=none; b=K0XQjHtrMMsOEfuJw4zjJ4JToGdZOWMOxRi1DhKU6OONn2x+L5hEjSdu/HlWnaD1MXzVo9tgjqNUS1HqH3se98qlPKYnK/EAm4Hhya4huK7OZ9T+AiF+jcbqe+wUr/Fz3XvStEOlTVxlBVwF/XKchB0x0zX+ZOA63z1XQMQYEnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786464067; c=relaxed/simple;
	bh=rehoQlsh2hRdZmW9Mrg12yyBqxDpPRFDZpXLr5wHsKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=belSNXjDJ8nWTuubVDepk+PRCSUF645ExrOBpyS+bHG00l8EcXKXsc6J0e35cKGU+aStDzMgIUJSDMjrifii5ntw36oLPiIB6sA64vMI7llpWDqe5V6LlF2SbP4gyDsTLuN13jPdmGetRr7aaPevCpQEqYTTLrUmaC7xYhDpXA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Za06XWNP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=glDpzaPx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Za06XWNP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="glDpzaPx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWvWG693968
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 16:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yG1SSExP58/Ci06+3EQc/9E8137LeaN0Uv6qTDg7rm4=; b=Za06XWNPqZCopiIe
	F9sUW3/3yD2dBhRQQXwTymI3Fw+/6o5RCNDEEwn1Ypc6vxYmztIWrPccyxHIHWLa
	MjATD/NMWZBv9C+JfMtatjJpaQbMyGB+EeQVieWPq/Ep6t1dK4/UiazcTZCvpIUc
	l3H7Bnx9Mm8Dfw2NHkWT+YY25lJsrfzNwaijWO4rDfKbplAkbM27b53R6EsX9xjZ
	2smKlDL3tQijjST8fwp+LkGPdCBC7UnY0ZHFfKPkchXgUeI4F5bxSgS7ym9WfBom
	4b88U5R576oUZ3aLfKeTc+LszVpxdqrzEYdpGN8qXpxRB2dKyG7diU7/rQXROjzH
	BjO8Cw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049gruha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 16:01:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cceabd70f5so1743695ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786464059; x=1787068859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yG1SSExP58/Ci06+3EQc/9E8137LeaN0Uv6qTDg7rm4=;
        b=glDpzaPx9gO+7NOQ/3ntG+DS2vivY+kow0rKuufdRe81kw640wP22tLTXYVkRztGAp
         rDG/ISWTlt4l25qWT8pYar59Ff+T6wfFaU2eqOBmgzIx9yIdDEAy7lhCBbJcu3Wmh1z/
         IRO9BRf7HHmeYlZDKqssHh4Il0UG6YwgncQAqJop6LPBM5Sv27rbi9Gd9LNedaKdTOB7
         /rQDxhfBBOmzzOZLd4pXk3w8/0hHE/bLCuCQ0t1k0GQRdzOu3uDZqH9blNe7uvnkxUgf
         +aj2yVmlLd1ao7WWHk5UtM41ZVpLAPbxK8YvB1e0NflLgILyI2rvhUfIzcBxD07gLpCt
         4WpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786464059; x=1787068859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yG1SSExP58/Ci06+3EQc/9E8137LeaN0Uv6qTDg7rm4=;
        b=Vk16zgVsEMNLJAzJn7bhWHHikqEiuGd/8oaJvFyd7J2/771MKYyA6Kz0YDCAgz4suV
         8DsbrscaYh2CBzYLfpMDH0uP4PE6nTEe4oKTGT8fRjyU0Ejx7j4iipSfdJJKon8bhdDj
         o7Wiqty/27MjRAimFxo2w46jwpeVwaQXjpwdSZunIBCmRsVWSKZUfx8HslS6xpdZuhew
         JUuXzCon7Dfa9JoOeZnzDSBn7Cjm8w8SCWkzYR/9nsWcx/+zbdQRpmFEBwQEbzEpwwJA
         4bY2xWq6qCFiUW3o5icJct69sMGyDLsYS16aQCJP0Oue9gPheB1iCvhmOyABrnmVAKBq
         xTpw==
X-Forwarded-Encrypted: i=1; AHgh+RrtCCMZKeaOduBPiufLnNw0XOsP1LZ1N+AcU3JKDAwiukw3Zgo/M1mzQC1oLR4IF37zUDyekI8WHGWt31rh@vger.kernel.org
X-Gm-Message-State: AOJu0YxwIzGhAAc+TQzMVmOkZskOnLF/Eb5HNUyhvhHxQ4BfJVIP2Z++
	VUPhM0prCc0cK9TYHD/n+eShpExzIB9F31cvJwU748hfTj1eG5TTvgXnO57YmEvLPcWS+6rD9PY
	SC7C2dw8Y0akvtjcrhJIe/U2MuAAUrNefJTaFYEgJe0f7B1tw6gC9Dh0XBLwm0PBdKLqH
X-Gm-Gg: AR+sD13AXFcRMrUGCi5AYfuk9FpsT1ds9eKt6AKgz6ugmntJyPd1/jjFCIhKI3hBQiW
	D/yPEi2XfAH5GWUmLsbgJy8b0OaFHGLI3efE+LOrBMSUNONb8hLci/qLaOODDSFnz76BUX39dTE
	kLb/j3j/LaDvDC6TJhJR0W7kxmBV0e8fnRNotnnZVJoG9B7fI/ROLkuh4IPPtPCwqU3FeJLe/H0
	7Ym1GQpX4ZOdnmfl1zkugrZrn+5Dn6oNgcfiV2AkxvNfRwmdk7rIRBC7yY3U6R2efc7N80fsPdm
	eNm9RYQozK46q6JjUcdD0NW5jNvChR0f6xpph8fYA9GuEgytzf/iFs3aahhwKfJXXGUVT8h5mEd
	6oA4ZCM33q5u9SewqgXW+zWQDz2nVf2Y1Q9at4AIUruE5
X-Received: by 2002:a17:903:32c9:b0:2d0:cc92:f7ae with SMTP id d9443c01a7336-2d317789dfcmr45912225ad.3.1786464058734;
        Tue, 11 Aug 2026 09:00:58 -0700 (PDT)
X-Received: by 2002:a17:903:32c9:b0:2d0:cc92:f7ae with SMTP id d9443c01a7336-2d317789dfcmr45910705ad.3.1786464057921;
        Tue, 11 Aug 2026 09:00:57 -0700 (PDT)
Received: from [192.168.1.9] ([122.164.84.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315ef0f42sm10409145ad.14.2026.08.11.09.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 09:00:56 -0700 (PDT)
Message-ID: <a6ceafd7-fb2d-4fcf-9a75-832c40affc2b@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] I2C SCL counter updates for Qualcomm IPQ5424 SoC
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260811-ipq5424_i2c_scl_updates-v1-0-bddcb2ceebda@oss.qualcomm.com>
 <148ca192-52bf-40d5-8ad2-9110600eba72@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <148ca192-52bf-40d5-8ad2-9110600eba72@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEzMyBTYWx0ZWRfX3iyPTfMX9D8P
 B9nZoSxIb7vuPDgJDuVQ0ph3VEtAfN7+Hnu0xHB6cAAQgzoSl1HcqshieCtRoWguW9v+Xn0hrPq
 WU4kRqXpywUUklK8SBGyc3sQl6rvQAA=
X-Proofpoint-ORIG-GUID: 0ltg25iylahyBWl-FfYk6oiGjHV6ae-e
X-Proofpoint-GUID: 0ltg25iylahyBWl-FfYk6oiGjHV6ae-e
X-Authority-Analysis: v=2.4 cv=cvarVV4i c=1 sm=1 tr=0 ts=6a7b4740 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=0/lRlipvHLU+ZVN6ZkkSUA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RGlg5H6Z-dMNcyaZwW8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEzMyBTYWx0ZWRfX2E/K7HnGZotJ
 wx/ykg3XSJRjngyAYZVOFVMK5Bslxg7GTfn+lO/KoxCf11ESLsLyjuW+PgPt7PrsBiQlmRW51yh
 426XhXBItokf0KAmLnK2rPbJIgVmjcI4O0WvR8A1wNVerR63smddE/s11in1Q3EBjX7NO1+cDq5
 PxzsXXy8KKFDbauonUqEIJ9eE+QBp1L3ANX4+Mrg4u+dbwW4VX3/gpBl6e6kfh49J6aV+cg6arb
 sYSWiDN785rAb1J4/zqQjOZyeODveM4cZ4O+KCuVN0+bmgn4kIfFWoLhEAZ0q7aH9OwBmC5lNFI
 sRDbLD/58BcqkflkvCv1nAj2fsrvSaZMZBjpSxb5tVQpaTvLMwZ3sdKEtFe1DhBPgkb31jORd3k
 ADUi2G61MuH1Qf2MdmQglo+UtNtqQ/ZlBZPaGLN5dXherdtWJsr6/fcNdDftjPwU6yz/oxGBsYr
 aztKj4uwcYAX7kv2o8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110133


On 8/11/2026 6:11 PM, Mukesh Savaliya wrote:
>
>
> On 8/11/2026 2:53 PM, Kathiravan Thirumoorthy wrote:
>> To meet the specification requirement in the standard-mode bus 
>> frequency,
>> update the SCL counters as recommended by the design team.
>>
> Patches shows that you are adding frequency table for standard and 
> fast, for patch#1, and all three modes for patch#2. Please, Correct 
> accordingly.

Nope. Only for standard freq in patch #1. For FAST mode, it is just a 
stray space removal.

>> Also, SCL counters for the FW based SEs are different. Identify if the
>> SE is mini-core or firmware based and chose the appropriate counter
>> values.
>>
> Little better, select frequency parameters based on SE is is RTL core 
> or FW based core.

Ack.

>
>> Signed-off-by: Kathiravan Thirumoorthy 
>> <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>> Kathiravan Thirumoorthy (2):
>>        i2c: qcom-geni: update frequency table to fix timing parameters
>>        i2c: qcom-geni: Add I2C frequency table for firmware-based SEs
>>
>>   drivers/i2c/busses/i2c-qcom-geni.c | 27 +++++++++++++++++++--------
>>   include/linux/soc/qcom/geni-se.h   |  1 +
>>   2 files changed, 20 insertions(+), 8 deletions(-)
>> ---
>> base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
>> change-id: 20260808-ipq5424_i2c_scl_updates-f1696a0590fc
>>
>> Best regards,
>> -- 
>> Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>
>
