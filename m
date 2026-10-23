Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752453;
	b=tGvfI/7tgrqj7by2sbSJum0Zw2xTLbdZkFRrjGSnlK7l4tMZ5XMN9Egb3+O434ALzYm/
	 v5WSn8WQlXMdjb8OvhKb0nRe214Q6wcO/IQIqlKo+iKmRxlxE4nOVmU2avMyqvhpr6Wpf
	 7FTfOiQx5ZuZEXrj3QpJCjpa0zVsEr38+IJPXsgeIa4fdbcGm4mJ3pv4RJlvNquW4TB9P
	 w1WhyeX83Ud/Whj1gvuLtpprdLegvK4Ki1WXYYxAN2Jh7CID3i+Dcku41TVCCyhpRUYCY
	 +9vUJcmnU4NWzVbbJWL28SxnoFc5ZD7Vs1w9XuZ+rZRAbitREaZKhYP5EIwcW3z2a9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752453;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VwgGM5/F73Jt9T9hXLJk5Fbp36axcuLPsz019Bv+rQE=;
	b=Fvp6UQOV5uCygGe3OJUARlYulLedbnLUmLdK3czf4ixOf8Py47dXrCFbz/S7MHnbAmvw
	 s65bmmUAxaaXYizlg7vgb4rD1v3DbVkLRcv8Map/ita+mC0ytrv8pWKoNw70kdJteKCQ+
	 zun6jJuTxtMsZDd/skS+mdagYlXIO/oFrYcTwGfheE9rsNK0jcwS3TeKZcMXs980A9rJl
	 TEBCJr7h00vwEbppueKfl5Zn1S7dOcppRDVLPmKDZLeEC+3+jLz3aDE4alN6tnUr5yCjy
	 MUDOtWwCAeWIQ9rWJ4sfOnMKdPiSVJU0iGTkHmmZXeYkv8BspGmRSaWb9lmjCTwOlqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L9ucrPfx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EEavBmXT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9504F606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9504F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L9ucrPfx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EEavBmXT
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAWTB2489774
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VwgGM5/F73Jt9T9hXLJk5Fbp36axcuLPsz019Bv+rQE=; b=L9ucrPfxb+ZmgyDX
	JnKX8tcV1GHhhYAKhc3WdADnxaKaZLrXCfDfjuay70SEQyeaJ6tghMMoDV2jrkjs
	4aT+esgc+dDbOVGlNcddFWxMitVgeB4XAvc96bAwxTu/hD6w3oFqde/5g9CDcZCz
	/wkQlp+q5LxTo8fcBfFLFA6HDLmGdgErhPm9Icjvz83GvJuDSdc+yfH4saui8fZx
	FfQXXjGTKybISchmo3BAcU3JQ8qEVVRGs3w2WakqZKPrxR/9+vxKfR9vKPfMJ+6B
	iECMvH8QmCl+A950phbB5vw++e4DXf/WhAoz4chRh4CGC+ZqfcCKD02PQQWOGT0K
	bGU9aA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hftygagns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:47:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934a8cd3a8bso12208285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 03:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792752451; x=1793357251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VwgGM5/F73Jt9T9hXLJk5Fbp36axcuLPsz019Bv+rQE=;
        b=EEavBmXThk8aPanid1uL9e/glsYLVCcWokQHSVeoQEQyKOTShC1IUzBEnjdVd4UR7d
         fO3PwEGjTDXGdO5LfGpxnLteVHbtXz8CFZSufMQw9Uev8f7jp63WAI8j7QWXmcFhDx6T
         zSkfoeYFIQk/8H9H6kPXWSrKvU9h0JtLQtY9nQFDZ/eHzFbkADnlbj+xrJmboTzFF+um
         1Hhy5+31z/Ro26qAJW6cBvdDW9570A+48l27wrxMIhHz5mEXxEwgs09b051lsIvTzWjK
         R+bRKukrco/y5pNje7E1mIldsbPYwo4mNW59JmGIXwGQ7jzqf6YvSD2Aao2NwWYtmhNb
         vR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792752451; x=1793357251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VwgGM5/F73Jt9T9hXLJk5Fbp36axcuLPsz019Bv+rQE=;
        b=FYAt1sJqScLFA/QVKVlKn++OEfcxGCY4FmWiyWgK1YL1NiLj04nWlFiOcNgcufV0fh
         /SJX183Aaq/oENogboCyTr+Yreb989eggKrZD4Y/wYJBCfVNngH9VnPy7SIMk3MOPf+3
         Ul6YApbmiME53Q7aJSx/jNgR4640uwOL0eP+Ks/EqDjcL0uyX7ntnV1+nrn1nj91EkoK
         Gwicsg23bIawgdRRYKrSSs+D5AXJKn05qcbJ2chTP9Eu9ai8tkjcjL+dpbJwrfWfxSWk
         O7ZG6a7KP0JU4ryuNU97Rbc7qo+VEIuM/7ckquqY3qmcicCLB6jSY/TEazBsGlnyc/dr
         BFhQ==
X-Forwarded-Encrypted: i=1; AKwUvByRHIOZaUAcIG2k2xzSFB1bX001cl8xuJ+IRiwHryl2VyNQ4B6g3exxwF0F1yS/Ts7+7vm0/7nmpAbYlnjA@vger.kernel.org
X-Gm-Message-State: AFq9FYJCZb4lqIVVYFgGpbz2oWexCJ9XprWCVGsuOO6Kj8+e/dXmksjz
	2bTRybF78KjGpHYgAf0qv2HydC2RkJfvm/dEut9MkQbU8QgA0FpacKKqNmeeLXe1T3NG81yi5w+
	nzWZY3MTPhPC5igybK0FIslLNbeDxjKJStNoOx5sZZe/m6zlsEMCy2lxYTrTj0bptmdVu
X-Gm-Gg: AYBFou2OwRGCcLVBRBknumrokwyQ8FogH5wpPtZ/ZoXQk9/wwaGGSir3aX2Stml8zFD
	DlmJbLUEpisikv2isf7iKRdYj07fzLmNSCA74i5Cmep+dfw0qHtkovS2b7LxagyF5DBRaLKwq55
	h1ImLuiVZdWU3ADRQ14TCu1tQCTHB0wWIxltbes9No/22fW6cEU4JgDz3AovlBokQN04Oy8NGny
	rCMJnaTop8tRHA9B7VFJgwz6oRI8yClUztz8CGkLgeR0mH9RF90jdK36JJaHpoqir/8fka+pCVw
	o62GKaxfz6VR/EjFYAvdV7l8mhygHzvPg2ED+ITed4r4pLXgj5h3dGaBRDgzyx/JJq4yZ7SGxNj
	sob3+UsjEvvMmprA19yEVIA==
X-Received: by 2002:a05:620a:564a:b0:93f:43a4:a48f with SMTP id af79cd13be357-93f6f96d3a2mr366200585a.5.1792752450753;
        Fri, 23 Oct 2026 03:47:30 -0700 (PDT)
X-Received: by 2002:a05:620a:564a:b0:93f:43a4:a48f with SMTP id af79cd13be357-93f6f96d3a2mr366197885a.5.1792752450313;
        Fri, 23 Oct 2026 03:47:30 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c84370sm88657166b.42.2026.10.23.03.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:47:28 -0700 (PDT)
Message-ID: <6ebd380c-1f32-4ec6-86be-99631db4958b@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:47:26 +0200
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
Subject: Re: [PATCH v4] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20261023083827.7648-1-daniel.lezcano@oss.qualcomm.com>
 <atsmQqSOuqp1LKw8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <atsmQqSOuqp1LKw8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cZpHPXDM c=1 sm=1 tr=0 ts=6adb3b43 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rrZNFMavuSw8objGGgIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MSBTYWx0ZWRfXwPFMSO82AIHn
 lrY777MhWv9m27yhNEaBLdNrCfVzGSglzcGLAog7gxr4TnSxjz126PhDDBeCLAj6NPF3NhYuMKy
 6ZmBVQ21jLNLUJGX1x8fQTlVCT20DFY=
X-Proofpoint-GUID: 3rHsiqRDhVzG-IQUcVRur1DoIzlHegB5
X-Proofpoint-ORIG-GUID: 3rHsiqRDhVzG-IQUcVRur1DoIzlHegB5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MSBTYWx0ZWRfX+OvkZFhP5HT1
 Xzvk75tLG9JDsuyeVc3xBHS3cTSllgQkSySm7nZHTVkionqK2g/u53mr/M2SRATsy6yO2ZH6Pjj
 pQEvQwv7EdpYewYDpvjuDrAAOIfcC/CRJ/FUhRQzFHRO6fy9TXGy3xy9B6C42QELsqOlBjZIT67
 O3fi8xnaHg7otgo8PaxWHirss3NRYkBce3smO/5f+kA8fb5Kp7HwZ9lwsLT1hR1vAoNCA/DTGC4
 GZFnEIEQ+EVGVHHcEUSBKUyDwLJXW2bpXyZ7tj/rUk5c7EBeMsCBJ7OziY1cxzShngxN7N0RMI8
 Pux5DQ5KRIIs1GK7NqFFHxTWrQ8GAfZ8lci5ct35QkcbSUnmsrB3r1OasXLBvXTrjr3k8Ort7tX
 XeikE/mkvOpC3g2U1yFRGom4tPeq7nlcj27cY/bb3L2D8TIbjjA/bdFNjVyMCvtJd4iDeO9EgJk
 Ygcx1aiVpitnny3ltLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230041

On 10/23/26 11:17 AM, Stephan Gerhold wrote:
> On Fri, Oct 23, 2026 at 10:38:27AM +0200, Daniel Lezcano wrote:
>> The ThinkPad T14s needs thermal mitigation under sustained workloads to
>> limit temperature rise before thermal shutdown. EC interrupt-driven thermal
>> monitoring is not yet supported, so use the board temperature sensors
>> exposed through the PMK8550 VADC to provide mitigation now.

[...]

>> +		/* Sensor near the CPU PMICs. */
>> +		cpu-pmic-thermal {
> 
> I'm a bit confused by the node order here. It's not ordered by the
> thermal sensor (SYS_THERMx) like in x1e80100-crd.dts, but it's not
> ordered alphabetically either. Or is it still the old order from the
> previous revision?
> 
> I think I'd personally prefer ordering by SYS_THERMx, but alphabetical
> order would be our typical rule.

Thermistor index is what I'd prefer to go by, I think it makes the
mostsense 

in any case

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

thanks!

Konrad
