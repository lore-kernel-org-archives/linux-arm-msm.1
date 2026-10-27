Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080104;
	b=b+Xo1zg6do+526UbCp7tiHNEJHkCVRB8Tnz7JUEIotRfyQ754CJQ5QD3uPtMm8SmxKyQ
	 g3uFFuJbKEG93nZBMTdE/zcW6/GQ4xELKDvtx7WD/MA7gzcVI+YSpQxL9597QAVslrF02
	 Q99dFw4tyez0uDL6ncRSG9pYekFsJCC7p68l16WT+z5FW7wJqXDl/7FhqaVAQ0H1q7/2V
	 kxcf5hE3UV9pd5OFzepxBvjEN0FuPE0UCA5UZK08cLghMLBGkQwGmZTfetd/iEdhKDDFZ
	 zA41NAvkXK4mASg+WpepRa7jAIXHiW61drTbFeg/xtbeLiPFUxnDhf2JFa9WbNsxOZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080104;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ESb3SmQ8meudOtCfPOx8wemsamBBkJfF9HrJP+pAGkA=;
	b=w9pwLBtlHbVl1nei9mriwtGC7lX4vJrUpjdqmAso/0qwH3Xb9iH2uVdE2y6KHgYqL18J
	 iQSCE819U6gSfI3srODnhPou92Ac27bOn9KG5WyGARnnMQWuKz51xQ+VFYa3HM2TNM26Z
	 sBXBEQh0LG3HzJz6KAlAbimpvNnr2FHvRurF3YQ/CH/m61mSpgnoJG13NUzpaQBDk4ukW
	 ZsymDmROTCGhjZwTr8bgBvMMGn4vm9bB/NpI+At/WO7QVXAedDUrXwZ+k+Cm22e0Bngg/
	 ZS5LxKdxgENPhXQsj49WgEc4f4uo2qi22guL0Pz7o+n0z8nA/ou4x004fXILBT5g22A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kw6X+lgn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="KEk/h1jQ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFF5606A328
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BFF5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kw6X+lgn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KEk/h1jQ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5iTK6404875
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ESb3SmQ8meudOtCfPOx8wemsamBBkJfF9HrJP+pAGkA=; b=Kw6X+lgnXrRlD6sO
	n0LqdwhzK5HQiwnbjJVucUMo8QaixvlobbRKcKuB5pkg/xYhJBo+Zz3J1GPRaNRl
	LjsmBsg0vGlNlgM48M1V14ZVU+BQmSSSD4Hv6iuB/a8VvZq2ESN3eYRUhhNLj4bO
	Fu51VRgld6cYq2dsueb7rHbfvduZ3zetGi8ruxs4Waieyh79rovR8X3KbTA3Fq8+
	cTGnLCg+EXDT/Z4yHF9noV3xsn8d0pchmPpH1sTZ+QC/qeRdMweDMYDy5uOkS1Iy
	57JsmbSZChlZOV/UKfbiV9WtFMh9ywogZfkrHf4MJBKDTExx29+WCFWykGlqOoD5
	1tjAzA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2t80cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:48:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7922420eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 22:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793080103; x=1793684903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ESb3SmQ8meudOtCfPOx8wemsamBBkJfF9HrJP+pAGkA=;
        b=KEk/h1jQDSrlQb3o57wFVjGo5SwPXwpOp2/AA1Hd5HCpQDWjemFsk/+VV1cMp5y8P0
         jArGDPAdeoTsGKOu0GdaSzPLOnvfAAT70X7Wmpt+Hi6UznjFop3yTVZwHcLdZMC75my1
         EWiUKO4wqpPmKFiu006fXeo9QenYu+NNm6FJqSvZ/iTOmyCMgusedFGfKOEc7Vcv3/Ko
         h70m0P9o2MUfn33stWz54YLHXFNG4yPuFirPynuV5vM/NjmrTRucMIZzgHfDcUmppbGd
         p+gfegDQrvGNQ3cNdr/xKbQS3pVNC9huMxppFCgHqaZnV4grP9VanVj9fUzEWy4JeXjP
         F0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080103; x=1793684903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ESb3SmQ8meudOtCfPOx8wemsamBBkJfF9HrJP+pAGkA=;
        b=udLX/FMBvQ3bLSm6m4YWcTaFzX0DcuXzVqLI7xqvjuz0IE7VI3TJFXOdlMgg0EIW/g
         ui3yILyfNH2YDJK2PaDGcpej3+Nmq1Eyg0fezE1ys8HqoUYNDj5Wv7jrkgezI3MhMICM
         5fiP09JoX0aLqmFhLh4lCvN0Lf4ybmI3qWId2fMT/In7KfNPUM+FCBRtJNEwVDTLkpCE
         2M+l6Y6WNo7YrF2Z0zBn3vD3iUruGbh4AhAjf+Mb7A+NUYu8CaWhZku0ZcriwlOUxBfz
         raGnsDxMCG9wc8rK11U/ZzoLw7W9r0ppiIfX1VnYCmmvPRK3JPSDkogfCVqzZgpcS4XZ
         0zkg==
X-Gm-Message-State: AFq9FYIU0vcZ/9dGFJH7TjDF+DF2fQUWwxZvWbdhFqAO6VGoxCmyiX+d
	+oI1g1WmnF8JhYkzgfQHYC8RwrQckhFgXokuvNHuHtT5z2FyVIyE0MsY1x4V/2hcgDQ81bzRNUw
	d8YIFVqTxlGckN9Jo6zrFGjGEcOLGpYEN6Swc1qa6N58aC+w56XutMz1jlf8rIHvu5WXe
X-Gm-Gg: AYBFou3HrW+xFwbUHIT5Er4LeJEbn9s7U5oKQcmOnHW+MQCHpxIQj1BWCcDgzNtPvYa
	2L/OgdpuCxuMzQ9anXRPRit1mwHT5oR0CyV513b/X5qch6wMX/f04MNcKn+xHEy5ukCF7KRKvhd
	By9V8L9ovSyH9eSbcuVDuegQ9jICEzM28T9+41dOIcMLEi+TAmr4+qv5YFOHWdhT/T7aUMZfM1Z
	2Myjl2N6a8dDmwsxh+h3DoNrt/fN0s3nj5HfxljMSt0ZpeoNK9z/AWj/pJ23hRDzMH8ksnKfTJn
	c7GuGLglo2XH7/rWI87tYNDRB9+yF7ts0wt3mvUihYJomCpppArHrhI9mHuX2CAQxS+LGnYB8rp
	6WKQEIAMbUwVn5NB1pxI4mWgTWg==
X-Received: by 2002:a05:693c:2807:b0:369:eec1:1d7e with SMTP id 5a478bee46e88-369eec12196mr11695252eec.11.1793080102883;
        Mon, 26 Oct 2026 22:48:22 -0700 (PDT)
X-Received: by 2002:a05:693c:2807:b0:369:eec1:1d7e with SMTP id 5a478bee46e88-369eec12196mr11694676eec.11.1793080091301;
        Mon, 26 Oct 2026 22:48:11 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ee71f5sm39226087eec.28.2026.10.26.22.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 22:48:10 -0700 (PDT)
Message-ID: <9387d067-cc44-40e8-8d60-d547d222522c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:18:02 +0530
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
Subject: Re: [PATCH v2 9/9] arm64: dts: qcom: shikra: Do not mark MPM as power
 domain provider
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-9-ac7f1a0d5638@oss.qualcomm.com>
 <883e7b91-d2a4-4c3e-b6e9-32d0a87361e4@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <883e7b91-d2a4-4c3e-b6e9-32d0a87361e4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae03b27 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=EBxl5K2b24NMC96zZi4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 8j4DElSJxH-5n0OGwY4wUbdA0tVP8SiP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyMiBTYWx0ZWRfX/RHf8beKG5VM
 jJqoJ1Ygj59XsLAMwTytAHoQEJy7R53Tbmg2OG0qysnfG1Qli0IHwWZZdKV2cm7XzSio0Vcm060
 36qS1bKNCipsuf3kAaUBioSSXvaUfx8=
X-Proofpoint-ORIG-GUID: 8j4DElSJxH-5n0OGwY4wUbdA0tVP8SiP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyMiBTYWx0ZWRfX7og9ekSwMK2Q
 pf1fasmgld1jbUGVhdINPmc+hA9ae7dFlQcs26U3bTLsFrQLDxJr2hZm3QI4Slxld0Syeu2eSLA
 6dhgyroDv5ohajcbME0JMgcKiv3SDqjbnXvfdNaNtMuBThAvDb8Gl0Wi17LEMsf6wrmheel2fq0
 It1wUQ8NCh6bsEJl8oWtHWhw/BnaBK+6hsausK/dw6S8s+RK7elN3McQARCm5yM80R8u/O1aLtC
 e/sULoWP0DPE+h4qaABLJ89iAUdWVMsmQtVpKu5I/1yNNc6nmD5PfMauASRpWyaFb5AywxFuERp
 pddfi9eQ7h7/NfB9/2Q6j5lUvA35GfFAir3w3q1wzpZkXXovqUDJ9hK2FgTzFqtSOQQTonQOk33
 EkL7NQI1cqL8CLdhzBtYFNJ9C2MXjyYTB/phg3USn4wwmH2UoG5Yj+5+5UHUq+vkweuot446mmi
 V7GItxOnHV63aJsaohA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270022

On 20-10-2026 19:29, Konrad Dybcio wrote:
> On 10/15/26 11:55 AM, Sneh Mankad wrote:
>> To make the MPM design more logical and avoid probe dependencies, the RPM
>> notification is managed by registering for CPU_PM notifications.
>>
>> Remove #power-domain-cells property from MPM device.
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
> 
> Patch 1 introduced it!

It was done to enable LPMs in Shikra without depending upon MPM changes. However I get
the confusion, I will combine both into a single DT change and send revised series.

Thanks,
Sneh
