Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7466E44E65F
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 10:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790592557; cv=none; b=SGWEote/PJZdsbCWcad7TmsJCUs6gEneZ1yGb3yybtj+ci/2mTZAgwuPuxA1ZmtMXVbYxTiC2gJABaxRZb52289nAc69gDQ/VdDt40z/RulJ7BYhedl/uxkYKWy/S+MS7vIVs1KTC5+O8x9R79ayZGXEkRqUaLttQDGHAeFnTls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790592557; c=relaxed/simple;
	bh=vUQxdTuqCw6zujbZJXCgbuy5rPAiprMN7QGYXOORR/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X8Ui7CnVSWSfSpeiUQTppKjazNJe9f0mFTX/ptZJZx9LX49WnFOw0qrbTncZqePI2e3ah5qUyr32v9ekMTrzWKTl21iQkRoyac3eDMYAbfXB64DIprmdrZbu2fFZ6ZSDoIXD2z2udSgmltmfIS0qGpiSdc0QDVt2tEhFxK21o4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EGrfqYXu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LFAt+klh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGrfqYXu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LFAt+klh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9MMva954631
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 10:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I655IJxwZHuA1LDqMurAhNs/SZ1fSA3amOsY/eOz7jg=; b=EGrfqYXuwBM3xqt7
	O+JWJYCnAiFv+1on7YOFW7rrLaGv3TakJZzJvdgN1bkYH2x72hq9Dfu2wSpq994T
	SVPl0Zq9btjHffw7NooQHo9T50yaFmmPHx99yb7YdogRn9GYov4oofYrquR/o9fV
	E9wqZUTnv94votwvuhwYvKPeYKDLOhOMeS/BQ9JiGMUDsz4/uJXFsV8WpHwAU01z
	QRhrATWWAmxiQITbIhkuDQa5/fvG2m/jFRQpfQPnHtH11HKjNSXyHcwzuQZTK8F9
	TsD26UNn0hBRU4xMmZ7fAzxgE8l+GEdrcvfybCi9CjKL2msZ4fGMIxxiHwbrWLI3
	WCr+rw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynbc0buq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 10:49:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53320bbd5deso1552191cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 03:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790592555; x=1791197355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I655IJxwZHuA1LDqMurAhNs/SZ1fSA3amOsY/eOz7jg=;
        b=LFAt+klhHai9NSbGoUe2JlxuCLGVGMLC6ggomL3aFRwVlypxCsoo8HF1G7bXaZ3lxp
         2rh3zUHqG1Aeh/jEvZcsOtgz+E9VPr0DcN2C3+LKc1YwBhiGoSMQVA60YEQZG+zvAPHt
         duFoPDV+BupsTQ8tH+lhCfDqh/zQMDmwAzwW/AkvR1KasUOKaEoWsMsZmCFeuQ8IX3lR
         1BrtiXPG+7htpnjq/fF2jiBxu8UAfoj1dCkoTuw3OWWmUfY1tmoF1xpNmamnd4SVkwQ/
         s/8eHZWpR/H1vC6sRCfvaWfYUMu8N67NkPeJG/Zm4CgwEw8DjpmlkKs9eDlQqzubBRwj
         DNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790592555; x=1791197355;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I655IJxwZHuA1LDqMurAhNs/SZ1fSA3amOsY/eOz7jg=;
        b=ArSsfsQENb7NPSzDimgtl1sJGfRyIydMlL3+Zznv65lxpnC+SvK+ZkhUEd7RNPXBpZ
         9jAPtulrYESiftni/h9wKfOC5RlchwumyPNsHYnDaAE1n1ir9koc4GsGFU0bRIn+sBkT
         H891WJ7l4C23vwEQks3f5alTYj5Cm28OWbRpFYV+bUs8kffGXmCr9jUHM3tQZLZmWVbE
         FuGvclXyC6LkccVdE+pTTVf6PGuvxNBEzPWbM4PMonlrVvF5YxkzgaRAtJDrqY+XCjRa
         FY/T8+eAX8onR6L4v08Sv3Fc4IK7nCtvxHUUsl6YgnBO12xk8A7/Zkdm+I6ZeGX+yFV+
         i/+w==
X-Forwarded-Encrypted: i=1; AKwUvBxRtbrga4InokhIff9GcA1Siq+e17wOG2wOq4FtqFah77cswVbcw2RhvYCp3UGyP23F1YvzrrlRkOU8vqIF@vger.kernel.org
X-Gm-Message-State: AFuF++klfVIg5EuIanQHRPJw4JNVdaJGib9Cz+bWVNwm75M5YVnBPyQs
	DUg4lxgpOKFY4ObCpUdTORVrzhPZf/XVB+PCHECRsdQO5XZFdYI5Qyr94OjjFgKg5ngoBxK0mGs
	n8VVik8Kouad6zVCykA6jCMO9ylOrHx8e/FMn+j3tLPtPxBUf/ppIrO2fynlKEu5EcYCX
X-Gm-Gg: AYBFou0GF5GVfayR3w1H6ZN6n9EXK2ky4vOibQsHbbeatAWirj9STX3HIwlPc0nbqLp
	cv3xvKmwmUYKkftnI+rp2OuU4d3/kefSU0L5asrixeJLD9V/W0VOGOWMJkRqqo2Q5KfvKKevYjg
	2Q2KcSKBSqZlW6o98TkEHqsyjTwFSsZ0t3iTSxOaNKilVIRAMZC4iv+XF1WUW4FpmNgez4kCD2C
	diHsi3uo8pVapDj+a9t+z+BlfyhyyKa5I/1Nfdb7tsS6ye5qI8fWvt9SaeupHGuDMX/XB37j3mL
	muXONX8AGgfNQL7ul7RaKjLzeOOwTNoMLe+Rq8mrz5QJTLaR6pleqHywVLuqyOq7m9DU8a7MtOX
	ApstPjUdewk4c1ZKBn2O1eQ==
X-Received: by 2002:a05:620a:2a0f:b0:93c:6a0d:762 with SMTP id af79cd13be357-93c6a0d212amr860376585a.0.1790592554624;
        Mon, 28 Sep 2026 03:49:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2a0f:b0:93c:6a0d:762 with SMTP id af79cd13be357-93c6a0d212amr860373085a.0.1790592554070;
        Mon, 28 Sep 2026 03:49:14 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5cb94b1sm3985771a12.8.2026.09.28.03.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 03:49:13 -0700 (PDT)
Message-ID: <11500e01-a854-4d43-8964-a2456e319be7@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 12:49:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Assorted fixes for icc-rpm
To: Mark Brown <broonie@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aishwarya.TCV@arm.com
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <a4439f1d-6c2c-43ee-966c-239eaee148df@sirena.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a4439f1d-6c2c-43ee-966c-239eaee148df@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Sq4Fe/O0 c=1 sm=1 tr=0 ts=6aba462b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=6iXw61xbxFNOpa5etCIA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: z8dfaEkSLzpAbKosNbnmiuwVzpJPuxts
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MyBTYWx0ZWRfX+r+xif8YWVkD
 PFIOi7B96CSXbsyckWtqFeq39pYijvEAWKpEgFvMQaYiWsV+r6N6FQyTrk4TsnZUNG6iIWAc7A4
 ge+OHxIFJ8yw9HoKQmbiY8C0rtc07RJvulbeSMIeYvrvqFFo3k6yK3VxEDxpch9iN7Ntwy/TBmd
 /0pGKZfi34sjkQ6Esn9YrJGgvgPa/PjjROsi/V5Sg6gVvmkBcm4xnb2M8FscwAw+dersudghZxh
 IbZp/D8f3/7R0jSEjaFJX+aluml6oPqT/Xuf9FzVkSL8q2AkAKFoTtAS0CjYqHEV/C/PjZ2KUXk
 8He3bahLFvUjNEJGFsjKplmIG9uveflquIs4wNly13spKkw5q4aS+ThxqAOoln6qVto0Kpl2qGM
 lRWyfW8w8ScXEjjvL2bXclC7WNC9y34Gwzh4IuHwUJNymxG01Id7ROa8C09Q4galMTZMWJ7dFiR
 9GuIBzelvsgESZLa7oQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MyBTYWx0ZWRfXyRFStMCW54Cx
 RmgpSzNUUKn0D57C24718qDJhZsKrghxo1j1Hqe0FggjpIvvG1zpkL70RUcg/TeztRBUNfeG6ty
 3jubufBC5jvqJUHmdWVKm64ASSN9Xrw=
X-Proofpoint-ORIG-GUID: z8dfaEkSLzpAbKosNbnmiuwVzpJPuxts
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280043

On 9/25/26 1:19 AM, Mark Brown wrote:
> On Wed, Sep 09, 2026 at 06:41:53PM +0200, Konrad Dybcio wrote:
>> This series brings multi-port QoS programming and squashes some
>> minor existing issues. No dependencies.
> 
> Something about this series seems to break network boot on db845c, the
> system comes up but the USB and network never appears and eventually the
> board reboots (I guess a watchdog?):
> 
> <6>[    3.127987] Trying to probe devices needed for running init ...
> <4>[    3.131178] qcom-pcie 1c00000.pcie: supply vdda not found, using dummy regulator
> <4>[    3.133600] qcom-pcie 1c08000.pcie: supply vdda not found, using dummy regulator
> <4>[    3.133765] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using dummy regulator
> <4>[    3.145996] qcom-pcie 1c00000.pcie: supply vdda not found, using dummy regulator
> <4>[    3.147172] qcom-pcie 1c08000.pcie: supply vdda not found, using dummy regulator
> <4>[    3.147292] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using dummy regulator
> Format: Log Type - Time(microsec) - Message - Optional Info
> Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic

Strange, next-20260923 boots for me :/

Konrad
