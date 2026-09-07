Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91C723A564
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 08:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770985; cv=none; b=S1K70/0YltLlpKWGBMeIJO9MAwT/iOsUUxCBualptPXiRktRpQExRatCCX55kQAReZ3puX2SVZxj/34KrSYElPGdd6+xkiEDEs+A5HjfGcAIhz1C2YC+dukTHVeJqlUIqZ2VUcWYyIs/ngrBUQQeVzONnd706yvm4h39srZhI28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770985; c=relaxed/simple;
	bh=h1ZxY7NuC/gJ03hkK3sWX06TOA+MMyhk04o6T3KIqbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JPequhQWrN5dlElaBYHOOGlv61tD5q4OL+kZ5ff1pNQstu7VmKPY9Rava1xt0PLY8oZlw9A2GL8d77p8ceZYYaTypzaf17zpM9AafIlt/2dhjwBYjEBQe6AJ2FoKSbX7UTQCJl5J6f1JToEfk4CskbckNfXIYOM3IwJLYV2uaBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evfmqC17; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3iKa2zz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evfmqC17";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3iKa2zz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777CZU2838509
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 08:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kgvH++j/Y6LqT6iaClP8nDLZ/ECwoa0TBh0Bvtxg4MM=; b=evfmqC17XpzGLbM4
	sPDPfDx4diDv6dIuS6l0nmCEwBIVbht9FIoPq85b8TROytwgw4oGSxhi4epVXSZH
	h5oCWUxLy28y9A+FzQ4iuetLA0LC9b79evd6yrsYDaaMnyG6OudrnBkd4KIXjl5c
	FRqSrM5bctRP+G6WZEvGAqDOJi0xtH9w7q8HVJ3iMxuHlAILXTvefKQGiBYaUz5o
	W9oxa0IsnsTH6dVkWvfEE9T6JxnFMY+WrtYc9BWKsZ1l3GlOoES8raOTWcGDzziq
	KrYHwWTO+GtX/1rEJawyIJDWGGwbH3GvmMxLjuTViSUzFGsr6WUEb67XLj0STCgL
	fXmu0w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbuep271-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 08:49:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91045c83dbaso8361756d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 01:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770982; x=1789375782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgvH++j/Y6LqT6iaClP8nDLZ/ECwoa0TBh0Bvtxg4MM=;
        b=Z3iKa2zzs5w+AiZjGMIuIBBz+9IbEpGq9fNhlCwGZJjUyJPHRlFHYnhNFLzWbvnFWe
         Hq0W51TVTM/G0gKapJV++fzoJNvFUQnAbBSfIHtgjlOat+EhGy4EtmqiFP268BST8WKy
         X0KiULalGqv2dNkXJ4z9e5t6D/qGlhD/uvxwK8umCidF9Pcqn0R97LxmVpFbzZUSVyqU
         /IC68JUorhOC4vo0EKVgW8TH6q+zPcoVN7HmOrkPhqvy8zxdqy6hNBtpqJdOXuj9wMI/
         pIOuFqQbryqBR9c73qIfmggbPsKkrzxOnC066CjVzxZ5nSDGDvHxflihGXSkTuXjNgpW
         cBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770982; x=1789375782;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgvH++j/Y6LqT6iaClP8nDLZ/ECwoa0TBh0Bvtxg4MM=;
        b=C4jL7oZM9cdQM6D/uTxXZHhptUWjvwLRJL062ETqT3YMDNi1IervHzcvAwuCy92/O7
         p+WZ/9tI8J4mwy40HMMckEOh1PtUlXJtwaN/+FrFeYYjTixISlWc6qXVILILYxHLZ8ZK
         RgnF0w59jGiBZ2nXwaXeJpq/Rai3Br6pUG+DDjZRsmBdKPyTsdjP3IAQSSaRdZDTX1PU
         aIpsoUXoulyM11tojksg7JITLx2+3FW+8hZacCkvZmWqE40N7ekHxrD/F7/EpPMcQEFV
         aOM1pn1uUJjjvPDAboqDZQ8Nv9JMnWqhwI8/wpaueB4p8bGgQbvRRxZAz0temsalQU2r
         8WQg==
X-Gm-Message-State: AFuF++nUoKDSeuI97bYO6gi69yzBn64aj3VXUuY3KDxEpsUVytKL8OGM
	RtesinjFZcjj2EMkRqeMgEbqUSXmr1XIRmh2EduJIV+QzcpEubRs0S2UwDAHF8kdVClzh5bN/0E
	S9AHznjAw/N9qgWyr2xPdGTdXdGozOrBQl/ES9WCFJazOEAOTs77u1yPS/KXJyIR0WrE2
X-Gm-Gg: AYBFou206SCv8sDC8JL03i0VCOVvpuCWTEEBSiK8ypu3PcJ1KL50DyAykUSa4fPT8Zx
	n2Q39oZT6gg12/51Bjy6EpqqX770OU1ufaob62TGT1OW+2+sS4a2sMfTJmYEUNMihb7CKkBh778
	5q+vq18eZ4W05kZdHYBTR8OJup0WWn+FXWj4yzHegSAd0C5AQ6BT5fVwafjub3fd57yjVndlTh6
	/S7mBSC/eTzMcnFutW9gYEiWC9gp/ztp9+JzNGHe8/gQEExn4eA0PDe/WmnWpWoftAXUwoBBaU5
	Id62Gp5MDN8UlkNyngSPODjgI/mvVL2mnVVQiRPzSQDYJaeKXo0kFQWPt3bNJmeoLTMJi/cqs9i
	HRDX0qfVbkQVYBX2HRRWYHQ==
X-Received: by 2002:a05:620a:448b:b0:939:8148:1e3d with SMTP id af79cd13be357-939916fe312mr1089816085a.2.1788770982236;
        Mon, 07 Sep 2026 01:49:42 -0700 (PDT)
X-Received: by 2002:a05:620a:448b:b0:939:8148:1e3d with SMTP id af79cd13be357-939916fe312mr1089813785a.2.1788770981637;
        Mon, 07 Sep 2026 01:49:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c261e24a9e0sm372159666b.4.2026.09.07.01.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:49:40 -0700 (PDT)
Message-ID: <9cae2950-43b0-44fd-a24d-a1044eb733e8@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:49:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: ideacentre-mini: Build the Hamoa
 EL2 DTB
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <20260905-x1-ideacentre-mini-prettify-v1-4-9a87882973bb@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-4-9a87882973bb@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NSBTYWx0ZWRfX6RSb6b7Yq15Q
 jWUrzn7QpYRSqeXJvibfrn6JalYW8B0Y1+TMBTpZ879ubTKJwD45iD+Ymc4KeYmWBzKKUl/d8Gx
 LL6xA/qVhRoNob87iFSJG89+wX2C1zaiS/KH2XqMB424U2p/WC63WeyQ3EI4WulUZTaIIt+0hYT
 WYgnZM+E/lGHNO65p7GD7Vr/IDQPJ9lXafTQ9M0aLphziIx8Xl40z5jXHf9Cqc4ZxlpuaqLfZ3e
 NdkAVFcCRgctYvoztPgVmHD+z0H/xxffZ1naBBrSMGSdfBVOGxM8hMeGV59eBN+ss3tG2RLHD56
 xG0fUwcoyUTBKeXc+0JPA1mJAwalqkvSMlEVUX0H0UXBMe5OJL5/MG01XlMmd5mefMNxFsnHjZv
 pNfCZTyFr1rV7395aUWw1OYGkFcGiAiQ4sZcVruXGdm9xtS51B/fxInjYnxfWb1v5sPxxNrnFNU
 RgAOjZuu7lKYvsW7J1Q==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9e7aa7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=VAHzJ8QwipbKsDwnUKQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: JZznSuyVdcSkw7Sw0wg18ZYvSe_1qpeh
X-Proofpoint-ORIG-GUID: JZznSuyVdcSkw7Sw0wg18ZYvSe_1qpeh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NSBTYWx0ZWRfX1tsRVtuXnKvo
 pK6iXrvafF09x70Gsm8w47Y9rNzDHMbPgRzEDMIBwJ7fyDc048mkjMWCltmdWTqbuHiUjqjTeLI
 wWM+itiV6Sq8OUoxt7pebCbczkwWrok=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070095

On 9/5/26 11:28 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Other Hamoa boards combine the board DTB with x1-el2.dtbo. Do the same
> for the IdeaCentre Mini so the EL2 overlay is produced alongside the
> normal image.
> 
> Assisted-by: Grok 4.5 (xAI)
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
