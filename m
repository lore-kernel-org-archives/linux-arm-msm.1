Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC00435AB5
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784221282; cv=none; b=KrTfc/Gn6VQU/mFkrWVyTLfL1EkksamAMhAZe94IguVmFNcG0m7yfMq9v1nM7jlyL1tWfihgRb7a7ktGLsSejbn3GPW8+5oawp/BeHg7H0kyhwNpIR3mM0R+X66TAUW7mhaHxneSDAXtilnrJbW/KnePlcjxKqS9fbo0KYSNp3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784221282; c=relaxed/simple;
	bh=eNPh8f71BTwKPl2FW4HGuI+1FH+v9OdACmLxafup35U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ten2sQ2DOkEEr9UGvxy2fWZzWTmI+FfL9drr00V+QWYUqmL4z834rFFyucevZ2qWHKePPwfZeXdDLc6Ijy4Uz8Zhf89CvJImu/JJQLJFQFLP37bISvOGHLzmPZ7RxU7kTV5KGG4KZGCkEBJf42ulTlDig8QpB8kDFY+vYLEQMM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fKh6zoiM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ijFpB780; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fKh6zoiM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ijFpB780"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSeLY3002100
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mk/w3Wle/HBMkd43JQnX3aBJd7OcjFIPJCl0hhFS0l0=; b=fKh6zoiMAp4uDudZ
	nT+Slf2LnshvFDZrQP/xJpFsoBzijJr1baRoZ5TZF87nYAVG3m4+aCbm1Uze/zxG
	z1TtXC3iwu1HkdBvRXhqiQhyws1ZIYC+gjZ7MxwdVPO0ZXc6RBQqtO0H53cAfsxr
	CsOIBF5SocOtWwU7VE3GZafYNYfoZPqtVyGp/lIbzHtq7VMPV8DO3mwF9CNzdkQJ
	f4I/EBeFizdyYlniNUqT0BHInU23WyMIFBqiq9pbQFECx9fYfTw00V3MO+z04ifl
	y9gHHj5V5DVcqhqfbfzGvlnVqYFNY0vx35+3ob8d4EEeywoIVmafgYGidSk84gKu
	WhTHPQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1m9gh20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:01:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e9c0c4492so130009585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784221275; x=1784826075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mk/w3Wle/HBMkd43JQnX3aBJd7OcjFIPJCl0hhFS0l0=;
        b=ijFpB780rGJuy54XAhAXBge7/petL03/gV1S/Z8JskxYB07vD/ELl9cGln1+dsWVo0
         ODCallQFY4j86Q+zdYFB0J1IxZWR6m0aZBQuu2Mmsfb9VhapNSNHY7+4OcIfywDpgQwB
         rstvtfew5BeRwYxw7NSNF9wZVN9ewoOUxpt2n3hatOaCh+CaOlYh3QKAMoLJsGSgZmeh
         bxtn2lhW53OzvAYimbE/NubrCaRcbAX35+2tFe79eSwrMdrFMgWgCglJazJMqG5f2Z6i
         WFz+8yzTR5Rz9JlHcddxOkjK5ZXWHxn8Vvts82gFIcOU0Z7MrDuAX3OgJjB/kkaYp2ip
         RVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784221275; x=1784826075;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mk/w3Wle/HBMkd43JQnX3aBJd7OcjFIPJCl0hhFS0l0=;
        b=KHfJm1Y2ngL29blKCCwfKK6FCPJsyhsYUZAQTuMiYziEfChRfnF1CvdRGTUonYXoT0
         EqM8Dh5NIKUZUjVJuDNM9LhUy+64jvxbq8BX0e1hvO05a/FlyMRQre+IPKnO8BONDq2n
         9xAf+jPhXgtqbAmElxSdtUzFUmMgsN4AOO3Jm7NYxXn5krG0J+7K/3jYkbgDH0l2zhT/
         UExXiJp+Mtfo3HzeCMj2tgKa5gRwl4+kj1malvRZmVVLDecVrd7/WInc7ZLK3slPK+6E
         X6IBIOUKF+Sh5TuvfmDDx0NnrIvZWHQv/EOir4omQ06bOLTT38aoHwsc49S1Xne3XHkn
         3F1A==
X-Forwarded-Encrypted: i=1; AHgh+RowWgDvrt0FzMtzPfDaZt4oHqboENqeoNbEA2lo6xprzcozGsY7KOGo2HgNp698GuyTyKEt9BO4UyAOn7/O@vger.kernel.org
X-Gm-Message-State: AOJu0YxJhDKQN6T62D+g04xTtgr36VIhifBoZMU50FnyjujDdAsySINc
	ZCKzAlZSjpsN3m1+YBSefUxI/rT3tvnYBg5IxCJs83OGC4RmH7+Sd4gHzMYmLs/u6s8SYxaOVzQ
	vVJX3MMUg//hl0OR+jwq4jRFTJCqirCE78he92eljParOMGREEf0mCSUpFs2wktGQ1yVv
X-Gm-Gg: AfdE7cl/FEEaZLF7YeBjro9fTJ6k8Dp4aLpwT2+9GwDoelNGn7wXOxIC+JCB6rHSpPw
	k1vo3tJps6V/KHH9LKq2ao6W6Jo/C/mmnVR38TvTByuOsNzlcXYLtjnc8jLf9z0IW99WuZG5wDt
	svk+9XYoRSjrK6Nn/FXROSg+5IrMVbcs3+/DiD6ySShLK3Kqz5cH2AOVbEHi/UCXNtEqcc3xoNG
	GXRzpGmR5kmCBaIx3BIPErqF/m0wE3DfGwe7Zc4HdI0p5oeKMxbyPWEUQuVwtsLLjLsF+Yf02RI
	fqeE1IWeICjFFB0BJ1Ro6EugIUBBfHrAztB/7oU2cYMcrMqaMnlbzovYvqV5SL83EwG5oISewi7
	8PENGuvwuiZdppU8U5LPnIRMm
X-Received: by 2002:a05:620a:371c:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ef29b64f2mr1980670685a.0.1784221274838;
        Thu, 16 Jul 2026 10:01:14 -0700 (PDT)
X-Received: by 2002:a05:620a:371c:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ef29b64f2mr1980666085a.0.1784221274282;
        Thu, 16 Jul 2026 10:01:14 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd2937527sm5023777a12.20.2026.07.16.10.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:01:12 -0700 (PDT)
Message-ID: <1e418953-edaa-49f7-b76f-99c91b047207@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:01:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] arm64: dts: qcom: Add device tree for Nord
 Embedded variant
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
 <20260716142605.2398433-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716142605.2398433-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IMIyzAvG c=1 sm=1 tr=0 ts=6a590e60 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=v7-P37dzpIxSXi86kssA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE3MyBTYWx0ZWRfX+0Aybv/H6CkN
 igqTnQzYdpj/fX9stOWevUr5pb/N6dbvgz29CMbmgP147JOTEkp8TORKT942cpMpyMcvnfjNCiw
 yx75onDF7aKpBs/pey1GLiyn72CQ9rSfuYVR6a7NCKN3ckAHO4giTTK5A/3z7Nnqm9xJaDgPs2B
 cs7mrU1nmWOUJXtMj03EN/5hdqfSiXDy5BDeklb4kMqnzagWisKRQ3WCVmaLlW7ew+tqxyodPyZ
 0sha4g++bBcqxKMHg47Wiy9vn88uVsfrneaMxcdnILBlYwJUZsH8b6yoWkO3qtS7O+3FKSQ+Jcb
 Dpa0eC6cNEdOUXzkrCMmllkn4jM+oc1itwoW8bGplsMUttkN0aJ8UadbNZUgFVWBUevSeCLBKop
 QELAfF9+OEhrhxuaexH1aPpwppmD+s03X+ec64TjDMijjA/DQEgDyyqXdEeeNJC84vt1QKP6fBt
 wRShhayw9qHbqCOms1w==
X-Proofpoint-GUID: xaS6DiiBbXnbb3hA7uXQ_VmFKU5LTsve
X-Proofpoint-ORIG-GUID: xaS6DiiBbXnbb3hA7uXQ_VmFKU5LTsve
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE3MyBTYWx0ZWRfX23SGSw/be1mV
 U/0kgXBGTa2PDc46PR1D9c+Pl9qJoK/m1BO8umIu0S+SatnL74BQxK33Q249Ce3DI4U/r62uhVj
 siiBb/E50NspnxDQvGO/fbdpZWwVy08=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160173

On 7/16/26 4:25 PM, Shawn Guo wrote:
> Unlike the GearVM variant, Nord Embedded variant has platform resources
> (clocks, regulators, powerdomains, pins, etc.) directly controlled by
> the operating system. Add a separate dtsi file extending the existing
> top-level nord.dtsi with nodes representing these peripherals as well as
> describing how they are wired up with the already defined components.
> 
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

