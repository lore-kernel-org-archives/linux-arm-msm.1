Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475950;
	b=nC9WZ9b3NM7FWyHJK7GtkvVMJzD/TMg26STWi1MQYLhwSF3AfLnUOVQuacXRP92/s9+3
	 H6L3wT4MAyhJJwDwt+jGtp7zB4gZ9DbaDdivEhCgnG3HechPY34EvPdj0gd+SeCQsJ+AB
	 zC43NC2o9P/MIW9S/nw8cSJ+m5CYiLwyQlUzCHBA0R7py/xh3s04iki44xNN8Z8Vlyf+2
	 AKSh6qZQJ1Rt/7al39VgCD4jMoqcaC1RqvpkkNIUqZTiXwFZMSx1d2xYrFH0cMDdoUNgP
	 42yX8JojI5tVjyAfLjymzu4QuVvosn1QzSOOiZTx4q7nDOvVL+/xGV0aYhkBqrOYRVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475950;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OOR9CZ751DrXMTQaYLwERcixWRWhOaaQJxaNRIejM+8=;
	b=VMnsV1AA+k7DVAnsT9N6YlFoI/Cq7XQkRZ2xQvIoLx4ifod+FYuTXK+RHKwigQk02hIu
	 KXsOHsxNMDAM0t0gwkyD56qw/VXqEF/O7saUqgEOHrSy1dSEujd/oYby75C0iVmhHL13+
	 Twyrf5cKeJl/I4QwW54yo45Gb33iHxVT13OKe06q1yvLZTK9mM52VQkg9l6kEYtkybl7W
	 lWOhw87MC3S98APKb+yQh0cuhb8iaA0WC2G2r6Lt6bT3XwJ5YUIM9VY+U0OSZFnoW6hSO
	 jCcPYIHCdRX4384Cetn4PwBHiLTzqJh/I4pb40jBag75ruj6SKfsu18Vwa2zAS+1CYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="VmF/cr7R";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HKHiWxFl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE27B606A331
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE27B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VmF/cr7R;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HKHiWxFl
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9AB1g597313
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OOR9CZ751DrXMTQaYLwERcixWRWhOaaQJxaNRIejM+8=; b=VmF/cr7RgX5IKly5
	nB8ld7K5D9AzKUIOEugReBYCnCvRZHnKq8ckwwPd3MdCpgn6tDd93WdjDdaA9b6E
	l0WSMXMRdGhMoIrK7QPZTPN+yMR0023gcBHh+rvBynvJ6qVGJarBEd/2K6ZAWKcl
	DHi3lT7Rw+HeUI4zOpJDUzpLh8wrBibWKeYtghBDeSUwZ46uA/eFcxHiB0sK1pwR
	DYEhD6popASG7J9wELjVH56JMoJgHLIZ5uDiOiSzXEzXW4T4vJilMgZ9OWfhQ/3i
	nfMcHwtge9Ud3f8pW9WhIPlx4NMjYvP6zLErMZjKSranHj4kj8rXupXMGGXtMg4U
	sLscUA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1542sw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:32:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so2588780a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 01:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794475947; x=1795080747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OOR9CZ751DrXMTQaYLwERcixWRWhOaaQJxaNRIejM+8=;
        b=HKHiWxFlkYv80AquZQMGd2DhrkssvCgE8nBFesdbIC84hbDY6DRytHx2g7QN8sgehI
         j1ypV02/EAAHW+mjBChHjWW180eXdqeplQIOGbqW1sNrbQpEWaX/gOYIqQvmVm79dXYL
         xBllAV7Xhy+bw8Njj386fmnrPp82OMm9aX5RklllWln3CKmI2P7Ph8npDq6zEVa737q+
         n4O0PjZM9Np7viOraOU4KdU3VZJtkIUjsn7tjunpufRXyJXp9GL/DzYxbkM7LCa3qRGp
         hA2b6WCsyW1FJTxPZ8ekmbQwjgR8OGZJ7eAI+u4CVKUCDom3xAkNqGOJSSTzxcXyBhfW
         LKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794475947; x=1795080747;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OOR9CZ751DrXMTQaYLwERcixWRWhOaaQJxaNRIejM+8=;
        b=mZxWRc6OOfClw4tGlYZFknSNf9H2F9MDkWFGPFvc8q8dmYdt5ZpknxSeZlh2J1Ykd2
         WNBeN/kKBTuVQPAEtJ+BzLsUnLp3Mm5suz+DNl3P3KytAchQpYa4yvp2wzPzDnWWRxS0
         /Y7SUI1SAjAg0+FYh3mC3h4qqkMkGyT1Kc3/IASsEtd6nSfEiWs7QxHFqoBvjIrlEDO/
         HjkR6wcSFV5JmRQ6iZZFvdvEtyzV2Zye/h2Fcronj2pX24ayBTkjeLAQUBNmrHHWt3w+
         C+hWLQQLR23jHarMZ4mO1/6YYXmSvzDOI+brehJqOeaf0Wo3gz7T12OlP/v27yGZ3vd+
         lBuw==
X-Forwarded-Encrypted: i=1; AL+hErEYHfjJ5CK2XLj25OfIRldlB1fm1v5tGxqEb09/cAW1D2dJC/ThsRfJMAohI5D30LOxVLARgkWjY5AaQrB8@vger.kernel.org
X-Gm-Message-State: APuU4Z++fZ0Wa0ULCLb59DVR6yHoVJhQJdw1A7qfUVy9TMgvBbsx27P2
	76Or2F99uBU00j+x99B817hBvXwJeq9MQTBB6/9Z7fvQzA8Ed9gU5hhtJd98Hvxs3Cj/jUlvPin
	owdoj6qEKLl+W89GH+kXuIhfC1Y6I09fZFKyt/WkOcp3nNDj7ajSphGSucA6Rg0lHtfxL
X-Gm-Gg: AYBFou320kNeHTdIN5s5ElBxfpd5AVkEisGeitrUc5Q9O3NwlFLixO6qzqFaCq20JUu
	6kvt3U7KnKKnc+M3Akg75DVseYOo0iN4Pop4FgFbsQKrXBVuza/q32pP5B1PW0FMzZyq4NKALFG
	QulwMBFVv7v3P05q3DNK8xRUY0qNL/xZT+J/PeAidm4k6n7+dmMBvJsuQwgaaVhOLrgndc+TFKb
	vaK2OhxThXLJYSZqhmZzFPJl+3XjgdRGWzfdavaxEsTJAFgRTJdlnkNyEZ4Rc6THJ6UAfDN2TMx
	J7RgWT1fpPkyQzWSe3GU9tsIPeOeaLEHb+2UGM1nCknyUXjw0VdVMfVEpQmZetX3yG8I8BvZ9qM
	5kiowyi5DPsP7gzjimon2ICWwVznc3VR30iwTcE6VAr+huETrctXdN1tQEwZtkxUXCyL3+S9r8b
	w3
X-Received: by 2002:a17:90b:1647:b0:3a8:c0cd:57f9 with SMTP id 98e67ed59e1d1-3b182f26a0emr5088684a91.25.1794475947480;
        Thu, 12 Nov 2026 01:32:27 -0800 (PST)
X-Received: by 2002:a17:90b:1647:b0:3a8:c0cd:57f9 with SMTP id 98e67ed59e1d1-3b182f26a0emr5088666a91.25.1794475946998;
        Thu, 12 Nov 2026 01:32:26 -0800 (PST)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm3803578a91.11.2026.11.12.01.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:32:26 -0800 (PST)
Message-ID: <28202f96-f234-4c7c-be6b-3019e119bb0a@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:02:20 +0530
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
Subject: Re: [PATCH v2 02/10] dt-bindings: ptp: Document TSCSS hardware on
 Qualcomm QDU1000 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
 <20261108-tscss-v2-2-d5f575010427@oss.qualcomm.com>
 <20261109-sticky-caiman-of-research-65e9a4@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20261109-sticky-caiman-of-research-65e9a4@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX9zF6VieXvJYk
 mLUpA9V6umQ0/ERvj4mcM80+x35aPlVy9MUl8NJxPJCkRG0A7PBW4G5MWiWHgYdDUyUMW5MDHrw
 Kw1gvZ8MCALwpww8CANYiU7CUXuWQ/E=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af587ac cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VFrjYgP8P-MpaLTDB6EA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: e93nHApy-Jcbf8ZgHZWXBwLIcMvZQnCB
X-Proofpoint-ORIG-GUID: e93nHApy-Jcbf8ZgHZWXBwLIcMvZQnCB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX3+mCEpZtfbXK
 0HaKEwuevHgcB7bPXgvqDCB4LtZit6915eziHtnVmO1NYt1ztMgmJwXY7fdZYwr4XMBFmY96/0l
 dCmJNxx6JnDspL7OxINYNF6wxWtgYvZN6y2qBM7nCQbb2MOIjQefKX9hciz++NOLZMjCuMy8oUl
 Sx9U7PqG7OxtGC5eyNPWQHu0s5L89HWO31aT2zmgUXSXYoggrUrPsZh+VHjnbjEQka7V3UzuVfw
 A+OVq0osWkRMdd+tqkBL/rgtEKgln4j9+iLPPR8lPnwofjfphqzxMvZjQmU+E/YIUF+zl2QURO3
 4JvgsmWpglgSi5OfkZxdVtLIK/d4lsROoulU+CLo+zmr1IeIEvTgS9QPpwXXdDre0huQHA0UIjw
 5MfFF9XlctX/F9iN1vRvzO4Gn9F8pDmU6x1T/ZLZGSKJkRyBmjpwZzGKV8EtZgMQSMf+Vy5zkSN
 aJnSFkvd0an2Tc2XQbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120037



On 09-11-2026 06:19 pm, Krzysztof Kozlowski wrote:
> On Sun, Nov 08, 2026 at 06:48:23PM +0530, Imran Shaik wrote:
>> Add Devicetree bindings for the Timestamp Counter Subsystem (TSCSS) found
>> on Qualcomm QDU1000 SoC.
>>
>> TSCSS is a time synchronization subsystem composed of two main blocks:
>> Timestamp Counter (TSC) and Event Timestamp Unit (ETU). The TSC block
>> provides a continuously running counter used for timekeeping, while the
>> ETU captures timestamps for external hardware event triggers.
>>
>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   .../bindings/ptp/qcom,qdu1000-tscss.yaml           | 170 +++++++++++++++++++++
>>   1 file changed, 170 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yaml b/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yaml
>> new file mode 100644
>> index 000000000000..52a063ec4b78
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yaml
>> @@ -0,0 +1,170 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/ptp/qcom,qdu1000-tscss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Timestamp Counter Subsystem (TSCSS) on Qualcomm QDU1000 SoC
>> +
>> +maintainers:
>> +  - Imran Shaik <imran.shaik@oss.qualcomm.com>
>> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>> +
>> +description: |
>> +  Qualcomm TSCSS is a time synchronization subsystem composed of two main
>> +  blocks - the Timestamp Counter (TSC) and the Event Timestamp Unit (ETU).
>> +
>> +  The TSC block is a timestamp generator that maintains a running counter used
>> +  for system timekeeping, and is functional with just the AHB and counter
>> +  clocks.
>> +  The ETU block captures TSC timestamps for external hardware events. Each
>> +  ETU slice binds a slice number to an external event selector, and
>> +  generates its own interrupt when that event is triggered.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,qdu1000-tscss
> 
> I failed to spot the difference against your binding at patch #1. How do
> they differ?
> 

The ETU interrupt wiring between the QDU1000 and SA8775P/QCS8300 is
different.
The SA8775P/QCS8300 share one summary interrupt across all ETU slices,
and the QDU1000 has each slice with its own interrupt line. Due to this,
kept them as separate bindings.

Can add them into one file with an if/then on compatible if you'd
prefer. Please let me know.

Thanks,
Imran
